---
title: Reports in the Power BI service
description: Learn about the parts of a Power BI report, advantages of reports, and the difference between dashboards and reports.
author: mihart
ms.author: mihart
ms.reviewer: mihart
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: how-to
ms.date: 11/23/2022
LocalizationGroup: Reports
---

# Reports in Power BI

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yyn.md)]

A Power BI report is a multi-perspective view into a dataset, with visuals that represent findings and insights from that dataset. A report can have a single visual or many pages full of visuals. Depending on your job role, you might be someone who designs reports, or you might be a business user who consumes reports. This article is for business users.

## The parts of a report

![Screenshot showing the Sales and Marketing Sample report page.](./media/end-user-reports/power-bi-report.png)

A. This report has four pages (or tabs). You're viewing the **Sentiment** page.  
B. This page has five visuals and a page title.  
C. The **Filters** pane shows two filters applied to all report pages. To collapse the **Filters** pane, select the arrow (**>**).  
D. The Power BI banner shows the name of the report and the last updated date. Select the arrow to open a menu that shows the name of the report owner.  
E. The action bar contains actions you can take on this report. For example, you can add a comment, view a bookmark, or export data from the report. Select **More options** (...) to see a list of report functions.

If you're new to Power BI, read [Basic concepts for the Power BI service business users](end-user-basic-concepts.md) to get a good foundation. You can view, share, and annotate reports on mobile devices. For more information, see [Explore reports in the Power BI mobile apps](mobile/mobile-reports-in-the-mobile-apps.md).

## Advantages of reports

Power BI bases a report on a single dataset. Report designers create the visuals in a report to represent pieces of information. The visuals aren't static. They update as the underlying data changes. You can interact with the visuals and filters as you dig into the data to discover insights and find answers. Like a dashboard, a report is interactive and customizable. The extent of what you can do with a report depends on your role and the permissions the report designer assigns to you.

### Safely interact with content

As you explore and interact with your content by filtering, slicing, subscribing, and exporting, you can't corrupt the reports. Your work doesn't affect the underlying dataset or the original shared dashboards, reports, and apps.

> [!NOTE]
> You can't damage your data. The Power BI service is a great place for you to explore and experiment without worrying about breaking something.

### Save your changes or revert to the default settings

Your changes won't affect underlying data, but that doesn't mean you can't save your changes. You can, but those changes only affect your view of the content. To revert to the default view of the report, select the **Reset** icon.

:::image type="content" source="./media/end-user-reports/power-bi-reset.png" alt-text="Screenshot of the Revert to default icon.":::

## Dashboards versus reports

[Dashboards](end-user-dashboards.md) can be confused with reports because they're both canvases filled with visualizations, but there are major differences. The following table shows an overview of the different capabilities of dashboards and reports.

| **Capability** | **Dashboards** | **Reports** |
| --- | --- | --- |
| **Pages** | One page | One or more pages |
| **Data sources** | One or more report or dataset per dashboard |A single dataset per report |
| **Filtering** | No, you can't filter or slice | Yes, there are many ways to filter, highlight, and slice |
| **Set alerts** | Yes, you can create email alerts when certain conditions are met | No, you can't set alerts |
| **Featured** | Yes, you can set a featured dashboard | No, you can't set a featured report |
| **See underlying dataset tables and fields** | No, you can export data, but you can't see tables and fields in the dashboard itself |Yes, you can see dataset tables, fields, and values that you have permissions to see |
| **Customization** | No  | Yes, you can filter, export, view related content, add bookmarks, generate QR codes, and analyze in Excel |

<!--| Available in Power BI Desktop |No |Yes, can create and view reports in Desktop |
| Pinning |Can pin existing visuals (tiles) only from current dashboard to your other dashboards |Can pin visuals (as tiles) to any of your dashboards. Can pin entire report pages to any of your dashboards. | -->

## Report designers and report users

If you're a designer, you create reports for your own use or to share with colleagues.

If you're a business user, you receive reports from others. The following resources are for business users:

* Start with a [tour of the Power BI service](end-user-basic-concepts.md), so you know where to find reports and report tools.
* Learn how to [open a report](end-user-report-open.md) and all the [interactions available to business users](end-user-reading-view.md).
* Get comfortable with reports by taking a tour of a [sample](../create-reports/sample-tutorial-connect-to-the-samples.md).  
* To see which dataset the report is using and which dashboards are showing visuals from the report, see [View related content in the Power BI service](end-user-related.md).

> [!TIP]
> If you didn't find what you're looking for here, use the table of contents on this page to browse more articles.

## Next steps

[Open and view a report](end-user-report-open.md)  
[Dashboards in the Power BI service](end-user-dashboards.md)