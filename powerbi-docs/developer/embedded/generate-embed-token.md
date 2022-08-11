---
title: Generate an embed token in Power BI embedded analytics
description: Learn about the considerations, limitations, and required permissions for generating an embed token.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 08/11/2022
---

# Generate an embed token

[Generate token](/rest/api/power-bi/embedtoken) is a REST API that lets you generate a token for embedding a Power BI item in a web app or a portal. The token is used to authorize your request against the Power BI service.

The generate token API uses a single identity (a master user or service principal) to generate a token for an individual user, depending on that user's credentials in the app (effective identity).

After successful authentication, access to the relevant data is granted.

>[!NOTE]
>Generate token is only applicable when you're [*embedding for your customers*](embed-sample-for-customers.md) (also known as the *app owns data* scenario).

You can use APIs to generate a token for the following items:

* [Dashboards](/rest/api/power-bi/embedtoken/dashboards_generatetokeningroup)

* [Datasets](/rest/api/power-bi/embedtoken/datasets_generatetokeningroup)

* [Generate an embed token for multiple reports, datasets, and target workspaces](/rest/api/power-bi/embed-token/generate-token)

* [Report creation](/rest/api/power-bi/embedtoken/reports_generatetokenforcreateingroup)

* [Reports](/rest/api/power-bi/embedtoken/reports_generatetokeningroup)

* [Tiles](/rest/api/power-bi/embedtoken/tiles_generatetokeningroup)

## Workspace versions

Power BI has two workspace versions, a *classic* workspace, and a *new* workspace. You can learn more about the differences between these workspaces in [new and classic workspace differences](../../collaborate-share/service-new-workspaces.md#new-and-classic-workspace-differences).

When creating an embed token, different workspaces have different considerations and require different permissions.

|                  |*Classic* workspace |*New* workspace|
|------------------|---------|--------|
|**Considerations**|<li>The dataset and the item must be in the same workspace</li><li>Service principal can't be used</li>  |The dataset and the item can be in two different *new* workspaces |
|**Workspace permissions**|The master user must be an admin of the workspace  |The service principal or master user must be at least a member of both workspaces |

>[!NOTE]
>
>* You can't create an embed token for [My workspace](../../consumer/end-user-workspaces.md#types-of-workspaces).
>* The word *item* refers to a Power BI item such as a dashboard, tile, Q&A or report.

## Securing your data

If you're handling data from multiple customers, consider these two approaches for securing your data: [*Workspace-based isolation*](embed-multi-tenancy.md) and [*Row-level security-based isolation*](./embedded-row-level-security.md). You can find a detailed comparison between them in [service principal profiles and row level security](embed-multi-tenancy.md#row-level-security).

We recommend using workspace-based isolation with profiles, but if you want to use the RLS approach, review the [RLS considerations and limitations](generate-embed-token.md#row-level-security) at the end of this article.

## Token permissions

In the generate token APIs, the *GenerateTokenRequest* section describes the token permissions.

>[!NOTE]
>The token permissions listed in this section are not applicable for the [Generate token for multiple reports](/rest/api/power-bi/embed-token/generate-token) API.

### Access Level

Use the *accessLevel* parameter to determine the user's access level.

* **View** - Grant the user viewing permissions.

* **Edit** - Grant the user viewing and editing permissions (only applies when generating an embed token for a report).

    If you're using the [Generate token for multiple reports, datasets, and target workspaces](/rest/api/power-bi/embed-token/generate-token) API, use the *allowEdit* parameter to grant the user viewing and editing permissions.

* **Create** - Grant the user permissions to create a report (only applies when generating an embed token for creating a report).

    For report creation, you must also supply the *datasetId* parameter.

### Saving a copy of the report

Use the *allowSaveAs* boolean to let users save the report as a new report. This setting is set to *false* by default.

This parameter is only applicable when generating an embed token for a report.

### Row Level Security

With [Row Level Security (RLS)](embedded-row-level-security.md), the identity you use can be different from the identity of the service principal or master user you're using to generating the token. By using different identities, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

If you're using RLS, you can sometimes leave out the user's identity (the *EffectiveIdentity* parameter). When you don't use the *EffectiveIdentity* parameter, the token has access to the entire database. This method can be used to grant access to users such as admins and managers, who have permission to view the entire dataset. However, you can't use this method in every scenario. The table below lists the different RLS types, and shows which authentication method can be used without specifying a user's identity.

The table also shows the considerations and limitation applicable to each RLS type.

|RLS type  |Can I generate an embed token without specifying the effective user ID?  |Considerations and limitations  |
|---------|---------|---------|
|Cloud Row Level Security (Cloud RLS)      |✔ Master user<br/>✖ Service principal          |         |
|RDL (paginated reports)     |✖ Master user<br/>✔ Service principal        |You can't use a master user to generate an embed token for RDL.         |
|Analysis Services (AS) on premises live connection    |✔ Master user<br/>✖ Service principal         |The user generating the embed token also needs one of the following permissions:<li>Gateway admin permissions</li><li>Datasource impersonate permission (*ReadOverrideEffectiveIdentity*)</li>         |
|Analysis Services (AS) Azure live connection    |✔ Master user<br/>✖ Service principal         |The identity of the user generating the embed token can't be overridden. Custom data can be used to implement dynamic RLS or secure filtering.<br/><br/>**Note:** Service principal must provide its object ID as the effective identity (RLS username).         |
|Single Sign On (SSO)     |✔ Master user<br/>✖ Service principal         |An explicit (SSO) identity can be provided using the identity blob property in an effective identity object         |
|SSO and cloud RLS     |✔ Master user<br/>✖ Service principal         |You must provide the following:<li>Explicit (SSO) identity in the identity blob property in an effective identity object</li><li>Effective (RLS) identity (username)</li>         |

>[!NOTE]
>Service principals must always provide the following:
>
>* An identity for any item with an RLS dataset.
>* For an SSO dataset, an effective RLS identity with the contextual (SSO) identity defined.

### DirectQuery for Power BI datasets

To embed Power BI report that has a dataset with a Direct Query connection to another Power BI dataset, do the following:

* In the Power BI portal, set the **XMLA endpoint** to *Read Only* or *Read Write* as described in [enable read-write for a Premium capacity](../../enterprise/service-premium-connect-tools.md#to-enable-read-write-for-a-premium-capacity). You only need to do this once per capacity.
* Generate a [multi-resource embed token](/rest/api/power-bi/embed-token/generate-token)
  * Specify all dataset IDs in the request.
  * Set the [`XmlaPermissions`](/rest/api/power-bi/embed-token/generate-token#xmlapermissions) to *Read Only* for each dataset in the request.
  * For each Single Sign-on (SSO) enabled data source, provide the identity blob for the data source in the [`DatasourceIdentity`](/rest/api/power-bi/embed-token/generate-token#datasourceidentity).

## Renew tokens before they expire

Tokens come with a time limit. This means that after embedding a Power BI item, you have a limited amount of time to interact with it. To give your users a continuous experience, [renew (or refresh) the token before it expires](/javascript/api/overview/powerbi/refresh-token).

## Considerations and limitations

For security reasons, the lifetime of the embed token is set to the remaining lifetime of the Azure AD token used to call the `GenerateToken` API. Therefore, if you use the same Azure AD token to generate several embed tokens, the lifetime of the generated embed tokens will be shorter with each call.

## Next steps

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)
* [Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)
* [Embed Power BI content with service principal](embed-service-principal.md)
