---
title: Create a report on a SharePoint List
description: This tutorial shows how to transform your SharePoint List data into a Power BI report.
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: tutorial
ms.date: 01/10/2020
ms.author: davidi

LocalizationGroup: Visualizations
---
# Create a report on a SharePoint List

Many teams and organizations use Lists in SharePoint Online to store data because it's easy to set up and easy for users to update.  Sometimes a chart is a much easier way for users to quickly understand the data rather than looking at the list itself. In this tutorial, we show how to transform your SharePoint List data into a Power BI report.

Watch this five-minute tutorial video, or scroll down for step-by-step instructions.

<iframe width="400" height="450" src="https://www.youtube.com/embed/OZO3x2NF8Ak" frameborder="0" allowfullscreen></iframe>

## Part 1: Connect to your SharePoint List

1. If you don't have it already, download and install [Power BI Desktop](https://powerbi.microsoft.com/desktop/).
2. Open Power BI Desktop and in the Home tab of the ribbon, select **Get Data** > **More**.
3. Select **Online Services**, then select **SharePoint Online List**.  

    <img src="media/desktop-sharepoint-online-list/desktop-sharepoint-online-list-getdata.png" alt="get data" width="350"/>

4. Select **Connect**.
4. Find the address (also known as a URL) of your SharePoint Online site that contains your list.  From a page in SharePoint Online, you can usually get the site address by selecting **Home** in the navigation pane, or the icon for the site at the top, then copying the address from your web browser's address bar.

   Watch a video of this step:
   <iframe width="400" height="300" src="https://www.youtube.com/embed/OZO3x2NF8Ak?start=48&end=90" frameborder="0" allowfullscreen></iframe>

5. In Power BI Desktop, paste the address into the **Site URL** field in the open dialog box.

6. You may or may not see a SharePoint access screen like the following image.  If you don't see it, skip to step 10.  If you do see it, select **Microsoft Account** on the left side of the page.

    <img src="media/desktop-sharepoint-online-list/desktop-sharepoint-online-list-auth1.png" alt="choose Microsoft account" width="500"/>

7. Select **Sign In** and enter the user name and password you use to sign in to Microsoft Office 365.

    <img src="media/desktop-sharepoint-online-list/desktop-sharepoint-online-list-auth2.png" alt="sign in" width="500"/>

8. When you finish signing in, select **Connect**.

9. On the left side of the Navigator, select the checkbox beside the SharePoint list you want to connect to.

    <img src="media/desktop-sharepoint-online-list/desktop-sharepoint-online-list-select-list.png" alt="get data" width="450"/>

10. Select **Load**.  Power BI loads your list data into a new report.

## Part 2: Create a report

1. On the left side, select the **Data** icon to see that your SharePoint list data was loaded.

2. Make sure your list columns with numbers show the Sum, or Sigma, icon in the **Fields pane** on the right.  For any that don't, select the column header in the table view, select the **Modeling** tab, then change the **Data type** to **Decimal Number** or **Whole Number**, depending on the data.  If prompted to confirm your change, select **Yes**.  If your number is a special format, like currency, you can also choose that by setting the **Format**.

   Watch a video of this step:
   <iframe width="400" height="300" src="https://www.youtube.com/embed/OZO3x2NF8Ak?start=147&end=204" frameborder="0" allowfullscreen></iframe>

3. On the left side, select the **Report** icon.
4. Select columns you want to visualize by selecting the checkbox beside them in the **Fields** pane on the right.

   Watch a video of this step:
   <iframe width="400" height="300" src="https://www.youtube.com/embed/OZO3x2NF8Ak?start=215&end=252" frameborder="0" allowfullscreen></iframe>

5. Change the visual type if you need to.
6. You can create multiple visualizations in the same report by unselecting the existing visual then selecting checkboxes for other columns in the **Fields** pane.
7. Select **Save** to save your report.
