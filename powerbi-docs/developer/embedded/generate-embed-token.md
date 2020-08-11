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
ms.date: 08/11/2020
---

# Consideration for generating an embed token

[Generate token](https://docs.microsoft.com/rest/api/power-bi/embedtoken) is a REST API that lets you generate a token for embedding a Power BI item in an app or a website. The token is used to authenticate your request against the Power BI server. After successful authentication, access to the relevant data is granted.

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
|**Considerations**|The dataset and the item must be in the same workspace  |The dataset and the item can be in two different *new* workspaces |
|**Workspace permissions**|The service principal or user must be at least a member of the workspace the item is in  |The service principal or user must be an admin of the workspace |
|**Write and reshare permissions**|The service principal or user must be at least a member of the workspace, or a contributor in the workspace the item is in   |Not required |

>[!NOTE]
>* You cannot create an embed token for [My workspace](../../consumer/end-user-workspaces.md#types-of-workspaces).
>* The word *item* refers to a Power BI item such as a dashboard, dataset or report.

## Row Level Security

To generate a [Row Level Security (RLS)](embedded-row-level-security.md) embed token, you'll need write and reshare permissions for both the dataset you're embedding from, and the Power BI item you're embedding.

### Service principal

With service principal you can choose to use a different identity than the identity of the service principal you're generating the token with. Using this option, you can display embedded information according to the user you're targeting. For example, in your application you can ask users to sign in, and then display a report that only contains sales information if the signed in user is a sales employee.

In some cases, the service principal cannot generate an embed token for RLS, without specifying the user that has access to the data. The table below indicates whether or not RLS services require overriding the identity of the service principal.  

|RLS service  |Using the service principal identity  |Overriding the service principal identity  |
|---------|---------|---------|
|Cloud Report Definition Language (RLS)                | ✖ | ✔ |
|RDL                 | ✔ | ✔ |
|AS on prem          | ✖ | The user also needs the following permissions:<li>Gateway admin permissions</li><li>Datasource *ReadOverrideEffectiveIdentity* permission</li> |
|AS Azure            | ✖ |Identity cannot be overridden; a different custom data string can be passed |
|Single Sign On (SSO)| ✔ | ✔ |
|SSO and cloud RLS   | ✖ |You must provide the following for the overriding user:<li>Explicit (SSO) identity (identity blob)</li><li>Effective (RLS) identity (username)</li> |

### Master user

When using a master user to generate an embed token for RLS data, consider the following limitations:

* The generated token uses the identity of the master user. You cannot override the identity of the master user. The token will only grant access to the RLS data that the master user can access.

* You cannot use a master user to generate an embed token for RDL.

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