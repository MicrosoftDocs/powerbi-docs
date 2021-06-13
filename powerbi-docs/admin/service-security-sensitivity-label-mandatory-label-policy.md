---
title: Mandatory label policy in Power BI
description: Learn how organizations can require users to apply sensitivity labels with a mandatory label policy in Power BI
author: paulinbar
ms.author: painbar
manager: kfolis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 06/13/2021
LocalizationGroup: Data from files
---
# Mandatory label policy for Power BI

To help ensure comprehensive protection and governance of sensitive data, you can require your organization's Power BI users to apply sensitivity labels to content they create or edit in Power BI. You do this by enabling, in their sensitivity label policies, a special setting for mandatory labeling in Power BI. This article covers the user actions that are affected by the mandatory label policy, and explains how to enable the mandatory label setting for Power BI in an existing policy.

>[!NOTE]
> The mandatory label policy setting for Power BI is independent of the mandatory label policy setting for files and email.

When a mandatory label policy is in effect, 
* Users must apply a sensitivity label before saving new reports, dashboards, or datasets in the service. If they try to save a new item without applying a label, a dialog prompts them to choose a label before allowing them to save.
* Users must apply a sensitivity label before saving updates to the settings or content of existing unlabeled reports and dashboards. If they try to save the updates without applying a label, a dialog prompts them to apply a label before allowing them to save.
* If users try to import data from an unlabeled *.pbix* file, a dialog prompts them to apply a label before allowing import to continue.
* Users can't publish an unlabeled *.pbix* file from Desktop to the service. They must first apply a label to the file in Desktop.

The images below show the dialogs that prompt users to choose and apply a label when they try to save or import unlabeled content. The save button only becomes active when the user selects a label.

![Screenshot of mandatory label dialog.](media/service-security-sensitivity-label-mandatory-label-policy/mandatory-labels-dialog.png)

>[!NOTE]
> Mandatory labeling in Power BI is not supported for service principals and APIs. They are not affected by mandatory label policies.

## Enabling a mandatory label policy for Power BI

A Microsoft 365 administrator can enable a mandatory label policy for Power BI using [Security & Compliance Center PowerShell](/powershell/module/exchange/set-labelpolicy). The mandatory label settings for Power BI are independent of the mandatory label settings that affect Office files and email.

```powershell
Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbimandatory="true"}
```

Where:

* policy name = the name of the policy where you want to set labeling in Power BI as mandatory.

### Requirements
 
* You need the EXO V2 module to run this command. For more information, see [About the Exchange Online PowerShell V2 module](/powershell/exchange/exchange-online-powershell-v2#install-and-maintain-the-exo-v2-module)
* A connection to the Microsoft 365 compliance center is also required. For more information, see [Connect to Security & Compliance Center PowerShell using the EXO V2 module](/powershell/exchange/connect-to-scc-powershell)

### Documentation

* [Admin Guide: Custom configurations for the Azure Information Protection unified labeling client](/azure/information-protection/rms-client/clientv2-admin-guide-customizations#available-advanced-settings-for-labels)
* [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels#use-powershell-for-sensitivity-labels-and-their-policies)
* [Set-LabelPolicy documentation](/powershell/module/exchange/set-labelpolicy)

## Next steps

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)