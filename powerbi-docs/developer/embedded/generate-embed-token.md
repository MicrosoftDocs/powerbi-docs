---
title: Generate an embed token in Power BI embedded analytics
description: Learn about the considerations, limitations, and required permissions for generating an embed token.
author: billmath
ms.author: billmath
ms.reviewer: Amos Hersch
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.custom: engagement-fy23
ms.date: 12/15/2025
# Customer intent: As a developer, I want to generate an embed token so that I can embed Power BI content in my application.
---

# Generate an embed token

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/no-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

[Generate token](/rest/api/power-bi/embed-token/generate-token) is a REST API that lets you generate a token for embedding a Power BI report or semantic model in a web app or a portal. It can generate a token for a single item or for multiple reports or semantic models. The token is used to authorize your request against the Power BI service.

The *Generate token* API uses a single identity (a master user or service principal) to generate a token for an individual user, depending on that user's credentials in the app (effective identity).

After successful authentication, access to the relevant data is granted.

> [!NOTE]
> [Generate token](/rest/api/power-bi/embed-token/generate-token) is the newer, version 2 API that works for both reports and semantic models, and single or multiple items. For dashboards and tiles, use the V1 [Dashboards GenerateTokenInGroup](/rest/api/power-bi/embedtoken/datasets_generatetokeningroup) and [Tiles GenerateTokenInGroup](/rest/api/power-bi/embed-token/tiles-generate-token-in-group).

## Securing your data

If you're handling data from multiple customers, there are two main approaches to securing your data: [*Workspace-based isolation*](embed-multi-tenancy.md) and [*Row-level security-based isolation*](./embedded-row-level-security.md). You can find a detailed comparison between them in [service principal profiles and row level security](embed-multi-tenancy.md#row-level-security).

We recommend using workspace-based isolation with profiles, but if you want to use the RLS approach, review the [RLS section](generate-embed-token.md#row-level-security) at the end of this article.

## Token permissions and security

In the *Generate token* APIs, the *GenerateTokenRequest* section describes the token permissions.

### Access Level

* To grant the user viewing or editing permissions, use the *allowEdit* parameter.
  
* To allow the user to create new reports (either *SaveAs* or *CreateNew*) in that workspace, add the workspace ID to the embed token.

### Row Level Security

With [Row Level Security (RLS)](embedded-row-level-security.md), the identity you use can be different from the identity of the service principal or master user you're using to generating the token. By using different identities, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

If you're using RLS, you can sometimes leave out the user's identity (the *EffectiveIdentity* parameter). When you don't use the *EffectiveIdentity* parameter, the token has access to the entire database. This method can be used to grant access to users such as admins and managers, who have permission to view the entire semantic model. However, you can't use this method in every scenario. The following table lists the different RLS types, and shows which authentication method can be used without specifying a user's identity.

The table also shows the considerations and limitation applicable to each RLS type.

|RLS type  |Can I generate an embed token without specifying the effective user ID?  |Considerations and limitations  |
|---------|---------|---------|
|Cloud Row Level Security (Cloud RLS)      |✔ Master user<br/>✖ Service principal          |         |
|RDL (paginated reports)     |✖ Master user<br/>✔ Service principal        |You can't use a master user to generate an embed token for RDL.         |
|Analysis Services (AS) on premises live connection    |✔ Master user<br/>✖ Service principal         |The user generating the embed token also needs one of the following permissions:<li>Gateway admin permissions</li><li>Datasource impersonate permission (*ReadOverrideEffectiveIdentity*)</li>         |
|Analysis Services (AS) Azure live connection    |✔ Master user<br/>✖ Service principal         |The identity of the user generating the embed token can't be overridden. Custom data can be used to implement dynamic RLS or secure filtering.<br/><br/>**Note:** Service principal must provide its object ID as the effective identity (RLS username).         |
|Single Sign On (SSO)     |✔ Master user<br/>✖ Service principal         |An explicit (SSO) identity can be provided using the identity blob property in an effective identity object         |
|SSO and cloud RLS     |✔ Master user<br/>✖ Service principal         |You must provide:<li>Explicit (SSO) identity in the identity blob property in an effective identity object</li><li>Effective (RLS) identity (username)</li>         |

>[!NOTE]
>Service principals must always provide:
>
>* An identity for any item with an RLS semantic model
>* An effective RLS identity with the contextual (SSO) identity defined (For an SSO semantic model)

### DirectQuery for Power BI semantic models

To embed a Power BI report that has a semantic model with a Direct Query connection to another Power BI semantic model:

* In the Power BI portal, set the **XMLA endpoint** to *Read Only* or *Read Write* as described in [enable read-write for a Premium capacity](../../enterprise/service-premium-connect-tools.md#to-enable-read-write-for-a-premium-capacity). You only need to do this once per capacity.
* Generate a [multi-resource embed token](/rest/api/power-bi/embed-token/generate-token)

  * Specify all dataset IDs in the request.
  * Set the [`XmlaPermissions`](/rest/api/power-bi/embed-token/generate-token#xmlapermissions) to *Read Only* for each semantic model in the request.
  * For each Single Sign-on (SSO) enabled data source, provide the identity blob for the data source in the [`DatasourceIdentity`](/rest/api/power-bi/embed-token/generate-token#datasourceidentity).

In this scenario, all semantic models must reside on a premium workspace. Trial embed tokens cannot be used to embed a report of this type.

## Renew tokens before they expire

Tokens come with a time limit. Therefore, after embedding a Power BI item, you have a limited amount of time to interact with it. To give your users a continuous experience, [renew (or refresh) the token before it expires](/javascript/api/overview/powerbi/refresh-token).

## Dashboards and tiles

The [Generate token](/rest/api/power-bi/embed-token/generate-token) works for reports and semantic models. To generate an embed token for a dashboard or tile, use the version 1 [Dashboards GenerateTokenInGroup](/rest/api/power-bi/embed-token/dashboards-generate-token-in-group) or [Tiles GenerateTokenInGroup](/rest/api/power-bi/embed-token/tiles-generate-token-in-group) APIs. These APIs generate tokens for only one item at a time. You can't generate a token for multiple items.

For these APIs:

* Use the *accessLevel* parameter to determine the user's access level.

  * **View** - Grant the user viewing permissions.

  * **Edit** - Grant the user viewing and editing permissions (only applies when generating an embed token for a report).

  * **Create** - Grant the user permissions to create a new report (only applies when generating an embed token for creating a report).    For report creation, you must also supply the *datasetId* parameter.

* Use the *allowSaveAs* boolean to let users save the report as a new report. This setting is set to *false* by default, and only applies when generating an embed token for a report.

## Considerations and limitations

* For security reasons, the lifetime of the embed token is set to the remaining lifetime of the Microsoft Entra token used to call the `GenerateToken` API. Therefore, if you use the same Microsoft Entra token to generate several embed tokens, the lifetime of the generated embed tokens get shorter with each call.

* If the semantic model and item to be embedded are in two different workspaces, the *service principal* or *master user* must be at least a member of both workspaces.

* Embedding items using Data Lake Storage (DLS) requires V2 of the [Generate token API](/rest/api/power-bi/embed-token/generate-token).

* You can't create an embed token for [**My workspace**](../../collaborate-share/end-user-workspaces.md#types-of-workspaces).

## Related content

* [Register an app](register-app.md)
* [Power BI Embedded for your customers](embed-sample-for-customers.md)
* [Embed Power BI content with service principal](embed-service-principal.md)
