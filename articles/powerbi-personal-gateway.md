<properties 
   pageTitle="Power BI Personal Gateway"
   description="Power BI Personal Gateway"
   services="powerbi" 
   documentationCenter="" 
   authors="v-anpasi" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/18/2015"
   ms.author="v-anpasi"/>

# Power BI Personal Gateway

Power BI Personal Gateway acts as a bridge, providing quick and secure data transfer between the Power BI service and on-premises data sources that support [refresh](https://support.powerbi.com/knowledgebase/articles/474669-refresh-data-in-power-bi). This article is meant to provide you with an in-depth understanding of how the Gateway works and whether or not a Gateway is necessary for you. We've also put together this [helpful video](https://www.youtube.com/watch?v=de58vROLqZI) about the Power BI Personal Gateway. 

Power BI Gateway is only available with [Power BI Pro](https://support.powerbi.com/knowledgebase/articles/685479). It installs and runs as a service on your computer. As a service, it runs using a Windows account you  specify during configuration. In some cases, the Gateway runs as an application. We'll go into more about that later.

When Power BI refreshes data from an on-premises data source, the Gateway assures your Power BI account has the right permissions to connect to and query data from the source.

Data transfer between Power BI and the Gateway is secured through [Azure Service Bus](http://azure.microsoft.com/en-us/documentation/services/service-bus/). The Service Bus creates a secure channel between the Power BI service and your computer. Because the Gateway provides this secure connection, there’s usually no need to open a port in your firewall.

Before we go into details about the Gateway, let’s look at some terms used in Power BI:

A *dataset* is data uploaded into the Power BI service from an online or on-premises data source. You create a dataset when you use Get Data to connect to and upload data. Datasets appear in the My Workspace pane of your Power BI Workspace in your browser. When you create reports and pin tiles to your dashboards, you’re looking at data from your datasets.

A *data source* is where the data you upload into a dataset really comes from. It can be just about anything; a database,  Excel worksheet, Web service, etc. With Excel workbooks, you can create a simple worksheet with rows of data, and that is considered a data source. You can also use Power Query or Power Pivot in Excel to connect to and query data from both online and on-premises data sources, all in the same workbook. With Power BI Desktop, you use Get Data to connect to and query data from both online and on-premises data sources.

## Do I need a Gateway?

Before you install a Gateway, it's important to know whether or not you really need one. It really depends on your data sources:

### On-premises data sources

A Power BI Personal Gateway *is required* in order to refresh datasets that get data from a supported on-premises data source in your organization.

With a Gateway, REFRESH NOW and SCHEDULE REFRESH are supported for datasets uploaded from:

-   Microsoft Excel 2013 (or later) workbooks where Power Query or Power Pivot is used to connect to and query data from a supported on-premises data source. All on-premises data sources shown in Get External Data in Power Query or Power Pivot support refresh except Microsoft Exchange, Active Directory and ODBC.

-   Microsoft Power BI Desktop files where Get Data is used to connect to and query data from a supported on-premises data source. All on-premises data sources shown in Get Data support refresh except Microsoft Exchange, Active Directory and ODBC.

### Online data sources

A Power BI Personal Gateway *is not required* in order to refresh datasets that get data only from an online data source.

REFRESH NOW and SCHEDULE REFRESH are supported without a Gateway for datasets uploaded from:

-   Content packs from online data sources (content packs\\services). By default, datasets from content packs are automatically updated once a day, but you can also refresh manually or setup a refresh schedule.

-   Microsoft Excel 2013 (or later) workbooks where Power Query or Power Pivot is used to connect to and query data from an online data source.

-   Microsoft Power BI Desktop files where Get Data is used to connect to and query data from an online data source.

**Question:** What if my Excel workbook or Power BI Desktop file gets data from both online and on-premises data sources?

**Answer:** A Gateway *is* required. You will need to install and configure a Gateway in order to refresh data from  your on-premises data sources.

**Question:** What if my Excel workbook just has rows of data I typed in?**

**Answer:** A Gateway *is not* required. You only need to install and configure a Gateway if your workbook uses Power Query or Power Pivot to query and load data to the data model from a supported on-premises data source

## Setting up a Gateway for the first time

Setting up a Gateway for the first time is a three step process:

1.  Download and install a Gateway

2.  Configure the Gateway

3.  Sign in to data sources in Power BI

Let’s take a closer look at each step.

### Download and install a Gateway

You’ll be prompted to install a Gateway when you click on REFRESH NOW or SCHEDULE REFRESH for a supported dataset for the first time. Or, if in Power BI, you click on Power BI Personal Gateway in Downloads.

There’s really not much to installing a Gateway. You’ll select a location to install to, and read and accept the license agreement just like any other application. There are however some important things to know. In particular, the type of computer you install the Gateway on and the type of account you’re logged in to Windows with on that computer.

### Computer type

The type of computer you install the Gateway on is important.

**Note:** Power BI Personal Gateway is supported only on 64-bit Windows operating systems.

On a laptop computer - In order for a scheduled refresh to occur, the Gateway needs to be up and running. Laptop computers are usually shut down or asleep more than they’re running. If you install your Gateway on a laptop, be sure to set your scheduled refresh times for when the laptop will be running. If it isn’t, the refresh will not be attempted again until the next scheduled refresh time.

On a desktop computer – Not many issues here. Just make sure the computer and the Gateway is running at your scheduled refresh times. Many desktop computers go to sleep, scheduled refresh cannot occur if it’s asleep.

Once you install a Gateway, you won’t have to install another. One Gateway will work for any number of supported datasets. You also don’t have to install the Gateway on the same computer you upload your workbook and Power BI Desktop files from. Here’s an example: Let’s say you have an Excel workbook that connects to a SQL Server data source in your organization. You used Get Data in Power BI to upload the workbook from your laptop computer. You also have a desktop computer you leave running all the time, and you’ve installed and configured a Gateway on that computer. In Power BI, you’ve signed in to your data sources, and you’ve setup a refresh schedule for the dataset.  When a scheduled refresh time comes, Power BI makes a secure connection to the Gateway installed on your desktop computer. It then securely connects to the data sources to get updates. For refresh, there’s no communication with the original workbook you uploaded from your laptop computer.

**Note:** You cannot install a Gateway on the same computer as a Power BI Analysis Services Connector. This usually isn’t a problem since only one Connector is needed in environments that have Analysis Services as a data source, and it’s typically installed on the Analysis Services server itself. To learn more about the Connector, see [Power BI Analysis Services Connector in-depth](https://support.powerbi.com/knowledgebase/articles/546004-power-bi-analysis-services-connector-in-depth).

### Windows account

When you install the Gateway, you’ll be logged in to your computer using your Windows account. The type of permissions your Windows account has will have an effect on how the Gateway is installed and how it is run in Windows.

When you’re logged into Windows:


||With Administrator permissions|Without Administrator permissions|
|---|---|---|
|**Power BI Personal Gateway runs as a**|Service|Application|
|**Scheduled Refresh**|As long as your computer and the Gateway service is running, you do not have to be logged in at the scheduled refresh time.|You must be logged in to your computer at the scheduled refresh time.|
|**Change Windows account password**|You must change your Password in the Gateway service. If the account password used by the Gateway is no longer valid, refresh will fail.|The Gateway will always run using the account and password you are currently logged in with. If you aren’t logged in to Windows, the Gateway will not be running and refresh will fail.|

### Configure the Gateway

When the Installation Wizard finishes, you’ll be prompted to launch the Configuration Wizard. There’s really not much to configuring a Gateway. You’ll need to sign in to Power BI from the Wizard. This is necessary for the Wizard to establish a connection with your Power BI account in the Power BI service.

If you’re logged in to Windows with an account with Administrator permissions, you’ll be asked to enter your Windows account credentials. You can specify a different Windows account, but remember the permissions determine how the Gateway is run. The Gateway service will run using this account.

### Sign in to data sources

Once the Configuration Wizard finishes and your Gateway is up and running, you’ll have to specify an Authentication type and sign in to each of your dataset’s data sources. You'll complete this step in Power BI.

![](media/powerbi-personal-gateway/PG_Dataset_Settings_SignIn.png)

You only need to specify an authentication type and sign in to a data source once. You sign in from the **Manage Data Sources** section in a dataset’s Settings screen. If you have multiple data sources, you’ll have to sign in to each one. The Gateway determines a default Authentication type depending on the data source. In most cases, it’s Windows authentication; however, in some cases, your data source might require a different authentication type. If you’re unsure, check with your data source administrator.

## Up and running!

When your Gateway is up and running, you can click SCHEDULE REFRESH for a dataset where you’ll see your dataset’s Settings page.

![](media/powerbi-personal-gateway/PG_AWIntSales_Settings.png)

This page shows:

1.  Refresh status – Shows refresh success and next scheduled refresh time.

2.  **Gateway** - Shows whether or not a Gateway is installed and online. If a Gateway is installed but not online, Manage Data Sources and Schedule Refresh settings are disabled.

3.  **Manage Data Sources** - Shows data sources the dataset connects to. You can Sign in or change the authentication type. You’ll only need to Sign in to each data source once.

4. **Schedule Refresh** – You can configure a refresh schedule settings here. If the Gateway isn’t online, these settings will be disabled.

5. Refresh failure notifications – This option, selected by default, will send an e-mail to you if a scheduled refresh fails.

## Updating your Windows account password

If you were logged into your computer with a Windows account with administrator privileges when you installed your Gateway, it runs as a service using the Windows account you specified in the Configuration Wizard. Most often, this will be the same Windows account you log in to your computer with. When you change your Windows account password, you’ll also need to change it in the Gateway, otherwise the service might not be running and refresh will fail. To change your Windows account password for the Gateway, click on the Power BI Personal Gateway icon on your Windows Desktop Taskbar, or in Apps.

![](media/powerbi-personal-gateway/PG_ProgramIcon.png)

From here, you can update your password and check your Gateway's connection status.

![](media/powerbi-personal-gateway/PG_Credentials.png)

## Ports

Power BI Personal Gateway communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 thru 9354. The Gateway does not require inbound ports.

## Troubleshooting

If you're having trouble when installing and configuring a Personal Gateway, be sure to see [Troubleshooting Power BI Personal Gateway](https://support.powerbi.com/knowledgebase/articles/666367-troubleshooting-power-bi-personal-gateway).

