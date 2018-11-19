---
title: Share dashboard linked to an Excel file in OneDrive - Power BI
description: Read about sharing dashboards connected to an Excel workbook on OneDrive for Business, with tiles pinned from that workbook.
author: maggiesMSFT
manager: kfile
ms.reviewer: lukaszp

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 08/02/2018
ms.author: maggies

LocalizationGroup: Share your work
---
# Share a Power BI dashboard that links to an Excel file in OneDrive
In Power BI, you can [connect to Excel workbooks on OneDrive for Business](service-excel-workbook-files.md) and pin tiles to a dashboard from that workbook. When you share that dashboard, or create a content pack that includes that dashboard:

* Your colleagues can view the tiles without needing permissions for the workbook itself. So you can create a content pack and know that your colleagues can see the tiles created from the Excel workbook on OneDrive.
* Clicking the tile opens the workbook inside of Power BI. The workbook will only open if your colleagues have at least [read permissions](https://support.office.com/article/Share-documents-or-folders-in-Office-365-1fe37332-0f9a-4719-970e-d2578da4941c) to the workbook on OneDrive for Business.

## Share a dashboard that contains workbook tiles
To share a dashboard that links back to an Excel workbook on OneDrive for Business, see [Share a dashboard](service-share-dashboards.md). The difference is that you have the option to modify the permissions for the linked Excel workbook before sharing.

  ![Share dashboard dialog box](media/service-share-dashboard-that-links-to-excel-onedrive/pbi_share_workbk.png)

1. Enter the email addresses for your colleagues.
2. To enable your colleagues to view the Excel workbook from Power BI, select **Go to OneDrive for Business to set workbook permissions**.
3. On OneDrive, [modify the permissions](https://support.office.com/article/Share-files-and-folders-and-change-permissions-9fcc2f7d-de0c-4cec-93b0-a82024800c07) as needed.
4. Select **Share**.

>[!NOTE]
>Your colleagues won't be able to pin additional tiles from that workbook, or make changes to the Excel workbook from Power BI.
> 
> 

## Create an organizational content pack with a dashboard that contains workbook tiles
When you [publish a content pack](service-organizational-content-pack-create-and-publish.md) you give access to individual colleagues or groups. When you publish a content pack that contains workbook links, you'll have the option to modify the permissions for the linked Excel workbook before publishing.

1. In the **Create content pack** screen, enter email addresses, give the content pack a title and description, and upload an image.
2. Select the dashboard and/or report that is linked to the Excel workbook on OneDrive for Business.
   
    ![Excel workbook in a content pack](media/service-share-dashboard-that-links-to-excel-onedrive/pbi_contpack_workbk.png)
3. Select **Go to OneDrive for Business to set workbook permissions**.
4. On OneDrive, [modify the permissions](https://support.office.com/article/Share-files-and-folders-and-change-permissions-9fcc2f7d-de0c-4cec-93b0-a82024800c07) as needed.
5. Select **Publish**.

## Share a dashboard from a Power BI workspace
Sharing a dashboard from a Power BI workspace is similar to sharing a dashboard from your own workspace, except that the files are located in an Office 365 workspace site, instead of your private OneDrive for Business. Modify the permissions for the Excel workbook before sharing the dashboard with people outside the workspace.

![Share from OneDrive](media/service-share-dashboard-that-links-to-excel-onedrive/pbi_onedriveshare.png)

## Next steps
* [Pin a tile to a Power BI dashboard from Excel](service-dashboard-pin-tile-from-excel.md)
* [Power BI Basic Concepts](consumer/end-user-basic-concepts.md)
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

