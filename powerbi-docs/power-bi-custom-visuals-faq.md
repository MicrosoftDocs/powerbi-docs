---
title: Frequently asked questions about Power BI custom visuals
description: Browse a list of frequently asked questions and answers about Power BI custom visuals
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 10/29/2018
LocalizationGroup: Visualizations
---

# Frequently asked questions about Power BI custom visuals

## Organizational custom visuals

**How can the admin manage the organizational custom visuals?**

In the Admin portal, under the "Organizational custom visuals" tab the admin can see and [manage all the organizational custom visuals in the enterprise](https://docs.microsoft.com/power-bi/service-admin-portal#organization-visuals): add, disable, enable, and delete.
There is no need to share those visuals by emails or shared folder anymore! Once deployed into the organizational repository, users in the organization can easily discover them, and import the organizational custom visuals into their reports directly from Power BI Desktop or Service. The organizational custom visuals can be found from the built-in store (in desktop and service) under the "MY ORGANIZATION" tab. Once the admin uploads a new organizational custom visual’s version, everyone in the organization gets the same updated version. Report authors do not need to delete the visual in their reports to get the new version of these visuals as all reports using these visuals are automatically updated! The update mechanism is similar to the marketplace visuals.

**If an admin uploads a custom visual from the public marketplace to the organization store, is it automatically updated once a vendor updates the visual in the public marketplace?**

No, there is no automatic update from the public marketplace.
It is the Admin's responsibility to update the organizational custom visuals' version if desired.

**Is there a way to disable the organizational store?**

No, users always see the "MY ORGANIZATION" tab from the Power BI desktop and service. Admin can disable or delete all organizational custom visuals from the admin portal and the organizational store is empty.
  
**If the administrator disables custom visuals from the Admin portal (Tenant settings) do users still have access to the organizational custom visuals?**

Yes, if the admin disables the custom visuals from the admin portal, it doesn’t affect the organizational store. Some organizations disable custom visuals and enable only hand-picked visuals that were imported and uploaded by the Power BI administrator to the organizational store. Disabling the custom visuals from the Admin portal is not enforced in Power BI Desktop. Desktop users can still be able to add and use custom visuals from the public marketplace in their reports. However, those public custom visuals stop rendering once published to the Power BI Service and issue an appropriate error. When using the Power BI service,  you are not able to import custom visuals from the public marketplace. Only visuals from the organizational store can be imported because the custom visuals setting in the admin portal is enforced in the Power BI service.

**Why does the organizational store and organizational custom visuals make a great enterprise solution?**

* Everyone gets the same visual version, which is controlled by the Power BI administrator. Once the admin updates the visual's version in the admin portal, all the users in the organization get the updated version automatically.

* No need to share visual files by email or shared folders anymore! One place, visible to all members who are logged-in.

* Security and supportability, new versions of organizational custom visuals are updated automatically in all reports similar to marketplace visuals.

* Users in the organization using the organizational custom visuals needs to be logged-in to see and use the organizational custom visuals, which are a security element for organization.

* Admins can control which custom visuals to be available in the organization.

* Admins can enable/disable visuals for testing from the admin portal. Better security enforcement as those visuals will be allowed for organizational members only.

## Certified custom visuals

**What are certified custom visuals?**

Certified custom visuals are visuals in the [marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that met certain [specified](power-bi-custom-visuals-certified.md) code requirements and testing by the Power BI team.  The tests performed are designed to check that the visual does not access external services or resources; however, Microsoft is not the author of third-party custom visuals, and we advise customers to contact the author directly to verify the functionality of such visual.

## Next steps

For information about troubleshooting, visit [Troubleshooting your Power BI custom visuals](power-bi-custom-visuals-troubleshoot.md).
