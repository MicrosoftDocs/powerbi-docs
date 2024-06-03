---
title: Using standard cloud based row-level security with embedded content in Power BI embedded analytics
description: Learn how to implement row level security within your Power BI cloud application.
author: mberdugo
ms.author: monaberdugo
services: power-bi-embedded
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 6/03/2024
#Customer intent: As an ISV, I want embed reports for my customers using RLS to protect sensitive data and adhere to compliance rules for data security.
---

# Embed a report with RLS

[!INCLUDE[Customers yes Org no](../../includes/applies-embedded-app-yes-user-no.md)]

This article explains how to embed Power BI content that uses RLS into a standard Power BI app owns data application.

## Prerequisites

For a detailed explanation on how to set up RLS, refer to [Row-level security (RLS) with Power BI](/power-bi/enterprise/service-admin-rls).

When you [define your RLS roles](/power-bi/enterprise/service-admin-rls#define-roles-and-rules-in-power-bi-desktop), keep in mind that the DAX expression you use determines if the RLS model is static or dynamic.

## When to use static and dynamic security

[Static security](#static-security) uses a fixed value in the DAX filter to define each role. It's simple to implement but difficult to maintain when there are many users or organizations involved.

Static security works best for an ISV that serves one or a few big customers where each department needs to access different data.

[Dynamic security](#dynamic-security) uses a DAX function (`username()` or `userprincipalname()`) to define the roles. Dynamic security provides more flexibility and allows you to manage your data using fewer roles and less maintenance.

### Static security

With static roles, you pass the role to Power BI when you generate an embed token, and the user sees data according to that role.
To create static security roles, enter a fixed value in the DAX filter.

For example, you can define the role of *Eastern US* as `[Region] = "East"`

:::image type="content" source="media/cloud-rls/create-static-role.png" alt-text="Screenshot showing how to define a static R L S role.":::

Let's say john@contoso.com is a user of your app. You want to give John access to data from the *Eastern US* role. To embed a report for john@contoso.com, generate an embed token using the *Eastern US* role. The resulting data is filtered for `[Region] = "East"`.

> [!NOTE]
> When you generate the embed token, you need to supply a username, but the username can be any string. Static roles have a fixed value that isn't dependent on a username, so once the ISV determines the user's role and passes it to the embed token, the data is filtered according to that role regardless of what username was passed.

### Dynamic security

Dynamic security uses the DAX function (`username()` or `userprincipalname()`) to define the role.

In the *user owns data* scenario, the RLS model automatically filters data based on the roles of the specific user.
With *app owns data*, Power BI doesn't know the usernames of the ISV's customers, so you can use the `username()` function to dynamically filter the data.

Create a role in Power BI Desktop using the username() function. For example, you can create a role called *CountryDynamic* and define it as `[CountryRegionCode] = username()`

:::image type="content" source="media/cloud-rls/create-dynamic-role.png" alt-text="Screenshot showing how to create a dynamic R L S role.":::

Let's say you want to give your user, jane@contoso.com, access to data for *France*. When you generate an embed token for jane@contoso.com, you pass the string *France* as the *username* in the *CountryDynamic* role. Your data is filtered according to [CountryRegionCode] = *France*.

```json
{
    "accessLevel": "View",
    "identities": [
        {
            "username": "France",
            "roles": [ "CountryDynamic"],
            "datasets": [ "fe0a1aeb-f6a4-4b27-a2d3-b5df3bb28bdc" ]
        }
    ]
}
```

When using dynamic security in this scenario, you only need one role for all regions. The region name is used as the effective identity.

## Generate an embed token

When you're ready to embed the report into your app, you need to [generate an embed token](generate-embed-token.md#row-level-security).
To generate a token using the Embed Token API, pass the following information to the API.

* **username** (required) – If the roles are dynamic, the *username* string is used as the filter. For static roles, the *username* doesn't affect the RLS and can be any string at all. Only a single username can be listed.
* **roles** (required) – The role(s) used when applying Row Level Security rules. If passing more than one role, they should be passed as a string array.
* **dataset** (required) – The dataset that is applicable for the item you're embedding.

You can now embed the report into your app. The report filters data according to the RLS applied.

```csharp
public EmbedToken GetEmbedToken(Guid reportId, IList<Guid> datasetIds, [Optional] Guid targetWorkspaceId)
    {
        PowerBIClient pbiClient = this.GetPowerBIClient();

       // Defines the user identity and roles.
        var rlsIdentity = new EffectiveIdentity(
            username: "France",
            roles: new List<string>{ "CountryDynamic" },
            datasets: new List<string>{ datasetId.ToString()}
        );
       
        // Create a request for getting an embed token for the rls identity defined above
        var tokenRequest = new GenerateTokenRequestV2(
            reports: new List<GenerateTokenRequestV2Report>() { new GenerateTokenRequestV2Report(reportId) },
            datasets: datasetIds.Select(datasetId => new GenerateTokenRequestV2Dataset(datasetId.ToString())).ToList(),
            targetWorkspaces: targetWorkspaceId != Guid.Empty ? new List<GenerateTokenRequestV2TargetWorkspace>() { new GenerateTokenRequestV2TargetWorkspace(targetWorkspaceId) } : null,
            identities: new List<EffectiveIdentity> { rlsIdentity }
        );

        // Generate an embed token
        var embedToken = pbiClient.EmbedToken.GenerateToken(tokenRequest);

        return embedToken;
    }
```

## Considerations and limitations

* Depending on your setup, you may have to take several steps before you can generate an embed token. For information about the different scenarios, see [Embed a report that uses security features](./embedded-row-level-security.md#embed-a-report-that-uses-security-features).
* The user that generates the embed token has to be a *member* or *admin* in both workspaces (the dataset workspace and the report workspace).
* When [generating the embed token](generate-embed-token.md), you need to provide a username and a role. If you don't, one of the following events will occur, depending on if the token is being generated by service principal or master user:
  * For a **service principal**, token generation fails.
  * For a **master user**, token generation succeeds but the data isn't filtered (all the data is returned).

## Related content

* [RLS guidance](../../guidance/rls-guidance.md)
* [Generate an embed token](generate-embed-token.md)

More Questions? Try the [Power BI Community.](https://community.powerbi.com/)
