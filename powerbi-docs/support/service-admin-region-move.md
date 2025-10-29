---
title: Move Your Power BI Tenant to a Different Region
description: Learn how to move your Power BI tenant between regions with Microsoft support. Follow step-by-step guidance to migrate your data location.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: hfeng
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting 
ms.date: 10/01/2025
ms.custom:
  - template-how-to
  - subject-moving-resources
  - sfi-ga-nochange
ai-usage: ai-assisted
---

# Move your Power BI tenant to a different region

> [!IMPORTANT]
> At this time, we don't offer cross-region tenant migration for either Power BI or Fabric capacities. Consider using [Multi-Geo capacities](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium).

Moving your Power BI tenant between regions requires Microsoft support assistance and careful planning. The location you select during sign-up determines your default data region. You can't move your organization's tenant between regions by yourself. Self-service migration of Power BI or Fabric resources stored in Azure isn't supported. If you need to change your default data location from the current region to another region, you must contact Microsoft support to manage the migration for you.

> [!CAUTION]
> This article describes how to request a tenant remap to a different region. Be sure you're aware of the steps you have to do before and after the remapping. The tenant remap process leads to data loss and requires reconfiguration of your tenant. To determine your current data region, follow the steps in [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

## Prerequisites

- The person who requests the data region move must be assigned the global administrator role. You can learn more about the different admin roles and what they can do in [Understanding Power BI administration roles](../admin/service-admin-role.md). We can't help identifying your global administrator for you. Look for global administrator role holders in Microsoft 365 or Microsoft Entra ID or ask your help desk.
- We must receive written approval confirming your awareness and agreement of the effect of the tenant migration on your organization.
- You must provide a point of contact for after business hours during the migration.

## Prepare

The remapping process deletes all the tenant’s data and configuration. You need to back up the data and information in your tenant and restore it after the remapping.

### Awareness

- We prioritize service reliability and deployment schedules can change, so we might need to reschedule during the remapping at any time.
- Remapping requires about three hours of downtime. During the remapping, users can't access Power BI and see the "owl error message."
- The remap process causes all data and metadata in the tenant to be deleted.
- It's your responsibility to back up and restore your data as the support team can't help with those actions. However, if you encounter any technical issue during the back-up and restore, the support team can help with troubleshooting.

### Preparation steps

Our support team works with you to verify that the following steps are done to prepare for the migration:

- Remove all the Microsoft Fabric or Power BI Premium capacities as the remap process doesn't retain them. The capacity admin needs to reprovision capacities as needed.
- Delete Private links before the Tenant Remap execution.
- Understand that some usage data collected before remapping is unavailable after remapping. Usage data in the following sources is lost:
  - [Power BI Activity Log](/power-bi/admin/service-admin-auditing) - Users should download the activity logs before the remapping. Alternatively, users can use the [Office 365 audit log](/power-bi/admin/service-admin-auditing) data to obtain equivalent activity details.
  - View count in [Lineage view](/power-bi/collaborate-share/service-data-lineage)
  - [Data protection metrics report](/power-bi/admin/service-security-data-protection-metrics-report)
  - [Usage metrics (Preview)](/power-bi/collaborate-share/service-modern-usage-metrics)
- If [Azure Log Analytics (Preview)](/power-bi/transform-model/log-analytics/desktop-log-analytics-overview) is being used, detach the workspaces from Azure Log Analytics before the remapping, and reattach after the remapping.

### Back up the tenant

Because the region move process deletes all tenant data and metadata, you must back up everything you want to retain. Complete the following backup tasks before requesting the region move:

#### Document your tenant configuration

1. Run the [scanner API](/power-bi/enterprise/service-admin-metadata-scanning) to collect metadata about your tenant, including:
   - Data lineage relationships
   - Workspace and item permissions
   - Scheduled refresh configurations
   - Subscription settings
1. Take detailed screenshots of all dashboards to help with rebuilding.
1. Document any custom configurations or settings that can't be exported.

#### Back up Power BI content

1. **Reports**: Download .pbix files from the Power BI service to Power BI Desktop. Some reports might have limitations on downloading.
1. **Semantic models**: If using Premium capacity, follow the guidance in [Back up and restore Power BI Premium semantic models](/power-bi/enterprise/service-premium-backup-restore-dataset).
1. **Dataflows**: Export each dataflow as JSON by selecting the dataflow and choosing **Export.json**. You can also use [Power Query templates (preview)](/power-query/power-query-template) for backup.
1. **Fabric artifacts**: Back up artifact definitions to Git and copy any data that needs to be retained to an external location like Azure Data Lake Storage (ADLS).

#### Inventory and document gateways

1. Create a complete inventory of all gateways configured for Power BI, Power Apps, Power Automate, and Logic Apps.
1. Document all data sources connected through each gateway.
1. Record gateway data source permissions and credentials requirements.
1. Note all Shared Cloud Connections (SCCs) and their permissions.

> [!IMPORTANT]
> All gateways must be renewed after the tenant remapping. Keep detailed records to expedite the reconfiguration process.

#### Store backups securely

Store all backed-up content, documentation, and screenshots in a secure location outside of Power BI, such as:

- Azure Data Lake Storage (ADLS)
- SharePoint or Microsoft OneDrive
- Your organization's document management system

Ensure that backup storage is accessible throughout the migration process and afterward for restoration activities.

## Request a region move

To find out the best way to contact support, read [how to create a support case for Power BI and Fabric](create-support-ticket.md). Use the following steps to get started:

1. In the [Admin Portal](https://app.powerbi.com/admin-portal/supportCenter?experience=power-bi), go to **Help + Support** and select **New support request.**
1. Select **New support request**, then select the following options to request a region move.
   - Product: Power BI or Fabric Admin & Management
   - Tell us what you need help with: **Move to a different region**

   Select **See solutions** to move to the next screen.

     :::image type="content" source="media\service-admin-region-move\support-request-dialog.png" alt-text="Screenshot showing field entries for a new support request for a region move in the Power Platform Admin Center.":::

1. Select the arrow button to continue to **Select your support plan**. Choose your support plan. Add a description and include the information in the following table:

   |Information needed | How to find the information |
   |---|---|
   |Tenant object ID | [How to find your Microsoft Entra tenant ID](/azure/active-directory/verifiable-credentials/verifiable-credentials-configure-tenant)|
   |Current region | [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md)|
   |Proposed region | [International availability of Microsoft Power Platform](/power-platform/availability)|
   |Proposed date and time for migration |Give us three options in UTC time. The proposed dates should be at least two weeks later than when you submit the request.|
   |Contact available after during off-business hours|Name, phone number, and email address|

1. Under **Is the problem you're reporting related to a recent service change?**, choose N/A. Select a severity level, then select **Next**.
1. Add your contact information, then **Submit**.

The support team makes sure you're authorized to make this request, confirms your awareness of the issues listed earlier, and obtains written approval to confirm you want to move your tenant between regions.

Be sure to provide contact details for someone who can act as the point of contact for Support. The contact has to be available after business hours.

Support reviews the submitted information, including your tenant object ID, current data region, and target data region. After details are confirmed, we coordinate the proposed migration time frame with you.

## After the region move

After the region move is complete, the support team contacts you to confirm the migration succeeded. Your tenant is now in the new region, but it contains no data or configuration—everything must be restored from your backups.

### Restore your tenant

Use the backups you created in the preparation phase to rebuild your tenant:

1. **Re-create capacities**: If you use Microsoft Fabric or Power BI Premium, get new capacities in the new region. For more information, see [Configure and manage capacities](/power-bi/enterprise/service-admin-premium-manage).
1. **Re-create workspaces**: Set up your workspaces and configure their settings, including dataflow storage and connections to external services like Git or Azure Log Analytics.
1. **Restore content**: Upload your .pbix files, import dataflows from JSON, and restore semantic models from backups. You need to manually reconfigure refresh schedules and permissions for all items.
1. **Reconfigure gateways**: Install and configure new on-premises data gateways. All previous gateways are deleted during the migration and must be recreated. For detailed guidance, see [Migrate, restore, or take over an on-premises data gateway](/data-integration/gateway/service-gateway-migrate).
1. **Update tenant-level settings**: Reconfigure tenant settings such as Azure Data Lake Storage connections for backup and restore, service principal profiles, and other administrative configurations.
1. **Verify and test**: After restoration, thoroughly test all reports, dashboards, and data refresh processes to ensure everything works as expected in the new region.

> [!TIP]
> Use the documentation and screenshots you created during the backup phase to ensure you restore all configurations accurately.

### Update external dependencies

If your organization has external systems that connect to Power BI, you might need to update them to work with the new region:

- **IP allowlists**: Update any firewall or network allowlists with the new region's IP ranges. Download the [Azure IP Ranges JSON file](https://www.microsoft.com/download/details.aspx?id=56519) to identify the required IP addresses.
- **Embedded Power BI applications**: Update any custom applications that embed Power BI content to point to the new region if necessary.
- **Non-Microsoft integrations**: Review and update connections for any non-Microsoft tools or services that integrate with your Power BI tenant.

## Frequently asked questions

**Is there a cost to move my tenant to a different region?**

   No, there's no cost for region remapping. Any customer with a paid license can migrate. A global administrator must request the operation.

**Can I pick specific hours and dates on which I want the remapping to occur?**

   Yes. We ask you to pick a time and date.

**Does this affect my Office 365 subscription?**

   No, the remapping only affects the Power BI subscriptions.

**Does the remapping apply to all my Power BI subscriptions, or can I keep some in their original location?**

   No, the remapping applies to all Power BI subscriptions associated with the tenant.
  
**Do I lose all the personal and enterprise gateways I created to connect to my various data sources?**

   Yes. All gateways associated with Power BI, PowerApps, Flow, and Logic Apps need to be renewed after the remapping.

**Can I start a new Power BI subscription in the new data center location and then migrate my existing data over when a data remapping solution is implemented?**

   Yes and no. You can start a new subscription, but it must have a different company name to avoid mapping to the existing data center. Cross tenant data migration, meaning the migration of data from one tenant into another existing tenant, isn't currently on our roadmap.

**Can I migrate or merge my Power BI tenant into a different tenant (for example, because of a company merger)?**

   No, migration from one tenant to another isn't possible.

**My allowlist contains Power BI IP ranges that are used to access some data sources. Do I need to update the IP ranges to match the new location?**

   Yes. Because it's a new location, the IP ranges are also changing, and the ranges need to be updated. [Download the Azure IP Ranges JSON file](https://www.microsoft.com/download/details.aspx?id=56519) to identify the needed IP ranges.

**Do I lose all my Apps, datasets, data models, reports, and dashboards?**

   Yes.
