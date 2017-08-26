<properties
   pageTitle="What's new in Power BI Report Server"
   description="Learn about what's new in Power BI Report Server. This covers the major feature areas and is updated as new items are released."
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
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
   ms.date="08/25/2017"
   ms.author="asaxton"/>

# What's new in Power BI Report Server

Learn about what's new in Power BI Report Server. This covers the major feature areas and is updated as new items are released.

To download Power BI Report Server, and Power BI Desktop optimized for Power BI Report Server, go to [On-premises reporting with Power BI Report Server](https://powerbi.microsoft.com/report-server/).

![tip](media/fyi-tip.png "tip") For the current release notes, see [Power BI Report Server - Release notes](reportserver-release-notes.md).

***Note:*** *For related "What's New" information, see:*

- [What's new in the Power BI service](../powerbi-service-whats-new.md)
- [What's new in Power BI Desktop](../powerbi-desktop-latest-update.md)
- [What's new in the mobile apps for Power BI](../powerbi-mobile-whats-new-in-the-mobile-apps.md)
- [Power BI team blog](https://powerbi.microsoft.com/blog/)

## August 2017 (preview)

This preview release contains new capabilities.

You can download the August 2017 preview of Power BI Report server, and Power BI Desktop optimized for Power BI Report Server (Preview) at [powerbi.com](https://powerbi.microsoft.com/report-server/). This cannot be installed side-by-side with an existing Power BI Report Server. If you have Power BI Report Server already installed, you will need to installthe preview on a separate server. 

### Support for data sources outher than Analysis Services in Power BI Report Server

With the August 2017 preview of Power BI Report Server, you can connect to any data source in Power BI Desktop and publish your reports to Power BI Report Server. To enable this functionality, there is no special configuration required. Simply install and configure the preview on a separate server and you’re ready to go. You can then use Power BI Desktop (August 2017 Preview) to connect to your data source(s), create your report and publish directly to the server to share it with others in your organization.

There are a few limitations to keep in mind as you try out this preview.

- Scheduled data refresh is currently not available for reports using imported data.
- DirectQuery data connections are not currently supported.
- Scale-out environments are not currently supported.
- Reports must be smaller than 50 MB in size.

Support for these scenarios are planned for the GA release. The GA release is planned for Q4 of CY2017.

### Viewing and interacting with Excel workbooks

Excel and Power BI contain a portfolio of tools that is unique in the industry. Together, they enable business analysts to more easily gather, shape, analyze, and visually explore their data. In addition to viewing Power BI reports in the web portal, business users can now do the same with Excel workbooks in Power BI Report Server, giving them a single location to publish and view their self-service Microsoft BI content.

We’ve published a [walkthrough of how to add Office Online Server (OOS) to your Power BI Report Server preview environment](reportserver-excel-oos.md). Customers with a Volume Licensing account can download OOS from the Volume License Servicing Center at no cost and will have view-only functionality. Once configured, users can view and interact with Excel workbooks that:

- Have no external data source dependencies
- Have a live connection to an external SQL Server Analysis Services data source
- Have a PowerPivot data model

### Support for new table and matrix viuals

The August 2017 preview of Power BI Report Server includes support for the new Power BI table and matrix visuals. To create reports with these visuals, you will need an updated Power BI Desktop release for the August 2017 preview. It cannot be installed side-by-side with Power BI Desktop (June 2017) release. 

## June 2017

* Power BI Report Server made generally available (GA).

## May 2017

* Power BI Report Server Preview made available
* Ability to publish Power BI reports on-premises
    * Suppport for custom visuals
    * Support for Analysis Services live connections only with more data sources to come.
    * Power BI Mobile app updated to display Power BI reports hosted in Power BI Report Server
* Enhanced collaboration in reports with comments

## Next steps

[Power BI Report Server release notes](reportserver-release-notes.md)  
[User handbook](reportserver-user-handbook-overview.md)  
[Administrator handbook](reportserver-admin-handbook-overview.md)  
[Quickstart: Install Power BI Report Server](reportserver-quickstart-install-report-server.md)  
[Install Report Builder](https://docs.microsoft.com/sql/reporting-services/install-windows/install-report-builder)  
[Download SQL Server Data Tools (SSDT)](http://go.microsoft.com/fwlink/?LinkID=616714)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)