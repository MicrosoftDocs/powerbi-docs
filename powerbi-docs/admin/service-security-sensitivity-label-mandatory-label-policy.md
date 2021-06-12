---
title: Mandatory label policy
description: Learn how organizations can require users to apply sensitivity labels with a mandatory label policy
author: paulinbar
ms.author: painbar
manager: kfolis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 06/12/2021
LocalizationGroup: Data from files
---
# Mandatory label policy

To help ensure comprehensive protection and governance of sensitive data, organizations can enable a policy that requires users to apply labels to their sensitive Power BI content. Such a policy is called a mandatory label policy.

When a mandatory label policy is in effect, 
* Users must apply a sensitivity label before saving new reports, dashboards, or datasets in the service. If they try to save a new item without applying a label, a dialog prompts them to choose a label before allowing them to save.
* Users must apply a sensitivity label before saving updates to the settings or content of existing unlabeled reports and dashboards. If they try to save the updates without applying a label, a dialog prompts them to apply a label before allowing them to save.
* If users try to import data from an unlabeled PBIX file, a dialog prompts them to apply a label before allowing import to continue.
* Users can't publish an unlabeled PBIX file from Desktop to the service. They must first apply a label to the file in Desktop.

The images below show the dialogs that prompt users to choose and apply a label when they try to save or import unlabeled content.

![Screenshot of mandatory label dialog.](media/service-security-sensitivity-label-mandatory-label-policy/mandatory-labels-dialog.png)

## Enabling a mandatory label policy

A Microsoft 365 security administrator enables a mandatory label policy for Power BI in the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection) using the following [PowerShell command](/powershell/module/exchange/set-labelpolicy). The mandatory label settings for Power BI are independent of the mandatory label settings that affect Office files and email.

```powershell
Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbimandatory="true"}
```

Where:

* policy name = the name you want to give to the policy

### Requirements
 
* You need the EXO V2 module to run this command. For more information, see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exo-v2-module)

* A connection to the Microsoft 365 compliance center is also required. For more information, see [Connect to Security & Compliance Center PowerShell using the EXO V2 module](/powershell/exchange/connect-to-scc-powershell)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

>[!NOTE]
> Mandatory labeling is not supported for service principals.

## Next steps

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)