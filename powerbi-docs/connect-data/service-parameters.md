---
title: Edit parameter settings in the Power BI service
description: Query parameters are created in Power BI Desktop but can be reviewed and updated in Power BI service
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 06/17/2021
LocalizationGroup: Create reports
---
# Edit parameter settings in the Power BI service
Report creators add query parameters to reports in Power BI Desktop. Parameters allow them to make parts of reports depend on one or more parameter *values*. For example, a report creator may create a parameter that restricts the data to a single country/region, or a parameter that defines acceptable formats for fields like dates, time, and text.

![Home tab showing Manage Parameters option in Desktop](media/service-parameters/power-bi-manage-parameters.png)

## Review and edit parameters in Power BI service

As a report creator, you define parameters in Power BI Desktop. When you [publish that report to the Power BI service](../create-reports/desktop-upload-desktop-files.md), the parameter settings and selections travel with it. You can review and edit parameter settings in the Power BI service, but not create them.

1. In the Power BI service, select the cog icon to open **Settings**.

   ![cog icon](media/service-parameters/power-bi-cog.png)

2. Select the tab for **Datasets** and highlight a dataset in the list. 
    
    ![Settings window with Datasets tab selected](media/service-parameters/power-bi-select-dataset2.png)

3. Expand **Parameters**.  If the selected dataset has no parameters, you see a message with a link to Learn more about query parameters. If the dataset does have parameters, expand the **Parameters** heading to reveal those parameters. 

    ![Settings window with Parameters expanded](media/service-parameters/power-bi-settings.png)

    Review the parameter settings and make changes if needed.

## Considerations and limitations

Grayed-out fields aren't editable. "Any" or "Binary" type parameters work in Power BI Desktop, but we currently don't support them in the service, for security reasons.

## Next steps
An ad-hoc way to add simple parameters is by [modifying the URL](../collaborate-share/service-url-filters.md).
