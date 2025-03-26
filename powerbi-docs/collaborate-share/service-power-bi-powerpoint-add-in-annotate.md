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
LocalizationGroup: Share your work
ms.date: 03/20/2025
---

# Create data point annotations

New enhancement that allows users to make their presentations even more engaging by adding data point annotations to the visuals incorporated into their slides.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-appearance.png" alt-text="Screenshot showing data annotations on a chart in a Power BI visual embedded in the Power BI add-in for PowerPoint.":::
 
Annotations enable users to add descriptive text directly to visualizations, offering contextual explanations or highlights that improve communication and understanding of the data being presented. This feature transforms data storytelling by allowing users to communicate insights with greater efficacy and enhance the engagement and informativeness of presentations.

You can reference the data point’s measure value and category values in the annotation text itself, ensuring the content you are adding is connected to the actual data point.

It also means that you can have multiple sets of annotations for the same visualization; each set provides content that is truly in the context of the presentation you are building.

### When and where do the annotations show up?

Annotations you add to a visual are saved in the context of the specific add-in instance where you embedded your visual, and will be available only there. This means:

* Whenever you or others view the slide that contains the visual in this add-in instance, the annotations will be loaded as well.

    > [!NOTE]
    > Annotations are displayed whenever the data point is visible. If the data point disappears as the result of filtering, the annotation also disappears. Likewise, if the data updates and the data point no longer appears in the visual, the annotation will not appear either.

* The annotations won't show up when you view the same visual in the Power BI service or any other place, including other add-in instances.

The fact that annotations are tied to the add-in instance that a visual is embedded in means that you can have multiple sets of annotations for the same visual - as different set for each add-in instance the visual is embedded in. This makes it possible to tailor your annotations to the context they appear in.

### Annotations in presentation mode 

Although it is not possible to add new annotations in presentation mode, users can manage the visibility of annotations during presentations. Keyboard shortcuts make it possible to toggle annotations on and off with without having to interrupt with pulling up menus or expanding the footer.

## Create an annotation

To utilize annotations, you first need to embed a single visual within the add-in in a slide. Then, simply select a data point on the visual, right-click, and choose “Annotate.” You can then begin typing your text.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-select-annotation.png" alt-text="Screenshot showing the annotation option on the data point context menu.":::
 
You can reference the data point’s measure value and category values in the annotation text itself, ensuring the content you are adding is connected to the actual data point. Use the “/” key to get a menu with the options that can be included in the annotation text.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-format-annotation.png" alt-text="Screenshot showing the formatting toolbar for annotations.":::

## Mananage annotation visibility

A new action for annotations is now available in the footer (Data actions->Annotations) that allows users to hide or show annotations entirely. If annotations exist in the visual, but are currently hidden, you will see a badge notification indicating you that there are hidden annotations that you can reveal.

:::image type="content" source="./media/service-power-bi-powerpoint-add-in-annotate/storytelling-annotation-manage-visibility.gif" alt-text="Animated image showing how to show/hide annotations, and how to know that an annotation has a hidden annotation.":::

## Supported chart types

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
* Line and clusterd column chart

## Keyboard shortcuts

|Keyboard shortcut       | Action                                                                  |
|------------------------|-------------------------------------------------------------------------|
|**Ctrl + Alt + I**      |Hide/show annotations in                                                 |
|**Alt + H**             |Move focus to annotation toolbar out                                     |
|**Alt + Shift I**       |Move focus to annotations group panels                                   |

## Considerations and limitations

* Annotations are not supported in custom visuals.
* Annotations are supported in all Power BI native Cartesians visuals, and in Pie and Donut charts.
* Annotations are available only when embedding a single visual, and not whole report page.  

## Related content

* [About storytelling with Power BI in PowerPoint](./service-power-bi-powerpoint-add-in-about.md)
* [Add live Power BI data to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI data in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)