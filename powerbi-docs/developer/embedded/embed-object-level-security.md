---
title: Embed a report that uses object-level security
description: Embed a report that has object-level security (OLS).
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 07/21/2022
---

# Object level security

object-level security (OLS) enables model authors to secure sensitive tables or columns from report viewers– sensitive data, for example includes personally identifiable information (PII). From the standpoint of the user without proper access, the secured table or column does not exist. In addition, object names and metadata are also secured to prevent a malicious user from discovering that such an object even exists. This added layer of security prevents users without the appropriate access levels from discovering business critical or sensitive personal information. Authoring OLS rules in the Power BI dataset can be performed with tools that utilize the XMLA endpoint. Be sure to check out the public preview object level security announcement for more details and how to enable this feature!

https://powerbi.microsoft.com/en-us/blog/object-level-security-ols-is-now-generally-available-in-power-bi-premium-and-pro/
