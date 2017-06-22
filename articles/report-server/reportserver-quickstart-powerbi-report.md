<properties
    pageTitle="Quickstart: Create a Power BI report for Power BI Report Server"
   description="Learn how to create a Power BI report for Power BI Report Server in a few simple steps."
   services="powerbi" 
   documentationCenter="" 
   authors="maggiesMSFT" 
   manager="erikre" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/12/2017"
   ms.author="maggies"/>

# Quickstart: Create a Power BI report for Power BI Report Server

You can store and manage Power BI reports on premises in the Power BI Report Server web portal, just as you can in the Power BI service ([https://powerbi.com](https://powerbi.com)). You create and edit reports in Power BI Desktop, and then publish them to the web portal just the same. Then report readers in your organization can view them in a browser or in a Power BI mobile app on their mobile device.

![](media/reportserver-quickstart-powerbi-report/report-server-powerbi-report.png)

If you've already created Power BI reports in Power BI Desktop, then you're ready to create Power BI reports for Power BI Report Server. If not, here are four quick steps to get you started.

## Step 1: Install Power BI Desktop

You may already have installed Power BI Desktop to create reports for the Power BI service. We recommend installing the version of Power BI Desktop optimized for Power BI Report Server so you know the server and the app are always in sync. You can have both versions of Power BI Desktop on the same computer. See [Install Power BI Desktop optimized for Power BI Report Server](reportserver-install-powerbi-desktop.md) for details.

1. Select **New** > **Power BI Report**.

    ![](media/reportserver-getting-around/report-server-web-portal-new-powerbi-report.png)

    If you don't have the Power BI Desktop app installed already, it leads you through the installation process now.

2. At the end of the installation process, check **Start Power BI Desktop now**.

    It starts automatically and you're ready to go. 

3. If you're not familiar with Power BI Desktop, consider watching the videos on the welcome screen.

    ![](media/reportserver-getting-around/report-server-powerbi-desktop-start.png)

## Step 2: Select a data source

Currently, the only data source supported with Power BI Report Server is a live connection to a SQL Server Analysis Services (SSAS)tabular model or multidimensional cube. More data sources will be added in future releases. Read more about [connecting to data sources](reportserver-connect-data-sources.md).

1. From the welcome screen, select **Get Data**.

    Or on the **Home** tab, select **Get Data**.

2. Select **Analysis Services**.

    ![](media/reportserver-quickstart-powerbi-report/report-server-get-data-ssas.png)

3. Fill in **Server**, and optionally, **Database**.

    ![](media/reportserver-quickstart-powerbi-report/report-server-ssas-server-name.png)

4. Make sure **Connect live** is selected > **OK**.

    ![](media/reportserver-quickstart-powerbi-report/report-server-select-server.png)

## Step 3: Design your report

Here's the fun part: You get to create visuals that illustrate your data.

For example, you could create a funnel chart of customers and group values by yearly income.

![](media/reportserver-quickstart-powerbi-report/report-server-create-funnel.png)

1. In **Visualizations**, select **Funnel chart**.
2. Drag the field to be counted to the **Values** well. If it's not a numeric field, Power BI Desktop automatically makes it a *Count of* the value.
3. Drag the field to group on to the **Group** well.

## Step 4: Save your report to the report server

When your report is ready, you save it to Power BI Report Server.

1. On the **File** menu, select **Save as** > **Power BI Report Server**.

    ![](media/reportserver-quickstart-powerbi-report/report-server-save-as-powerbi-report-server.png)

2. Now you can view it in the browser.

    ![](media/reportserver-quickstart-powerbi-report/report-server-powerbi-report.png)

## Considerations and limitations

Reports in Power BI Report Server and in the Power BI service (http://powerbi.com) act almost exactly the same, but a few features are different.

### In a browser 
Power BI Report Server reports support all visualizations, including:

- Custom visuals

Power BI Report Server reports don’t support:

- R visuals
- ArcGIS maps
- Breadcrumbs

### In the Power BI mobile apps
Power BI Report Server reports support all the basic functionality in the [Power BI mobile apps](powerbi-power-bi-apps-for-mobile-devices.md), including:

- [Phone report layout](powerbi-desktop-create-phone-report.md): You can optimize a report for the Power BI mobile apps. On your mobile phone, optimized reports have a special icon, ![](media/reportserver-quickstart-powerbi-report/power-bi-rs-mobile-optimized-icon.png), and layout.

    ![](media/reportserver-quickstart-powerbi-report/power-bi-rs-mobile-optimized-report.png)

Power BI Report Server reports don’t support these features in the Power BI mobile apps:

- R visuals
- ArcGIS maps
- Custom visuals
- Breadcrumbs
- Geofiltering or bar codes

## Next steps

### Power BI Desktop
There are so many great resources for creating reports in Power BI Desktop. These links are a good starting point.

- [Get started with Power BI Desktop](powerbi-desktop-getting-started.md)
- Guided learning: [Getting started with Power BI Desktop](powerbi-learning-0-2-get-started-power-bi-desktop.md)

### Power BI Report Server

- [Install Power BI Desktop optimized for Power BI Report Server](reportserver-install-powerbi-desktop.md)  
- [Power BI Report Server user handbook](reportserver-user-handbook-overview.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)