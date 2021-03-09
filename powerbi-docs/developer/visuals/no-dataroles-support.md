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

# Render a visual without the need to bind any data

From `powerbi-visuals-api` version 3.6.0, the no `dataRoles` capabilities model is supported. This feature allows you to receive updates from Power BI without the need to bind any data. 
This means that you can render a visual and use the update method to change the visual's format settings even if the data-buckets are empty, or if your visual doesn't use any dataroles at all.

To enable this feature you need to set two parameters in the `capabilities.json` file to *true*. 

```json
    {
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
    }
```

The following tabs show two examples of a Power BI visual, one that requires binding data, and one that's using the new feature and doesn't require binding data.

# [Binding data required](#tab/NoDataroles)
   

>[!div class="mx-imgBorder"]
>![Screenshot of the no-dataroles-support before API-2.6.0](media/no-dataroles-support/nodataroles1.png)


# [Binding data not required](#tab/NoDatarolesSupport) 

>[!div class="mx-imgBorder"]
>![Screenshot of the no-dataroles-support after API-2.6.0](media/no-dataroles-support/nodataroles2.png)

---

## Next steps

> [!div class="nextstepaction"]
> [Using capabilities](capabilities.md)
