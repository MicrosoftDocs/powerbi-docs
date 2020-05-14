---
title: Organizational visuals
description: This article describes admin organizational visual capabilities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 05/11/2020
---

# Manage Power BI visuals admin settings

As a Power BI admin, you can deploy and manage [Power BI visuals inside your organization](power-bi-custom-visuals-organization.md). Organizational visuals, let you easily deploy proprietary visuals in your organization. Report authors can then discover and import these visuals into their reports.

To manage Power BI visuals, you must be a Global Admin in Office 365, or have been assigned the Power BI service administrator role. For more information about the Power BI service administrator role, see [Understanding the Power BI admin role](../../service-admin-role.md).

## Access the admin portal

To enable the settings described in the article, you'll need to access the admin portal.

1. In Power BI service, select **Settings**.

2. From the settings drop-down menu, select **Admin portal**.

    ![Power BI visuals form](media/organizational-visuals/admin-portal.png)

## Power BI visuals tenant settings

As a Power BI admin for your organization, you can control which type of Power BI visuals users will be able to access across the organization.

The UI tenant settings only affect Power BI service. If you want these settings to take effect in Power BI Desktop, use group policies. The last step in each section provides details for enabling that setting in Power BI Desktop.

>[!NOTE]
>Changes to tenant settings do not affect Power BI visuals listed in the [organizational visuals](#organizational-visuals) tab.

### Visuals from AppSource or a file

Manage organizational access for the following type of Power BI visuals:

* Visuals created by developers and saved as a .pbiviz file.

* Visuals available from AppSource.

Follow the instructions below to enable users in your organization upload .pbiviz files, and add visuals from AppSource to their visualization pane.

1. Expand the **Allow visuals created using the Power BI SDK** settings.

2. Click **Enabled**.

3. Choose who can upload .pbiviz and AppSource visuals:

    * Select **The entire organization** option to allow everyone in your organization to upload .pbiviz files, and add visuals from AppSource.

     * Select the **Specific security groups** option to manage uploading .pbiviz files, and adding visuals from AppSource using security groups. Add the security groups you want to manage to the *Enter security groups* text bar. The security groups you specified are excluded by default. If you want to include these security groups and exclude everyone else in the organization, select the **Except specific security groups** option.

4. Click **Apply**.

![visuals from file or AppSource](media/organizational-visuals/tenant-settings.png)

5. (Optional) Enable this setting for Power BI Desktop

    UI changes to tenant settings apply only to Power BI service. Use [Azure AD Group Policy](https://docs.microsoft.com/azure/active-directory-domain-services/manage-group-policy) to apply these settings to Power BI Desktop.

    |Key  |Attribute  |Value  |
    |---------|---------|---------|
    |Software\Policies\Microsoft\Power BI Desktop\    |EnableUncertifiedVisuals    |0 - Disable </br>1 - Enable (default)         |
    |

### Certified Power BI visuals

When this setting is enabled, users in your organization will only be able to add [certified Power BI visuals](power-bi-custom-visuals-certified.md) from AppSource, to their visualization pane. Power BI visuals that are not certified, will not display on AppSource.

1. From the admin portal, select **Add and use certified visuals only**.

2. Click **Enabled**.

3. Click **Apply**.

![certified visuals](media/organizational-visuals/certified-visuals.png)

4. (Optional) Enable this setting for Power BI Desktop

    UI changes to tenant settings apply only to Power BI service. Use [Azure AD Group Policy](https://docs.microsoft.com/azure/active-directory-domain-services/manage-group-policy) to apply these settings to Power BI Desktop.

    |Key  |Attribute  |Value  |
    |---------|---------|---------|
    |Software\Policies\Microsoft\Power BI Desktop\    |EnableUncertifiedVisuals    |0 - Disable </br>1 - Enable (default)         |
    |

## Organizational visuals

As a Power BI admin, you can manage which .pbiviz and AppSource visuals are available out-of-the-box in your organization. In the *Admin portal*, use the **Organizational visuals** tab to manage the organizational visuals list. Visuals on the list will automatically show on the visualization pane of all the users in your organization.

After any update or administrator change, Power BI Desktop users should restart the application or refresh the browser running Power BI service, to see the updates.

### Add a visual from a file

Use this method to add a new Power BI visual from a .pbiviz file.

> [!WARNING]
> A Power BI visual uploaded from a file, could contain code with security or privacy risks; make sure you trust the author and the source of the visual, before deploying to the organization's repository.

1. Select **Add visual** > **From a file**.

    ![add visuals form file](media/organizational-visuals/add-from-file.png)

2. Fill in the following fields:

    * **Choose a .pbiviz file** - Select a visual file to upload.

    * **Name your visual** - Give a short title to the visual, so that Power BI Desktop users can easily understand what it does.

    * **Icon** - Upload an icon file to be displayed in the visualization pane.

    * **Description** - Provide a short description of the visual to give more context for the user.

    * **Access** - Lets users in the organization access this visual. This setting is enabled by default.

    ![Power BI visuals form](media/organizational-visuals/add-visual.png)

3. To initiate the upload request, select **Add** . Once uploaded, the visual will display in the organizational visuals list.

### Add a visual from AppSource (preview)

Use this method to add a new Power BI visual from AppSource.

AppSource Power BI visuals are automatically updated. Users in your organization will always have the latest version of the visual.

1. Select **Add visual** > **From AppSource**.

    ![add visuals form AppSource](media/organizational-visuals/add-from-AppSource.png)

2. In the **Power BI visuals** window, find the AppSource visual you want to add, and click **Add**. Once uploaded, the visual will display in the organizational visuals list.

### Delete a visual uploaded from a file

To permanently delete a visual, select the trash bin icon for the visual in the repository.

> [!IMPORTANT]
> Deletion is irreversible. Once deleted, the visual immediately stops rendering in existing reports. Even if you upload the same visual again, it won't replace the one that was deleted. However, users can import the new visual again and replace the instance they have in their reports.

### Disable a visual

To disable the visual from the organizational store, select the gear icon. In the **Access** section, disable the visual.

After you disable the visual, the visual won't render in existing reports, and it displays the following error message:

*This custom visual is no longer available. Please contact your administrator for details.*

>[!NOTE]
>Visuals that are bookmarked carry on working after they've been disabled.

### Update a visual

To update the visual from the organizational store, select the gear icon. Browse and upload a new version of the visual.

Make sure the Visual ID remains unchanged. The new file replaces the previous file for all the reports throughout the organization. However, if the new version of the visual might break any usage or data structure of the previous version of the visual, then do not replace the previous version. Instead, you should create a new listing for the new version of the visual. For example, add a new version number (version X.X) to the title of the new listed visual. This way it is clear that it is the same visual just with an updated version number, so existing reports do not break their functionality. Again, make sure the Visual ID remains unchanged. Then the next time users enter the organization repository from Power BI Desktop, they can import the new version, which prompts them to replace the current version that they have in the report.

For more information, visit [Frequently asked questions about organizational Power BI visuals](power-bi-custom-visuals-faq.md#organizational-power-bi-visuals)

## Next steps

> [!div class="nextstepaction"]
>[Administering Power BI in the admin portal](../../admin/service-admin-portal.md)

> [!div class="nextstepaction"]
>[Visuals in Power BI](power-bi-custom-visuals.md)

> [!div class="nextstepaction"]
>[Organizational visuals in Power BI](power-bi-custom-visuals-organization.md)