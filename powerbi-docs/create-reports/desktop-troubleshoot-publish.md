---
title: Troubleshoot Power BI Desktop publishing
description: Troubleshoot Power BI Desktop publishing
author: kfollis
manager: 
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 11/10/2023
ms.author: kfollis

LocalizationGroup: Troubleshooting
---

# Troubleshoot Power BI Desktop publishing

When you publish a report and semantic model from Power BI Desktop to the Power BI service, you might sometimes get unexpected results. This article provides troubleshooting guidance for problems related to publishing from Power BI Desktop to the Power BI service.

## Solutions to common problems

### Use the latest version of Power BI Desktop

Be sure that you're using the latest version of Power BI Desktop. Go to one of these locations to download and install the latest version of Power BI Desktop:

- [Microsoft Power BI website](https://powerbi.microsoft.com/downloads/)
- The [Microsoft Store](https://apps.microsoft.com/store/detail/power-bi-desktop/9NTXR16HNW1T)

### Check your firewall and proxy settings

If you're behind a firewall, using a proxy server, or using antivirus/security software, make sure that your network configurations allow Power BI Desktop to connect to the Power BI service. Work with your IT department or network administrator to [add Power BI URLs to your allowlist](/fabric/security/power-bi-allow-list-urls). 

### Check your network connectivity

Verify that you have a stable and suitable internet connection. Connectivity problems or network restrictions can prevent Power BI Desktop from publishing to the Power BI service. Try accessing other websites or running an internet speed test to ensure that your internet connection functions reliably.

### Clear cached data

In Power BI Desktop, go to **File** > **Options and settings** > **Options**. Under **GLOBAL**, select **Data Load**, and then select **Clear Cache**.

### Clear cached credentials

If you've previously connected to the published semantic model with different credentials or an expired token, cached credentials might cause connection issues. In Power BI Desktop, go to **File** > **Options and settings** > **Data source settings**, and then select **Clear Permissions** to clear any cached credentials.

### Check your semantic model permissions

Be sure that you have the permissions that are needed to access the published semantic model. Check with the semantic model owner or administrator to verify that you've been granted access.

### Sign in to the Power BI service

Sign in to the Power BI service and try to upload the Power BI report from the target workspace by using the upload option.

## Other problems

### Error: "The remote server returned an error: (400) Bad Request."

This error can occur if you have a Power BI Pro license and are trying to publish a report that has a data model that's larger than one GB. The model memory size limit is one GB for Power BI Pro. If you want to publish larger reports, you need either a Premium per user license or a Premium capacity subscription. For more information, see [Power BI pricing](https://powerbi.microsoft.com/pricing/). 

### Error: "Unable to write data to the transport connection: An existing connection was forcibly closed by the remote host."

This error is most likely caused by a network problem. Try the following troubleshooting steps:

- Have someone else on the same physical network publish the report.
- Publish the report from a different physical network.
- Publish the report from a cloud VM.
- Upload the report to OneDrive or SharePoint and publish it to the Power BI service from there.
- Reduce the PBIX file size, and then try to publish the report.

### Can't publish to a different workspace

This problem can occur if the Power BI tenant setting [Use semantic models across workspaces](/fabric/admin/portal-workspace#use-semantic-models-across-workspaces) is disabled. Work with your Power BI tenant administrator to enable this setting.

### Can't republish or replace an existing report

This problem can occur in the following scenarios.

- The Power BI tenant setting [Block republish and disable package refresh](/fabric/admin/service-admin-portal-dataset-security#block-republish-and-disable-package-refresh) is enabled. Work with your Power BI tenant administrator to disable this setting.

- If you see the error **A report has already been published with this name**, you're trying to publish a report that's connected via live connection on top of an original report that includes a semantic model. If you publish a live-connected report with the same name as the original, the semantic model is overwritten. This error is intended to prevent the loss of the semantic model. Members of a workspace can't replace an original shared report. If they try to do so, they're prompted to rename the file and then publish.

   You can download the original report (not the live-connected one). You should be able to publish that copy correctly to overwrite the original report. If you need a separate live-connected report, you can publish it with a different name.

For more information about this problem, see [Republish or replace a semantic model published from Power BI Desktop](desktop-upload-desktop-files.md#republish-or-replace-a-semantic-model-published-from-power-bi-desktop).
