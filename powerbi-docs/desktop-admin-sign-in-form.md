---
title: How admins can manage the Power BI Desktop sign-in form
description: Learn how you can manage the initial sign-in form when opening Power BI Desktop.
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 10/17/2017
ms.author: davidi

---
# How administrators can manage the Power BI Desktop sign-in form
The first time Power BI Desktop is launched, a sign-in form is displayed. Information can be filled in, or sign into Power BI to continue. Administrators can manage this form by using a registry key. 

![Initial sign-in form for Power BI Desktop](media/desktop-admin-sign-in-form/sign-in-form.png)

Administrators can use the following registry key to disable the sign-in form. This can also be pushed out using global policies to the entire organization.

```
Key: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power BI Desktop
valueName: ShowLeadGenDialog
```

A value of 0 will disable the dialog.

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

