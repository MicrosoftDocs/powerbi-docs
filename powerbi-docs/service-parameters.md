---
title: Edit parameter settings in the Power BI service
description: Query parameters are created in Power BI Desktop but can be reviewed and updated in Power BI service
author: mihart
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/21/2018
ms.author: mihart

LocalizationGroup: Create reports
---
# Edit parameter settings in the Power BI service
Report creators add query parameters to reports in Power BI Desktop. Parameters allow them to make parts of reports depend on one or more parameter *values*. For example, a report creator may create a parameter that restricts the data to a single country/region, or a parameter that defines acceptable formats for fields like dates, time, and text.

![Home tab showing Manage Parameters option in Desktop](media/service-parameters/power-bi-manage-parameters.png)

## Review and edit parameters in Power BI service

As a report creator, you define parameters in Desktop. When you [publish that report to Power BI service](desktop-upload-desktop-files.md), the parameter settings and selections travel with it. You can review and edit some parameter settings in the Power BI service -- not parameters that restrict the available data, but parameters that define and describe acceptable values.

1. In Power BI service, select the cog icon ![cog icon](media/service-parameters/power-bi-cog.png) to open **Settings**.

2. Select the tab for **Datasets** and highlight a dataset in the list. 
    
    ![Settings window with Datasets tab selected](media/service-parameters/power-bi-select-dataset2.png)

3. Expand **Parameters**.  If the selected dataset has no parameters, you'll see a message with a link to Learn more about query parameters. But if the dataset does have parameters, expanding the **Parameters** heading will reveal those parameters. 

    ![Settings window with Parameters expanded](media/service-parameters/power-bi-settings.png)

    Review the parameter settings and make changes if needed. Greyed out fields aren't editable. 


## Next steps
An ad-hoc way to add simple parameters is by [modifying the URL](service-url-filters.md).