---
title: Export a paginated report for each row in an Excel Online table or SharePoint list
description: In this article, you use Power Automate to automate saving a Power BI paginated report to OneDrive for Business or a SharePoint Online folder.  
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 11/11/2020
ms.author: maggies

LocalizationGroup: Get started
---
# Export a paginated report for each row in an Excel Online table or SharePoint list

With [Power Automate](/power-automate/getting-started), you can automate exporting and distributing Power BI paginated reports to a variety of supported formats and scenarios. In this article, you use Power Automate to automate saving a Power BI paginated report to OneDrive for Business or a SharePoint Online folder.  

## Prerequisites  

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A4/P1 – A6/P3 SKUs. Read more about [reserved capacities in Power BI Premium](../admin/service-premium-what-is.md).
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.

This template allows you to set up recurring exports of single or multiple paginated reports in a desired format for each row in an Excel Online table. The exported paginated report can be distributed to OneDrive for Business, a SharePoint site, or emailed via Office 365 Outlook.  

Each row in your Excel Online table can be designed to either to represent a single user to receive a paginated report on a subscription basis or instead, each row can represent a unique paginated report you wish to distribute. Your Excel Online table will require a column that specifies how you wish to distribute a report (i.e. OneDrive, SharePoint or Outlook). This will be used in the Switch statement in the flow.  

Select Export a Power BI paginated report for each row in an Excel Online table template and ensure you are signed into Excel Online, Power BI, OneDrive for Business, SharePoint, and Office 365 Outlook before selecting Continue.  

 

Set the Recurrence frequency for your flow by selecting an option from the Frequency dropdown and entering a desired Interval value.   

 

Optionally, select Show advanced options to set additional Recurrence parameters including Time zone, Start time, On these days, At these hours, and At these minutes.  

 

In the Location box, select OneDrive for Business or the SharePoint site where your Excel Online table is saved. Then, select the Document Library from the dropdown.   

 

Select the Excel Online file in the File box, and the name of the table from the dropdown in the Table box. See Create a table to learn how to format data as a table in Excel. 

 

Next, initialize a variable to use for the file name. You can keep or modify the default values for Name and Value but leave value for Type equal to String.  

[Text Wrapping Break] 

In Apply to Each, the Select an output from previous step box is set to value by default. This will iterate through the actions contained in Apply to Each for each row in your Excel Online table.  

In the Workspace box, select a workspace in a dedicated capacity. In the Report box, select the paginated report in the selected workspace you wish to export. By selecting Enter a custom value from the dropdown, Workspace and Report can be set to equal a column in your Excel Online table. These columns should contain Workspace IDs and Report IDs respectively.  

Select an Export Format either from the dropdown or set equal to a column in your Excel Online table containing desired export formats (i.e. PDF, DOCX, PPTX). Optionally, parameters can be specified for the paginated report. Detailed descriptions of the parameters can be found in the connector reference for the Power BI Rest API.  

 

In the Value box, enter a name for the paginated report once it is exported. Ensure you enter a file extension either statically (i.e. .pdf, .docx, .pptx) or dynamically by selecting the column in your Excel table corresponding to your desired export format.  

 

In the Switch action, populate the On box with the column in your Excel Online table corresponding to the desired method of delivery (i.e. OneDrive, SharePoint, Email). 

 

Within Case, Case 2, and Case 3, enter the values present in the Excel Online table column selected in the previous step.  

 

In the case your paginated reported is saved to OneDrive, select the Folder Path where the where it should be saved.  

 

In the case your paginated report is saved to SharePoint, enter the Site Address and select the Folder Path where the where it should be saved. 

 

In the case you paginated report is sent as an email via Outlook, populate the To, Subject, and Body boxes. You can populate these boxes with static content or dynamic content from your Excel Online table. Your paginated report is automatically attached to this email.  

 

When you're done, select Next step or Save. The flow is created and evaluated. Power Automate lets you know if it finds errors. 

If errors are found, select Edit flow to fix them, otherwise, select the Back arrow to view the flow details and to run the new flow. 

Export a Power BI paginated report for items in a SharePoint list  

The steps to setup a flow using the Export a Power BI paginated report for each row in an Excel Online table template can also be followed to create a flow using the Export a Power BI paginated report for items in a SharePoint list template. Instead of an Excel Online table, a SharePoint list will contain the information about how a paginated report should be exported.  

## Next steps

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)

