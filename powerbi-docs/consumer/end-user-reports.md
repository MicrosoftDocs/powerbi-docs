---
title: Reports in the Power BI Service
description: Learn about the parts of a Power BI report, advantages of reports, and the difference between dashboards and reports.
author: julcsc
ms.author: juliacawthra
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: pbi-explore
ms.search.form: Get started with reports
ms.topic: how-to
ms.date: 10/01/2025
LocalizationGroup: Reports
---

# Reports in Power BI

[!INCLUDE[consumer-appliesto-yynn](../includes/consumer-appliesto-yyn.md)]

A Power BI report is a multiperspective view into a semantic model, with visuals that represent findings and insights from that semantic model. A report can have a single visual or many pages of visuals. Depending on your job role, you might be someone who designs reports, or a business user who consumes reports. This article is for business users.

## The parts of a report

:::image type="content" source="./media/end-user-reports/power-bi-numbered-report.png" alt-text="Screenshot showing the Sales and Marketing Sample report page." lightbox="./media/end-user-reports/power-bi-numbered-report.png#lightbox":::

A. This report has six pages (or tabs). The example shows the **Sentiment** page.  
B. This page has five visuals and a page title.  
C. The **Filters** pane shows all applied filters. To collapse the **Filters** pane, select the arrow (**>**).  
D. The Power BI banner shows the report's title and sensitivity label. Select the title to open a menu that shows the report location, date it was last updated, and contact information for the report creator.  
E. The action bar contains links to numerous actions you can take on this report. Some actions require extra permissions. For example, based on your permissions, you might be able to edit, subscribe, and share the report. All users can add a comment, view a bookmark, or generate automatic insights. Select **More options** (**...**) to see the full list of report actions.

If you're new to Power BI, read [Basics of the Power BI service](../fundamentals/service-basic-concepts.md) to get a good foundation. You can view, share, and annotate reports on mobile devices. For more information, see [Explore reports in the Power BI mobile apps](mobile/mobile-reports-in-the-mobile-apps.md).

## Advantages of reports

Power BI bases a report on a single semantic model. Report designers create the visuals in a report to represent pieces of information. Presenting data as visuals makes it easier to grasp the meaning of what you're seeing. Also, the visuals aren't static; they update as the underlying data changes. The designers do the prework, adding visuals that they believe are interesting, but you get to explore and dig deeper. You can interact with the visuals and filters as you dig into the data to discover insights and find answers. The extent of what you can do with a report depends on your role and the permissions the report designer assigns to you.

## Safely interact with content

As you explore and interact with your content by filtering, slicing, subscribing, and exporting, you can't corrupt the reports. Your work doesn't affect the underlying semantic model or the original shared dashboards, reports, and apps.

> [!NOTE]
> You can't damage your data. The Power BI service is a great place for you to explore and experiment without worrying about breaking something.

## Save your changes or revert to the default settings

Your changes don't affect underlying data, but that doesn't mean you can't save your changes. You can, but those changes only affect your view of the content. To revert to the report's default view, select the **Reset** icon.

:::image type="content" source="./media/end-user-reports/power-bi-reset.png" alt-text="Screenshot of the Reset to default icon.":::

## Dashboards versus reports

It's easy to confuse [dashboards](end-user-dashboards.md) with reports because they're both canvases filled with visualizations, but there are major differences. The following table shows an overview of the different capabilities of dashboards and reports:

| **Capability** | **Dashboards** | **Reports** |
| --- | --- | --- |
| **Pages** | One page | One or more pages |
| **Data sources** | One or more report or semantic model per dashboard |A single semantic model per report |
| **Filtering** | No, you can't filter or slice | Yes, there are many ways to filter, highlight, and slice |
| **Can see underlying semantic model tables and fields** |No; can export data, but can't see the semantic model tables and fields in the dashboard itself |Yes; can see semantic model tables and fields and values that you have permissions to see |
| **Customization** | No  | Yes; depending on your permissions you can cross-filter, change visual type, apply design features, add bookmarks and comments, generate QR codes, analyze in Excel, and much more |
| **Pinning** |Can pin existing visuals (tiles) only from current dashboard to your other dashboards |Can pin visuals (as tiles) and entire report pages to any of your dashboards |

<!--| Available in Power BI Desktop |No |Yes, can create and view reports in Desktop |
 -->

## Related content

Depending on your role, you might be a *designer*, someone who creates reports for your own use or to share with colleagues. You want to learn how to create and share reports.

Or you might be a *business user*, someone who receives reports from others. You want to learn how to understand and interact with the reports. If you're a report *business user*, these links are for you:

* Start with a [tour of the Power BI service](end-user-experience.md) so you know where to find reports and report tools.
* Learn the [basics of the Power BI service](../fundamentals/service-basic-concepts.md).
* Learn how to [open a report](end-user-report-open.md) and all the [interactions available to business users](end-user-reading-view.md).
* Get comfortable with reports by taking a tour of a [sample](../create-reports/sample-tutorial-connect-to-the-samples.md).  
* Explore [Dashboards in the Power BI service](end-user-dashboards.md).  
* See which semantic model the report is using and which dashboards are showing visuals from the report: [See related content in the Power BI service](end-user-related.md).

> [!TIP]
> If you didn't find what you're looking for here, use the table of contents on this page to browse more articles.
