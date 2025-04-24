---
title: Monitor usage of Power BI semantic models in Excel  
description: If you are a Power BI administrator, you might want to track who is connecting to your organization's Power BI data from Excel to ensure there's no unauthorized access to the data.
author: kfollis
ms.author: kfollis
ms.reviewer: ikedeagu
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: conceptual
ms.date: 02/07/2023
LocalizationGroup: Share your work
---
# Monitor usage of Power BI semantic models in Excel

If you are a Power BI administrator, you might want to track who is connecting to your organization's Power BI data from Excel to ensure there's no unauthorized access to the data. The Power BI activity logs allows you to monitor the usage of Power BI semantic models and improve your organization's data governance or meet regulatory compliance requirements (where applicable). 

## Identify users connected to semantic models from Excel

To identify users connecting to Power BI semantic models from Excel desktop or Excel for the web, do the following steps.

1. Open PowerShell.

2. Run the [Get-PowerBIActivityEvent](../admin/service-admin-auditing.md#get-powerbiactivityevent-cmdlet) cmdlet to download event data for the **AnalyzedByExternalApplication** activity. The **AnalyzedByExternalApplication** activity identifies users who interact with semantic models published to the Power BI service from an external application. Here's a sample cmdlet for a day's activity data: 

    ```powershell
    Get-PowerBIActivityEvent - StartDateTime '2022-03-15T00:00:00' -EndDateTime '2022-03-15T23:59:59' -ActivityType 'AnalyzedByExternalApplication' 
    ```

    :::image type="content" source="media/service-monitor-usage-power-bi-datasets-excel/power-bi-audit-logs-excel.png" alt-text="Screenshot of PowerShell Get-PowerBIActivityEvent cmdlet.":::

## Related content

- [Create Excel workbooks with refreshable Power BI data](service-analyze-in-excel.md)
- [Design refreshable reports in Excel with Power BI data](service-analyze-power-bi-datasets-excel.md)
- Read about [using Excel data types from Power BI](https://support.office.com/article/use-excel-data-types-from-power-bi-preview-cd8938ce-f963-444d-b82a-7140848241e9) in the Excel documentation.
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
