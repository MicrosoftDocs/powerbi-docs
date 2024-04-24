---
title: Create custom Power BI visuals without data binding
description: Learn how to create custom visuals for Power BI without data roles by using the No data binding feature.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: v-asemenov
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 1/31/2024
---

# Create custom Power BI visuals without data binding

This article explains how to use the *No data binding feature* to create Power BI custom visuals without data roles. Ordinarily, when you create a visual in a Power BI report, the values are defined interactively by adding data fields to the **Values** well on the **Visualizations** pane.

:::image type="content" source="media/no-dataroles-support/binding-data.png" alt-text="Screenshot of a Power BI visual that shows the Values well in the Visualizations pane.":::

By default, if no values are defined, the format settings are disabled, and you can't update the visual's formatting.

The `dataRoles` property of the [capabilities model](capabilities.md) allows you to format graphics in Power BI without binding data.

Using the `dataRoles` capabilities property, you can render a visual and use the `update` method to change the format settings. You can change settings even if the data buckets are empty, or if your visual doesn't use any data roles.

The following tabs show two examples of a Power BI visual. One visual requires binding data, and the other uses the *no data roles* feature and doesn't require binding data.

## [Binding data required](#tab/NoDataroles)

When binding data is required, the formatting settings are disabled if there are no data roles or the data wells are empty.

:::image type="content" source="media/no-dataroles-support/no-dataroles-1.png" alt-text="Screenshot of a Power BI visual that shows empty data and inactive visual settings in the Visualizations pane.":::

## [Binding data not required](#tab/NoDatarolesSupport)

With the *no data binding* feature, the formatting settings are enabled even if there are no data roles or the data wells are empty.

:::image type="content" source="media/no-dataroles-support/no-dataroles-2.png" alt-text="Screenshot of a Power BI visual that shows empty data and active format settings in the Visualizations pane.":::

---

## How to create a visual that doesn't require data binding

> [!NOTE]
> This feature is available from [API version 3.6.0](changelog.md#api-v360) and above. To find out which version you’re using, check the `apiVersion` in the *pbiviz.json* file.

To enable the No data binding feature, set the following two parameters in the *capabilities.json* file to `true`.

* `supportsLandingPage` allows you to display information on the Power BI card before it's loaded with data.

* `supportsEmptyDataView` allows Power BI updates when the values field is empty.

```json
    {
        "supportsLandingPage": true,
        "supportsEmptyDataView": true,
    }
```

## Related content

* [Using capabilities](capabilities.md)
* [Add a landing page](landing-page.md)
