---
title: Troubleshoot Desktop publish
description: Troubleshoot Desktop publish
author: 
manager: 
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/27/2023
ms.author:  

LocalizationGroup:  
---

# Troubleshoot Desktop publish

There may be times when publishing report and dataset from Power BI Desktop to Power BI Service that you get an unexpected result, or the feature doesn't work as you expected. This page provides common solutions related to publishing from Power BI Desktop to Power BI Service.

## Common solutions

1. Ensure that you are using the latest version of Power BI Desktop. Visit the Microsoft Power BI website or the Microsoft Store to download and install the latest version of Power BI Desktop. https://powerbi.microsoft.com/downloads/ 

1. Firewall and Proxy Settings: If you're behind a firewall or using a proxy server or using anti virus/security software, ensure that the necessary network configurations are in place to allow Power BI Desktop to connect to Power BI Service. Work with your IT department or network administrator to add Power BI URLs to your allowlist: https://learn.microsoft.com/power-bi/admin/power-bi-allow-list-urls 

1. Check Network Connectivity: Verify that you have a stable and good internet connection. Connectivity problems or network restrictions could prevent Power BI Desktop from publishing to Power BI Service. Try accessing other websites or running internet speed test to ensure your internet connection is functioning efficiently.

1. Clear Data Load Cache: In Power BI Desktop, go to "File" > "Options and settings" > "Global" > "Data Load" > "Clear Cache" to clear any cached data.

1. Clear Cached Credentials: If you have previously connected to the published dataset using different credentials or an expired token, cached credentials may cause connection issues. In Power BI Desktop, go to "File" > "Options and settings" > "Data source settings" > "Clear All Permissions" to clear any cached credentials.

1. Check Dataset Permissions: Ensure that you have the necessary permissions to access the published dataset. Check with the dataset owner or administrator to verify that you have been granted access.

1. Login to Power BI Service, try uploading the Power BI report from the target workspace using the upload option.

## Other issues

**Error: "The remote server returned an error: (400) Bad Request."**

This error could occur if you are using Power BI Pro License but trying to publish a report with data model over 1GB, the feature limitation of data model is 1GB for Pro license. Please refer to Pricing and Product Comparison document for model size limitation - https://powerbi.microsoft.com/pricing/  . To publish report with data model over 1GB, either premium per user license or premium capacity subscription is required.

**Error: "Unable to write data to the transport connection: An existing connection was forcibly closed by the remote host."**

This error is likely caused by network related issue, try the following solutions:

1. Try having someone else on the same physical network publish the report to see if it works.
1. Try publishing the report from a different physical network to see if it works.
1. Try publishing the report from a cloud VM
1. Upload the report to Onedrive or SharePoint, from there publish to Power BI service.
1. Reduce the PBIX file size, then try to publish again.

## Cannot publish to a different workspace

This issue could occur if Power BI Tenant Setting 'Use datasets across workspaces' is disabled: https://learn.microsoft.com/power-bi/admin/service-admin-portal-workspace#use-datasets-across-workspaces , work with your Power BI Tenant Admin to enable Tenant Setting 'Use datasets across workspaces' will resolve this issue.

## Cannot republish or replace an existing report

This issue could occur

1. Power BI Tenant Setting 'Block republish and disable package refresh' is enabled: https://learn.microsoft.com/power-bi/admin/service-admin-portal-dataset-security#block-republish-and-disable-package-refresh , work with your Power BI Tenant Admin to disable Tenant Setting 'Block republish and disable package refresh' will resolve this issue.

1. If error is 'A report has already been published with this name'. this means you are trying to publish a live-connected report over the top of the original report that has the dataset included. If tries to publish a live-connected report with the same name as the original, the dataset would be overwritten, so this is to prevent the dataset being lost due to conflicting names. https://learn.microsoft.com/power-bi/connect-data/desktop-report-lifecycle-datasets#considerations-and-limitations:~:text=Members of a workspace can't replace the original shared report. If they try to do so%2C they get a prompt to rename the file and publish .

   You can download the original report (not live connected) and should be able to publish that copy correctly to overwrite the original report. If you need a separate live-connected report, then publish with a different name should resolve the issue.

1. Additional consideration could be found here https://learn.microsoft.com/power-bi/create-reports/desktop-upload-desktop-files#republish-or-replace-a-dataset-published-from-power-bi-desktop 