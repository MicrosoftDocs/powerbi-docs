---
title: Troubleshooting Power BI Gateway - Personal
description: Troubleshooting Power BI Gateway - Personal
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 5/06/2019
ms.author: mblythe

LocalizationGroup: Troubleshooting
---

# Troubleshooting Power BI Gateway - Personal

[!INCLUDE [gateway-rewrite](includes/gateway-rewrite.md)]

The following sections go through some common issues you might come across when you use the Power BI on-premises data gateway (personal mode).

## Update to the latest version

The current version of the gateway for personal use is the on-premises data gateway (personal mode). Update your installation to use that version.

Many issues can surface when the gateway version is out of date. It's a good general practice to make sure you're on the latest version. If you haven't updated the gateway for a month or longer, consider installing the latest version of the gateway. Then see if you can reproduce the issue.

## Installation
**Personal gateway is 64 bit:** If your machine is a 32-bit version, you can't install the gateway (personal mode). Your operating system has to be 64-bit version. Install a 64-bit version of Windows or install the gateway (personal mode) on a 64-bit machine.

**Personal gateway fails to install as a service even though you're a local administrator for the computer:**  Installation can fail if the user is in the computer’s local Administrator group, but group policy doesn't allow that username to sign in as a service. At the moment, ensure the group policy lets a user sign in as a service. We’re working on a fix for this issue. For more information, see [Add the log on as a service right to an account](https://technet.microsoft.com/library/cc739424.aspx)

**Operation timed out:** This message is common if the computer (physical machine or VM) on which you’re installing the gateway (personal mode) has a single core processor. Close any applications and turn off any non-essential processes and try installing again.

**Data Management Gateway or Analysis Services Connector can't be installed on the same computer as gateway (personal mode):** If you already have an Analysis Services Connector or Data Management Gateway installed, you must first uninstall the Connector or the gateway. Then, try installing the gateway (personal mode).

> [!NOTE]
> If you encounter an issue during installation, the setup logs can provide information to help you resolve the issue. For more information, see [Setup logs](#SetupLogs).
> 
> 

 **Proxy configuration:** You might see issues with configuring the gateway (personal mode) if your environment needs the use of a proxy. To learn more about how to configure proxy information, see [Configuring proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy).

## Schedule refresh
**Error: The credential stored in the cloud is missing.**

You might get this error in settings for \<dataset\> if you have a scheduled refresh and then uninstalled and reinstalled the gateway (personal mode). When you uninstall a gateway (personal mode), the data source credentials for a dataset that's been configured for refresh are removed from the Power BI service.

**Solution:** In Power BI, go to the refresh settings for a dataset. In **Manage Data Sources**, for any data source with an error, select **Edit credentials**. Then sign in to the data source again.

**Error: The credentials provided for the dataset are invalid. Please update the credentials through a refresh or in the Data Source Settings dialog to continue.**

**Solution:** If you get a credentials message, it could mean:

* The usernames and passwords that you used to sign in to data sources aren't up to date. In Power BI, go to refresh settings for the dataset. In **Manage Data Sources**, select **Edit credentials** to update the credentials for the data source.
* Mashups between a cloud source and an on-premises source, in a single query, fail to refresh in the gateway (personal mode) if one of the sources is using OAuth for authentication. An example of this issue is a mashup between CRM Online and a local SQL Server. The mashup fails because CRM Online requires OAuth.
  
  This error is a known issue, and it's being looked at. To work around the problem, have a separate query for the cloud source and the on-premises source. Then, use a merge or append query to combine them.

**Error: Unsupported data source.**

**Solution:** If you get an unsupported data source message in Schedule Refresh settings, it could mean: 

* The data source isn't currently supported for refresh in Power BI. 
* The Excel workbook doesn't contain a data model, only worksheet data. Power BI currently only supports refresh if the uploaded Excel workbook contains a data model. When you import data by using Power Query in Excel, choose the **Load** option to load data to a data model. This option ensures that data is imported into a data model. 

**Error: [Unable to combine data] &lt;query part&gt;/&lt;…&gt;/&lt;…&gt; is accessing data sources that have privacy levels, which cannot be used together. Please rebuild this data combination.**

**Solution:** This error is because of the privacy-level restrictions and the types of data sources you're using.

**Error: Data source error: We cannot convert the value "\[Table\]" to type Table.**

**Solution:** This error is because of the privacy level restrictions and the types of data sources you're using.

**Error: There is not enough space for this row.**

This error occurs if you have a single row greater than 4 MB in size. Find the row from your data source, and attempt to filter it out or reduce the size for that row.

## Data sources
**Missing data provider:** The gateway (personal mode) is 64-bit version only. It requires a 64-bit version of the data providers to be installed on the same computer where the gateway (personal mode) is installed. For example, if the data source in the dataset is Microsoft Access, you must install the 64-bit ACE provider on the same computer where you installed the gateway (personal mode).  

>[!NOTE]
>If you have a 32-bit version of Excel, you can't install a 64-bit version ACE provider on the same computer.

**Windows authentication is not supported for Access database:** Power BI currently only supports anonymous authentication for Access database. We're working on enabling Windows authentication for Access database.

**Sign-in error when entering credentials for a datasource:** If you get an error like this one when you enter Windows credentials for a data source, you might still be on an older version of the gateway (personal mode). [Install the latest version of Power BI gateway - Personal](https://powerbi.microsoft.com/gateway/).

  ![](media/service-admin-troubleshooting-power-bi-personal-gateway/pbi_pg_credentialserror.jpg.png)

**Error: Sign-in error when selecting Windows authentication for a data source using ACE OLEDB:** If you get the following error when you enter data source credentials for a data source using an ACE OLEDB provider:

![](media/service-admin-troubleshooting-power-bi-personal-gateway/aceoledberror.png)

Power BI doesn't currently support Windows authentication for a data source using an ACE OLEDB provider.

**Solution:** To work around this error, you can select **Anonymous authentication**. For a legacy ACE OLEDB provider, anonymous credentials are equal to Windows credentials.

## Tile refresh
If you're receiving an error with dashboard tiles refreshing, see [Troubleshooting tile errors](refresh-troubleshooting-tile-errors.md).

## Tools for troubleshooting
### Refresh History
**Refresh history** helps you see what errors have occurred and provides useful data if you need to create a support request. You can view both scheduled and on-demand refreshes. Here's how you get to **Refresh history**.

1. In the Power BI navigation pane, in **Datasets**, select a dataset &gt. Open the menu &gt; **Schedule Refresh**.
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/scheduled-refresh.png)
1. In **Settings for...**, select **Refresh history**.  
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/scheduled-refresh-2.png)
   
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/refresh-history.png)

### Event logs
Several event logs can provide information. The first two, **Data Management Gateway** and **PowerBIGateway**, are present if you're an admin on the machine. If you're not an admin, and you're using the data gateway (personal mode), you'll see the log entries within the **Application** log.

The **Data Management Gateway** and **PowerBIGateway** logs are present under **Application and Services Logs**.

![Data Management Gateway and PowerBIGateway logs](media/service-admin-troubleshooting-power-bi-personal-gateway/event-logs.png)

### Fiddler trace
[Fiddler](http://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic. You can see the communication with the Power BI service from the client machine. This communication might show errors and other related information.

![](media/service-admin-troubleshooting-power-bi-personal-gateway/fiddler.png)

<a name="SetupLogs"></a>

### Setup logs
If the **Personal Gateway**, fails to install, you'll see a link to show the setup log. The setup log can show you details about the failure. These logs are Windows Install logs, also known as MSI logs. They can be fairly complex and hard to read. Typically, the resulting error is at the bottom, but determining the cause of the error isn't trivial. It could be a result of errors in a different log, or it could be a result of an error higher up in the log.

![](media/service-admin-troubleshooting-power-bi-personal-gateway/setup-log.png)

Or, you can go to your **Temp folder** (%temp%) and look for files that start with **Power\_BI\_**.

> [!NOTE]
> Going to %temp% might take you to a subfolder of temp. The **Power\_BI\_** files are in the root of the temp directory. You might need to go up a level or two.
> 
> 

![](media/service-admin-troubleshooting-power-bi-personal-gateway/setup-logs2.png)

## Next steps
[Configuring proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy)  
[Data refresh](refresh-data.md)  
[Power BI gateway - Personal](service-gateway-personal-mode.md)  
[Troubleshooting tile errors](refresh-troubleshooting-tile-errors.md)  
[Troubleshooting the on-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? Try asking the [Power BI Community](http://community.powerbi.com/).

