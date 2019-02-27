---
title: Developer handbook overview, Power BI Report Server
description: Welcome to the developer handbook for Power BI Report Server, an on-premises location for storing and managing your Power BI, mobile, and paginated reports.
author: markingmyname
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 11/01/2017
ms.author: maghan

---
# Developer handbook overview, Power BI Report Server
Welcome to the developer handbook for Power BI Report Server, an on-premises location for storing and managing your Power BI, mobile, and paginated reports.

![](media/developer-handbook-overview/admin-handbook.png)

This handbook highlights options you have, as a developer, to work with Power BI Report Server.

## Embedding
For any report within Power BI Report Server, you can embed within an iFrame by adding the querystring parameter `?rs:Embed=true` to the URL. This technique works with Power BI reports as well as other report types.

### Report Viewer Control
For paginated reports, you can take advantage of the Report Viewer Control. With it, you can place the control within a .NET windows or web application. For more information, see [Get started with the Report Viewer Control](https://docs.microsoft.com/sql/reporting-services/application-integration/integrating-reporting-services-using-reportviewer-controls-get-started).

## APIs
You have several API options for interacting with Power BI Report Server. This technique includes the following.

* [REST APIs](rest-api.md)
* [URL Access](https://docs.microsoft.com/sql/reporting-services/url-access-ssrs)
* [WMI Provider](https://docs.microsoft.com/sql/reporting-services/wmi-provider-library-reference/reporting-services-wmi-provider-library-reference-ssrs)

You can also use the open-source [PowerShell utilities](https://github.com/Microsoft/ReportingServicesTools) to manage your report server.

> [!NOTE]
> The PowerShell utilities don't currently support Power BI Desktop files (.pbix).
> 
> 

## Custom extensions
The Extension Library is a set of classes, interfaces, and value types that are included in Power BI Report Server. This library provides access to system functionality and is designed to be the foundation on which Microsoft .NET Framework applications can be used to extend Power BI Report Server components.

There are several types of extensions you can build.

* Data processing extensions
* Delivery extensions
* Rendering extensions for paginated reports
* Security extensions

To learn more, see [Extension library](https://docs.microsoft.com/sql/reporting-services/extensions/reporting-services-extension-library).

## Next steps
[Get started with the Report Viewer Control](https://docs.microsoft.com/sql/reporting-services/application-integration/integrating-reporting-services-using-reportviewer-controls-get-started)  
[Building Applications Using the Web Service and the .NET Framework](https://docs.microsoft.com/sql/reporting-services/report-server-web-service/net-framework/building-applications-using-the-web-service-and-the-net-framework)  
[URL Access](https://docs.microsoft.com/sql/reporting-services/url-access-ssrs)  
[Extension library](https://docs.microsoft.com/sql/reporting-services/extensions/reporting-services-extension-library)  
[WMI Provider](https://docs.microsoft.com/sql/reporting-services/wmi-provider-library-reference/reporting-services-wmi-provider-library-reference-ssrs)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)

