---
title: Considerations for generating an embed token
description: Learn about the considerations, limitations, and required permissions for generating an embed token
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: conceptual
ms.custom: ""
ms.date: 08/24/2020
---

# Considerations when generating an embed token

[Generate token](https://docs.microsoft.com/rest/api/power-bi/embedtoken) is a REST API that lets you generate a token for embedding a Power BI item in a web app or a portal. The token is used to authenticate the end user's request against the Power BI service. After successful authentication, access to the relevant data is granted.

>[!NOTE]
>Generate token is only applicable when you're [*embedding for your customers*](embed-sample-for-customers.md) (also known as the *app owns data* scenario).

You can generate a token for the following Power BI items:

* [Dashboards](https://docs.microsoft.com/rest/api/power-bi/embedtoken/dashboards_generatetokeningroup)

* [Datasets](https://docs.microsoft.com/rest/api/power-bi/embedtoken/datasets_generatetokeningroup)

* [Generate token for multiple reports](https://docs.microsoft.com/rest/api/power-bi/embedtoken/generatetoken)


* [Report creation](https://docs.microsoft.com/rest/api/power-bi/embedtoken/reports_generatetokenforcreateingroup)

* [Reports](https://docs.microsoft.com/rest/api/power-bi/embedtoken/reports_generatetokeningroup)

* [Tiles](https://docs.microsoft.com/rest/api/power-bi/embedtoken/tiles_generatetokeningroup)

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

## Row Level Security

With [Row Level Security (RLS)](embedded-row-level-security.md) you can choose to use a different identity than the identity of the service principal or master user you're generating the token with. Using this option, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

The table below lists RLS types, and shows which authentication method can use its own identity with each type. The table also shows the considerations and limitation applicable to each RLS type.

>[!NOTE]
>In cases where it can be done (as listed in the table below), when a user identity is not supplied, access to all the RLS data is granted. This method can be used to grant access to users such as admins and managers, who have the needed permissions to view all the data.

|RLS type  |Which authentication method can use its own identity?  |Considerations and limitations  |
|---------|---------|---------|
|Cloud Report Definition Language (Cloud RLS)      |✔ Master user<br/>✖ Service principal          |         |
|RDL (paginated reports)     |✖ Master user<br/>✔ Service principal        |You cannot use a master user to generate an embed token for RDL.         |
|Analysis Services (AS) on premises live connection    |✔ Master user<br/>✖ Service principal         |The user also needs the following permissions:<li>Gateway admin permissions</li><li>Datasource impersonate permission (*ReadOverrideEffectiveIdentity*)</li>         |
|Analysis Services (AS) Azure live connection    |✔ Master user<br/>✖ Service principal         |The identity of the user generating the token cannot be overridden. The user can use a custom data string to filter the data at the row level, instead of the effective identity (RLS username).<br/><br/>**Note:** Service principal must provide its object ID as the effective identity (RLS username).         |
|Single Sign On (SSO)     |✔ Master<br/>✖ Service principal user         |An explicit (SSO) identity can be provided using the identity blob.         |
|SSO and cloud RLS     |✔ Master<br/>✖ Service principal user         |You must provide the following:<li>Explicit (SSO) identity (identity blob)</li><li>Effective (RLS) identity (username)</li>         |

>[!NOTE]
>Service principal must always provide the following:
>* An identity for any item with an RLS dataset
>* For an SSO dataset, it must provide an identity blob

## Next steps

>[!div class="nextstepaction"]
>[Register an app](register-app.md)

> [!div class="nextstepaction"]
>[Power BI Embedded for your customers](embed-sample-for-customers.md)

>[!div class="nextstepaction"]
>[Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/azure/active-directory/develop/app-objects-and-service-principals)

>[!div class="nextstepaction"]
>[Row-level security using on-premises data gateway with service principal](embedded-row-level-security.md#on-premises-data-gateway-with-service-principal)

>[!div class="nextstepaction"]
>[Embed Power BI content with service principal and a certificate](embed-service-principal-certificate.md)