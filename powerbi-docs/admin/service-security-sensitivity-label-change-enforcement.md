---
title: Sensitivity label change enforcement 
description: Learn how Power BI controls who can change or remove sensitivity labels on Power BI content.
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 04/12/2021
LocalizationGroup: Data from files
---
# Sensitivity label change enforcement

Power BI restricts permission to change or remove Microsoft Information Protection sensitivity labels that have file encryption settings to authorized users only. 

Authorized users are:
* The user who applied the sensitivity label. 
* Users who have been assigned at least one of the following usage rights to the label in the labeling admin center ([Microsoft 365 compliance center](https://compliance.microsoft.com/), [Microsoft 365 security center](https://security.microsoft.com/), or [Security & Compliance Center](https://protection.office.com/)):
* OWNER
* EXPORT
* EDIT and EDITRIGHTSDATA
[OWNER or EXPORT or EDIT and EDITRIGHTSDATA usage rights](/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide) to the label in the labeling admin center ([Microsoft 365 compliance center](https://compliance.microsoft.com/), [Microsoft 365 security center](https://security.microsoft.com/), or [Security & Compliance Center](https://protection.office.com/)).

User who try to change a label and can’t should ask the person who applied the label to perform the modification, or they can contact Microsoft 365/Office security administrator and ask to be granted the necessary usage rights.


## Next steps
* [Enable sensitivity label inheritance from data sources](service-admin-portal.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview)
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)