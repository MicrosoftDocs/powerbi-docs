---
title: Use the Power BI Q&A Visual
description: How to set up the Power BI Q&A visual
author: mihart
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/19/2019
ms.author: mohaali

---
# Introduction to Power BI Q&A Visual

[!INCLUDE [power-bi-service-new-look-include](../includes/power-bi-service-new-look-include.md)]

## What is the Q&A Visual

The Q&A visual allows users to ask natural language questions and get answers in the form of a visual. 

<!--![Q&A Visual Walkthrough](../natural-language/media/qna-visual-walkthrough.gif) -->

[!INCLUDE [power-bi-visuals-desktop-banner](../includes/power-bi-visuals-desktop-banner.md)]

The Q&A visual can be both used as a tool to allow *consumers* to quickly get answers to their data, and by *designers* to create visuals in report by simply double-clicking anywhere on a report and using natural language to get started. As it behaves like any other visual, the Q&A visual can be cross-filtered/cross-highlighted and also supports bookmarks. The Q&A visual also supports themes and other default formatting options available inside Power BI.

The Q&A visual consist of four core components;

- The question box. This is where users type in their question and are shown suggestions to help them complete their question.
- A pre-populated list of suggested questions.
- Icon to convert the Q&A visual into a standard visual. 
- Icon to open Q&A tooling which allows designers to configure the underlying natural language engine.

## Prerequisites

1. This tutorial uses the [Sales & Marketing sample PBIX file](http://download.microsoft.com/download/9/7/6/9767913A-29DB-40CF-8944-9AC2BC940C53/Sales%20and%20Marketing%20Sample%20PBIX.pbix). 

1. From the upper left section of the Power BI Desktop menu bar, select **File** > **Open**
   
2. Find your copy of the **Sales & Marketing sample PBIX file**

1. Open the file in report view ![Screenshot of the report view icon.](media/power-bi-visualization-kpi/power-bi-report-view.png).

1. Select ![Screenshot of the yellow tab.](media/power-bi-visualization-kpi/power-bi-yellow-tab.png) to add a new page.


<!--If you see an error when creating a Q&A visual, be sure to check out the [limitations](../natural-language/qna-limitations.md) section to see if the datasource configuration is supported.-->

## Create a Q&A visual using a suggested question
In this exercise, we'll select one of the suggested questions to create our Q&A visual. 

1. Start on a blank report page and select the Q&A visual icon from the Visualizations pane.

    ![Visualization pane with Q&A visual icon outlined](media/power-bi-visualization-q-and-a/power-bi-icon.png)

2. Drag the border to resize the visual.

    ![Q&A visual on report canvas](media/power-bi-visualization-q-and-a/power-bi-qna.png)

3. To create the visual, select one of the suggested questions or start typing in the question box. In this example, we've selected **top geo states by sum of revenue**. Power BI does its best to select which visual type to use. In this case, it's a map.

    ![Q&A visual map](media/power-bi-visualization-q-and-a/power-bi-map.png)

    But you can tell Power BI which visual type to use by adding it to your natural language query. Keep in mind that not all visual types will work or make sense with your data. For example, this data wouldn't produce a meaningful scatter chart. But it works as a filled map.

    ![Q&A visual as a filled map](media/power-bi-visualization-q-and-a/power-bi-specify-map.png)

## Create a Q&A visual using a natural language query
In the example above, we selected one of the suggested questions to create our Q&A visual.  In this exercise, we'll type our own question. As we type our question, Power BI helps us with autocomplete, suggestion, and feedback.

If you're unsure what type of questions to ask or terminology to use, expand **Show all suggestions** or look through the Fields pane which can be found along the right side of the canvas. This will get you familiar with the terms and content of the Sales & Marketing dataset.

![canvas with Show all suggestions and the Fields pane outlined](media/power-bi-visualization-q-and-a/power-bi-terminology.png)


1. Type a question in the Q&A field. Power BI adds a red underline to words it does not recognize. Whenever possible, Power BI helps define unrecognized words.  In the first example below, selecting either of the suggestions will work for us.  

    ![Typing a question in the Q&A question box](media/power-bi-visualization-q-and-a/power-bi-red-suggest.png)

2. As we type more of the question, Power BI lets us know that it doesn't understand the question, and tries to help. In the example below, Power BI asks us "Did you mean..." and suggests a different way to word our question using terminology from our dataset. 

    ![Q&A visual displaying suggestions](media/power-bi-visualization-q-and-a/power-bi-define.png)

5. With Power BI's help, we were able to ask a question with all recognizable terms. Power BI displays the results as a line chart. 

    ![Q&A visual results](media/power-bi-visualization-q-and-a/power-bi-type.png)


6. Let's change the visual to a column chart. 

    ![Q&A visual with "as a column chart" added to the question](media/power-bi-visualization-q-and-a/power-bi-specify-visual.png)

## Format and customize the Q&A visual
The Q&A visual can be customized using the formatting pane, and by applying a theme. 

### Apply a theme
When you select a theme, that theme is applied to the entire report page. There are many themes to choose from, so try them out until you get the look you desire. 

1. In the menu bar, select the **Home** tab and choose **Switch theme**. 

    ![Desktop with Switch theme selected](media/power-bi-visualization-q-and-a/power-bi-themes.png)

    
    
2. In this example we've selected **More themes** > **Color blind safe**.

    ![Q&A visual with color blind theme applied](media/power-bi-visualization-q-and-a/power-bi-color-blind.png)

### Format the Q&A visual
Format the Q&A visual, the question field, and the way suggestions are displayed. You can change everything from the background of a title to the hover color for unrecognized words. Here we've added a grey background to the question box and changed the underlines to yellow and green. The title is centered and has a yellow background. 

![Q&A visual shwoing our formatting results](media/power-bi-visualization-q-and-a/power-bi-q-and-a-format.png)

## Convert your Q&A visual into a standard visual
We've formatted our color blind safe column chart visual a bit -- added a title and a border. Now we're ready to convert it to a standard visual in our report and also pin it to a dashboard.

Select the icon ![cog icon](media/power-bi-visualization-q-and-a/power-bi-convert-icon.png) to **Turn this Q&A result into a standard visual**.

![Q&A visual with arrow pointing to Standard visual icon](media/power-bi-visualization-q-and-a/power-bi-visual-convert.png)

This visual is no longer a Q&A visual but is a standard column chart. It can be pinned to a dashboard. In the report, this visual behaves the same as other standard visuals. Notice that the Visualizations pane shows a Column chart icon selected instead of the Q&A visual icon.

If you're using the ***Power BI Service***, you can now pin the visual to a dashboard by selecting the pin icon. 


![the Power BI service with pin icon outlined](media/power-bi-visualization-q-and-a/power-bi-pin.png)


## Advanced features of the Q&A visual
Selecting the cog icon opens the Q&A visual Tooling pane. 

![Q&A visual with Tooling icon selected](media/power-bi-visualization-q-and-a/power-bi-q-and-a-tooling.png)

Use the Tooling pane to teach Q&A terms it doesn't recognize, to manage those terms, and to manage the suggested questions for this dataset and report. In the Tooling pane you can also review questions that have been asked using this Q&A visual and see questions that have been flagged by users. <!--To learn more, see [Q&A Tooling into](../natural-language/qnaa-tooling-intro.md) -->

![The Q&A Tooling pane](media/power-bi-visualization-q-and-a/power-bi-q-and-a-tooling-pane.png)

## Considerations and troubleshooting
The Q&A visual integrates with Office and Bing to attempt to match unrecognized common words with fields in your dataset.  

<!--## Next steps

There are a variety of ways you can integrate natural language. For more information, see the following articles:

* [Q&A Tooling](../natural-language/qna-tooling-intro.md)
* [Q&A Best Practices](../natural-language/qna-best-practices.md) -->
