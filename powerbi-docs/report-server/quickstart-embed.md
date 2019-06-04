---
title: "Quickstart: Embed a Power BI Report Server report using an iFrame in SharePoint Server"
description: This quickstart shows how to embed a Power BI Report Server report in an iFrame in SharePoint Server
author: maggiesMSFT
ms.author: maggies 
ms.date: 06/04/2019
ms.topic: quickstart
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.custom: mvc
manager: kfile
#Customer intent: As a Power BI Report Server developer, I want to embed my PBI RS reports in an iFrame, so that I can show my reports in other applications.
---
# Quickstart: Embed a Power BI Report Server report using an iFrame in SharePoint Server

In this quickstart, you'll learn how to embed a Power BI Report Server report by using an iFrame in a SharePoint page. If you're working with SharePoint Online, Power BI Report Server must be publicly accessible. In SharePoint Online, the Power BI Web part that works with the Power BI service won't work with Power BI Report Server. 

![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)

## Prerequisites
* [Power BI Report Server](https://powerbi.microsoft.com/report-server/) installed and configured.
* [Power BI Desktop optimized for Power BI Report Server](install-powerbi-desktop.md) installed.
* A [SharePoint](https://docs.microsoft.com/sharepoint/install/install) environment installed and configured.

## Create the Power BI Report Server report URL

1. Download the sample from GitHub: [Blog Demo](https://github.com/Microsoft/powerbi-desktop-samples).

    ![Download sample PBIX file](media/quickstart-embed/quickstart_embed_14.png)

2. Open the sample PBIX file from GitHub in **Power BI Desktop optimized for Power BI Report Server**.

    ![PBI RS Desktop tool](media/quickstart-embed/quickstart_embed_02.png)

3. Save the report to the **Power BI Report Server**. 

    ![PBI RS Save](media/quickstart-embed/quickstart_embed_03.png)

4. View report in the **Web Portal** of the Report Server.

    ![Web Portal](media/quickstart-embed/quickstart_embed_04.png)

### Capture the URL parameter

Once you have your URL, you can create an iFrame within a SharePoint page to host the report. For any Power BI Report Server report URL, you can add a query string parameter of `?rs:embed=true` to embed your report in a SharePoint iFrame. 

   For example:
    ``` 
    http://myserver/reports/powerbi/Sales?rs:embed=true
    ```
## Embed a Power BI Report Server report in a SharePoint iFrame

1. Navigate to a SharePoint **Site Contents** page.

    ![Site Contents page](media/quickstart-embed/quickstart_embed_05.png)

2. Choose the page where you want to add your report.

    ![Site Contents page app](media/quickstart-embed/quickstart_embed_06.png)

3. Select the gear icon on the top right, and then select **Edit page**.

    ![Edit page option](media/quickstart-embed/quickstart_embed_07.png)

4. Select **Add a Web Part**.

    ![Add Web Part](media/quickstart-embed/quickstart_embed_08.png)

5. Under **Categories**, select **Media and Content**. Under **Parts**, select **Content Editor**, and then select **Add**.

    ![Select Content Editor Web Part](media/quickstart-embed/quickstart_embed_09.png)

6. Select **Click here to add new content**.

7. From the top menu, select **Format Text**, and then select **Edit Source**.

     ![Edit Source](media/quickstart-embed/quickstart_embed_11.png)

8. In the **Edit Source** window, paste your iFrame code in **HTML Source**, and then select **OK**.

    ![iFrame code](media/quickstart-embed/quickstart_embed_12.png)

     For example:
     ```html
     <iframe width="800" height="600" src="http://myserver/reports/powerbi/Sales?rs:embed=true" frameborder="0" allowFullScreen="true"></iframe>
     ```

9. In the top menu, select **Page**, and then select **Stop Editing**.

    ![Stop Editing](media/quickstart-embed/quickstart_embed_13.png)

10. You should now see the report on the page.

    ![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)

## Next steps

[Quickstart: Create a Power BI report for Power BI Report Server](quickstart-create-powerbi-report.md)  
[Quickstart: Create a paginated report for Power BI Report Server](quickstart-create-paginated-report.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/). 