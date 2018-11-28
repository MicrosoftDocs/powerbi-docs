---
title: Using buttons in Power BI 
description: Buttons in Power BI Desktop let you make reports and dashboards that behave like apps, and deepen engagement with users
author: davidiseminger
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Create reports
---
# Using buttons in Power BI
Using **buttons** in Power BI lets you create reports and dashboards that behave similar to apps, and thereby, create an engaging environment so users can hover, click, and further interact with Power BI content. You can add buttons to reports in **Power BI Desktop**, and share or publish those reports to the Power BI service to create dashboards that provide an app-like behavior for users.

![Buttons in Power BI](media/desktop-buttons/desktop-buttons_01.png)

Buttons that you create in **Power BI Desktop** are available for use in reports or dashboards that are published in the **Power BI service**.

## Creating buttons in reports
To create a button in a **Power BI Desktop** report, on the **Home** ribbon, select **Buttons** and a drop-down menu appears, where you can select the button you want from a collection of options, as shown in the following image. 

![Add a button control in Power BI Desktop](media/desktop-buttons/desktop-buttons_02.png)

When you create a button and select it on the report canvas, the **Visualizations** pane shows you the many ways you can customize the button to fit your requirements. For example, you can turn **Button Text** on or off, by toggling the slider in that card of the **Visualizations** pane. You can also change the button's icon, the button fill, the title, and the action that's taken when users click on the button in a report or dashboard, among other properties.

![Format a button in Power BI Desktop](media/desktop-buttons/desktop-buttons_03.png)

## Set button properties when idle, hovered over, or selected

Buttons in Power BI have three states: default (how they appear when not hovered over or selected), when hovered over, or when selected (often referred to as being *clicked*). Many of the cards in the **Visualizations** pane can be modified individually based on those three states, providing plenty of flexibility for customizing your buttons.

The following cards in the **Visualizations** pane let you adjust formatting or behavior of a button based on its three states:

* Button Text
* Icon
* Outline
* Fill

To select how the button should appear for each state, expand one of those cards and select the drop-down that appears at the top of the card. In the following image, you see the **Outline** card expanded, with the drop-down selected to show the three states:

![Three states of a button in Power BI Desktop](media/desktop-buttons/desktop-buttons_04.png)


## Select the action for a button

You can select which action is taken when a user selects a button in Power BI. You can access the options for button actions from the **Action** card in the **Visualizations** pane.

![Action for a button in Power BI](media/desktop-buttons/desktop-buttons_05.png)

The options for button actions are:

* Back
* Bookmark
* Q&A

Selecting **Back** returns the user to the previous page of the report. This is especially useful for drill-down pages.

Selecting **Bookmark** presents the report page that's associated with a bookmark that is defined for the current report. You can [learn more about bookmarks in Power BI](desktop-bookmarks.md). 

Selecting **Q&A** from the drop-down presents a **Q&A Explorer** window. 

Certain buttons will have a default action selected automatically. For example, the **Q&A** button type automatically selects **Q&A** as the default action. You can learn more about **Q&A Explorer** by checking out [this blog post](https://powerbi.microsoft.com/blog/power-bi-desktop-april-2018-feature-summary/#Q&AExplorer).

You can try or test the buttons you create for your report by using *CTRL+CLICK* on the button you want to use. 

## Next steps
For more information about features that are similar or interact with buttons, take a look at the following articles:

* [Use drillthrough in Power BI Desktop](desktop-drillthrough.md)
* [Display a dashboard tile or report visual in Focus mode](consumer/end-user-focus.md)
* [Use bookmarks to share insights and build stories in Power BI](desktop-bookmarks.md)

