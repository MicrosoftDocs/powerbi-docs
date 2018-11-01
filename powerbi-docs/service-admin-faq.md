---
title: Administering Power BI - frequently asked questions (FAQ)
description: Learn the answers to frequently asked questions on Power BI signup, tenant management, and other administrative tasks.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 11/28/2017
ms.author: mblythe

LocalizationGroup: Administration
---
# Administering Power BI - frequently asked questions (FAQ)

This article addresses frequently asked questions for Power BI administration. For an overview of the Power BI administration, see [What is Power BI administration?](service-admin-administering-power-bi-in-your-organization.md).

## What's in this article
**Sign up for Power BI**

* [How do users sign up for Power BI?](#how-do-users-sign-up-for-power-bi)
* [How do individual users in my organization sign up?](#how-do-individual-users-in-my-organization-sign-up)
* [How can I prevent users from joining my existing Office 365 tenant?](#how-can-i-prevent-users-from-joining-my-existing-office-365-tenant)
* [How can I allow users to join my existing Office 365 tenant?](#how-can-i-allow-users-to-join-my-existing-office-365-tenant)
* [How do I verify if I have the block on in the tenant?](#how-do-i-verify-if-i-have-the-block-on-in-the-tenant)
* [How can I prevent my existing users from starting to use Power BI?](#how-can-i-prevent-my-existing-users-from-starting-to-use-power-bi)
* [How can I allow my existing users to sign up for Power BI?](#how-can-i-allow-my-existing-users-to-sign-up-for-power-bi)

**Administration of Power BI**

* [How will this change the way I manage identities for users in my organization today?](#how-will-this-change-the-way-i-manage-identities-for-users-in-my-organization-today)
* [How do we manage Power BI?](#how-do-we-manage-power-bi)
* [What is the process to manage a tenant created by Microsoft for my users?](#what-is-the-process-to-manage-a-tenant-created-by-Microsoft-for-my-users)
* [If I have multiple domains, can I control the Office 365 tenant that users are added to?](#if-i-have-multiple-domains-can-i-control-the-office-365-tenant-that-users-are-added-to)
* [How do I remove Power BI for users that already signed up?](#how-do-i-remove-power-bi-for-users-that-already-signed-up)
* [How do I know when new users have joined my tenant?](#how-do-i-know-when-new-users-have-joined-my-tenant)
* [Are there any additional things I should be prepared for?](#are-there-any-additional-things-i-should-be-prepared-for)
* [Where is my Power BI tenant located?](#where-is-my-power-bi-tenant-located)
* [What is the Power BI SLA (Service Level Agreement)?](#what-is-the-power-bi-sla)

**Security in Power BI**

* [Does Power BI meet national, regional, and industry-specific compliance requirements?](#does-power-bi-meet-national-regional-and-industry-specific-compliance-requirements)
* [How does security work in Power BI?](#how-does-security-work-in-power-bi)

## Sign up for Power BI
### How do users sign up for Power BI?
You can sign up for Power BI through the [Power BI web site](https://powerbi.microsoft.com). You can also sign up through the purchase services page on the Office 365 admin center. When an administrator signs up for Power BI, they can assign user licenses to users who should have access.

Additionally, individual users in your organization may be able to sign up for Power BI through the [Power BI web site](https://powerbi.microsoft.com). When a user in your organization signs up for Power BI, that user is assigned a Power BI license automatically. [Learn more](service-self-service-signup-for-power-bi.md)

### How do individual users in my organization sign up?
There are three scenarios that might apply to users in your organization:

Scenario 1: Your organization already has an existing Office 365 environment and the user signing up for Power BI already has an Office 365 account.
In this scenario, if a user already has a work or school account in the tenant (for example, contoso.com) but does not yet have Power BI, Microsoft will simply activate the plan for that account, and the user will automatically be notified of how to use the Power BI service.

Scenario 2: Your organization has an existing Office 365 environment and the user signing up for Power BI doesn’t have an Office 365 account.
In this scenario, the user has an email address in your organization’s domain (for example, contoso.com) but does not yet have an Office 365 account. In this case, the user can sign up for Power BI and will automatically be given an account. This lets the user access the Power BI service. For example, if an employee named Nancy uses her work email address (for example, Nancy@contoso.com) to sign up, Microsoft will automatically add Nancy as a user in Contoso’s Office 365 environment and activate Power BI for that account.

Scenario 3: Your organization does not have an Office 365 environment connected to your email domain.
There are no administrative actions your organization needs to take to take advantage of Power BI. Users will be added to a new, cloud-only user directory, and you will have the option to elect to take over as the tenant admin and manage them.

> [!IMPORTANT]
> If your organization has multiple email domains and you prefer all email address extensions to be in the same tenant, add all email address domains to an Azure Active Directory tenant before any users sign up. There is no automated mechanism to move users across tenants after they have been created. For more information on this process, see [If I have multiple domains, can I control the Office 365 tenant that users are added to?](#if-i-have-multiple-domains-can-i-control-the-office-365-tenant-that-users-are-added-to) later in this article and [Add your domain to Office 365](https://support.office.com/article/Add-your-users-and-domain-to-Office-365-6383f56d-3d09-4dcb-9b41-b5f5a5efd611) online.
> 
> 

### How can I prevent users from joining my existing Office 365 tenant?
There are steps you can take, as an admin, to prevent users from joining your existing Office 365 tenant. If you do block this, users’ attempts to sign up will fail and they will be directed to contact their organization’s admin. You do not need to repeat this process if you have already disabled automatic license distribution (e.g. Office 365 for Education for Students, Faculty, and Staff).

These steps require the use of Windows PowerShell. To get started with Windows PowerShell, see the [PowerShell getting started guide](http://go.microsoft.com/fwlink/p/?LinkID=286814).

To perform the following steps, you must install the latest 64-bit version of the [Azure Active Directory Module for Windows PowerShell](http://go.microsoft.com/fwlink/p/?LinkID=236297).

After you select the link, select **Run** to run the installer package.

**Disable automatic tenant join**: Use this Windows PowerShell command to prevent new users from joining a managed tenant:

* To disable automatic tenant join for new users:
  
    $msolcred = get-credential
    connect-msolservice -credential $msolcred
  
    Set-MsolCompanySettings -AllowEmailVerifiedUsers $false
* To enable automatic tenant join for new users:
  
    $msolcred = get-credential
    connect-msolservice -credential $msolcred
  
    Set-MsolCompanySettings -AllowEmailVerifiedUsers $true

> [!NOTE]
> This blocking prevents new users in your organization from signing up for Power BI. Users that sign up for Power BI prior to disabling new signups for your organization will still retain their licenses. See the [How Can I Remove Licenses?] section for instructions on how you can remove access to Power BI for users that had previously signed up for the service.
> 
> 

### How can I allow users to join my existing Office 365 tenant?
To allow users to join your tenant, run the opposite command as described in the question above.

To perform the following steps, you must install the latest 64-bit version of the [Azure Active Directory Module for Windows PowerShell](http://go.microsoft.com/fwlink/p/?LinkID=236297).

    $msolcred = get-credential
    connect-msolservice -credential $msolcred

    Set-MsolCompanySettings -AllowEmailVerifiedUsers $true

### How do I verify if I have the block on in the tenant?
Use the following PowerShell script.

To perform the following steps, you must install the latest 64-bit version of the [Azure Active Directory Module for Windows PowerShell](http://go.microsoft.com/fwlink/p/?LinkID=236297).

    $msolcred = get-credential
    connect-msolservice -credential $msolcred

    Get-MsolCompanyInformation | fl allow*

### How can I prevent my existing users from starting to use Power BI?
There are steps you can take, as an admin, to prevent users from signing up for Power BI. If you do block this, users’ attempts to sign up will fail and they will be directed to contact their organization’s admin. You do not need to repeat this process if you have already disabled automatic license distribution (e.g. Office 365 for Education for Students, Faculty, and Staff). [Learn more](service-admin-licensing-organization.md#enable-or-disable-individual-user-sign-up-in-azure-active-directory)

The AAD setting that controls this is **AllowAdHocSubscriptions**. Most tenants will have this setting set to true, which means it is enabled. If you acquired Power BI through a partner, this may be set to false by default, which means it is disabled.

To perform the following steps, you must install the latest 64-bit version of the [Azure Active Directory Module for Windows PowerShell](http://go.microsoft.com/fwlink/p/?LinkID=236297).

1. You need to first sign into Azure Active Directory using your Office 365 credential. The first line will prompt you for your credentials. The second line connects to Azure Active Directory.
   
     $msolcred = get-credential
     connect-msolservice -credential $msolcred
2. Once you are signed in, you can issue the following command to see what your tenant is currently configured for.
   
     Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
3. You can this command to enable ($true) or disable ($false) AllowAdHocSubscriptions.
   
     Set-MsolCompanySettings -AllowAdHocSubscriptions $true

> [!NOTE]
> The AllowAdHocSubscriptions flag is used to control several user capabilities in your organization, including the ability for users to sign up for the Azure Rights Management Service. Changing this flag will affect all of these capabilities.
> 
> 

### How can I allow my existing users to sign up for Power BI?
To allow your existing users to sign up for Power BI, run the command listed for the above question, but pass true instead of false.

To perform the following steps, you must install the latest 64-bit version of the [Azure Active Directory Module for Windows PowerShell](http://go.microsoft.com/fwlink/p/?LinkID=236297).

1. You need to first sign into Azure Active Directory using your Office 365 credential. The first line will prompt you for your credentials. The second line connects to Azure Active Directory.
   
     $msolcred = get-credential
     connect-msolservice -credential $msolcred
2. Once you are signed in, you can issue the following command to see what your tenant is currently configured for.
   
     Get-MsolCompanyInformation | fl AllowAdHocSubscriptions
3. You can this command to enable ($true) or disable ($false) AllowAdHocSubscriptions.
   
     Set-MsolCompanySettings -AllowAdHocSubscriptions $true

> [!NOTE]
> The AllowAdHocSubscriptions flag is used to control several user capabilities in your organization, including the ability for users to sign up for the Azure Rights Management Service. Changing this flag will affect all of these capabilities.
> 
> 

## Administration of Power BI
### How will this change the way I manage identities for users in my organization today?
If your organization already has an existing Office 365 environment and all users in your organization have Office 365 accounts, identity management will not change.

If your organization already has an existing Office 365 environment but not all users in your organization have Office 365 accounts, we will create a user in the tenant and assign licenses based on the user’s work, or school, email address. This means that the number of users you are managing at any particular time will grow as users in your organization sign up for the service.

If your organization does not have an Office 365 environment connected to your email domain, there will be no change in how you manage identity. Users will be added to a new, cloud-only user directory, and you will have the option to elect to take over as the tenant admin and manage them.

### How do we manage Power BI?
Power BI provides an admin portal that allows you to view usage statistics, provides a link to the Office 365 admin center to manage users and groups, and the ability to control tenant wide settings. 

> [!NOTE]
> Your account needs to be marked as a **Global Admin**, within Office 365 or Azure Active Directory, or have been assigned the Power BI service administrator role, to get access to the Power BI admin portal. For more information about the Power BI service administrator role, see [Understanding the Power BI admin role](service-admin-role.md).
> 
> 

For more information, see [Power BI Admin Portal](service-admin-portal.md).

### What is the process to manage a tenant created by Microsoft for my users?
If a tenant was created by Microsoft, you can claim and manage that tenant by following these steps:

1. Join the tenant, by signing up for Power BI, using an email address domain that matches the tenant domain you want to manage. For example, if Microsoft created the contoso.com tenant, you will need to join the tenant with an email address ending with @contoso.com.
2. Claim admin control by verifying domain ownership: once you are in the tenant, you can promote yourself to a *Global Admin* role by verifying domain ownership. To do so, follow these steps:
   
   1. Go to [https://portal.office.com](https://portal.office.com).
   2. Select the app launcher icon in the upper-left and choose **Admin**.
   3. Read the instructions on the **Become the admin** page and then choose **Yes, I want to be the admin**.
      
      > [!NOTE]
      > If this option doesn’t appear, there is already an Office 365 administrator in place.
      > 
      > 

### If I have multiple domains, can I control the Office 365 tenant that users are added to?
If you do nothing, a tenant will be created for each user email domain and subdomain.

If you want all users to be in the same tenant regardless of their email address extensions:

* Create a target tenant ahead of time, or use an existing tenant, and add all the existing domains and subdomains that you want consolidated within that tenant. Then all the users with email addresses ending in those domains and subdomains will automatically join the target tenant when they sign up.

> [!IMPORTANT]
> There is no supported automated mechanism to move users across tenants once they have been created. To learn about adding domains to a single Office 365 tenant, see [Add your users and domain to Office 365](https://support.office.com/article/Add-your-users-and-domain-to-Office-365-6383f56d-3d09-4dcb-9b41-b5f5a5efd611).
> 
> 

### How do I remove Power BI for users that already signed up?
If a user signed up for Power BI, but you no longer want them to have access to Power BI, you can remove the Power BI license for that user.

1. Navigate to the Office 365 admin center.
2. In the left navigation bar, select **Users** > **Active Users**.
3. Find the user you want to remove the license for, then select their name > **Edit**.
4. On the user details page, select **Licenses** in the left navigation bar.
5. Uncheck **Power BI (free)**, or **Power BI Pro**, depending on what license is applied to their account.
6. Select **Save**.

> [!NOTE]
> You can perform bulk license management to users as well. To do that, select multiple users and select **Edit**.
> 
> 

### How do I know when new users have joined my tenant?
Users who have joined your tenant as part of this program are assigned a unique license that you can filter on within your active user pane in the admin dashboard.

To create this new view, in the Office 365 admin center, go to **Users** > **Active Users**, and on the **Select a View** menu, select **New View**. Name your new view, and under **Assigned license**, select **Power BI (free)** or **Power BI Pro**. You can only have one license selected per view. If you have both **Power BI (free)** and **Power BI Pro** licenses in your organization, you would need to create two views. Once the new view has been created, you will be able to see all the users in your tenant who have enrolled in this program.

### Are there any additional things I should be prepared for?
You might experience an increase in password reset requests. For information about this process, see [Reset a user's password](https://support.office.com/article/Reset-a-users-password-7a5d073b-7fae-4aa5-8f96-9ecd041aba9c).

You can remove a user from your tenant via the standard process in the Office 365 admin center. However, if the user still has an active email address from your organization, they will be able to rejoin unless you block all users from joining.

### Where is my Power BI tenant located?
To learn how to find where your Power BI tenant is located, also known as a data region, see [Where is my Power BI tenant located?](service-admin-where-is-my-tenant-located.md)

### What is the Power BI SLA?
For information about the Power BI SLA (Service Level Agreement), consult the [Licensing Terms and Documentation](http://www.microsoftvolumelicensing.com/DocumentSearch.aspx?Mode=3&DocumentTypeId=37) article in the **Licensing** section of the Microsoft Licensing website.

## Security in Power BI
### Does Power BI meet national, regional, and industry-specific compliance requirements?
To learn more about Power BI compliance, see the [Microsoft Trust Center](http://go.microsoft.com/fwlink/?LinkId=785324).

### How does security work in Power BI?
Power BI is built on the foundation of Office 365, which in turn builds on Azure services like Azure Active Directory. For an overview of Power BI architecture, see [Power BI Security](service-admin-power-bi-security.md). 

## Next steps
[Power BI admin portal](service-admin-portal.md)  
[Understanding the Power BI admin role](service-admin-role.md)  
[Self-service sign up for Power BI](service-self-service-signup-for-power-bi.md)  
[Purchasing Power BI Pro](service-admin-purchasing-power-bi-pro.md)  
[What is Power BI Premium?](service-premium.md)  
[How to purchase Power BI Premium](service-admin-premium-purchase.md)  
[Office 365 user account management](https://technet.microsoft.com/library/office-365-user-account-management.aspx)  
[Office 365 group management](https://support.office.com/Article/Find-help-about-Groups-in-Office-365-7a9b321f-b76a-4d53-b98b-a2b0b7946de1)  
[Manage your group in Power BI and Office 365](service-manage-app-workspace-in-power-bi-and-office-365.md)  
[Power BI Premium whitepaper](https://aka.ms/pbipremiumwhitepaper)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)