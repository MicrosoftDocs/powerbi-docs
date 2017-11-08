---
title: Power BI Gateway - Personal
description: Power BI Gateway - Personal
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 09/06/2017
ms.author: davidi

---
# Power BI Gateway - Personal
> **Note:** There is a new version of the personal gateway for Power BI, called the **On-premises data gateway (personal mode)**. The following article describes the previous version of the personal gateway, called **Power BI Gateway - Personal**, which will be retired and stop working after July 31, 2017. For information about the new version of the personal gateway, including how to install the new version, see the [**On-premises data gateway (personal mode)** article](service-gateway-personal-mode.md).
> 
> 

The **Power BI Gateway - Personal** acts as a bridge, providing quick and secure data transfer between the Power BI service and on-premises data sources that support [refresh](refresh-data.md). This article is meant to provide you with an in-depth understanding of how the gateway works and whether or not a gateway is necessary for you. We've also put together this [helpful video](https://www.youtube.com/watch?v=de58vROLqZI) about the personal gateway. 

It installs and runs as a service on your computer. As a service, it runs using a Windows account you  specify during configuration. In some cases, the Gateway runs as an application. We'll go into more about that later.

When Power BI refreshes data from an on-premises data source, the gateway assures your Power BI account has the right permissions to connect to and query data from the source.

Data transfer between Power BI and the gateway is secured through [Azure Service Bus](http://azure.microsoft.com/documentation/services/service-bus/). The Service Bus creates a secure channel between the Power BI service and your computer. Because the gateway provides this secure connection, there’s usually no need to open a port in your firewall.

Before we go into details about the gateway, let’s look at some terms used in Power BI:

A *dataset* is data uploaded into the Power BI service from an online or on-premises data source. You create a dataset when you use Get Data to connect to and upload data. Datasets appear in the My Workspace pane of your Power BI Workspace in your browser. When you create reports and pin tiles to your dashboards, you’re looking at data from your datasets.

A *data source* is where the data you upload into a dataset really comes from. It can be just about anything; a database,  Excel worksheet, Web service, etc. With Excel workbooks, you can create a simple worksheet with rows of data, and that is considered a data source. You can also use Power Query or Power Pivot in Excel to connect to and query data from both online and on-premises data sources, all in the same workbook. With Power BI Desktop, you use Get Data to connect to and query data from both online and on-premises data sources.

The personal gateway is installed through the On-Premises Data Gateay. You can download it on the [Power BI Gateway page](https://powerbi.microsoft.com/gateway/).

## Do I need a gateway?
Before you install a gateway, it's important to know whether or not you really need one. It really depends on your data sources:

### On-premises data sources
A personal gateway *is required* in order to refresh datasets that get data from a supported on-premises data source in your organization.

With a gateway, REFRESH NOW and SCHEDULE REFRESH are supported for datasets uploaded from:

* Microsoft Excel 2013 (or later) workbooks where Power Query or Power Pivot is used to connect to and query data from a supported on-premises data source. All on-premises data sources shown in Get External Data in Power Query or Power Pivot support refresh except for Hadoop file (HDFS) and Microsoft Exchange.
* Microsoft Power BI Desktop files where Get Data is used to connect to and query data from a supported on-premises data source. All on-premises data sources shown in Get Data support refresh except for Hadoop file (HDFS) and Microsoft Exchange.

### Online data sources
A gateway *is only required* if you are using the [**Web.Page**](https://msdn.microsoft.com/library/mt260924.aspx) function. In other cases, a gateway is *not* required in order to refresh datasets that get data only from an online data source.

> Note: If you are using the [**Web.Page**](https://msdn.microsoft.com/library/mt260924.aspx) function, you only need a gateway if you have republished the dataset or your report after November 18th, 2016.
> 
> 

REFRESH NOW and SCHEDULE REFRESH are supported without a gateway for datasets uploaded from:

* Content packs from online data sources (content packs\\services). By default, datasets from content packs are automatically updated once a day, but you can also refresh manually or setup a refresh schedule.
* Microsoft Excel 2013 (or later) workbooks where Power Query or Power Pivot is used to connect to and query data from an online data source.
* Microsoft Power BI Desktop files where Get Data is used to connect to and query data from an online data source.

**Question:** What if my Excel workbook or Power BI Desktop file gets data from both online and on-premises data sources?

**Answer:** A gateway *is* required. You will need to install and configure a gateway in order to refresh data from  your on-premises data sources.

**Question:** What if my Excel workbook just has rows of data I typed in?**

**Answer:** A gateway *is not* required. You only need to install and configure a gateway if your workbook uses Power Query or Power Pivot to query and load data to the data model from a supported on-premises data source

## Setting up a gateway for the first time
Setting up a gateway for the first time is a three step process:

1. Download and install a gateway
2. Configure the gateway
3. Sign in to data sources in Power BI

Let’s take a closer look at each step.

### Download and install a gateway
> **Note:** There is a new version of the personal gateway for Power BI, called the **On-premises data gateway (personal mode)**. This article describes the previous version of the personal gateway, called **Power BI Gateway - Personal**, which will be retired and stop working after July 31, 2017. For information about the new version of the personal gateway, including how to install the new version, see the [**On-premises data gateway (personal mode)** article](service-gateway-personal-mode.md).
> 
> 

You’ll be prompted to install a gateway when you click on REFRESH NOW or SCHEDULE REFRESH for a supported dataset for the first time. Or, to download the gateway, select **Data Gateway** under the Downloads menu. Download the [On-premises data gateway](http://go.microsoft.com/fwlink/?LinkID=820925).

You will want to select **Personal Gateway** instead of **On-premises data gateway** to have a gateway that is for yourself.

There’s really not much to installing a gateway. You’ll select a location to install to, and read and accept the license agreement just like any other application. There are however some important things to know. In particular, the type of computer you install the gateway on and the type of account you’re logged in to Windows with on that computer.

> [!NOTE]
> The gateway needs to have access to the data source. If your personal machine cannot connect to the data source, you may want to consider installing an [On-premises Data Gateway](service-gateway-onprem.md) on a machine that does have access to the data source. An example of this would be SQL Server installed on an virtual machine (VM) hosted in Azure. You personal machine may not have access to the VM. You could install the On-Premises Data Gateway on the VM instead, and configure the a data source within the Power BI service.
> 
> 

### Computer type
The type of computer you install the gateway on is important.

> [!NOTE]
> The personal gateway is supported only on 64-bit Windows operating systems.
> 
> 

On a laptop computer - In order for a scheduled refresh to occur, the gateway needs to be up and running. Laptop computers are usually shut down or asleep more than they’re running. If you install your gateway on a laptop, be sure to set your scheduled refresh times for when the laptop will be running. If it isn’t, the refresh will not be attempted again until the next scheduled refresh time.

On a desktop computer – Not many issues here. Just make sure the computer and the gateway is running at your scheduled refresh times. Many desktop computers go to sleep, scheduled refresh cannot occur if it’s asleep.

Once you install a gateway, you won’t have to install another. One gateway will work for any number of supported datasets. You also don’t have to install the gateway on the same computer you upload your workbook and Power BI Desktop files from. Here’s an example: Let’s say you have an Excel workbook that connects to a SQL Server data source in your organization. You used Get Data in Power BI to upload the workbook from your laptop computer. You also have a desktop computer you leave running all the time, and you’ve installed and configured a gateway on that computer. In Power BI, you’ve signed in to your data sources, and you’ve setup a refresh schedule for the dataset.  When a scheduled refresh time comes, Power BI makes a secure connection to the gateway installed on your desktop computer. It then securely connects to the data sources to get updates. For refresh, there’s no communication with the original workbook you uploaded from your laptop computer.

> [!NOTE]
> You can install the personal and enterprise gateways on the same computer.
> 
> 

### Windows account
When you install the gateway, you’ll be logged in to your computer using your Windows account. The type of permissions your Windows account has will have an effect on how the gateway is installed and how it is run in Windows.

When you’re logged into Windows:

|  | With Administrator permissions | Without Administrator permissions |
| --- | --- | --- |
| **Power BI Gateway - Personal runs as a** |Service |Application |
| **Scheduled Refresh** |As long as your computer and the gateway service is running, you do not have to be logged in at the scheduled refresh time. |You must be logged in to your computer at the scheduled refresh time. |
| **Change Windows account password** |You must change your Password in the gateway service. If the account password used by the gateway is no longer valid, refresh will fail. |The gateway will always run using the account and password you are currently logged in with. If you aren’t logged in to Windows, the gateway will not be running and refresh will fail. |

### Configure the gateway
When the Installation Wizard finishes, you’ll be prompted to launch the Configuration Wizard. There’s really not much to configuring a gateway. You’ll need to sign in to Power BI from the Wizard. This is necessary for the Wizard to establish a connection with your Power BI account in the Power BI service.

If you’re logged in to Windows with an account with Administrator permissions, you’ll be asked to enter your Windows account credentials. You can specify a different Windows account, but remember the permissions determine how the gateway is run. The gateway service will run using this account.

### Sign in to data sources
Once the Configuration Wizard finishes and your gateway is up and running, you’ll have to specify an Authentication type and sign in to each of your dataset’s data sources. You'll complete this step in Power BI.

![](media/personal-gateway/pg_dataset_settings_signin.png)

You only need to specify an authentication type and sign in to a data source once. You sign in from the **Manage Data Sources** section in a dataset’s Settings screen. If you have multiple data sources, you’ll have to sign in to each one. The gateway determines a default Authentication type depending on the data source. In most cases, it’s Windows authentication; however, in some cases, your data source might require a different authentication type. If you’re unsure, check with your data source administrator.

## Up and running!
When your gateway is up and running, you can click SCHEDULE REFRESH for a dataset where you’ll see your dataset’s Settings page.

![](media/personal-gateway/pg_awintsales_settings.png)

This page shows:

1. Refresh status – Shows refresh success and next scheduled refresh time.
2. **Gateway** - Shows whether or not a gateway is installed and online. If a gateway is installed but not online, Manage Data Sources and Schedule Refresh settings are disabled.
3. **Manage Data Sources** - Shows data sources the dataset connects to. You can Sign in or change the authentication type. You’ll only need to Sign in to each data source once.
4. **Schedule Refresh** – You can configure a refresh schedule settings here. If the gateway isn’t online, these settings will be disabled.
5. Refresh failure notifications – This option, selected by default, will send an e-mail to you if a scheduled refresh fails.

## Updating your Windows account password
If you were logged into your computer with a Windows account with administrator privileges when you installed your gateway, it runs as a service using the Windows account you specified in the Configuration Wizard. Most often, this will be the same Windows account you log in to your computer with. When you change your Windows account password, you’ll also need to change it in the gateway, otherwise the service might not be running and refresh will fail. To change your Windows account password for the gateway, select the personal gateway icon on your Windows Desktop Taskbar, or in Apps.

![](media/personal-gateway/pg_programicon.png)

From here, you can update your password and check your gateway's connection status.

![](media/personal-gateway/pg_credentials.png)

## Ports
The gateway communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 thru 9354.  The gateway does not require inbound ports.

| Domain names | Outbound ports | Description |
| --- | --- | --- |
| *.powerbi.com |443 |HTTPS |
| *.analysis.windows.net |443 |HTTPS |
| *.login.windows.net |443 |HTTPS |
| *.servicebus.windows.net |5671-5672 |Advanced Message Queuing Protocol (AMQP) |
| *.servicebus.windows.net |443, 9350-9354 |Listeners on Service Bus Relay over TCP (requires 443 for Access Control token acquisition) |
| *.frontend.clouddatahub.net |443 |HTTPS |
| *.core.windows.net |443 |HTTPS |
| login.microsoftonline.com |443 |HTTPS |
| login.windows.net |443 |HTTPS |

If you need to white list IP addresses instead of the domains, you can download and use the Microsoft Azure Datacenter IP ranges list. [Download](https://www.microsoft.com/download/details.aspx?id=41653)

## See also
[On-premises data gateway (personal mode) - the new version of the personal gateway](service-gateway-personal-mode.md)

[Configuring proxy settings for the Power BI Gateways](service-gateway-proxy.md)  
[Power BI Premium](service-premium.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

