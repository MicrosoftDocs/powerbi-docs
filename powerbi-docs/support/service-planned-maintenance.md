---
title: Power BI planned maintenance
description: Information for admins about how planned maintenance for Power BI affects their organization and next steps they may need to take.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting
ms.date: 05/12/2022
ms.custom: MC
LocalizationGroup: Admin
---
# Power BI planned maintenance

Planned maintenance for the Power BI service is a necessary part of our commitment to providing a reliable product to our customers. When planned maintenance is happening, the Power BI service will be unavailable to your organization for some time. Users may not be able to access the Power BI service and background operations may be unsuccessful. After the maintenance window, we expect the service to operate normally and both interactive and background operations to succeed.  

Maintenance is planned to happen outside of normal business hours to help minimize any impact to your organization. For organizations that have users around the globe, we recognize that "outside of normal business hours" might affect you differently. We apologize for any effect to your users. We're working hard to improve Power BI and to minimize these maintenance windows.

If your organization is affected, we'll provide you with advance notice. Microsoft 365 admins will see an advance notice in the Microsoft 365 Message center.

## Actions to take now

* Microsoft 365 administrators should [check the Message center](https://admin.microsoft.com/Adminportal/Home#/MessageCenter) for messages about Power BI planned maintenance. Share the message with people who should be aware but may not have access to Message center. Set your preferences in Message center to receive email notifications.
* If you're not a Microsoft 365 admin, engage with your IT department or your internal support teams to ask about any upcoming maintenance.

## Actions to take when maintenance is complete

* Users should refresh any open browser windows.
* Power BI Mobile app users will need to verify they're using the most recent version and sign out then sign back into the app. Check your phone's app store or check our [Power BI Mobile](https://powerbi.microsoft.com/mobile/) page.
* Customers who were actively editing or publishing reports that use organizational visuals, whether locally or from OneDrive and SharePoint locations, will need to either reimport the visual via the organization visual store or download an updated PBIX before republishing. For more information about organizational visuals, see  [Organization visuals](../admin/organizational-visuals.md).
* Links to Power BI embedded in content might fail to connect when maintenance is done. For example, an embedded link in SharePoint or Teams may result in a user error. To resolve this problem, you have to regenerate the embedded link in Power BI and then update the locations where they're used. For more information about embedded links, see [Embed a report web part in SharePoint Online](../collaborate-share/service-embed-report-spo.md) and [Collaborate in Microsoft Teams with Power BI](../collaborate-share/service-collaborate-microsoft-teams.md).
* Some of the usage data collected before maintenance isn't available after maintenance completes. This usage data includes:

  * [Power BI activity log](../admin/service-admin-auditing.md#use-the-activity-log). Users should download activity logs before maintenance. You can also use the [Office 365 audit log data](../admin/service-admin-auditing.md#access-your-audit-logs) to get equivalent activity details.
  * View count in [lineage view](../collaborate-share/service-data-lineage.md#explore-lineage-view)
  * [Data protection metrics report](/fabric/governance/use-microsoft-purview-hub)
  * [Usage metrics (Preview)](../collaborate-share/service-modern-usage-metrics.md)

## Related content

* [Enable service interruption notifications](/power-bi/support/service-interruption-notifications)
* [Track upcoming change in Message center](/microsoft-365/admin/manage/message-center)