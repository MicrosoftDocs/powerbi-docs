---
title: 'Export paginated reports with Power Automate'
description: Learn how to create Power Automate flows to export Power BI paginated reports.
author: maggiesMSFT
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 11/09/2020
ms.author: maggies

LocalizationGroup: Get started
---
# Export Power BI paginated reports with Power Automate

Use [Power Automate](/power-automate/getting-started) to integrate Power BI with your favorite apps and services. With Power Automate, you create automated workflows to get notifications, synchronize files, collect data, and more. In this article, you automate generating an email from a Power BI data alert.

[Get started using Power Automate now.](/power-automate/getting-started)

## Prerequisites  

To follow along, you will need to be sure you have at least one workspace in your Power BI tenant backed by a dedicated capacity. This capacity can be any of the A4/P1 – A6/P3 SKU’s. You will also need access to the standard connectors in Power Automate, which come with any Office 365 subscription.  

## Create a flow from a template 

Sign in to Power Automate (flow.microsoft.com). 

Select Templates, search for Paginated Reports. 

 

## Template walkthroughs 

Select a template from the list below to get started with a step-by-step walkthrough.  

- Save a Power BI paginated report to OneDrive for Business  
- Save a Power BI paginated report to a SharePoint Online folder  
- Export a Power BI paginated report for items in a SharePoint Online List  
- Export a Power BI paginated report for each row in an Excel Online table 
- Save a Power BI paginated report to a local system folder 


## Save a paginated report to OneDrive for Business or a SharePoint Online folder 

With these templates, you set up recurring exports of a paginated report in a desired format to OneDrive for Business or a SharePoint Online folder. See the prerequisites if this is your first time using the Export to File for Paginated Reports action in a Power Automate flow. 

1. Select **Save a Power BI paginated report to OneDrive for Business** or **Save a Power BI paginated report to a SharePoint Online folder**. Make sure you're signed into Power BI and OneDrive for Business or SharePoint Online. 
1. Select **Continue**.  


1. To set the **Recurrence** for your flow, select an option in **Frequency** and enter a desired **Interval** value.

    

1. (Optional) Select **Show advanced options** to set additional **Recurrence** parameters, including **Time zone**, **Start time**, **On these days**, **At these hours**, and **At these minutes**.  

 

1. In the **Workspace** box, select a workspace in a dedicated capacity. In the Report box, select the paginated report in the selected workspace you wish to export. In the Export Format box, select the desired export format. Optionally, parameters can be specified for the paginated report. Detailed descriptions of the parameters can be found in the connector reference for the Power BI Rest API.  

 

In the Folder Path, select the OneDrive for Business folder where you want to export your paginated report. 

 

Power Automate automatically generates a File Name and File Content for you. You can modify the File Name but should keep the dynamically generated File Content value. 

When you're done, select Next step or Save. The flow is created and evaluated. Power Automate lets you know if it finds errors. 

If errors are found, select Edit flow to fix them, otherwise, select the Back arrow to view the flow details and to run the new flow. 

When the flow is run, Power Automate exports a paginated report in the specified format to OneDrive for Business.  

## Next steps
* [Get started with Power Automate](/power-automate/getting-started/)

* More questions? [Try the Power BI Community](https://community.powerbi.com/)

 

### Save a paginated report to  a SharePoint Online folder  

The steps to setup a flow using the Save a Power BI paginated report to OneDrive for Business template can also be followed to create a flow using the Save a Power BI paginated report to a SharePoint Online folder template. When selecting where you want your paginated report to be exported, you will select a SharePoint Online folder instead of a OneDrive for Business folder. 