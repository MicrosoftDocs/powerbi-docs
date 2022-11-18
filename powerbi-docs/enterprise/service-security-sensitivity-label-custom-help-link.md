---
title: Custom help link for sensitivity labels
description: Learn how to create a custom help link for your sensitivity labels that goes to your organization's web page.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 11/29/2021
LocalizationGroup: Data from files
---
# Custom help link for sensitivity labels

To help your organization's Power BI users understand and use your sensitivity labels, you can provide a *Learn more* link to your organization’s custom web page. You can provide details about what your users see when they're applying or being prompted to apply sensitivity labels. The image below shows and example of how the *Learn more* link appears when applying a sensitivity label in Power BI Desktop.

![Screenshot shows the sensitivity icon with the menu expanded. Learn more is highlighted.](media/service-security-sensitivity-label-custom-help-link/sensitivity-label-custom-help-link.png)

## Define a custom help link

You can define a custom help link for sensitivity labels in two ways:

* By using the Security & Compliance PowerShell [Set-LabelPolicy](/powershell/module/exchange/set-labelpolicy) command. You can use this cmdlet and the following syntax to create a Power BI dedicated help link.

    ```powershell
    Set-LabelPolicy -Identity "<policy name>" -AdvancedSettings @{powerbicustomurl=https://<your link>}
    ```

* If a dedicated custom help link for Power BI isn't set, Power BI uses the custom help link defined for Office 365 apps. The custom help link is defined in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/informationprotection). For more information, see [What label policies can do](/microsoft-365/compliance/sensitivity-labels#what-label-policies-can-do).

    ![Screenshot shows the Microsoft 365 compliance page to create a policy. Create policy, settings, and provide a custom help link are highlighted.](media/service-security-sensitivity-label-custom-help-link/sensitivity-label-custom-help-link-compliance-ui.png)

If a user has more than one label policy, the custom URL is always taken from the policy with the highest priority, so be sure to configure the custom URL on that policy.

## Next steps

* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)