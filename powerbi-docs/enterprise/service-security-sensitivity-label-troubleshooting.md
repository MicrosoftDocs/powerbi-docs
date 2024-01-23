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
ms.date: 11/26/2023
LocalizationGroup: Data from files
---

# Sensitivity labels troubleshooting

## Licensing and requirements

### What licenses do I need to be able to view and apply sensitivity labels?

* An Azure Information Protection Premium P1 or Premium P2 license is required to apply or view sensitivity labels from Microsoft Purview Information Protection in Power BI.
* To be able to apply labels to Power BI content and files, a user must have a Power BI Pro or Premium Per User (PPU) license, in addition to one of the Azure Information Protection licenses mentioned above.
* Office apps have their own [licensing requirements for viewing and applying sensitivity labels](/microsoft-365/compliance/get-started-with-sensitivity-labels).

### What requirements and prerequisites are there for enabling sensitivity labels in my tenant?

* If your organization uses Azure Information Protection sensitivity labels, they need to be migrated to the Microsoft Purview Information Protection Unified Labeling platform in order for them to be used in Power BI. [Learn more about migrating sensitivity labels](/azure/information-protection/configure-policy-migrate-labels).
* Before enabling sensitivity labels on your tenant, make sure that sensitivity labels have been defined and published for relevant users and groups. See [Create and configure sensitivity labels and their policies for detail](/microsoft-365/compliance/create-sensitivity-labels).
* Customers in China must enable rights management for the tenant and add the Microsoft Purview Information Protection Sync Service service principle, as described in steps 1 and 2 under [Configure Azure Information Protection for customers in China](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection?view=o365-21vianet&preserve-view=true).
* Using sensitivity labels in Desktop requires the Desktop December 2020 release and later.

## General problems with sensitivity labels

### I can't enable sensitivity labels on my tenant

Power BI uses sensitivity labels from Microsoft Purview Information Protection. Thus, if you encounter an error message when trying to enable sensitivity labels, it might be due to one of the following:

* You don't have an Azure Information Protection license.
* Sensitivity labels haven't been migrated to the Microsoft Purview Information Protection version supported by Power BI.
* No sensitivity labels from Microsoft Purview Information Protection have been defined in the organization.

### I can't apply sensitivity labels

To be able to apply or change a sensitivity label, you must

* Have a Power BI Pro or Premium Per User (PPU) license.
* Have create and edit permissions on the item you want to apply the label to.
* Belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).

### The sensitivity label I want to apply is greyed out

If a particular label you wish to change is greyed out, you may not have the correct [usage rights](./service-security-sensitivity-label-change-enforcement.md) to change that label. If you need to change a sensitivity label and can't, either ask the person who applied the label in the first place to modify it, or contact the Microsoft 365/Office security administrator and request the necessary usage rights for the label.

### The sensitivity button in Desktop is greyed out

If the sensitivity button is greyed out, it may indicate that you don't have an appropriate license or that you don't belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).

### The sensitivity label doesn't protect an exported file

Sensitivity labels and file encryption protect data only when it leaves Power BI via [supported export paths](./service-security-sensitivity-label-overview.md#supported-export-paths). Data that leaves Power BI via unsupported export paths won't inherit the sensitivity label and won't be encrypted.

To prevent leakage of sensitive data, the Power BI admin can block export from non-supported export paths using Power BI's [export and sharing settings](../admin/service-admin-portal.md).

### Miscellaneous problems with sensitivity labels

* Don't use parent labels. A parent label is a label that has sublabels. You can't apply parent labels, but a label that is already applied may become a parent label if it acquires sublabels. If you come across an item that has a parent label, apply the appropriate sublabel. To change a parent label, you must have [sufficient usage rights on the label](./service-security-sensitivity-label-change-enforcement.md).

    If an item has a parent label, note the following behavior:
    * Parent labels won't be inherited.
    * Mandatory label policies won't be applied to items that have a parent label. This means users won't be required to apply a meaningful label in order to save the item, and the item will escape mandatory label policies designed to promote total coverage.
    * If you try to export data from an item that has a parent label, export will fail.
    * It's possible to publish a *.pbix* file that has a parent label, but if the parent label is protected, publish will fail. The solution is to apply a suitable sublabel.

* In the Power BI service, if a semantic model has a label that has been deleted from the label admin center, you won't be able to export or download the data. In Analyze in Excel, a warning will be issued and the data will be exported to an .odc file with no sensitivity label. In Desktop, if a *.pbix* file has such an invalid label, you won't be able to save the file.

* Power BI doesn’t support sensitivity labels of the [Do Not Forward](/microsoft-365/compliance/encryption-sensitivity-labels#let-users-assign-permissions), [user-defined](/microsoft-365/compliance/encryption-sensitivity-labels#let-users-assign-permissions), and [HYOK](/azure/information-protection/configure-adrms-restrictions) protection types. The Do Not Forward and user-defined protection types refer to labels defined in the [Purview compliance portal](https://compliance.microsoft.com/).

* Get data and refresh scenarios from encrypted Excel (*.xlsx*) files are supported, unless the file is stored behind a gateway, in which case the Get data/refresh action will fail. Get data and refresh actions from an Excel file that is stored behind a gateway and that has an **unprotected** sensitivity label will succeed, but the sensitivity label won't be inherited. See [Sensitivity label inheritance from data sources](./service-security-sensitivity-label-inheritance-from-data-sources.md) for detail.

## Problems with PBIX files

### I can see a report and semantic model in the Power BI service, but when I download them to pbix, I get a message that says I don't have sufficient permissions to open the file

In the Power BI service, sensitivity labeling doesn't affect access to content. Access to content in the service is determined solely by the permissions a user has on the content. While the labels are visible in the service, any associated encryption settings (configured in the Microsoft Purview compliance portal) aren't applied. They're applied only to data that leaves the service via [supported export paths](./service-security-sensitivity-label-overview.md#supported-export-paths).

In Power BI Desktop, sensitivity labels with encryption settings affect access to content. If a user doesn't have sufficient permissions according to the encryption settings of the sensitivity label on the *.pbix* file, they won't be able to open the file. In addition, in Desktop, when you save your work, any sensitivity label you've added and its associated encryption settings will be applied to the saved *.pbix* file.

### Can't open protected *.pbix* file in Desktop

Using sensitivity labels in Desktop requires the Desktop December 2020 release and later. If you try to open a protected *.pbix* file with a Desktop version earlier than December 2020, it will fail, and you'll be prompted to upgrade your Desktop version.

Users with a free license can't open protected *.pbix* files.

Protected *.pbix* files can be only opened by a user who has an appropriate license and [Full control and/or Export usage rights](/microsoft-365/compliance/encryption-sensitivity-labels) for the relevant label. The user that set the label also has Full control and can never be locked out. [See more detail](/azure/information-protection/configure-usage-rights)

In rare cases, it may happen that no one has the necessary usage rights for the relevant label except the person that set the label. Then, if that one person leaves the organization or changes aliases within the organization, all access to the .pbix file will be lost. The solution for regaining access to the file in such cases is to either change or remove the sensitivity label on the file using the [set](/rest/api/power-bi/admin/information-protection-set-labels-as-admin)/[remove](/rest/api/power-bi/admin/information-protection-remove-labels-as-admin) sensitivity label Admin APIs. Contact your Power BI admin for assistance (only admins can run the Admin APIs).

### Can't save a labeled *.pbix* file in Desktop

Power BI Desktop users may experience problems saving their work when internet connectivity is lost, such as after going offline. With no internet connection, some actions related to sensitivity labels and rights management might not complete properly. In such cases it's recommended to go back online and try saving again. 

In general, when you protect a file with a sensitivity label that applies encryption, it's good practice to use another encryption method as well, such as pagefile encryption, NTFS encryption, BitLocker instances, antimalware, etc.

### Can't publish or get data of a protected *.pbix* file

"Publish" or "Get data" of a protected *.pbix* file requires that the label on the *.pbix* file be in the user's label policy. If the label isn't in the user's label policy, the Publish or Get data action will fail.

### Can't publish or import a *.pbix* file with a sensitivity label to the service using APIs running under a service principal

Publishing or importing a .pbix file that has a **protected** sensitivity label to the service via APIs running under a service principal **is not** supported and will fail. To mitigate, users can remove the label and then publish using service principals.

### Can't upload a protected file to Desktop via Get data

Import of sensitivity-labeled *.pbix* files (both protected and unprotected) stored on OneDrive or SharePoint Online, as well as on-demand and automatic semantic model refresh from such files, is supported, **with the exception of the following scenarios**:

* Protected live-connected *.pbix* files and protected Azure Analysis Services *.pbix* files: Refresh will fail. Neither report content nor label will be updated.
* Labeled unprotected Live Connect *.pbix* files: Report content will be updated but label won't be updated.
* When the *.pbix* file has had a new sensitivity label applied that the semantic model owner doesn't have usage rights to. In this case, refresh will fail. Neither report content nor label will be updated.
* If the semantic model owner's access token for OneDrive/SharePoint has expired. In this case, refresh will fail. Neither report content nor label will be updated.

### Can't open protected *.pbix* file in Power BI Desktop for Power BI Report Server

Power BI Desktop for Power BI Report Server doesn't support information protection. If you try to open a protected *.pbix* file, the file won't open, and you'll receive an error message. Sensitivity-labeled *.pbix* files that aren't encrypted can be opened as normal.

## Sovereign clouds

Sensitivity labels are supported in the following sovereign clouds:

* [US Government](/power-bi/enterprise/service-govus-overview): GCC, GCC High, DoD
* China: Customers in China must enable rights management for the tenant and add the Microsoft Purview Information Protection Sync Service service principle, as described in steps 1 and 2 under [Configure Azure Information Protection for customers in China](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection#configure-aip-for-customers-in-china).

## Sensitivity label support in template apps

Data sensitivity labels aren't supported for template apps. Sensitivity labels set by the template app creator are removed when the app is extracted and installed, and sensitivity labels added to artifacts in an installed template app by the app consumer are lost (reset to nothing) when the app is updated.

## Default labeling

### No default label is applied to new content I create in the Power BI service.

Default labeling in Power BI covers most common scenarios, but there may be some less common flows that still allow users to open or create unlabeled *.pbix* files or Power BI artifacts.

Default labeling in Power BI isn't supported for service principals and APIs. Service principals and APIs aren't subject to default label policies.

Default label policies in Power BI aren't supported for [external guest users (Microsoft Entra B2B)](service-admin-azure-ad-b2b.md). When a B2B user opens or creates an unlabeled *.pbix* file in Power BI Desktop or Power BI artifact in the Power BI service, no default label is applied automatically.

### The pbix file I created didn't get the default label, even though default labeling is enabled on my tenant

Default labeling in Power BI covers most common scenarios, but there may be some less common flows that still allow users to open or create unlabeled *.pbix* files or Power BI artifacts.

### The default label applied to my Power BI content isn't the same as the label applied to my emails and files

Default label policy settings for Power BI are independent of the default label policy settings for files and email.

### B2B users manage to open and create unlabeled *.pbix* files, even though default labeling is on.

Default label policies in Power BI aren't supported for external guest users (B2B users). When a B2B user opens or creates an unlabeled file in Power BI Desktop, no default label will be applied to the file automatically.

## Mandatory labeling

### Mandatory labeling for Power BI is enabled but some artifacts are getting created or saved without a label having to be applied.

Mandatory labeling in Power BI isn't supported for service principals and APIs. Service principals and APIs aren't subject to mandatory label policies.

There may be flows that allow the user to create or edit unlabeled content.

Mandatory labeling in Power BI isn't supported for external guest users (B2B users). B2B users aren't subject to mandatory label policies.

## Downstream inheritance

### Downstream inheritance is enabled, but some or all downstream items don't inherit the label

Downstream inheritance is limited to 80 items. If the number of downstream items exceeds 80, no downstream inheritance takes place. Only the item the label was actually applied to will receive the label.

Downstream inheritance never overwrites labels that were applied manually.

Downstream inheritance never overwrites a label with a less restrictive label.

Sensitivity labels inherited from data sources are automatically propagated downstream only when [fully automated downstream inheritance mode](./service-security-sensitivity-label-downstream-inheritance.md) is enabled.

## Sensitivity label inheritance from data sources

### Sensitivity labels from a data source aren't inherited into Power BI.

* The data in the data source must be labeled with sensitivity labels from Microsoft Purview Information Protection.
* The scope of the labels must be Files and emails and Azure Purview assets. See Extending sensitivity labels to Azure Purview and Creating new sensitivity labels or modifying existing labels.
* Sensitivity labels must be enabled in Power BI.
* The **Apply sensitivity labels from data sources to their data in Power BI (preview)** tenant admin setting must be enabled.
* All conditions for applying a label must be met.
* Inheritance from data sources isn't supported for semantic models located in classic workspaces. My Workspace and V2 workspaces are supported.
* Inheritance from data sources is supported only for semantic models with enhanced metadata. See [Using enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md) for more information.
* Inheritance from data sources is supported only for semantic models using the Import data connectivity mode. Live connection and DirectQuery connectivity isn't supported.
* Inheritance from data sources isn't supported in connections via gateways or Azure Virtual Network (VNet). This means that inheritance from an Excel file located on a local machine won't work, because this requires a gateway.

## Problems setting and removing sensitivity labels using Power BI REST APIs

### Can't set or remove sensitivity labels using Power BI REST admin APIs

* Users must have administrator rights (such as Microsoft 365 global administrator or Fabric administrator) to call these APIs.
* The admin user (and the delegated user, if provided) must have sufficient [usage rights](/azure/information-protection/configure-usage-rights) to set or remove labels.
* To set a sensitivity label using the setLabels API, the admin user (or the delegated user, if provided) must have the label included in their label policy.
* The APIs allow a maximum of 25 requests per hour. Each request can update up to 2000 artifacts.
* **Required scope**: Tenant.ReadWrite.All

## Defender for Cloud Apps

To use Defender for Cloud Apps with Power BI, you must use and configure relevant Microsoft security services, some of which are set outside Power BI. In order to have Defender for Cloud Apps in your tenant, you must have one of the following licenses:

* Defender for Cloud Apps: Provides Defender for Cloud Apps capabilities for all supported apps, part of the EMS E5 and Microsoft 365 E5 suites.
* Office 365 Cloud App Security (a subset of Defender for Cloud Apps): Provides Cloud App Security capabilities only for Office 365, part of the Office 365 E5 suite.

Using Defender for Cloud Apps with Power BI is designed to help secure your organization's content and data, with detections that monitor user sessions and their activities. When using Defender for Cloud Apps with Power BI, there are a few considerations and limitations you should keep in mind:

* Defender for Cloud Apps can only operate on Excel, PowerPoint, and PDF files.
* If you want to use sensitivity labels capabilities in your session policies for Power BI, you need to have an Azure Information Protection Premium P1 or Premium P2 license. Microsoft Azure Information Protection can be purchased either standalone or through one of the Microsoft licensing suites. See [Azure Information Protection pricing](https://azure.microsoft.com/services/information-protection/) for detail. In addition, sensitivity labels must have been applied on your Power BI assets.
* Session control is available for any browser on any major platform on any operating system. We recommend using Internet Explorer 11, Microsoft Edge (latest), Google Chrome (latest), Mozilla Firefox (latest), or Apple Safari (latest). Power BI public API calls and other non-browser-based sessions aren't supported as part of Defender for Cloud Apps session control. [See more detail](/defender-cloud-apps/proxy-intro-aad#supported-apps-and-clients).
* If you experience sign in difficulties, such as having to log in more than once, it could be related to the way some apps handle authentication. See [Slow login in the Defender for Cloud Apps documentation](/defender-cloud-apps/troubleshooting-proxy#slow-login) for more information and remediation steps.

> [!CAUTION]
> In the session policy, in the "Action" part, the "protect" capability works only if no label exists on the item. If a label already exists, the "protect" action won't apply; you can't override an existing label that has already been applied to an item in Power BI.

## Data protection metrics report

### I open the data protection metrics page but no report is generated

In order for the data protection metrics report to be successfully generated[, information protection](./service-security-enable-data-sensitivity-labels.md) must be enabled on your tenant and [sensitivity labels should have been applied](./service-security-apply-data-sensitivity-labels.md).

The data protection metrics report isn't available to [external users such as Microsoft Entra B2B (Microsoft Entra B2B) guest users](./service-admin-azure-ad-b2b.md).

### I can't access the Defender for Cloud Apps information.

In order to access Defender for Cloud Apps information, your organization must have the appropriate [Defender for Cloud Apps license](./service-security-using-defender-for-cloud-apps-controls.md).

### I don't see the data protection metrics report in Shared with me, Recents, or Favorites

The data protection metrics report is a special report and doesn't show up in the **Shared with me**, **Recent**, and **Favorites** lists.

### I can't share the data protection metrics report with external users

The data protection metrics report isn't available to [external users (Microsoft Entra B2B guest users)](/power-bi/enterprise/service-admin-azure-ad-b2b).

## Paginated reports

### My paginated report doesn't inherit the sensitivity label of the model it's based on.

Downstream inheritance isn't supported. The label of an upstream model won't propagate down to its downstream paginated reports.

### The sensitivity label on my paginated report doesn't get applied to the report's downstream content.

The label of a paginated report won't propagate down to the report's downstream content.

### I can create and save paginated reports with no sensitivity label even though mandatory labeling is enabled.

Mandatory labeling won't apply to paginated reports.
