---
title: Use Performance Analyzer to Examine Report Performance
description: Find out how visuals and report elements are performing in terms of resource usage and responsiveness.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 02/26/2025
LocalizationGroup: Create reports
---
# Use Performance Analyzer to examine report performance

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

In Power BI reports, you can find out how each of your report visuals are performing. By using the **performance analyzer**, you can see how long each visual takes to load. Each load time is further broken down category, such as time the DAX query took to run. The DAX query for each visual can be copied, and ran in **DAX query view** in Power BI Desktop. The **performance analyzer** is a pane available in **Report view** of Power BI Desktop or when editing a report in the web.

:::image type="content" source="media/desktop-performance-analyzer/performance-analyzer-01-inline.png" alt-text="Screenshot that shows Performance Analyzer." lightbox="media/desktop-performance-analyzer/performance-analyzer-01-expanded.png":::

Performance Analyzer displays the load duration of all the visuals. Including when visuals load from different interactions, such as applying filters from slicers. It also presents the information so that you can view, drill down, or export the results to a file. Performance Analyzer can help you identify visuals that affect the performance of your reports and identify the reason for the impact.

## Display the Performance Analyzer pane

In **Power BI Desktop** select the **Optimize** ribbon, and then select **Performance Analyzer** to display the Performance Analyzer pane.

:::image type="content" source="media/desktop-performance-analyzer/performance-analyzer-02-inline.png" alt-text="Screenshot of the View ribbon, highlighting Performance Analyzer." lightbox="media/desktop-performance-analyzer/performance-analyzer-02-expanded.png":::

In **Power BI service** open a report and select **Edit**. When editing a report, select the **View** menu, and then select **Performance Analyzer** to display the Performance Analyzer pane.

:::image type="content" source="media/performance-analyzer/performance-analyzer-in-web.png" alt-text="Screenshot of the View menu, highlighting Performance Analyzer when editing a report in the Power BI service." lightbox="media/performance-analyzer/performance-analyzer-in-web.png":::

Once selected, Performance Analyzer is displayed in its own pane to the right of the report canvas in either Power BI Desktop or the Power BI service.

## Use Performance Analyzer

Performance Analyzer measures the processing time (including the time to create or update a visual) required to update report elements initiated as a result of any user interaction that results in running a query. For example, adjusting a slicer requires the slicer visual to be modified, a query to be sent to the data model, and affected visuals to be updated as a result of the new settings.

To have Performance Analyzer begin recording, select **Start recording**.

![Screenshot of Performance Analyzer, highlighting Start recording.](media/desktop-performance-analyzer/performance-analyzer-03.png)

Any actions you take in the report are displayed and logged in the Performance Analyzer pane, in the order that the visual is loaded by Power BI. For example, perhaps you have a report that users have said takes a long time to refresh, or certain visuals in a report take a long time to display when a slider is adjusted. Performance Analyzer can tell you which visual is the culprit and identify which aspects of the visual are taking the longest duration to process.

Once you start recording, the **Start recording** button is grayed out (inactive, since you've already begun recording) and the **Stop** button is active.

Performance Analyzer collects and displays the performance measurement information in real time. Each time you select a visual, move a slicer, or interact in any other way, Performance Analyzer immediately displays the performance results in its pane.

If the pane has more information than can be displayed, a scroll bar appears to navigate to additional information.

Each interaction has a section identifier in the pane, describing the action that initiated the log entries. In the following image, the interaction was that the users changed a slicer.

![Screenshot of the Performance Analyzer pane, highlighting the Changed a slicer interaction type.](media/desktop-performance-analyzer/performance-analyzer-04.png)

Each visual's log information includes the time spent (duration) to complete the following categories of tasks:

* **DAX query** - If a DAX query was required, this is the time between the visual sending the query and the semantic model or Analysis services model returning the results.
* **Direct query** - If the table storage mode is DirectQuery, this is the time for the external query to return results.
* **Visual display** - This is the time required for the visual to draw on the screen, including the time required to retrieve any web images or geocoding.
* **Other** - This is the time required by the visual for preparing queries, waiting for other visuals to complete, or performing other background processing.
* **Evaluated parameters** (preview) - This is the time spent evaluating the field parameters within a visual. Learn more about [field parameters (preview)](../create-reports/power-bi-field-parameters.md).

The **Duration (ms)** values indicate the difference between a *start* and *end* timestamp for each operation. Most canvas and visual operations execute sequentially on a single User Interface thread, which is shared by multiple operations. The reported durations include time spent queued while other operations complete. The [Performance Analyzer sample](https://github.com/microsoft/powerbi-desktop-samples/tree/main/Performance%20Analyzer) on GitHub and its associated [documentation](https://github.com/microsoft/powerbi-desktop-samples/blob/main/Performance%20Analyzer/Power%20BI%20Performance%20Analyzer%20Export%20File%20Format.docx) provide details about how visuals query data and render.

![Screenshot of the Performance Analyzer pane, highlighting Duration.](media/desktop-performance-analyzer/performance-analyzer-06.png)

After you've interacted with the elements of the report that you want to measure with Performance Analyzer, you can select the **Stop** button. The performance information remains in the pane after you select **Stop** for you to analyze.

To clear out the information in the Performance Analyzer pane, select **Clear**. All information is erased and isn't saved when you select **Clear**. To learn how to save information in logs, see the following section.

> [!TIP]
> When Power BI processes queries and their associated metadata, the processing of the query can be impacted by the complexity of the schema, the number of tables in the database(s), the complexity of the relationships between them, and the number of foreign key constraints on the tables. Such complexity can result in initial delays in returning or rendering a report.

## DAX queries in visuals

Visuals in Power BI reports display data from the semantic model. The data is accessed with a DAX query. You can see the DAX query of each visual by selecting **Copy query** in performance analyzer. For tables using DirectQuery table storage mode, this query includes the DAX query and the translated query in SQL or KQL.

**Run in DAX query view** in performance analyzer runs the DAX query in [DAX query view](/power-bi/transform-model/dax-query-view). The result grid shows the data the visual uses and you can inspect the logic of the DAX query itself. This option isn't available in the Power BI service, but the copied DAX query can be run after navigating to DAX query view in the service and pasting in the DAX query.

The structure of a DAX query from a visual is more verbose and structured than necessary to get the same result. The visual DAX query structure helps as you change visuals from one type to another when building a report. [Fabric Copilot to write and explain DAX queries](/dax/dax-copilot) in DAX query view can help structure the visual DAX query into a simpler form with the following prompt.

```copilot-prompt
   Remove the VARs and TOPN and simplify this DAX query
``` 
*Copilot is powered by AI, so surprises and mistakes are possible. For more information, see [Copilot general use FAQs](https://aka.ms/copilot-general-use-faqs).*

Learn more about DAX queries in the [DAX queries learn documentation](/dax/dax-queries).

## Refreshing visuals

You can select **Refresh visuals** in the Performance Analyzer pane to refresh all visuals on the current page of the report and thereby have Performance Analyzer gather information about all such visuals.

You can also refresh individual visuals. When Performance Analyzer is recording, you can select **Analyze this visual**, found in the top-right corner of each visual, to refresh that visual and capture its performance information.

![Screenshot of a visual, highlighting the Analyze this visual icon.](media/desktop-performance-analyzer/performance-analyzer-07.png)

## Save performance information

You can save the information that Performance Analyzer creates about a report by selecting the **Export** button. Selecting **Export** creates a .json file with information from the Performance Analyzer pane.

![Screenshot of the Save As window, showing the creation of a .json file.](media/desktop-performance-analyzer/performance-analyzer-05.png)

## Related content

For more information about **Power BI Desktop** and how to get started, see the following articles.

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [DAX queries](/dax/dax-queries)
* [DAX query view](/power-bi/transform-model/dax-query-view)
* [Fabric Copilot to write and explain DAX queries](/dax/dax-copilot)

For information about the Performance Analyzer sample, check out the following resources.

* [Performance Analyzer sample](https://github.com/microsoft/powerbi-desktop-samples/tree/main/Performance%20Analyzer)
* [Performance Analyzer sample documentation](https://github.com/microsoft/powerbi-desktop-samples/blob/main/Performance%20Analyzer/Power%20BI%20Performance%20Analyzer%20Export%20File%20Format.docx)
