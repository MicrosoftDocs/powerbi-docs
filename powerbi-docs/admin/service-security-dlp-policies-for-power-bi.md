---
title: Data loss prevention policies for Power BI
description: Learn how to configure data loss prevention policies for Power BI.
author: paulinbar
ms.author: painbar
manager: kfolis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 12/12/2021
LocalizationGroup: Data from files
---

# Data loss prevention policies for Power BI

To help organizations detect and protect their sensitive data, Power BI supports [Microsoft 365 data loss prevention (DLP) polices](/microsoft-365/compliance/dlp-learn-about-dlp). When a DLP policy for Power BI detects a sensitive dataset, a policy tip can be attached to the dataset in the Power BI service that explains the nature of the sensitive content, and an alert can be registered in the data loss prevention **Alerts** tab in the Microsoft compliance portal for monitoring and management by administrators. In addition, email alerts can be sent to administrators and specified users.

## Considerations and limitations

* DLP policies for Power BI are defined in the Microsoft 365 compliance portal.
* DLP policies apply to workspaces. Only workspaces hosted in Premium Gen2 capacities with [autoscaling](service-premium-auto-scale.md) enabled are supported.
* Both classic and new experience workspaces are supported, provided that they are hosted in Premium Gen2 capacities with [autoscaling](service-premium-auto-scale.md) enabled.
* DLP policy templates are not yet supported for Power BI DLP policies. When creating a DLP policy for Power BI, choose the "custom policy" option.
* Currently, "sensitivity label" is the only supported condition type for Power BI DLP policy rules. 
* DLP policies for Power BI are not supported for sample datasets, streaming datasets(../connect-data/service-real-time-streaming.md), or datasets that connect to their data source via [DirectQuery](../connect-data/desktop-use-directquery.md) or [live connection](../connect-data/desktop-directquery-about.md#live-connections). 

## How do DLP policies for Power BI work

You define a DLP policy in the data loss prevention section of the compliance portal. In the policy, you specify sensitivity label(s) you want to detect. You also specify the action(s) that will happen when the policy detects a dataset that has a specified sensitivity label applied. DLP policies for Power BI support two actions:

* User notification via policy tips.
* Alerts. Alerts can be sent by email to administrators and users. Additionally, administrators can monitor and manage alerts on the **Alerts** tab in the compliance center. 

When a dataset is evaluated by DLP policies, if it matches the conditions specified in a DLP policy, the actions specified in the policy occur. A dataset is evaluated against DLP policies whenever one of the following events occurs:
* Publish
* Republish
* On-demand refresh
* Scheduled refresh
    
    >[!NOTE]> DLP evaluation of the dataset does not occur in either of the following cases:
    > * The initiator of the event is a service principal.
    > * The dataset owner is either a service principal or a B2B user.

## What happens when a dataset is flagged by a Power BI DLP policy

When a DLP policy detects an issue with a dataset:
* If "user notification" is enabled in the policy, the dataset will be marked in the Power BI service with a shield that indicates that a DLP policy has detected an issue with the dataset.

    ![Screenshot of policy tip badge on dataset in lists.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-policy-tip-on-dataset.png)

    Open the dataset details page to see a policy tip that explains the policy violation and how the detected type of sensitive information should be handled.

    ![Screenshot of policy tip on dataset details page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-policy-tip-in-dataset-details.png)

    >[!NOTE]
    > If you hide the policy tip, it doesn’t get deleted. It will appear the next time you visit the page.

* If alerts are enabled in the policy, an alert will be recorded on the data loss prevention **Alerts** tab in the compliance center, and (if configured) an email will be sent to administrators and/or specified users. The following image shows the Alerts tab in the data loss prevention section of the compliance center.

    ![Screenshot of Alerts tab in the compliance center.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-alerts-tab.png)

## Next steps

* [Mandatory label policy for Power BI](service-security-sensitivity-label-mandatory-label-policy.md)
* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)
* [Audit schema for sensitivity labels in Power BI](service-security-sensitivity-label-audit-schema.md)