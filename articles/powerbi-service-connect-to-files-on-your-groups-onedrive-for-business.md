<properties 
   pageTitle="Connect to files stored in the OneDrive for your app workspace"
   description="Read about storing and connecting to your Excel, CSV, and Power BI Desktop files on the OneDrive for your Power BI app workspace."
   services="powerbi" 
   documentationCenter="" 
   authors="ajayan" 
   manager="erikre" 
   backup="maggiesMSFT"
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/02/2017"
   ms.author="ajayan"/>

# Connect to files stored in the OneDrive for your app workspace

> [AZURE.NOTE] Have you heard about the new *apps* yet? Apps are the new way to distribute content to large audiences in Power BI. You create apps in *app workspaces*, which replace groups and group workspaces. We recommend using apps instead of organizational content packs or read-only workspaces. Learn [more about apps](powerbi-service-what-are-apps.md).

Now that you've [created an app workspace in Power BI](powerbi-service-create-apps.md), you can store your Excel, CSV, and Power BI Desktop files on the OneDrive for Business for your Power BI app workspace. You can continue updating the files you store in OneDrive, and those updates are automatically reflected in the Power BI reports and dashboards based on the files. 

Adding files to your app workspace is a two-step process: 

1. First you upload files to the OneDrive for Business for your app workspace.

2. Then you connect to those files from Power BI.

> [AZURE.NOTE]  App workspaces are only available with [Power BI Pro](powerbi-power-bi-pro-content-what-is-it.md).

## 1 Upload files to the OneDrive for Business for your app workspace

1.  In Power BI, switch to the app workspace, so the workspace name is in the top-left corner. 

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_GrpWkspaceAdmin.png)

2.  Select the ellipsis (**…**) next to the app workspace name \> **Files** to open the OneDrive for Business for your app workspace on Office 365.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_GrpWkspaceFiles.png)

    > [AZURE.NOTE] If you don't see **Files** on the app workspace menu, select **Members** to open the OneDrive for Business for your app workspace. There, select **Files**. Office 365 sets up a OneDrive storage location for your group workspace files. This process may take some time. 

3.  Here, you can upload your files to the OneDrive for Business for your app workspace. Select **Upload**, and navigate to your files.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_GrpFilesOneDrive.png)


## 2 Import Excel files as datasets or as Excel Online workbooks

Now that your files are in the OneDrive for Business for your app workspace, you have a choice. You can: 

-   [Import the data from the Excel workbook as a dataset](powerbi-service-get-data-from-files.md), and use the data to build reports and dashboards you can view in a web browser and on mobile devices.

-   Or [connect to a whole Excel workbook in Power BI](powerbi-bring-in-whole-excel-files.md) and display it exactly as it appears in Excel Online.

### Import or connect to the files in your app workspace

1.  In Power BI, switch to the app workspace, so the app workspace name is in the top-left corner. 

2.  Select **Get Data** at the bottom of the left navigation pane. 

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_GetData.png)


3.  In the **Files** box, select **Get**.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_GetFiles.png)

4. Select **OneDrive** - *Your App Workspace Name*.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/pbi_grp_one_drive_shrpt.png)

5. Select the file you want > **Connect**.

    This is the point where you decide whether to [import the data from the Excel workbook](powerbi-service-get-data-from-files.md), or [connect to the whole Excel workbooks](powerbi-bring-in-whole-excel-files.md).

7. Select **Import** or **Connect**.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/PBI_ImportExcelDataOrWholeCrop.png)

8. After you import or connect, these new items are marked with a yellow asterisk.  

    Excel files have an Excel icon and are under **Reports**.

    ![](media/powerbi-service-connect-to-files-on-your-groups-onedrive-for-business/pbi_excel_file.png)

## Next steps
- [Create apps and app workspaces in Power BI](powerbi-service-create-apps.md)
- [Import data from Excel workbooks](powerbi-service-get-data-from-files.md)
- [Connect to whole Excel workbooks](powerbi-bring-in-whole-excel-files.md)
- More questions? [Try the Power BI Community](http://community.powerbi.com/)
