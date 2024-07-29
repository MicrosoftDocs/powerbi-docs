---
title: Power BI Desktop OneDrive and SharePoint integration
description: Learn how to open, save, and share Power BI files to OneDrive for Business and SharePoint.
author: lafaberMSFT
ms.author: lafaber
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/14/2023
LocalizationGroup: Create reports
---
# Power BI Desktop OneDrive and SharePoint integration

Work seamlessly in Power BI Desktop with the ability to open, save, and share files to OneDrive for Business and SharePoint. These new capabilities help you with file versioning, collaborating with other authors, and ensuring a backup file is always available in the cloud. 

> [!NOTE]
> This is public preview documentation and some capabilities may not be available in your tenant. 

## Enable sharing links to Power BI files in OneDrive and SharePoint

> [!NOTE]
> Sharing from Power BI Desktop is **enabled by default**. Individual users can opt out of the OneDrive and SharePoint save and share capabilities in the Power BI Desktop options menu. 

Admins can [**disable** sharing through the Admin portal](/fabric/admin/service-admin-portal-integration#users-can-share-links-to-power-bi-files-stored-in-onedrive-and-sharepoint-through-power-bi-desktop).

## How to enable Power BI Desktop and SharePoint integrations

The ability to open, save, and share files from OneDrive and SharePoint directly in Power BI Desktop is now **enabled by default**. 

If you'd like to disable the preview for opening, saving, and sharing Power BI files to OneDrive and SharePoint in Power BI Desktop, uncheck the **Save to OneDrive and SharePoint** and **Share to OneDrive and SharePoint** options by selecting the file tab **Options and settings > Options > Preview features**.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-preview-settings.png" alt-text="Screenshot of settings to turn on preview features." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-preview-settings.png":::

After saving your preference, restart Power BI Desktop. If the capability is turned on, you see a **Share** button at the top right of Power BI Desktop. 

**Sharing** files stored in OneDrive and SharePoint directly from Power BI Desktop only works when **both** of the following two statements are true:

-	Users have not turned off the sharing preview feature in Power BI Desktop.
-	The Admin tenant setting is enabled (the setting is **enabled by default** and requires that admins disable it for it to be turned off).   

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-share-button-plain.png" alt-text="Screenshot of the Share button in Power BI." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-share-button-plain.png":::

If your Power BI admin has turned off the capability for your organization, you receive a notification that states *Sharing has been disabled* when you select the Share button. [Learn more](/fabric/admin/service-admin-portal-integration#users-can-share-links-to-power-bi-files-stored-in-onedrive-and-sharepoint-through-power-bi-desktop) about the Admin setting.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-sharing-disabled.png" alt-text="Screenshot of notification when sharing is disabled." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-sharing-disabled.png":::

## Open Power BI files stored in OneDrive and SharePoint

To open a Power BI file stored in OneDrive and SharePoint select **Open** from the file menu. Then select **OneDrive**. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-open.png" alt-text="Screenshot of open in the file menu." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-open.png":::

Your files from OneDrive for Business and SharePoint are available for you to open directly in Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-open-file.png" alt-text="Screenshot of OneDrive files in file menu." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-open-file.png":::

Select the file to open it in Power BI Desktop.  

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-opened-report.png" alt-text="Screenshot of report opened from OneDrive or SharePoint" lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-opened-report.png":::

You can also navigate to a new OneDrive or SharePoint location through the **Quick access** option on the left. 

If you can’t find what you’re looking for, you can select **Browse this device** for more options. 

## Save Power BI files to OneDrive and SharePoint

When saving a report for the first time, you can save directly in OneDrive for Business or SharePoint. 

Upon saving, you're prompted to enter the name of the file. You then select the OneDrive or SharePoint location from a dropdown menu showing recently visited locations. If you're unable to find the location you’re looking for, select **More options…**. If required by your organization, you also need to specify a sensitivity label. Then select **Save**. Your file is now saved directly in the specified OneDrive or SharePoint location. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-onedrive.png" alt-text="Screenshot of saving a file to OneDrive." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-onedrive.png":::

To save an existing file to OneDrive or SharePoint, select the **Save as** option from the file menu. Select **OneDrive** to find your desired location. Select **Save**.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-as.png" alt-text="Screenshot of save as in the file menu." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-save-as.png":::

The default save location is your parent OneDrive folder, unless you change it. The default save location is the first option that appears in your save list. 

Upon saving, a dialog box appears while the file is being uploaded to the OneDrive or SharePoint location. You can cancel the upload directly on the dialog box. This dialog will only show up the first time a new file is uploaded. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-updated-save-onedrive.png" alt-text="Screenshot of save dialog box in Power BI." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-updated-save-onedrive.png":::

> [!NOTE]
> If the user isn’t signed in when attempting to save, they are prompted to sign in.

## Background upload for existing Power BI files in OneDrive and SharePoint (Preview)

When new changes are saved to a file already uploaded to OneDrive for Business or SharePoint, the top of the toolbar indicates that the new changes are also being uploaded in the background to OneDrive. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-background-upload-onedrive.png" alt-text="Screenshot of background upload for Power BI and ODSP" lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-background-upload-onedrive.png":::

To enable background upload, select **File > Options and Settings > Options > Preview Features,** and then select **Saving to OneDrive and SharePoint uploads the file in the background** checkbox. You will need to restart Power BI Desktop after you make the selection. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-background-upload-preview-toggle.png" alt-text="Toggle for background upload for Power BI and ODSP" lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-background-upload-preview-toggle.png":::

## Change the default save location

The default save location is your parent OneDrive folder. To change the default save location, select **Options and settings > Options > Save and Recover** from the file menu. Under **Save** change the default local file location. Restart the application to see the updated default save location. When you save, the new location is the first option that appears.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-default-save-location.png" alt-text="Screenshot of how to change the default save location." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-default-save-location.png":::

## Share links to Power BI files stored in OneDrive or SharePoint

To share a link to a Power BI file stored in OneDrive or SharePoint, select the **Share** button at the top right of Power BI Desktop or select **Share** from the file menu. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-unsaved-share-button.png" alt-text="Screenshot of share button in Power BI Desktop." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-unsaved-share-button.png":::

If the file hasn’t been saved, you're prompted to save. To share a link to the file with someone else, it must be saved in a OneDrive for Business or SharePoint location. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-share.png" alt-text="Screenshot of saving report before sharing it." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-share.png":::

After the file is saved, the Microsoft 365 share dialog prompts you to add the email, name, or group you wish to share the file with. You can send the file to the desired recipients directly, or use **Copy link** to send a link to the file. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-share-dialog.png" alt-text="Screenshot of sharing Power BI report." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-share-dialog.png":::

You can also manage who has access to the file through the **Manage Access** option under the Share button. 

To get a direct link to where the file is stored in OneDrive, you can select the title bar flyout in the toolbar to access more information about the file. You can select **View your file in OneDrive** to get a direct link to the Power BI file in OneDrive. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-link-to-onedrive.png" alt-text="Screenshot of link to file in OneDrive" lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-link-to-onedrive.png":::

> [!NOTE]
> The new capabilities respect the OneDrive and SharePoint organizational settings for sharing.

## Prerequisites to sharing a report from Power BI Desktop

To share a file stored in OneDrive or SharePoint the following requirements must all be met:
-	You're signed-in to Power BI Desktop with your Microsoft Entra account.   
-	The feature is enabled through the options menu in Power BI Desktop.
-	The feature is enabled by your Power BI Admin.

Learn more about how users can [view Power BI files in their browser](../collaborate-share/service-sharepoint-viewer.md) through links shared with them via Power BI Desktop.

## Considerations and limitations

-	These features don’t work with personal OneDrive accounts.   
-	When you share a link to a file with another person, the recipient has to sign-in before they can view the file.
-	Only **.PBIX files** can be saved to OneDrive and SharePoint.

### Collaborating on reports 

When collaborating on reports with other coauthors, the best practice is to store files in a SharePoint document library where all coauthors have access. Working with files in SharePoint allows all collaborators to open the report in Power BI Desktop directly from SharePoint, make edits, and easily save changes to the file in SharePoint.  

When files are stored in an individual’s OneDrive library other coauthors can't save changes to the OneDrive location unless they have edit access to the folder of the OneDrive file.  

If sharing a report with a colleague is mainly for viewing purposes, either OneDrive or SharePoint is a viable option.  

When the ability to Open in App on a shared link is available, users will be able to make and save edits to reports stored in either OneDrive or SharePoint through taking the open in app action.  

### File save load time

Saving a Power BI Desktop file to a OneDrive or SharePoint location often takes some time depending on the file size. When saving the file, you might be invited to upload the file later. Selecting **Upload Later** allows you to continue working on the file and incorporating changes while the actual uploading to OneDrive or SharePoint happens after you select **Close** in Power BI Desktop. The app finishes closing once the upload to your designated OneDrive or SharePoint location is complete. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-upload-later.png" alt-text="Screenshot of the upload later dialog." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-upload-later.png":::

You can check the last upload status in the title bar of the Power BI report and trigger an upload if desired. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-title-upload.png" alt-text="Screenshot of title bar in Power BI Desktop." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-title-upload.png":::

### Title bar

When you select the title bar of a report in Power BI Desktop, you can only move the file location if the report is saved in OneDrive or SharePoint. You cannot rename the report or change the sensitivity label regardless of where the file is stored.

### Version history

You can view the version history of your Power BI file online through your OneDrive or SharePoint document library. Select the three dots to the right of your file and select **Version history**. Version history can’t be viewed directly from Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-version-history.png" alt-text="Screenshot of version history in OneDrive and SharePoint." lightbox="media/desktop-sharepoint-save-share/power-bi-desktop-version-history.png":::

### Power BI OneDrive and SharePoint sharing link behavior by license type

The following use cases apply when sharing a link to a Power BI file saved in OneDrive or SharePoint depending on the license status of each user. All of these scenarios assume that the user has a Microsoft 365 license and that OneDrive and SharePoint viewing is [enabled in their organization](/fabric/admin/service-admin-portal-integration#users-can-view-power-bi-items-saved-in-onedrive-and-sharepoint-preview).

| License status of the person who shares the link | License status of the person who selects the shared link | Experience for the person who shares the link | Experience for the person who selects the link |
| --- | --- | --- | --- |
| **Has** Power BI Pro, Power BI Premium Per User, or E5 license | **Has** Power BI Pro, Power BI Premium Per User, or E5 license | Sees the existence of the link in OneDrive or SharePoint, can open the file in OneDrive or SharePoint viewing and preview. | Sees the existence of the link in OneDrive or SharePoint, can open the file in OneDrive or SharePoint viewing and preview. |
| **Has** Power BI Pro, Power BI Premium Per User, or E5 license | **Does not have** Power BI Pro, Power BI Premium Per User, or E5 license | Sees the existence of the link in OneDrive or SharePoint, can open the file in OneDrive or SharePoint viewing and preview.  | Sees the existence of the link in OneDrive or SharePoint, must download the file to view it in Power BI Desktop. |
| **Does not have** Power BI Pro, Power BI Premium Per User, or E5 license | **Has** Power BI Pro, Power BI Premium Per User, or E5 license | Sees the existence of the link in OneDrive or SharePoint, must download the file to view it in Power BI Desktop. | Sees the existence of the link in OneDrive or SharePoint, can open the file in OneDrive or SharePoint viewing and preview. |
| **Does not have** Power BI Pro, Power BI Premium Per User, or E5 license | **Does not have** Power BI Pro, Power BI Premium Per User, or E5 license | Sees the existence of the link in OneDrive or SharePoint, must download the file to view it in Power BI Desktop. | Sees the existence of the link in OneDrive or SharePoint, must download the file to view in it Power BI Desktop.  |

### Audit logs

When you save and share Power BI files in OneDrive and SharePoint document libraries, Power BI admins can access activity through [unified audit logs](../admin/service-admin-auditing.md#use-the-audit-log). 

Power BI admins can access information on sharing and permission of files through the [Microsoft 365 audit logs](../admin/service-admin-auditing.md). Any user without global admin rights can still access Microsoft 365 audit logs when assigned the [*View-Only Audit Logs role*](/exchange/view-only-audit-logs-role-exchange-2013-help). Admins [access the Microsoft 365 audit logs](../admin/service-admin-auditing.md#use-the-audit-log) through the Power BI [Admin portal](../admin/service-admin-portal.md).

OneDrive and SharePoint Power BI file activity in the audit logs appear with property values **Workload** and/or **EventSource** set to **OneDrive**.

Learn more about the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference). 

### Sensitivity labels and encryption

Sharing through Power BI Desktop uses standard OneDrive and SharePoint sharing UI and services. Default Power BI configured Microsoft Information Protection labels are applied to the file before it's saved. Your organizational policies for sharing through OneDrive and SharePoint govern to whom and how the Power BI item can be shared.

[Sensitivity labels](/microsoft-365/compliance/encryption-sensitivity-labels) are respected for Power BI files stored and shared through OneDrive and SharePoint. An intersection of OneDrive and SharePoint permissions and Microsoft Information Protection label permissions are applied to the file. The OneDrive and SharePoint permission is applied first, followed by the sensitivity label. The strictest permission is respected.

If the file is unlabeled, then the default Power BI tenant policy applies when viewing the file in OneDrive or SharePoint.

If a Power BI file has encryption, you can only open the file if you have [full control and/or export usage rights](/microsoft-365/compliance/encryption-sensitivity-labels). Only users who can decrypt the file can view it.

### Using different accounts between Power BI Desktop and local OneDrive     

If you're signed-in to an account in Power BI Desktop that is *different* than the account you're signed-in to on your local OneDrive, you can still browse and open local files. These files are open as non-OneDrive files. To save the files back to the same OneDrive or SharePoint location you opened them from, the account you're sign-in to in Power BI Desktop must match the account you're sign-in to on your local OneDrive. 

If the account you're sign-in to in Power BI Desktop and your local OneDrive or SharePoint aren't the same, you're prompted to save the file to OneDrive or SharePoint before you can share it, even though you may have opened the file from a OneDrive or SharePoint location. To avoid being prompted to save your file in OneDrive or SharePoint every time you're sharing a link, sign-in to Power BI Desktop with the same account you're signed-in to on your local OneDrive or SharePoint. 

### Syncing files to OneDrive and SharePoint through the file system

When you drag a Power BI file to a OneDrive or SharePoint location in the file system, the file is uploaded to the new location in OneDrive or SharePoint. If you try to open the file before the file has completed syncing to OneDrive or SharePoint, the file acts as a local file. Therefore, when you try to share a link to the file, you're prompted to save the file to OneDrive or SharePoint even though the file is syncing there. When you're prompted to save a file that is already saved, wait until the file has finished syncing and try again. Once the file has finished syncing to the new OneDrive or SharePoint location, you're able to share a link to the file without being prompted to save again.  

### Unable to open document

If you have signed-in to Power BI on multiple different accounts, you can see files in the file menu that each account interacted with.  If you try to open one of the files that belongs to another account and receive an error, sign-in to the account that has access to the file and try again. 
