---
title: Default label policy in Power BI
description: Learn how you can ensure comprehensive protection and governance of sensitive data in your organization by enabling a default label policy with Power BI.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 11/18/2022
LocalizationGroup: Data from files
---
# Default label policy for Power BI

To help ensure comprehensive protection and governance of sensitive data, organizations can create default label policies for Power BI that automatically apply default sensitivity labels to unlabeled content.

This article describes how to enable a default label policy, both in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/informationprotection) and by using the [Security & Compliance PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

>[!NOTE]
> The default label policy settings for Power BI are independent of the default label policy settings for files and email.

## What happens when a default label policy is in effect?

* In Power BI Desktop, when a user to whom the policy applies opens a new *.pbix* file or an existing unlabeled *.pbix* file, the default label will be applied to the file. If the user is working offline, the label is applied when the user signs in.
* In the Power BI service, when a user to whom the policy applies creates a new semantic model, report, dashboard, dataflow or scorecard, the default label will be applied to that item.

## Enabling a default label policy for Power BI

A Microsoft 365 administrator can enable a default label policy for Power BI by selecting the desired label in the **Apply this default label to Power BI content** dropdown menu in the policy settings for Power BI in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/informationprotection). For more information, see [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

:::image type="content" source="media/service-security-sensitivity-label-default-label-policy/default-labels-config-in-compliance-center.png" alt-text="Screenshot of the default label setting in the Microsoft compliance portal.":::

For existing policies, it's also possible to enable default label policies for Power BI using the [Security & Compliance PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

```powershell
Set-LabelPolicy -Identity "<default label policy name>" -AdvancedSettings @{powerbidefaultlabelid="<LabelId>"}
```

Where:

* `<default label policy name>` is the name of the policy whose associated sensitivity label you want to be applied by default to unlabeled content in Power BI.

>[!IMPORTANT]
>If a user has more than one label policy, the default label setting is always taken from the policy with the highest priority, make sure to configure the default label on that policy.

**Requirements for using PowerShell**

* The Exchange Online PowerShell V2 (EXO V2) module. For more information, see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exo-v2-module)
* A connection to the Microsoft Purview compliance portal. For more information, see [Connect to Security & Compliance PowerShell](/powershell/exchange/connect-to-scc-powershell)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

## Considerations and limitations

* Default labeling in Power BI covers most common scenarios, but there may be some less common flows that still allow users to open or create unlabeled *.pbix* files or Power BI artifacts.
* Default label policy settings for Power BI are independent of the default label policy settings for files and email.
* Default labeling in Power BI isn't supported for service principals and APIs. Service principals and APIs aren't subject to default label policies.
* Default label policies in Power BI aren't supported for [external guest users (Microsoft Entra B2B)](service-admin-azure-ad-b2b.md). When a B2B user opens or creates an unlabeled *.pbix* file in Power BI Desktop or Power BI artifact in the Power BI service, no default label is applied automatically.

## Related content

* [Mandatory label policy for Power BI](service-security-sensitivity-label-mandatory-label-policy.md)
* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)
* [Audit schema for sensitivity labels in Power BI](service-security-sensitivity-label-audit-schema.md)
