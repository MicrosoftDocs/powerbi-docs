---
title: Power BI Desktop OneDrive and SharePoint integration
description: Learn how to open, save, and share Power BI files to OneDrive for Business and SharePoint
author: lafaberMSFT
ms.author: lafaber
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/10/2023
LocalizationGroup: Create reports
---
# Power BI Desktop OneDrive and SharePoint integration

Work seamlessly in Power BI Desktop with the ability to open, save, and share files to OneDrive for Business and SharePoint. These new capabilities help authors with file versioning, collaborating with other authors, and ensuring a backup file is always available in the cloud. 

> [!NOTE]
> This is prerelease documentation and some capabilities may not be available in your tenant. 

## Enable viewing Power BI files in OneDrive and SharePoint

> [!NOTE]
> Sharing from Power BI Desktop is **enabled by default** but also required individual users to turn on the preview features in Power BI Desktop.

## How to enable Power BI Desktop and SharePoint integrations

The ability to open, save, and share files from OneDrive and SharePoint directly in Power BI Desktop is available in an upcoming Power BI Desktop release. 

**Sharing** files stored in OneDrive and SharePoint directly from Power BI Desktop only works when **both** of the following two statements are true:
1.	Users have turned on the sharing preview feature in Power BI Desktop
2.	The Admin tenant setting is enabled (the setting is **enabled by default** and would require that admins disable it for it to be turned off).   

To enable the preview for opening and saving Power BI files to OneDrive and SharePoint in Power BI Desktop, start by checking the **Save to OneDrive and SharePoint** and **Share to OneDrive and SharePoint** option in the Preview Features section under the file tab. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-preview-settings.png" alt-text="Screenshot of settings to turn on preview features.":::

When enabled, you see a **Share** button in the top right corner of Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-share-button-plain.png" alt-text="Screenshot of the Share button in Power BI.":::

If your Power BI admin has turned off the capability for your organization, you receive a notification that states *Sharing has been disabled* when clicking on the Share button.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-sharing-disabled.png" alt-text="Screenshot of notification when sharing is disabled.":::

The Power BI Admin setting for sharing Power BI files directly in OneDrive and SharePoint is **enabled by default**. Admins can [**disable** sharing through the Admin portal.](../admin/service-admin-portal-integration.md).

## Open Power BI files stored in OneDrive and SharePoint

To open a Power BI file stored in OneDrive and SharePoint select **Open** from the file menu. Then click on **OneDrive**. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-open.png" alt-text="Screenshot of open in the file menu.":::

Your files from OneDrive for Business and SharePoint are available for you to open directly in Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-open-file.png" alt-text="Screenshot of OneDrive files in file menu.":::

Click on a file stored in OneDrive or SharePoint to open it in Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-opened-report.png" alt-text="Screenshot of report opened from OneDrive or SharePoint":::

You can also navigate to a new OneDrive or SharePoint location through the **Quick access** option on the left. 

If you can’t find what you’re looking for, you can select **Browse this device** for more options. 

## Saving Power BI files to OneDrive and SharePoint

When saving a report for the first time, you can save directly in OneDrive for Business or SharePoint. 

Upon saving, you're prompted to enter the name of the file. You then select the OneDrive or SharePoint location from a dropdown menu showing recently visited locations. If you're unable to find the location you’re looking for, click **More options…**. If required by your organization, you also need to specify a sensitivity label. Then click **Save**. Your file is now saved directly in the specified OneDrive or SharePoint location. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-onedrive.png" alt-text="Screenshot of saving a file to OneDrive.":::

To save an existing file to OneDrive or SharePoint, select the **Save as** option from the file menu. Click on **OneDrive** to find your desired location. Click **Save**.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-as.png" alt-text="Screenshot of save as in the file menu.":::

The default save location is your parent OneDrive folder, unless you change it. The default save location is the first option that appears in your save list. 

> [!NOTE]
> If the user isn’t signed in when attempting to save, they are prompted to sign in. 

## Changing the default save location

The default save location is your parent OneDrive folder. To change the default save location, select **Options and settings > Options > Save and Recover** from the file menu. Under **Save** change the default local file location. Restart the application to see the updated default save location. When you save, the new location is the first option that appears.

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-default-save-location.png" alt-text="Screenshot of how to change the default save location.":::

## Sharing links to Power BI files stored in OneDrive or SharePoint

To share a link to a Power BI file stored in OneDrive or SharePoint, click the **Share** button at the top right of Power BI Desktop or select **Share** from the file menu. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-unsaved-share-button.png" alt-text="Screenshot of share button in Power BI Desktop.":::

If the file hasn’t been saved, you're prompted to save. To share a link to the file with someone else, it must be saved in a OneDrive for Business or SharePoint location. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-save-to-share.png" alt-text="Screenshot of saving report before sharing it.":::

After the file is saved, the Microsoft 365 share dialog prompts you to add the email, name, or group you wish to share the file with. You can send the file to the desired recipients directly, or use **Copy link** to send a link to the file. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-share-dialog.png" alt-text="Screenshot of sharing Power BI report.":::

You can also manage who has access to the file through the **Manage Access** option under the Share button. 

> [!NOTE]
> The new capabilities respect the OneDrive and SharePoint organizational settings for sharing.

## Prerequisites to sharing a report from Power BI Desktop

To share a file stored in OneDrive or SharePoint the following requirements must all be met:
-	You are signed-in to Power BI Desktop with your Azure Active Directory account.   
-	The feature is enabled through the options menu in Power BI Desktop.
-	The feature is enabled by your Power BI Admin.

Learn more about how users can [view Power BI files in their browser](../collaborate-share/service-sharepoint-viewer.md) through links shared with them via Power BI Desktop.

## Considerations and limitations

-	These features don’t work with personal OneDrive accounts.
-	Opening, saving, and sharing to OneDrive and SharePoint features aren't available in sovereign cloud tenants.   
-	When you share a link to a file with another person, the recipient has to sign-in before they can view the file.

## File save load time

Saving a Power BI Desktop file to a OneDrive or SharePoint location often takes some time depending on the file size. When saving the file, you might be invited to upload the file later. Selecting **Upload Later** allows you to continue working on the file and incorporating changes while the actual uploading to OneDrive or SharePoint happens after you click close in Power BI Desktop. The app finishes closing once the upload to your designated OneDrive or SharePoint location is complete. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-upload-later.png" alt-text="Screenshot of the upload later dialog.":::

You can check the last upload status in the title bar of the Power BI report and trigger an upload if desired. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-title-upload.png" alt-text="Screenshot of title bar in Power BI Desktop.":::

## Title bar

When you click on the title bar of a report in Power BI Desktop, you're able to save the file to a new location or upload the report. You're unable to rename the file or change the sensitivity label. 

## Version history

You can view the version history of your Power BI file online through your OneDrive or SharePoint document library. Select the three dots to the right of your file and click **Version history**. Version history can’t be viewed directly from Power BI Desktop. 

:::image type="content" source="media/desktop-sharepoint-save-share/power-bi-desktop-version-history.png" alt-text="Screenshot of version history in OneDrive and SharePoint.":::

## Save-as file naming limitations

When you click **Save as** in the file menu, the file name box is empty regardless of if you're saving the file for the first time, or if the file is already saved in another location. If you type the file name while **Recent** is selected, and then click **OneDrive** you have to retype the file name again. 

## Power BI OneDrive and SharePoint sharing link behavior by user licensing 

The following use cases apply when sharing a link to a Power BI file saved in OneDrive or SharePoint depending on the license status of each user. All of these scenarios assume that the user has a Microsoft 365 license. 

## Audit logs

When you save and share Power BI files in OneDrive and SharePoint document libraries, Power BI admins can access activity through [unified audit logs](../admin/service-admin-auditing.md#use-the-audit-log). 

Power BI admins can access information on sharing and permission of files through the [Microsoft 365 audit logs](../admin/service-admin-auditing.md). Any user without global admin rights can still access Microsoft 365 audit logs when assigned the [*View-Only Audit Logs role*](/exchange/view-only-audit-logs-role-exchange-2013-help). Admins [access the Microsoft 365 audit logs](../admin/service-admin-auditing.md#use-the-audit-log) through the Power BI [Admin portal](../admin/service-admin-portal.md).

OneDrive and SharePoint Power BI file activity in the audit logs appear with property values **Workload** and/or **EventSource** set to **OneDrive**.

Learn more about the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference). 

## Sensitivity labels and encryption

Sharing through Power BI Desktop uses standard OneDrive and SharePoint sharing UI and services. Default Power BI configured Microsoft Information Protection labels are applied to the file before it's saved. Your organizational policies for sharing through OneDrive and SharePoint govern to whom and how the Power BI item can be shared.

[Sensitivity labels](/microsoft-365/compliance/encryption-sensitivity-labels) are respected for Power BI files stored and shared through OneDrive and SharePoint. An intersection of OneDrive and SharePoint permissions and Microsoft Information Protection label permissions are applied to the file. The OneDrive and SharePoint permission is applied first, followed by the sensitivity label. The strictest permission is respected.

If the file is unlabeled, then the default Power BI tenant policy applies when viewing the file in OneDrive or SharePoint.

If a Power BI file has encryption, you can only open the file if you have [full control and/or export usage rights](/microsoft-365/compliance/encryption-sensitivity-labels). Only users who can decrypt the file can view it.

## Using different accounts between Power BI Desktop and local OneDrive     

If you're signed-in to an account in Power BI Desktop that is *different* than the account you're signed-in to on your local OneDrive, you can still browse and open local files. These files are open as non-OneDrive files. To save the files back to the same OneDrive or SharePoint location you opened them from, the account you're sign-in to in Power BI Desktop must match the account you're sign-in to on your local OneDrive. 

If the account you're sign-in to in Power BI Desktop and your local OneDrive or SharePoint aren't the same, you're prompted to save the file to OneDrive or SharePoint before you can share it, even though you may have opened the file from a OneDrive or SharePoint location. To avoid being prompted to save your file in OneDrive or SharePoint every time you're sharing a link, sign-in to Power BI Desktop with the same account you're signed-in to on your local OneDrive or SharePoint. 

## Syncing files to OneDrive and SharePoint through the file system

When you drag a Power BI file to a OneDrive or SharePoint location in the file system, the file is uploaded to the new location in OneDrive or SharePoint. If you try to open the file before the file has completed syncing to OneDrive or SharePoint, the file acts as a local file. Therefore, when you try to share a link to the file, you're prompted to save the file to OneDrive or SharePoint even though the file is syncing there. When you're prompted to save a file that is already saved, wait until the file has finished syncing and try again. Once the file has finished syncing to the new OneDrive or SharePoint location, you're able to share a link to the file without being prompted to save again.   




















 
