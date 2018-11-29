---
title: Use OneDrive for Business links in Power BI Desktop
description: Use OneDrive for Business links in Power BI Desktop
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Use OneDrive for Business links in Power BI Desktop
Many people have Excel workbooks stored on their OneDrive for Business drive that would be great for use with Power BI Desktop. With **Power BI Desktop**, you can use online links for **Excel** files stored in **OneDrive for Business** to create reports and visuals. You can use a **OneDrive for Business** group account, or your individual **OneDrive for Business** account.

Getting an online link from **OneDrive for Business** does require a few specific steps. The following sections explain those steps, which let you share the file link among groups, across different machines, and with your coworkers.

## Get a link from Excel, starting in the browser
1. Navigate to your OneDrive for Business location using a browser. Right-click the file you want to use, and select **Open in Excel**.
   
   > [!NOTE]
   > Your browser interface might not look exactly like the following image. There are many ways to select **Open in Excel** for files in your **OneDrive for Business** browser interface. You can use any option that allows you to open the file in Excel.
   > 
   > 
   
   ![](media/desktop-use-onedrive-business-links/odb-links_02.png)
2. In **Excel**, select **File > Info** and select the link above the **Protect Workbook** button. Select **Copy link to clipboard** (your version might say **Copy path to clipboard**).
   
   ![](media/desktop-use-onedrive-business-links/odb-links_03.png)

## Use the link in Power BI Desktop
In Power BI Desktop, you can use the link you just copied to the clipboard. Take the following steps:

1. In Power BI Desktop, select **Get Data > Web**.
   
   ![](media/desktop-use-onedrive-business-links/odb-links_04.png)
2. Paste the link into the **From Web** dialog (do **not** select OK yet).
   
    ![](media/desktop-use-onedrive-business-links/odb-links_05.png)
3. Notice the *?web=1* string at the end of the link - you must *remove that portion of the Web URL string* **before** selecting **OK**, in order for **Power BI Desktop** to properly navigate to your file.
4. If **Power BI Desktop** prompts you for credentials, choose either **Windows** (for on-premises SharePoint sites) or **Organizational Account** (for Office 365 or OneDrive for Business sites).
   
   ![](media/desktop-use-onedrive-business-links/odb-links_06.png)

A **Navigator** window appears, allowing you to select from the list of tables, sheets, and ranges found in the Excel workbook. From there, you can use the OneDrive for Business file just like any other Excel file, and create reports and use it in datasets like you would with any other data source.

> [!NOTE]
> To use a **OneDrive for Business** file as a data source in the Power BI service, with **Service Refresh** enabled for that file, make sure you select **OAuth2** as the **Authentication method** when configuring your refresh settings. Otherwise, you may encounter an error (such as *Failed to update data source credentials*) when you attempt to connect or to refresh. Selecting **OAuth2** as the authentication method remedies that credentials error.
> 
> 

