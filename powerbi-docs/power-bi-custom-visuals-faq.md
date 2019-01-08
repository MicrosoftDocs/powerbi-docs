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
ms.subservice: powerbi-custom-visuals
ms.custom: ''
ms.date: 12/17/2018
---

# Frequently asked questions about Power BI custom visuals

## Organizational custom visuals

### How can the admin manage the organizational custom visuals?

In the Admin portal, under the "Organizational custom visuals" tab the admin can see and [manage all the organizational custom visuals in the enterprise](https://docs.microsoft.com/power-bi/service-admin-portal#organization-visuals): add, disable, enable, and delete.
There's no need to share those visuals by emails or shared folder anymore! Once deployed into the organizational repository, users in the organization can easily find them, and import the organizational custom visuals into their reports directly from Power BI Desktop or Service. The organizational custom visuals can be found from the built-in store (in desktop and service) under the *MY ORGANIZATION* tab. Once the admin uploads a new organizational custom visual’s version, everyone in the organization gets the same updated version. Report authors don't need to delete the visual in their reports to get the new version of these visuals as all reports using these visuals are automatically updated! The update mechanism is similar to the marketplace visuals.

### If an admin uploads a custom visual from the public marketplace to the organization store, is it automatically updated once a vendor updates the visual in the public marketplace?

No, there's no automatic update from the public marketplace.
It's the Admin's responsibility to update the organizational custom visuals' version.

### Is there a way to disable the organizational store?

No, users always see the "MY ORGANIZATION" tab from the Power BI desktop and service. Admin can disable or delete all organizational custom visuals from the admin portal and the organizational store is empty.
  
### If the administrator disables custom visuals from the Admin portal (Tenant settings) do users still have access to the organizational custom visuals?

Yes, if the admin disables the custom visuals from the admin portal, it doesn’t affect the organizational store. Some organizations disable custom visuals and enable only hand-picked visuals that were imported and uploaded by the Power BI administrator to the organizational store. Disabling the custom visuals from the Admin portal isn't enforced in Power BI Desktop. Desktop users can still add and use custom visuals from the public marketplace in their reports. However, those public custom visuals stop rendering once published to the Power BI Service and issue an appropriate error. When using the Power BI service,  you aren't able to import custom visuals from the public marketplace. Only visuals from the organizational store can be imported because the custom visuals setting in the admin portal is enforced in the Power BI service.

### Why does the organizational store and organizational custom visuals make a great enterprise solution?

* Everyone gets the same visual version, which is controlled by the Power BI administrator. Once the admin updates the visual's version in the admin portal, all the users in the organization get the updated version automatically.

* No need to share visual files by email or shared folders anymore! One place, visible to all members who are logged-in.

* Security and supportability, new versions of organizational custom visuals are updated automatically in all reports similar to marketplace visuals.

* Users in the organization using the organizational custom visuals needs to be logged-in to see and use the organizational custom visuals, which are a security element for organization.

* Admins can control which custom visuals to be available in the organization.

* Admins can enable/disable visuals for testing from the admin portal. Better security enforcement as those visuals will be allowed for organizational members only.

## Certified custom visuals

### What are certified custom visuals?

Certified custom visuals are visuals in the [marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that met certain [specified](power-bi-custom-visuals-certified.md) code requirements and testing by the Power BI team.  The tests performed are designed to check that the visual doesn't access external services or resources. However, Microsoft isn't the author of third-party custom visuals. We advise customers to contact the author directly to verify the functionality of such visual.

## Visuals with additional purchases

### What is a visual with additional purchases?

A visual with additional purchases is similar to in-app purchase (IAP) adds-in in the marketplace, these adds-in have a price tag **Additional purchase may be required**.

IAP custom visuals are free, downloadable custom visuals - users pay nothing to download those custom visuals from the marketplace. IAP visuals offer optional in-app purchases for advanced features.  

### What's the benefit to developers?

IAP custom visuals in AppSource, will be discoverable to the many daily visitors, bringing valuable traffic, and increased awareness for your IAP custom visuals and to you as the developer.

If until recently you managed those visuals through your website, now you can submit them to AppSource. Which will increase the level of discoverability and visibility of the IAP visuals inside the Power BI community.

Visuals in the AppSource enjoy a Direct feedback channel from your customers who are using the IAP custom visual, through the reviews and ratings system in the store.  

Once the IAP visual was approved by the AppSource validation team, you may also submit those visuals for certification. It is an optional process.  

Once the visual is certified, IAP custom visuals can be exported to PowerPoint and displayed in the emails received when a user subscribes to report pages. So today by submitting IAP visuals to the marketplace, IAP custom visuals can also be certified and support extra feature set.  

### Do IAP visuals need to be certified?

Certification process is optional. It is up to the developer to decide whether to certify their IAP custom visuals or not same with free visuals.

### What is changing in the submission process?

The IAP custom visuals submission process to the marketplace, is same process as for free visuals. It happens through the seller dashboard.  The only change to the submission process is that developers will need to state in the developer notes in the seller dashboard: “Visual with in-app purchase”. You’ll also need to provide a license key/token, if necessary to validate the paid/advanced features.  

There will be no new option in the seller dashboard: *free with in-app purchases*, you will need to submit your IAP visuals as *free*.

In addition, let users know what to expect by providing in your store long description which features are free and which features require additional purchases to operate.  

### What should I do before submitting my IAP custom visual?

If you’re working on an IAP custom visual or already have one, make sure that it complies to the  guidelines.  

If you have a logo in the custom visual, make sure it complies to the logo guidelines (color, location, size, and action triggering).

You can also find, in the guidelines, best practice notes.  

### Can I get my IAP custom visual certified?

Yes, same with free visuals.  Once your IAP custom visual is approved by the AppSource team, you can submit your visual to the certification process.

To certify your visual, it should comply with the certification requirements, for example the visual cannot access external services for licenses validation.

Recall certification is an optional process, it's up to you to decide if you want your IAP visual to be certified.

## Additional questions

### How to get support?

Feel free to contact the custom visuals support team: *pbicvsupport@microsoft.com* with any questions, comments, or issues you have.  

## Next steps

For more information, visit [Troubleshooting your Power BI custom visuals](power-bi-custom-visuals-troubleshoot.md).
