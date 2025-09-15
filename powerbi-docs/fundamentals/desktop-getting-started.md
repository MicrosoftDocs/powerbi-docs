---
title: Get started with Power BI Desktop
description: Get started with Power BI Desktop.
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: tutorial
ms.date: 09/15/2025
LocalizationGroup: Get started
ai-usage: ai-assisted
ms.custom:
  - intro-get-started
  - sfi-image-nochange
---

# Get started with Power BI Desktop

Welcome! If you're new to Power BI, you're in the right place. This tutorial will walk you through the basics of using Power BI Desktop—from installing the app to building your first report. Whether you're working with Excel data or exploring other sources, this guide is designed to meet you at your current level and help you build confidence step by step.

## What is Power BI Desktop?

Power BI Desktop is a free Windows application that lets you connect to data, transform it, and create interactive visual reports. It’s part of the Power BI suite, which also includes the Power BI service (online) where you can publish and share your reports.

With Power BI Desktop, you can:

- Import data from Excel, databases, web sources, and more
- Clean and shape your data using Power Query
- Build visuals like charts, maps, and tables
- Publish your reports to the Power BI service for sharing

## Install Power BI Desktop

To get started, you need to install Power BI Desktop on your computer:

1. You can install it from the **Microsoft Store** (recommended for automatic updates), or download it directly from the [Power BI Desktop download page](https://powerbi.microsoft.com/desktop).
1. Choose the version that matches your system (32-bit or 64-bit) if downloading manually.
1. Download and run the installer.
1. Follow the prompts to complete the installation.

Once installed, launch Power BI Desktop from your Start menu or desktop.

## Explore the Power BI Desktop interface

When you open Power BI Desktop, you’ll see a user-friendly interface designed to help you build reports efficiently:

- **Ribbon**: Contains tabs like **Home**, **Insert**, and **Modeling** with tools for data and visuals.
- **Report canvas**: The main area where you build and arrange your visuals.
- **Fields pane**: Shows the tables and fields from your data model.
- **Visualizations pane**: Lets you choose and customize chart types.

Spend a moment exploring the layout—it’s designed to be intuitive and flexible.

## Connect Power BI to Excel

Many users start with Excel data, and Power BI makes it easy to bring that data into your reports. Here's how:

To import data from Excel into Power BI Desktop:

1. Open Power BI Desktop.
1. Select **Home > Get Data > Excel**.
1. Browse to your Excel file and select **Open**.
1. In the Navigator pane, select the worksheet or table you want to import.
1. Select **Load** to bring the data into Power BI.

This allows you to build reports and visualizations using your Excel data.

To analyze Power BI data in Excel:

If you want to go the other way—using Excel to analyze Power BI data—you can use the **Analyze in Excel** feature:

1. In the Power BI service (https://app.powerbi.com), open your report or dataset.
1. Select **More options (...) > Analyze in Excel**.
1. Power BI will generate an Excel file with a live connection to your dataset.
1. Open the file in Excel and use PivotTables to explore your data.

This method keeps your Excel workbook connected to Power BI, so your data stays up to date.

## Transform and clean your data

Once your data is loaded, you may need to clean or reshape it before building visuals. Power BI uses Power Query for this:

1. Select **Transform Data** to open Power Query Editor.
1. Use tools like:
   - **Remove Columns** to eliminate unnecessary data
   - **Filter Rows** to focus on specific values
   - **Change Data Type** to ensure fields are correctly formatted
1. When you're done, select **Close & Apply** to save your changes and return to the main view.

Cleaning your data ensures your visuals are accurate and meaningful.

## Create your first visualizations

Now it’s time to bring your data to life with visuals:

1. In the **Fields** pane, check the boxes next to the data you want to visualize.
1. Power BI will automatically create a visual based on your selection.
1. Use the **Visualizations** pane to change the visual type (e.g., bar chart, pie chart, map).
1. Drag fields into the **Values**, **Axis**, or **Legend** areas to customize your visual.

You can add multiple visuals to the canvas and arrange them to tell a compelling story.

## Add insights with AI (optional)

Power BI includes built-in AI features that help you explore your data more deeply:

- **Q&A**: Ask natural language questions like “What were sales by region?” and get instant visuals.
- **Smart Narratives**: Automatically generate text summaries that explain trends and key points in your visuals.

These tools are optional but powerful—especially when presenting to others.

## Save and publish your report

Once your report is ready:

1. Save it locally using **File > Save**.
1. To share it, select **Publish** on the Home ribbon.
1. Sign in to the Power BI service.
1. Choose a workspace to publish your report.

After publishing, you can:

- Share your report with colleagues
- Embed it in dashboards
- Schedule data refreshes to keep it up to date

Whether you're analyzing sales, tracking performance, or exploring trends, Power BI gives you the tools to turn data into insights.

## Related content

Power BI Desktop supports connecting to a diagnostics port. The diagnostics port allows other tools to connect to and perform traces for diagnostic purposes. When you're using the diagnostics port, *making any changes to the model isn't supported. Changes to the model may lead to corruption and data loss.*

For more information on the many capabilities of Power BI Desktop, check out the following resources:

- [Query overview in Power BI Desktop](../transform-model/desktop-query-overview.md)
- [Data sources in Power BI Desktop](../connect-data/desktop-data-sources.md)
- [Connect to data in Power BI Desktop](../connect-data/desktop-connect-to-data.md)
- [Tutorial: Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
- [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
