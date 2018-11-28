---
title: Resolve Issues when starting Power BI Desktop
description: Resolve Issues when starting Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Troubleshooting
---
# Resolve Issues when Power BI Desktop will not launch
In **Power BI Desktop**, users who installed and are running previous versions of the **Power BI On-premises data gateway** can be blocked from launching Power BI Desktop, due to administrative policy restrictions that the Power BI on-premises gateway placed on named pipes on the local machine. 

## Resolve issues with the On-premises data gateway and Power BI Desktop
There are three options to resolve the issue associated with the On-premises data gateway, and enable Power BI Desktop to launch:

### Resolution 1: Install the latest version of Power BI On-premises data gateway
The latest version of the Power BI On-premises data gateway does not place named pipe restrictions on the local machine, and allows Power BI Desktop to launch properly. If you need to continue using Power BI On-premises data gateway, this is the recommended resolution. You can download the latest version of Power BI On-premises data gateway from [this location](https://go.microsoft.com/fwlink/?LinkId=698863). Note that the link is a direct download link to the installation executable.

### Resolution 2: Uninstall or stop the Power BI On-premises data gateway Windows service
If you no longer need the Power BI On-premises data gateway, you can uninstall it, or you can stop the Power BI On-premises data gateway Windows service, which removes the policy restriction, and allows Power BI Desktop to launch.

### Resolution 3: Run Power BI Desktop with administrator privilege
Alternatively, you can successfully launch Power BI Desktop as administrator, which also allows Power BI Desktop to successfully launch. It is still recommended that you install the latest version of Power BI On-premises data gateway, as described earlier in this article.

It's important to note that Power BI Desktop is engineered as a multiprocess architecture, and several of these processes communicate using Windows named pipes. There may be other processes that interfere with those named pipes. The most common reason for such interference is security, including situations where antivirus software or firewalls might be blocking the pipes or redirecting traffic to a specific port. Launching Power BI Desktop with administrator privilege may resolve that issue. If launching with administrator privelege isn't possible, contact your administrator to determine which security rules are getting applied that prevent named pipes from properly communicating, and whitelist Power BI Desktop and its respective subprocesses.

## Resolve issues when connecting to SQL Server
If you encounter an error message similar to the following, when connecting to a SQL Server database, you can often resolve the issue by launching **Power BI Desktop** as an administrator, and then making the SQL Server connection:

    "An error happened while reading data from the provider: 'Could not load file or assembly 'System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=xxxxxxxxxxxxx' or one of its dependencies. Either a required impersonation level was not provided, or the provided impersonation level is invalid. (Exception from HRESULT: 0x80070542)'"

After launching as an administrator and establishing the connection, the required DLLs are registered properly. After that, launching Power BI Desktop as an administrator isn't necessary.

## Help with other issues when launching Power BI Desktop
We strive to cover as many issues that occur with **Power BI Desktop** as possible. We regularly look at issues that may be affecting many customers, and include them in our articles.

If the issue with launching **Power BI Desktop** is not associated with the On-premises data gateway, or when the previous resolutions don't work, you can submit a support incident to [Power BI support](https://support.powerbi.com) (https://support.powerbi.com) to help identify and solve your issue.

For other issues you may encounter in the future with **Power BI Desktop** (we hope there are none, or very few), it is helpful to turn on tracing and gather log files, to better isolate and identify the issue. To turn on tracing, select **File > Options and settings > Options** and then select **Diagnostics**, then check **Enable tracing** under *Diagnostic Options*. We realize that **Power BI Desktop** must be running to set this option, which is more helpful for future issues associated with launching **Power BI Desktop**.

