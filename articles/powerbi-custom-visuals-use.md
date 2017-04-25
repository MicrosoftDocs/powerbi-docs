<properties
   pageTitle="Add a custom visual to a report (Desktop)"
   description="Add a custom visual to a report in Desktop"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="complete"
   qualityDate="03/15/2016"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/10/2017"
   ms.author="mihart"/>

# Add a custom visual to a report (Desktop)  

You've [downloaded a custom visual template](powerbi-custom-visuals-office-store.md) and saved it to your computer or another location.  The next step is to
import that visual template into a report so that it is added, as an option, to your Visualization pane.

![](media/powerbi-custom-visuals-use/pbi-custom-viz-icon.png)

> [AZURE.IMPORTANT] A custom visual template is added to a specific report when imported. If you'd like to use the visual template in another report, you need to import it into that report as well. When a report with a custom visual is saved using the **Save As** option, a copy of the custom visual template is saved with the new report.

1. Open Power BI Desktop and select the report where you want to add the custom visualization.  Open the report in [Editing View](powerbi-service-interact-with-a-report-in-editing-view.md).

2.  There are two options to import a custom visual template: from the **File** menu or from the **Visualizations** pane.

    **From the Desktop File menu**

    - On the report **File** menu, choose **Import** &gt; **Power BI Custom Visual**. You must be in the editing view.  
      ![](media/powerbi-custom-visuals-use/power-bi-import.png)

    **From the Visualization pane**

    - In the **Visualizations** pane, choose **Insert (…)**.
      ![](media/powerbi-custom-visuals-use/InsertPane.png)  

    - Select **Import a custom visual**.  
      ![](media/powerbi-custom-visuals-use/InsertPane.png)  

3. **Review the warning**.

    A custom visual has access to the data in the report you use in the custom visual, and can perform actions on your behalf. If you share the report with others, when they view the report the custom visual can do the same, but for your co-workers. Take care to review the custom visual to ensure it comes from a trustworthy source. Microsoft recommends you work with your IT department if you're not sure whether to use a specific Custom Visual you obtained from the Power BI visuals gallery, through email, or from some other source.  

    ![](media/powerbi-custom-visuals-use/caution.png)

4. Select a .pbiviz file in the **Open** dialog.

5. An icon (also called a *template*) is added to your **Visualizations** pane.  

    ![](media/powerbi-custom-visuals-use/VisualUse.png)

6. Select the custom visual template to add it to your report as you would with any of the other templates in the Visualizations pane. Add fields and filters and build your visual.

7. Format the custom visual as you would any other visual.  From the ** Visualizations** pane, select the paintbrush icon. The formatting options available will vary by visual type.

### See also

[Download and use custom visuals from the Office store](powerbi-custom-visuals-office-store.md)  
[Add a custom visual to a report in the Power BI Service](powerbi-custom-visuals-add-to-report.md)  
[Publish custom visuals to the Office store](powerbi-developer-office-store.md)  
[Visualizations in Power BI](powerbi-service-visualizations-for-reports.md)  
[Custom Visualizations in Power BI](powerbi-custom-visuals.md)  
[The Power BI custom visuals gallery](https://app.powerbi.com/visuals)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)
