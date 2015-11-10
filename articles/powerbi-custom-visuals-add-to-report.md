<properties
   pageTitle="Add a custom visualization to a Power BI report"
   description="Add a custom visual to a Power BI reportI"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags="power bi"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/01/2015"
   ms.author="mihart"/>
# Add a custom visualization to a Power BI report

Once downloaded, custom visualizations must be imported into a report.  Once imported, the new visual will appear in the Visualizations pane of your report canvas. To learn how to download custom visualizations, see [Download a custom visualization from the gallery](powerbi-custom-visuals-download-from-the-gallery.md).

>**Important**
A custom visual is added to a specific report when imported. If you'd like to use the visual in another report, you need to import it into that report as well. When a report with a custom visual is saved using the **Save As** option, a copy of the custom visual is saved with the new report.

1. Open [Power BI](http://app.powerbi.com) and select the report where you want to add the custom visualization.  Open the report in [Editing View](powerbi-service-interact-with-a-report-in-editing-view.md).

2. In the **Visualizations** pane, select the ellipses (...).

  ![](media/powerbi-custom-visuals-add-to-report/PBI_customVizEllipses.jpg)

3. Select **Import** and navigate to the location where you saved the downloaded custom visualization (.pbiviz file).

4. **IMPORTANT**: Review the warning and ensure the visual comes from a trustworthy source. Microsoft recommends you work with your IT department if you're not sure whether to use a specific Custom Visual you obtained from the Power BI visuals gallery, through email, or from some other source. See [Review custom visuals for security and privacy](powerbi-custom-visuals-review-for-security-and-privacy.md).

5. Select **Open**. The custom visualization is added to the Visualization pane.

  ![](media/powerbi-custom-visuals-add-to-report/PBI_customVizAddedIcon.jpg)

  A custom visual is added to a specific report when imported. If you'd like to use the visual in another report, you need to import it into that report. When a report with a custom visual is saved using the **Save As** option, a copy of the custom visual is saved with the new report. You cannot currently pin a custom visual to a dashboard. Don't worry, this capability is coming soon. Once you import a custom visual you cannot remove it from the report.

6. Still in Editing View, select the custom visualization icon.  This adds a watermark (template) to your report canvas.

  ![](media/powerbi-custom-visuals-add-to-report/PBI_template.jpg)

7. Drag fields onto the template to create the visualization.  This example shows the Table Heatmap custom visualization.

  ![](media/powerbi-custom-visuals-add-to-report/PBI_customVizAdded.jpg)

8. Continue to work with and explore this visualization as you would any other (native) visualization in Power BI.

## See also:

[Visualizations in Power BI](powerbi-service-visualizations-for-reports.md)

[Custom Visualizations in Power BI](powerbi-custom-visuals.md)

[The Power BI custom visuals gallery](https://app.powerbi.com/visuals)

[Use custom visualizations in Power BI Desktop](powerbi-custom-visuals-use.md)

[Download custom visualizations from the gallery](powerbi-custom-visuals-download-from-the-gallery.md)

[Create and submit a visualization to the gallery](powerbi-custom-visuals-create-for-the-gallery.md)

[Review custom visuals for security and privacy](powerbi-custom-visuals-review-for-security-and-privacy.md)

[Getting started with custom visuals developer tools (Preview)](powerbi-custom-visuals-getting-started-with-developer-tools.md)

[Video: Creating custom visualizations for Power BI with Sachin Patney and Nico Cristache](https://www.youtube.com/watch?v=kULc2VbwjCc)
