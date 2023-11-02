---
title: How admins can manage the Power BI Desktop sign-in form
description: Learn how you can manage the initial sign-in form when opening Power BI Desktop by using registry keys.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: how-to
ms.date: 09/29/2023
---

# Manage the Power BI Desktop sign-in form

The first time Power BI Desktop is launched, a sign-in form is displayed. Information can be filled in, or sign in to Power BI to continue. Administrators manage this form by using a registry key.

![Screenshot of an initial sign-in form for Power B I Desktop.](media/desktop-admin-sign-in-form/sign-in-form.png)

Administrators use the following registry key to disable the sign-in form. This change can also be pushed to an entire organization by using global policies.

```console
Key: HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Microsoft Power BI Desktop
valueName: ShowLeadGenDialog
```

You can also try the following key, which has been successful for some customers based on their configurations:

```console
Key: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Microsoft Power BI Desktop
valueName: ShowLeadGenDialog
```

A value of 0 disables the dialog.

More questions? [Ask the Power BI Community](https://community.powerbi.com)
