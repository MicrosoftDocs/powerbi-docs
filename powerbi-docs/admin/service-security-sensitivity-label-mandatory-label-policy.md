---
title: Sensitivity label downstream inheritance in Power BI
description: Learn how sensitivity labels can be propagated to downstream content
author: paulinbar
ms.author: painbar
manager: kfolis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 04/27/2021
LocalizationGroup: Data from files
---
# Mandatory label policy

To help ensure comprehensive protection and governance of sensitive data, organizations can require users to apply labels to their sensitive Power BI content. This is done by via a mandatory label policy.

![Screenshot of mandatory label dialog.](media/service-security-sensitivity-label-mandatory-label-policy/mandatory-labels-dialog.png)

When a mandatory labeling policy is in effect, 
* Users are required to apply a sensitivity label before saving new reports, dashboards, or datasets in the service. If they try to save a new item without applying a label, a dialog prompts them to choose a label before allowing them to save.
* Users are required to apply a sensitivity label before saving updates to the settings or content of existing unlabeled reports and dashboards. If they try to save the updates without applying a label, a dialog prompts them to apply a label before allowing them to save.
* If users try to import data from an unlabeled PBIX file, a dialog prompts them to apply a label before allowing import to proceed.
* Users can't publish an unlabeled PBIX file from Desktop to the service. They must first apply a label to the file in Desktop. 

## Enabling a mandatory label policy

The mandatory label policy for Power BI is enabled by a Microsoft 365 security administrator in the Microsoft 365 compliance center using the following PowerShell command. The mandatory label settings for Power BI are independent of the mandatory label settings that affect Office files and email.

```powershell
Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbimandatory="true"}
```

Where:

* policy name = the name you want give to the policy
* labels list = the sensitivity labels which are subject to the mandatory label policy
* users list = the list of users, security groups, and service principal apps that will be required to apply labels under this policy

>[!NOTE]
> Mandatory labeling is not supported for service principals.

### Requirements
 
* To be able to run this command, the EXO V2 module is needed. For more information see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps#install-and-maintain-the-exo-v2-module)

* A connection to the Microsoft 365 compliance center is also required. For more information, see [Connect to Security & Compliance Center PowerShell using the EXO V2 module](/powershell/exchange/connect-to-scc-powershell?view=exchange-ps)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy?view=exchange-ps)

>[!NOTE]
> Mandatory labeling is not supported for service principals.

## Next steps

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)