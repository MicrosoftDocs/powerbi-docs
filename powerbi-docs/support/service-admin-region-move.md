---
title: Move Power BI between regions
description: If the default region for your organization's Power BI data isn't optimal, you might want to move to another region. You can't move regions by yourself. This article describes how to work with support to move between regions. 
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting 
ms.date: 12/13/2022
ms.custom: template-how-to; subject-moving-resources
---

# Move between regions

Your default data region is determined by the location selected during sign-up. However, this region might not be optimal if most of your users are located in a different geographic location. You might want to move to another region to reduce latency or to ensure data governance. You can’t move your organization’s tenant between regions by yourself. Self-service migration of Power BI resources stored in Azure isn’t supported. If you need to change your default data location from the current region to another region, you have to contact support to manage the migration for you.

> [!IMPORTANT]
> This article describes how to request a move between regions and keep Power BI data. Be sure you're aware of what can’t be moved and steps you have to do before and after the region move. Moving between regions is considered a tenant migration. You can request a different process to move your tenant to another region if data loss and reconfiguration is acceptable. To determine your current data region, follow the steps in [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

## Prerequisites

- The person who requests the data region move must be assigned the global administrator role. You can learn more about the different admin roles and what they can do in [Understanding Power BI administrator roles](../admin/service-admin-role.md). We can't help identify your global administrator for you. Look for global administrator role holders in Microsoft 365 or Azure Active Directory or ask your help desk.
- We must receive written approval confirming your awareness and agreement of the effect of the tenant migration on your organization.
- Provide a point of contact for after business hours during the migration.

## Prepare

The migration process moves all tenant data to the new region. The GUID assigned to datasets, reports, dashboards, and other content don't change. However, there are some limitations you should be aware of and preparation steps you need to take.

### Awareness

- The end-to-end migration process may take up to six months. We prioritize service reliability and deployment schedules can change, so we may need to reschedule during migration at any time. We can't guarantee successful migration due to inconsistent data or bugs.

- Migration requires about six hours of down time. During migration, users can't access Power BI and will see an error message similar to the one shown in the following screenshot. The actual down time depends on the volume of data to be migrated.

  :::image type="content" source="media\service-admin-region-move\user-error-message.png" alt-text="Screen capture showing example error message shown to users during migration.":::

- Capacities and Premium workspaces can't be migrated.
- Power BI Premium Per User (PPU) capacity will be deleted before migration starts. After the migration, PPU capacity will be recreated at first PPU user sign-in. For more information about PPU licenses, see [Power BI Premium Per User](../enterprise/service-premium-per-user-faq.yml).
- After migration, Excel workbooks that use the Analyze in Excel feature might fail to refresh. You might need to update the connection string or redownload the ODC connection for that dataset. Follow the steps in [Start in Power BI with Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) if necessary.
- Push datasets might not be migrated. If they can't be migrated, you'll need to delete the datasets.
- You have to reconfigure data gateways after migration. To learn more about this step, read [Migrate, restore, or take over an on-premises data gateway](/data-integration/gateway/service-gateway-migrate).
- Dataset and workspace storage modes shouldn't be changed one day before the migration. Changing the storage mode before the migration can leave the datasets unusable after the migration. For more information, read [Dataset modes in the Power BI service](../connect-data/service-dataset-modes-understand.md) and [Manage data storage in Power BI workspaces](../admin/service-admin-manage-your-data-storage-in-power-bi.md).
- Some usage data collected before migration is unavailable after migration. Usage data in the following sources will be lost:
  - [Power BI Activity Log](../admin/service-admin-auditing.md)
  - View count in [Lineage view](../collaborate-share/service-data-lineage.md)
  - [Data protection metrics report](../enterprise/service-security-data-protection-metrics-report.md)
  - [Usage metrics(preview)](../collaborate-share/service-modern-usage-metrics.md)

### Preparation steps

Our support team will work with you to verify that the following steps are done to prepare for the migration:

- We can't migrate capacities and Premium workspaces, so you have to delete all capacities before migration. After the region move, these resources can be recreated. If you move resources from a Premium workspace to a shared workspace, datasets larger than 1 GB can't be viewed until they're moved back to Premium capacity.

- Gateways should be deleted in the target region to avoid conflicts during migration.

- To keep user activity logs, follow the steps in [Track user activities in Power BI](../admin/service-admin-auditing.md). You can get log data from either the Power BI activity log or the Unified audit log.

## Request a region move

To find out the best way to contact support, read [Power BI support options](service-support-options.md). Most admins can use the **Help + support** experience in the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/support) to submit a service request. Use the following steps to get started:

1. Go to [Power Platform Admin Center Help + support](https://admin.powerplatform.microsoft.com/support) and sign in using admin credentials.
1. Select **New support request**, then select the following options to request a region move:
   - Product: Power BI Pro
   - Tell us what you need help with: Move to a different region
   - Problem type: Administration
   - Problem Subtype: Tenant Management
   - Are you contacting us to move your tenant to another region: Yes
   
   Select **See solutions** to move to the next screen.

     :::image type="content" source="media\service-admin-region-move\ppac-new-support-request.png" alt-text="Screen capture showing field entries for a new support request for a region move in Power Platform Admin Center.":::

1. Select **Next** to continue to **Select your support plan**. Choose your support plan. Add a description and include the information in the following table:

   |Information needed | How to find the information |
   |---|---|
   |Tenant object ID | [How to find your Azure Active Directory tenant ID](/azure/active-directory/fundamentals/active-directory-how-to-find-tenant)|
   |Current region | [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md)|
   |Proposed region | [International availability of Microsoft Power Platform](/power-platform/availability)|
   |Proposed date and time for migration |Give us three options in UTC time. The proposed dates should be at least two weeks later than when you submit the request.|
   |Contact available after during off-business hours|Name, phone number, and email address|

1. Under **Is the problem you're reporting related to a recent service change?**, choose N/A. Select a severity level, then select **Next**.
1. Add your contact information, then **Submit**.

Our support team will be in touch. The support team makes sure you're authorized to make this request, confirms your awareness of the issues listed earlier, and obtains written approval to confirm you want to move your tenant between regions.

Be sure to provide contact details for someone who can act as the point of contact for Support. The contact has to be available after business hours.

Support will review the submitted information, including your tenant object ID, current data region, and target data region. After details are confirmed, we'll coordinate the proposed migration time frame with you.

## During the region move

- Don't do any manual or scheduled refreshes until after migration is complete.
- Support will copy your data to the new region. Power BI won't be available to users during the move.

## After the region move

When migration is complete, you'll be able to access Power BI in about 20-30 minutes. Support will contact you to make sure everything is working.

Do the following steps to recreate the configuration of the original region:

1. Recreate capacities and move workspaces back to Premium. Read more about this step in [Configure and manage capacities in Power BI Premium](../enterprise/service-admin-premium-manage.md).
1. If push datasets were deleted, recreate them. For more information, see [Real-time streaming in Power BI](../connect-data/service-real-time-streaming.md) to learn how to push data into a dataset.
1. Reconfigure your data gateways. Follow the steps in [Migrate, restore, or take over an on-premises data gateway](/data-integration/gateway/service-gateway-migrate).
1. Excel workbooks that use the Analyze in Excel feature might fail to refresh. You might need to update the connection string or redownload the ODC connection for that dataset. Follow the steps in [Start in Power BI with Analyze in Excel](../collaborate-share/service-analyze-in-excel.md) if necessary.
1. Links to Power BI that are embedded in content might fail to connect when migration is complete. For example, an embedded link in SharePoint might result in a user error. To resolve this problem, you have to regenerate the embedded link in Power BI, and then update the locations where they're used. To fix this issue, follow the procedure in [Embed a report web part in SharePoint Online](../collaborate-share/service-embed-report-spo.md).

To verify that the default region for data storage has been moved, follow the steps in [Find the default region for your organization
](../admin/service-admin-where-is-my-tenant-located.md).

## Frequently asked questions

### Can I migrate back to the original region? If yes, what's the process and will I lose data?

No, you can't revert to using the old region.

### Is my data deleted immediately from the old region? If not, how long is it kept and do I have access to it?

Data is retained in the old region for 30 days and is then deleted. Customers don't have access to data in the old region after migration.

### What happens to my Microsoft 365 groups, SharePoint sites, etc.? Are they also migrated?

We only migrate Power BI-specific resources. Your Microsoft 365 groups and SharePoint sites aren't touched.

### Can I request that some of my data be migrated to a different region?

No, migration of data to different regions isn't a supported scenario.

### Does migration change any of my data or settings for Azure Active Directory?

No, migration doesn't affect anything outside of Power BI.

### Can I use Power BI REST APIs for read-only operations during migration?

No, using Power BI during tenant migration activity isn't recommended.

### Why do I need to provide three proposed migration dates?

We need to ensure that migration happens outside of the production deployment window. This time-frame is subject to change on a weekly basis. We can only confirm the actual migration date five days before the migration.

### Can I request migration during weekdays (if my company allows) or on any public holiday recognized by my organization?

Yes, you can request migration during weekdays or public holidays.

### How do I verify my data is now stored in the requested region?

Follow the steps in [Find where data is stored](../admin/service-admin-where-is-my-tenant-located.md). You should see the new region next to **Your data is stored in**.

### Can I migrate or merge my Power BI tenant into a different tenant (for example, because of a company merger)?

No, migration from one tenant to another isn't possible.

### After migration, is it normal to still see some refreshes happening from the old tenant location?

Refresh in the old region should stop after migration.

### My allowlist contains Power BI IP ranges that are used to access some data sources. Do I need to update the IP ranges to match the new location?

Yes. Because it’s a new location, the IP ranges are also changing, and the ranges need to be updated.  [Download the Azure IP Ranges JSON file](https://www.microsoft.com/download/details.aspx?id=56519) to identify the needed IP ranges.

### Is there a cost to have my tenant moved to a different region?

No, there's no cost charged for region migration. Customers that have any paid licenses can migrate. The operation must be requested by a global administrator.
