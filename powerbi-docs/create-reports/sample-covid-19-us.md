---
title: COVID-19 tracking sample for US state and local governments
description: Download and modify the sample report with US state and local data for the COVID-19 pandemic.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: maggies
ms.custom:
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 07/15/2021
LocalizationGroup: Samples
---
# COVID-19 tracking sample for US state and local governments

The Power BI team has created a COVID-19 tracking sample that enables US state and local governments to publish or customize an interactive report about COVID-19. Using Power BI Desktop, they can analyze and visualize COVID-19 data  to keep their communities informed  at the city, county, state, and national levels. Then using Power BI Publish to Web, they can share the report publicly to inform citizens. The article offers different options for using Power BI interactive visualizations in your own public story, blog, or website.

:::image type="content" source="media/sample-covid-19-us/covid-19-us-tracking-sample.png" alt-text="COVID-19 sample with US data":::

This article covers how to:

- Copy embed code and put it on your own site. 
- Make customizations such as formatting a specific state.
- Publish to the Power BI service.
- Publish to the web. 
- Mash up this data with data from another source. 

## Prerequisites

Before you can get started using Power BI to tell your story, you need these prerequisites:

- Download the free [Power BI Desktop](https://powerbi.microsoft.com/desktop/) app.
- Sign up for the [Power BI service](https://powerbi.microsoft.com/get-started/).

## Option 1: Pre-built embed code

Microsoft has published the sample report and created a publish-to-web embed code. You can use the embed code to embed the complete sample, including the national view, and drill down to the state and county level in your own website. Before publishing this data, we recommend reviewing the [disclaimers](#disclaimers) in this article.

To include the interactive graphic on your site, copy and paste the following embed code to where you would like the graphic to show up on your web page.  

```
<iframe width="1600" height="900" src="https://app.powerbi.com/view?r=eyJrIjoiMmI2ZjExMzItZTcwNy00YmUwLWFlMTAtYTUxYzVjODZmYjA5IiwidCI6ImMxMzZlZWMwLWZlOTItNDVlMC1iZWFlLTQ2OTg0OTczZTIzMiIsImMiOjF9" frameborder="0" allowFullScreen="true"></iframe>
```

The embed code is an HTML iFrame element that you can insert into any HTML page. Adjust the width and height of the iFrame provided to fit within your site. The sample report is authored at 16:9 proportions, so pick a size that preserves this dimension. When implemented correctly, the graphic appears without any extra grey borders. It is useful to [review the iFrame sizing tips and tricks](../collaborate-share/service-publish-to-web.md#tips-for-iframe-height-and-width) when making these changes.

## Option 2: Customize the sample Power BI file

The Power BI file contains the data and interactive graphic in a .pbix file format you can edit in Power BI Desktop.  

A typical customization is to filter the report to a specific state, and then to create your own publish-to-web embed code for your customized report.

USAFacts data is provided under a Creative Commons License that requires attribution. Before publishing this data, review the [disclaimers](#disclaimers).

To get started, [download the .pbix file (here)](https://go.microsoft.com/fwlink/?linkid=2125058).

### Update your report 

1. Download the latest version of the free app, [Power BI Desktop](https://powerbi.microsoft.com/desktop/), if you haven't already. 

2. Download the [.pbix file](https://go.microsoft.com/fwlink/?linkid=2125058), if you haven't already, and open it in Power BI Desktop.

3. To filter your report to a specific state, select the arrow to expand the Filters pane.

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-filters-pane.png" alt-text="Expand the Filters pane":::

4. Select a state that you are interested in. 

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-filter-selection.png" alt-text="Select a state":::

5. To save your file, select **File** > **Save**. 

### Refresh your report 

1. Select the **Refresh** button.

    :::image type="content" source="media/sample-covid-19-us/power-bi-desktop-refresh-button.png" alt-text="Refresh button":::

2. Select **Anonymous** > **Connect**. 

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-azure-blob.png" alt-text="Select Anonymous":::

 
3. Select **Ignore Privacy Levels**, if shown > **Save**. 

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-privacy-levels.png" alt-text="Select privacy levels":::

### Publish your report to the Power BI service

Once you've customized your report to your liking, [follow the steps outlined here to publish your report](../create-reports/desktop-upload-desktop-files.md) to the Power BI service.

### Configure scheduled refresh

To keep the data in the report up to date, you can [configure scheduled refresh](../connect-data/refresh-scheduled-refresh.md) after you publish your report.

When you follow the steps, choose the following options:

1. Data Source Credentials Authentication Method: Anonymous
2. Privacy level setting for this data source: Public

To test your refresh setting, select the [Refresh now](../connect-data/refresh-data.md#data-refresh) option, available from the dataset item.

The refreshed data is loaded each time the schedule runs. The underlying data is provided by USAFacts and may not update as frequently as your refresh schedule. Check the [USAFacts website](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/) to know when the underlying data was last updated. 

If you intend to publish the customized report on your website, it is best to configure your scheduled refresh to run at least as frequently as the USAFacts data updates. Since USAFacts may refresh their data at different times each day, you may want to configure several refreshes each day. 

### Create a publish-to-web embed code 

To embed your customized report in your own website, follow the instructions for how to [create your own publish-to-web embed code](../collaborate-share/service-publish-to-web.md#create-embed-codes-with-publish-to-web).

Once you publish your embed code, you use the iFrame on the confirmation dialog to embed in your website.

If you make changes to the report in Power BI Desktop, you can publish and replace the existing report in the Power BI service. The embed code doesn't change. It takes approximately an hour for changes to the report or refreshed data to appear on your website. 

## Option 3: Mash up data from another source 

You can also mash up the data in this report with data from another source. The following example is based on data from [Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19). Before publishing this data, we recommend reviewing the [disclaimers](#disclaimers) in this article.

1. In Power BI Desktop, select **Get data** > **Web**.

    :::image type="content" source="media/sample-covid-19-us/power-bi-desktop-get-data.png" alt-text="Get data button":::

2. Enter the following URL:

    ```
    https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv
    ```

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-from-web.png" alt-text="Select data from web":::

3. Select **OK**. 

    > [!NOTE]
    > The link published by Johns Hopkins University can change. Check the [Johns Hopkins GitHub page](https://github.com/CSSEGISandData/COVID-19) for the latest information.

4. Select **Load** to load the dataset for total confirmed cases worldwide.  

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-load-data.png" alt-text="Load data from web":::

    This article, [Connect to webpages from Power BI Desktop](../connect-data/desktop-connect-to-web.md), provides more information about loading data from the web.
    
You can then use Power BI Desktop to visualize the data. Finally, use the steps in **Option 2:** [Publish your report to the Power BI service](#publish-your-report-to-the-power-bi-service) to publish the report and create a custom embed code. 

## Option 4: Use the COVID-19 US Tracking template app

For one more option, the Power BI team created the COVID-19 US Tracking *template app* to get you started immediately. Template apps are bundles of reports, dashboards, and datasets for a specific data source. You download them from AppSource, use them or modify to suit your needs, and distribute them to your colleagues. 

This COVID-19 US Tracking template app contains a pre-built report of COVID-19 metrics that you can use as is, personalize directly in the Power BI service, or download to add other data sources if desired. Learn about installing the [COVID-19 US Tracking template app](../connect-data/service-connect-to-covid-19-tracking.md) and getting started right away.

## About the data source for this report
This interactive report aggregates data from the Centers for Disease Control and Prevention (CDC), and state- and local-level public health agencies. County-level data is confirmed by referencing state and local agencies directly (link).

Data is provided by USAFacts. Because of the frequency of data updates, they may not reflect the exact numbers reported by government organizations or the news media. For more information or to download the data, visit the [USAFacts website](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/). 

## Disclaimers

This report and data are provided "as is", "with all faults", and without warranty of any kind. Microsoft gives no express warranties or guarantees and expressly disclaims all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

USAFacts data is available under a Creative Commons license. To use it, cite USAFacts as the data provider and link back to USAFacts. For exact attribution steps, see the **#MadewithUSAFacts** section of the USAFacts page, [Coronavirus in the United States: Mapping the COVID-19 outbreak in the states and counties](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

Johns Hopkins University data is copyright 2020 Johns Hopkins University, all rights reserved. It's provided to the public strictly for educational and academic research purposes. Here are the full [Terms of Use](https://github.com/CSSEGISandData/COVID-19/blob/master/README.md) of the data shown in the mashup example. More information is available from the [Johns Hopkins University website](https://coronavirus.jhu.edu/map-faq.html).

## Next steps

[Get samples for Power BI](../create-reports/sample-datasets.md)




