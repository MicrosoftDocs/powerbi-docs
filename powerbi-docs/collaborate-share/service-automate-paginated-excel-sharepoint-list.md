---
title: Export a paginated report for each row in an Excel Online table or SharePoint list
description: In this article, you use Power Automate to automate exporting a paginated report for each row in an Excel Online table or SharePoint Online list.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/10/2023
LocalizationGroup: Get started
---
# Export a paginated report for each row in an Excel Online table or SharePoint list

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI paginated reports to various supported formats and scenarios. In this article, you use a Power Automate template to automate setting up recurring exports of single or multiple paginated reports. You export them in a desired format for each row in an Excel Online table or SharePoint Online list. You can distribute the exported paginated report to OneDrive for work or school or a SharePoint Online site, or email it via Office 365 Outlook.

:::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-overview.png" alt-text="Screenshot that shows how to export a paginated report by using an Excel Online table.":::

Each row in your Excel Online table or SharePoint Online list can represent a single user to receive a paginated report on a subscription basis. Or instead, each row can represent a unique paginated report you wish to distribute. Your table or list requires a column that specifies how to distribute a report, whether OneDrive, SharePoint Online, or Outlook. The Power Automate flow uses this column in its Switch statement.

Looking for other Power Automate templates for Power BI paginated reports? See [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md).

## Prerequisites  

To follow along, make sure you meet these criteria:

- You can publish to My Workspace, or you have at least a [Contributor role](../collaborate-share/service-roles-new-workspaces.md#workspace-roles) for any other workspace.
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.
- If you're using an Excel Online table, it needs to be formatted as a table in Excel. See [Create a table](https://support.microsoft.com/office/create-a-table-in-excel-bf0ce08b-d012-42ec-8ecf-a2259c9faf3f) to learn how.

## Export a paginated report for each row in a table or list

> [!NOTE]
> The following steps and images show setting up a flow using the **Export a Power BI paginated report for each row in an Excel Online table** template. You can follow the same steps to create a flow using the **Export a Power BI paginated report for items in a SharePoint Online list** template. Instead of an Excel Online table, a SharePoint Online list will contain the information about how to export the paginated report.  

1. Sign in to Power Automate [flow.microsoft.com](https://flow.microsoft.com/). 
1. Select **Templates**, and search for **paginated reports**. 

    :::image type="content" source="media/service-automate-paginated-integration/power-bi-paginate-automate.png" alt-text="Screenshot of Power Automate templates for Power BI paginated reports.":::

1. Select the **Export a Power BI paginated report for each row in an Excel Online table** or **Export a Power BI paginated report for items in a SharePoint Online list** template. Make sure you're signed into Excel Online, Power BI, OneDrive for work or school, SharePoint Online, and Office 365 Outlook. Select **Continue**.  

   :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-excel-online-1.png" alt-text="Screenshot that shows the applications that the selected flow connects to.":::

1. To set the **Recurrence** for your flow, select an option in **Frequency** and enter a desired **Interval** value.

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-recurrence-2.png" alt-text="Screenshot that shows where to select recurrence for your flow.":::

1. (Optional) Select **Show advanced options** to set specific **Recurrence** parameters, including **Time zone**, **Start time**, **On these days**, **At these hours**, and **At these minutes**.

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-advanced-recurrence-3.png" alt-text="Screenshot that shows the option to select advanced recurrence options.":::

1. In the **Location** box, select OneDrive for work or school or the SharePoint Online site where your Excel Online table or SharePoint Online list is saved. Then, select the **Document Library** from the dropdown list.

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-location-4.png" alt-text="Screenshot that shows where to select the location of the Excel Online table.":::

1. Select the Excel Online file or SharePoint Online list in the **File** box. Select the name of the table or list from the dropdown list in the **Table** box. 
 
    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-file-table-5.png" alt-text="Select the Excel Online file and name of the table.":::

    > [!TIP]
    > See [Create a table](https://support.microsoft.com/office/create-a-table-in-excel-bf0ce08b-d012-42ec-8ecf-a2259c9faf3f) to learn how to format data as a table in Excel. 

1. Initialize a variable to use for the file name. You can keep or modify the default values for **Name** and **Value**, but leave the **Type** value as **String**.  

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-name-type-6.png" alt-text="Screenshot that shows the Default output file name dialog box.":::

1. In the **Workspace** box, select a workspace in a reserved capacity. In the **Report** box, select the paginated report in the selected workspace you want to export. If you set **Enter a custom value** from the dropdown list, you can set **Workspace** and **Report** to equal a column in your Excel Online table or SharePoint Online list. These columns should contain Workspace IDs and Report IDs, respectively.  

1. Select an **Export Format** from the dropdown list, or set it equal to a column in your Excel Online table containing desired export formats. for example PDF, DOCX, or PPTX. Optionally, you can specify parameters for the paginated report. Find detailed descriptions of the parameters in the [connector reference for the Power BI REST API](/connectors/powerbi/#export-to-file-for-paginated-reports).

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-export-format-9.png" alt-text="Screenshot that shows the Export to File for Paginated Reports dialog box.":::

1. In the **Value** box, enter a name for the paginated report once it's exported. Be sure to enter a file extension. You can set it statically, for example `.pdf`, `.docx`, or `.pptx`. Or, set it dynamically by selecting the column in your Excel table corresponding to your desired export format. 

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-output-value-10.png" alt-text="Screenshot that shows where to select the name of the report and a file extension.":::

1. In the **Switch** section, populate the **On** box with the column in your Excel Online table corresponding to the desired method of delivery: **OneDrive**, **SharePoint**, or **Email**. 

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-switch-11.png" alt-text="Screenshot that shows the Switch section where you populate the On box with the column in your Excel Online table.":::

1. In the **Case**, **Case 2**, and **Case 3** sections, enter the values present in the Excel Online table column selected in the previous step.  

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-case-1-2-3-12.png" alt-text="Screenshot that shows where to enter values for Case, Case 2, and Case 3.":::

1. In the case where you're saving your paginated report to OneDrive, select the **Folder Path** where it should be saved.  

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-case-onedrive-13.png" alt-text="Screenshot that shows the case where you're saving to OneDrive.":::

1. In the case where you're saving your paginated report to SharePoint Online, enter the **Site Address** and **Folder Path** where it should be saved. 

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-case-sharepoint-14.png" alt-text="Screenshot that shows the case where you're saving your paginated report to SharePoint Online.":::

1. In the case where you're sending your paginated report as an email via Outlook, populate the **To**, **Subject**, and **Body** boxes. These boxes can contain static content, or dynamic content from your Excel Online table or SharePoint Online list. Power Automate attaches your paginated report to this email automatically.  

    :::image type="content" source="media/service-automate-paginated-excel-sharepoint-list/excel-template-case-email-15.png" alt-text="Screenshot that shows the case where you're sending your paginated report as an email via Outlook.":::

1. When you're done, select **New step** or **Save**. Power Automate creates and evaluates the flow, and lets you know if it finds errors. 

1. If there are errors, select **Edit flow** to fix them. Otherwise, select the **Back** arrow to view the flow details and run the new flow. 

## Related content

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)

