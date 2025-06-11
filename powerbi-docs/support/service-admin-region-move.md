---
title: Move Power BI between regions
description: If the default region for your organization's Power BI data isn't optimal, you might want to move to another region. You can't move regions by yourself. This article describes how to work with support to move between regions. 
author: JulCsc
ms.author: hfeng
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting 
ms.date: 02/07/2024
ms.custom: template-how-to; subject-moving-resources
---

# Move between regions

> [!IMPORTANT]
> At this time, we don't offer cross-region tenant migration for either Power BI or Fabric capacities. Consider using [Multi-Geo capacities](/fabric/admin/service-admin-premium-multi-geo?tabs=power-bi-premium). 

The location selected during sign-up determines your default data region. You can’t move your organization’s tenant between regions by yourself. Self-service migration of Power BI or Fabric resources stored in Azure isn’t supported. If you need to change your default data location from the current region to another region, you have to contact Microsoft support to manage the migration for you.

> [!CAUTION]
> This article describes how to request a tenant remap to a different region. Be sure you're aware of the steps you have to do before and after the remapping. The tenant remap process leads to data loss and requires reconfiguration of your tenant. To determine your current data region, follow the steps in [Find the default region for your organization](../admin/service-admin-where-is-my-tenant-located.md).

## Prerequisites

- The person who requests the data region move must be assigned the global administrator role. You can learn more about the different admin roles and what they can do in [Understanding Power BI administration roles](../admin/service-admin-role.md). We can't help identifying your global administrator for you. Look for global administrator role holders in Microsoft 365 or Microsoft Entra ID or ask your help desk.

- We must receive written approval confirming your awareness and agreement of the effect of the tenant migration on your organization.
- You must provide a point of contact for after business hours during the migration.

## Prepare

The remapping process deletes all the tenant’s data and configuration. You need to back up the data and information in your tenant and restore it post the remapping.

### Awareness

- We prioritize service reliability and deployment schedules can change, so we might need to reschedule during the remapping at any time.

- Remapping requires ~3 hours down time. During the remapping, users can't access Power BI and see the "owl error message".  

- The remap process causes all data and metadata in the tenant to be deleted. 

- It's the customer's responsibility to back up and restore their data as the support team can't help with those actions. However, if you encountered any technical issue during the back-up and restore, the support team can help with troubleshooting. 

### Preparation steps

   Our support team works with you to verify that the following steps are done to prepare for the migration:

- You'll have to remove all the Microsoft Fabric or Power BI Premium capacities as they aren't retained during the remap. The capacity admin needs to re-provision capacities as needed.

- You'll have to delete Private links before the Tenant Remap execution.

- Some usage data collected before remapping is unavailable after remapping. Usage data in the following sources will be lost:
  - [Power BI Activity Log](/power-bi/admin/service-admin-auditing) - Users should download the activity logs before the remapping. Alternatively, users may use the [Office 365 audit log](/power-bi/admin/service-admin-auditing) data to obtain equivalent activity details.
  - View count in [Lineage view](/power-bi/collaborate-share/service-data-lineage)
  - [Data protection metrics report](/power-bi/admin/service-security-data-protection-metrics-report)
  - [Usage metrics (Preview)](/power-bi/collaborate-share/service-modern-usage-metrics)
  
- If [Azure Log Analytics (Preview)](/power-bi/transform-model/log-analytics/desktop-log-analytics-overview) is being used, the workspaces need to be detached from Azure Log Analytics before the remapping, and re-attach after the remapping.

### Backing up the tenant

- The customer should back up their tenant
- Run the scanner API to grab as much data as possible about 
- Lineage
- Permissions
- Scheduled refresh
- Subscriptions
- Gateways
- Gateway data source permissions
- SCCs
- Power BI reports (limitations applied - Download a report from the Power BI service to Power BI Desktop) 
- Semantic models - How to Back up and restore Power BI Premium semantic models

- Dataflows - exporting json and importing: Power Query template (preview) 
- Inventory all the gateways to data that were set up for Power BI, PowerApps, Flow, and Logic Apps.  Those gateways will need to be renewed after the tenant remapping.

- To help with the rebuilding process in the new tenant, take screenshots of all dashboards and record as much information regarding each.

- Take notes/screenshots of items that can't be exported.

- Fabric artifacts - Back up the definitions to Git and copy any data that needs to be retained to an external location like ADLS


## Request a region move

To find out the best way to contact support, read [how to create a support case for Power BI and Fabric](/power-bi/support/create-support-ticket). Use the following steps to get started:

1. In the [Admin Portal](https://app.powerbi.com/admin-portal/supportCenter?experience=power-bi), navigate to **Help + Support** and click on **New support request.**

1. Select **New support request**, then select the following options to request a region move.
   - Product: Power BI or Fabric Admin & Management
   - Tell us what you need help with: **Move to a different region**
   
   Select **See solutions** to move to the next screen.

     :::image type="content" source="media\service-admin-region-move\support-request-dialog.png" alt-text="Screen capture showing field entries for a new support request for a region move in the Power Platform Admin Center.":::

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

Our support team will be in touch. The support team makes sure you're authorized to make this request, confirms your awareness of the issues listed earlier, and obtains written approval to confirm you want to move your tenant between regions.

Be sure to provide contact details for someone who can act as the point of contact for Support. The contact has to be available after business hours.

Support reviews the submitted information, including your tenant object ID, current data region, and target data region. After details are confirmed, we coordinate the proposed migration time frame with you.

## After the region move

When the remap is complete, the support team will contact you to make sure everything is working.

Do the following steps to recreate the configuration of the original region:

- Check/update tenant settings

  - Set ADLS account for dataset back up/restore
    
- Create Service Principals Names (SPN) profiles

- Create capacities. Read more about this step in [Configure and manage capacities in Power BI Premium](/power-bi/enterprise/service-admin-premium-manage).

  - Update settings
  
  - Assign admin/contributors
  
- Create gateways

  - Create data sources – credentials would need to be set manually
  
  - Follow the steps in [Migrate, restore, or take over an on-premises data gateway](/data-integration/gateway/service-gateway-migrate).
  
- Create Shared Cloud Connections (SCC)

  - Set permissions
  
- Create workspaces

  - Update Power BI settings
  
  - Set dataflow storage if appropriate
  
  - Reconnect log analytics if needed
    
  - Reconnect git
    
  - Re-attach ADLS storage for dataset backups (preferably set at the tenant level)
  
  - Update permissions
  
- Create/import Dataflows

  - Set refresh schedules
  
- Upload pbix files

  - Set refresh schedules
  
  - Set permissions
  
- Create datasets

  - Restore from ADLS (only v3 models can be restored, restored models are in Large Storage mode)
  
  - Set refresh schedules
  
  - Set permissions
  
- Create interactive reports

  - Rebind reports on new semantic model GUIDs
    
  - Set permissions
  
## Frequently asked questions

1. __May I pick specific hours and dates on which I want the remapping to occur?__ 

   Yes. We ask you to pick a time and date.
   
1. __Will this affect my O365 subscription?__ 

   No, the remap only affects the Power BI subscriptions
   
1. __Will the remap apply to all my Power BI subscriptions, or may I keep some in their original location?__ 

   No, the remap applies to all Power BI subscriptions associated with the tenant.
   
1. __Will I lose all my Apps, datasets, data models, reports, and dashboards?__ 

   Unfortunately, yes.
   
1. __Will I lose all the personal and enterprise gateways I have created to connect to my various data sources?__ 

   Unfortunately, yes. All gateways associated with Power BI, PowerApps, Flow, and Logic Apps will need to be renewed after the remapping.
   
1. __May I start a new Power BI subscription in the new data center location and then migrate my existing data over when a data remapping solution is implemented?__ 

   Yes & No. Yes, you may start a new subscription, but it must have a different company name to avoid mapping to the existing data center. Cross tenant data migration, the migration of data from one tenant into another existing tenant, isn't currently on our roadmap.
   
1. __Can I migrate or merge my Power BI tenant into a different tenant (for example, because of a company merger)?__

   No, migration from one tenant to another isn't possible.
   
1. __My allowlist contains Power BI IP ranges that are used to access some data sources. Do I need to update the IP ranges to match the new location?__

   Yes. Because it’s a new location, the IP ranges are also changing, and the ranges need to be updated. [Download the Azure IP Ranges JSON file](https://www.microsoft.com/download/details.aspx?id=56519) to identify the needed IP ranges.
   
1. __Is there a cost to have my tenant moved to a different region?__

   No, there's no cost charged for region remapping. Customers that have any paid license can migrate. A global administrator must request the operation.
   
