---
title: Microsoft Information Protection sensitivity labels in Power BI
description: Learn how Microsoft Information Protection sensitivity labels work in Power BI
author: paulinbar
manager: rkarlin

ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 08/16/2020
ms.author: painbar

LocalizationGroup: Data from files
---
# Sensitivity labels in Power BI

This article describes the functionality of Microsoft Information Protection sensitivity labels in Power BI.

For information about enabling sensitivity labels on your tenant, including licensing requirements and prerequisites, see [Enable data sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md).

For information about how to apply sensitivity labels on your Power BI content and files, see [How to apply sensitivity labels in Power BI](./service-security-apply-data-sensitivity-labels.md).

## Introduction

Microsoft Information Protection sensitivity labels provide a simple way for your users to classify critical content in Power BI without compromising productivity or the ability to collaborate. They can be applied in Power BI Desktop, making it possible to protect your sensitive data from day one the moment you save it to file, as well as in the Power BI service. Sensitivity labels are retained when you move your content back and forth between Desktop and the service in the form of .pbix files.

Sensitivity labels can be applied to datasets, reports, dashboards, and dataflows. When labeled data leaves Power BI, either via export to Excel, PowerPoint or PDF files, or via other supported export scenarios such as Analyze in Excel or live connection PivotTables in Excel, Power BI automatically applies the label to the exported file and protects it according to the label’s file encryption settings. This way your sensitive data remains protected, no matter where it is.

In addition, sensitivity labels can be applied to .pbix and .pbit files, so that your data and content is safe when is shared outside Power BI (for example, sending the file over email), even before it has been published to the Power BI service.”

Sensitivity labels on reports, dashboards, datasets, and dataflows are visible from many places in the Power BI service. Sensitivity labels on reports and dashboards are also visible in the Power BI iOS and Android mobile apps and in embedded visuals.

A [protection metrics report](service-security-data-protection-metrics-report.md) available in the Power BI admin portal gives Power BI admins full visibility over the sensitive data in the Power BI tenant. In addition, the Power BI audit logs include sensitivity label information about activities such as applying, removing, and changing labels, as well as about activities such as viewing reports, dashboards, etc., This gives Power BI and security admins visibility over sensitive data consumption for the purposes of monitoring and investigating security alerts.

## Important considerations

Sensitivity labeling **does not** affect access to content within Power BI – access to content within Power BI is managed solely by Power BI permissions. While the labels are visible, any associated encryption settings (configured in either the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/)) are not applied. They are applied only to data that leaves Power BI via a supported export path, such as export to Excel, PowerPoint, or PDF, download to .pbix, and **Save** (Power BI Desktop).

Sensitivity labels and file encryption **are not** applied in non-supported export paths. The Power BI admin can block export from non-supported export paths:

>[!NOTE]
> Users who are granted access to a report are granted access to the entire underlying dataset, unless [row-level security (RLS)](./service-admin-rls.md) limits their access. Report authors can classify and label reports using sensitivity labels. If the sensitivity label has protection settings, Power BI applies these protection settings when the report data leaves Power BI via a supported export path such as export to Excel, PowerPoint, or PDF, download to .pbix, and **Save** (Desktop). Only authorized users will be able to open protected files.

### Supported export paths
Applying sensitivity labels and their associated protection to data that leaves Power BI is currently supported for the following export paths:
* Export to Excel, PowerPoint, and PDF files.
* Analyze in Excel from the Power BI service, which triggers download of an Excel file with a live connection to a Power BI dataset.
* PivotTable in Excel with a live connection to a Power BI dataset, for users with M365 E3 and above.
* Download to .pbix.
* **Save** in Power BI Desktop.

>[!NOTE]
>When using **Download the .pbix** in the Power BI service, if the downloaded report and its dataset have different labels, the more restrictive label will be applied to the .pbix file. 

## How sensitivity labels work in Power BI

When you apply a sensitivity label to Power BI content and files, it's similar to applying a tag on that resource that has the following benefits:
* **Customizable** - you can create categories for different levels of sensitive content in your organization, such as Personal, Public, General, Confidential, and Highly Confidential.
* **Clear text** - since the label is in clear text, it's easy for users to understand how to treat the content according to sensitivity label guidelines.
* **Persistent** - after a sensitivity label has been applied to content, it accompanies that content when it is exported to  Excel, PowerPoint and PDF files, downloaded to .pbix, or saved (in Desktop).and becomes the basis for applying and enforcing policies.

Here's a quick example of how sensitivity labels in Power BI work. The image below shows how a sensitivity label is applied on a report in the Power BI service, then how the data from the report is exported to an Excel file, and finally how the sensitivity label and its protections persist in the exported file.

![Animated gif showing application and persistence of sensitivity labels](media/service-security-sensitivity-label-overview/ApplyLabelandProtection.gif)

The sensitivity labels you apply to content persist and roam with the content as it's used and shared throughout Power BI. You can use  use the labeling to generate usage reports and to see activity data for your sensitive content.

## Sensitivity labels in Power BI Desktop

* Sensitivity labels can be applied from day 1 to the content. 
* Can be seen in the status bar. 
* Travels with the content to Power BI service
When you save, the pbix file gets the labe, and if you publish, the file also gets the label?  


## Sensitivity label inheritance upon creation of new content

When new reports and dashboards are created in the Power BI service, they automatically inherit the sensitivity label previously applied on parent dataset or report. For example, a new report created on top of a dataset that has a "Highly Confidential" sensitivity label will automatically receive the "Highly Confidential" label as well.

The following image shows how a dataset's sensitivity label is automatically applied on a new report that is built on top of the dataset.

![Animated gif showing inheritance of sensitivity labels](media/service-security-sensitivity-label-overview/InheritanceUponCreation.gif)

>[!NOTE]
>If for any reason the sensitivity label can't be applied on the new report or dashboard, Power BI **will not** block creation of the new item.

## Sensitivity labels and protection on exported data

When data is exported from Power BI to Excel, PowerPoint or PDF files, Power BI automatically applies a sensitivity label on the exported file and protects it according to the label’s file encryption settings. This way your sensitive data remains protected no matter where it is.

A user who exports a file from Power BI has permissions to access and edit that file according to the sensitivity label settings; they do not get owner permissions to the file.

>[!NOTE]
>When using **Download the .pbix** in the Power BI service, if the downloaded report and its dataset have different labels, the more restrictive label will be applied to the .pbix file. 


Sensitivity labels and protection are not applied when data is exported to .csv, files or any other unsupported export path.

Applying a sensitivity label and protection to an exported file doesn't add content marking to the file. However, if the label is configured to apply content markings, the markings are automatically applied by the Azure Information Protection unified labeling client when the file is opened in Office desktop apps. The content markings are not automatically applied when you use built-in labeling for desktop, mobile, or web apps. See [When Office apps apply content marking and encryption](/microsoft-365/compliance/sensitivity-labels-office-apps#when-office-apps-apply-content-marking-and-encryption) for more detail.

Export fails if a label can't be applied when data is exported to a file. To check if export failed because the label couldn't be applied, click the report or dashboard name at the center of the title bar and see whether it says "Sensitivity label can't be loaded" in the info dropdown that opens. This can happen as the result of a temporary system issue, or if the applied label has been unpublished or deleted by the security admin.

## Sensitivity label inheritance in Analyze in Excel

When you create a PivotTable in Excel with a live connection to a Power BI dataset (you can do this either from Power BI through [Analyze In Excel](../collaborate-share/service-analyze-in-excel.md) or from [Excel](https://support.microsoft.com/office/create-a-pivottable-from-power-bi-datasets-31444a04-9c38-4dd7-9a45-22848c666884?ui=en-US&rs=en-US&ad=US)), the dataset's sensitivity label is inherited and applied to your Excel file, along with any associated protection. If the label on the dataset later changes to a more restrictive one, the label applied on the linked Excel file will automatically update upon data refresh.

![Screenshot of Excel showing sensitivity label inherited from dataset via live connection.](media/service-security-sensitivity-label-overview/live-connection-inheritance.png)
 
Sensitivity labels in Excel that were manually set are not automatically overwritten by the dataset's sensitivity label. Rather, a banner notifies you that the dataset has a sensitivity label and recommends that you apply it.

>[!NOTE]
>If the dataset's sensitivity label is less restrictive than the Excel file's sensitivity label, no label inheritance or update takes place. An Excel file never inherits a less restrictive sensitivity label.


## Sensitivity label persistence in embedded reports and dashboards

You can embed Power BI reports, dashboards, and visuals in business applications such as Microsoft Teams and SharePoint, or in an organization’s website. When you embed a visual, report or dashboard that has a sensitivity label applied to it, the sensitivity label will be visible in the embedded view, and the label and its protection will persist when data is exported to Excel.

![Screen shot of report embedded in SharePoint Online](media/service-security-sensitivity-label-overview/embedded-report-sensitivity-label.png)

The following embedding scenarios are supported:
* [Embed for your organization](../developer/embedded/embed-sample-for-your-organization.md)
* Microsoft 365 apps (for example, [Teams](../collaborate-share/service-embed-report-microsoft-teams.md) and [SharePoint](../collaborate-share/service-embed-report-spo.md))
* [Secure URL embedding](../collaborate-share/service-embed-secure.md) (embedding from the Power BI service) 

## Sensitivity labels in the Power BI mobile apps

Sensitivity labels can be viewed on reports and dashboards in the Power BI mobile apps. An icon near the name of the report or dashboard indicates that it has a sensitivity label, and the type of label and its description can be found in the report or dashboard's info box.

![Screen shot of sensitivity label in mobile app](media/service-security-sensitivity-label-overview/mobile-app-sensitivity-label2.png)

## Supported clouds
Sensitivity labels are only supported for tenants in global (public) clouds; they are not supported for tenants in clouds such as national clouds.

## Licensing and requirements

See [Licensing and requirements](service-security-enable-data-sensitivity-labels.md#licensing-and-requirements).

## Sensitivity label creation and management

Sensitivity labels are created and managed in either the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/).

To access sensitivity labels in either of these centers, navigate to **Classification > Sensitivity labels**. These sensitivity labels can be used by multiple Microsoft services such Azure Information Protection, Office apps, and Office 365 services.

>[!Important]
> If your organization uses Azure Information Protection sensitivity labels, you need to [migrate](/azure/information-protection/configure-policy-migrate-labels) them to one of the previously listed services in order for the labels to be used in Power BI.

## Limitations

The following list provides some limitations of sensitivity labels in Power BI:

* Sensitivity labels can be applied only on dashboards, reports, datasets, and dataflows. They are not currently available for [paginated reports](../paginated-reports/report-builder-power-bi.md) and workbooks.
* Sensitivity labels on Power BI assets are visible in the workspace list, lineage, favorites, recents, and apps views; labels are not currently visible in the "shared with me" view. Note, however, that a label applied to a Power BI asset, even if not visible, will always persist on data exported to Excel, PowerPoint, and PDF files.
* Data sensitivity labels are not supported for template apps. Sensitivity labels set by the template app creator are removed when the app is extracted and installed, and sensitivity labels added to artifacts in an installed template app by the app consumer are lost (reset to nothing) when the app is updated.
* Power BI does not support sensitivity labels of the [Do Not Forward](/microsoft-365/compliance/encryption-sensitivity-labels#let-users-assign-permissions), [user-defined](/microsoft-365/compliance/encryption-sensitivity-labels#let-users-assign-permissions), and [HYOK](/azure/information-protection/configure-adrms-restrictions) protection types. The Do Not Forward and user-defined protection types refer to labels defined in the [Microsoft 365 security center](https://security.microsoft.com/) or the [Microsoft 365 compliance center](https://compliance.microsoft.com/).
* It is not recommended to allow users to apply parent labels within Power BI (a label is considered to be a parent label only if it has sublabels). If a parent label is applied to content, exporting data from that content to a file (Excel, PowerPoint, and PDF) will fail. See [Sublabels (grouping labels)](/microsoft-365/compliance/sensitivity-labels#sublabels-grouping-labels).

## Next steps

This article provided an overview of data protection in Power BI. The following articles provide more details about data protection in Power BI. 

* [Enable sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md)
* [How to apply sensitivity labels in Power BI](service-security-apply-data-sensitivity-labels.md)
* [Using Microsoft Cloud App Security controls in Power BI](service-security-using-microsoft-cloud-app-security-controls.md)
* [Protection metrics report](service-security-data-protection-metrics-report.md)