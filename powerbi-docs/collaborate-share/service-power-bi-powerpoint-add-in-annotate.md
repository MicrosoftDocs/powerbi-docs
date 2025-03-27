---
title: Create data point annotations
description: Learn how to add live data-point annotations to Power BI visuals embedded in your PowerPoint presentation.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 03/27/2025
---

# Create data point annotations

Data point annotation is a PowerPoint Power BI add-in feature that enables you to attach text callouts to data points in visuals that you've added to your PowerPoint presentation via the add-in. These annotations make it possible for you to highlight and add commentary to specific points you want people to pay attention to. In your annotations, you can include references to the data point's measure and category values, ensuring that the content you're adding is connected to the actual data point and stays up-to-date when the data updates.

This article explains how to add data point annotations to your visuals, how to manage annotation visibility, and provides other information about the feature.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-appearance.png" alt-text="Screenshot showing data annotations on a chart in a Power BI visual embedded in the Power BI add-in for PowerPoint.":::

Annotations you add to a visual are saved in the context of the specific add-in instance where you embedded your visual, and are available only there. This means:

* Whenever you or others view the slide that contains the visual in this add-in instance, the annotations are loaded as well.

* The annotations won't show up when you view the same visual in the Power BI service or any other place, including other add-in instances.

The fact that annotations are saved and stored with the add-in instance that the visual is embedded in means that you can have different sets of annotations for the same visual when it appears in other add-in instances. This makes it possible to tailor your annotations to the context they appear in.

Annotations are displayed whenever the data points they're attached to are visible. If an data point disappears as the result of filtering, any annotations it has also disappear. Likewise, if the data updates and a data point no longer appears in the visual, any annotations the data point had won't appear either.

## Create an annotation

To create an annotation, you first need to embed a single visual into the add-in in a slide, or choose a visual that you’ve already embedded in the presentation. When you have such a visual:

1. In edit mode, select the data point on the visual, open the context menu, and choose **Annotate**.

    :::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-select-annotation.png" alt-text="Screenshot showing the annotation option on the data point context menu.":::

1. Type your text into the text box. To insert a reference to the data point's measure or category value, type "/" and then choose the desired option from the menu that appears. Format the text as desired using the formatting toolbar.

    :::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-format-annotation.png" alt-text="Screenshot showing the formatting toolbar for annotations.":::

1. Select outside the text box to complete the annotation. After you've completed the annotation, you can select and drag the box around to reposition it.

> [!NOTE]
> You can only format the text of the annotation. Other properties, such as box size and color, are determined by the add-in and the report's theme, and are not under the user's control.

## Manage annotation visibility

You can choose to show or hide the annotations in a visual, depending on your needs. You can manage annotation visibility from either edit mode or presentation mode. 

To toggle between showing and hiding a visuals annotations, open the **Data options** menu and choose **Annotations**. When annotations exist but are hidden, a green dot appears on the Data options icon to indicate that hidden annotations exist that you can display, if desired.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-manage-visibility.gif" alt-text="Animated image showing how to show/hide annotations, and how to know that an annotation has a hidden annotation.":::

You can also toggle between showing and hidding annotations using [keyboard shortcuts](#keyboard-shortcuts).

## Supported chart types

* All cartesian charts except Waterfall, Funnel, and Scatter charts.
* Donut and Pie charts.

* Stacked bar chart
* Stacked column chart
* Clustered bar chart
* Clustered column chart
* 100% Stacked bar chart
* 100% Stacked column chart
* Line chart
* Area chart
* Stacked area chart
* 100% Stacked area chart
* Line and stacked column chart
* Line and clustered column chart

## Keyboard shortcuts

|Keyboard shortcut       | Action                                                                  |
|------------------------|-------------------------------------------------------------------------|
|**Ctrl + Alt + I**      |Hide/show annotations in                                                 |
|**Alt + H**             |Move focus to annotation toolbar                                         |
|**Alt + Shift + I**     |Move focus to annotations group panels                                   |

## Considerations and limitations

* Annotations aren't supported in custom visuals.
* Annotations are supported in all Power BI native Cartesian visuals, and in Pie and Donut charts.
* Annotations are available only when embedding a single visual, and not whole report page.  

## Related content

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)