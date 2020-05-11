---
title: Troubleshooting Sign in with OData Feed in Power BI Desktop
description: Solutions to common issues for  sign-in with Odata feed.
author: rp-dev
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: troubleshooting
ms.date: 05/11/2020
ms.author: 

LocalizationGroup: Troubleshooting
---
# Troubleshooting Sign-in with Odata feed
There may be auth issues while trying to get data from an OData feed into PowerBi Desktop.

This article contains the following troubleshooting sections:
* Credential type not supported error
* Access denied errors
  
## Credential type not supported error
When signing-in with Organizational (Azure Active Directory) account for an OData feed, if you see the error "We are unable to connect because this credential type is not supported by this resource. Please choose another credential type.", ![Image of odata auth error](media/desktop-desktop-troubleshooting-sign-in-odata/troubleshoot-odata-sign-in-error1.jpg). 

Ensure your service is sending auth headers as follows:
   1. First Oauth request without any 'authorization' header should send the following header in response:
   
   ``` www-authenticate: Bearer realm=https://login.microsoftonline.com/<Your Active Directory Tenant Id> ```
   
   1. Redirect request to the service with 'authorization' header set to 'Bearer' should send the following header in response:
   
   ```www-authenticate: Bearer authorization_uri=https://login.microsoftonline.com/<Your Active Directory Tenant Id>/oauth2/authorize```

After successful redirect call, calls to your service will have right access token in the authorization header.

If you still see an error, clear the Global Permissions for the OData service uri and try again. To Clear Global Permissions, go to File -> Options and Settings -> Data Source Settings -> Global Permissions.

## Access denied errors
If you get one of the following errors:
1. access_denied: AADSTS650053: The application 'Microsoft Power Query for Excel' asked for scope 'user_impersonation' that doesn't exist on the resource \<resourceId\>.
2. Microsoft Power Query for Excel needs permission to access resources in your organization that only an admin can grant. Please ask an admin to grant permission to this app before you can use it.

Ensure application registration for your Odata service in azure has following settings:
   * 'Application ID' is set to OData service base URI. 
   * Scope'user_impersonation' is defined. 
   *  Application is appropriately consented by the admin.

