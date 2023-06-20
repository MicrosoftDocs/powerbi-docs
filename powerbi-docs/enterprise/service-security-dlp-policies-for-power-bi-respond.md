---
title: Respond to a DLP policy violation in Power BI
description: Learn how to respond to a DLP policy violation in Power BI.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 04/20/2023
LocalizationGroup: Data from files
---

# Respond to a DLP policy violation in Power BI

When a dataset you own violates a DLP policy, you may see a violation warning icon on the dataset in the data hub or workspace list view. If you go to the dataset details page, you'll see a DLP policy tip banner that informs you about the violation. To view and respond to the policy violation, select the **View** button on the policy tip. The **View** button opens a side pain that displays the details of your dataset's DLP policy violations and provides option for responding to them. This article describes the information you see on the side pane and the actions you can take regarding the violations.

## View a dataset's DLP violations

The data loss prevention side pane lists the name of the dataset and all the DLP policy issues detected by a content scan of that dataset. You can select the dataset's name if you want to view the dataset's details page.

Each DLP policy issue is shown on a card. The card shows you the policy tip, indicates what kind of sensitive data was detected, and offers actions you can take if you believe the data was falsely identified.

![Screenshot of D L P policies side pane](./media/service-security-dlp-policies-for-power-b-respond/power-bi-dlp-override-pane.png)

## Take action on the violation

The action or combination of actions you see may vary depending on the policy configuration. The possible actions are described below.

* **Report an issue**: Report the issue as a false positive (that is, report that the policy has mistakenly identified non-sensitive data as sensitive).
* **Override**: Override the policy. Overriding a policy means that this policy will no longer check this dataset for sensitive data. Depending on the policy configuration, you may be required to provide a justification for the override.
* **Report and override**: Report the issue as a false positive and override the policy.

>[!NOTE]
> Any action you take will be recorded in the audit log where it can be reviewed by security admins.
>
> The purpose of the policy tip is to flag sensitive information found in your dataset. If you own this data and determine that it shouldn't be in the dataset, when you remove the data from the dataset and then refresh or republish the dataset, the policy will be triggered again and the policy tip will be removed, since the sensitive data will no longer be found.

## Next steps

* [Data loss prevention policies for Power BI](./service-security-dlp-policies-for-power-bi-overview.md).
* [Configure a DLP policy for Power BI](./service-security-dlp-policies-for-power-bi-configure.md).
* [Power BI implementation planning: Data loss prevention for Power BI](/power-bi/guidance/powerbi-implementation-planning-data-loss-prevention)
* [Learn about data loss prevention](/microsoft-365/compliance/dlp-learn-about-dlp)