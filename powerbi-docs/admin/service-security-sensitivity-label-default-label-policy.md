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
ms.date: 08/09/2021
LocalizationGroup: Data from files
---
# Default label policy for Power BI (preview)

To help ensure comprehensive protection and governance of sensitive data, organizations can create default label policies for Power BI that automatically apply default sensitivity labels to unlabeled content.

This article describes how to enable a default label policy, both in the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection) and by using the [Security & Compliance Center PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

>[!NOTE]
> Currently, default label policies for Power BI are supported only in Power BI Desktop. Default labels will not be applied to unlabeled content in the Power BI service.
>
> The default label policy settings for Power BI are independent of the default label policy settings for files and email.

## What happens when a default label policy is in effect?

If a default label policy is in effect, when a user to whom the policy applies opens in Power BI Desktop a new *.pbix* file or an existing unlabeled *.pbix* file, the default label will be applied to the file. If the user is offline, the label will be applied when the user signs-in.

## Enabling a default label policy for Power BI

A Microsoft 365 administrator can enable a default label policy for Power BI by selecting the desired label in the **Apply this label by default to Power BI** drop-down menu in the policy settings for Power BI in the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection). See [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

:::image type="" source="media/service-security-sensitivity-label-default-label-policy/default-labels-config-in-compliance-center.png" alt-text="Screenshot of default label setting in the Microsoft compliance center.":::

For existing policies, it is also possible to enable default label policies for Power BI using the [Security & Compliance Center PowerShell setLabelPolicy API](/powershell/module/exchange/set-labelpolicy).

```powershell
Set-LabelPolicy -Identity "<default label policy name>" -AdvancedSettings @{powerbidefaultlabelid="<LabelId>"}
```
Where:

* default label policy name = the name of the policy whose associated sensitivity label you want to be applied by default to unlabeled content in Power BI.

>[!IMPORTANT]
>A default label policy will apply for a user if and only if it is the user's highest priority policy.

**Requirements for using PowerShell**
 
* You need the EXO V2 module to run this command. For more information, see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exo-v2-module)
* A connection to the Microsoft 365 compliance center is also required. For more information, see [Connect to Security & Compliance Center PowerShell using the EXO V2 module](/powershell/exchange/connect-to-scc-powershell)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

## Considerations and limitations
* Default label policies are not currently supported in the Power BI service.
* Default labeling in Power BI is in preview, so there may be flows that allow users to open or create an unlabeled .pbix file.
* Default label policy settings for Power BI are independent of the default label policy settings for files and email.
* Default label policies in Power BI are not supported for [external guest users (B2B users)](service-admin-azure-ad-b2b.md). When a B2B user opens or creates an unlabeled file in Power BI Desktop, no default label will be applied to the file automatically.

## Next steps

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)