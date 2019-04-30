---
title: Administering Power BI - frequently asked questions (FAQ)
description: Learn the answers to frequently asked questions on Power BI sign up, tenant management, and other administrative tasks.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 11/16/2018
ms.author: mblythe

LocalizationGroup: Administration
---

# Administering Power BI - frequently asked questions (FAQ)

This article addresses frequently asked questions for Power BI administration. For an overview of the Power BI administration, see [What is Power BI administration?](service-admin-administering-power-bi-in-your-organization.md).

## What's in this article

### Sign up for Power BI section

* [Using PowerShell](#using-powershell)
* [How do users sign up for Power BI?](#how-do-users-sign-up-for-power-bi)
* [How do individual users in my organization sign up?](#how-do-individual-users-in-my-organization-sign-up)
* [How can I prevent users from joining my existing Office 365 tenant?](#how-can-i-prevent-users-from-joining-my-existing-office-365-tenant)
* [How can I allow users to join my existing Office 365 tenant?](#how-can-i-allow-users-to-join-my-existing-office-365-tenant)
* [How do I check if I have the block on in the tenant?](#how-do-i-check-if-i-have-the-block-on-in-the-tenant)
* [How can I prevent my existing users from starting to use Power BI?](#how-can-i-prevent-my-existing-users-from-starting-to-use-power-bi)
* [How can I allow my existing users to sign up for Power BI?](#how-can-i-allow-my-existing-users-to-sign-up-for-power-bi)

### Administration of Power BI section

* [How will this change the way I manage identities for users in my organization today?](#how-will-this-change-the-way-i-manage-identities-for-users-in-my-organization-today)
* [How do we manage Power BI?](#how-do-we-manage-power-bi)
* [What is the process to manage a tenant created by Microsoft for my users?](#what-is-the-process-to-manage-a-tenant-created-by-microsoft-for-my-users)
* [If I have multiple domains, can I control the Office 365 tenant that users get added to?](#if-i-have-multiple-domains-can-i-control-the-office-365-tenant-that-users-get-added-to)
* [How do I remove Power BI for users that already signed up?](#how-do-i-remove-power-bi-for-users-that-already-signed-up)
* [How do I know when new users have joined my tenant?](#how-do-i-know-when-new-users-have-joined-my-tenant)
* [Are there any additional things I should prepare for?](#are-there-any-additional-things-i-should-prepare-for)
* [Where is my Power BI tenant located?](#where-is-my-power-bi-tenant-located)
* [What is the Power BI SLA (Service Level Agreement)?](#what-is-the-power-bi-sla)
* [How does Power BI handle high availability and failover?](#how-does-power-bi-handle-high-availability-and-failover)

### Security in Power BI section

* [Does Power BI meet national, regional, and industry-specific compliance requirements?](#does-power-bi-meet-national-regional-and-industry-specific-compliance-requirements)
* [How does security work in Power BI?](#how-does-security-work-in-power-bi)

## Sign up for Power BI

### Using PowerShell

Some of the procedures in this section require Windows PowerShell scripts. If you're not familiar with PowerShell, we recommend the [PowerShell getting started guide](http://go.microsoft.com/fwlink/p/?LinkID=286814). To run the scripts, first install the latest 64-bit version of the [Azure Active Directory PowerShell for Graph](/powershell/azure/active-directory/).

### How do users sign up for Power BI?

As an admin, you can sign up for Power BI through the [Power BI web site](https://powerbi.microsoft.com) or the [Purchase services](https://admin.microsoft.com/AdminPortal/Home#/catalog) page on the Microsoft 365 admin center. When an admin signs up for Power BI, they can assign user licenses to users who should have access.

Additionally, individual users in your organization may be able to sign up for Power BI through the [Power BI web site](https://powerbi.microsoft.com). When a user in your organization signs up for Power BI, the service automatically assigns a Power BI license to the user. For more info, see [Signing up for Power BI as an individual](service-self-service-signup-for-power-bi.md) and [Power BI licensing in your organization](service-admin-licensing-organization.md).

### How do individual users in my organization sign up?

There are three scenarios that might apply to users in your organization:

* **Scenario 1**: Your organization already has an existing Office 365 environment, and the user signing up for Power BI already has an Office 365 account.
    In this scenario, if a user already has a work or school account in the tenant (for example, contoso.com) but doesn't yet have Power BI, Microsoft simply activates the plan for that account. The user is automatically notified with info on how to use the Power BI service.

* **Scenario 2**: Your organization has an existing Office 365 environment, but the user signing up for Power BI doesn’t have an Office 365 account.
    In this scenario, the user has an email address in your organization’s domain (for example, contoso.com) but doesn't yet have an Office 365 account. In this case, the user can sign up for Power BI and is automatically given an account. This action lets the user access the Power BI service. For example, if an employee named Nancy uses her work email address (like nancy@contoso.com) to sign up, Microsoft automatically adds Nancy as a user in Contoso’s Office 365 environment and activates Power BI for that account.

* **Scenario 3**: Your organization doesn't have an Office 365 environment connected to your email domain.
    There are no administrative actions your organization needs to take advantage of Power BI. The service adds users to a new, cloud-only user directory. You can also choose to take over as the tenant admin and manage them.

> [!IMPORTANT]
> If your organization has multiple email domains and you prefer all email address extensions to be in the same tenant, add all email address domains to an Azure Active Directory tenant before any users sign up. Once you've created users, there's no automated mechanism to move users across tenants. For more info on this process, see [If I have multiple domains, can I control the Office 365 tenant that users get added to?](#if-i-have-multiple-domains-can-i-control-the-office-365-tenant-that-users-get-added-to) later in this article and [Add a domain to Office 365](/office365/admin/setup/add-domain/).

### How can I prevent users from joining my existing Office 365 tenant?

There are steps you can take, as an admin, to prevent users from joining your existing Office 365 tenant. If you block access, users’ attempts to sign up fail, and a message appears that directs them to contact their organization’s admin. You don't need to repeat this process if you have already disabled automatic license distribution. For example, through Office 365 for Education for Students, Faculty, and Staff.

Use the following PowerShell script to prevent new users from joining a managed tenant. ([Learn more about PowerShell][1].)

```powershell
$msolcred = get-credential
connect-msolservice -credential $msolcred

Set-MsolCompanySettings -AllowEmailVerifiedUsers $false
```

> [!NOTE]
> Blocking access prevents new users in your organization from signing up for Power BI. Users that sign up for Power BI prior to disabling new signups for your organization still retain their licenses. To remove a user, see [How do I remove Power BI for users that already signed up?](#how-do-i-remove-power-bi-for-users-that-already-signed-up) later in this article.

### How can I allow users to join my existing Office 365 tenant?

Use the following PowerShell script to let new users join a managed tenant. ([Learn more about PowerShell][1].)

```powershell
$msolcred = get-credential
connect-msolservice -credential $msolcred

Set-MsolCompanySettings -AllowEmailVerifiedUsers $true
```

### How do I check if I have the block on in the tenant?

Use the following PowerShell script to check settings. *AllowEmailVerifiedUsers* should be false. ([Learn more about PowerShell][1].)

```powershell
$msolcred = get-credential
connect-msolservice -credential $msolcred

Get-MsolCompanyInformation | fl allow*
```

### How can I prevent my existing users from starting to use Power BI?

The Azure AD setting that controls this is **AllowAdHocSubscriptions**. Most tenants have this set to true, which means they enabled the setting. If you acquired Power BI through a partner, this may be set to false, which means they disabled the setting.

Use the following PowerShell script to disable ad hoc subscriptions. ([Learn more about PowerShell][1].)

1. Sign into Azure Active Directory using your Office 365 credentials. The first line of the following PowerShell script prompts you for your credentials. The second line connects to Azure Active Directory.

    ```powershell
     $msolcred = get-credential
     connect-msolservice -credential $msolcred
    ```

   ![Screenshot of Azure Active Directory sign in through PowerShell](media/service-admin-licensing-organization/aad-signin.png)

1. Once you sign in, run the following command to see how your tenant is currently set up.

    ```powershell
     Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
    ```

1. Run the following command to enable (`$true`) or disable (`$false`) **AllowAdHocSubscriptions**.

    ```powershell
     Set-MsolCompanySettings -AllowAdHocSubscriptions $false
    ```

> [!NOTE]
> User the **AllowAdHocSubscriptions** flag to control several user capabilities in your organization, including the ability for users to sign up for the Azure Rights Management Service. Changing this flag affects all of these capabilities.

### How can I allow my existing users to sign up for Power BI?

To allow your existing users to sign up for Power BI, run the command listed for the previous question, but pass `$true` instead of `$false` in the last step.

## Administration of Power BI

### How will this change the way I manage identities for users in my organization today?

There are three scenarios that might apply to users in your organization:

* **Scenario 1**: If your organization already has an existing Office 365 environment and all users in your organization have Office 365 accounts, there's no change in how you manage identity.

* **Scenario 2**: If your organization already has an existing Office 365 environment but not all users in your organization have Office 365 accounts, we create a user in the tenant and assign licenses based on the user’s work or school email address.

    As a result, the number of users you're managing at any particular time grows as users in your organization sign up for the service.

* **Scenario 3**: If your organization doesn't have an Office 365 environment connected to your email domain, there's no change in how you manage identity.

    The service adds users to a new, cloud-only user director. Also, you can choose to take over as the tenant admin and manage them.

### How do we manage Power BI?

Power BI provides an admin portal that lets you view usage statistics, provides a link to the Microsoft 365 admin center to manage users and groups, and provides the ability to control tenant-wide settings.

To use the Power BI admin portal, you must mark your account as a **Global Admin** within Office 365 or Azure Active Directory, or you must assign the Power BI service admin role to your user account. For more info, see [Understanding the Power BI admin role](service-admin-role.md) and [Power BI Admin Portal](service-admin-portal.md).

### What is the process to manage a tenant created by Microsoft for my users?

When a self-service user signs up for a cloud service that uses Azure AD, the service adds them to an unmanaged Azure AD directory based on their email domain. You can claim and manage the tenant that someone created using a process known as an *admin takeover*. The type of takeover you do depends on whether there's an existing managed tenant associated with your domain:

* Use an *internal takeover* to create a new managed tenant for the domain.

* Use an *external takeover* to move the domain to an existing managed tenant.

For more info, see [Take over an unmanaged directory as administrator in Azure Active Directory](/azure/active-directory/users-groups-roles/domains-admin-takeover).

When you do an external takeover, the service places Power BI content that was created before the takeover in a [Power BI Archived Workspace](service-admin-power-bi-archived-workspace.md). You must manually migrate any content that you want to use in the new tenant.

### If I have multiple domains, can I control the Office 365 tenant that users get added to?

If you do nothing, the service creates a tenant for each user email domain and subdomain. If you want all users to be in the same tenant regardless of their email address extensions: Create a target tenant ahead of time, or use an existing tenant Then add all the existing domains and subdomains that you want consolidated within that tenant. Every user with email addresses ending in those domains and subdomains automatically join the target tenant when they sign up.

> [!IMPORTANT]
> Once you've created users, there's no supported automated mechanism to move users across tenants. To learn about adding domains to a single Office 365 tenant, see [Add your users and domain to Office 365](/office365/admin/setup/add-domain/).

### How do I remove Power BI for users that already signed up?

If you signed up a user for Power BI, but you no longer want them to use Power BI, you can remove the Power BI license for that user.

1. Go to the [Microsoft 365 admin center](https://admin.microsoft.com/AdminPortal/Home#/homepage).

1. In the left navigation bar, select **Users** > **Active Users**.

1. Find the user you want to remove the license for, then select their name.

    You can perform bulk license management to users as well. To do that, select multiple users and select **Edit product licenses**.

1. On the user details page, next to **Product licenses**, select **Edit**.

1. Depending on what license you applied to their account, set **Power BI (free)** or **Power BI Pro** to **Off**.

1. Select **Save**.

### How do I know when new users have joined my tenant?

Users who have joined your tenant as part of this program get assigned a unique license that you can filter on within your active user pane in the admin dashboard. To create this new view, follow these steps.

1. Navigate to the [Microsoft 365 admin center](https://admin.microsoft.com/AdminPortal/Home#/homepage).

1. In the left navigation bar, select **Users** > **Active Users**.

1. On the **Views** menu, select **Add custom view**.

1. Name your new view, and under **Assigned product license**, select **Power BI (free)** or **Power BI Pro**.

    You can only have one license selected per view. If you have both **Power BI (free)** and **Power BI Pro** licenses in your organization, you can create two views.

1. Enter any other conditions you want, then select **Add**.

1. After you create the new view, it's available from the **Views** menu.

### Are there any additional things I should prepare for?

You might experience an increase in password reset requests. For info about this process, see [Reset a user's password](/office365/admin/add-users/reset-passwords).

You can remove a user from your tenant via the standard process in the Microsoft 365 admin center. However, if the user still has an active email address from your organization, they can rejoin unless you block all users from joining.

### Where is my Power BI tenant located?

For info about which data region your Power BI tenant is in, see [Where is my Power BI tenant located?](service-admin-where-is-my-tenant-located.md).

### What is the Power BI SLA?

For info about the Power BI SLA (Service Level Agreement), see the [Licensing Terms and Documentation](http://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=37) article in the **Licensing** section of the Microsoft Licensing website.

### How does Power BI handle high availability and failover?

For info about high availability and failover, see [Power BI high availability, failover, and disaster recovery FAQ](service-admin-failover.md).

## Security in Power BI

### Does Power BI meet national, regional, and industry-specific compliance requirements?

To learn more about Power BI compliance, see the [Microsoft Trust Center](https://www.microsoft.com/TrustCenter/CloudServices/business-application-platform/default.aspx).

### How does security work in Power BI?

Microsoft built Power BI on the foundation of Office 365, which in turn builds on Azure services like Azure Active Directory. For an overview of Power BI architecture, see [Power BI Security](service-admin-power-bi-security.md).

## Next steps

[Power BI admin portal](service-admin-portal.md)  
[Understanding the Power BI admin role](service-admin-role.md)  
[Self-service sign up for Power BI](service-self-service-signup-for-power-bi.md)  
[Purchasing Power BI Pro](service-admin-purchasing-power-bi-pro.md)  
[What is Power BI Premium?](service-premium-what-is.md)  
[How to buy Power BI Premium](service-admin-premium-purchase.md)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  
[Manage your group in Power BI and Office 365](service-manage-app-workspace-in-power-bi-and-office-365.md)  
[Office 365 user account management](/office365/servicedescriptions/office-365-platform-service-description/user-account-management/)  
[Office 365 group management](/office365/admin/email/create-edit-or-delete-a-security-group/)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

[1]: https://docs.microsoft.com/powershell/scripting/overview