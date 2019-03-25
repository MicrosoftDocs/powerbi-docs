---
title: Connect to datasets in Power BI Premium with tools 
description: Describes how to connect to datasets in Power BI Premium with tools.
author: minewiskan
ms.author: owend
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 03/25/2019
ms.custom: seodec18

LocalizationGroup: Premium
---

#

Power BI Premium workpaces support connections from Microsoft and third-party client tools. 
 

## Supported tools

SQL Server Management Studio (SSMS) - Requires version 18.0 (Preview 6 or higher). Download [here](https://docs.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms).

SQL Server Profiler - 

DAX Studio - Open-source, community tool for executing and analyzing DAX queries against Analysis Services. Requires version 2.8.2 or higher. 

Third-party data visualization tools - Includes client applications and tools that can connect to and consume datasets in Power BI Premium. All tools require the latest versions of MSOLAP.

### Addressing a Premium workspace

You can connect to a workspace assigned to a Premium dedicated capacity. Workspaces assigned to a dedicated capacity have a connection string in URL format. 

To get the workspace connection string, in **Workspace Settings**, on the **Premium** tab, in **Workspace Connection**, click **Copy**.

![Workpace connection string](media/connect-tools-workspace-connection.png)

Use the following URL format to address a workspace as though it were an Analysis Services server name. 

`powerbi://api.powerbi.com/v1.0/[tenant name]/[workspace name]` 

Replace `myorg` can be replaced with your tenant name (e.g. "mycompany.com"). 

'[workspace name]` is case sensitive and can include spaces. 

For example, `powerbi://api.powerbi.com/v1.0/contoso.com/Sales Workspace


1. Copy the Workspace Connection URL from the workspace settings dialog.

2. In Connect to Server > Server Type, select Analysis Services.

3. In Server name, enter the 

## Known issues

### Duplicate workspace name

When connecting to a workspace with the same name as another workspace, you may get the following error:

**Cannot connect to powerbi://api.powerbi.com/v1.0/myorg/Contoso Sales.**

To get around this error, in addition to the workspace name, specify the ObjectIDGuid.  

### Delay in datasets shown

When connecting to a workspace, shown datasets can take up to 5 minutes to reflect changes resulting from new,deleted, and renamed renamed datasets.


## Next steps



More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
