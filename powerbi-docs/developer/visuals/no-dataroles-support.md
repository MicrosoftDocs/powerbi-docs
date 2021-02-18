---
title: Render visual without the need to bind any data
description: Learn how to render visual without the need to bind any data.
author: Demonkratiy
ms.author: v-asemenov
ms.reviewer: kesharab
manager: mgolan
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 02/18/2021
---

# Render a visual without the need to bind any data *("no dataroles" support)*

Starting from `powerbi-visuals-api` - *version 3.6.0* you can receive updates from Power BI without the need to bind any data. That means that you can render a visual and use update method to change visual's format settings even if data-value buckets are empty or if your visual doesn't use any dataroles at all.

To enable this feature you need to set two parameters in `capabilities.json` to a **true** value: 

```json
    {
        ...
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
        ...
    }
```

Here you can see the difference of how it worked **before** this feature and **after**:

# [Before:](#tab/NoDataroles)
   

>[!div class="mx-imgBorder"]
>![Screenshot of the no-dataroles-support before API-2.6.0](media/no-dataroles-support/nodataroles1.png)


# [After:](#tab/NoDatarolesSupport) 

>[!div class="mx-imgBorder"]
>![Screenshot of the no-dataroles-support after API-2.6.0](media/no-dataroles-support/nodataroles2.png)

---