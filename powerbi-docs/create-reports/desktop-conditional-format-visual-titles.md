---
title: Create Expression-Based Titles and Subtitles
description: Learn how to create dynamic, expression-based titles and subtitles in Power BI Desktop using DAX expressions. Make your visuals respond to filters and user interactions.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/17/2026
ai-usage: ai-assisted
LocalizationGroup: Connect to data
---
# Create expression-based titles and subtitles

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

You can create dynamic, customized titles and subtitles for your Power BI visuals. By creating Data Analysis Expressions (DAX) based on fields, variables, or other programmatic elements, your visuals' titles and subtitles can automatically adjust as needed. These changes happen based on filters, selections, or other user interactions and configurations.

:::image type="content" source="media/desktop-conditional-formatting-visual-titles/expression-based-title-01.png" alt-text="Screenshot showing the Power BI Desktop conditional formatting option.":::

Creating dynamic titles, sometimes called *expression-based titles*, is straightforward.

> [!TIP]
> Conditional formatting is also available for other visual elements in Power BI, including colors, data bars, icons, web URLs for buttons, shapes, images, and more. For the full list of supported visuals and formatting options, see [Conditional formatting in Power BI visuals](../visuals/power-bi-visualization-conditional-formatting.md).

## Create a field for your title

The first step in creating an expression-based title is to create a field in your model to use for the title.

There are many creative ways to make your visual title reflect what you want it to say or express. Let's look at a couple of examples.

You can create an expression that changes based on the filter context that the visual receives for the product's brand name. The following image shows the DAX formula for such a field.

:::image type="content" source="media/desktop-conditional-formatting-visual-titles/expression-based-title-02.png" alt-text="Screenshot of the DAX formula for a line chart title that combines text with the SELECTEDVALUE function for brand name.":::

Another example is using a dynamic title that changes based on the user's language or culture. You can create language-specific titles in a DAX measure by using the `USERCULTURE()` function. This function returns the culture code for the user, based on their operating system or browser settings. You can use the following DAX switch statement to select the correct translated value.

> [!NOTE]
> The `USERCULTURE()` function only returns the current user's culture when called inside a measure. If you use `USERCULTURE()` in a calculated table or calculated column, it returns the culture name of the semantic model's default language instead, because those expressions are evaluated at model load time.

```dax
SWITCH (
  USERCULTURE(),
  "de-DE", “Umsatz nach Produkt”,
  "fr-FR", “Ventes par produit”,
  “Sales by product”
)
```

Or, you can retrieve the string from a lookup table that contains all the translations. You place that table in your model.

These are just a couple of examples you can use to create dynamic, expression-based titles for your visuals in Power BI Desktop. What you can do with your titles is limited only by your imagination and your model.

## Select your field for your title or subtitle

After you create the DAX expression for the field in your model, apply it to your visual's title or subtitle. To select the field and apply it:

1. Go to the **Visualizations** pane. In the **Format** area, select the **General** tab, and then set **Title** to **On** to show the title options for the visual.
1. Next to the **Title** or **Subtitle** text, select **Conditional formatting** (**fx**).

   The **Title text - Title** dialog box appears.

   :::image type="content" source="media/desktop-conditional-formatting-visual-titles/expression-based-title-02b.png" alt-text="Screenshot showing the Title text - Title dialog box.":::

1. From the dialog box, select the field that you created to use for your title, and then select **OK**.

## Considerations and limitations

There are a few limitations to the current implementation of expression-based titles for visuals:

- Expression-based formatting isn't currently supported on Python visuals, R visuals, or the Key Influencers visual.
- The field you create for the title must be a string data type. Measures that return numbers or date/time (or any other data type) aren't currently supported.
- Expression based titles aren't carried over when you pin a visual to a dashboard.
- Conditional formatting can only use measures defined in the underlying model and can't use measures locally created in a report (semantic model connection).

## Related content

This article described how to create DAX expressions that turn the titles of your visuals into dynamic fields that can change as users interact with your reports. You might find the following articles useful as well.

- [Conditional formatting in Power BI visuals](../visuals/power-bi-visualization-conditional-formatting.md)
- [Apply conditional formatting in tables and matrixes](desktop-conditional-table-formatting.md)
- [Set up drillthrough in Power BI reports](desktop-drillthrough.md)
