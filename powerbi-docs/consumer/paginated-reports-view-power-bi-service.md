---
title: "View a paginated report in the Power BI service"
description: Learn how you can view a paginated report in the Power BI service that has parameters and then export it to  a different format.  
author: kfollis
ms.author: kfollis
ms.reviewer: nirusrin
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: View a paginated report
ms.topic: how-to
ms.date: 01/08/2024
---

# View a paginated report in the Power BI service

In this article, you learn about viewing a paginated report in the Power BI service. Paginated reports are reports created in Report Builder. They can be uploaded to any Power BI workspace.

Paginated reports have their own icon :::image type="icon" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-report-icon.png":::.

You can also export paginated reports to many formats:

- Microsoft Excel
- Microsoft Word
- Microsoft PowerPoint
- PDF (and [Accessible PDF, or PDF/UA](../report-server/rendering-extension-support.md))
- Comma-separated values
- XML
- Web archive (.mhtml)

## View a paginated report

1. Open the Power BI service, then select the paginated report in the workspace.

    :::image type="content" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-report-in-service.png" alt-text="Screenshot of the workspace in the Power BI service and a paginated report highlighted.":::

1. If the report has **Required** parameters, they won't appear when you first open it. Select **Parameters**, then select **View Report**. You see a notification of the fields required to open the report. You can change the parameters at any time.

    The following example shows a report with a parameter that requires you to select a month.

    :::image type="content" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-select-parameters.png" alt-text="Screenshot of the Parameters to view the report with the required field highlighted.":::

1. When you have a multiple-page report, use the page through feature. You can use the arrows at the top of the page or type a page number in the box. The following example shows where to find the page through feature.

    :::image type="content" source="media/paginated-reports-view-power-bi-service/paginated-report-page-through.png" alt-text="Screenshot of the Page through feature to view the report highlighted.":::

1. To **Search**, type all or part of the content you're looking for in the report. You're searching for the content across all the pages of the report.
   
    :::image type="content" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-report-search.png" alt-text="Screenshot of Search highlighted.":::

1. You can also sort by selecting the **sort** icon on the report. 
   
    :::image type="content" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-report-sort.png" alt-text="Screenshot of sort highlighted.":::

   > [!NOTE]
   > The report author may have limited sorting for reports created in Power BI Report Builder. You have to update sort in Power BI Report Builder to be able to sort on all columns on the Power BI service.  

1. To export your report to a different format, select **Export**. Then choose the format you want to use from the dropdown menu.

    :::image type="content" source="media/paginated-reports-view-power-bi-service/power-bi-paginated-export.png" alt-text="Screenshot the Export button highlighted, and the dropdown menu open.":::

## Considerations and limitations 

- You can only search and sort in "Web layout."
- Search doesn't work if there are over 300 rows per page.
- Sort:
  - You can only sort on one column at a time.
  - If a report was created in the service before December 2023, you have to edit the report for sorting to be available during consumption.

## Related content

- [Paginated reports in the Power BI service](end-user-paginated-report.md)
