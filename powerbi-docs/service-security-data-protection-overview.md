---
title: Data protection in Power BI
description: Learn how data protection works in Power BI
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/24/2019
ms.author: davidi

LocalizationGroup: Data from files
---
# Data protection in Power BI (preview)

Power BI integrates the capabilities of Microsoft Information Protection and Microsoft Cloud App Security to provide greater control and visibility over sensitive data in Power BI. These capabilities enable Power BI professionals and administrators to:

* Classify and apply data sensitivity labels to Power BI dashboards, reports, datasets, and dataflows in the Power BI service.
* Set label-specific permissions on data exported from Power BI to Excel, PowerPoint, and PDF files. 
* Monitor user access and activity, protect data based on real-time risk analysis, and set label-specific controls. 
* Provide oversight to administrators concerning sensitive data use in Power BI.

Microsoft Information Protection is the unified solution for Microsoft's classification, labeling, and protection services. It provides unified administration across Office 365, Azure Information Protection, Windows Information Protection, and other Microsoft services. Microsoft Information Protection ensures that the labels and protection applied to information across the suite of Microsoft services are consistent. This consistency makes it possible for applications and services that support Microsoft Information Protection to read and write labels in a common, predictable manner.

Microsoft Cloud App Security is a Cloud Access Security Broker (CASB) that provides rich visibility and control over data travel, as well as sophisticated analytics to identify and combat cyberthreats across cloud services. With Microsoft Cloud App Security, you set real-time conditional access controls and conditions to data in your organization, using settings in Azure Active Directory (AAD), that help to ensure that your Power BI analytics are protected. Power BI administrators can then monitor user access and activity, perform real-time risk analysis, and set label-specific policies.

Bringing the advantage of Microsoft Information Protection data protection and Microsoft Cloud App Security into Power BI involves three steps.

1. Enabling the Microsoft Information Protection data labels in Power BI: In this step, a Power BI administrator enables Microsoft Information Protection sensitivity-label capabilities and specifies which users and security groups can apply these labels to Power BI dashboards, reports, datasets, and dataflows.

2.    Classifying data and applying the sensitivity labels: In this step Power BI professionals (dashboard, report, dataset, and dataflow creators and contributors) classify Power BI data and apply sensitivity labels to it. These labels are then visible to everyone in the organization. Sensitivity labels promote data protection by providing awareness of data classification, as well as guidance about how to deal with the classified data. In addition, sensitivity labels make it possible for the data to be monitored and processed by whatever data protection policies might be in force.

3. Creating Microsoft Cloud App Security policies that are relevant for Power BI.

Data sensitivity labels protect your data when you export it to Excel, PowerPoint and PDF files. When you export data to one of these file types, the resulting file will inherit a data sensitivity label according to the following logic: [Awaiting clarification about the exact logic]

See the [overview of sensitivity labels article](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels) for more information about sensitivity labels.

## Using data protection in Power BI

Power BI reads labels and policies from the unified labeling store managed in Office 365 Security & Compliance Center. If your organization uses Azure Information Protection sensitivity labels, you need to migrate them to Microsoft Information Protection before enabling Microsoft Information Protection data protection in Power BI. In addition, at least one label must have been published. For instructions and detail, see the following articles:

* [How to migrate Azure Information Protection labels to unified sensitivity labels](https://docs.microsoft.com/azure/information-protection/configure-policy-migrate-labels).
* [Azure Information Protection documentation](https://docs.microsoft.com/azure/information-protection/configure-policy-migrate-labels).

## Next Steps

This article provided an overview of data protection in Power BI. The following articles provide more details about data protection in Power BI. 

* [Enable data sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md)
* [Apply data sensitivity labels in Power BI](service-security-apply-data-sensitivity-labels.md)
* [Using Microsoft Cloud App Security controls in Power BI](service-security-using-microsoft-cloud-app-security-controls.md)