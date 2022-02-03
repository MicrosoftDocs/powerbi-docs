---
title: Connect to files in OneDrive for a classic workspace
description: Read about storing and connecting to your Excel, CSV, and Power BI Desktop files on the OneDrive for your classic Power BI workspace.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: lukasz
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
ms.date: 01/29/2021
LocalizationGroup: Share your work
---
# Connect to files stored in OneDrive for a classic workspace
When you [create a *classic* workspace in Power BI](service-create-workspaces.md), you're also creating a Microsoft 365 group, with an associated OneDrive for Business. This article explains how to store and update your Excel, CSV, and Power BI Desktop files on that OneDrive for Business. Those updates are automatically reflected in the Power BI reports and dashboards based on the files.

> [!NOTE]
> The *new* workspace experience changes the relationship between Power BI workspaces and Microsoft 365 groups. You don't automatically create a Microsoft 365 group every time you create one of the new workspaces. You can also [set a workspace OneDrive for a new workspace](service-create-the-new-workspaces.md#set-a-workspace-onedrive).

Adding files to your classic workspace is a two-step process: 

1. First you [upload files to the OneDrive for Business](#1-upload-files-to-the-onedrive-for-business-for-your-workspace) for your workspace.
2. Then you [connect to those files from Power BI](#2-import-excel-files-as-datasets-or-as-excel-online-workbooks).

> [!NOTE]
> Workspaces are only available with a [Power BI Pro](../fundamentals/service-features-license-type.md) license.
> 

## 1 Upload files to the OneDrive for Business for your workspace
1. In the Power BI service, select the arrow next to Workspaces > select the ellipsis (**…**) next to your workspace name. 
   
   ![Screenshot of the Power B I workspace, showing the selected workspace name.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/power-bi-app-ellipsis.png)
2. Select **Files** to open the OneDrive for Business for your workspace on Microsoft 365.
   
   > [!NOTE]
   > If you don't see **Files** on the workspace menu, select **Members** to open the OneDrive for Business for your workspace. There, select **Files**. Microsoft 365 sets up a OneDrive storage location for your app's group workspace files. This process may take some time.
   > 
   > 
3. Here, you can upload your files to the OneDrive for Business for your workspace. Select **Upload**, and navigate to your files.
   
   ![Screenshot of the OneDrive for Business, showing how to navigate to upload a file.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/pbi_grpfilesonedrive.png)

## 2 Import Excel files as datasets or as Excel Online workbooks
Now that your files are in the OneDrive for Business for your workspace, you have a choice. You can: 

* [Import the data from the Excel workbook as a dataset](../connect-data/service-get-data-from-files.md). Then use the data to build reports and dashboards you can view in a web browser and on mobile devices.
* Or [connect to a whole Excel workbook in Power BI](../connect-data/service-excel-workbook-files.md) and display it exactly as it appears in Excel Online.

### Import or connect to the files in your workspace
1. In Power BI, switch to the workspace, so the workspace name is in the top-left corner. 
2. Select **Get Data** at the bottom of the nav pane. 
   
   ![Screenshot of the Get Data button, showing it in the navigation pane.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/power-bi-app-get-data-button.png)
3. In the **Files** box, select **Get**.
   
   ![Screenshot of the Files dialog, showing the Get button.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/pbi_getfiles.png)
4. Select **OneDrive** - *Your Workspace Name*.
   
    ![Screenshot of three tiles to select your workspace, showing Local File, OneDrive, and SharePoint.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/pbi_grp_one_drive_shrpt.png)
5. Select the file you want > **Connect**.
   
    At this point, you decide whether to [import the data from the Excel workbook](../connect-data/service-get-data-from-files.md), or [connect to the whole Excel workbooks](../connect-data/service-excel-workbook-files.md).
6. Select **Import** or **Connect**.
   
    ![Screenshot of the OneDrive for Business dialog, showing Import from Excel or Connect to Excel.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/pbi_importexceldataorwholecrop.png)
7. If you select **Import**, then the workbook appears on the **Datasets** tab. 
   
    ![Screenshot of the Workspaces in Power B I, showing the Datasets tab.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/power-bi-app-excel-file-import.png)
   
    If you select **Connect**, then the workbook is on the **Workbooks** tab.
   
    ![Screenshot of the Workspaces in Power B I, showing the Workbooks tab.](media/service-connect-to-files-in-app-workspace-onedrive-for-business/power-bi-app-excel-file-connect.png)

## Next steps
* [Create apps and workspaces in Power BI](../collaborate-share/service-create-distribute-apps.md)
* [Import data from Excel workbooks](../connect-data/service-get-data-from-files.md)
* [Connect to whole Excel workbooks](../connect-data/service-excel-workbook-files.md)
* More questions? [Try the Power BI Community](https://community.powerbi.com/)
* Feedback? Visit [Power BI Ideas](https://ideas.powerbi.com/forums/265200-power-bi)
