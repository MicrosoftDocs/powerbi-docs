---
title: Use OneDrive for Business links in Power BI Desktop
description: Use OneDrive for Business links in Power BI Desktop
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/20/2021
LocalizationGroup: Connect to data
---
# Use OneDrive for Business links in Power BI Desktop
Many people have Excel workbooks stored in OneDrive for Business that would be great for use with Power BI Desktop. With Power BI Desktop, you can use online links for Excel files stored in OneDrive for Business to create reports and visuals. You can use a OneDrive for Business group account or your individual OneDrive for Business account.

Getting an online link from OneDrive for Business requires a few specific steps. The following sections explain those steps, which let you share the file link among groups, across different machines, and with your coworkers.

## Get a link from Excel
1. Navigate to your OneDrive for Business location using a browser. Right-click the file you want to use, and select **Open in Excel**.
   
   > [!NOTE]
   > Your browser interface might not look exactly like the following image. There are many ways to select **Open in Excel** for files in your OneDrive for Business browser interface. You can use any option that allows you to open the file in Excel.
   
   ![Screenshot of OneDrive in a browser, showing the Open in Excel selection.](media/desktop-use-onedrive-business-links/odb-links_02.png)

2. In Excel, select **File** > **Info**, and then select the **Copy path** button, as shown in the following image.
   
   ![Screenshot of the Info menu, showing the Copy path button selection.](media/desktop-use-onedrive-business-links/onedrive-copy-path.png)

## Use the link in Power BI Desktop
In Power BI Desktop, you can use the link you just copied to the clipboard. Take the following steps:

1. In Power BI Desktop, select **Get data** > **Web**.
   
   ![Screenshot of the Get Data ribbon in Power B I Desktop, showing the Web selection.](media/desktop-use-onedrive-business-links/power-bi-web-link-onedrive.png)
2. With the **Basic** option selected, paste the link into the **From Web** dialog box.
3. Remove the *?web=1* string at the end of the link so that Power BI Desktop can properly navigate to your file, and then select **OK**.
   
    ![Screenshot of the From Web dialog, showing how to remove a string from the U R L field.](media/desktop-use-onedrive-business-links/power-bi-web-link-confirmation.png) 
4. If Power BI Desktop prompts you for credentials, choose either **Windows** (for on-premises SharePoint sites) or **Organizational Account** (for Microsoft 365 or OneDrive for Business sites).
   
   ![Screenshot of the Power B I Desktop credential prompt, showing Windows or Organizational account selection.](media/desktop-use-onedrive-business-links/odb-links_06.png)

   A **Navigator** dialog box appears, allowing you to select from the list of tables, sheets, and ranges found in the Excel workbook. From there, you can use the OneDrive for Business file just like any other Excel file. You can create reports and use it in datasets like you would with any other data source.

> [!NOTE]
> To use a OneDrive for Business file as a data source in the Power BI service, with **Service Refresh** enabled for that file, make sure you select **OAuth2** as the **Authentication method** when configuring your refresh settings. Otherwise, you may encounter an error (such as, *Failed to update data source credentials*) when you attempt to connect or to refresh. Selecting **OAuth2** as the authentication method remedies that credentials error.
>
