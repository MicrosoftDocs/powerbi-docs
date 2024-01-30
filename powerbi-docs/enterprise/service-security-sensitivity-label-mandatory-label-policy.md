---
title: Mandatory label policy in Power BI
description: Learn how organizations can require users to apply sensitivity labels with a mandatory label policy in Power BI.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 11/16/2023
LocalizationGroup: Data from files
---
# Mandatory label policy for Power BI

To help ensure comprehensive protection and governance of sensitive data, you can require your organization's Power BI users to apply sensitivity labels to content they create or edit in Power BI. You do this by enabling, in their sensitivity label policies, a special setting for mandatory labeling in Power BI. This article describes the user actions that are affected by a mandatory labeling policy, and explains how to enable a mandatory labeling policy for Power BI.

>[!NOTE]
> The mandatory label policy setting for Power BI is independent of the mandatory label policy setting for files and email.
>
> Mandatory labeling in Power BI isn't supported for service principals and APIs. Service principals and APIs aren't subject to mandatory label policies.

## What happens when a mandatory label policy is in effect?

**In the Power BI service**:

* Users must apply a sensitivity label before they can save new reports, dashboards, or semantic models.
* Users must apply a sensitivity label before they can save changes to the settings or content of existing, unlabeled reports and dashboards.
* If users try to import data from an unlabeled *.pbix* file, a prompt requires them to select a label before the import can continue. The label they select is applied to the resulting semantic model and report in the service. **It is not applied to the *.pbix* file itself**.

**In Power BI Desktop**:

* Users must apply sensitivity labels to unlabeled *.pbix* files before they can save or publish to the service.

## Enabling a mandatory label policy for Power BI

A Microsoft 365 administrator can enable a mandatory label policy for Power BI by selecting the **Require users to apply a label to their Power BI content** checkbox in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/informationprotection). For more information, see [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

:::image type="content" source="media/service-security-sensitivity-label-mandatory-label-policy/mandatory-labels-config-in-compliance-center.png" alt-text="Screenshot of mandatory label setting in the Microsoft Purview compliance portal.":::

If you have an existing policy, and you want to enable mandatory labeling in Power BI, you can use the [Security & Compliance PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

```powershell
Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbimandatory="true"}
```

Where:
* `<policy name>` is the name of the policy where you want to set labeling in Power BI as mandatory.

**Requirements for using PowerShell**

* You need the Exchange Online PowerShell (EXO) module to run this command. For more information, see [About the Exchange Online PowerShell module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exchange-online-powershell-module).
* A connection to the Purview compliance portal is also required. For more information, see [Connect to Security & Compliance PowerShell using the EXO module](/powershell/exchange/connect-to-scc-powershell).

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

## Considerations and limitations
* Mandatory labeling in Power BI covers most common scenarios, but there may be some less common flows that still allow a user to create or edit unlabeled content.
* Mandatory labeling in Power BI doesn't apply when a semantic model is created by uploading an Excel or .csv file. When a user creates a semantic model by uploading an Excel file or a .csv file, they aren't required to apply a sensitivity label, and the semantic model can be created unlabeled. However, the next time it's modified and saved, the user will be required to supply a label.
* The mandatory label policy setting for Power BI is independent of the mandatory label policy setting for files and email.
* Mandatory labeling in Power BI isn't supported for service principals and APIs. Service principals and APIs aren't subject to mandatory label policies.
* Mandatory labeling in Power BI isn't supported for [external guest users (B2B users)](service-admin-azure-ad-b2b.md). B2B users aren't subject to mandatory label policies.

## Related content

* [Default label policy for Power BI](service-security-sensitivity-label-default-label-policy.md)
* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)
* [Audit schema for sensitivity labels in Power BI](service-security-sensitivity-label-audit-schema.md)
