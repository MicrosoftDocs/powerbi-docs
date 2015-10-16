<properties 
   pageTitle="Add a filter to a report in Power BI"
   description="Add a filter to a report in Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="v-aljenk" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="v-aljenk"/>

# Add a filter to a report in Power BI

[← All about reports](https://support.powerbi.com/knowledgebase/topics/65157-all-about-reports)

Filters can be applied to Power BI report pages and to individual report visualizations. A **page filter** applies to all the visualizations on the report page.  A **visual filter** applies to a single visualization on a report page.

There are two modes for interacting with reports: [Reading View](http://support.powerbi.com/knowledgebase/articles/445094) and [Editing View](http://support.powerbi.com/knowledgebase/articles/443094).  And the filtering capabilities available to you depend on which mode you're in.

-   In Editing View, you can add page and visualization filters. When you save the report, the filters are saved with it. People looking at the report in Reading View can interact with the filters you added, but not save their changes.

-   In Reading View, you can interact with any page and visualization filters that already exist in the report, but you won't be able to save your filter changes.

**NOTE:**  This article describes how to create filters in report **Editing View**.  For more information on filters, see [How to use report filters](http://support.powerbi.com/knowledgebase/articles/546859)and [interacting with filters in report Reading View](http://support.powerbi.com/knowledgebase/articles/445094).

## Add a filter to an entire page (aka Page View filter)

### By filtering the fields already in the chart

1.  Open your [report in Editing View](http://support.powerbi.com/knowledgebase/articles/439921-go-from-report-reading-view-to-editing-view).

2.  Open the Visualizations and Filters pane and the Fields pane (if they're not already open).

3.  Select the visualization to make it active. All the fields being used by the visualization are identified in the Fields pane and also listed in the **Fields** pane and also listed in the **Filters** pane, under the **Visual Level Filters** heading.

4.  Select the field you want to add as a new visual level filter, and drag it into the Visual Level Filters area.  Set either **Basic** or **Advanced** filtering controls (see [How to use report filters](http://support.powerbi.com/knowledgebase/articles/546859)).

    The visualization changes to reflect the new filter. 

    ![](media/powerbi-service-add-a-filter-to-a-report/vizFilter.png)

The visualization changes to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values. 

# Add a filter to an entire page (aka Page View filter)

1.  Open your [report in Editing View](http://support.powerbi.com/knowledgebase/articles/439921-go-from-report-reading-view-to-editing-view).

2.  Open the Visualizations and Filters pane and the Fields pane (if they're not already open).

3.  Select a field in the field list in the report and drag it below **Page Level Filters**. 

4.  Select the values you want to filter **Basic** or **Advanced** filtering controls (see [How to use report filters](http://support.powerbi.com/knowledgebase/articles/546859)).

    The visualization changes to reflect the new filter. 

    ![](media/powerbi-service-add-a-filter-to-a-report/filterPage.gif)

If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values. 

## Add a filter to an entire report (aka Report filter)

1. Open your [report in Editing View](http://support.powerbi.com/knowledgebase/articles/439921-go-from-report-reading-view-to-editing-view).
2. Open the Visualizations and Filters pane and the Fields pane (if they're not already open).
3. Select a field in the field list and drag it below **Report Level Filters**.
4. Select the values you want to filter (see [How to use report filters](http://support.powerbi.com/knowledgebase/articles/546859)). 

The visualizations on the active page, and on all pages in the report, changes to reflect the new filter. If you save your report with the filter, report readers can interact with the filter in Reading View, selecting or clearing values. 

##  See Also:

 [How to use report filters](http://support.powerbi.com/knowledgebase/articles/546859)

  [Filters and highlighting in reports](http://support.powerbi.com/knowledgebase/articles/467092-about-filters-and-highlighting-in-reports)

[Interact with filters and highlighting in report Reading View](http://support.powerbi.com/knowledgebase/articles/445094-interact-with-a-report-in-reading-view)

Read more about [reports in Power BI](http://support.powerbi.com/knowledgebase/articles/425684-reports-in-power-bi)

[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts)*﻿*
