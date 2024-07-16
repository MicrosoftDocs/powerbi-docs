---
title: Test single sign-on (SSO) configuration
description: Test your single sign-on (SSO) configuration for Power BI gateways.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 02/14/2023
LocalizationGroup: Gateways
---

# Test single sign-on (SSO) configuration

*Single sign-on (SSO)* enables each Power BI user to access the precise data they have permissions for in an underlying data source. Many Power BI data sources are enabled for SSO, using either [Kerberos](service-gateway-sso-kerberos.md) constrained delegation or Security Assertion Markup Language ([SAML](service-gateway-sso-saml.md)). For more information, see [Overview of single sign-on for on-premises data gateways in Power BI](service-gateway-sso-overview.md).

Setting up SSO is complex, so you can use the *test single sign-on (SSO) configuration* feature to test your configuration.

The single sign-on test:

- Lets the gateway connect to the data source by using a test User Principal Name (UPN) that you provide.
- Validates the SSO setup, which includes checking UPN mapping to a local Active Directory (AD) identity for impersonation and data source access.
- Helps identify problems if connection failures occur. For example, an error message indicates if a UPN maps to a local AD identity that doesn't have access to the data source.

The test single sign-on feature works for both Kerberos and SAML-based SSO for the data sources listed in [Supported data sources for SSO](service-gateway-sso-overview.md#supported-data-sources-for-sso). For Kerberos constrained delegation, the test single sign-on feature can help test SSO for both DirectQuery and Import, or only DirectQuery data sources.

> [!IMPORTANT]
> The test single sign-on feature requires the March 2021 gateway release or later.

## Test SSO for the gateway

To test the SSO configuration:

1. From **Manage connections and gateways** in Power BI, select **Settings** for the data source.

   :::image type="content" source="media/service-gateway-sso-test-configuration/gateway-settings.png" alt-text="Screenshot that shows the Settings selection for the gateway data source.":::
   
2. In the **Settings** pane, under **Single sign-on**, select **Test single sign-on**.

   :::image type="content" source="media/service-gateway-sso-test-configuration/test-single-sign-on.png" alt-text="Screenshot that shows how to test SSO configuration in Settings.":::

3. Provide a User Principal Name to test.

   :::image type="content" source="media/service-gateway-sso-test-configuration/user-principal-name.png" alt-text="Screenshot of the UPN field in the SSO test.":::

   If the gateway cluster is able to impersonate the user and successfully connect to the data source, the test succeeds, as shown in the following image:

   :::image type="content" source="media/service-gateway-sso-test-configuration/sso-test-passed.png" alt-text="Screenshot of successful test for SSO test connection.":::

## Troubleshooting

This section describes common errors you might see when testing single sign-on, and actions you can take to fix them.

### Impersonation error

If the gateway cluster can't impersonate the user and connect to the data source, the test fails with the error message: **Error: The on-premises data gateway's service account failed to impersonate the user.**

:::image type="content" source="media/service-gateway-sso-test-configuration/sso-test-failed.png" alt-text="Screenshot of the error dialog when testing fails to impersonate the user.":::

There can be the following possible causes and solutions:

- The user doesn't exist in Microsoft Entra ID. Check if the user is present in Microsoft Entra ID.
- The user isn't mapped correctly to a local AD account. Check configurations and follow the steps in [Overview of single sign-on for on-premises data gateways in Power BI](service-gateway-sso-overview.md).
- The gateway doesn't have impersonation rights. Grant the gateway service account local policy rights on the gateway machine as described in [Grant the gateway service account local policy rights on the gateway machine](service-gateway-sso-kerberos.md#step-6-grant-the-gateway-service-account-local-policy-rights-on-the-gateway-machine).

### Invalid credentials error

The error **Error: Invalid connection credentials** appears when the gateway can't connect to the data source, because the provided UPN doesn't have access to the data source.

:::image type="content" source="media/service-gateway-sso-test-configuration/sso-test-failed-credentials.png" alt-text="Screenshot of the error dialog when testing fails because the UPN doesn't have access to the data source.":::

Check whether the data source has been misconfigured to deny access to the user. You may need to work with your data source/database administrator to access the data source's configuration and settings.

## Related content

- [Overview of single sign-on (SSO) for gateways in Power BI](service-gateway-sso-overview.md)
- [Single sign-on (SSO) - Kerberos](service-gateway-sso-kerberos.md)
- [Single sign-on (SSO) - SAML](service-gateway-sso-saml.md)
