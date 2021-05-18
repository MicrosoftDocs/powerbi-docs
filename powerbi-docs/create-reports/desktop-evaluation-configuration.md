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

Power BI Desktop leverages multi-threading technology to optimize query performance when importing data or when using DirectQuery. However, in specific situations, you might want to influence the behavior and change the defaults. Consider the following examples:

|Situation|Guidance|
|-|-|
|Data import is taking too long.|Increase parallelization and/or available memory.|
|DirectQuery queries are slow to execute, not caused by limitations on the source system.|Increase parallelization and/or available memory.|
|Power BI Desktop is taking too much of the machine's resources when importing data or executing DirectQuery queries.|Decrease parallelization and/or available memory.|

Power BI offers two registry settings to configure these settings. Both of them impact the situations outlined above:

- Number of evaluation containers. This configures the level of parallelization for query execution in PowerQuery.
- Available memory per evaluation container. This configures the available memory per evaluation container.

## Number of evaluation containers

You can control the number of evaluation containers and thereby influence the level of parallelization for query execution in PowerQuery by setting the DWORD registry value `ForegroundEvaluationContainerCount`.

Set the DWORD registry value `ForegroundEvaluationContainerCount` in the Power BI Desktop registry key. By default, Power BI Desktop creates a maximum of 20 evaluation containers.
The minimum value is 1 and the maximum value is equivalent to the number of CPU cores on the machine.

## Available memory per evaluation container

You can control the available memory per evaluation container by setting the DWORD registry value `MaxEvaluationWorkingSetInMB`. This setting configures the available memory per evaluation container in MB and by default Power BI has a maximum memory allocation per evaluation container of 432 MB.
The minimum value is 1 (recommended a minimum of 256) and the theoretical (but not recommended) maximum value is equal to a 100% of the RAM on the machine divided by the number of evaluation containers (set by `ForegroundEvaluationContainerCount`). As a best practice we recommend never setting this value higher than 90% of the RAM on the machine.

## Location of keys in registry

The keys mentioned above are in one of these folders, depending on your operating system:

```
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Microsoft Power BI Desktop
```

Or:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Desktop
```
