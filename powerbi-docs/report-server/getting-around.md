---
title: Manage content in the Power BI Report Server web portal
description: Read about managing content in the Power BI Report Server web portal.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: how-to
ms.date: 05/24/2018
---
# Manage content in the web portal 
The Power BI Report Server web portal is an on-premises location for viewing, storing and managing your Power BI, mobile, and paginated reports, and KPIs.

![Report Server web portal](media/getting-around/report-server-web-portal.png)

You can view the web portal in any modern browser. In the web portal, reports and KPIs are organized in folders, and you can mark them as favorites. You can also store Excel workbooks there. From the web portal, you can launch the tools you need to create reports:

* **Power BI reports** created with Power BI Desktop: View them in the web portal and the Power BI mobile apps.
* **Paginated reports** created in Report Builder: Modern-looking, fixed-layout documents optimized for printing.
* **KPIs** created right in the web portal.

In the web portal you can browse the report server folders or search for specific reports. You can view a report, its general properties and past copies of the report that are captured in report history. Depending on your permissions, you might also be able to subscribe to reports for delivery to your e-mail inbox or a shared folder on the file system.

## Web portal roles and permissions
The web portal application runs in a browser. When you start the web portal, the pages, links, and options you see vary based on the permissions you have on the report server. If you're assigned to a role with full permissions, you have access to the complete set of application menus and pages for managing a report server. If you're assigned to a role with permissions to view and run reports, you only see the menus and pages you need for those activities. You can have different role assignments for different report servers, or even for the various reports and folders on a single report server.

## Start the web portal
1. Open your web browser.
   
    See this list of [supported web browsers and versions](browser-support.md).
2. In the address bar, type the web portal URL.
   
    By default, the URL is <em>https://[ComputerName]/reports</em>.
   
    The report server might be configured to use a specific port. For example, <em>https://[ComputerName]:80/reports</em> or <em>https://[ComputerName]:8080/reports</em>
   
    You see that the web portal groups items into these categories:
   
   * KPIs
   * Mobile reports
   * Paginated reports
   * Power BI Desktop reports
   * Excel workbooks
   * Datasets
   * Data sources
   * Resources

## Manage items in the web portal
Power BI Report Server offers detailed control of the items you store on the web portal. For example, you can set up subscriptions, caching, snapshots, and security on individual paginated reports.

1. Select **More options** (...) in the upper-right corner of an item, then select **Manage**.
   
    ![Select Manage](media/getting-around/report-server-web-portal-manage-ellipsis.png)
2. Choose the property or other feature you want to set.
   
    ![Select a property](media/getting-around/report-server-web-portal-manage-properties.png)
3. Select **Apply**.

Read more about [working with subscriptions in the web portal](/sql/reporting-services/working-with-subscriptions-web-portal).

## Related content

* [What is Power BI Report Server?](get-started.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)