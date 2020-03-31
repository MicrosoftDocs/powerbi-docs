---
title: COVID-19 tracking sample for US state and local governments
description: Download and modify the sample report with US state and local data for the COVID-19 pandemic.
author: LukaszPawlowski-MS
ms.reviewer: 
ms.custom:
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/27/2020
ms.author: lukaszp

LocalizationGroup: Samples
---
# COVID-19 tracking sample for US state and local governments

The COVID-19 tracking sample for US state and local governments enables organizations to use a standard dashboard or customize it to their needs. Using Power BI Desktop, they can analyze and visualize COVID-19 data at the city, county, state, and national levels. Then using Power BI Publish to Web, they can share the report publicly to inform citizens. The article offers three different ways to use Power BI interactive visualizations in your own public story, blog, or website.

This article covers how to:

- Copy embed code and put it on your own site. 
- Download the Power BI file.
- Download Power BI Desktop.
- Make customizations such as formatting a specific state.
- Publish to the Power BI service.
- Publish to the web. 
- Mash up this data with data from another source. 

## Prerequisites

Before you can get started using Power BI to tell your story, complete these prerequisites:

- Download the free [Power BI Desktop](https://powerbi.microsoft.com/desktop/) app.
- Sign up for the [Power BI service](https://powerbi.microsoft.com/get-started/).

## Option 1: Pre-built publish to web embed code

Microsoft has published the sample report and created an embed code. You can use the embed code to embed the complete sample including the national view and drill down to the state and county level in your own website.

To include the interactive graphic on your site, copy and paste the following embed code to where you would like the graphic to show up on your web page.  

`<iframe width="800" height="600" src="https://app.powerbi.com/view?r=eyJrIjoiMmI2ZjExMzItZTcwNy00YmUwLWFlMTAtYTUxYzVjODZmYjA5IiwidCI6ImMxMzZlZWMwLWZlOTItNDVlMC1iZWFlLTQ2OTg0OTczZTIzMiIsImMiOjF9" frameborder="0" allowFullScreen="true"></iframe>`

The embed code is an HTML iFrame element that you can insert into any HTML page. Adjust the width and height of the iFrame provided to fit within your site. The sample report is authored at 16:9 proportions, so pick a size that preserves this dimension. When implemented correctly, the graphic appears without any extra grey borders. It is useful to [review the iFrame sizing tips and tricks](https://docs.microsoft.com/power-bi/service-publish-to-web#tips-and-tricks-for-iframe-height-and-width) when making these changes.

## Option 2: Customize the sample Power BI file

A Power BI file contains the data and interactive graphic in a .pbix file format you can edit in Power BI Desktop.  

A typical customization is to filter the report to a specific state, and then to create your own Publish to web embed code for your customized report.

USAFacts data is provided under a Creative Commons License that requires attribution. Before publishing this data, review the [disclaimers](#disclaimers).

To get started, [download the .pbix file (here)](https://go.microsoft.com/fwlink/?linkid=2125058).

### Update your report 

1. Download the latest version of the free app, [Power BI Desktop](https://powerbi.microsoft.com/desktop/), if you haven't already. 

2. Download [the .pbix file](https://go.microsoft.com/fwlink/?linkid=2125058) and open it in Power BI Desktop.

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

Once your report is customized to your liking, [follow the steps outlined here to publish your report to the Power BI service](https://docs.microsoft.com/power-bi/desktop-upload-desktop-files).

### Configure scheduled refresh

To keep the data in the report up-to-date, you can [configure scheduled refresh after you published your report](https://docs.microsoft.com/power-bi/refresh-scheduled-refresh).

When you follow the steps, choose the following options:
1. Data Source Credentials Authentication Method: Anonymous
2. Privacy level setting for this data source: Public

To test your refresh setting, use the [Refresh now option available from the dataset item] (https://docs.microsoft.com/en-us/power-bi/refresh-data#data-refresh).

The data will be loaded each time the schedule runs. Be aware that the underlying data is provided by USAFacts and may not update as frequently as the refresh schedule. Check the [USAFacts website](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/) to know when the underlying data last updated. 

If you intend to publish the customized report on your website, it is best to configure your scheduled refresh to run at least as frequently as the USAFacts data updates. Since USAFacts may refresh their data at different times each day, you may want to configure several refreshes each day. 

### Create a Publish to web embed code 

To embed your customized report in your own website, follow the [instructions for how to create your own Publish to web embed code](https://docs.microsoft.com/en-us/power-bi/service-publish-to-web#how-to-use-publish-to-web).

Once you publish your embed code, you use the iFrame on the confirmation dialog to embed in your website.

If you make change to the report in Power BI Desktop, you can publish and replace the existing report in the Power BI serivce. The embed code won't change. It will take approximately 1 hours for changes to the report or refreshed data to appear on your website. 


## Option 3: Mash up data from another source 

You can also mash up the data in this report with data from another source. The following example is based on data from [Johns Hopkins University](https://github.com/CSSEGISandData/COVID-19). Before publishing this data, we recommend reviewing the [disclaimers](#disclaimers) in this article.

1. Select **Get Data** > **Web**.

    :::image type="content" source="media/sample-covid-19-us/power-bi-desktop-get-data.png" alt-text="Get data button":::

2. Enter the following URL
 
    `https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv` 

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-from-web.png" alt-text="Select data from web":::

3. Select **OK**. 

    > [!NOTE]
    > The link published by Johns Hopkins University can be changed. Please check the [Johns Hopkins GitHub page](https://github.com/CSSEGISandData/COVID-19) for the latest information.

4. Select **Load** to load the dataset for total confirmed cases worldwide.  

    :::image type="content" source="media/sample-covid-19-us/power-bi-covid-19-load-data.png" alt-text="Load data from web":::

    This article, [Connect to webpages from Power BI Desktop](../desktop-connect-to-web.md), provides more information about loading data from the web.
    
You can then use Power BI Desktop to visualize the data. Lastly, you can use the steps in option #2 to publish the report to the Power BI service and create a custom embed code to. 


## About the data source for this report
This interactive feature aggregates data from the Centers for Disease Control and Prevention (CDC), state- and local-level public health agencies. County-level data is confirmed by referencing state and local agencies directly (link).

Data provided by USAFacts. Because of the frequency of data upates, they may not reflect the exact numbers reported by government organizations or the news media. For more information or to download the data, please visit the [USAFacts website](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/). 

## Disclaimers

This report and data are provided "as is", "with all faults", and without warranty of any kind. Microsoft gives no express warranties or guarantees and expressly disclaims all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

USAFacts data is available under a Creative Commons license. To use it, cite USAFacts as the data provider and link back to USAFacts. For exact attribution steps please see [#MadewithUSAFacts section in this page](https://usafacts.org/visualizations/coronavirus-covid-19-spread-map/).

Johns Hopkins University data is copyright 2020 Johns Hopkins University, all rights reserved, is provided to the public strictly for educational and academic research purposes. The full [Terms of Use of the data shown in the mashup example are here](https://github.com/CSSEGISandData/COVID-19/blob/master/README.md). More information is available from [Johns Hopkins University's website](https://coronavirus.jhu.edu/map-faq.html).

## Next steps

[Get samples for Power BI](../sample-datasets.md)