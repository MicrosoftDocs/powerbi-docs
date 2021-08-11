---
title: Sensitivity label support for paginated reports
description: Learn using Microsoft Information Protection sensitivity labels with paginated reports.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 08/10/2021
LocalizationGroup: Data from files
---
# Sensitivity label support for paginated reports (preview)

Sensitivity labels can be applied to paginated reports hosted in the Power BI service. After uploading a paginated report to the service, you apply the label to the report just as you would to a [regular Power BI report](service-security-apply-data-sensitivity-labels.md#apply-sensitivity-labels-in-the-power-bi-service).

When you export data from a labeled paginated report to a supported file type (Excel, PDF, PPTX, and Word), the sensitivity label on the paginated report is applied to the exported file.

Sensitivity labels on paginated reports are included in protection metrics (as part of the Report count), and can be audited (label-change audits only) and modified by public APIs, just like labels on regular Power BI reports.

## Limitations

Sensitivity label support is now in public preview, and the following limitations apply:

* Sensitivity labels are not supported for paginated reports in deployment pipelines. A sensitivity label on a paginated report in a deployment pipeline will not be deployed to subsequent pipeline stages.
* [Downstream inheritance](service-security-sensitivity-label-downstream-inheritance.md) is not supported. The label of an upstream model will not propagate down to its downstream paginated reports. Likewise, the label of a paginated report will not propagate down to the report’s downstream content.
* [Mandatory labeling](service-security-sensitivity-label-mandatory-label-policy.md) will not apply to paginated reports.

## Paginated Report visuals (preview)

A Paginated Report visual is a special type of visual that you can include in a regular Power BI report. It renders a selected paginated report inside the regular Power BI report.

When a supported file type is exported from a Paginated Report visual that is included in a Power BI report, and the original paginated report being rendered in the visual has a sensitivity label, the exported file inherits the sensitivity label of the original paginated report. If the original paginated report does not have a label, the exported file inherits the label of the Power BI report, if it has one.

## Next steps
* [Apply sensitivity labels in Power BI](service-security-apply-data-sensitivity-labels.md)
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)