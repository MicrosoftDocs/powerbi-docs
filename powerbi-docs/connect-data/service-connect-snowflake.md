---
title: Connect to Snowflake with Power BI
description: Learn about how you can connect to Snowflake in Power BI and configure with Azure Active Directory for SSO authentication or a gateway.
author: davidiseminger
ms.author: davidi
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 02/07/2023
LocalizationGroup: Connect to services
---
# Connect to Snowflake in Power BI Service

Connecting to Snowflake in the Power BI service differs from other connectors in only one way. Snowflake has a capability for Azure Active Directory (Azure AD), an option for SSO (single sign-on). Parts of the integration require different administrative roles across Snowflake, Power BI, and Azure. You can choose to enable Azure AD authentication without using SSO. Basic authentication works similarly to other connectors in the service.

To configure Azure AD integration and optionally enable SSO:

* If you're the Snowflake admin, see [Power BI SSO to Snowflake](https://docs.snowflake.com/en/user-guide/oauth-powerbi.html) article in the Snowflake documentation.
* If you're a Power BI admin, see [Power BI Service configuration - Admin Portal](service-connect-snowflake.md#admin-portal) to learn how to enable SSO.
* If you're a Power BI dataset creator, see [Configure a dataset with Azure AD](service-connect-snowflake.md#configure-a-dataset-with-azure-ad) to learn how to enable SSO.

## Power BI service configuration

### Admin portal

To enable SSO, a global admin has to turn on the setting in the Power BI Admin portal. This setting approves sending Azure AD credentials to Snowflake for authentication for the entire organization. Follow these steps to enable SSO:

1. [Sign in to Power BI](https://app.powerbi.com) using global admin credentials.
1. Select **Settings** from the page header menu, then select **Admin portal**.
1. Select **Tenant settings**, then scroll to locate **Integration settings**.

   :::image type="content" source="media/service-connect-snowflake/snowflake-sso-tenant.png" alt-text="Screenshot of the Admin portal with Snowflake SSO settings highlighted.":::

1. Expand **Snowflake SSO**, toggle the setting to **Enabled**, then select **Apply**.

This step is required to consent to sending your Azure AD token to the  Snowflake  servers. After you enable the setting, it can take up to an hour for it to take effect.

After SSO is enabled, you can use reports with SSO.

### Configure a dataset with Azure AD

After a report that's based on the Snowflake connector is published to the Power BI service, the dataset creator has to update settings for the appropriate workspace so it can use SSO.

For more information including steps for using Azure AD, SSO, and Snowflake, see [Data gateway support for single sign-on with Azure AD](https://powerbi.microsoft.com/blog/announcing-data-gateway-support-for-single-sign-on-sso-with-azure-active-directory/).

For information about how you can use the on-premises data gateway, see [What is an on-premises data gateway?](service-gateway-onprem.md)

If you aren't using the gateway, you're all set. When you have Snowflake credentials configured on your on-premises data gateway, but you're only using that data source in your model, switch the Dataset settings to off on the gateway for that data model.

:::image type="content" source="media/service-connect-snowflake/snowflake-gateway-toggle-off.png" alt-text="Screenshot of the expanded gateway connection settings with the toggle set to off.":::

To turn on SSO for a dataset:

1. [Sign in to Power BI](https://app.powerbi.com) using dataset creator credentials.
1. Select the appropriate workspace, then choose **Settings** from the more options menu that's located next to the dataset name.

   :::image type="content" source="media/service-connect-snowflake/dataset-settings-2.png" alt-text="Screenshot of datasets and dataflows in a workspace with more and settings highlighted.":::

1. Select **Data source credentials** and sign in. The dataset can be signed into Snowflake with Basic or OAuth2 (Azure AD) credentials. By using Azure AD, you can enable SSO in the next step.
1. Select the option **End users use their own OAuth2 credentials when accessing this data source via DirectQuery**. This setting will enable Azure AD SSO. Whether the first user signs in with Basic authentication or OAuth2 (Azure AD), the Azure AD credentials are sent for SSO.

   :::image type="content" source="media/service-connect-snowflake/snowflake-sso-cred-ui.png" alt-text="Screenshot of the configuration dialog with OAuth2 selected as the authentication method.":::

After these steps are done, users should automatically use their Azure AD authentication to connect to data from that Snowflake dataset.

If you choose not to enable SSO, then users refreshing the report will use the credentials of the user who signed in, like most other Power BI reports.

### Troubleshooting

If you run into any issues with the integration, see the Snowflake [troubleshooting guide](https://docs.snowflake.com/en/user-guide/oauth-powerbi.html#troubleshooting).

## Next steps

* [Data sources for the Power BI service](service-get-data.md)
* [Connect to datasets in the Power BI service from Power BI desktop](desktop-report-lifecycle-datasets.md)
* [Connect to Snowflake in Power BI Desktop](desktop-connect-snowflake.md)
