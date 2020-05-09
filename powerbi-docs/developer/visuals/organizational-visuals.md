---
title: Organizational visuals
description: This article describes admin organizational visual capabilities.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 05/07/2020
---

As a Power BI admin, you can deploy and manage [Power BI visuals inside your organization](power-bi-custom-visuals-organization.md). With organizational visuals, you can easily deploy proprietary visuals in your organization, which report authors can then discover and import into their reports from Power BI Desktop.

To manage Power BI visuals, you must be a Global Admin in Office 365, or have been assigned the Power BI service administrator role. For more information about the Power BI service administrator role, see [Understanding the Power BI admin role](../../service-admin-role.md).

## Access the admin portal

To enable the settings in the article you'll need to access the admin portal.

1. In Power BI service, select **Settings**.

2. From the settings drop-down menu, select **Admin portal**.

    ![Power BI visuals form](media/organizational-visuals/admin-portal.png)

## Power BI visuals tenant settings

As a Power BI admin for your organization, you can control which type of Power BI visuals users will be able to access across the organization.

### Power BI visuals from a AppSource or a file

Power BI visuals created by developers and saved in as a .pbiz file.

### Certified Power BI visuals

You can manage the access to Power BI visuals in AppSource that have been [certified](power-bi-custom-visuals-certified.md). When this setting is enabled, users in the organization will only have access to 

1. From the admin portal, select **Tenant settings**.

2. 

...tenant settings...

Managing AppSource visuals through organizational store
The visuals will continue to be updated automatically
If they are certified they will maintain certification

Admin can add new default visuals to the entire organization



## Organizational visuals

To access the Power BI organizational visuals tab, in the Admin portal, do the following:

1. In Power BI service, select **Settings**.

2. From the settings drop-down menu, select **Admin portal**.

3. From the admin portal list, select **Organizational visuals**.

### Add a visual from a file

Use this method to add a new Power BI visual from a file.

> [!WARNING]
> A Power BI visual uploaded from a file, could contain code with security or privacy risks; make sure you trust the author and the source of the visual, before deploying to the organization's repository.

1. From the admin portal list, select **Organizational visuals**.

2. In the right pane, select **Add an organizational visual**.

    ![Power BI visuals form](media/organizational-visuals/power-bi-custom-visuals-organizational-admin-02.png)

3. Fill in the **Add Visual** form:

    * **Choose a .pbiviz file**
    
         Select a visual file to upload. Only versioned API Power BI visuals are supported (read here what this means).
    
        >[!NOTE]
        >Before you upload a visual from a file, you should review that visual for security and privacy to make sure it fits your organization's standards.

    * **Name your visual**
    
        Give a short title to the visual, so that Power BI Desktop users can easily understand what it does.

    * **Icon**

        Upload an icon file to be displayed in the Power BI Desktop UI.

    * **Description**
    
        Provide a short description of the visual to give more context for the user.

    * **Access**

        Enables users in the organization to access this visual. Enabled by default.

4. Select **Add** to initiate the upload request. Once uploaded, the visual will display in the organizational visuals list.

### Delete a visual uploaded from a file

To permanently delete a visual, select the trash bin icon for the visual in the repository.

> [!IMPORTANT]
> Deletion is irreversible. Once deleted, the visual immediately stops rendering in existing reports. Even if you upload the same visual again, it won't replace the one that was deleted. However, users can import the new visual again and replace the instance they have in their reports.

### Disable a visual

To disable the visual from the organizational store, select the gear icon. In the **Access** section, disable the custom visual.

After you disable the visual, the visual won't render in existing reports, and it displays the error message below.

*This custom visual is no longer available. Please contact your administrator for details.*

However, visuals that are bookmarked still work.

After any update or administrator change, Power BI Desktop users should restart the application or refresh the browser in the Power BI service to see the updates.

### Update a visual

To update the visual from the organizational store, select the gear icon. Browse and upload a new version of the visual.

Make sure the Visual ID remains unchanged. The new file replaces the previous file for all the reports throughout the organization. However, if the new version of the visual might break any usage or data structure of the previous version of the visual, then do not replace the previous version. Instead, you should create a new listing for the new version of the visual. For example, add a new version number (version X.X) to the title of the new listed visual. This way it is clear that it is the same visual just with an updated version number, so existing reports do not break their functionality. Again, make sure the Visual ID remains unchanged. Then the next time users enter the organization repository from Power BI Desktop, they can import the new version, which prompts them to replace the current version that they have in the report.

For more information, visit [Frequently asked questions about organizational Power BI visuals](developer/visuals/power-bi-custom-visuals-faq.md#organizational-power-bi-visuals)

## Power BI visuals settings

### Add and use Power BI visuals

Users in the organization can interact with and share Power BI visuals. [Learn more](developer/visuals/power-bi-custom-visuals.md)

> [!NOTE]
> This setting can be applied to the entire organization or can be limited to specific groups.

Power BI Desktop (starting from March '19 release) supports using **Group Policy** to disable the usage of Power BI visuals across an organization's deployed computers.

<table>
<tr><th>Attribute</th><th>Value</th>
</tr>
<td>key</td>
    <td>Software\Policies\Microsoft\Power BI Desktop\</td>
<tr>
<td>valueName</td>
<td>EnableCustomVisuals</td>
</tr>
</table>

A value of 1 (decimal) enables the use of Power BI visuals in Power BI (This is the default).

A value of 0 (decimal) disable the use of Power BI visuals in Power BI.

### Allow only certified visuals

Users in the organization who have been granted permissions to add and use Power BI visuals, denoted by the setting "Add and use Power BI visuals", will only be able to use [certified Power BI visuals](https://go.microsoft.com/fwlink/?linkid=2002010) (uncertified visuals will be blocked and will display an error message when used). 


Power BI Desktop (starting from March '19 release) supports using **Group Policy** to disable the usage of uncertified Power BI visuals across an organization's deployed computers.

<table>
<tr><th>Attribute</th><th>Value</th>
</tr>
<td>key</td>
    <td>Software\Policies\Microsoft\Power BI Desktop\</td>
<tr>
<td>valueName</td>
<td>EnableUncertifiedVisuals</td>
</tr>
</table>

A value of 1 (decimal) enables the use of uncertified Power BI visuals in Power BI (This is the default).

A value of 0 (decimal) disable the use of uncertified Power BI visuals in Power BI (This option enables only the use of [certified Power BI visuals](https://go.microsoft.com/fwlink/?linkid=2002010)).