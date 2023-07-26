---
title: Understanding Power BI administration roles
description: This article describes the Fabric administrator and the specific roles that provide administrator privileges in Power BI.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 07/23/2023
LocalizationGroup: Administration
---

# Understanding Power BI administration roles

> [!IMPORTANT]
> The **Power BI administrator** role has been renamed. The new name of the role is **Fabric administrator**.

To administer Power BI for your organization, you must be in one of the following roles: Fabric administrator, Power Platform administrator, or global administrator. Microsoft 365 user administrators assign users to the Fabric administrator or Power Platform administrator roles in the Microsoft 365 admin center, or by using a PowerShell script. For more information, see [Assign roles to user accounts with PowerShell](/office365/enterprise/powershell/assign-roles-to-user-accounts-with-office-365-powershell).

Users in Fabric administrator and Power Platform administrator roles have full control over org-wide Power BI settings and administrative features, except for licensing. Once a user is assigned an administrator role, they can access the [Fabric admin portal](service-admin-portal.md). There, they have access to org-wide usage metrics and can control org-wide usage of Power BI features. These admin roles are ideal for users who need access to the Fabric admin portal without also granting those users full Microsoft 365 administrative access.

> [!NOTE]
> In the Power BI documentation, *Fabric administrator* refers to users in either the Fabric administrator or Power Platform administrator roles. The documentation makes it clear when the global administrator role is required for a task.

## Considerations and limitations

The Fabric administrator and Power Platform administrator roles don't provide the following capabilities:

* Ability to modify users and licenses within the Microsoft 365 admin center.

* Access to the audit logs. For more information, see [Track user activities in Power BI](service-admin-auditing.md).

These capabilities require Microsoft 365 admin role assignments.

## Assign users to an admin role in the Microsoft 365 admin center

To assign users to an admin role in the Microsoft 365 admin center, follow these steps.

1. In the [Microsoft 365 admin center](https://portal.office.com/adminportal/home#/homepage), select **Users** > **Active Users**.

    ![Microsoft 365 admin center](media/service-admin-role/powerbi-admin-users.png)

1. Select the user that you want to assign the role to.

1. Under **Roles**, select **Manage roles**.

    ![Manage roles](media/service-admin-role/powerbi-admin-edit-roles.png)

1. Expand **Show all by category**, then select **Fabric administrator** or **Power Platform administrator**.

    :::image type="content" source="./media/service-admin-role/powerbi-admin-role.png" alt-text="Screenshot of admin role selection in Microsoft 365 admin portal.":::

1. Select **Save changes**.

## Assign users to the admin role with PowerShell

You can also assign users to roles by using PowerShell. Users are managed in Azure Active Directory (Azure AD). If you don't already have the Azure AD PowerShell module, [download and install the latest version](https://www.powershellgallery.com/packages/AzureAD/).

1. Connect to Azure AD:
   ```powershell
   Connect-AzureAD
   ```

1. Get the **ObjectId** for the Fabric administrator role. You can run [Get-AzureADDirectoryRole](/powershell/module/azuread/get-azureaddirectoryrole) to get the **ObjectId**.

    ```powershell
    Get-AzureADDirectoryRole
    ```
    
    ```output
    ObjectId                             DisplayName                                Description
    --------                             -----------                                -----------
    6ebd1a24-c502-446f-94e5-fa2997fd26c3 Fabric Administrator                       Manages all aspects of Microsoft Fabric.
    70fd9723-a627-48ef-8b2c-82c22b65211e SharePoint Administrator                   Can manage all aspects of the SharePoint service.
    727aeffc-89db-4d43-a680-8b36f56b38c5 Windows Update Deployment Administrator    Can create and manage all aspects of Windows Update deployments through the Windows Update for Business deployment service.
    7297504b-c536-41f6-af7c-d742d59b2541 Security Operator                          Creates and manages security events.
    738e1e1e-f7ec-4d99-b6b4-1c190d880b4d Application Administrator                  Can create and manage all aspects of app registrations and enterprise apps.
    782450d2-5aae-468e-a4fb-1103e1be6833 Service Support Administrator              Can read service health information and manage support tickets.
    80f7e906-2e72-4db0-bd50-3b40545685a5 Attribute Assignment Administrator         Assign custom security attribute keys and values to supported Azure AD objects.
    831d152c-42b8-4dc9-826e-42f8419afc9c Partner Tier2 Support                      Do not use - not intended for general use.
    ```

    In this case, the role's **ObjectId** is 6ebd1a24-c502-446f-94e5-fa2997fd26c3.

1. Next, get the user's **ObjectId**. You can find that by running [Get-AzureADUser](/powershell/module/azuread/get-azureaduser).

    ```powershell
    Get-AzureADUser -ObjectId 'tim@contoso.com'
    ```
    
    ```output
    ObjectId                             DisplayName UserPrincipalName      UserType
    --------                             ----------- -----------------      --------
    6a2bfca2-98ba-413a-be61-6e4bbb8b8a4c Tim         tim@contoso.com        Member
    ```

1. To add the member to the role, run [Add-AzureADDirectoryRoleMember](/powershell/module/azuread/add-azureaddirectoryrolemember).

    | Parameter | Description |
    | --- | --- |
    | ObjectId |The Role ObjectId. |
    | RefObjectId |The members ObjectId. |

    ```powershell
    Add-AzureADDirectoryRoleMember -ObjectId 6ebd1a24-c502-446f-94e5-fa2997fd26c3 -RefObjectId 6a2bfca2-98ba-413a-be61-6e4bbb8b8a4c
    ```
To learn more about using PowerShell to assign admin roles, see [AzureAD Directory Roles](/powershell/module/azuread/#directory-roles).

## Next steps

[Administering Power BI in your organization](service-admin-administering-power-bi-in-your-organization.md)  
[Fabric admin portal](service-admin-portal.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
