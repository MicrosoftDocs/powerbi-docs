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
# Evaluation configuration settings, Power BI Desktop

Power BI Desktop optimizes query performance when importing data or when using DirectQuery by evaluating tables simultaneously. However, in specific situations, you might want to influence the behavior and change the defaults. Consider the following examples:

|Situation|Guidance|
|-|-|
|Data import is taking too long.|Increase maximum number of simultaneous evaluations and/or available memory per evaluation.|
|DirectQuery queries are slow to execute, not caused by limitations on the source system.|Increase maximum number of simultaneous evaluations and/or available memory per evaluation.|
|Power BI Desktop is taking too much of the machine's resources when importing data or executing DirectQuery queries.|Decrease maximum number of simultaneous and/or available memory per evaluation.|

Power BI offers two settings which impact the situations outlined above:

- Maximum number of simultaneous evaluations. This configures the level of parallelization for query execution in PowerQuery.
- Maximum memory used per simultaneous evaluation. This configures the available memory per evaluation.

## Maximum number of simultaneous evaluations

You can control the number of simultaneous evaluations and thereby influence the level of parallelization for query execution in PowerQuery. By default, the maximum number of simultaneous evaluations is equal to the number of logical CPU cores on the machine.
The minimum value is 1 and the maximum value is equivalent to the number of logical CPU cores on the machine.

## Maximum memory used per simultaneous evaluation

You can control the available memory per simultaneous evaluation. This setting configures the available memory per evaluation in MB and by default Power BI has a maximum memory allocation per evaluation of 432 MB.
The minimum value is 1 (recommended a minimum of 256) and the theoretical (but not recommended) maximum value is equal to a 100% of the RAM on the machine divided by the maximum number of simultaneous evaluations (set by the maximum number of simultaneous evaluations setting mentioned above). As a best practice we recommend never setting this value higher than 90% of the RAM on the machine.

## Changing configuration settings

Power BI offers two ways to change these settings:

- In Options in Power BI Desktop.
- By editing the registry.

## In Power BI Desktop

You can change these setting in the user interface in Power BI Desktop. On the **File** menu > **Options and settings** > **Options**, select **Data Load** under Global, then change the following settings under **Loading tables simultaneously**:

- Maximum number of simultaneous evaluations
- Maximum memory used per simultaneous evaluation (MB)

:::image type="content" source="media/desktop-evaluation-configuration/desktop-evaluation-configuration-settings.png" alt-text="Changing data loading parallelization settings in Power BI Desktop":::

## In registry settings
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
