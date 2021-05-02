---
title: Save a paginated report to OneDrive for Business or SharePoint Online
description: In this article, you use Power Automate to automate saving a Power BI paginated report to OneDrive for Business or a SharePoint Online folder.  
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 04/21/2021
LocalizationGroup: Get started
---
# Save a paginated report to OneDrive for Business or SharePoint Online

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI paginated reports to a variety of supported formats and scenarios. In this article, you use Power Automate to automate saving a Power BI paginated report to OneDrive for Business or a SharePoint Online folder.


:::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/paginated-onedrive-flow.png" alt-text="Screenshot of the Power Automate flow for saving a paginated report to OneDrive or SharePoint Online":::

Looking for other Power Automate templates for Power BI paginated reports? See [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md). 

## Prerequisites  

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A4/P1 – A6/P3 SKUs. Read more about [reserved capacities for paginated reports in Power BI Premium](../admin/service-premium-what-is.md#paginated-reports)
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.

## Save a paginated report to OneDrive for Business or a SharePoint Online folder 

With either of these templates, you set up recurring exports of a paginated report in a desired format to OneDrive for Business or a SharePoint Online folder. See the prerequisites if this is your first time using the Export to File for Paginated Reports action in a Power Automate flow. 

> [!NOTE]
> The following steps and images show setting up a flow using the **Save a Power BI paginated report to OneDrive for Business** template. Follow the same steps to create a flow using the **Save a Power BI paginated report to a SharePoint Online folder** template. When selecting where you want to export your paginated report, select a SharePoint Online folder instead of a OneDrive for Business folder. 

1. Sign in to Power Automate [flow.microsoft.com](https://flow.microsoft.com/). 
1. Select **Templates**, and search for **paginated reports**. 

    :::image type="content" source="media/service-automate-paginated-integration/power-bi-paginate-automate.png" alt-text="Screenshot of Power Automate templates for Power BI paginated reports.":::

1. Select **Save a Power BI paginated report to OneDrive for Business** or **Save a Power BI paginated report to a SharePoint Online folder**. Make sure you're signed into Power BI and OneDrive for Business or SharePoint Online.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-step-1.png" alt-text="Screenshot of selecting the Power BI and OneDrive for Business template.":::
1. Select **Continue**.  


1. To set the **Recurrence** for your flow, select an option in **Frequency** and enter a desired **Interval** value.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-2-recurrence.png" alt-text="selecting recurrence fo the flow.":::

1. (Optional) Select **Show advanced options** to set additional **Recurrence** parameters, including **Time zone**, **Start time**, **On these days**, **At these hours**, and **At these minutes**.  

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-3-advanced-recurrence.png" alt-text="showing advanced options for recurrence.":::

1. In the **Workspace** box, select a workspace in a reserved capacity. In the **Report** box, select the paginated report in the selected workspace you wish to export. In the **Export Format** box, select the desired export format. Optionally, you can specify parameters for the paginated report. Find detailed descriptions of the parameters in the [connector reference for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports).  

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-4-export-format.png" alt-text="selecting the paginated report, the workspace, and the export format.":::

1. In **Folder Path**, select the OneDrive for Business or SharePoint Online folder where you want to export your paginated report.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-5-create-file.png" alt-text="selecting the destination and creating the file.":::

1. Power Automate automatically generates a **File Name** and **File Content** for you. You can change the file name, but keep the dynamically generated **File Content** value. 

1. When you're done, select **Next step** or **Save**. Power Automate creates and evaluates the flow, and lets you know if it finds errors. 

1. If there are errors, select **Edit flow** to fix them. Otherwise, select the **Back** arrow to view the flow details and run the new flow. 

    When you run the flow, Power Automate exports a paginated report in the specified format to OneDrive for Business or SharePoint Online.  

## Next steps

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
