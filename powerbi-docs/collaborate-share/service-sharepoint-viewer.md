---
title: View Power BI file in SharePoint and OneDrive
description: Learn how to view Power BI Desktop files in SharePoint document libraries and OneDrive for Business.
author: LukaszPawlowski-MS
ms.author: lukaszp
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.search.form: View Power BI file in SharePoint and OneDrive
ms.topic: how-to
ms.custom: 
ms.date: 05/03/2023

LocalizationGroup: Share your work
---
# View Power BI files in SharePoint and OneDrive

You can quickly view Power BI files in OneDrive and SharePoint without needing to install Power BI Desktop or download the file locally. This enables collaboration and a streamlined workflow before publishing through the Power BI Service.

## How to enable viewing Power BI files in OneDrive and SharePoint

> [!NOTE]
> This is prerelease documentation and some capabilities may not be available in your tenant. 

> [!NOTE]
> Viewing Power BI files in OneDrive and SharePoint is disabled by default. Work with you Power BI Admin to enable this capability.

Admins must **enable** the capability in the Admin portal. 

## Viewing Power BI files in OneDrive and SharePoint capabilities

### Opening a Power BI file stored in a OneDrive or SharePoint library

Viewing Power BI reports stored in OneDrive and SharePoint directly in your browser is simple. You can click directly on the file to open it in your browser.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open.png" alt-text="Screenshot of sharepoint library with Power BI file":::

You can also right click on the report or click the ellipses and select **Open** > **Open in browser**.  

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open-in-browser.png" alt-text="Screenshot of clicking on a Power BI file to open":::

The report then loads in your browser.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-basic-view.png" alt-text="Screenshot of basic view of Power BI in the browser":::

Once the report is open, you can interact with the visuals and explore the underlying data to uncover important information. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-explore.png" alt-text="Screenshot of exploring data in Power BI file online":::

### Share a link to the report with others

You can share a link to a Power BI file with others in two ways. 

You can open the **File** menu. Select **Share** from the left-hand menu, then click **Share a link**.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-menu.png" alt-text="Screenshot of sharing from the file menu":::

Power BI uses the standard Microsoft 365 share dialog box to help you share your file. This dialog enforces your permissions in OneDrive and SharePoint and any policies that apply to the OneDrive folder or SharePoint document library where the file is saved. 

From here, you can share the link directly with individuals or groups, or copy the link to share with others. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-dialog.png" alt-text="Screenshot of share dialog in OneDrive and SharePoint":::

You can also share a link to the report with others by selecting the green ‘share’ button at the top right of the report. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-share-button.png" alt-text="Screenshot of share button in browser":::

### Changing the page view

To change the page view, select the ‘Page view’ button at the top left of the report. You can choose from the following options:
- Fit to page
- Fit to width
- Actual size

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-fit-to-page.png" alt-text="Screenshot of fit to page functionality":::

### Setting high-contrast colors

You can change your report to include high-contrast colors. To change the color, select one of the options from the **High-contrast color** button in the top left corner of the report. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-high-contrast-color.png" alt-text="Screenshot of high contrast color options":::

### View saved bookmarks

To view saved bookmarks, select the **Bookmarks** button from the top left corner of the report. After you click on the button, a bookmarks pane will pop out on the right-hand side of the browser. You can choose a bookmark created by the report author. Clicking on one of the bookmarks shows a set filtered version of the report assigned to that bookmark.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-bookmark.png" alt-text="Screenshot of bookmarks in Power BI file in the browser":::

### Rename the file

You can rename the file in two different ways. 

The first option starts with selecting the file name at the top left corner of the report. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename-select.png" alt-text="Screenshot of renaming Power BI file":::

Type over the current file name.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename-top.png" alt-text="Screenshot of typing new name of Power BI file":::

Click out of the box to see the new saved name.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-renamed.png" alt-text="Screenshot of new name of Power BI file":::

You can also rename the file by clicking on the file menu and selecting ‘Rename’.

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-rename.png" alt-text="Screenshot of renaming the Power BI file from the file menu":::

### Download a copy

To download a copy of the report to your device, click on the file menu and select ‘Download a copy’. A version of the file is copied into the Power BI Service to then be downloaded to your device. You can then open the file in Power BI Desktop to edit and publish the report to the Power BI Service. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-download.png" alt-text="Screenshot of downloading a copy of the Power BI report":::

### Opening a report in preview mode

You can also open the file in preview mode by right clicking on th file or hitting the ellipses and selecting ‘Preview’. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-open-preview.png" alt-text="Screenshot of opening a preview of a Power BI file in OneDrive and SharePoint":::

The preview provides a limited experience with options to download the .pbix, share the file, or copy a link to the file. 

:::image type="content" source="media/service-sharepoint-viewer/power-bi-onedrive-preview.png" alt-text="Screenshot of preview view of Power BI file in OneDrive and SharePoint":::

## About the OneDrive and SharePoint capabilities

### Dataset mode

For a Power BI file to load in OneDrive or SharePoint the data must be in **import** mode. Other modes may be supported in the future.

### Prerequisites to viewing report in OneDrive and SharePoint

To view a report in OneDrive or SharePoint, users must:
-	Be signed-in to OneDrive with their Azure Active Directory account
-	Have at least read access to the file
-	Have a Power BI Pro or E5 license

### Considerations and limitations
-	Free users can't view reports in OneDrive and SharePoint directly in the browser.
-	These capabilities don't work with personal OneDrive accounts.
-	These capabilities aren't available in sovereign cloud tenant
-	Power BI files can be viewed with a limit of size up to 1 GB.
-	When you open the ‘Preview’ experience, users are required to authenticate before they can view the file. 
-	Row-level security isn't supported at this time. 
-	The ability to view files in Microsoft Teams isn't currently supported.
-	If the capability is turned off for your organization, the OneDrive and SharePoint file isn't copied into the Power BI Service.

### Sensitivity labels 

Sensitivity labels are respected for Power BI files stored and shared through OneDrive and SharePoint. Learn more about how sensitivity labels work in OneDrive and SharePoint.

### Sharing settings

The new capabilities respect the OneDrive and SharePoint organizational settings for sharing. 

### Creation of system workspaces

System workspaces are created for this new functionality. Admins are able to see the created workspaces in the Power BI Admin portal via the workspace tab. However, admins can't modify workspaces (delete, modify access) from within Power BI. 












