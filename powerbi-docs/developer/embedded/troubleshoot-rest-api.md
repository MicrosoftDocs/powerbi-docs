---
title: Troubleshoot Power BI REST APIs
description: Learn how to fix some common issues you might encounter when using Power BI REST APIs for Power BI Embedded features.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: troubleshooting
ms.date: 6/04/2024
---

# Troubleshoot REST APIs

## API call returns 401

A Fiddler capture might be required to investigate further. The required permission scope might be missing for the registered application within Microsoft Entra ID. Verify the required scope is present within the app registration for Microsoft Entra ID within the Azure portal.

## API call returns 403

A 403 error can occur for any of the following reasons. A Fiddler capture might be required to investigate further.

* The user has exceeded the amount of embed token that can be generated on a shared capacity. Purchase Azure capacities to generate embed tokens and assign the workspace to that capacity. See [Create Power BI Embedded capacity in the Azure portal](/azure/power-bi-embedded/create-capacity).
* The Microsoft Entra authorization token expired.
* The authenticated user isn't a member of the group (workspace).
* The authenticated user isn't an admin of the group (workspace).
* The authenticated user doesn't have permissions. Permissions can be updated using the [refreshUserPermissions API](/rest/api/power-bi/users/refreshuserpermissions).
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

When using the [Datasets - Update Parameters In Group](/rest/api/power-bi/datasets/update-parameters-in-group) or the [Datasets - Update Datasources In Group](/rest/api/power-bi/datasets/update-datasources-in-group) APIs, this error might indicate that you're updating a large dataset that isn't using the [large dataset](../../enterprise/service-premium-large-models.md) format. Use the large dataset format to avoid the error.

## Related content

> [!div class="nextstepaction"]
>[Power BI Embedded Frequently Asked Questions](embedded-faq.yml)

More questions? [Ask the Power BI Community](https://community.powerbi.com/)
