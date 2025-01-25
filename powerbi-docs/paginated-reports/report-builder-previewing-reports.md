---
title: "Preview reports in Power BI Report Builder"
description: While you're creating a Report Builder paginated report, it's helpful to preview the report often to verify that the report displays what you want.
author: kfollis
ms.author: kfollis
ms.date: 12/18/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
ms.assetid: ba6b5bdd-d8c6-4aa8-ba32-3a10b11969d4
---
# Preview reports in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)]

While you're creating a Report Builder paginated report, it's helpful to preview the report often to verify that the report displays what you want.

To preview your report, select **Run**.

:::image type="content" source="media/report-builder-previewing/paginated-run-button-preview.png" alt-text="Screenshot showing the Run button in Report Builder.":::

The report renders in preview mode.

:::image type="content" source="media/report-builder-previewing/paginated-report-preview.png" alt-text="Screenshot showing preview of paginated report in Report Builder.":::

> [!NOTE]  
> There are some differences between previewing in Report Builder and viewing in a browser. For example, a calendar control, which is added to a report when you specify a Date/Time type parameter, is different in Report Builder and in a browser.

## Concurrency of report updates
Frequently, you preview a report as a step in updating and then saving a report to the Power BI service. When you are updating a report, it's possible that someone else is updating and then saving the report at the same time. The report that is saved last is the version of report that is available for future viewing and updating. This means that the version of the report that you previewed might not be the version you reopen. You have the option to save the report with a new name by using the **Save As** option on the Report Builder menu.  
  
## External report items
 Your report might include items such as external images that are stored separately from the report. Because the items are stored separately it's possible that they can be moved to a different location or be deleted. If this happens, your report could fail to preview. You can either update the report to indicate the updated location of the item or if the item was deleted, replace it with an existing item, or remove the reference to the item it from the report.
  
## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)
- [Data retrieval guidance for paginated reports](../guidance/report-paginated-data-retrieval.md)
