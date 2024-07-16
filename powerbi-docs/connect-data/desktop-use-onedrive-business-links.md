---
title: Use OneDrive for work or school links in Power BI Desktop
description:  Learn how to use online links for Excel files stored in OneDrive for work or school to create reports and visuals Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Connect to data
---
# Use OneDrive for work or school links in Power BI Desktop

Many people have Excel workbooks stored in OneDrive for work or school that would be great for use with Power BI Desktop. With Power BI Desktop, you can use online links for Excel files stored in OneDrive for work or school to create reports and visuals. You can use a OneDrive for work or school group account or your individual OneDrive for work or school account.

Getting an online link from OneDrive for work or school requires a few specific steps. The following sections explain those steps, which let you share the file link among groups, across different machines, and with your coworkers.

## Get a link from Excel

1. Navigate to your OneDrive for work or school location using a browser. Select the ellipses (...) to open the **More** menu, then select **Details**.

   :::image type="content" source="media/desktop-use-onedrive-business-links/use-onedrive-links-excel-01.png" alt-text="Screenshot of selecting the more menu in OneDrive." border="true":::

   > [!NOTE]
   > Your browser interface might not look exactly like this image. There are many ways to select **Open in Excel** for files in your OneDrive for work or school browser interface. You can use any option that allows you to open the file in Excel.

1. In the **More details** pane that appears, select the *copy* icon next to **Path**.

   :::image type="content" source="media/desktop-use-onedrive-business-links/use-onedrive-links-excel-02.png" alt-text="Screenshot of the More details pane, showing the Copy path button selection." border="true":::

## Use the link in Power BI Desktop

In Power BI Desktop, you can use the link that you just copied to the clipboard. Take the following steps:

1. In Power BI Desktop, select **Get data** > **Web**.

   :::image type="content" source="media/desktop-use-onedrive-business-links/power-bi-web-link-onedrive.png" alt-text="Screenshot of the Get Data ribbon in Power BI Desktop, showing the Web selection." border="true":::

1. With the **Basic** option selected, paste the link into the **From Web** dialog.

   :::image type="content" source="media/desktop-use-onedrive-business-links/power-bi-web-link-confirmation.png" alt-text="Screenshot of the From Web dialog." border="true":::

1. If Power BI Desktop prompts you for credentials, choose either **Windows** for on-premises SharePoint sites or **Organizational Account** for Microsoft 365 or OneDrive for work or school sites.

   :::image type="content" source="media/desktop-use-onedrive-business-links/odb-links_06.png" alt-text="Screenshot of the Power BI Desktop credential prompt, showing Windows or Organizational account selection." border="true":::

   A **Navigator** dialog appears. It allows you to select from the list of tables, sheets, and ranges found in the Excel workbook. From there, you can use the OneDrive for work or school file just like any other Excel file. You can create reports and use it in semantic models like you would with any other data source.

> [!NOTE]
> To use a OneDrive for work or school file as a data source in the Power BI service, with **Service Refresh** enabled for that file, make sure you select **OAuth2** as the **Authentication method** when you configure refresh settings. Otherwise, you might encounter an error when you attempt to connect or to refresh, such as, *Failed to update data source credentials*. Selecting **OAuth2** as the authentication method avoids that credentials error.
