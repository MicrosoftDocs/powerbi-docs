---
title: Embed a Power BI report with an Azure Analysis Services (AAS) database 
description: Learn which parameters your embed token needs to embed a Power BI application with an Azure Analysis Services (AAS) database with or without RLS
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sabre
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 11/08/2023
---

# Embed a report with an Azure Analysis Services (AAS) database

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/no-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

This article explains how to embed a Power BI report that uses data stored in [Azure Analysis Services (AAS)](/azure/analysis-services/analysis-services-overview), in an [embed for your customers](embedded-analytics-power-bi.md#embed-for-your-customers) scenario. This article is aimed at independent software developers (ISVs), who want to embed a report with AAS data whether or not the database implements [row-level security (RLS)](embedded-row-level-security.md).

## Prerequisites

You'll need a report with a live connection to AAS database, with or without RLS.

## Dynamic security - RLS

If you want your report to implement dynamic RLS, use the `customeData` function. Since you can't override the effective identity, we recommend creating new roles with `customData`. You can also use roles that have the `username` or `userPrincipalName` functions, if you replace them with `customData`.  

Follow these steps to create a new role and add the `customData` function to the role.

1. Create a role in the Analysis Services server.

    :::image type="content" source="./media/embed-azure-analysis-services/azure-analysis-services-database-create-role.png" alt-text="A screenshot of creating a new role in Analysis Services server.":::

2. In the *General* settings, provide a **Role Name** and set the database permissions to **Read** only.

    :::image type="content" source="media/embed-azure-analysis-services/azure-analysis-services-database-create-role-general-settings.png" alt-text="A screenshot of giving a new role a new name and setting it to read only, in the general settings in Analysis Services server.":::

<a name="sp-role"></a>

3. In the *Membership* settings, add the users that are going to call the [Embed Token - Generate Token](/rest/api/power-bi/embed-token/generate-token) API. If you're using a service principal that's not an admin, add that as well.

    :::image type="content" source="media/embed-azure-analysis-services/azure-analysis-services-database-create-role-membership.png" alt-text="A screenshot of adding users to a new role in Analysis Services server.":::

4. In the *Row filters* settings, set your DAX query using the `CUSTOMDATA()` function.

    :::image type="content" source="media/embed-azure-analysis-services/azure-analysis-services-database-create-role-row-filters.png" alt-text="A screenshot showing how to add the function customData to the DAX query in a new role in Analysis Services server.":::

## Service principal

If you're using a service principal to embed the report, make sure the service principal is a server admin or role member of AAS. To grant AAS admin permissions to the service principal, see [Add a service principal to the server administrator role](/azure/analysis-services/analysis-services-addservprinc-admins). To add the service principal as a role member, go to the [*Membership* settings](#sp-role).

Use the [**service principal object ID**](embedded-troubleshoot.md#whats-the-difference-between-an-application-object-id-and-a-principal-object-id) as the username (effective identity).

## Analysis Service migration

You can [migrate from AAS to Power BI Premium](../../guidance/migrate-azure-analysis-services-to-powerbi-premium-migration-scenarios.md) even if you have an embedded AAS report. Your embedded report won't break during the migration, as long as the principal that's calling the [Embed Token - Generate Token](/rest/api/power-bi/embed-token/generate-token) API, is a member or admin of the workspace.

>[!NOTE]
> If the service principal is not an admin, and you don't want to make it an admin of the workspace when you migrate, migrate that model into a separate workspace where you can give it admin permissions.

## Generate an embed token

Use the [Generate Token](/rest/api/power-bi/embed-token/generate-token) API to generate an embed token that overrides the [effective identity](/rest/api/power-bi/embed-token/tiles-generate-token-in-group#effectiveidentity).

The information needed to generate an embed token depends on how you're connected to Power BI (*service principal* or *master user*), and also if the database has RLS.

## [Master user embed token](#tab/master-user-token)

To generate an embed token, provide the following information:

* **Username** (Optional if no RLS. Required for RLS) - The username must be the same as API caller (in this case, the Master user's [UPN](./pbi-glossary.md#user-principal-name-upn)). If the database doesn't use RLS, and no username is provided, the master user's credentials are used.
* **Role** (required for RLS) - The report will only display data if the effective identity is a member of the role.

Example:  

Define the user identity and roles for one of the following three scenarios:

* If RLS isn't implemented:

There is no need to define any effective identity.

* If using static RLS:

  ```csharp
      var rlsidentity = new EffectiveIdentity(  //If static RLS
         username: "username@contoso.com", 
         roles: new List<string>{ "MyRole" },
         datasets: new List<string>{ datasetId.ToString()}
      )
  ```

* If using dynamic RLS:

  ```csharp
      var rlsidentity = new EffectiveIdentity(  // If dynamic RLS
         username: "username@contoso.com",
         roles: new List<string>{ "MyRoleWithCustomData" },
         customData: "SalesPersonA"
         datasets: new List<string>{ datasetId.ToString()}
      )
  ```

    >[!NOTE]
    >`customData` in the embed token cannot be larger than 1,024 characters.

Use the effective identity to generate an embed token:

```csharp
public EmbedToken GetEmbedToken(Guid reportId, IList<Guid> datasetIds, [Optional] Guid targetWorkspaceId)
{
    PowerBIClient pbiClient = this.GetPowerBIClient();
    // Create a request for getting an embed token for the rls identity defined above
       var tokenRequest = new GenerateTokenRequestV2(
        reports: new List<GenerateTokenRequestV2Report>() { new GenerateTokenRequestV2Report(reportId) },
        datasets: datasetIds.Select(datasetId => new GenerateTokenRequestV2Dataset(datasetId.ToString())).ToList(),
        targetWorkspaces: targetWorkspaceId != Guid.Empty ? new List<GenerateTokenRequestV2TargetWorkspace>() { new GenerateTokenRequestV2TargetWorkspace(targetWorkspaceId) } : null,
        identities: new List<EffectiveIdentity> { rlsIdentity } // Only in cases of RLS
    );
    // Generate an embed token
    var embedToken = pbiClient.EmbedToken.GenerateToken(tokenRequest);
    return embedToken;
}
```

## [Service principal or service principal profile embed token](#tab/service-principal-token)

To generate an embed token, provide the following information:

* **Username** (required) -The username must be same as API caller, in this case, the Service principal ObjectId or Service principal profile ObjectId which you can get using the API – [Get Profile](/rest/api/power-bi/profiles/get-profile) / [Get Profiles](/rest/api/power-bi/profiles/get-profiles).
* **Role** (required for RLS) - The report will only display data if the effective identity is a member of the role.  
Example:  
Define the user identity and roles for one of the following scenarios:

* If RLS isn't implemented:

  ```csharp
      var rlsidentity = new EffectiveIdentity(   // If no RLS
         username: "ServicePrincipalObjectId",   // Or, "ServicePrincipalProfileObjectID"
         datasets: new List<string>{ datasetId.ToString()}
      );
  ```

* If dynamic RLS is implemented:

  ```csharp
      var rlsidentity = new EffectiveIdentity(  // If dynamic RLS
         username: "ServicePrincipalObjectId",
         roles: new List<string>{ "MyRoleWithCustomData" },
         customData: "SalesPersonA"
        datasets: new List<string>{ datasetId.ToString()}
      );
  ```

    >[!NOTE]
    >`customData` in the embed token cannot be larger than 1,024 characters.

Use the effective identity to generate an embed token:

```csharp
public EmbedToken GetEmbedToken(Guid reportId, IList<Guid> datasetIds, [Optional] Guid targetWorkspaceId)
{
    PowerBIClient pbiClient = this.GetPowerBIClient();
    
    // Create a request for getting an embed token for the rls identity defined above
    var tokenRequest = new GenerateTokenRequestV2(
        reports: new List<GenerateTokenRequestV2Report>() { new GenerateTokenRequestV2Report(reportId) },
        datasets: datasetIds.Select(datasetId => new GenerateTokenRequestV2Dataset(datasetId.ToString())).ToList(),
        targetWorkspaces: targetWorkspaceId != Guid.Empty ? new List<GenerateTokenRequestV2TargetWorkspace>() { new GenerateTokenRequestV2TargetWorkspace(targetWorkspaceId) } : null,
        identities: new List<EffectiveIdentity> { rlsIdentity }  // If using master user, only in cases of RLS. 
    );
    // Generate an embed token
    var embedToken = pbiClient.EmbedToken.GenerateToken(tokenRequest);
    return embedToken;
}
```

---

Use the embed token to embed the report into your app or website. Your report will filter data according to the applied RLS in the report.

## Related content

* [Row-level security with Power BI Embedded](embedded-row-level-security.md)
* [Embed a report with cloud-based RLS](cloud-rls.md)
* [paginated-reports-row-level-security](paginated-reports-row-level-security.md)
