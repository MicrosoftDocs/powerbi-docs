---
title: Migration tool for migrating from Power BI Report Server
description: This article targets Power BI Report Server report authors and Power BI administrators. It provides you with guidance to help you migrate your Report Definition Language (.rdl) reports to Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: 'cookiemccray'
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 09/22/2022
ms.custom: 
---

# Migration tool for migrating from Power BI Report Server

This article targets Power BI Report Server paginated report authors and Power BI administrators. It provides you with guidance to help you migrate your Report Definition Language (.rdl) paginated reports to Power BI.

You can achieve migration without downtime to your Power BI Report Server servers, or disruption to your report users. It's important to understand that no data or reports need to be removed. So, it means you can keep your current environment in place until you're ready for it to be retired.  

## Supported versions 

You can migrate Power BI Report Server instances running on-premises, or on virtual machines hosted by cloud providers like Azure.

The following list describes the SQL Server versions supported for migration to Power BI:

- SQL Server 2017
- SQL Server 2019
- SQL Server 2022 RC0

This tool is designed to help customers migrate Power BI Report Server paginated reports (.rdl files) from their local servers to a Power BI workspace in their tenant. As part of the migration process, the tool also: 

- Converts any shared data sources and/or shared datasets in these report files to be embedded in the report and save the files locally to disk only if they are supported data sources. 
- Checks for unsupported data sources or report components when uploading to Power BI 
- Saves the converted files that pass these checks to a specified Power BI Workspace. 
- Provides a summary of the successful and unsuccessful assets migrated 

Only .rdl reports can be migrated from your Power BI Report Server servers to Power BI. Each migrated .rdl report will become a Power BI paginated report.

You can publish folder content or individual reports. To learn how to publish to Power BI  

## Publish .rdl Reports to Power BI  

You can publish .rdl reports from Power BI Report Server web portal to Power BI.  

### Step 1 Site settings  

Graphical user interface, application

Description automatically generated 

### Step 2 Browse Reports 

Graphical user interface, application

Description automatically generated 

 

### Step 3 Select reports 

Graphical user interface, application, Teams

Description automatically generated 

### Step 4 Sign in/Sign up 

 

Graphical user interface, application, Teams

Description automatically generated 

### Step 5 choose a workspace  

Graphical user interface, application

Description automatically generated 

### Step 6 View reports  

A picture containing graphical user interface

Description automatically generated 


## Next steps

Check these sources to keep up-to-date on new features in Power BI Report Server.

- [Microsoft Power BI blog](https://powerbi.microsoft.com/blog/)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
