---
title: Export Paginated Reports with Power Automate
description: Learn how to create Power Automate flows that automate the export and distribution of Power BI paginated reports.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: rauagarwal
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 07/23/2026
ai-usage: ai-assisted
LocalizationGroup: Get started
---
# Export Power BI paginated reports with Power Automate

With [Power Automate](/power-automate/getting-started), you can automate the export and distribution of Power BI paginated reports to supported formats and scenarios. In this article, you learn which templates you can use to build your own flows to export your paginated reports.  

Power Automate is a no-code way to interact with the Export To File API in the user interface. See the [connector reference article for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports) to start interacting with the API directly.

## Prerequisites  

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a Premium capacity (also known as reserved capacity). This capacity can be any of the A4–A6 or P1/F2 and above SKU. Read more about [Premium capacities](../enterprise/service-premium-what-is.md).
- Access to the standard connectors in Power Automate, which come with any Microsoft 365 subscription.

>[!NOTE]
>You can also follow along if you have a [Power BI Premium Per User (PPU) license](../enterprise/service-premium-per-user-faq.yml) but you're limited to one export within a five-minute window. 

## Create a flow from a template 

1. Go to [flow.microsoft.com](https://flow.microsoft.com/) and sign in to Power Automate. 
1. Select **Templates**, and search for **paginated reports**. 

    :::image type="content" source="media/service-automate-paginated-integration/power-bi-paginate-automate.png" alt-text="Screenshot that shows the Power Automate templates for Power BI paginated reports.":::

## Select a template 

Select a template from the following list to start the step-by-step walkthrough.  

- [Save a Power BI paginated report to OneDrive for work or school or a SharePoint Online folder](service-automate-paginated-onedrive-sharepoint.md).  
- [Export a Power BI paginated report for items in a SharePoint Online List, or for each row in an Excel Online table](service-automate-paginated-excel-sharepoint-list.md).
- [Save a Power BI paginated report to a local system folder](service-automate-paginated-local-file.md).

## Implement custom retry logic

When you use the Export to File API to export paginated reports through Power Automate - especially at scale, such as looping over many reports or parameter sets - a few simple habits go a long way toward building reliable, resilient flows. The guidance in this section helps your flows handle the occasional hiccup gracefully.

Every now and then, a report export briefly can't reach its underlying data source. This condition is normal and temporary in any cloud service. In most cases, a later attempt simply succeeds. By default, the export action uses an exponential retry policy, where the number of retries is based on your performance profile. For paginated report exports, this default often isn't enough on its own. The service can take a little while to recover, and the default attempts happen too close together to give it that time. For that reason, configure a longer retry policy:

- **Fixed interval** - Use a **fixed interval** policy with a **count of 5** and an **interval of PT5M** (5 minutes). The wider spacing gives the service enough time to recover, so the next attempt is far more likely to succeed, or
- **Exponential backoff** - Use a **count of at least 5**, with a **minimum interval of PT30S** and a **maximum interval of at least PT5M**. This spacing keeps attempts far enough apart to be effective.

> [!NOTE]
> Retries help with temporary failures only. If the *same* report fails every time, even after retrying, the cause is usually something specific to that report - such as an incorrect connection string, or a sign-in or permissions problem. In that case, fixing the underlying report or data source resolves the problem, whereas retrying doesn't.

## Considerations and limitations

When you use Power Automate to export a paginated report that takes more than two minutes to download, the export fails due to the  Power Automate [outbound synchronous request](/power-automate/limits-and-config#timeout) limitation.

## Additional notes

- Split very large exports into smaller batches. Reducing the size and memory footprint of each export improves both reliability and performance.
- Review the [performance and scalability considerations](../guidance/report-paginated-performance-scalability-considerations.md) for Paginated Reports.
- Power BI now supports [Dynamic per recipient subscriptions](../collaborate-share/dynamic-subscriptions.md) and sending large report subscriptions to [OneDrive SharePoint](paginated-reports-onedrive-sharepoint.md).

## Related content

- [Power BI export API for paginated reports](../developer/embedded/export-paginated-report.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
