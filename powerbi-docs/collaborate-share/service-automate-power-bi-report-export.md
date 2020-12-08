---
title: Export and email a Power BI report in Power Automate
description: In this article, you use Power Automate to automate the export and distribution of Power BI reports in a variety of supported formats and scenarios.  
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 12/07/2020
LocalizationGroup: Get started
---
# Export and email a Power BI report in Power Automate

The Export to File for Power BI Reports action allows you to easily leverage the Power BI export API for Power BI reports in your Power Automate flows. With this action, you can automate the export and distribution of Power BI reports in a variety of supported formats and scenarios. In this article, you will learn to create your own flow from scratch. This flow makes use of the Export to File for Power BI Reports action to automatically distribute a desired Power BI report via email. 

Get started using Power Automate now.

## Prerequisites  

To follow along, you will need to be sure you have at least one workspace in your Power BI tenant backed by a capacity. This capacity can be any of the A1/P1 – A6/P3 SKU’s. You will also need access to the standard connectors in Power Automate, which come with any Office 365 subscription. 

To follow along, make sure you have:

- At least one workspace in your Power BI tenant backed by a reserved capacity. This capacity can be any of the A4/P1 – A6/P3 SKUs. Read more about [reserved capacities for paginated reports in Power BI Premium](../admin/service-premium-what-is.md#paginated-reports)
- Access to the standard connectors in Power Automate, which come with any Office 365 subscription.

## Create a flow from scratch 
In this task, we create a simple flow from scratch that exports a Power BI report as a PDF and attaches it to an email sent on a weekly basis.  
1.	Sign in to Power Automate (flow.microsoft.com).
2.	Select Create > Scheduled flow. 
 
3.	In Build a scheduled flow, give your flow a name. 
4.	In Run this flow, select the starting date and time for your flow as well as the repetition frequency. 
5.	In On these days, select which days you want your flow to run > Create. 

 
6.	In Recurrence, select Show advanced options and enter a value in At these hours and At these minutes to set a specific time for your flow to run. 
 
7.	Select New Step. 
8.	In Choose an action, search for Power BI > Export to File for Power BI Reports.
 
9.	In Export to File for Power BI Reports, select a Workspace and Report from the dropdowns.
10.	Select the desired Export Format for your Power BI report. 
 
11.	Optionally, indicate specific pages to export within the Pages pageName -1 field. Note the page name parameter is different from the display page name. It can be found by navigating to the page in the Power BI Service and copying the last portion of the URL. 
  
12.	Optionally, indicate a specific bookmark to display within the Pages Bookmark Name field. As with the page name parameter, the bookmark name parameter can be found in your report’s URL. Additional parameters can be specified for the Power BI report. Detailed descriptions of these parameters can be found in the connector reference for the Power BI Rest API.
  
13.	Select New Step.
14.	In Choose an action, search for Outlook > Send an email (V2). 
15.	In Send and email (V2), complete the To, Subject, and Body fields for your email. 
16.	Select Show advanced options. In Attachments Name – 1, enter a name for your attachment. Add a file extension to the file name (i.e. .PDF) that matches your desired Export Format.
17.	In Attachment Content, select File Content to attach your exported Power BI report.  
 
18.	When you're done, select Next step or Save. The flow is created and evaluated. Power Automate lets you know if it finds errors.
19.	If errors are found, select Edit flow to fix them, otherwise, select the Back arrow to view the flow details and to run the new flow.
20.	When the flow is run, Power Automate exports a Power BI report in the specified format and sends it as an email attachment as scheduled.  


## Next steps

- [Export Power BI paginated reports with Power Automate](service-automate-paginated-integration.md)
- [Get started with Power Automate](/power-automate/getting-started/)
- More questions? [Try the Power BI Community](https://community.powerbi.com/)
