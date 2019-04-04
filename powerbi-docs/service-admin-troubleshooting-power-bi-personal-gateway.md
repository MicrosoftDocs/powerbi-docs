---
title: Troubleshooting Power BI Gateway - Personal
description: Troubleshooting Power BI Gateway - Personal
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2017
ms.author: mblythe

LocalizationGroup: Troubleshooting
---
# Troubleshooting Power BI Gateway - Personal
The following goes through some common issues you may encounter when using the Power BI Gateway - Personal.

> [!NOTE]
> The current version of the gateway for personal use is the **On-premises data gateway (personal)**. Please update your installation to use that version.
> 
> 

## Update to the latest version
A lot of issues can surface when the gateway version is out of date.  It is a good general practice to make sure you are on the latest version.  If you haven't updated the gateway for a month, or longer, you may want to consider installing the latest version of the gateway and see if you can reproduce the issue.

## Installation
**Personal gateway is 64bit** - If your machine is 32bit, you will not be able to install the personal gateway. Your operating system needs to be 64bit. You will need to install a 64bit version of Windows, or install the personal gateway on a 64bit machine.

**Personal gateway fails to install as a service even though you are a local administrator for the computer** - Installation can fail if the user is in the computer’s local Administrator group, but group policy does not allow that username to log on as a service.  At the moment, ensure the group policy allows a user to log on as a service. We’re working on a fix for this issue. [Learn more](https://technet.microsoft.com/library/cc739424.aspx)

**Operation timed out** - This is common if the computer (physical machine or VM) on which you’re installing the personal gateway has a single core processor. Close any applications and turn off any non-essential processes and try installing again.

**Data Management Gateway or Analysis Services Connector cannot be installed on the same computer as personal gateway** - If you already have an Analysis Services Connector or Data Management Gateway installed, you must first uninstall the Connector or the gateway and then try installing the personal gateway.

> [!NOTE]
> If you encounter an issue during installation, the setup logs could provide information to help you resolve the issue. See [Setup Logs](#SetupLogs) for more information.
> 
> 

 **Proxy configuration**
 You may encounter issues with configuring the personal gateway if your environment needs the use of a proxy. To learn more about how to configure proxy information, see [Configuring proxy settings for the Power BI Gateways](service-gateway-proxy.md)

## Schedule refresh
**Error: The credential stored in the cloud is missing.**

You could get this error in Settings for \<dataset\> if you have a scheduled refresh and then uninstalled and re-installed the personal gateway. When you uninstall a personal gateway, data source credentials for a dataset that has been configured for refresh are removed from the Power BI service.

**Solution:** In Power BI, go to the refresh settings for a dataset. In Manage Data Sources, for any data source with an error, click Edit credentials and sign in to the data source again.

**Error: The credentials provided for the dataset are invalid. Please update the credentials through a refresh or in the Data Source Settings dialog to continue.**

**Solution**: If you get a credentials message, it could mean:

* Make sure usernames and passwords used to sign into data sources are up to date. In Power BI, go to refresh settings for the dataset. In Manage Data Sources, click Edit credentials to update the credentials for the data source.
* Mashups between a cloud source and an on-premises source, in a single query, will fail to refresh in the personal gateway if one of the sources is using OAuth for authentication. An example of this is a mashup between CRM Online and a local SQL Server. This will fail because CRM Online requires OAuth.
  
  This is a known issue, and being looked at. To work around the problem, have a separate query for the cloud source and the on-premises source and use a merge or append query to combine them.

**Error: Unsupported data source.**

**Solution:** If you get an unsupported data source message in Schedule Refresh settings, it could mean: 

* The data source is not currently supported for refresh in Power BI. 
* The Excel workbook does not contain a data model, only worksheet data. Power BI currently only supports refresh if the uploaded Excel workbook contains a data model. When you import data using Power Query in Excel, be sure to choose the option to Load data to data model. This ensures data is imported into a data model. 

**Error: [Unable to combine data] &lt;query part&gt;/&lt;…&gt;/&lt;…&gt; is accessing data sources that have privacy levels which cannot be used together. Please rebuild this data combination.**

**Solution**: This error is due to the privacy level restrictions and the types of data sources you are using.

**Error: Data source error: We cannot convert the value "\[Table\]" to type Table.**

**Solution**: This error is due to the privacy level restrictions and the types of data sources you are using.

**Error: There is not enough space for this row.**

This will occur if you have a single row greater than 4 MB in size. You will need to determine what the row is from your data source and attempt to filter it out or reduce the size for that row.

## Data sources
**Missing data provider** – The personal gateway is 64-bit only. It requires a 64-bit version of the data providers to be installed on the same computer where the personal gateway is installed. For example, if the data source in the dataset is Microsoft Access, you must install the 64-bit ACE provider on the same computer where you installed the personal gateway.  

>[!NOTE]
>If you have 32 bit Excel, you cannot install a 64-bit ACE provider on the same computer.

**Windows authentication is not supported for Access database** - Power BI currently only supports anonymous for Access database. We are working on enabling Windows authentication for Access database.

**Sign in error when entering credentials for a datasource** - If you get an error similar to this when entering Windows credentials for a data source, you might still be on an older version of the personal gateway. [Install the latest version of Power BI Gateway - Personal](https://powerbi.microsoft.com/gateway/).

  ![](media/service-admin-troubleshooting-power-bi-personal-gateway/pbi_pg_credentialserror.jpg.png)

**Error: Sign in error when selecting Windows authentication for a data source using ACE OLEDB** - If you get the following error when entering data source credentials for a data source using ACE OLEDB provider:

![](media/service-admin-troubleshooting-power-bi-personal-gateway/aceoledberror.png)

Power BI does not currently support Windows authentication for a data source using ACE OLEDB provider.

**Solution:** To work around this error, you can select Anonymous authentication. For legacy ACE OLEDB provider, Anonymous credentials are equivalent to Windows credentials.

## Tile refresh
If you are receiving an error with dashboard tiles refreshing, please refer to the following article.

[Troubleshooting tile errors](refresh-troubleshooting-tile-errors.md)

## Tools for troubleshooting
### Refresh History
**Refresh History** can help you see what errors have occurred, as well as provide useful data if you should need to create a support request. You can view both scheduled, as well as on demand, refreshes. Here is how you can get to the **Refresh History**.

1. In the Power BI navigation pane, in **Datasets**, select a dataset &gt; Open Menu &gt; **Schedule Refresh**.
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/scheduled-refresh.png)
2. In **Settings for...** &gt; **Schedule Refresh**, select **Refresh History**.  
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/scheduled-refresh-2.png)
   
   ![](media/service-admin-troubleshooting-power-bi-personal-gateway/refresh-history.png)

### Event logs
There are several event logs that can provide information. The first two, **Data Management Gateway** and **PowerBIGateway**, are present if you are an admin on the machine.  If you are not an admin, and you are using the Personal Gateway, you will see the log entries within the **Application** log.

The **Data Management Gateway** and **PowerBIGateway** logs are present under **Application and Services Logs**.

![](media/service-admin-troubleshooting-power-bi-personal-gateway/event-logs.png)

### Fiddler trace
[Fiddler](http://www.telerik.com/fiddler) is a free tool from Telerik that monitors HTTP traffic.  You can see the back and forth with the Power BI service from the client machine. This may show errors and other related information.

![](media/service-admin-troubleshooting-power-bi-personal-gateway/fiddler.png)

<a name="SetupLogs"></a>

### Setup Logs
If the **Personal Gateway**, fails to install, you will see a link to show the setup log. This could show you details about the failure. These are Windows Install logs, or also knows as MSI logs. They can be fairly complex and hard to read. Typically the resulting error will be at the bottom, but determining the cause of the error is not trivial. It could be a result of errors in a different log, or be a result of an error higher up in the log.

![](media/service-admin-troubleshooting-power-bi-personal-gateway/setup-log.png)

Alternatively, you can go to your **Temp folder** (%temp%) and look for files that start with **Power\_BI\_**.

> [!NOTE]
> Going to %temp% may take you to a subfolder of temp.  The **Power\_BI\_** files will be in the root of the temp directory.  You may need to go up a level or two.
> 
> 

![](media/service-admin-troubleshooting-power-bi-personal-gateway/setup-logs2.png)

## Next steps
[Configuring proxy settings for the Power BI Gateways](service-gateway-proxy.md)  
[Data Refresh](refresh-data.md)  
[Power BI Gateway - Personal](service-gateway-personal-mode.md)  
[Troubleshooting tile errors](refresh-troubleshooting-tile-errors.md)  
[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

