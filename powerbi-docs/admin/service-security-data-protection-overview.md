---
title: Data protection in Power BI
description: Learn how data protection works in Power BI
author: paulinbar
manager: rkarlin

ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 07/05/2020
ms.author: painbar

LocalizationGroup: Data from files
---
# Microsoft Information Protection sensitivity labels in Power BI

[Microsoft Information Protection sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide) provide a simple way for your users to classify critical content in Power BI without compromising productivity or the ability to collaborate.

Sensitivity labels can be applied on datasets, reports, dashboards, and dataflows. When data is exported from Power BI to Excel, PowerPoint or PDF files, Power BI automatically applies a sensitivity label on the exported file and protects it according to the label’s file encryption settings. This way your sensitive data remains protected no matter where it is.

Sensitivity labels applied on Power BI reports, dashboards, datasets, and dataflows are visible from many places in the Power BI service. Sensitivity labels on reports and dashboards are also visible in the Power BI iOS and Android mobile apps and in embedded visuals.

A protection metrics report available in the Power BI admin portal gives Power BI admins full visibility over the sensitive data in the Power BI tenant. In addition, the Power BI audit logs include sensitivity label information about activities such as applying, removing, and changing labels, as well as about activities such as viewing reports, dashboards, etc., giving Power BI and security admins visibility over sensitive data consumption for the purpose of monitoring, investigating, and security alerts.

## Important considerations

Sensitivity labeling **does not** affect access to content within Power BI – access to content within Power BI is managed solely by Power BI permissions. While the labels are visible, any associated encryption settings (configured in either the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/)) are not applied. They are applied only to data that is exported to Excel, PowerPoint, and PDF files.

Sensitivity labels and file encryption **are not** applied in any export path other than export to Excel, PowerPoint, and PDF. The Power BI tenant admin can disable any or all export paths that don’t support the application of sensitivity labels and their associated file encryption settings.

>[!NOTE]
> Users who are granted access to a report are granted access to the entire underlying dataset, unless [row-level security (RLS)](./service-admin-rls.md) limits their access. Report authors can classify and label reports using sensitivity labels. If the sensitivity label has protection settings, Power BI applies these protection settings when the report data is exported to Excel, PowerPoint, or PDF files. Only authorized users will be able to open protected files.

## How sensitivity labels work in Power BI

When you apply a sensitivity label to a Power BI dashboard, report, dataset or dataflow, it's similar to applying a tag on that resource that has the following benefits:
* **Customizable** - you can create categories for different levels of sensitive content in your organization, such as Personal, Public, General, Confidential, and Highly Confidential.
* **Clear text** - since the label is in clear text, it's easy for users to understand how to treat the content according to sensitivity label guidelines.
* **Persistent** - after a sensitivity label has been applied to content, it accompanies that content when it is exported to  Excel, PowerPoint and PDF files, and becomes the basis for applying and enforcing policies.

This means that the sensitivity label follows the content when it is exported to Excel, PowerPoint, and PDF files, and becomes the basis for applying and enforcing policies.

Power BI tenant admins can control [export to Excel](service-admin-portal.md#export-to-excel) and [export to PowerPoint and PDF](service-admin-portal.md#export-reports-as-powerpoint-presentations-or-pdf-documents) in the [Power BI admin portal](service-admin-portal.md).

Here's a quick example of how a sensitivity label in Power BI can work.
1. In the Power BI service, a **Highly Confidential** sensitivity label is applied to a report.

   ![Sensitivity labels in list view](media/service-security-data-protection-overview/ApplyLabelandProtection.gif)
   
1. When data is exported to an Excel file from this report, the sensitivity label and protection are applied to the exported Excel file.

   ![Sensitivity label follows the content](media/service-security-data-protection-overview/sensitivity-labels-overview-02.png)

In Microsoft Office applications, a sensitivity label appears as a tag on the email or document, similar to what is shown in the image above. You can also assign a classification to content (like a sticker) that persists and roams with the content as it's used and shared throughout Power BI. You can use this classification to generate usage reports and see activity data for your sensitive content. Based on this information, you can always choose later to apply protection settings.

## Apply

See XXX

## Label inheritance upon creation of new content

When new reports and dashboards are created in the Power BI service, they automatically inherit the sensitivity label previously applied on parent dataset or report. For example, a new report created on top of a dataset that has a "Highly Confidential" sensitivity label will automatically receive the "Highly Confidential" label as well.

## Labels and data export

Label and protection controls are enforced only when data is exported to Excel, PowerPoint and PDF files. Label and protection are not enforced when data is exported to .csv or .pbix files, Analyze in Excel, or any other export path.

Applying a sensitivity label and protection to an exported file doesn't add content marking to the file. However, if the label is configured to apply content markings, they are automatically applied by the Azure Information Protection unified labeling client when the file is opened in Office desktop apps. The content markings are not automatically applied when you use built-in labeling for desktop, mobile, or web apps. See [When Office apps apply content marking and encryption](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels-office-apps?view=o365-worldwide#when-office-apps-apply-content-marking-and-encryption) for more detail.

A user who exports a file from Power BI has permissions to access and edit that file according to the sensitivity label settings. The user who exports the data does not get owner permissions to the file.

Export will fail if a label can't be applied when data is exported to a file. To check if export failed because the label couldn't be applied, click the report or dashboard name at the center of the title bar and see whether it says "Sensitivity label can't be loaded" in the info dropdown that opens. This can happen if the applied label has been unpublished or deleted by the security admin, or as the result of a temporary system issue.

## Label persistence in embedded reports and dashboards

Power BI business reports are often embedded in business applications such as Microsoft Teams, SharePoint, or an organization’s website. Now when you embed sensitive information, the label applied on your reports and dashboards will be visible in the embedded view and persist when data is exported to Excel.

## Label inheritance to Excel for live data connections

When you create a PivotTable in Excel with a live connection to Power BI dataset ("Analyze In Excel"), the dataset's sensitivity label is inherited and applied to your Excel file, along with its associated protection. If the label on the dataset is later changed to a more restrictive one, the label applied on the linked Excel file will automatically update upon data refresh.

## Label creation and management

Sensitivity labels are created and managed in either the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/).

To access sensitivity labels in either of these centers, navigate to **Classification > Sensitivity labels**. These sensitivity labels can be used by multiple Microsoft services such Azure Information Protection, Office apps, and Office 365 services.

> [!Important]
> If your organization uses Azure Information Protection sensitivity labels, you need to [migrate](https://docs.microsoft.com/azure/information-protection/configure-policy-migrate-labels) them to one of the previously listed services in order for the labels to be used in Power BI.

## Requirements for using sensitivity labels in Power BI

Before your sensitivity labels can be enabled and used in Power BI, you must first complete the following prerequisites:
* Make sure that sensitivity labels have been defined in either the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/).
* [Enable sensitivity labels](service-security-enable-data-sensitivity-labels.md) in Power BI.
* Make sure users have the [appropriate licenses](#licensing).
* If using Microsoft Cloud App Security with Power BI, make sure to have the [appropriate licensing](service-security-using-microsoft-cloud-app-security-controls.md#cloud-app-security-licensing).

## Licensing

* Applying and viewing Microsoft Information Protection sensitivity labels in Power BI requires an Azure Information Protection Premium P1 or Premium P2 license. Microsoft Azure Information Protection can be purchased either standalone or through one of the Microsoft licensing suites. See [Azure Information Protection pricing](https://azure.microsoft.com/pricing/details/information-protection/) for detail.
* Viewing and applying labels in Office apps has [licensing requirements](https://docs.microsoft.com/microsoft-365/compliance/get-started-with-sensitivity-labels#subscription-and-licensing-requirements-for-sensitivity-labels).
* To apply labels to Power BI content, a user must have a Power BI Pro license in addition to one of the Azure Information Protection licenses mentioned above.
* You must have the [necessary licenses for Microsoft Cloud App Security](https://docs.microsoft.com/power-bi/admin/service-security-using-microsoft-cloud-app-security-controls#microsoft-cloud-app-security-licensing) if you are going to use it to protect Power BI content against unintended leaks and breaches.

## Supported clouds
Sensitivity labels are only supported for tenants in global (public) clouds; they are not supported for tenants in clouds such as national clouds.

## Protect content using Microsoft Cloud App Security

You can protect content in Power BI against unintended leaks or breaches by using Microsoft Cloud App Security. Once Microsoft Cloud App Security is set and configured, security administrators can monitor user access and activity, perform real-time risk analysis, and set label-specific controls.

For example, organizations can use Microsoft Cloud App Security to configure a policy that prevents users from downloading sensitive data from Power BI to unmanaged devices. Such a configuration allows users to remain productive and connect to Power BI from anywhere, while using Microsoft Cloud App Security to prevent compromising user actions, all in real time.

**Requirements**

Before your sensitivity labels can use Microsoft Cloud App Security, the following prerequisites must be met:
* Cloud App Security and Azure Information Protection [must be enabled for your tenant](https://docs.microsoft.com/cloud-app-security/azip-integration).
* The app [must be connected to Microsoft Cloud App Security](https://docs.microsoft.com/cloud-app-security/enable-instant-visibility-protection-and-governance-actions-for-your-apps).

## Considerations and limitations

The following list provides some limitations of sensitivity labels in Power BI:

* Sensitivity labels can be applied only on dashboards, reports, datasets and dataflows. They are not currently available for [paginated reports](../paginated-reports/report-builder-power-bi.md) and workbooks.
* Sensitivity labels on Power BI assets are visible in the workspace list, lineage, favorites, recents, and apps views; labels are not currently visible in the "shared with me" view. Note, however, that a label applied to a Power BI asset, even if not visible, will always persist on data exported to Excel, PowerPoint, and PDF files.
* Data sensitivity labels are not supported for template apps. Sensitivity labels set by the template app creator are removed when the app is extracted and installed, and sensitivity labels added to artifacts in an installed template app by the app consumer are lost (reset to nothing) when the app is updated.
* Power BI does not support sensitivity labels of the [Do Not Forward](https://docs.microsoft.com/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide#let-users-assign-permissions), [user-defined](https://docs.microsoft.com/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide#let-users-assign-permissions), and [HYOK](https://docs.microsoft.com/azure/information-protection/configure-adrms-restrictions) protection types. The Do Not Forward and user-defined protection types refer to labels defined in the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/).
* It is not recommended to allow users to apply parent labels within Power BI. If a parent label is applied to content, exporting data from that content to a file (Excel, PowerPoint and PDF) will fail. See [Sublabels (grouping labels)](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels?view=o365-worldwide#sublabels-grouping-labels).

## Next steps

This article provided an overview of data protection in Power BI. The following articles provide more details about data protection in Power BI. 

* [Enable data sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md)
* [Apply data sensitivity labels in Power BI](../collaborate-share/service-security-apply-data-sensitivity-labels.md)
* [Using Microsoft Cloud App Security controls in Power BI](service-security-using-microsoft-cloud-app-security-controls.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)