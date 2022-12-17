---
title: Optimize ribbon in Power BI Desktop scenarios
description: Optimize ribbon in Power BI Desktop
author: owend
ms.author: owend
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/16/2022
LocalizationGroup: Create reports
---
# DirectQuery optimization scenarios

Let’s look at how you can streamline your authoring experience in Power BI Desktop with the **Optimize** ribbon and relationship editing in the properties pane.

- The Optimize ribbon was announced for public preview in the November 2022 release! With the Optimize ribbon you can fully control when visuals refresh with Pause visuals and Refresh visuals, quickly choose, and apply predefined combinations of settings to meet your specific reporting needs with Optimization presets, and conveniently launch the Performance analyzer to delve deeper into the visual queries themselves, including the SQL queries Direct Query generates.

- The relationship editing in the properties pane was announced for public preview in the October 2022 release! Edit your relationships right in the properties pane in the Model view without running queries to preview or validate the data. A welcome relief for those using DirectQuery storage mode, as these queries can cause you to wait and impact your data sources.

How do these features work to streamline your authoring experience? Here are some scenarios they can help you with:

### Change a DirectQuery report without running queries

In the **Optimize** ribbon, we click **Pause visuals**. When paused, visuals will update only if they don't need to send a query. If the visual does need to send a query, the visual instead enters a pending state. When pending, the visual still shows what it looked like before the change was introduced, just for context, and the tooltips are also disabled to stop report tooltips from  sending queries. Now we can add or remove multiple columns or measures into the field well, re-order the fields, and even filter the visual by using the **Filter** pane.

When  done making all those changes, we click **Refresh** on the visual to send a query just once, click **Refresh** on the banner or ribbon to have all visuals on the page send a query just once, or click **Resume visual queries** on the banner or **Paused visuals** in the Optimize ribbon, to have all the visuals send a query to update now and continue to send queries with any other changes.

Let's take a closer look at that Pause visuals workflow:

**Tip:** Sometimes images on a page are difficult to see the detail. Be sure to use your browser's zoom feature!

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/pause-visuals-flow.png" alt-text="Pause visuals flow diagram":::

In the following animation, we show adding two measures, **Fare** and **Average fare per trip**, to two of the visual’s tooltips on the page, reordering them in the field well, and then resuming the visuals from the banner.

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/1-make-changes-to-an-existing-directquery-report-without-running-queries-until-you-are-ready.gif" alt-text="Make changes to an existing directquery report without running queries until you are ready animation":::

Without Pause visuals, each time a measure is added or moved around in the fields well, a new visual query is sent to the DirectQuery data source. That’s three queries for each visual, so in this case, *six* queries are sent. By using Pause visuals, each time a measure is added or moved around, no queries are sent. Only two queries are sent when the report is resumed. For this simple report change, not running the four extra queries saves time and doesn't waste valuable data source resources.

### Create new visuals without running a query until ready

In the **Optimize** ribbon, we click **Pause visuals**. We then add a new **Matrix** visual from the **Visualization** pane, and then add **Trips**, **Day of week**, and **Time of the day** to the Matrix visual. When paused, the Matrix visual enters a pending state and no queries are sent. Now, we re-order the fields, but again, no queries are sent. Let's open the **Filter** pane, bring in the **Year**, and then filter to the year **2013**. At this point seeing the visual will be helpful before making any more changes. We can click on **Refresh** in the pending visuals banner or open the **Selection** pane to refresh the visual there. We've only sent one query, and the query was pre-filtered, speeding up the return time and reducing impact on the data source. We can make formatting changes to the visual, and even in the report paused state these changes show because a DAX query isn't needed. Adding a background color formatting change does need a visual query so then visual enters the pending state. When ready, we can refresh or resume visual queries to see the final Matrix.

**This animation shows the creation of a new visual using paused visuals**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/2-create-new-visuals.gif" alt-text="Create new visuals":::

Without Pause visuals, each time a measure or column is added or moved around in the fields well, a new visual query is sent to the DirectQuery data source. That’s *six* queries before we started formatting, and five of those are before we filtered the visual to single year. Now with Pause visuals, each time the measure or column is added or moved around, no queries are sent. Only *two* queries are sent when the visual is refreshed or the report is resumed - and they were filtered queries. For this new visual addition, not only did avoiding the extra queries save time and not waste valuable data source resources, we also ran a smaller, targeted query and formatted the visual with minimal disruption.

### Create measures without the visuals refreshing until ready

Again, simply click Pause visuals in the Optimize ribbon to have the report enter the paused state. In a DirectQuery report, anytime a new measure is created all the visuals on the report page will refresh. But, with the report in a paused state I can create new measures and instead all the visuals enter a pending state. I can also add them to the pending visuals. I can then refresh an individual visual to see the new measure or simply resume visual queries when I am done.

**See how the creation of two new measures while using Pause visuals**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/3-create-measures-in-a-directquery-model-without-the-visuals-refreshing-until-you-are-ready.gif" alt-text="Create measures in a directquery model without the visuals refreshing until you're ready animation":::

Without the Pause visuals, each time a measure was created all the visuals would have sent queries to the DirectQuery data source. That’s 5 visuals on the page sending 5 queries with each model change for a total of 22 queries when creating 2 measures and adding the two new measures to a single visual! Now, with the Pause visuals, each time the measure was created, or added to a visual, no queries were sent. A total of only 6 queries were sent when the single visual was refreshed, and then the report resumed. For these modeling changes we saw the most reduction in queries and time waiting, as well as load on the data source resources.

### Edit relationships between DirectQuery tables

Going to the model view in Power BI Desktop, to edit a relationship between two DirectQuery tables I can now simply click on the relationship line and edit it in the Properties pane! I can change the table, column, cardinality, direction, make it active or inactive, and even turn on referential integrity if I am confident each table is not missing values present in the other one. When I am done, I click on apply changes. I can also hold down Ctrl to select multiple relationships to then make bulk changes in the properties pane, or to delete them using the Delete key.

**This animation shows how to edit relationships in the properties pane**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/4-relationship-editing-in-properties-pane.gif" alt-text="Relationship editing in properties pane animation":::

Without the edit relationship in the properties pane, each time I edit a relationship in the Edit relationships dialog queries would have run when I opened the dialog to show the data preview and, with every change of table or column, queries would have run to validate the cardinality and direction of the relationship. Now, with the edit relationship in the properties pane, I do not run queries and the relationship is only validated once I am ready and have clicked the apply changes button.

### Learn about and apply query reduction settings

I can click on the Optimization presets drop down in the Optimize ribbon to choose Query reduction for my report. The dialog explains the applied settings.

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/optimized-for-query-reduction.png" alt-text="Optimized for query reduction screen image":::

Cross-highlighting and cross-filtering is how visuals interact with each other when a data point is clicked. The default is Power BI Desktop is cross-highlighting, but I could have changed the default to cross-filtering by going to File > Options and Settings, then click on Options, select Report settings in CURRENT FILE, and then select the “Change default visual interaction from cross highlighting to cross filtering.”

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/cross-filtering-report-settings.png" alt-text="Cross filtering report settings":::

Optimization presets will only turn off default cross-highlighting and cross-filtering, so any customization done at the visual level with Edit interactions is not impacted. I can click on any visual to show to Format ribbon and then go to Edit interactions. Edit interactions then shows options on all the other visuals in the report so I can decide how they will adjust when a data point is selected in the selected visual -- from cross filtering or cross highlighting to not interacting at all.

edit-interactions
:::image type="content" source="media/desktop-optimize-ribbon-scenarios/edit-interactions.png" alt-text="Edit interactions screen image":::

If I had customized any of the Edit interactions, the Optimization preset disabling cross highlighting and cross filtering by default would not change this customization. Any customized Edit interaction between visuals will still work just as they had before.

Next, Apply buttons are added to the slicers. Every slicer in my report now has an apply button and users can select/unselect multiple options in each single slicer and not have any other visual in the report send a query until the Apply button is clicked. The slicers are still independent of each other, so if I have 2 slicers with Apply buttons, each Apply button would have to be clicked to apply the slicer selections.

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/apply-buttons-on-slicers.png" alt-text="Apply buttons on slicers":::

Finally, Apply buttons are added to the Filter pane. The Filter pane button added controls all the filter selections in the pane with one Apply button. To learn more, see [Format filters in Power BI reports - Apply filters button](power-bi-report-filter.md?tabs=powerbi-desktop#apply-filters-button).

**This animation shows how to set the Query reduction Optimization preset.**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/5-optimization-presets-query-reduction.gif" alt-text="Optimization presets query reduction animation":::

### Adjust query reduction settings to the level you need

I can click on the Optimization presets drop down in the Optimize ribbon to choose Customize to adjust any of the settings. In my report the slicers are for single select and the Apply buttons are more useful in multiple select, so I can keep the other settings and return the slicers to instantly apply with Customize.

**This animation shows how to set the Customize Optimization preset to revert the slicers to instantly apply.**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/6-optimization-presets-customize.gif" alt-text="Optimization presets customize animation":::

### Quickly revert to the full interactivity after a data source change

I can click on the Optimization presets drop down in the Optimize ribbon to choose Interactivity for my report. These are also the default settings in Power BI Desktop, so if you have chosen Query reduction or Customized the Optimization presets this is how you can return to default. The dialog explains the applied settings.

**This animation shows how to set the Interactivity Optimization preset.**

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/7-optimization-presets-interactivity.gif" alt-text="Optimization presets interactivity animation":::

These call out DirectQuery reporting scenarios specifically, but they can be used in all reporting scenarios. Learn more about all the different reporting scenarios in Power BI at [Optimize ribbon in Power BI Desktop - Reporting scenarios](desktop-optimize-ribbon#reporting-scenarios).

For a specific visual, you can determine if it’s using DirectQuery by seeing if it has a Direct query line in the Performance analyzer.

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/directquery-reporting-scenario-in-performance-analyzer.png" alt-text="DirectQuery reporting scenario-in performance analyzer screen image":::

So now you have seen how you can streamline your authoring experience in Power BI Desktop with the Optimize ribbon and relationship editing in the properties pane.

The Optimize ribbon, with Pause visuals, Refresh visuals, Optimization presets, and Performance analyzer, preview feature has to be enabled explicitly in File > Options and Settings > Options > Preview features by selecting the Optimize ribbon checkbox. To learn more, see  [Optimize ribbon in Power BI Desktop](desktop-optimize-ribbon.md).

The relationship editing in the properties pane preview feature has to be enabled explicitly in File > Options and Settings > Options > Preview features by selecting the Relationship editing in the properties pane checkbox. To learn more, see  [Optimize ribbon in Power BI Desktop](desktop-optimize-ribbon.md).

:::image type="content" source="media/desktop-optimize-ribbon-scenarios/enable-preview-features.png" alt-text="Enable preview features screen image":::

## See also

[Optimize ribbon in Power BI Desktop](desktop-optimize-ribbon.md)  

