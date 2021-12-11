---
title: Default label policy in Power BI
description: Learn how organizations can apply a default sensitivity label on their unlabeled Power BI content
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
# Default label policy for Power BI

To help ensure comprehensive protection and governance of sensitive data, organizations can create default label policies for Power BI that automatically apply default sensitivity labels to unlabeled content.

This article describes how to enable a default label policy, both in the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection) and by using the [Security & Compliance Center PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

>[!NOTE]
> The default label policy settings for Power BI are independent of the default label policy settings for files and email.

## What happens when a default label policy is in effect?

* In Power BI Desktop, when a user to whom the policy applies opens a new *.pbix* file or an existing unlabeled *.pbix* file, the default label will be applied to the file. If the user is working offline, the label will be applied when the user signs in.
* In the Power BI service, when a user to whom the policy applies creates a new dataset, report, dashboard, dataflow or scorecard, the default label will be applied to that item.

## Enabling a default label policy for Power BI

A Microsoft 365 administrator can enable a default label policy for Power BI by selecting the desired label in the **Apply this label by default to Power BI** drop-down menu in the policy settings for Power BI in the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection). See [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

:::image type="" source="media/service-security-sensitivity-label-default-label-policy/default-labels-config-in-compliance-center.png" alt-text="Screenshot of default label setting in the Microsoft compliance center.":::

For existing policies, it is also possible to enable default label policies for Power BI using the [Security & Compliance Center PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

```powershell
Set-LabelPolicy -Identity "<default label policy name>" -AdvancedSettings @{powerbidefaultlabelid="<LabelId>"}
```
Where:

* &lt;default label policy name&gt; = the name of the policy whose associated sensitivity label you want to be applied by default to unlabeled content in Power BI.

>[!IMPORTANT]
>If a user has more than one label policy, the default label setting is always taken from the policy with the highest priority, so be sure to configure the default label on that policy.

**Requirements for using PowerShell**
 
* You need the EXO V2 module to run this command. For more information, see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exo-v2-module)
* A connection to the Microsoft 365 compliance center is also required. For more information, see [Connect to Security & Compliance Center PowerShell using the EXO V2 module](/powershell/exchange/connect-to-scc-powershell)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

## Considerations and limitations
* Default labeling in Power BI covers most common scenarios, but there may be some less common flows that still allow users to open or create unlabeled *.pbix* files or Power BI artifacts.
* Default label policy settings for Power BI are independent of the default label policy settings for files and email.
* Default labeling in Power BI is not supported for service principals and APIs. Service principals and APIs are not subject to default label policies.
* Default label policies in Power BI are not supported for [external guest users (B2B users)](service-admin-azure-ad-b2b.md). When a B2B user opens or creates an unlabeled *.pbix* file in Power BI Desktop or Power BI artifact in the Power Bi service, no default label will applied automatically.

## Next steps

* [Mandatory label policy for Power BI](service-security-sensitivity-label-mandatory-label-policy.md)
* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)
* [Audit schema for sensitivity labels in Power BI](service-security-sensitivity-label-audit-schema.md)