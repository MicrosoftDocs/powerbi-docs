---
title: Sensitivity labels troubleshooting
description: Find guidance for resolving common issues related to sensitivity labels in Power BI.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 12/07/2022
LocalizationGroup: Data from files
---

# Sensitivity labels troubleshooting

## Licensing and requirements

### What licenses do I need to be able to view and apply sensitivity labels?

* An Azure Information Protection Premium P1 or Premium P2 license is required to apply or view Microsoft Information Protection sensitivity labels in Power BI.
* To be able to apply labels to Power BI content and files, a user must have a Power BI Pro or Premium Per User (PPU) license, in addition to one of the Azure Information Protection licenses mentioned above.
* Office apps have their own [licensing requirements for viewing and applying sensitivity labels](/microsoft-365/compliance/get-started-with-sensitivity-labels).

### What requirements and prerequisites are there for enabling sensitivity labels in my tenant?

* If your organization uses Azure Information Protection sensitivity labels, they need to be migrated to the Microsoft Information Protection Unified Labeling platform in order for them to be used in Power BI. [Learn more about migrating sensitivity labels](/azure/information-protection/configure-policy-migrate-labels).
* Before enabling sensitivity labels on your tenant, make sure that sensitivity labels have been defined and published for relevant users and groups. See [Create and configure sensitivity labels and their policies for detail](/microsoft-365/compliance/create-sensitivity-labels).
* Customers in China must enable rights management for the tenant and add the Microsoft Information Protection Sync Service service principle, as described in steps 1 and 2 under [Configure Azure Information Protection for customers in China](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection?view=o365-21vianet&preserve-view=true).
* Using sensitivity labels in Desktop requires the Desktop December 2020 release and later.

## General problems with sensitivity labels

### I can't enable sensitivity labels on my tenant

Power BI uses Microsoft Information Protection sensitivity labels. Thus, if you encounter an error message when trying to enable sensitivity labels, it might be due to one of the following:

* You do not have an Azure Information Protection license.
* Sensitivity labels have not been migrated to the Microsoft Information Protection version supported by Power BI.
* No Microsoft Information Protection sensitivity labels have been defined in the organization.

### I can't apply sensitivity labels

To be able to apply or change a sensitivity label, you must

* Have a Power BI Pro or Premium Per User (PPU) license.
* Have create and edit permissions on the artifact that you want to apply the label to.
* Belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).

### The sensitivity label I want to apply is greyed out

If a particular label you wish to change is greyed out, you may not have the correct [usage rights](./service-security-sensitivity-label-change-enforcement.md) to change that label. If you need to change a sensitivity label and can't, either ask the person who applied the label in the first place to modify it, or contact the Microsoft 365/Office security administrator and request the necessary usage rights for the label.

### The sensitivity button in Desktop is greyed out

If the sensitivity button is greyed out, it may indicate that you don't have an appropriate license or that you do not belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).

### The sensitivity label doesn't protect an exported file

* Sensitivity labels and file encryption are not applied in non-supported export paths. Supported export paths are export to Excel, PDF, and PowerPoint, as well as download to .pbix. To prevent leakage of sensitive data, the Power BI admin can block export from non-supported export paths using Power BI's [export and sharing settings](../admin/service-admin-portal.md).

### Miscellaneous problems with sensitivity labels

* It is not recommended to allow users to apply parent labels within Power BI (a label is considered to be a parent label only if it has sublabels). If a parent label is applied to content, exporting data from that content to a file (Excel, PowerPoint, and PDF) will fail. See [Sublabels (grouping labels)](microsoft-365/compliance/sensitivity-labels).
* In the Power BI service, if a dataset has a label that has been deleted from the label admin center, you will not be able to export or download the data. In Analyze in Excel, a warning will be issued and the data will be exported to an .odc file with no sensitivity label. In Desktop, if a .pbix file has such an invalid label, you will not be able to save the file.
* Power BI does not support sensitivity labels of the Do Not Forward, user-defined, and HYOK protection types. The Do Not Forward and user-defined protection types refer to labels defined in the Microsoft 365 compliance center.
* Getting data from encrypted Excel (.xlsx) files is not supported. This includes “Get data” and refresh scenarios.

## Problems with PBIX files

### I can see a report and dataset in the Power BI service, but when I download them to pbix, I get a message that says I don't have sufficient permissions to open the file

In the Power BI service, sensitivity labeling does not affect access to content. Access to content in the service is determined solely by [the role](../collaborate-share/service-roles-new-workspaces.md) a user has in the workspace where the content is located. While the labels are visible in the service, any associated encryption settings (configured in the Microsoft 365 compliance center) are not applied. They are applied only to data that leaves the service via [supported export paths](./service-security-sensitivity-label-overview.md#supported-export-paths).

In Power BI Desktop, sensitivity labels with encryption settings affect access to content. If a user does not have sufficient permissions according to the encryption settings of the sensitivity label on the .pbix file, they will not be able to open the file. In addition, in Desktop, when you save your work, any sensitivity label you've added and its associated encryption settings will be applied to the saved .pbix file.

### Can't open protected .pbix file in Desktop

* Using sensitivity labels in Desktop requires the Desktop December 2020 release and later. If you try to open a protected .pbix file with a Desktop version earlier than December 2020, it will fail, and you will be prompted to upgrade your Desktop version.
* Protected .pbix files can be only opened by a user who has [Full control and/or Export usage rights](/microsoft-365/compliance/encryption-sensitivity-labels) for the relevant label. The user that set the label also has Full control and can never be locked out. [See more detail](/azure/information-protection/configure-usage-rights)

### Can't save a labeled .pbix file in Desktop

* If the label applied to a .pbix file hasn't been published to the user in the Microsoft 365 compliance center, the user will not be able to save the file in Desktop. 
* Power BI Desktop users may experience problems saving their work when internet connectivity is lost, such as after going offline. With no internet connection, some actions related to sensitivity labels and rights management might not complete properly. In such cases it is recommended to go back online and try saving again. 
* Very large .pbix files (over 2GB) cannot be saved with a sensitivity label. To work around this limitation, save the file without the label, publish it to the Power BI service, and then apply the label to the published dataset and report.

In general, when you protect a file with a sensitivity label that applies encryption, it is good practice to use another encryption method as well, such as pagefile encryption, NTFS encryption, BitLocker instances, antimalware, etc.

### Can't publish or get data of a protected .pbix file

* "Publish" or "Get data" of a protected .pbix file requires that the label on the .pbix file be in the user's label policy. If the label isn't in the user's label policy, the Publish or Get data action will fail.

### Can't publish or import a .pbix file with a sensitivity label to the service using APIs running under a service principal

* Publishing or importing a .pbix file with a sensitivity label to the service via APIs running under a service principal is not supported and will fail. To mitigate, users can remove the labels and then publish using service principals.

### Can't upload a protected file to Desktop via Get data

* Get data can upload protected files only if they are local. Protected files from online services such as SharePoint Online or OneDrive for Business cannot be uploaded. For a protected file, you can either upload it from your local device, or first remove the file's label in Power BI Desktop and then upload it via one of the online services.

### Can't open protected .pbix file in Power BI Desktop for Power BI Report Server

* Power BI Desktop for Power BI Report Server does not support information protection. If you try to open a protected .pbix file, the file will not open and you will receive an error message. Sensitivity-labeled .pbix files that are not encrypted can be opened as normal.

## Sovereign clouds

Sensitivity labels are supported in the following sovereign clouds:

* [US Government](../admin/service-govus-overview.md): GCC, GCC High, DoD
* China: Customers in China must enable rights management for the tenant and add the Microsoft Information Protection Sync Service service principle, as described in steps 1 and 2 under [Configure Azure Information Protection for customers in China](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection.md?view=o365-21vianet&preserve-view=true).

## Sensitivity label support in template apps

* Data sensitivity labels are not supported for template apps. Sensitivity labels set by the template app creator are removed when the app is extracted and installed, and sensitivity labels added to artifacts in an installed template app by the app consumer are lost (reset to nothing) when the app is updated.

## Default labeling

### No default label is applied to new content I create in the Power BI service.

Default label policies are not currently supported in the Power BI service.

### The pbix file I created didn't get the default label, even though default labeling is enabled on my tenant

* Default labeling in Power BI is in preview, so there may be flows that allow users to open or create an unlabeled .pbix file.

### The default label applied to my Power BI content is not the same as the label applied to my emails and files

* Default label policy settings for Power BI are independent of the default label policy settings for files and email.

### B2B users manage to open and create unlabeled .pbix files, even though default labeling is on.

* Default label policies in Power BI are not supported for external guest users (B2B users). When a B2B user opens or creates an unlabeled file in Power BI Desktop, no default label will be applied to the file automatically.

## Mandatory labeling

### Mandatory labeling for Power BI is enabled but some artifacts are getting created or saved without a label having to be applied.

* Mandatory labeling in Power BI is not supported for service principals and APIs. Service principals and APIs are not subject to mandatory label policies.
* Mandatory labeling in Power BI is in preview, so there may be flows that allow the user to create or edit unlabeled content.
* Mandatory labeling in Power BI is not supported for external guest users (B2B users). B2B users are not subject to mandatory label policies.

## Downstream inheritance

### Downstream inheritance is enabled, but some or all downstream items don't inherit the label

* Downstream inheritance is limited to 80 items. If the number of downstream items exceeds 80, no downstream inheritance takes place. Only the item the label was actually applied to will receive the label.
* Downstream inheritance never overwrites labels that were applied manually.
* Downstream inheritance never overwrites a label with a less restrictive label.
* Sensitivity labels inherited from data sources are automatically propagated downstream only when [fully automated downstream inheritance mode](./service-security-sensitivity-label-downstream-inheritance.md) is enabled.

## Sensitivity label inheritance from data sources

### Sensitivity labels from a data source are not inherited into Power BI.

* The data in the data source must be labeled with Microsoft Information Protection labels.
* The scope of the labels must be Files and emails and Azure Purview assets. See Extending sensitivity labels to Azure Purview and Creating new sensitivity labels or modifying existing labels.
* Sensitivity labels must be enabled in Power BI.
* The Apply sensitivity labels from data sources to their data in Power BI (preview) tenant admin setting must be enabled.
* All conditions for applying a label must be met.
* Inheritance from data sources is not supported for datasets located in classic workspaces. My Workspace and V2 workspaces are supported.
* Inheritance from data sources is supported only for datasets with enhanced metadata. See Using enhanced dataset metadata for more information.
* Inheritance from data sources is supported only for datasets using the Import data connectivity mode. Live connection and DirectQuery connectivity is not supported.
* Inheritance from data sources is not supported in connections via gateways or Azure Virtual Network (VNet). This means that inheritance from an Excel file located on a local machine won't work, because this requires a gateway.

## Problems setting and removing sensitivity labels using Power BI REST APIs

### Can't set or remove sensitivity labels using Power BI REST admin APIs

* The user must have administrator rights (such as Office 365 Global Administrator or Power BI Service Administrator) to call these APIs.
* The admin user (and the delegated user, if provided) must have sufficient usage rights to set or remove labels.
* To set a sensitivity label using the setLabels API, the admin user (or the delegated user, if provided) must have the label included in their label policy.
* The APIs allow a maximum of 25 requests per hour. Each request can update up to 2000 artifacts.
* Required scope: Tenant.ReadWrite.All

## Defender for Cloud Apps

* To use Defender for Cloud Apps with Power BI, you must use and configure relevant Microsoft security services, some of which are set outside Power BI. In order to have Defender for Cloud Apps in your tenant, you must have one of the following licenses:
* Defender for Cloud Apps: Provides Defender for Cloud Apps capabilities for all supported apps, part of the EMS E5 and Microsoft 365 E5 suites.
* Office 365 Cloud App Security: Provides Cloud App Security capabilities only for Office 365, part of the Office 365 E5 suite.
* Using Cloud App Security with Power BI is designed to help secure your organization's content and data, with detections that monitor user sessions and their activities. When using Cloud App Security with Power BI, there are a few considerations and limitations you should keep in mind:
* Cloud App Security can only operate on Excel, PowerPoint, and PDF files.
* If you want to use sensitivity labels capabilities in your session policies for Power BI, you need to have an Azure Information Protection Premium P1 or Premium P2 license. Microsoft Azure Information Protection can be purchased either standalone or through one of the Microsoft licensing suites. See Azure Information Protection pricing for detail. In addition, sensitivity labels must have been applied on your Power BI assets.
* Session control is available for any browser on any major platform on any operating system. We recommend using Internet Explorer 11, Microsoft Edge (latest), Google Chrome (latest), Mozilla Firefox (latest), or Apple Safari (latest). Power BI public API calls and other non-browser-based sessions aren't supported as part of Cloud App Security session control. See more detail.
* Caution: In the session policy, in the “Action” part, the “protect” capability will only work if no label exists on the item. If a label already exists, the “protect” action won't apply; you can't override an existing label that has already been applied to an item in Power BI.

## Data protection metrics report

### I open the data protection metrics page but no report is generated

In order for the data protection metrics report to be successfully generated[, information protection](./service-security-enable-data-sensitivity-labels.md) must be enabled on your tenant and [sensitivity labels should have been applied](./service-security-apply-data-sensitivity-labels.md).

### I can't access the Defender for Cloud Apps information.

In order to access Defender for Cloud Apps information, your organization must have the appropriate [Defender for Cloud Apps license](./service-security-using-microsoft-cloud-app-security-controls.md).

### I don't see the data protection metrics report in Shared with me, Recents, or Favorites

The data protection metrics report is a special kind of report and does not show up in "Shared with me", "Recents", and "Favorites" lists.

### I can't share the data protection metrics report with external users

The data protection metrics report is not available to [external users (Azure Active Directory B2B guest users)](../admin/service-admin-azure-ad-b2b.md).

## Paginated reports

### My paginated report doesn't inherit the sensitivity label of the model it's based on.

* Downstream inheritance is not supported. The label of an upstream model will not propagate down to its downstream paginated reports.

### The sensitivity label on my paginated report does not get applied to the report's downstream content.

* The label of a paginated report will not propagate down to the report's downstream content.

### I can create and save paginated reports with no sensitivity label even though mandatory labeling is enabled.

* Mandatory labeling will not apply to paginated reports.