---
title: "Accessibility in Power BI paginated reports | Microsoft Docs"
description:  Learn how to create paginated reports with accessibility in mind to make it usable by as many individuals as possible, including individuals with visual or physical impairments.
ms.date: 05/12/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: conceptual
author: kfollis
ms.author: kfollis
ms.reviewer: cookiemccray
---
# Accessibility in Power BI paginated reports (Power BI Report Builder)

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

You can create paginated reports for people of all abilities. Creating a paginated report with accessibility in mind makes it usable by as many individuals as possible, including individuals with visual or physical impairments. Users can consume these reports with the use of screen readers or keyboard navigation.

:::image type="content" source="media/paginated-accessibility-overview/high-contrast-paginated-report.png" alt-text="Screenshot of viewing a paginated report in high-contrast mode.":::

Power BI Report Builder has many accessibility features to enable report creators create an accessible user experience. These features are in line with Microsoft’s commitment to making its products and services easier for everyone to use. Using these features in creating reports not only gives everyone equal access to your report but also improves everyone’s experience. The report becomes accessible to the users on the web or as an accessible PDF when exported using the **Accessible PDF** export option.

## Accessibility articles

This article provides an overview of accessibility and paginated reports. These other articles provide details on the accessibility features, and how to create and consume accessible paginated reports.

- [Use accessibility tools to create accessible paginated reports(Power BI Report Builder)](paginated-use-accessibility-tools.md)
- [Accessibility features in paginated reports (Power BI Report Builder)](paginated-create-accessible-reports.md)
- [Use accessibility tools to interact with paginated reports (Power BI Report Builder)](paginated-consume-accessible-reports.md)
- [Detailed list of keyboard shortcuts for paginated reports](/sql/reporting-services/report-builder/keyboard-shortcuts-report-builder)


## Accessibility standards

To accommodate a variety of users and adhere to accessibility guidelines and regulations, you can create paginated reports that conform to the following accessibility standards.
 
### WCAG 2.1 

Web Content Accessibility Guidelines (WCAG) are guidelines for making web content accessible to people with disabilities. These four principles are the WCAG guidelines:

- **Perceivable**: Information and user interface components must be presentable to users in ways they can perceive.  

    Keeping your paginated reports simple, using contrasting colors and avoiding information overload. 

- **Operable**: User interface components and navigation must be operable. 

    Paginated reports are operable using keyboard navigation. 

- **Understandable**: Information and the operation of user interface must be understandable.  

    Providing clear text alternatives or descriptions where they're necessary.  

- **Robust**: Content can be interpreted by a wide range of user agents including assistive technologies.  

    Paginated reports support the use of screen readers. 

### US Accessibility Conformance

US Accessibility Conformance requires governments and federal agencies to make their electronic and information technology accessible to people with disabilities. 

### EN 301 549 

EN 301 549 is the Harmonized European Standard for Accessibility requirements for Information and Communication Technology (ICT) products and services. 

### ISO 14289-1 (PDF/UA) 

ISO 14289-1 is the ISO standard for Universal Accessibility requirements for universally accessible PDF documents. For more info about this, see [PDF Rendering Extension conformance to ISO 14289-1 - paginated reports](../../report-server/rendering-extension-support.md).

## Conformance documentation 

To find updated conformance reports, search for Server Reporting Services in the [Microsoft Accessibility Conformance Portal](https://www.microsoft.com/accessibility/conformance-reports).

## Related content  

- [Use accessibility tools to create accessible paginated reports(Power BI Report Builder)](paginated-use-accessibility-tools.md)
- [Accessibility features in paginated reports (Power BI Report Builder)](paginated-create-accessible-reports.md)
- [Use accessibility tools to interact with paginated reports (Power BI Report Builder)](paginated-consume-accessible-reports.md)
