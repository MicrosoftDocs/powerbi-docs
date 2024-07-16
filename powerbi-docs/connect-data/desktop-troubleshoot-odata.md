---
title: Troubleshooting OData sign-in errors in Power BI Desktop
description: Learn about solutions to common sign-in issues with OData connections, including credential type not supported error and access denied errors.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: 
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: troubleshooting
ms.date: 01/24/2023
LocalizationGroup: Troubleshooting
---
# Troubleshooting sign-in with OData feed

This article contains troubleshooting options when signing in using an organization account for an OData feed:

* Credential type not supported error
* Access denied errors

The following sections describe each error, and the steps to remedy them, in turn.

## Credential type not supported

You might see the following error, indicating the credential type isn't supported:

```output
We are unable to connect because this credential type is not supported 
by this resource. Please choose another credential type.
```

You need to ensure your service is sending auth headers as follows:

* First Oauth request without any *authorization* header should send the following header in response:

  ```output
  www-authenticate: Bearer realm=https://login.microsoftonline.com/<Your Active Directory Tenant Id> 
  ```

* Redirect request to the service with *authorization* header set to *Bearer* should send the following header in response:

  ```output
  www-authenticate: Bearer authorization_uri=https://login.microsoftonline.com/<Your Active Directory Tenant Id>/oauth2/authorize
  ```

After a successful redirect call, calls to your service have the right access token in the authorization header. If you still see an error, clear the **Global Permissions** for the OData service URI and try again. To clear **Global Permissions**, go to **File** > **Options and Settings** > **Data Source Settings** > **Global Permissions**.

## Access denied

You might see one of the following errors, indicating access is denied:

```output
access_denied: AADSTS650053: The application 'Microsoft Power Query for Excel' 
asked for scope 'user_impersonation' that doesn't exist 
on the resource \<resourceId\>.
```

```output
Microsoft Power Query for Excel needs permission to access resources 
in your organization that only an admin can grant. 
Ask an admin to grant permission to this app before you can use it.
```

If you encounter such an error, ensure the application registration for your OData service has following settings:

* *Application ID* is set to the OData service base URI.
* Scope *user_impersonation* is defined.
* The application's permissions are appropriately set by the administrator.

## Related content

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
