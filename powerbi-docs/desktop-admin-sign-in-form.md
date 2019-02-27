---
title: How admins can manage the Power BI Desktop sign-in form
description: Learn how you can manage the initial sign-in form when opening Power BI Desktop.
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 02/21/2019
ms.author: davidi

---
# How administrators can manage the Power BI Desktop sign-in form
The first time Power BI Desktop is launched, a sign-in form is displayed. Information can be filled in, or sign in to Power BI to continue. Administrators manage this form by using a registry key. 

![Initial sign-in form for Power BI Desktop](media/desktop-admin-sign-in-form/sign-in-form.png)

Administrators use the following registry key to disable the sign-in form. This can also be pushed to an entire organization by using global policies.

```
Key: HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Microsoft Power BI Desktop
valueName: ShowLeadGenDialog
```

A value of 0 will disable the dialog.

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

