---
title: Check privileges API in Power BI Visuals
description: The article describes how to use Power BI Visuals API to determine what privileges are enabled.
author: mberdugo
ms.author: monaberdugo
ms.reviewer:
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: reference
ms.date: 05/31/2022
---

# Check permissions API

As a developer of Power BI visuals, you can develop visuals that need permission to access various resources. You request these permissions in the privileges section of the [capabilities.json](capabilities.md) file. These privileges include the ability to access:

* remote resources or web sites
* local storage for downloading data

Each organization's admin can allow or block these permissions. The *check permissions API* allows you to query the host at runtime to determine which permissions are granted. You can use this information to design a visual that will work with various permission settings.

## How to use the check permissions API

In the following example, 

```typescript

```

## Considerations and limitations

## Next steps

>[!div class="nextstepaction"]
>[Power BI custom visual API](visual-api.md)
