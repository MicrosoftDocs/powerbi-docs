---
title: Troubleshoot Power BI REST APIs - Common Issues and Fixes
description: Learn how to fix some common issues you might encounter when using Power BI REST APIs for Power BI Embedded features.
author: billmath
ms.author: billmath
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: troubleshooting
ms.date: 06/30/2026
ai-usage: ai-assisted
---

# Troubleshoot Power BI REST APIs

## Troubleshoot 401 errors in Power BI REST API calls

You might need a Fiddler capture to investigate further. The registered application in Microsoft Entra ID might be missing the required permission scope. Verify the required scope is present in the app registration for Microsoft Entra ID in the Azure portal.

### Service principal returns 401 when calling admin APIs

When a service principal calls Power BI admin REST APIs, the call might return HTTP 401 Unauthorized even though the service principal authenticates successfully and acquires a token. This issue affects both direct REST API calls and PowerShell cmdlets, including:

* [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) (`GET /admin/activityevents`)
* [Get Groups As Admin](/rest/api/power-bi/admin/groups-get-groups-as-admin) (`GET /admin/groups`)
* Other endpoints under `/admin/`
* PowerShell cmdlets such as `Get-PowerBIWorkspace -Scope Organization`, `Get-PowerBIActivityEvent`, and `Invoke-PowerBIRestMethod` against admin routes

A typical PowerShell error looks like this:

```output
Get-PowerBIWorkspace : Operation returned an invalid status code Unauthorized
```

A 401 response in this scenario usually indicates a tenant or app registration configuration gap rather than an authentication failure. Work through the following checks in order:

1. **Confirm the relevant tenant settings are enabled.** In the Microsoft Fabric admin portal, verify that **Allow service principals to use read-only Power BI admin APIs** is enabled for admin APIs, or that **Allow service principals to use Power BI APIs** is enabled for user APIs. These two settings are separate tenant settings. An admin API call fails with 401 if you enable only the user API setting. For more information, see [Enable service principal authentication for admin APIs](/fabric/admin/enable-service-principal-admin-apis).
1. **Confirm the service principal is in the scoped security group.** Each tenant setting applies to one or more Microsoft Entra security groups. Verify the service principal is a member of the security group that the setting references. For more information, see [Register a Microsoft Entra application](../../guidance/powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#register-a-microsoft-entra-application).
1. **Confirm the OAuth token uses the correct resource.** When you request the access token, the resource (audience) value must be `https://analysis.windows.net/powerbi/api` for the global cloud. Power BI rejects tokens issued for a different resource - such as Microsoft Graph - with a 401.
1. **Check the app registration permissions.** Confirm the app registration has the application permissions that the specific admin API requires, and that a Microsoft Entra administrator granted admin consent. Don't mix delegated and application permissions on the same app registration - use one or the other based on the authentication flow.
1. **Validate Activity Events parameters.** When you call the [Get Activity Events](/rest/api/power-bi/admin/get-activity-events) REST API, the `startDateTime` and `endDateTime` parameters must be in ISO 8601 UTC format - for example, `2026-06-30T00:00:00Z`. A misformatted timestamp can cause a 401 error.

## Troubleshoot 403 errors in Power BI REST API calls

A 403 error can occur for any of the following reasons. You might need a Fiddler capture to investigate further.

* You exceeded the amount of embed tokens you can generate on a shared capacity. To generate embed tokens, purchase Azure capacities and assign the workspace to that capacity. See [Create Power BI Embedded capacity in the Azure portal](/azure/power-bi-embedded/create-capacity).
* The Microsoft Entra authorization token expired.
* The authenticated user isn't a member of the group (workspace).
* The authenticated user isn't an admin of the group (workspace).
* The authenticated user doesn't have permissions. Update permissions by using the [refreshUserPermissions API](/rest/api/power-bi/users/refreshuserpermissions).
* The authorization header might not be listed correctly. Make sure there are no typos.

The backend of the application might need to refresh the authorization token before calling `GenerateToken`. For more information, see [Refresh the access token](/javascript/api/overview/powerbi/refresh-token).

```console
GET https://wabi-us-north-central-redirect.analysis.windows.net/metadata/cluster HTTP/1.1
Host: wabi-us-north-central-redirect.analysis.windows.net
...
Authorization: Bearer eyJ0eXAiOi...
...

HTTP/1.1 403 Forbidden
...

{"error":{"code":"TokenExpired","message":"Access token has expired, resubmit with a new access token"}}
```

## Fix timeout exceptions when using import and export APIs

When you send a [Power BI REST API](/rest/api/power-bi/) request, it might arrive at a cluster that doesn't contain your tenant's data. In that case, redirecting the request might fail due to a timeout.

To fix the timeout exception, resend the request with the `preferClientRouting` URL query parameter set to `true`. If your request arrives at the wrong cluster, the Power BI service returns a *307 Temporary Redirect* HTTP response. In such cases, you need to redirect your request to the new address specified in the response *HTTPS Location header*.

## The update parameters or update data sources API fails after a few minutes

The following generic error is sometimes returned in the response header:

`HTTP/1.1 500 Internal Server Error`

```json
An error has occurred
```

When you use the [Datasets - Update Parameters In Group](/rest/api/power-bi/datasets/update-parameters-in-group) or the [Datasets - Update Datasources In Group](/rest/api/power-bi/datasets/update-datasources-in-group) APIs, this error might indicate that you're updating a large dataset that isn't using the [large dataset](/fabric/enterprise/powerbi/service-premium-large-models) format. Use the large dataset format to avoid the error.

## Related content

[Power BI Embedded Frequently Asked Questions](embedded-faq.yml)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
