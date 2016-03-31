<properties 
   pageTitle="Troubleshooting Power BI Personal Gateway"
   description="Troubleshooting Power BI Personal Gateway"
   services="powerbi" 
   documentationCenter="" 
   authors="guyinacube" 
   manager="mblythe" 
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/09/2016"
   ms.author="asaxton"/>
# Troubleshooting Power BI Personal Gateway

## Installation

**Personal Gateway fails to install as a service even though you are a local administrator for the computer** - Installation can fail if the user is in the computer’s local Administrator group, but group policy does not allow that username to log on as a service.  At the moment, ensure the group policy allows a user to log on as a service. We’re working on a fix for this issue. [Learn more](https://technet.microsoft.com/library/cc739424.aspx)

**Operation timed out** - This is common if the computer (physical machine or VM) on which you’re installing the Personal Gateway has a single core processor. Close any applications and turn off any non-essential processes and try installing again.

**Data Management Gateway or Analysis Services Connector cannot be installed on the same computer as Personal Gateway** - If you already have an Analysis Services Connector or Data Management Gateway installed, you must first uninstall the Connector or the Gateway and then try installing the Personal Gateway.

## Schedule Refresh

**Error: The credential stored in the cloud is missing.**

You could get this error in Settings for \<dataset\> if you have a scheduled refresh and then uninstalled and re-installed the Personal Gateway. When you uninstall a Personal Gateway, data source credentials for a dataset that has been configured for refresh are removed from the Power BI service.

**Solution:** In Power BI, go to the refresh settings for a dataset. In Manage Data Sources, for any data source with an error, click Edit credentials and sign in to the data source again.

**Error: The credentials provided for the dataset are invalid. Please update the credentials through a refresh or in the Data Source Settings dialog to continue.**

**Solution**: If you get a credentials message, it could mean:

-   Make sure usernames and passwords used to sign into data sources are up to date. In Power BI, go to refresh settings for the dataset. In Manage Data Sources, click Edit credentials to update the credentials for the data source.

-   Mashups between a cloud source and an on-premises source, in a single query, will fail to refresh in the personal gateway if one of the sources is using OAuth for authentication. An example of this is a mashup between CRM Online and a local SQL Server. This will fail because CRM Online requires OAuth.

    This is a known issue, and being looked at. To work around the problem, have a separate query for the cloud source and the on-premises source and use a merge or append query to combine them.

**Error: Unsupported data source.**

**Solution:** If you get an unsupported data source message in Schedule Refresh settings, it could mean: 

-   The data source is not currently supported for refresh in Power BI. 

-   The Excel workbook does not contain a data model, only worksheet data. Power BI currently only supports refresh if the uploaded Excel workbook contains a data model. When you import data using Power Query in Excel, be sure to choose the option to Load data to data model. This ensures data is imported into a data model. 

**Error: [Unable to combine data] &lt;query part&gt;/&lt;…&gt;/&lt;…&gt; is accessing data sources that have privacy levels which cannot be used together. Please rebuild this data combination.**

**Solution**: This error is due to the privacy level restrictions and the types of data sources you are using. [Learn more](powerbi-refresh-enable-fast-combine.md)

**Error: Data source error: We cannot convert the value "\[Table\]" to type Table.**

**Solution**: This error is due to the privacy level restrictions and the types of data sources you are using. [Learn more](powerbi-refresh-enable-fast-combine.md)

## Data sources

**Missing data provider** – Power BI Personal Gateway is 64-bit only. It requires a 64-bit version of the data providers to be installed on the same computer where the Personal Gateway is installed. For example, if the data source in the dataset is Microsoft Access, you must install the 64-bit ACE provider on the same computer where you installed the Personal Gateway.  **Note:** if you have 32 bit Excel, you cannot install a 64-bit ACE provider on the same computer.

**Windows authentication is not supported for Access database -** Power BI currently only supports anonymous for Access database. We are working on enabling Windows authentication for Access database.

**Sign in error when entering credentials for a datasource** - If you get an error similar to this when entering Windows credentials for a datasource, you might still be on the preview version of the Personal Gateway. [Install the latest version of Power BI Personal Gateway](http://go.microsoft.com/fwlink/?LinkId=534231) from Downloads in Power BI..

  ![](media/powerbi-admin-troubleshooting-power-bi-personal-gateway/PBI_PG_CredentialsError.jpg.png)

**Error: Sign in error when selecting Windows authentication for a data source using ACE OLEDB** - If you get the following error when entering data source credentials for a data source using ACE OLEDB provider:

![](media/powerbi-admin-troubleshooting-power-bi-personal-gateway/ACEOLEDBerror.png)

Power BI does not currently support Windows authentication for a data source using ACE OLEDB provider.

**Solution:** To workaround this error, you can select Anonymous authentication. For legacy ACE OLEDB provider, Anonymous credentials are equivalent to Windows credentials.

## Tile refresh

If you are receiving an error with dashboard tiles refreshing, please refer to the following article.

[Troubleshooting tile errors](powerbi-refresh-troubleshooting-tile-errors.md)

## See Also

[Tools for troubleshooting refresh issues](powerbi-refresh-tools-for-troubleshooting-issues.md)

[Troubleshooting tile errors](powerbi-refresh-troubleshooting-tile-errors.md)

[Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md)