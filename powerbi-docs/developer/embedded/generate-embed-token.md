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
ms.date: 08/17/2020
---

# Consideration for generating an embed token

[Generate token](https://docs.microsoft.com/rest/api/power-bi/embedtoken) is a REST API that lets you generate a token for embedding a Power BI item in an app or a website. The token is used to authenticate your request against Power BI service. After successful authentication, access to the relevant data is granted.

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
>* The word *item* refers to a Power BI item such as a dashboard, tile or report.

## Row Level Security

With [Row Level Security (RLS)](embedded-row-level-security.md) you can choose to use a different identity than the identity of the service principal or master user you're generating the token with. Using this option, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

If you don't supply a user identity when generating an embed toke, the API attempts to use the identity of the service principal or master user you're using.

|RLS service  |Which authentication method can use its own identity?  |Considerations  |
|---------|---------|---------|
|Cloud Report Definition Language (Cloud RLS)      |Master user          |         |
|RDL     |Service principal         |You cannot use a master user to generate an embed token for RDL         |
|Analysis Services (AS) on premises     |Master user         |The user also needs the following permissions:<li>Gateway admin permissions</li><li>Datasource *ReadOverrideEffectiveIdentity* permission</li>         |
|Analysis Services (AS) Azure     |Master user         |Identity cannot be overridden; a different custom data string can be passed         |
|Single Sign On (SSO)     |Master user         |         |
|SSO and cloud RLS     |Master user         |You must provide the following:<li>Explicit (SSO) identity (identity blob)</li><li>Effective (RLS) identity (username)</li>         |

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