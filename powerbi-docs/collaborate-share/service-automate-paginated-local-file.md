---
title: Save a paginated report to a local folder with Power Automate
description: In this article, you use a template to set up recurring exports of a paginated report to your file system, in a desired format. 
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/06/2023
LocalizationGroup: Get started
---
# Save a Power BI paginated report to a local folder  with Power Automate

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI paginated reports to a variety of supported formats and scenarios. In this article, you use a template to set up recurring exports of a paginated report to your file system, in a desired format. See the Prerequisites if it's your first time using the Export to File for Paginated Reports action in a Power Automate flow.

:::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-overview.png" alt-text="Set up recurring exports of a paginated report.":::

Looking for other Power Automate templates for Power BI paginated reports? See [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md).

## Prerequisites  

To follow along, make sure you meet these criteria:

- You can publish to My Workspace, or you have at least a [Contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) for any other workspace.
- You have access to the standard connectors in Power Automate, which come with any Office 365 subscription.

## Save a Power BI paginated report to a local folder

1. Sign in to Power Automate [flow.microsoft.com](https://flow.microsoft.com/). 
1. Select **Templates**, and search for **paginated reports**. 

    :::image type="content" source="media/service-automate-paginated-integration/power-bi-paginate-automate.png" alt-text="Screenshot of Power Automate templates for Power BI paginated reports.":::

1. Select the **Save a Power BI paginated report to a local file system** template. Make sure you're signed into Power BI and connected to your local file system. Select **Continue**. 

    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-save-report-local-file-1.png" alt-text="Save a Power BI paginated report to a local file system.":::

1. If you need a new connection, select the ellipses and choose **Add new connection** to connect to your file system. Enter a **Connection Name**, the path to your desired **Root folder**, and authenticate by entering your **User name** and **Password**. Select a **gateway** from the list if you're using an on-premises data gateway.

    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-set-file-system-2.png" alt-text="Screenshot that shows how to add a new connection.":::
 
3. To set the **Recurrence** frequency for your flow, select an option from the **Frequency** dropdown and enter a desired **Interval** value.  

    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-recurrence-frequency-3.png" alt-text="Set the Recurrence frequency for your flow.":::

4. Optionally, select **Show advanced options**. Set additional **Recurrence** parameters such as **Time zone**, **Start time**, **On these days,** **At these hours**, and **At these minutes**. 
 
    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-recurrence-advanced-4.png" alt-text="Set advanced options for recurrence.":::

5. In the **Workspace** box, select a workspace in a reserved capacity where the report is. In the **Report** box, select the paginated report that you wish to export in the workspace. In the **Export Format** box, select the desired export format. Optionally, you can specify parameters for the paginated report. See detailed descriptions of the parameters in the [connector reference for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports).  
 
    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-select-workspace-report-5.png" alt-text="Select the workspace and the report.":::

6. In the **Create file** dialog, in **Folder Path**, select the folder where you want to export your paginated report.
 
    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-create-file-6.png" alt-text="Select the folder where you want to export your paginated report":::

7. Power Automate automatically generates a **File name** and **File content** for you. You can modify the **File name**, but keep the dynamically generated **File content** value.
8. When you're done, select **Next step** or **Save**. Power Automate creates and evaluates the flow.
9. If Power Automate finds errors, select **Edit flow** to fix them. Otherwise, select the Back arrow to view the flow details and run the new flow.
10. When you run the flow, Power Automate exports a paginated report in the specified format to the selected folder in your file system.

    :::image type="content" source="media/service-automate-paginated-local-file/paginated-local-file-exported-10.png" alt-text="Power Automate exports a paginated report in the specified format.":::

## Related content

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)

