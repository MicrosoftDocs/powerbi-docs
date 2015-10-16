<properties 
   pageTitle="How to use report filters"
   description="How to use report filters"
   services="powerbi" 
   documentationCenter="" 
   authors="jastru" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/16/2015"
   ms.author="jastru"/>

# How to use report filters  
[← All about reports](https://support.powerbi.com/knowledgebase/topics/65157-all-about-reports)

## Working with filters  
Report owners can add filters to a report and those filters are saved with the report.  This is [done in Editing View](http://support.powerbi.com/knowledgebase/articles/464704).  People viewing the report in [Reading View can interact with the filters](http://support.powerbi.com/knowledgebase/articles/445094), but cannot save changes to the report.

Filters are displayed in the bottom half of the **Visualization pane**:  
![](media/powerbi-service-how-to-use-a-report-filter/PBI_FilterList.jpg)

If no visual is selected in the canvas, then the Filters pane displays just the filters that apply to the entire report page and to the entire report. In the example below, no visual is selected and there are no page level filters but there is a report level filter.  
![](media/powerbi-service-how-to-use-a-report-filter/PBI_FilterListWithReportFilter.jpg)  

If a visual is selected in the canvas, you will also see the filters that apply to just that visual:  
![](media/powerbi-service-how-to-use-a-report-filter/PBI_FilterListWithReportAndVIsLevelFilters.jpg)

To display the filter options, select the down arrow next to the filter.  In the example below, the report level filter is set to 2013 and 2014. 

![](media/powerbi-service-how-to-use-a-report-filter/PBI_FilterListDropdown.jpg)

### Clear a filter  
 In either advanced or basic filtering mode, select the eraser icon  ![](media/powerbi-service-how-to-use-a-report-filter/PBI_eraserIcon.jpg). 

### Types of filters: text field filters  
#### List mode  
Ticking a checkbox either selects or deselects the value. The **All** checkbox can be used to toggle the state of all checkboxes on or off. The checkboxes represent all the available values for that field.  As you adjust the filter, the restatement updates to reflect your choices.  

![](media/powerbi-service-how-to-use-a-report-filter/PBI_restatement.png)

-   Note how the restatement now says "is Amarilla or Carretera"

#### Advanced mode  
Select **Advanced Filtering** to switch to advanced mode. Use the dropdown controls and text boxes to identify which fields to include. By choosing between **And** and **Or**, you can build complex filter expressions. Click the **Apply Filter** button when you've set the values you want.  

![](media/powerbi-service-how-to-use-a-report-filter/aboutFilters.png)

### Types of filters: numeric field filters  
#### List mode  
If the values are finite, selecting the field name displays a list.  See **Text field filters** &gt; **List mode** above for help using checkboxes.   

#### Advanced mode  
If the values are infinite or represent a range, selecting the field name opens the advanced filter mode. Use the dropdown and text boxes to specify a range of values that you want to see.  

![](media/powerbi-service-how-to-use-a-report-filter/PBI_dropdown-and-text.png)

By choosing between **And** and **Or**, you can build complex filter expressions. Select the **Apply Filter** button when you've set the values you want.

### Types of filters: date and time  
#### List mode  
If the values are finite, selecting the field name displays a list.  See **Text field filters** &gt; **List mode** above for help using checkboxes.   

#### Advanced mode  
If the field values represent date or time, you can specify a start/end time when using Date/Time filters.  

![](media/powerbi-service-how-to-use-a-report-filter/PBI_date-time-filters.png)

## See Also  
[Filters and highlighting in reports](http://support.powerbi.com/knowledgebase/articles/467092-about-filters-and-highlighting-in-reports)  
[Interact with filters and highlighting in report Reading View](http://support.powerbi.com/knowledgebase/articles/445094-interact-with-a-report-in-reading-view)  
[Create filters in report Editing View](http://support.powerbi.com/knowledgebase/articles/464704)  
Read more about [reports in Power BI](http://support.powerbi.com/knowledgebase/articles/425684-reports-in-power-bi)  
[Power BI - Basic Concepts](http://support.powerbi.com/knowledgebase/articles/487029-power-bi-preview-basic-concepts) 