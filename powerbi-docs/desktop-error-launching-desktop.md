---
title: Resolve issues when starting Power BI Desktop
description: Resolve issues when starting Power BI Desktop
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/14/2020
ms.author: davidi

LocalizationGroup: Troubleshooting
---
# Troubleshoot opening Power BI Desktop

In Power BI Desktop, users who installed and are running previous versions of the *Power BI On-premises data gateway* can be blocked from opening Power BI Desktop, because of administrative policy restrictions that the Power BI on-premises gateway placed on named pipes on the local machine.

## Resolve issues with the On-premises data gateway and Power BI Desktop

You have three options to resolve the issue associated with the On-premises data gateway, and to enable Power BI Desktop to open:

### Resolution 1: Install the latest version of Power BI On-premises data gateway

The latest version of the Power BI On-premises data gateway doesn't place named pipe restrictions on the local machine, and allows Power BI Desktop to open properly. If you need to continue using Power BI On-premises data gateway, the recommended resolution is to update it. You can download the [latest version of Power BI On-premises data gateway](https://go.microsoft.com/fwlink/?LinkId=698863). The link is a direct download link to the installation executable.

### Resolution 2: Uninstall or stop the Power BI On-premises data gateway Microsoft service

You can uninstall the Power BI On-premises data gateway if you no longer need it. Or you can stop the Power BI On-premises data gateway Microsoft service, which removes the policy restriction and allows Power BI Desktop to open.

### Resolution 3: Run Power BI Desktop with administrator privilege

You can instead successfully launch Power BI Desktop as administrator, which also allows Power BI Desktop to successfully open. It's still recommended that you install the latest version of Power BI On-premises data gateway, as described earlier.

Power BI Desktop is engineered as a multiprocess architecture, and several of these processes communicate using Windows named pipes. There may be other processes that interfere with those named pipes. The most common reason for such interference is security, including situations where antivirus software or firewalls may block the pipes or redirect traffic to a specific port. Opening Power BI Desktop with administrator privilege may resolve that issue. If you can't open with administrator privilege, ask your administrator to determine which security rules are preventing named pipes from properly communicating. Then whitelist Power BI Desktop and its respective subprocesses.

## Resolve issues when connecting to SQL Server

When you attempt to connect to a SQL Server database, you may come across an error message similar to the following text:

`"An error happened while reading data from the provider:`\
`'Could not load file or assembly 'System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=xxxxxxxxxxxxx' or one of its dependencies.`\
`Either a required impersonation level was not provided, or the provided impersonation level is invalid. (Exception from HRESULT: 0x80070542)'"`

You can often resolve the issue if you open Power BI Desktop as an administrator before you make the SQL Server connection.

After you open Power BI Desktop as an administrator and establish the connection, the required DLLs are registered properly. After that, opening Power BI Desktop as an administrator isn't necessary.

## Get help with other launch issues

We strive to cover as many issues that occur with Power BI Desktop as possible. We regularly look at issues that may be affecting many customers, and include them in our articles.

If the issue with opening Power BI Desktop isn't associated with the On-premises data gateway, or when the previous resolutions don't work, you can submit a support incident to *Power BI support* (<https://support.powerbi.com>) to help identify and solve your issue.

Should you come across other issues in the future with Power BI Desktop, it's helpful to turn on tracing and gather log files. Log files may help to isolate and identify the issue. To turn on tracing, choose **File** > **Options and settings** > **Options**, select **Diagnostics**, and then select **Enable tracing**. Power BI Desktop must be running to set this option, but it's helpful for future issues associated with opening Power BI Desktop.
