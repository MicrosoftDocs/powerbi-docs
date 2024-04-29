---
title: View Power BI files in OneDrive and SharePoint
description: Learn how to view Power BI Desktop files in SharePoint document libraries and OneDrive for Business.
author: ajburnle
ms.author: ajburnle
ms.reviewer: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: View Power BI file in SharePoint and OneDrive
ms.topic: how-to
ms.custom: 
ms.date: 10/11/2023
LocalizationGroup: Share your work
---
# View Power BI files in OneDrive and SharePoint

You can quickly view Power BI files in OneDrive and SharePoint without needing to install Power BI Desktop or download the file locally. Viewing Power BI files in your browser enables collaboration and a streamlined workflow before publishing through the Power BI Service.

> [!NOTE]
> This is public preview documentation and some capabilities may not be available in your tenant. 

## Enable viewing Power BI files in OneDrive and SharePoint

Viewing Power BI files in OneDrive for Business and SharePoint is enabled **by default**. 

If you **do not** want this capability on in your tenant, your admin will need to [**disable** the capability in the Admin portal](/fabric/admin/service-admin-portal-integration#users-can-view-power-bi-files-saved-in-onedrive-and-sharepoint-preview).

If the capability isn't enabled in your tenant, you can't view a Power BI report in your browser. Instead, you're directed to download the file to your device. You can then open the file in Power BI Desktop. For the optimal viewing experience and to ensure you always have a backup of your file in the cloud, we encourage admins to enable the functionality. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-setting-off.png" alt-text="Screenshot of capability disabled view." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-setting-off.png":::

## Open a Power BI file stored in a OneDrive or SharePoint library

Viewing Power BI reports stored in OneDrive and SharePoint directly in your browser is simple. Select the file directly to open it in your browser.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open.png" alt-text="Screenshot of sharepoint library with Power BI file." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-open.png":::

You can also right-click the report, or select **More options (...) > **Open** > **Open in browser**.  

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open-in-browser.png" alt-text="Screenshot of selecting a Power BI file to open." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-open-in-browser.png":::

The report then loads in your browser.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-basic-view.png" alt-text="Screenshot of basic view of Power BI in the browser." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-basic-view.png":::

Once the report is open, you can interact with the visuals and explore the underlying data to uncover important information. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-explore.png" alt-text="Screenshot of exploring data in Power BI file online." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-explore.png":::

## Share a link to the report with others

You can share a link to a Power BI file with others in two ways. 

- On the **File** menu, select **Share** from the left-hand menu > **Share a link**.

    :::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-menu.png" alt-text="Screenshot of sharing from the file menu." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-share-menu.png":::

- You can also share a link to the report with others by selecting the **Share** button at the top right of the report. 

    :::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-button.png" alt-text="Screenshot of share button in browser." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-share-button.png":::

Power BI uses the standard Microsoft 365 share dialog box to help you share your file. This dialog enforces your permissions in OneDrive and SharePoint and any policies that apply to the OneDrive folder or SharePoint document library where the file is saved. 

From here, you can share the link directly with individuals or groups, or copy the link to share with others. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-dialog.png" alt-text="Screenshot of share dialog in OneDrive and SharePoint." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-share-dialog.png":::

## Change the page view

Use the **Page view** button to choose one of the view options:
- Fit to page
- Fit to width
- Actual size

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-fit-to-page.png" alt-text="Screenshot of fit to page functionality.":::

## Set high-contrast colors

You can change your report to include high-contrast colors. To change the color, select one of the options from the **High-contrast color** button in the top left corner of the report. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-high-contrast-color.png" alt-text="Screenshot of high contrast color options." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-high-contrast-color.png":::

## View saved bookmarks

To view saved bookmarks, select the **Bookmarks** button from the top-left corner of the report. After you select the button, a Bookmarks pane pops out on the right side of the browser. You can choose a bookmark created by the report author. Selecting one of the bookmarks shows a set filtered version of the report assigned to that bookmark.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-bookmark.png" alt-text="Screenshot of bookmarks in Power BI file in the browser." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-bookmark.png":::

## Rename the file

You can rename the file in two different ways. 

The first option starts with selecting the file name at the top left corner of the report. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename-select.png" alt-text="Screenshot of renaming Power BI file." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-rename-select.png":::

Type over the current file name.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename-top.png" alt-text="Screenshot of typing new name of Power BI file." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-rename-top.png":::

Select out of the box to see the new saved name.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-renamed.png" alt-text="Screenshot of new name of Power BI file." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-renamed.png":::

You can also rename the file by selecting the **File** menu > **Rename**.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename.png" alt-text="Screenshot of renaming the Power BI file from the file menu." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-rename.png":::

## Download a copy

To download a copy of the report to your device, on the **File** menu, select **Download a copy**. A version of the file is copied to the Power BI service, to then be downloaded to your device. You can open the file in Power BI Desktop to edit and publish the report back to the Power BI service. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-download.png" alt-text="Screenshot of downloading a copy of the Power BI report." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-download.png":::

## Open a report in preview mode

You can also open the file in preview mode by right-clicking the file or selecting **More options (...)** > **Preview**.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open-preview.png" alt-text="Screenshot of opening a preview of a Power BI file in OneDrive and SharePoint." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-open-preview.png":::

The preview provides a limited experience with options to download the .pbix file, share the file, or copy a link to the file. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-preview.png" alt-text="Screenshot of preview view of Power BI file in OneDrive and SharePoint." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-preview.png":::

## Version history

You can also use the built-in M365 version history capability to track report activity and revert back to old versions of a file. From your OneDrive and SharePoint document library, simply click on the ellipsis (...) next to the Power BI file name and select **Verion history** from the options. After selecting **Version history**, you will be able to store, track, and restore the file whenever a change is made.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-version-history.png" alt-text="Screenshot of version history." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-version-history.png":::

## Prerequisites to viewing report in OneDrive and SharePoint

To view a report in OneDrive for Business or SharePoint Online, you must:

-	Be signed in to OneDrive with your Microsoft Entra account.
-	Have at least read access to the file.
-	Have a Power BI Pro, Power BI Premium Per User, or E5 license.

## Considerations and limitations

-	Free users can't view reports in OneDrive and SharePoint directly in the browser.
-	These capabilities don't work with personal OneDrive accounts.
-	These capabilities aren't available in a sovereign cloud tenant.
-	Power BI files can be viewed with a size limit up to 1 GB.
-	When you open the Preview experience, you're required to authenticate before you can view the file. 
-	Reports with row-level security are not currently supported. You need to download and view these files in Power BI Desktop. 
-	The ability to view files in Microsoft Teams isn't currently supported.
-	B2B users and anonymous users can't view Power BI files in the browser. They're directed to download the file to their device and view it in Power BI Desktop.
-	If the capability is turned off for your organization, the OneDrive and SharePoint file isn't copied into the Power BI service.
-	The reports and semantic models created through this OneDrive and SharePoint experience are stored in special, system-generated workspaces hosted on shared capacity. Users aren't meant to access these workspaces outside of the OneDrive and SharePoint experience. 

## Semantic model mode

To view a Power BI file in OneDrive or SharePoint, the data must be in **import** mode or **live connected to a semantic model** in the Power BI service. Files with other modes prompt you to download the file to open locally in Power BI Desktop.

### Audit logs

When you save and view Power BI files in OneDrive and SharePoint document libraries, Power BI admins can access activity through audit logs. Some activities for these files are logged through [unified audit logs](../admin/service-admin-auditing.md#use-the-audit-log), while others are logged through the [Power BI activity log](../admin/service-admin-auditing.md#use-the-activity-log).

OneDrive and SharePoint events are audited in the Microsoft 365 audit logs. Some of the events include:

- Copy
- Download
- Move to
- Share
- Export

Interaction with the Power BI file is audited in Power BI activity logs. Some of the events include:

- View
- Open report

Power BI admins can access information on sharing and permission of files through the [Microsoft 365 audit logs](../admin/service-admin-auditing.md). Any user without global admin rights can still access Microsoft 365 audit logs when assigned the [*View-Only Audit Logs role*](/exchange/view-only-audit-logs-role-exchange-2013-help). Admins [access the Microsoft 365 audit logs](../admin/service-admin-auditing.md#use-the-audit-log) through the Power BI [Admin portal](../admin/service-admin-portal.md).

OneDrive and SharePoint Power BI file activity in the audit logs appear with [property values](/microsoft-365/compliance/audit-log-detailed-properties) **Workload** and/or **EventSource** set to **OneDrive**.

Learn more about the [Office 365 Management Activity API](/office/office-365-management-api/office-365-management-activity-api-reference). 

### Sensitivity labels and encryption

[Sensitivity labels](/microsoft-365/compliance/encryption-sensitivity-labels) are respected for Power BI files stored and shared through OneDrive and SharePoint. A union of OneDrive and SharePoint permissions and Microsoft Information Protection label permissions are applied to the file. The OneDrive and SharePoint permission is applied first, followed by the sensitivity label. The strictest permission is respected.

If the file is unlabeled, then the default Power BI tenant policy applies when viewing the file in OneDrive or SharePoint. 

If a Power BI file has encryption, you can only open the file if you have [full control and/or export usage rights](/microsoft-365/compliance/encryption-sensitivity-labels#power-bi-desktop). Only users who can decrypt the file can view it. 

### Sharing settings

The new capabilities respect the OneDrive and SharePoint organizational settings for sharing. 

### Creation of system workspaces

The first time anyone opens a Power BI file in a browser through a OneDrive or SharePoint document library, a system workspace is created in the Power BI service and the report selected is published behind the scenes. This process results in a longer initial loading time. After that initial report viewing, loading time decreases significantly. The creation of the workspace to view a file stored in OneDrive or SharePoint has no implications on your Power BI Premium capacity storage. 

Admins can see the workspaces created in the Power BI service on the **Workspaces** tab in the Admin portal. Created workspaces have the word **OneDrive** at the end of the workspace name. They're also listed as **PBIX in OneDrive Folder** in the description column. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-workspace.png" alt-text="Screenshot of Power BI admin workspace creation naming." lightbox="media/service-sharepoint-viewer/power-bi-onedrive-workspace.png":::

Admins can't modify workspaces (delete, modify access) from the Power BI Service. 

When you open a Power BI report in OneDrive or SharePoint the data is stored in your Power BI [home tenant region](../admin/service-admin-where-is-my-tenant-located.md) until the file is deleted or unopened for a few days. 

### Collaborating on reports 

When collaborating on reports with other coauthors, the best practice is to store files in a **SharePoint** document library where all coauthors have access. This allows all collaborators to open the report in Power BI Desktop directly from SharePoint, make edits, and easily save changes to the file in SharePoint. 

When files are stored in an individual’s **OneDrive** library other coauthors won’t be able to save changes to the OneDrive location unless they have edit access to the folder of the OneDrive file. If sharing a report with a colleague is mainly for viewing purposes either OneDrive or SharePoint is a viable option. Once the ability to **Open in App** on a shared link is released, users will be able to make and save edits to reports stored in either OneDrive or SharePoint through taking the open in app action.  
