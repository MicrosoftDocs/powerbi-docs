---
title: Troubleshoot Power BI Desktop publishing
description: Troubleshoot Power BI Desktop publishing
author: davidiseminger
manager: davidi
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 06/27/2023
ms.author:  

LocalizationGroup: Troubleshooting
---

# Troubleshoot Power BI Desktop publishing

When you publish a report and dataset from Power BI Desktop to the Power BI service, you might sometimes get unexpected results. This article provides troubleshooting guidance for problems related to publishing from Power BI Desktop to the Power BI service.

## Solutions to common problems

- Be sure that you're using the latest version of Power BI Desktop. Go to the [Microsoft Power BI website](https://powerbi.microsoft.com/downloads/) or the [Microsoft Store](https://apps.microsoft.com/store/detail/power-bi-desktop/9NTXR16HNW1T) to download and install the latest version of Power BI Desktop. 

- Check your firewall and proxy settings. If you're behind a firewall, using a proxy server, or using antivirus/security software, make sure that your network configurations allow Power BI Desktop to connect to the Power BI service. Work with your IT department or network administrator to [add Power BI URLs to your allowlist](/power-bi/admin/power-bi-allow-list-urls). 

- Check your network connectivity. Verify that you have a stable and suitable internet connection. Connectivity problems or network restrictions can prevent Power BI Desktop from publishing to the Power BI service. Try accessing other websites or running an internet speed test to ensure that your internet connection functions reliably.

- Clear cached data. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Data Load**, and then select **Clear Cache**.

- Clear cached credentials. If you've previously connected to the published dataset with different credentials or an expired token, cached credentials might cause connection issues. In Power BI Desktop, go to **File** > **Options and settings** > **Data source settings**, and then select **Clear Permissions** to clear any cached credentials.

- Check your dataset permissions. Be sure that you have the permissions that are needed to access the published dataset. Check with the dataset owner or administrator to verify that you've been granted access.

- Log in to the Power BI service and try to upload the Power BI report from the target workspace by using the upload option.

## Other problems

**Error: "The remote server returned an error: (400) Bad Request."**

This error can occur if you have a Power BI Pro license and are trying to publish a report that has a data model that's more than one GB. The feature limitation of data model is 1GB for Pro license. Please refer to Pricing and Product Comparison document for model size limitation - https://powerbi.microsoft.com/pricing/  . To publish report with data model over 1GB, either premium per user license or premium capacity subscription is required.

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