---
title: Permission tokens needed to embed a Power BI app
description: Learn which tokens your Power BI app needs to authenticate against Azure and Power BI service.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.date: 10/10/2024
#customer intent: As a Power BI developer, I want to learn which tokens my app needs to authenticate against Azure and Power BI service so that I can embed Power BI content in my app.
---

# Embedded analytics access tokens

**APPLIES TO:** :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;App&nbsp;owns&nbsp;data :::image type="icon" source="../../includes/media/yes-icon.svg" border="false":::&nbsp;User&nbsp;owns&nbsp;data

Consuming Power BI content (such as reports, dashboards and tiles) requires an access token. Depending on your solution, this token can be either an [Microsoft Entra token](#azure-ad-token), an [embed token](#embed-token), or both.

In the [*embed for your customers*](./embedded-analytics-power-bi.md#embed-for-your-customers) solution, the application generates an embed token that grants your web users access to Power BI content.

>[!NOTE]
>When you use the *embed for your customers* solution, you can use any authentication method to allow access to your web app.

In the [*embed for your organization*](./embedded-analytics-power-bi.md#embed-for-your-organization) solution, your web app users authenticate against [Microsoft Entra ID](pbi-glossary.md#azure-ad-azure-active-directory) by using their own credentials. Your customers have access to the Power BI content that they have permission to access on the Power BI service.

<a name='azure-ad-token'></a>

## Microsoft Entra token

For both [*embed for your customers*](./embedded-analytics-power-bi.md#embed-for-your-customers) and [*embed for your organization*](./embedded-analytics-power-bi.md#embed-for-your-organization) solutions, you need an [Microsoft Entra token](/azure/databricks/dev-tools/api/latest/aad/). The Microsoft Entra token is required for all [REST API](/rest/api/power-bi/) operations, and it expires after an hour.

* In the *embed for your customers* solution, the Microsoft Entra token is used to generate the embed token.

* In the *embed for your organization* solution, the Microsoft Entra token is used to access Power BI.

You can acquire a Microsoft Entra token in one of the following ways:

* Use an external tool, such as [Bruno](https://www.usebruno.com/downloads), to acquire a token. The request URL is `https://login.windows.net/{{tenantId}}/oauth2/token`. Replace {tenantID} with your tenant ID.

* Follow the sample solutions at [PowerBI-Developer-Samples](https://github.com/microsoft/PowerBI-Developer-Samples/). For example:  
  
  * For *Embed for your customers* see [this AadService.cs file](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/.NET%20Framework/Embed%20for%20your%20customers/AppOwnsData/Services/AadService.cs). Find the `authorityUrl` and `scopeBase` at [AppOwnsData/Web.config](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/.NET%20Framework/Embed%20for%20your%20customers/AppOwnsData/Web.config).

  * For *Embed for your organization* see [this OwinOpenIdConnect.cs file](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/.NET%20Framework/Embed%20for%20your%20organization/UserOwnsData/Services/Security/OwinOpenIdConnect.cs). Find `authorityUrl` at [UserOwnsData/Web.config](https://github.com/microsoft/PowerBI-Developer-Samples/blob/master/.NET%20Framework/Embed%20for%20your%20organization/UserOwnsData/Web.config).

  > [!NOTE]
  > You can find the `authorityUrl` and `scopeBase` values for some sovereign clouds in [Embed content in your app for government and national/regional clouds](embed-sample-for-customers-national-clouds.md).

## Embed token

When you use the *embed for your customers* solution, your web app needs to know which Power BI content a user can access. Use the [embed token](/rest/api/power-bi/embedtoken) REST APIs to generate an embed token, which specifies the following information:

* The content your web app user can access

* The web app user's access level (*view*, *create*, or *edit*)

For more information, see [Considerations when generating an embed token](generate-embed-token.md).

## Authentication flows

This section describes the different authentication flows for the *embed for your customer*s and *embed for your organization* solutions.

### [Embed for your customers](#tab/embed-for-customers)

The *embed for your customers* solution uses a non-interactive authentication flow. In an *embed for your customers* solution, users don't sign in to Microsoft Entra ID to access Power BI. Instead, your web app uses a reserved Microsoft Entra identity to authenticate against Microsoft Entra ID and generate the embed token. The reserved identity can be either a *service principal* or a *master user*:

* **[Service principal](embed-service-principal.md)**
    Your web app uses the Microsoft Entra [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) to authenticate against Microsoft Entra ID and get an *app-only Microsoft Entra token*. This *app-only* authentication method is recommended by Microsoft Entra ID.

    When using a service principal, you need to [enable Power BI APIs access](embed-sample-for-customers.md#step-6---service-principal-api-access) in the Power BI service *admin* settings. Enabling access allows your web app to access the Power BI REST APIs. To use API operations on a workspace, the service principal needs to be a *member* or an admin of the workspace.

* **Master user**
    Your web app uses a user account to authenticate against Microsoft Entra ID and get the *Microsoft Entra token*. The master user account needs to have a [Power BI Pro](../../enterprise/service-admin-purchasing-power-bi-pro.md) or a [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml) license.

    When you use a master user account, you need to define your app's [delegated permissions](/azure/active-directory/develop/v2-permissions-and-consent) (also known as scopes). The master user or *tenant admin* has to give consent to use these permissions when using the Power BI REST APIs.

After successful authentication against Microsoft Entra ID, your web app generates an [embed token](/rest/api/power-bi/embedtoken) to allow its users to access specific Power BI content.

>[!NOTE]
>
>* To embed by using the *embed for your customers* solution, you need a capacity with an A, EM, or P SKU.
>* To [move to production](move-to-production.md), you need a capacity.

The following diagram shows the authentication flow for the *embed for your customers* solution.

:::image type="content" source="media\embed-tokens\paas-authentiction.png" alt-text="Diagram of the authentication flow in an embed for your customers Power BI embedded analytics solution.":::

1. The web app user authenticates against your web app with your authentication method.

2. Your web app uses a service principal or a master user to authenticate against Microsoft Entra ID.

3. Your web app gets an *Microsoft Entra token* from Microsoft Entra ID and uses it to access Power BI REST APIs. The authentication method you choose gives access to the Power BI REST APIS, which depends on if the authentication method is either a service principal or a master user.

4. Your web app calls an [Embed Token](/rest/api/power-bi/embedtoken) REST API operation and requests the embed token. The embed token specifies which Power BI content can be embedded.

5. The REST API returns the embed token to your web app.

6. The web app passes the embed token to the user's web browser.

7. The web app user uses the embed token to access Power BI.

### [Embed for your organization](#tab/embed-for-your-organization)

The *embed for your organization* solution uses an interactive authentication flow. The web app users authenticate against Microsoft Entra ID by using their own Power BI credentials. They need to consent to the API permissions that were set when the app was registered with Microsoft Entra ID. A Microsoft **Permissions requested** dialog window asks users to grant these permissions. After consent is granted, the user can embed the Power BI content that the user has access to.

:::image type="content" source="media/embed-tokens/requested-premissions.png" alt-text="Screenshot of the Microsoft permissions requested pop-up window, which asks customers to grant permissions for accessing Power BI.":::

>[!NOTE]
>
>* The *embed for your organization* solution doesn't support A SKUs.
>* To [move to production](move-to-production.md), you'll need one of the following configurations:
>
>   * All users with Pro licenses.
>   * All users with PPU licenses.
>   * A [capacity](embedded-capacity.md) or [Fabric F64 or greater capacity](/fabric/enterprise/licenses#capacity-and-skus). This configuration allows all users to have free licenses.

This diagram shows an example of the authentication flow for the *embed for your organization* solution.

:::image type="content" source="media/embed-tokens/saas-authentiction.png" alt-text="Diagram of the authentication flow in an embed for your organization Power BI embedded analytics solution.":::

1. The web app user accesses the web app.

2. The web app redirects the web app user to Microsoft Entra ID.

3. The web app user authenticates against Microsoft Entra ID by using their Power BI credentials.

4. Microsoft Entra ID redirects the web app user back to the web app with the Microsoft Entra token. In an implicit grant scenario, the access token is returned to the user's browser.

5. The web app passes the Microsoft Entra token to the user's web browser.

6. Your Power BI web app uses the Microsoft Entra token to embed Power BI content, such as reports and dashboards, which the web app user has permission to access.

---

## Related content

* [Considerations when generating an embed token](generate-embed-token.md)
* [Capacity and SKUs in Power BI embedded analytics](embedded-capacity.md)

More questions? Try asking the [Power BI Community](https://community.powerbi.com/)
