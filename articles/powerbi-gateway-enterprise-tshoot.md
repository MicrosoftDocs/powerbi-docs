<properties
pageTitle="Troubleshoot the enterprise gateway"
description="Troubleshooting the enterprise gateway"
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
editor=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="01/25/2016"
ms.author="asaxton"/>
# Troubleshooting the Power BI Gateway - Enterprise

## Configuration

**Collecting logs from the gateway configurator**

You can start the configurator in a debug mode which will collect logs which can be used to troubleshoot issues when trying to configure the gateway. From a command prompt, pass */troubleshoot* to the configurator when you launch it. The default path for the configurator is the following.

    C:\Program Files\Power BI Enterprise Gateway

The command line would look something like this.

    EnterpriseGatewayConfigurator.exe /troubleshoot
	
On the dialog screen, you will see a gear icon in the upper right.

![](media/powerbi-gateway-enterprise-tshoot/egw-tshoot1.png)
  
After you walk through the steps, and close the configurator, it will place a zip file on the desktop. It may take a minute for the zip file to show. This zip file will contain several log files which can be used to diagnose further. The file name will look like the following.

    EnterpriseGatewayLogs 2015-12-01T14_39_32.zip

**Error: Failed to create gateway. Please try again.**

All of the details are available, but the call to the Power BI service returned an error.  The error, and an activity id, will be displayed. This could happy for different reasons. You can collect, and review, the logs as mentioned above to get more details. 

This could also be due to proxy configuration issues. The user interface does now allow for proxy configuration. You would need to modify the *enterprisegatewayconfigurator.exe.config* with the correct proxy information. [Learn more](https://msdn.microsoft.com/library/kd3cf2ex.aspx)

**Error: Failed to update gateway details.  Please try again.**

Information was received from the Power BI service, to the gateway. The information was passed onto the local windows service, but it failed to return. Or, a symmetric key generation failed. The inner exception will be displayed under **Show details**. You can collect, and review, the logs as mentioned above to get more details. 

**Error: Power BI service reported local gateway as unreachable. Please restart the gateway and try again.**

At the end of configuration, the Power BI service will be called again to validate the gateway. The Power BI service does not report the gateway as *live*. Restarting the windows service may allow the communication to be successful. You can collect, and review, the logs as mentioned above to get more details. 

## Data sources

**Error: Unable to Connect. Details: "Invalid connection credentials"**

Within **Show details**, it should display the error message received from the data source. For SQL Server, you should see something like the following.

    Login failed for user 'username'.

Verify that you have the correct username and password. Also verify that those credentials can successfully connect to the data source. Make sure the account being used matches the **Authentication Method**.

**Error: Unable to Connect. Details: "Cannot connect to the database"**

We were able to connect to the server, but not to the database supplied. Verify the name of the database, and that the user credential as the proper permission to access that database.

Within **Show details**, it should display the error message received from the data source. For SQL Server, you should see something like the following.

    Cannot open database "AdventureWorks" requested by the login. The login failed. Login failed for user 'username'.

**Error: Unable to Connect. Details: "Unknown error in enterprise gateway"**

This error could occur for different reasons. Be sure to validate that you can connect to the data source from the machine hosting the gateway. This could be the result of the server not being accessible.

Within **Show details**, you will see an error code of **DM_GWPipeline_UnknownError**.

You can also look in the Event Logs > **Applications and Services Logs** > **Power BI Enterprise Gateway Service** for more details.

**Error: Unable to Connect. Details: "Data source access error"**

We were unable to connect to the specified data source. Be sure to validate the information provided for that data source.

Within **Show details**, you will see an error code of **DM_GWPipeline_Gateway_DataSourceAccessError**. 

If the underlying error message is similar to the following, this means that the account you are using for the data source is not a server admin for that Analysis Services instance. [Learn more](powerbi-gateway-enterprise-manage-ssas.md#add-a-data-source)

    The 'CONTOSO\account' value of the 'EffectiveUserName' XML for Analysis property is not valid.

**Unable to see enterprise gateway data sources in the 'Get Data' experience for Analysis Services from the Power BI site**

We haven’t yet integrated data sources from the enterprise gateway into the *Get Data* experience for Analysis Services from Power BI web. This will be coming soon.

To make use of data sources for Analysis Services, you can create a report within Power BI Desktop. Be sure that you select live data for Analysis Services. Then publish it to Power BI and it will make use of the enterprise gateway.

## Dataset

**Error: Couldn't refresh because your Personal Gateway is offline. Make sure your Personal Gateway is up and running.**

You may have configured an enterprise gateway, and see this error for a given dataset when you try to refresh. The enterprise gateway currently does not support imported data. It supports SQL Server and SAP HANA in DirectQuery mode, or live connections with Analysis Services, either Tabular or Multidimensional.

If you have imported data into your file, you will need the Personal Gateway to refresh the dataset.

## Reports

**Report could not access the data source because you do not have access to our data source via an enterprise gateway.**

This is usually caused by one of the following. 

1. The data source information does not match what is in the underlying dataset. The server and database name need to match between the data source defined for the enterprise gateway and what you supply within Power BI Desktop. If you use an IP Address in Power BI Desktop, the data source, for the enterprise gateway, needs to use an IP Address as well.

2. There is not a data source available on any enterprise gateway within your organization. You can configure the data source on a new, or existing, enterprise gateway.

## See also

[Power BI Gateway – Enterprise](powerbi-gateway-enterprise.md)

[Power BI Gateway - Enterprise in-depth](powerbi-gateway-enterprise-indepth.md)

[Manage your enterprise data source - SQL Server](powerbi-gateway-enterprise-manage.md)

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)
