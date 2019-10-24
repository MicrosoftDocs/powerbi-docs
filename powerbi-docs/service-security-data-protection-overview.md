---
title: Data protection in Power BI
description: Learn how data protection works in Power BI
author: paulinbar
manager: rkarlin
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/25/2019
ms.author: painbar

LocalizationGroup: Data from files
---
# Data protection in Power BI (preview)

Modern enterprises have strict business regulations and requirements about how to handle and protect their sensitive data. Power BI can integrate with Microsoft Information Protection and Microsoft Cloud App Security to provide greater control and visibility over sensitive data in Power BI. 

With Data protection for Power BI, you can do the following:

* Use Microsoft’s sensitivity labels to classify and label content in the Power BI service (dashboards, reports, dataset and dataflows), using the same taxonomy used to classify and protect files in O365. 

* Enforce protection settings such as encryption or watermarks when export data from the Power BI service to files by applying content’s sensitivity label and protection (Excel, PowerPoint and PDF). 

  For example, your users can apply a Confidential label to report in Power BI, when data is exported to an Excel file, Power BI will apply the Confidential label on this file, that label can encrypt the content and apply a Confidential watermark.

* Use Microsoft Cloud App Security to monitor activities in Power BI, investigate security issues, and protect content in Power BI with Microsoft Cloud App Security Conditional Access App Control. 

## Sensitivity labels in Power BI

Sensitivity labels are created and managed in one of the following services:

* Microsoft 365 Compliance Center
* Microsoft 365 Security Center
* Office 365 Security & Compliance Center

To access sensitivity labels in any of these services, you navigate to  **Classification > Sensitivity labels**. These sensitivity labels can be used by multiple Microsoft services such Azure Information Protection, Office apps, and Office 365 services.

> [!IMPORTANT]
> Azure Information Protection customers will need to migrate the labels to one of the previously listed services in order for sensitivity labels to be used in Power BI. In addition, sensitivity labels are only supported in public clouds, and are not supported for tenants in clouds, such as sovereign clouds.

## How sensitivity labels work

When you apply a sensitivity label to a Power BI dashboard, report, dataset or dataflow, it’s similar to applying a *tag* to that resource, that has the following benefits:
* **Customizable** - you can create categories for different levels of sensitive content in your organization, such as Personal, Public, General, Confidential, and Highly Confidential.
* **Clear text** - since the label is in clear text, it’s available for users to treat the content according to sensitivity label guidelines.
* **Persistent** - after a sensitivity label is applied to content, it persists when that content is exported in the following supported file types: Excel, PowerPoint and PDF. 

  This means the sensitivity label follows the content, including its protection settings, and becomes the basis for applying and enforcing policies. 

## Sensitivity label example 

Here's a quick example of how a sensitivity label in Power BI can work.

1. In the Power BI service, a **Highly Confidential - Internal Only** sensitivity label is applied to a report.

   ![Sensitivity labels in list view](media/service-security-data-protection-overview/sensitivity-labels-overview-01.png)

2. When data is exported to an Excel file from this report, the sensitivity label and protection are applied to the exported Excel file.

   ![Sensitivity label follows the content](media/service-security-data-protection-overview/sensitivity-labels-overview-02.png)

In Microsoft Office applications, a sensitivity label appears as a tag on an email or document, similar to the previous image.

You can also assign a classification to content (like a sticker) that persists and roams with the content as it's used and shared. You can use this classification to generate usage reports and see activity data for your sensitive content. Based on this information, you can always choose later to apply protection settings.


## Using sensitivity labels in Power BI

Before your sensitivity labels can be enabled in Power BI, you must first complete the following prerequisites: 

* Make sure you've created sensitivity labels in Microsoft 365 Security and Compliance center. 
* You have enabled Sensitivity labels (Preview) in Power BI.
* Make sure users have the appropriate license
    * To set labels in Power BI user must have a Power BI pro license and AIP or Office license that support AIP (APPI1, APP2, OFFICE E3/ E5, M365 E3/ E5 or EMS E3/ E5)
    * To view labels in Power BI users must have an AIP or Office license that support AIP. 


## Protect content using Microsoft Cloud App Security

You can protect content in Power BI against unintended leaks or breaches by using Microsoft Cloud App Security. Once Microsoft Cloud App Security is set and configured, security administrators can monitor user access and activity, perform real-time risk analysis, and set label-specific controls.

For example, organizations can use Microsoft Cloud App Security to configure a policy that prevents users from downloading sensitive data from Power BI to unmanaged devices. Such a configuration allows users to remain productive and connect to Power BI from anywhere, while using Microsoft Cloud App Security to prevent compromising user actions, all in real-time. 

### Requirements

Before your sensitivity labels can use Microsoft Cloud App Security, the following prerequisites must be met: 

* Enable Cloud App Security and Azure Information Protection for your tenant.
* Connect the app to Microsoft Cloud App Security.

## Considerations and limitations

The following list provides some limitations of sensitivity labels in Power BI:

* Sensitivity labels are supported for dashboards, reports, datasets and dataflows
* Sensitivity labels applied in workspace will be applied on Excel, PowerPoint and PDF files when data is exported from workspace or from app view. 
* Sensitivity labels currently are not available for SSRS reports and workbooks.  
* There is currently no option to delete label from an artifact after the label was set.
* Sensitivity labels are visible only in workspace list view, and currently are not visible in favorites, shared with me, recants, app views.
* The sensitivity label *File Encryption policy* configured in Microsoft Security and Compliance center applies only to files *exported from* Power BI, and it is not enforced *within* Power BI.


## Next steps

This article provided an overview of data protection in Power BI. The following articles provide more details about data protection in Power BI. 

* [Enable data sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md)
* [Apply data sensitivity labels in Power BI](service-security-apply-data-sensitivity-labels.md)
* [Using Microsoft Cloud App Security controls in Power BI](service-security-using-microsoft-cloud-app-security-controls.md)