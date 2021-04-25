---
title: Test single sign-on (SSO) configuration
description: Test your single sign-on (SSO) configuration for Power BI gateways.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 04/22/2021
LocalizationGroup: Gateways
---

# Test single sign-on (SSO) configuration

Using **single sign-on (SSO)** enables each user to see the precise set of data for which they have permissions in an underlying data source. Many data sources are enabled for SSO in Power BI, using either [Kerberos](service-gateway-sso-kerberos.md) constrained delegation, or Security Assertion Markup Language ([SAML](service-gateway-sso-saml.md)). You can learn more about [SSO for on-prem data gateways in Power BI](service-gateway-sso-overview.md).

Setting up Single Sign-On (SSO) is complex, so with the **test single sign-on (SSO) configuration** feature, you can test your configuration. Running the single sing-on test lets the gateway connect to the data source, using a test UPN (provided by you) and does the following:

* Validates the SSO setup, including checking UPN mapping to a local Active Directory identity for impersonation and data source access.
* Helps identify any problems if connection failures occur. For example, if an UPN is mapped to a local AD identity but doesn't have access to the data source, the error message indicate that error.

The **test single sign-on** feature works for both Kerberos and SAML based single sign-on for these [documented data sources](service-gateway-sso-overview.md). For Kerberos constrained delegation, the **test single sign-on** feature helps with testing both SSO using **DirectQuery**, and **DirectQuery And Import**.

> [!IMPORTANT]
> The **test single sign-on** feature requires the March 2021 gateway release or later.


## How to test SSO for the gateway

1. In the **Manage Gateways** page in Power BI, when editing the data source for SSO, you can test the configuration from the **Advanced Settings** area.

    :::image type="content" source="media/service-gateway-sso-test-configuration/gateway-sso-test-configuration-01.png" alt-text="Screenshot of how to test S S O configuration.":::

2. Provide a User Principal Name to test. If the gateway cluster is able to impersonate the user and successfully connect to the data source, the test succeeds, as shown in the following image.

    :::image type="content" source="media/service-gateway-sso-test-configuration/gateway-sso-test-configuration-02.png" alt-text="Screenshot of successful test for S S O.":::

## Troubleshooting Single Sign-On (SSO)

This section describes frequent errors you may see, when testing single sign-on, and actions you can take to fix them:

* **Error: The on-premises data gateway's service account failed to impersonate the user.**

    If the gateway cluster cannot impersonate the user and connect to the data source, the test fails with the corresponding error message.

    :::image type="content" source="media/service-gateway-sso-test-configuration/gateway-sso-test-configuration-03.png" alt-text="Screenshot of error dialog when testing fails to impersonate the user.":::

    | Possible cause | Action |
    | --- | --- |
    | User does not exist in AAD | Check if the user is present in AAD |
    | User is not mapped correctly to a local AD account | Check configurations and follow steps outlined in the documentation: [Overview of SSO](service-gateway-sso-overview.md) |
    | Gateway does not have impersonation rights. | Grant the gateway service account local policy rights on the gateway machine: [Grant local policy rights](service-gateway-sso-kerberos.md#grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine)  |

* **Error: Invalid connection credentials.**
The gateway cannot connect to the data source, because the provided User Principal Name does not have access to the data source.

    :::image type="content" source="media/service-gateway-sso-test-configuration/gateway-sso-test-configuration-04.png" alt-text="Screenshot of error dialog when testing fails because User Principal Name does not have access to data source.":::


    | Possible cause | Action |
    | --- | --- |
    | User does not have credentials to the data source | Check if the user has access to the data source and add the user to the data source: [Add or remove a gateway data source](service-gateway-data-sources.md#manage-users)  |
    
## Next steps

The following articles may be useful in learning more about single sign-on and gateways.

* [Overview of single sign-on (SSO) for gateways in Power BI](service-gateway-sso-overview.md)
* [Single sign-on (SSO) - Kerberos](service-gateway-sso-kerberos.md)
* [Single sign-on (SSO) - SAML](service-gateway-sso-saml.md)
