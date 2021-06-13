---
title: Custom help link for sensitivity labels
description: Learn how to define a custom help link for your sensitivity label menu
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
# Custom help link for sensitivity labels

To help your organization's Power BI users understand what your sensitivity labels mean or how they should be used, you can provide a *Learn more* URL that appears at the bottom of the menu you see when you're applying a sensitivity label.

![Screenshot of custom help link for sensitivity labels](media/service-security-sensitivity-label-custom-help-link/sensitivity-label-custom-help-link.png)

## Define a custom help link

You can define a custom help link for sensitivity labels in two ways:

* Using the Security & Compliance Center PowerShell [Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy) command. This creates a Power BI dedicated help link.
    
    ```powershell
    Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbicustomurl=https://<your link>}
    ```

* In the [Microsoft 365 compliance center](https://compliance.microsoft.com/informationprotection). This creates a help link that is used for all Office 365 apps. See [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

    ![Screenshot of custom help link field in the compliance center user interface.](media/service-security-sensitivity-label-custom-help-link/sensitivity-label-custom-help-link-compliance-ui.png)

If a URL has been defined both in PowerShell and in the compliance center, the dedicated Power BI URL defined in PowerShell will be used.

A custom URL is always taken from the policy with the highest priority, so be sure to configure the custom URL on that policy.

## Next steps
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)