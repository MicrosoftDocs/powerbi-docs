<properties
pageTitle="Migration FAQ"
description="Power BI for Office 365 migration frequently asked questions (FAQ). "
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
ms.date="03/04/2016"
ms.author="asaxton"/>
# Power BI for Office 365 migration frequently asked questions (FAQ)

The following are some frequently asked questions (FAQ) related to the migration from Power BI for Office 365 to the new Power BI experience. 

## Timeline

**What if I can’t move my business off of the Power BI for Office 365 site by December 31, 2015?**

You will still be able to continue to access the Power BI for Office 365 site, Power BI Admin Center and the Data Management Gateway, for use with Power BI for Office 365, until March 31, 2016. It is recommended that you move to the new experience as soon as possible.

**Does this mean that the SharePoint Online integration, with the Power BI for Office 365 site, will be available until March, 31, 2016?**

While you will be able to access the Power BI for Office 365 site, it is recommended that you move to the new experience as soon as possible.

**What does limited support mean?**

The Power BI for Office 365 site will be going into limited support starting December 31, 2015. The site will not be going away, but the level of support that will be provided will be limited to certain exception cases (e.g. security bugs).  You should move to the new Power BI service prior to December 31, 2015 for continued production level support. If for some reason you are not able to move your business over, please let us know as soon as possible, so that we can aid in the migration over to the new service. You can send email to [sunsetPBIO365 at microsoft.com](mailto:sunsetPBIO365@microsoft.com)

## Licensing

**Will all my users need to move to a Pro license?**

Your Power BI for Office 365 licenses will be treated as Power BI Pro licenses within the new experience. When your Power BI for Office 365 subscription expires, you will need to purchase a Power BI Pro subscription, or individual licenses, to continue to use Pro features. If you don’t plan on using Pro features, you can continue with a free license.

**How much does it cost for a Power BI Pro individual user license?**

Please refer to the [pricing page](https://powerbi.microsoft.com/pricing).

**Does a Power BI Pro subscription give me access to OneDrive for Business?**

No. OneDrive for Business is not includes with a Power BI Pro subscription. You will need to get a separate subscription that includes OneDrive for Business.

## Working with files

**I have a lot of files on my SharePoint Online team site, do I need to move all of them over to OneDrive for Business?**

If your files are on your root SharePoint Online team site, you can connect those files to Power BI through Get Data > Files > SharePoint Team Sites. You will soon be able to supply a URL to any SharePoint Online site, and connect to your files.

**Can I use an Excel document from a SharePoint Online document library?**

If the document is in the root Team site, you will be able to connect to it from Power BI by going to **Get Data > Files > SharePoint - Team Sites**. If you have a subsite, those will not be available, and files will need to be moved to OneDrive for Business.

**Does uploading a workbook to Power BI accounts for my data capacity quota?**

The data model within the excel workbook is what will could toward your data capacity quota. [Learn more](powerbi-reduce-the-size-of-an-excel-workbook.md) 

**Are there any restrictions on a workbook size?**

A data model can be a maximum of 250 MB. [Learn more](powerbi-reduce-the-size-of-an-excel-workbook.md) 

**How do I connect to Excel files that we move to a group’s OneDrive for Business storage?**

You can connect to an Excel document, within your group’s OneDrive for Business storage, by switching to that group, and going to Get Data > Files > OneDrive. [Learn more](powerbi-service-connect-to-files-on-your-groups-onedrive-for-business.md) 

**Can I import Excel files from my on-premises environment?**

Yes. You can just go to **Get Data > Files > Local File**. [Learn more](powerbi-service-get-data-from-files.md) 

**Do we need to migrate PivotTables or PivotCharts made in Excel, with Power Pivot, to a Power BI report?

That’s not necessary. You can leave your PivotTables and PivotCharts in the Excel workbook. If it is hosted in your root SharePoint Online Team site, or on OneDrive for Business, you will choose to maintain the Excel Online experience, and even pin ranges from a worksheet to a dashboard. [Learn more](powerbi-service-pin-a-tile-to-a-dashboard-from-excel.md) 

## Refresh

**We have not setup Scheduled Refresh within Power BI Sites, so we are not affected?**

You can continue to use the Excel workbooks, that are in your SharePoint Online site, with Excel Online. If you are making use of the Power BI Sites, that piece will not be available after March 31, 2016 and you will need to connect your Excel workbook with the new experience.

**With the Data Management Gateway going away, how do we refresh our data?**

The Personal Gateway will be available for individuals to refresh their datasets. For DirectQuery to SQL Server and SAP HANA, or live connections to Analysis Services, you can use the enterprise gateway. Learn more (https://powerbi.microsoft.com/en-us/documentation/powerbi-refresh-data/) 

**If our Excel file has data from Power Query, or Get & Transform within Excel 2016, and we use the file with the new experience, can we still refresh the data?**

Yes. You can use the Personal Gateway to refresh your data for certain data sources. [Learn more](powerbi-refresh-data.md)

## Security

**Does the new experience have the same security as Office 365?**

The Power BI service is based on Azure Active Directory. You can choose to share your dashboards with individuals or groups. You can also take advantage of the Universal Group feature of Office 365 for collaboration. [Learn more](powerbi-admin-power-bi-security.md) 

**What permissions do I need to connect to Excel documents within my SharePoint Online Team site?**

Power BI will connect to SharePoint Online with your organization credential. If you do not have permission to the document library, that the Excel document is stored in, you will not be able to connect to it from Power BI.

**Can people with the Power BI (free) license use dashboards and reports that contain Power BI Pro features?**

No. If a dashboard, or report, is making use of a Power BI Pro feature, you will need to have a Power BI Pro license to consume it. [Learn more](powerbi-power-bi-pro-content-what-is-it.md) 

**Will we be able to share items outside of our organization?**

Currently, you can only share items with users that are within your organization. We plan to enable the ability to share outside of your organization soon.

## Administration

**We have enabled a data source as an OData feed within the Power BI Admin Center. Is this affected?**

Yes. The Power BI Admin Center, and Data Management Gateway for Power BI use, will no longer function as of March 31, 2015.  

**Does the new experience support .gov or .mil?**

Not at this time.

## Features

**What’s the difference between Power BI (free) and Power BI Pro?**

The pricing page outlines the differences between free and Pro. [Learn more](https://powerbi.microsoft.com/pricing) 

**Will Power BI for Office 365 no longer exist?** 

The Power BI for Office 365 service will go into limited support on December 31, 2015, and will no longer be available as of March 31, 2015.

**When can I start using the new experience?**

It is available today! You can sign up, or sign in, at http://www.powerbi.com. 

**Is Power Pivot still going to be available?**

Yes. Power Pivot is a feature within Excel and will continue to be available.

**What is the browser support for the new experience?**

We support modern browsers. [Learn more](powerbi-service-browser-support.md) 

**How does Azure Data Catalog integration with Power BI?**

Currently, Azure Data Catalog does not integrate directly with Power BI.

## See also

[Migrating to the new Power BI experience](powerbi-admin-migrating-to-the-new-power-bi-experience.md)

[Get started with Power BI](powerbi-service-get-started.md)

[Power BI Security](powerbi-admin-power-bi-security.md)

[Frequently asked questions](powerbi-frequently-asked-questions.md)