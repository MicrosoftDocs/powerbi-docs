---
title: Distribute content to external guest users with Azure AD B2B
description: Power BI integrates with Azure Active Directory Business-to-business (Azure AD B2B) to allow secure distribution of Power BI content to guest users outside the organization.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 11/02/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# Distribute Power BI content to external guest users with Azure AD B2B

Power BI integrates with Azure Active Directory business-to-business (Azure AD B2B) to allow secure distribution of Power BI content to guest users outside your organization, while still maintaining control over the internal data.

## Enable access

Make sure the [export and sharing settings](service-admin-portal.md#export-and-sharing-settings) feature is enabled in the Power BI admin portal before inviting guest users.

## Who can you invite?

You can invite guest users with any email address, including personal accounts such as gmail.com, outlook.com, and hotmail.com. In Azure AD B2B, these addresses are called *social identities*.

## Invite guest users

Invitations are required only for the first time an external guest user is invited to your organization. There are two ways to invite users: planned invites and ad-hoc invites.

### Planned invites

Use a planned invite if you know which users to invite. You can send the invite using the Azure portal or PowerShell. You must be a tenant admin to invite people.

Follow these steps to send an invite in the Azure portal.

1. In the [Azure Portal](https://portal.azure.com), select **Azure Active Directory**.

1. Under **Manage**, go to **Users** > **All users** > **New guest user**.

    ![Azure AD Portal - New Guest User](media/service-admin-azure-ad-b2b/azuread-portal-new-guest-user.png)

1. Enter an **email address** and **personal message**.

    ![Azure AD Portal - new guest user invite message](media/service-admin-azure-ad-b2b/azuread-portal-invite-message.png)

1. Select **Invite**.

To invite more than one guest user, use PowerShell. For more information, see [Azure AD B2B collaboration code and PowerShell samples](/azure/active-directory/b2b/code-samples/).

The guest user needs to select **Get Started** in the email invitation they receive. The guest user is then added to the tenant.

![Guest user email invitation](media/service-admin-azure-ad-b2b/guest-user-invite-email.png)

### Ad-hoc invites

To perform an invite at anytime, add the external user to your dashboard or report through the share UI, or your app through the access page. Here is an example of what to do when inviting an external user to use an app.

![External user added to App access list](media/service-admin-azure-ad-b2b/power-bi-app-access.png)

The guest user will receive an email indicating that the app has been shared with them.

![Email for app shared with guest user](media/service-admin-azure-ad-b2b/guest-user-invite-email2.png)

The guest user must sign in with their organization email address. They will be prompted to accept the invitation after signing in. After sign in, the guest user is redirected to the app content. To return to the app, they can bookmark the link or save the email.

## Licensing

The guest user must have the proper licensing in place to view the app that was shared. There are three options to accomplish this: use Power BI Premium; assign a Power BI Pro license; or use the guest's Power BI Pro license.

### Use Power BI Premium

Assigning the app workspace to [Power BI Premium capacity](service-premium.md) enables the guest user to use the app without requiring a Power BI Pro license. Power BI Premium also enables apps to take advantage of other capabilities like increased refresh rates, dedicated capacity, and large model sizes.

![Use Power BI Premium](media/service-admin-azure-ad-b2b/license-approach1.png)

### Assign a Power BI Pro license to guest user

Assigning a Power BI Pro license to the guest user, within your tenant, allows that guest user to view content in the tenant.

![Assign Pro license from your tenant](media/service-admin-azure-ad-b2b/license-approach2.png)

### Guest user brings their own Power BI Pro license

The guest user already has a Power BI Pro license assigned within their tenant.

![Guest user brings their own license](media/service-admin-azure-ad-b2b/license-approach3.png)

## Considerations and Limitations

* External B2B guests are limited to consumption of content only. External B2B guests can view apps, dashboards, reports, export data and create email subscriptions for dashboards and reports. They can't access workspaces or publish their own content.

* This feature is not currently available with the Power BI mobile apps. On a mobile device, you can view Power BI content shared using Azure AD B2B in a browser.

* This feature is not currently available with the Power BI SharePoint Online report web part.

## Next steps

For more detailed information, including how row-level security works, check out the whitepaper: [Distribute Power BI content to external guest users using Azure AD B2B](https://aka.ms/powerbi-b2b-whitepaper).

For information regarding Azure AD B2B, see [What is Azure AD B2B collaboration?](/azure/active-directory/active-directory-b2b-what-is-azure-ad-b2b/).
