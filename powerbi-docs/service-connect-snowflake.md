---
title: Connect to Snowflake with Power BI
description: Snowflake with SSO for Power BI
author: cpopell
ms.reviewer: 

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 11/20/2019
ms.author: gepopell

LocalizationGroup: Connect to services
---
#  Connecting to Snowflake in Power BI Service

## Introduction

Connecting to Snowflake in the Power BI service only differs from other connectors in one way, which is that an additional capability is offered for SSO. Different parts of the integration require different administrative roles across Snowflake, Power BI, and Azure.

* If you are the Snowflake admin, look at the 'Snowflake configuration' section.
* If you are a Power BI admin, look at the 'Power BI Service configuration - Admin Portal' section
* If you are a Power BI dataset creator, look at the 'Power BI Service configuration - Enabling a dataset' section

## Snowflake Configuration

To enable  Snowflake  integration with Power BI AAD SSO, a user with  Snowflake  admin privileges for the account needs to run the following security integration in  Snowflake.

```create security integration powerbi_sso
    type = external_oauth
    enabled = true
    external_oauth_type = azure
    external_oauth_issuer = '<AZURE_AD_ISSUER>'
    external_oauth_jws_keys_url = 'https://login.windows.net/common/discovery/keys'
    external_oauth_audience_list = ('https://analysis.windows.net/powerbi/connector/Snowflake')
    external_oauth_token_user_mapping_claim = 'upn'
    external_oauth_snowflake_user_mapping_attribute = 'login_name';
```
where you set ```<AZURE_AD_ISSUER>``` equal to ```https://sts.windows.net/<aad_tenant_id>/``` (e.g. https://sts.windows.net/a828b821-f44f-4698-85b2-3c6749302698/)

To get your Azure Active Directory ID:
* Go to 'Azure Active Directory' in the Azure Portal
* Select Properties on the menu along the left-hand side
* Copy the 'Directory ID'

Note: these settings are for the public production tenants. If you're using sovereign cloud, then modify these settings accordingly.

To make sure that the mapping will work properly between the user attribute and the incoming token, you can grab all user attributes with ```desc user user_name``` and search for the attribute "login_name". This attribute should match the upn value of the user in Azure AD.

The DEFAULT_ROLE user attribute of the user is what will be applied to the user in the SSO session.

Note: Some users with the highly privileged roles of Account Admin or Security Admin may not be able to use this integration. To fix this, please contact  Snowflake  support.

## Power BI Service configuration

### Admin Portal

The tenant admin is required to go to the Admin Portal and approve sending Power BI AAD credentials to  Snowflake  for AAD SSO to work.

![Tenant admin setting for Snowflake SSO](media/service-connect-snowflake/snowflakessotenant.png)

Navigate to your "Admin Portal", select the "Tenant Settings" sidebar item, scroll down to "Integration Settings" and you will see an option for "Snowflake  SSO".

As warned, you have to manually enable this to consent to sending your AAD token to the  Snowflake  servers. To enable it, click the 'Disabled' toggle, , press apply and wait for the settings change to take effect.

Once this is done you will be able to use reports with SSO.

### Enabling a dataset

Use the URL feature flag ?snowflakeSSO=true to enable the SSO feature.

Once this is done, when the first user goes to configure the Snowflake dataset for Power BI, they'll have to log in using their Oauth2 credentials via AAD. They need to select the option that other users will have their Oauth2 credentials used to retrieve data. This will enable AAD SSO.

![Dataset setting for Snowflake SSO](media/service-connect-snowflake/snowflakessocredui.png)

Once this is done, any additional users should automatically use their AAD authentication to connect to data from that Snowflake dataset.

