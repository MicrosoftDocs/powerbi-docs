---
title: Power BI Desktop diagnostics collection
description: How to collect Power BI Desktop diagnostics information
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 05/27/2021
LocalizationGroup: Get started
---
# Power BI Desktop diagnostics collection

To provide better supportability and diagnostics, Power BI Desktop can collect and submit diagnostics information. The process of collecting and sending Power BI diagnostics information has been simplified, and is easy to use. You should only save diagnostics details when instructed to do so by Microsoft Support. Power BI Desktop diagnostics can be collected beginning with the April 2021 release of Power BI Desktop.

## How to save diagnostics details in Power BI Desktop

To save diagnostics information in Power BI Desktop, follow these steps:

1. In Power BI Desktop, select **File > Options and settings > Options**
2. Under **Global**, select **Diagnostics**
3. Select **Enable tracing**
4. Select **Collect diagnostic information.**

    :::image type="content" source="media/desktop-diagnostics/desktop-diagnostics-01.png" alt-text="Screenshot of where to enable diagnostics":::

5. When you select **Collect diagnostic information**, the following dialog appears:

    :::image type="content" source="media/desktop-diagnostics/desktop-diagnostics-02.png" alt-text="Screenshot of save diagnostics information":::

Review the information provided in the dialog. To learn more about the information collected, see the [Diagnostic information collected](#diagnostic-information-collected) section in this article.

By default, the diagnostic details are saved in your **Documents** folder. Select the **Browse** button to navigate to and select another location.

When satisfied with where Power BI Desktop should save the diagnostic information, select **Save** to save the diagnostic details and close the dialog. Your diagnostic details are stored in a **PBIDesktopDiagnosticInfo.[timestamp].zip** file in the location you specified.

The diagnostics ZIP file may contain the following files and directories, based on what happened on your machine and on your settings:

- **ErrorsInfo.yaml** - contains [details about the error that occurred](#details-about-the-error-that-occurred) and gets created only if an error dialog was shown.
- **PackagingErrorsInfo.yaml** - contains information about errors that have occurred while collecting the telemetry (if any).
- **AnalysisServicesInfo.trc** - contains information [about the performance of your data model](#performance-of-your-data-model).
- **SessionDeviceInfo.txt** - contains [session and device information](#session-and-device-information).
- **AutoPageRefresh.json** - contains [the data refresh settings](#data-refresh-settings).
- **CSDL.xml** - describes the [structure of the data model](#structure-of-your-data-model).
- **DataModelSchema.json** - describes the [structure of the data model](#structure-of-your-data-model).
- **Traces/ folder and files** - contains additional [session and device information](#session-and-device-information).

:::image type="content" source="media/desktop-diagnostics/desktop-diagnostics-03.png" alt-text="Screenshot of example zip file contents created by diagnostics":::

If requested by Microsoft support, send the compressed folder (the zip file) containing the diagnostic details to Microsoft.

The following video shows the diagnostics collection process:

> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWDX8S]


## Diagnostic information collected

The diagnostic information collected is comprehensive and covers the information most commonly required to solve issues. Power BI Desktop collects information about:

- the performance of your data model
- the current Power BI Desktop session and your device
- the error that occurred
- structure of your data model
- data refresh settings

The following sections provide more detail about the information collected.

### Performance of your data model

The data model performance information helps us analyze the interaction between the Power BI engine and data sources. It's especially relevant in situations where you are experiencing:

- issues with model performance
- DirectQuery issues
- Aggregation issues

The following information is included:

- The locale of your Power BI Desktop environment
- Power BI Desktop version
- The path where the currently open PBIX and data model are stored on your machine
- Whether your data model is in import, DirectQuery or a mixed mode
- Any queries created to generate visuals, including table, column, measure names and data values if used as a filter

### Session and device information

The session and device information provides insight to the complexity of the queries and features used. It includes information about:

- Operating system, including version, time zone configuration
- Hardware, including memory configuration
- Power BI Desktop version
- Power BI Desktop configuration, such as whether fast combine is enabled
- The path to where the trace logs are stored on your local machine
- Data model default mode (import, DirectQuery, or a mixed mode)
- Data model metadata version
- Which preview features are enabled / disabled
- Any DirectQuery options that are set
- The name of the cloud environment (tenant) you are logged into (if any)
- Power Query queries

Session and device information is especially relevant if you are experiencing:

- Issues with report and Power Query performance
- Issues where Power BI Desktop stops responding, stops unexpectedly or does not load properly

### Details about the error that occurred

Error information includes exactly which error occurred and where in our code it happened. It also includes a link to where the trace logs are stored on your local machine. It also includes the following:

- Data model default mode (import, DirectQuery, or a mixed mode)
- Data model metadata version
- Which preview features are enabled / disabled in Power BI Desktop
- The name of the cloud environment (tenant) you are logged into (if any)
- The recent actions you did, such as adding a field to a visual.
- Power Query queries

Error information is especially relevant if you are experiencing:

- Issues with report and Power Query performance
- Issues where Power BI Desktop stops responding, stops unexpectedly or does not load properly

### Structure of your data model

The information collected is a text description of everything you can see in the data model view in Power BI Desktop, including:

- Table information, including name, number of rows
- Column information, including name, data types, number of distinct values, minimum and maximum values
- Relationships, including to/from which table and column, direction, cardinality and other settings
- Calculated columns definitions
- Measure definitions
- Role definitions

Data model structure information is especially relevant if you are experiencing:

- Issues with model performance
- Issues with modeling in general

### Data refresh settings

Data refresh information helps us analyze issues with incremental refresh, aggregations, and automatic page refresh. It describes the incremental refresh settings made (including table names), any aggregations defined (including table and column names).

Data refresh information is especially relevant if you are experiencing:

- Issues with incremental and automatic page refresh
- Issues with aggregations, including performance issues.


## Next steps

You can do all sorts of things with Power BI Desktop. For more information on its capabilities, check out the following resources:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](../connect-data/desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
