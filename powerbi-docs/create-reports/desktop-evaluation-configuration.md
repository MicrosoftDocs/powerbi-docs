---
title: Evaluation configuration settings for Desktop
description: How to configure evaluation configuration settings for Desktop in the registry
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/18/2021
LocalizationGroup: Create reports
---
# Evaluation configuration settings

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

Power BI optimizes query performance when loading data, either by importing, or using DirectQuery and when interacting with data using reports. However, in specific situations, you might want to influence the behavior and change the defaults.

Power BI offers two groups of settings:
- [Settings to optimize PowerQuery query execution](#optimizing-powerquery-query-execution). These settings impact the speed and resources used when loading data into Power BI or when executing DirectQuery queries as part of the Data Transformation stage.
- [Settings to optimize Power BI engine query execution](#optimizing-power-bi-engine-performance). These settings influence performance after the Data Transformation stage is finished. 

Consider the following examples:

|Situation|Guidance|
|-|-|
|Data import is taking too long.|Increase maximum number of simultaneous evaluations and/or available memory per evaluation.
|DirectQuery queries are slow to execute, not caused by limitations on the source system.|Increase maximum number of simultaneous evaluations and/or available memory per evaluation.|
|Power BI is taking too much of the machine's resources when importing data or executing DirectQuery queries.|Decrease maximum number of simultaneous and/or available memory per evaluation.|
|DirectQuery queries are slow to execute, caused by limitations on the source system.|Decrease the maximum number of simultaneous evaluations and / or decrease the maximum number of active connections per source.|
|Power BI is responding to slowly when interaction with visuals|Increase the maximum number of concurrent jobs.|
|Power BI is taking too much of the machine's resources after data import or refresh has finished|Decrease the maximum number of concurrent jobs.|

## Optimizing PowerQuery query execution
This group of settings allow you to optimize the PowerQuery query execution performance. Power BI offers the following settings in this group:

- Maximum number of simultaneous evaluations. This configures the level of parallelization for query execution in PowerQuery.
- Maximum memory used per simultaneous evaluation. This configures the available memory per evaluation.

> [!NOTE]
> These settings only influence the PowerQuery query execution on your machine, not in the Power BI service.

### Maximum number of simultaneous evaluations

You can control the number of simultaneous evaluations and thereby influence the level of parallelization for query execution in PowerQuery. By default, the maximum number of simultaneous evaluations is equal to the number of logical CPU cores on the machine.
The minimum value is 1 and the maximum value is equivalent to the number of logical CPU cores on the machine.

> [!NOTE]
> This setting also impacts the [maximum number of concurrent jobs](#maximum-number-of-concurrent-jobs) executed by the Power BI engine. [Learn more about the interaction between these settings](#interaction-between-maximum-number-of-simultaneous-evaluations-and-maximum-number-of-parallel-jobs). 

### Maximum memory used per simultaneous evaluation

You can control the available memory per simultaneous evaluation. This setting configures the available memory per evaluation in MB and by default Power BI has a maximum memory allocation per evaluation of 432 MB.
The minimum value is 1 (recommended a minimum of 256) and the theoretical (but not recommended) maximum value is equal to a 100% of the RAM on the machine divided by the maximum number of simultaneous evaluations (set by the maximum number of simultaneous evaluations setting mentioned above). As a best practice we recommend never setting this value higher than 90% of the RAM on the machine.

### Changing PowerQuery query execution configuration settings

Power BI offers two ways to change these settings:

- In Options in Power BI Desktop.
- By editing the registry.

### In Power BI Desktop

You can change these settings in the user interface in Power BI Desktop. On the **File** menu > **Options and settings** > **Options**, select **Data Load** under Global, then change the following settings under **Parallel loading of tables**:

- Maximum number of simultaneous evaluations
- Maximum memory used per simultaneous evaluation (MB)

:::image type="content" source="media/desktop-evaluation-configuration/desktop-evaluation-configuration-settings.png" alt-text="Changing data loading parallelization settings in Power BI Desktop":::

### In registry settings
You can also change these settings by setting the appropriate DWORD registry values. Admins can also use this method to control the setting for their whole organization.

To change the number of evaluation containers set the DWORD registry value `ForegroundEvaluationContainerCount`.
To change the available memory per evaluation container set the DWORD registry value `MaxEvaluationWorkingSetInMB`. 

When changing these setting, please keep in mind the minimum and maximum values discussed above.

The keys mentioned above are in one of these folders, depending on your operating system:

```
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Microsoft Power BI Desktop
```

Or:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop
```

## Optimizing Power BI engine performance
This group of settings allow you to optimize the Power BI engine responsible for handling queries after the Data Transformation step has finished. Power BI offers the following settings in this group:

- Maximum number of active connections per source. This configures the number of parallel queries going to a DirectQuery source.
- Maximum number of concurrent jobs. This configures the level of parallelization when handling visual interactions and other evaluations after the Data Transformation step is completed.

> [!NOTE]
> These settings influence the Power BI engine performance on your machine as well as in the Power BI service after the report has been published.

### Maximum number of active connections per source

You can set the maximum number of connections DirectQuery opens for each underlying data source, which controls the number of queries concurrently sent to each data source. This setting is useful if Power BI Desktop is taking too much resources on your machine when using DirectQuery or if DirectQuery queries are slow to execute, caused by limitations on the source system.
For more information on this setting, see [Maximum number of connections option for DirectQuery](../connect-data/desktop-directquery-about.md#maximum-number-of-connections-option-for-directquery).

### Maximum number of concurrent jobs

You can control the maximum number of concurrent jobs executed by the Power BI engine. This setting allows you to optimize Power BI performance after the Data Transformation step has been completed.

The minimum value for this setting is 1, which would effectively disable parallel loading of tables. The default value for this setting is 6.

> [!NOTE]
> This setting is impacted by the [maximum number of simultaneous evaluations settings](#maximum-number-of-simultaneous-evaluations). [Learn more about the interaction between these settings](#interaction-between-maximum-number-of-simultaneous-evaluations-and-maximum-number-of-parallel-jobs). 

### Changing maximum number of concurrent jobs settings in Power BI Desktop

You can change this setting in the user interface in Power BI Desktop. On the **File** menu > **Options and settings** > **Options**, select **Data Load** under Current File, then choose your preferred setting under **Parallel loading of tables**. The following options are available:

- Default. This is the default selection and limits the maximum number of concurrent jobs to 6.
- One. This limits the maximum number of concurrent jobs to 1 and effectively disables parallel loading of tables.
- Custom. You can enter any positive number here to define your own maximum number of concurrent jobs.

:::image type="content" source="media/desktop-evaluation-configuration/desktop-evaluation-configuration-settings-concurrent-jobs.png" alt-text="Changing maximum number of concurrent jobs data loading parallelization settings in Power BI Desktop":::

## Interaction between maximum number of simultaneous evaluations and maximum number of parallel jobs
If you configure the maximum number of simultaneous evaluations to a higher number than the maximum number of concurrent jobs, then the Power BI engine will limit it's parallelization to the maximum number of concurrent jobs. If you configure the maximum number of simultaneous evaluations to a lower number than the maximum number of concurrent jobs, then the Power BI engine can start the maximum number of concurrent jobs, but only maximum number of simultaneous evaluations determines how many jobs get executed in parallel. The remaining jobs are queued waiting until one of the jobs completes. In this situation however, the evaluation of calculated columns, calculated tables and other Power BI engine items that do not rely on PowerQuery will not be restricted by the maximum number of simultaneous evaluations and can reach the maximum amount of parallel jobs as determined by the maximum number of concurrent jobs.