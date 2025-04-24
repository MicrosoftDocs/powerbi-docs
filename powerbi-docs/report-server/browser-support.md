---
title: Browser support for Power BI Report Server
description: Learn about what browser versions are supported for managing and viewing Power BI Report Server and the Report Viewer Controls.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: conceptual
ms.date: 01/03/2022
---
# Browser support for Power BI Report Server
Learn about what browser versions are supported for managing and viewing Power BI Report Server and the Report Viewer Controls.

> [!NOTE]
> Support for the Microsoft Edge Legacy browser stopped beginning March 9, 2021, and support for Microsoft Internet Explorer 11 stopped beginning August 17, 2021.

## Browser requirements for the web portal
The following is the current list of browsers supported for the web portal.

**Microsoft Windows**  
*Windows 7, 8.1, 10; Windows Server 2008 R2, 2012, 2012 R2*

* Microsoft Edge (+)
* Google Chrome (+)
* Mozilla Firefox (+)

**Apple OS X**  
*OS X 10.9-10.11*

* Apple Safari (+)
* Google Chrome (+)
* Mozilla Firefox (+)

**Apple iOS**  
*iPhone and iPad with iOS 10*

* Apple Safari (+)

**Google Android**  
*Phones and tablets with Android 4.4 (KitKat) or later*

* Google Chrome (+)
  
  **(+)** Latest publicly released version

## Browser requirements for the Report Viewer web control (2015)
The following is the current list of browsers supported with the Report Viewer web control. The report viewer supports viewing reports from the web portal.

**Microsoft Windows**  
*Windows 7, 8.1, 10; Windows Server 2008 R2, 2012, 2012 R2*

* Microsoft Edge (+)
* Google Chrome (+)
* Mozilla Firefox (+)

**Apple OS X**  
*OS X 10.9-10.11*

* Apple Safari (+)
  
  **(+)** Latest publicly released version

### Authentication requirements
Browsers support specific authentication schemes that must be handled by the report server in order for the client request to succeed. The following table identifies the default authentication types supported by each browser running on a Windows operating system.

| **Browser type** | **Supports** | **Browser default** | **Server default** |
| --- | --- | --- | --- |
| **Microsoft Edge** (+) |Negotiate, Kerberos, NTLM, Basic |Negotiate |Yes. The default authentication settings work with Edge. |
| **Google Chrome**(+) |Negotiate, NTLM, Basic |Negotiate |Yes. The default authentication settings work with Chrome. |
| **Mozilla Firefox**(+) |NTLM, Basic |NTLM |Yes. The default authentication settings work with Firefox. |
| **Apple Safari**(+) |NTLM, Basic |Basic |Yes. The default authentication settings work with Safari. |

 **(+)** Latest publicly released version

### Script requirements for viewing reports
To use the report viewer, configure your browser to run scripts.

If scripting is not enabled, you will see an error message similar to the following when you open a report:

"Your browser does not support scripts or has been configured to not allow scripts to run. Click here to view this report without scripts."

 If you choose to view the report without script support, the report is rendered in HTML without report viewer capabilities such as the report toolbar and the document map.

> [!NOTE]
> The report toolbar is part of the HTML Viewer component. By default the toolbar appears at the top of every report that is rendered in a browser window. The report viewer provides features include the ability to search the report for information, scroll to a specific page, and adjust the page size for viewing purposes. For more information about the report toolbar or HTML Viewer, see [HTML Viewer and the Report Toolbar](/sql/reporting-services/html-viewer-and-the-report-toolbar).
> 
> 

## Browser support for Report Viewer web server controls in Visual Studio
The Report Viewer Web server control is used to embed report functionality in an ASP.NET web application. For more information on how to get the Report Viewer Control, see [Integrating Reporting Services Using Report Viewer Controls - Get Started](/sql/reporting-services/application-integration/integrating-reporting-services-using-reportviewer-controls-get-started).

Use a browser that has script support enabled. If the browser cannot run scripts, you cannot view the report.

**Microsoft Windows**  
*Windows 7, 8.1, 10; Windows Server 2008 R2, 2012, 2012 R2*

* Microsoft Edge (+)
* Google Chrome (+)
* Mozilla Firefox (+)
  
  **(+)** Latest publicly released version

## Related content

* [Administrator overview](admin-handbook-overview.md)  
* [Install Power BI Report Server](install-report-server.md)  
* [Download Report Builder](https://www.microsoft.com/download/details.aspx?id=53613)  
* [Download SQL Server Data Tools (SSDT)](/sql/ssdt/download-sql-server-data-tools-ssdt)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
