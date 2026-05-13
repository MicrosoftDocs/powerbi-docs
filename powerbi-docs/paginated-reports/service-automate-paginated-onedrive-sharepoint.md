---
title: Save a Paginated Report to OneDrive or SharePoint Online
description: "Learn how to use Power Automate to automatically save Power BI paginated reports to OneDrive for work or SharePoint Online. Set it up today!"  
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 11/01/2025
ai-usage: ai-assisted
LocalizationGroup: Get started
---
# Save a paginated report to OneDrive or SharePoint Online

By using [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI paginated reports to a variety of supported formats and scenarios. In this article, you use Power Automate to automate saving a Power BI paginated report to OneDrive for work or school or a SharePoint Online folder.

:::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/paginated-onedrive-flow.png" alt-text="Screenshot of the Power Automate flow configured to save a paginated report to OneDrive or SharePoint Online.":::

For more information about Power Automate templates for Power BI paginated reports, see [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md). 

## Prerequisites  

Before you begin, make sure you meet these criteria:

- You can publish to My Workspace, or you have at least a [Contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) for any other workspace.
- You have access to the standard connectors in Power Automate, which come with any Office 365 subscription.

## Save a paginated report to OneDrive for work or school or a SharePoint Online folder 

By using either of these templates, you can set up recurring exports of a paginated report in a desired format to OneDrive for work or school or a SharePoint Online folder. See the prerequisites if this is your first time using the **Export to File for Paginated Reports** action in a Power Automate flow. 

> [!NOTE]
> The following steps and images show setting up a flow by using the **Save a Power BI paginated report to OneDrive for work or school** template. Follow the same steps to create a flow by using the **Save a Power BI paginated report to a SharePoint Online folder** template. When selecting where you want to export your paginated report, select a SharePoint Online folder instead of a OneDrive for work or school folder. 

1. Go to [flow.microsoft.com](https://flow.microsoft.com/) and sign in to Power Automate. 
1. Select **Templates**, and search for **paginated reports**. 

    :::image type="content" source="media/service-automate-paginated-integration/power-bi-paginate-automate.png" alt-text="Screenshot of the Power Automate templates page showing the search field used to find paginated report templates.":::

1. Select **Save a Power BI paginated report to OneDrive for work or school** or **Save a Power BI paginated report to a SharePoint Online folder**. Make sure you're signed in to Power BI and OneDrive for work or school or SharePoint Online.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-step-1.png" alt-text="Screenshot of the Power BI and OneDrive for work or school template selection screen in Power Automate.":::
1. Select **Continue**.  

1. Select **Continue**.  

1. To set the recurrence for your flow, select a **Frequency** and enter a desired **Interval** value.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-2-recurrence.png" alt-text="Screenshot of the recurrence settings in Power Automate showing the Interval and Frequency fields for a paginated report flow.":::

1. For more options, select **Show advanced options** to set other **Recurrence** parameters, including **Time zone**, **Start time**, **On these days**, **At these hours**, and **At these minutes**.  

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-3-advanced-recurrence.png" alt-text="Screenshot of the advanced recurrence options in Power Automate, including Time zone, Start time, and day and hour settings.":::

1. In the **Workspace** box, select a workspace in a reserved capacity. In the **Report** box, select the paginated report in the selected workspace you wish to export. In the **Export Format** box, select the desired export format. Optionally, you can specify parameters for the paginated report. For detailed descriptions of the API parameters, see the [connector reference for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports).  

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-4-export-format.png" alt-text="Screenshot of the Power Automate flow step showing workspace, paginated report, and export format selection fields.":::

1. In **Folder Path**, select the OneDrive for work or school or SharePoint Online folder where you want to export your paginated report.

    :::image type="content" source="media/service-automate-paginated-onedrive-sharepoint/onedrive-template-5-create-file.png" alt-text="Screenshot of the Power Automate flow step showing the Folder Path setting for exporting a paginated report to OneDrive or SharePoint Online.":::

1. Power Automate automatically generates a **File Name** and **File Content** for you. You can change the file name, but keep the dynamically generated **File Content** value. 

1. When you're done, select **Next step** or **Save**. Power Automate creates and evaluates the flow, and lets you know if it finds errors. 

1. If there are errors, select **Edit flow** to fix them. Otherwise, select the **Back** arrow to view the flow details and run the new flow. 

    When you run the flow, Power Automate exports a paginated report in the specified format to OneDrive for work or school or SharePoint Online.  

## Related content

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- Questions? [Try the Power BI Community](https://community.powerbi.com/)
