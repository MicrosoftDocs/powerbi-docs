---
title: Embed a report that uses object-level security
description: Embed a report that has object-level security (OLS).
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 09/12/2022
---

# Object-level security

[!INCLUDE[Customers yes Org no](../../includes/applies-embedded-app-yes-user-no.md)]

This article explains how to embed Power BI content that uses OLS in a Power BI *App owns data* (embed for your customers) scenario.

In this scenario, the ISV has a table with sensitive data and metadata that they want to hide from the report customers.

For more information on OLS go to [Object-level security (OLS)](/fabric/security/service-admin-object-level-security).

## Prerequisites

This article assumes that you have a report that uses OLS and that you want to embed it into an app. To create a report that uses OLS, see [Object-level security (OLS)](/fabric/security/service-admin-object-level-security).

The report can be built using any of the following models:

* [Cloud OLS](/fabric/security/service-admin-object-level-security)
* [Live connected report to Azure Analysis Services with OLS roles](./embed-azure-analysis-services.md)
* [Live connected report to SQL Server Analysis Services with OLS roles](sql-server-analysis-services-embed.md)

## Embed a report that uses object-level security

The process of [generating embed tokens](generate-embed-token.md#row-level-security) for items that use OLS is the same as for static RLS. You need the role and user name.

If the report you want to embed is using one of the following scenarios, you might need to take some extra steps:

* [Cloud OLS token generation](./cloud-rls.md#generate-an-embed-token)
* [SQL Server Analysis Services (SSAS) token generation](sql-server-analysis-services-embed.md#generate-an-embed-token)
* [Microsoft Entra ID token generation](./embed-azure-analysis-services.md#generate-an-embed-token)

The following example shows how to generate a token to hide a table with sensitive information using OLS:

```csharp
public EmbedToken GetEmbedToken(Guid reportId, IList<Guid> datasetIds, [Optional] Guid targetWorkspaceId)
    {
        PowerBIClient pbiClient = this.GetPowerBIClient();

       // Defines the user identity and roles.
        var olsIdentity = new EffectiveIdentity(
            username: "All",
            roles: new List<string>{ "SensitiveTableOLS" }, // Role created to hide a table that has sensitive information
            datasets: new List<string>{ datasetId.ToString()}
        );
       
        // Create a request for getting an embed token for the OLS identity defined above
        var tokenRequest = new GenerateTokenRequestV2(
            reports: new List<GenerateTokenRequestV2Report>() { new GenerateTokenRequestV2Report(reportId) },
            datasets: datasetIds.Select(datasetId => new GenerateTokenRequestV2Dataset(datasetId.ToString())).ToList(),
            targetWorkspaces: targetWorkspaceId != Guid.Empty ? new List<GenerateTokenRequestV2TargetWorkspace>() { new GenerateTokenRequestV2TargetWorkspace(targetWorkspaceId) } : null,
            identities: new List<EffectiveIdentity> { olsIdentity }
        );

        // Generate an embed token
        var embedToken = pbiClient.EmbedToken.GenerateToken(tokenRequest);

        return embedToken;
    }
```

## Considerations and limitations

[See restrictions for OLS models](/analysis-services/tabular-models/object-level-security#restrictions)

## Related content

[Object-level security in Azure Analysis Services](/analysis-services/tabular-models/object-level-security)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
