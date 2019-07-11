---
title: Frequently asked questions about Power BI custom visuals
description: Browse a list of frequently asked questions and answers about Power BI custom visuals
author: sranins
ms.author: rasala
manager: kfile
ms.reviewer: maghan
ms.service: powerbi
ms.topic: conceptual
ms.subservice: powerbi-custom-visuals
ms.custom: ''
ms.date: 12/17/2018
---

# Frequently asked questions about Power BI visuals

## Organizational visuals

### How can the admin manage the organizational visuals?

In the Admin portal, under the "Organizational visuals" tab, the admin can see and [manage all the organizational visuals in the enterprise](service-admin-portal.md#organizational-visuals): add, disable, enable, and delete.
There's no need to share those visuals by emails or shared folder anymore! Once deployed into the organizational repository, users in the organization can easily find them, and import the organizational visuals into their reports directly from Power BI Desktop or Service. The organizational visuals can be found from the built-in store (in desktop and service) under the *MY ORGANIZATION* tab. Once the admin uploads a new organizational visual’s version, everyone in the organization gets the same updated version. Report authors don't need to delete the visual in their reports to get the new version of these visuals as all reports using these visuals are automatically updated! The update mechanism is similar to the marketplace visuals.

### If an admin uploads a visual from the public marketplace to the organization store, is it automatically updated once a vendor updates the visual in the public marketplace?

No, there's no automatic update from the public marketplace.
It's the Admin's responsibility to update the organizational visuals' version.

### Is there a way to disable the organizational store?

No, users always see the "MY ORGANIZATION" tab from the Power BI desktop and service. Admin can disable or delete all organizational visuals from the admin portal and the organizational store is empty.
  
### If the administrator disables visuals from the Admin portal (Tenant settings) do users still have access to the organizational visuals?

Yes, if the admin disables the visuals from the admin portal, it doesn’t affect the organizational store. Some organizations disable visuals and enable only hand-picked visuals that were imported and uploaded by the Power BI administrator to the organizational store. Disabling the visuals from the Admin portal isn't enforced in Power BI Desktop. Desktop users can still add and use visuals from the public marketplace in their reports. However, those public visuals stop rendering once published to the Power BI Service and issue an appropriate error. When using the Power BI service,  you aren't able to import visuals from the public marketplace. Only visuals from the organizational store can be imported because the visuals setting in the admin portal is enforced in the Power BI service.

### Why does the organizational store and organizational visuals make a great enterprise solution?

* Everyone gets the same visual version, which is controlled by the Power BI administrator. Once the admin updates the visual's version in the admin portal, all the users in the organization get the updated version automatically.

* No need to share visual files by email or shared folders anymore! One place, visible to all members who are logged-in.

* Security and supportability, new versions of organizational visuals are updated automatically in all reports similar to marketplace visuals.

* Users in the organization using the organizational visuals needs to be logged-in to see and use the organizational visuals, which are a security element for organization.

* Admins can control which visuals to be available in the organization.

* Admins can enable/disable visuals for testing from the admin portal. Better security enforcement as those visuals will be allowed for organizational members only.

## Certified visuals

### What are certified visuals?

Certified visuals are visuals in the [marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that meet certain [specified](power-bi-custom-visuals-certified.md) code requirements and testing by the Power BI team.  The tests performed are designed to check that the visual does not access external services or resources. However, Microsoft isn't the author of third-party visuals, and we advise customers to contact the author directly to verify the functionality of such visual.

### What tests are done during the certification process?

The certification process tests include but are not limited to:
Code reviews, static code analysis, data leakage, data fuzzing, penetration testing, access XSS testing, malicious data injection, input validation and functional testing.
 
### Do you certify visuals every submission?

Yes. Every time a new version of certified visual is submitted to the Marketplace, the visual’s version update goes under the same certification checks.

Note for developers: if you are submitting a version update of certified visual, you do not need to send a separate email as [first time certification request.](https://docs.microsoft.com/power-bi/power-bi-custom-visuals-certified#process-for-submitting-a-custom-visual-for-certification)
Certification of version update happens automatically, and any violations that cause a rejection are sent an email to explain what things need to be fixed.

### Is it possible that a certified visual stops being certified with a new update?

No, this is not possible. A certified visual can’t be uncertified with a new update. The update is rejected.

### Do I need to share my code in public repository if I am submitting to the certification process?

No, you don’t need to share your code publicly. 
However, you need to give us read permissions to check the visuals code. E.g. private repository in GitHub.

### Do we have to [publish](https://docs.microsoft.com/power-bi/developer/office-store) the visual in the [Marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) to certify it?

Yes. Publishing the visual to Marketplace first is an obligatory requirement for certification.
To certify a visual, it should be in our servers. We cannot certify private visuals.

### How long does it take to certify my visual?

For updated version it may take up to 3 weeks. For a new submission (first-time certification) it may take up to 4 weeks. 

### Does the Certification process ensure that no data leakage occurs?

The tests performed are designed to check that the visual does not access external services or resources. 
However, Microsoft is not the author of third-party visuals, and we advise customers to contact the author directly to verify the functionality of such visual.
 
### Are uncertified visuals safe to use?

Uncertified visuals do not necessarily mean unsafe visuals.
Some visuals aren't certified because they don’t comply with one or more of the [certification requirements](https://docs.microsoft.com/power-bi/power-bi-custom-visuals-certified?#certification-requirements). For example, connecting to an external service like map visuals, or visuals using commercial libraries.
 
## Visuals with additional purchases

### What is a visual with additional purchases?

A visual with additional purchases is similar to in-app purchase (IAP) adds-in in the marketplace, these adds-in have a price tag **Additional purchase may be required**.

IAP visuals are free, downloadable visuals - users pay nothing to download those visuals from the marketplace. IAP visuals offer optional in-app purchases for advanced features.  

### What's the benefit to developers?

IAP visuals in AppSource, will be discoverable to the many daily visitors, bringing valuable traffic, and increased awareness for your IAP visuals and to you as the developer.

If until recently you managed those visuals through your website, now you can submit them to AppSource. Which will increase the level of discoverability and visibility of the IAP visuals inside the Power BI community.

Visuals in the AppSource enjoy a Direct feedback channel from your customers who are using the IAP visual, through the reviews and ratings system in the store.  

Once the IAP visual was approved by the AppSource validation team, you may also submit those visuals for certification. It is an optional process.  

Once the visual is certified, IAP visuals can be exported to PowerPoint and displayed in the emails received when a user subscribes to report pages. So today by submitting IAP visuals to the marketplace, IAP visuals can also be certified and support extra feature set.  

### Do IAP visuals need to be certified?

Certification process is optional. It is up to the developer to decide whether to certify their IAP visuals or not same with free visuals.

### What is changing in the submission process?

The IAP visuals submission process to the marketplace, is same process as for free visuals. It happens through the seller dashboard.  The only change to the submission process is that developers will need to state in the developer notes in the seller dashboard: “Visual with in-app purchase”. You’ll also need to provide a license key/token, if necessary to validate the paid/advanced features.  

There will be no new option in the seller dashboard: *free with in-app purchases*, you will need to submit your IAP visuals as *free*.

In addition, let users know what to expect by providing in your store long description which features are free and which features require additional purchases to operate.  

### What should I do before submitting my IAP visual?

If you’re working on an IAP visual or already have one, make sure that it complies to the  guidelines.  

If you have a logo in the visual, make sure it complies to the logo guidelines (color, location, size, and action triggering).

You can also find, in the guidelines, best practice notes.  
> [!Note]
> All free visuals should keep same free features previously offered. You may add optional advanced paid features on top of the old free features. We recommend to submit the IAP visuals with the advanced features as new visuals and not to update the old free ones.

### Can I get my IAP visual certified?

Yes, same with free visuals.  Once your IAP visual is approved by the AppSource team, you can submit your visual to the certification process.

To certify your visual, it should comply with the certification requirements, for example the visual cannot access external services for licenses validation.

Recall certification is an optional process, it's up to you to decide if you want your IAP visual to be certified.

## Additional questions

### How to get support?

Feel free to contact the visuals support team: *pbicvsupport@microsoft.com* with any questions, comments, or issues you have.  

## Next steps

For more information, visit [Troubleshooting your Power BI  visuals](power-bi-custom-visuals-troubleshoot.md).
