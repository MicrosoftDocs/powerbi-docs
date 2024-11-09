---
title: Export paginated reports with Power Automate
description: Learn how to create Power Automate flows that automate the export and distribution of Power BI paginated reports.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 11/08/2024
LocalizationGroup: Get started
---
# Export Power BI paginated reports with Power Automate

With [Power Automate](/power-automate/getting-started), you can automate the export and distribution of Power BI paginated reports to supported formats and scenarios. In this article, you learn which templates you can use to build your own flows to export your paginated reports.  

Power Automate is a no-code way to interact with the Export To File API in the user interface. See the [connector reference article for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports) to start interacting with the API directly.

## Prerequisites  

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A4/P1 – A6/P3 SKUs. Read more about 
- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A4–A6 or P1/F2 and above SKU. Read more about reserved capacities in [Power BI Premium and Microsoft Fabric concepts - Microsoft Fabric | Microsoft Learn](../enterprise/service-premium-what-is.md).
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.

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

## Considerations and limitations

When you use Power Automate to export a paginated report that takes more than two minutes to download, the export fails due to the  Power Automate [outbound synchronous request](/power-automate/limits-and-config#timeout) limitation.

## Related content

- [Power BI export API for paginated reports](../developer/embedded/export-paginated-report.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
