---
title: Move Power BI between regions
description: If the default region for your organization's Power BI data isn't optimal, you may want to move to another region. You can't move regions by yourself. This article describes how to work with support to move between regions. 
author: kfollis
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to 
ms.date: 07/29/2021
ms.custom: template-how-to; subject-moving-resources
---

# Move between regions

Your default data region is determined by the location selected during sign-up. However, this region may not be optimal if most of your users are located in a different geographic location. You might want to move to another region to reduce latency or to ensure data governance. You can’t move your organization’s tenant between regions by yourself. Self-service migration of Power BI resources stored in Azure isn’t supported. If you need to change your default data location from the current region to another region, you have to contact support to manage the migration for you.

This article describes how to request a move between regions. Be sure you're aware of what can’t be moved and steps you have to do before and after the region move. Moving between regions is considered a tenant migration. To determine your current data region, follow the steps in [Where is data for the Power BI service stored?](service-admin-where-is-my-tenant-located.md)

## Prerequisites

- The person who requests the data region move must be assigned the global administrator role.
- We must receive written approval confirming your awareness and agreement of the effect of the tenant migration on your organization.
- Provide a point of contact for after business hours during the migration.

## Prepare

The migration process moves all tenant data to the new region. The GUID assigned to datasets, reports, dashboards, and other content don’t change. However, there are some limitations you should be aware of and preparation steps you need to take.

### Awareness

- Migration requires about six hours of down time. During migration, users can't access Power BI and will see an error message similar to the one shown below. The actual down time depends on the volume of data to be migrated.

  :::image type="content" source="media\service-admin-region-move\user-error-message.png" alt-text="Screen capture showing example error message shown to users during migration.":::

- Capacities and Premium workspaces can't be migrated.
- After migration Excel workbooks that use the Analyze in Excel feature may fail to refresh. You may need to update the connection string or redownload the ODC connection for that dataset. Follow the steps in [Analyze in Excel](/collaborate-share/service-tutorial-analyze-in-excel.md) if necessary.
- Power BI Goals data will be lost during the region move. We're working to fix this issue.
- Push datasets might not be migrated. If they can't be migrated, you'll need to delete the datasets. Support will let you know if this step is needed.
- Data gateways have to be reconfigured after migration.
- Dataset and workspace storage modes shouldn't be changed one day before the migration. Changing the storage mode before the migration can leave the datasets unusable after the migration.
- Some usage data collected before migration is unavailable after migration. Usage data in the sources listed below will be lost:
  - [Power BI Activity Log](service-admin-auditing.md)
  - View count in [Lineage view](../collaborate-share/service-data-lineage.md)
  - [Data protection metrics report](service-security-data-protection-metrics-report.md)
  - [Usage metrics(preview)](../collaborate-share/service-modern-usage-metrics.md)

### Preparation steps

Our support team will work with you to verify that the following steps are done to prepare for the migration:

- We can't migrate capacities and Premium workspaces, so you have to delete all capacities before  migration. After the region move, these resources can be recreated. If you move resources from a Premium workspace to a shared workspace, datasets larger than 1 GB can't be viewed until they're moved back to Premium capacity.

- Gateways that have the same name in both source and target regions should be deleted in the target region to avoid conflicts during migration.

- Microsoft 365 Apps for enterprise licenses ([formerly named Office 365 ProPlus](/deployoffice/name-change)) should be removed from users before the migration. The capacity that supports this license type can't be moved. For more information about this license type, see [Device-based licensing for Microsoft 365 Apps for enterprise](/deployoffice/device-based-licensing).

- To keep user activity logs, follow the steps in [Track user activities in Power BI](service-admin-auditing.md). You can get log data from either the Power BI activity log or the Unified audit log.

## Request a region move

To find out the best way to contact support, read [Power BI support options](service-support-options.md). Most admins can use the **Help + support** experience in the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/support) to submit a service request. Follow the steps below to get started.

1. Go to [Power Platform Admin Center Help + support](https://admin.powerplatform.microsoft.com/support) and sign in using admin credentials.
1. Select **New support request**, then select the following options to request a region move:
    1. Product: Power BI Pro
    1. Problem type: Administration
    1. Category: Tenant Management
    1. Tell us what you need help with: Move to a different region
    
    Select **See solutions** to move to the next screen.

     :::image type="content" source="media\service-admin-region-move\ppac-new-support-request.png" alt-text="Screen capture showing field entries for a new support request for a region move in Power Platform Admin Center.":::

1. Select **Next** to continue to **Select your support plan**. Choose your support plan. Add a description. Under **Is the problem you're reporting related to a recent service change?**, choose N/A. Select a severity level, then select **Next**.
1. Add your contact information, then **Submit**.

Our support team will be in touch. The support team makes sure you're authorized to make this request, confirms your awareness of the issues listed above, and obtains written approval to confirm you want to move your tenant between regions.

Provide contact details for someone who can act as the point of contact for Support. The contact has to be available after business hours.

Support will collect required information, including your tenant object ID, current data region, and target data region. After details are collected, we'll provide you with choices for the proposed migration time frame.

## During the region move

- Don't do any manual or scheduled refreshes until after migration is complete.
- Support will copy your data to the new region. Power BI won't be available to users during the move.

## After the region move

When migration is complete, you'll be able to access Power BI in about 20-30 minutes. Support will contact you to make sure everything is working.

Do the following steps to recreate the configuration of the original region:

1. Recreate capacities and move workspaces back to Premium.
1. If push datasets were deleted, recreate them.
1. Reconfigure your data gateways. Follow the steps in [Migrate, restore, or take over an on-premises data gateway](/data-integration/gateway/service-gateway-migrate).
1. Excel workbooks that use the Analyze in Excel feature may fail to refresh. You may need to update the connection string or redownload the ODC connection for that dataset. Follow the steps in [Analyze in Excel](../collaborate-share/service-tutorial-analyze-in-excel.md) if necessary.
1. Links to Power BI that are embedded in content might fail to connect when migration is complete. For example, an embedded link in SharePoint may result in a user error. To resolve this problem, you have to regenerate the embedded link in Power BI and then update the locations where they're used.
