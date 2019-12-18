---
title: Frequently asked questions about Power BI visuals
description: Browse a list of frequently asked questions and answers about Power BI visuals
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.topic: conceptual
ms.subservice: powerbi-custom-visuals
ms.custom: ''
ms.date: 12/17/2018
---

# Frequently asked questions about Power BI visuals

## Organizational Power BI visuals

The admin portal enables managing Power BI visuals for your organization.

### How can the admin manage organizational Power BI visuals?

In the Admin portal, under the *Organizational visuals* tab, the admin can see and [manage all the organizational Power BI visuals in the enterprise](../service-admin-portal.md#organizational-visuals). This includes adding, disabling, enabling, and deleting Power BI visuals.

Users in the organization can easily find Power BI visuals, and import them into their reports directly from Power BI Desktop or Service.

Once the admin uploads a new version of an organizational Power BI visual, everyone in the organization gets the same updated version. All reports using updated Power BI visuals are automatically updated.

Users can find the organizational Power BI visuals in the built-in Power BI Desktop and Power BI service organization store, under the *MY ORGANIZATION* tab. 

### If an admin uploads a Power BI visual from the public marketplace to the organization store, is it automatically updated once a vendor updates the visual in the public marketplace?

No, there's no automatic update from the public marketplace. It's the Admin's responsibility to update the organizational Power BI visual version.

### Is there a way to disable the organization store?

No, users always see the *MY ORGANIZATION* tab in Power BI desktop and Power BI service. If an admin disables or deletes all the organizational Power BI visuals from the admin portal, the organizational store will be empty.
  
### If the admin disables Power BI visuals from the Admin portal (tenant settings) do users still have access to the organizational Power BI visuals?

Yes, if the admin disables the Power BI visuals from the admin portal, it doesn’t affect the organizational store.

Some organizations disable Power BI visuals and enable only hand-picked visuals that were imported and uploaded by the Power BI admin to the organizational store.

Disabling the Power BI visuals from the Admin portal isn't enforced in Power BI Desktop. Desktop users can still add and use Power BI visuals from the public marketplace in their reports. However, those public Power BI visuals stop rendering once published to the Power BI Service and issue an appropriate error. 

When the Power BI visuals setting in the admin portal, is enforced, users in Power BI service cannot import Power BI visuals from the public marketplace. Only visuals from the organizational store can be imported.

### What are the advantages of Power BI visuals in the organizational store?

* Everyone gets the same visual version, which is controlled by the Power BI admin. Once the admin updates the visual's version in the admin portal, all the users in the organization get the updated version automatically.

* No need to share visual files by email or shared folders. The organizational store offers are visible to all members who are logged-in.

* Security and supportability, new versions of organizational Power BI visuals are updated automatically in all reports.

* Admins can control which Power BI visuals are available throughout the organization.

* Admins can enable/disable visuals for testing from the admin portal.

## Certified Power BI visuals

### What are certified Power BI visuals?

Certified Power BI visuals are Power BI visuals that meet certain [requirements](power-bi-custom-visuals-certified.md), and are certified by Microsoft.

In the [marketplace](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals), certified Power BI visuals have a yellow badge indicating that they're certified.

Microsoft isn't the author of third-party Power BI visuals. We advise customers to contact the author directly to verify the functionality of third-party visuals.

### What tests are done during the certification process?

The certification process tests include but are not limited to: 
* Code reviews
* Static code analysis
* Data leakage
* Data fuzzing
* Penetration testing
* Access XSS testing
* Malicious data injection
* Input validation
* Functional testing
 
### Are certified Power BI visual checked again with every new submission (upgrade)?

Yes. Every time a new version of certified visual is submitted to the Marketplace, the visual’s version update goes under the same certification checks.

The version update certification is automatic. If there's a violation that causes the update to be rejected, an email is sent to the developer to explain what needs to be fixed.

### Can a certified Power BI visual stop lose its certification after a new update?

No, this is not possible. A certified visual can’t lose its certification with a new update. The update is rejected.
 
### Do I need to share my code in a public repository if I'm certifying my Power BI visual?

No, you don’t need to share your code publicly.

Provide read permissions to check the Power BI visual code. For example, by using a private repository in GitHub.
 
### Does a certified Power BI visual have to be in the marketplace?

Yes. Private visuals are not certified.
 
### How long does it take to certify my visual?

Certifying a new Power BI visual (first-time certification) can take up to four weeks. 

Certifying an updated version of a Power BI visual, can take up to three weeks. 

### Does the Certification process ensure that there is no data leakage?

The tests performed are designed to check that the visual does not access external services or resources. 

Microsoft is not the author of third-party Power BI visuals. We advise customers to contact the author directly to verify the functionality of third-party Power BI visuals.
 
### Are uncertified Power BI visuals safe to use?

Uncertified Power BI visuals do not necessarily mean unsafe visuals.

Some visuals are not certified because they don’t comply with one or more of the [certification requirements](https://docs.microsoft.com/power-bi/power-bi-custom-visuals-certified?#certification-requirements). For example, connecting to an external service like map visuals, or visuals using commercial libraries.
 
## Visuals with additional purchases

### What is a visual with additional purchases?

A visual with additional purchases is similar to in-app purchase (IAP) adds-in. These adds-in include an  **Additional purchase may be required** price tag.

IAP Power BI visuals are free, downloadable Power BI visuals. Users pay nothing to download those Power BI visuals from the marketplace.

IAP visuals offer optional in-app purchases for advanced features.  

### What is changing in the submission process?

The IAP Power BI visuals submission process to the marketplace, is the same process as the one for free Power BI visuals. You can submit a Power BI visual to be certified using [Partner Center](https://docs.microsoft.com/partner-center/).


When registering your Power BI visual, navigate to the *Product setup* tab and check the *My product requires the purchase of a service* check box.

### What should I do before submitting my IAP Power BI visual?

If you’re working on an IAP Power BI visual, make sure that it complies with the [guidelines](guidelines-powerbi-visuals.md).  

> [!NOTE]
> Power BI free visuals with an added IAP feature, must keep the same free features previously offered. You can add optional advanced paid features on top of the old free features. We recommend submitting the IAP Power BI visual with the advanced features as a new Power BI visual, and not to update the old free one.

### Do IAP Power BI visuals need to be certified?

The [certification](power-bi-custom-visuals-certified.md) process is optional. It is up to the developer to decide whether to certify their IAP Power BI visual or not.

### Can I get my IAP Power BI visual certified?

Yes, once your IAP Power BI visual is approved by the AppSource team, you can submit your Power BI visual to be [certified](power-bi-custom-visuals-certified.md).

Certification is an optional process, it's up to you to decide if you want your IAP visual to be certified.

## Additional questions

### How to get support?

Feel free to contact the Power BI visuals support team at pbicvsupport@microsoft.com, with any questions, comments, or issues you have.  

## Next steps

For more information, visit [Troubleshooting your Power BI visuals](power-bi-custom-visuals-troubleshoot.md).
