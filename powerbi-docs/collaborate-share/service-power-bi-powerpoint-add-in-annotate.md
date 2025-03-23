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

Data point annotations are descriptive text you can add directly to Power BI visuals you've embedded in your presentation via the Power BI add-in. Data point annotations enable you to provide contextual explanations or highlights to help you communicate insights clearly and to enhance audience understanding.

Data point annotations provide context to enhance your storytelling experience with textual call outs and drive attention to important areas. Annotations help communicate one’s ideas effectively by drawing attention to the marked areas with different colored icons and arrows.

## Where do annotations show up?

Annotations 

Data point annotations you add to a visual are saved in the context of the specific add-in instance the visual is located. Each time the slide with the visual is loaded, the annotations are loaded as well.

Since annotations are only saved in the context of the add-in where they were addedand slide where it is added, it is presented only in that context. This means that:

* The annotation isn't presented when you view the same visual in the Power BI service or in any other place.

You can have different sets of annotations for the same visual when it appears in other instances of the add-in in the same or different presentations. Each set of annotations provides content that is truly in the context of the slide and presentation you are building.

* Each time you (or others) view this visualization in this slide, the annotations will be loaded as well.
* Annotations are displayed whenever the data point is visible. If the visual is filtered in such a way that results in the disappearance of the data point, the annotation likewise disappears.
* If the data updates and the data point no longer appears in the visual, the annotation will not appear either.
	
## Annotation in presentation mode
You can’t add new annotations while in presentation mode.
In presentation mode, you can manage the visibility of annotations. 
When and where do the annotations show up? To change the visibility of annotations, chose the Show/Hide Annotation option in the Data actions menu in the footer. (a keyboard shortcut makes it possible to show/hide the footer during a presentation mode. If annotations exist in the visual, but are currently hidden, a badge notification indicate to you that there are hidden annotations that you can reveal.  
  
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