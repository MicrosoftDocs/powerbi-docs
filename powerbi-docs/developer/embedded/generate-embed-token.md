---
title: Considerations for generating an embed token in Power BI embedded analytics
description: Learn about the considerations, limitations, and required permissions for generating an embed token.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 10/15/2020
---

# Considerations when generating an embed token

[Generate token](/rest/api/power-bi/embedtoken) is a REST API that lets you generate a token for embedding a Power BI item in a web app or a portal. The token is used to authorize your request against the Power BI service.

The generate token API uses a single identity (a master user or service principal) to generate a token for an individual user, depending on that user's credentials in the app (effective identity).

After successful authentication, access to the relevant data is granted.

>[!NOTE]
>Generate token is only applicable when you're [*embedding for your customers*](embed-sample-for-customers.md) (also known as the *app owns data* scenario).

You can use the following APIs to generate a token:

* [Dashboards](/rest/api/power-bi/embedtoken/dashboards_generatetokeningroup)

* [Datasets](/rest/api/power-bi/embedtoken/datasets_generatetokeningroup)

* [Generate token for multiple reports](/rest/api/power-bi/embed-token/generate-token)

* [Report creation](/rest/api/power-bi/embedtoken/reports_generatetokenforcreateingroup)

* [Reports](/rest/api/power-bi/embedtoken/reports_generatetokeningroup)

* [Tiles](/rest/api/power-bi/embedtoken/tiles_generatetokeningroup)

## Workspace versions

Power BI has two workspace versions, a *classic* workspace, and a *new* workspace. You can learn more about the differences between these workspaces in [new and classic workspace differences](../../collaborate-share/service-new-workspaces.md#new-and-classic-workspace-differences).

When creating an embed token, different workspaces have different considerations and require different permissions.

|                  |*Classic* workspace |*New* workspace|
|------------------|---------|--------|
|**Considerations**|<li>The dataset and the item must be in the same workspace</li><li>Service principal cannot be used</li>  |The dataset and the item can be in two different *new* workspaces |
|**Workspace permissions**|The master user must be an admin of the workspace  |The service principal or master user must be at least a member of both workspaces |

>[!NOTE]
>* You cannot create an embed token for [My workspace](../../consumer/end-user-workspaces.md#types-of-workspaces).
>* The word *item* refers to a Power BI item such as a dashboard, tile, Q&A or report.

## Securing your data

When creating your solution, consider these two approaches for securing your data: *Workspace-based isolation* and *Row-level security-based isolation*. You can find a detailed comparison between them in [Multi-tenancy solutions with Power BI embedded analytics](embed-multi-tenancy.md).

If you're going to use the RLS approach, review the [RLS considerations and limitations](generate-embed-token.md#row-level-security) at the end of this article.

## Token permissions

In the generate token APIs, the *GenerateTokenRequest* section describes the token permissions.

>[!NOTE]
>The token permissions listed in this section are not applicable for the [Generate token for multiple reports](/rest/api/power-bi/embed-token/generate-token) API.

### Access Level

Use the *accessLevel* parameter to determine the user's access level.

* **View** - Grant the user viewing permissions.

* **Edit** - Grant the user viewing and editing permissions (only applies when generating an embed token for a report).

    If you're using the [Generate token for multiple reports](/rest/api/power-bi/embed-token/generate-token) API, use the *allowEdit* parameter to grant the user viewing and editing permissions.

* **Create** - Grant the user permissions to create a report (only applies when generating an embed token for creating a report).

    For report creation, you must also supply the *datasetId* parameter.

### Saving a copy of the report

Use the *allowSaveAs* boolean to let users save the report as a new report. This setting is set to *false* by default.

This parameter is only applicable when generating an embed  token for a report.

### Row Level Security

With [Row Level Security (RLS)](embedded-row-level-security.md), you can choose to use a different identity than the identity of the service principal or master user you're generating the token with. Using this option, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

If you're using RLS, you can in some cases leave out the user's identity (the *EffectiveIdentity* parameter). This allows the token to have access to the entire database. This method can be used to grant access to users such as admins and managers, who have the permissions to view the entire dataset. However, you cannot use this method in every scenario. The table below lists the different RLS types, and shows which authentication method can be used without specifying a user's identity.

The table also shows the considerations and limitation applicable to each RLS type.

|RLS type  |Can I generate an embed token without specifying the effective user ID?  |Considerations and limitations  |
|---------|---------|---------|
|Cloud Row Level Security (Cloud RLS)      |✔ Master user<br/>✖ Service principal          |         |
|RDL (paginated reports)     |✖ Master user<br/>✔ Service principal        |You cannot use a master user to generate an embed token for RDL.         |
|Analysis Services (AS) on premises live connection    |✔ Master user<br/>✖ Service principal         |The user generating the embed token also needs one of the following permissions:<li>Gateway admin permissions</li><li>Datasource impersonate permission (*ReadOverrideEffectiveIdentity*)</li>         |
|Analysis Services (AS) Azure live connection    |✔ Master user<br/>✖ Service principal         |The identity of the user generating the embed token cannot be overridden. Custom data can be used to implement dynamic RLS or secure filtering.<br/><br/>**Note:** Service principal must provide its object ID as the effective identity (RLS username).         |
|Single Sign On (SSO)     |✔ Master user<br/>✖ Service principal         |An explicit (SSO) identity can be provided using the identity blob property in an effective identity object         |
|SSO and cloud RLS     |✔ Master user<br/>✖ Service principal         |You must provide the following:<li>Explicit (SSO) identity in the identity blob property property in an effective identity object</li><li>Effective (RLS) identity (username)</li>         |

>[!NOTE]
>Service principal must always provide the following:
>* An identity for any item with an RLS dataset.
>* For an SSO dataset, an effective RLS identity with the username property defined.

## Next steps

>[!div class="nextstepaction"]
>[Register an app](register-app.md)

> [!div class="nextstepaction"]
>[Power BI Embedded for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Application and service principal objects in Azure Active Directory](/azure/active-directory/develop/app-objects-and-service-principals)

>[!div class="nextstepaction"]
>[Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)

>[!div class="nextstepaction"]
>[Embed Power BI content with service principal](embed-service-principal.md)