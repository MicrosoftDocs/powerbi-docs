---
title: Overview of report visualizations in Power BI service and Desktop
description: Overview of report visualizations (visuals) in Microsoft Power BI.
author: mihart
ms.author: mihart
ms.reviewer: 'mihart'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-visuals
ms.topic: how-to
ms.date: 10/20/2021
LocalizationGroup: Visualizations 
---

# Visualizations in Power BI reports

[!INCLUDE[consumer-appliesto-yyyn](../includes/consumer-appliesto-yyyn.md)]

Visualizations (known as visuals for short) display insights that have been discovered in the data. A Power BI report might have a single page with one visual or it might have pages full of visuals. In the Power BI service, visuals can be [pinned from reports to dashboards](../create-reports/service-dashboard-pin-tile-from-report.md).

It's important to make the distinction between report *designers* and report *consumers*. If you are the person building or modifying the report, then you are a designer. Designers have edit permissions to the report and its underlying dataset. In Power BI Desktop, this means you can open the dataset in Data view and create visuals in Report view. In Power BI service, this means you can open the data set or report in the report editor in [Editing view](../consumer/end-user-reading-view.md). If a report or dashboard has been [shared with you](../consumer/end-user-shared-with-me.md), you are a report *consumer*. You'll be able to view and interact with the report and its visuals but you won't be able to make as many changes as a *designer* can.

There are many different visual types available directly from the Power BI Visualizations pane.

:::image type="content" source="media/power-bi-report-visualizations/power-bi-icons.png" alt-text="Screenshot showing the Visualizations pane with icons for each visualization type.":::

More Power BI visuals are available from the [Microsoft AppSource community site](https://appsource.microsoft.com). In AppSource you can browse and [download](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) Power BI visuals provided by Microsoft and the community.

If you're new to Power BI, or need a refresher, use the links below to learn the basics of Power BI visualizations.  Alternately, use our Table of Contents (along the left side of this article) to find even more helpful information.

## Add a visualization in Power BI

[Create visualizations](power-bi-report-add-visualizations-i.md) on the pages of your reports. Browse the [list of available visualizations and available visualization tutorials.](power-bi-visualization-types-for-reports-and-q-and-a.md) 

## Upload a visualization from a file or from AppSource

Add a visualization that you created yourself or that you found in the [Microsoft AppSource community site](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). Feeling creative? Dig into our source code and use our [developing tools](../developer/visuals/environment-setup.md) to create a new visualization type and [share it with the community](../developer/visuals/office-store.md). To learn more about developing a Power BI visual, visit [Developing a Power BI visual](../developer/visuals/develop-circle-card.md).

## Personalize your visualization pane

You can personalize the visualization pane by adding and removing Power BI visuals from it. If you removed default visuals from the visualization pane, you can restore the pane to default and bring back all the default visuals.

### Add a visual to the visualization pane

If you find yourself using the same visual across many reports, you can add the visual to your visualization pane. Adding visuals applies to AppSource visuals, organizational visuals, and visuals from files. To add a visual, right-click on the visual.

:::image type="content" source="media/power-bi-report-visualizations/power-bi-pin-custom-visual-option.png" alt-text="Pin to visualization pane.":::

Once a visual has been pinned, it moves up to live with the other default visuals. This visual is now tied to your signed in account, so any new reports you build will automatically have this visual included, assuming you are signed in. You no longer need to add a specific visual you regularly use,  to every single report.

:::image type="content" source="media/power-bi-report-visualizations/power-bi-personalized-visualization-pane.png" alt-text="Personalized visualization pane.":::

### Remove a visual from the visualization pane

If you stop using a visual regularly, you can right-click it and remove it from the visualization pane. Any type of visual can be removed from the visualization pane, including default, file, organizational and AppSource visuals.

:::image type="content" source="media/power-bi-report-visualizations/unpin-visual.png" alt-text="Unpin a visualization from the visualization pane.":::

### Restore the visualization pane

Restoring the visualization pane only applies to default visuals. Visuals that were added to the visualization pane are not affected and will remain available from the visualization pane. If you want to remove AppSource or file visuals from the visualization pane, you'll have to do it manually.

To restore the visualization pane to default, click **More options** (...) and select **Restore default visuals**.

:::image type="content" source="media/power-bi-report-visualizations/restore-default.png" alt-text="Restore the visualization pane to default.":::

## Change the visualization type

Try [changing the type of visualization](power-bi-report-change-visualization-type.md) to see which works best with your data.

## Pin the visualization

In Power BI service, when you have the visualization the way you want it, you can [pin it to a dashboard](../create-reports/service-dashboard-pin-tile-from-report.md) as a tile. If you change the visualization being used in the report after you pin it, the tile on the dashboard doesn't change. If it was a line chart, it stays a line chart, even if you changed it to a Doughnut chart in the report.

## Considerations and limitations

- Depending on the data source and the number of fields (measures or columns), a visual may load slowly.  We recommend limiting visuals to 10-20 total fields, both for readability and performance reasons.

- The upper limit for visuals is 100 fields (measures or columns). If your visual fails to load, reduce the number of fields.

## Next steps

- [Visualization types in Power BI](power-bi-visualization-types-for-reports-and-q-and-a.md)
- [Where to find Power BI visuals](../developer/visuals/power-bi-custom-visuals.md)
- [Create your own Power BI visuals](../developer/visuals/develop-power-bi-visuals.md)
