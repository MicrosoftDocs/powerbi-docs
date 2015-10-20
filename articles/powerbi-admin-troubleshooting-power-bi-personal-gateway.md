<properties 
   pageTitle="Troubleshooting Power BI Personal Gateway"
   description="Troubleshooting Power BI Personal Gateway"
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
   ms.date="09/28/2015"
   ms.author="v-anpasi"/>
# Troubleshooting Power BI Personal Gateway

## Installation

**Personal Gateway fails to install** - Personal Gateway can install can fail if the user is in the computer’s local Administrator group, but group policy does not allow that username to log on as a service.  At the moment, ensure the group policy allows a user to log on as a service. We’re working on a fix for this issue. 

**Operation timed out** - This is common if the computer (physical machine or VM) on which you’re installing the Personal Gateway has a single core processor. Close any applications and turn off any non-essential processes and try installing again.

**Data Management Gateway or Analysis Services Connector cannot be installed on the same computer as Personal Gateway** - If you already have an Analysis Services Connector or Data Management Gateway installed, you must first uninstall the Connector or the Gateway and then try installing the Personal Gateway.

## Schedule Refresh

**Error: The credential stored in the cloud is missing.**

You could get this error in Settings for \<dataset\> if you have a scheduled refresh and then uninstalled and re-installed the Personal Gateway. When you uninstall a Personal Gateway, data source credentials for a dataset that has been configured for refresh are removed from the Power BI service.

**Solution:** In Power BI, go to the refresh settings for a dataset. In Manage Data Sources, for any data source with an error, click Edit credentials and sign in to the data source again.

**Error: The credentials provided for the dataset are invalid. Please update the credentials through a refresh or in the Data Source Settings dialog to continue.**

**Solution**: Make sure usernames and passwords used to sign into data sources are up to date. In Power BI, go to refresh settings for the dataset. In Manage Data Sources, click Edit credentials to update the credentials for the data source.

**Error: Unsupported data source.**

**Solution:** If you get an unsupported data source message in Schedule Refresh settings, it could mean: 

-   The data source is not currently supported for refresh in Power BI. 

-   The Excel workbook does not contain a data model, only worksheet data. Power BI currently only supports refresh if the uploaded Excel workbook contains a data model. When you import data using Power Query in Excel, be sure to choose the option to Load data to data model. This ensures data is imported into a data model. 

## Data sources

**Missing data provider** – Power BI Personal Gateway is 64-bit only. It requires a 64-bit version of the data providers to be installed on the same computer where the Personal Gateway is installed. For example, if the data source in the dataset is Microsoft Access, you must install the 64-bit ACE provider on the same computer where you installed the Personal Gateway.  **Note:** if you have 32 bit Excel, you cannot install a 64-bit ACE provider on the same computer.

**Windows authentication is not supported for Access database -** Power BI currently only supports anonymous for Access database. We are working on enabling Windows authentication for Access database.

**Sign in error when entering credentials for a datasource** - If you get an error similar to this when entering Windows credentials for a datasource, you might still be on the preview version of the Personal Gateway. [Install the latest version of Power BI Personal Gateway](http://go.microsoft.com/fwlink/?LinkId=534231) from Downloads in Power BI..

  ![](media/powerbi-admin-troubleshooting-power-bi-personal-gateway/PBI_PG_CredentialsError.jpg.png)

**﻿Error: Sign in error when selecting Windows authentication for a data source using ACE OLEDB** - If you get the following error when entering data source credentials for a data source using ACE OLEDB provider:

![](media/powerbi-admin-troubleshooting-power-bi-personal-gateway/ACEOLEDBerror.png)

Power BI does not currently support Windows authentication for a data source using ACE OLEDB provider.

**Solution:** To workaround this error, you can select Anonymous authentication. For legacy ACE OLEDB provider, Anonymous credentials are equivalent to Windows credentials.
