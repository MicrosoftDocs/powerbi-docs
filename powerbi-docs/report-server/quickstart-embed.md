---
title: "Embed a Power BI Report Server report using an iFrame in SharePoint Server"
description: This article shows how to embed a Power BI Report Server report in an iFrame in SharePoint Server
author: kfollis
ms.author: kfollis
ms.date: 10/02/2023
ms.topic: conceptual
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.custom: mvc
#Customer intent: As a Power BI Report Server developer, I want to embed my PBI RS reports in an iFrame, so that I can show my reports in other applications.
---
# Embed a Power BI Report Server report using an iFrame in SharePoint Server

In this article, you learn how to embed a Power BI Report Server report by using an iFrame in a SharePoint page. If you're working with SharePoint Online, Power BI Report Server must be publicly accessible. In SharePoint Online, the Power BI Web part that works with the Power BI service won't work with Power BI Report Server.  

![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)

## Prerequisites
* [Power BI Report Server](https://powerbi.microsoft.com/report-server/) installed and configured.
* [Power BI Desktop for Power BI Report Server](install-powerbi-desktop.md) installed.
* A [SharePoint Server 2013, 2016, 2019, or Subscription Edition environment](/sharepoint/install/install) installed and configured.
* Internet Explorer 11 is only supported if the document mode is set to IE11 (Edge) mode or when using SharePoint Online. You may use other supported browsers with SharePoint on-premises and SharePoint Online.

## Create the Power BI report URL

1. Download the sample from GitHub: [Blog Demo](https://github.com/Microsoft/powerbi-desktop-samples). Select **Clone or download**, and then select **Download ZIP**.

    ![Download sample PBIX file](media/quickstart-embed/quickstart_embed_14.png)

2. Unzip the file, and open the sample .pbix file in Power BI Desktop for Power BI Report Server.

    ![PBI RS Desktop tool](media/quickstart-embed/quickstart_embed-02.png)

3. Save the report to the **Power BI Report Server**. 

    ![PBI RS Save](media/quickstart-embed/quickstart_embed_03.png)

4. View report in the Power BI Report Server web portal.

    ![Web portal](media/quickstart-embed/quickstart_embed_04.png)

### Capture the URL parameter

After you have your URL, you can create an iFrame within a SharePoint page to host the report. For any Power BI Report Server report URL, add the following query string parameter to embed your report in a SharePoint iFrame: `?rs:embed=true`.

   For example:
    ``` 
    https://myserver/reports/powerbi/Sales?rs:embed=true
    ```
## Embed the report in a SharePoint iFrame

1. Navigate to a SharePoint **Site Contents** page.

    ![Site Contents page](media/quickstart-embed/quickstart_embed_05.png)

2. Choose the page where you want to add your report.

    ![Site Contents page app](media/quickstart-embed/quickstart_embed_06.png)

3. Select the gear icon on the top right, and then select **Edit page**.

    ![Edit page option](media/quickstart-embed/quickstart_embed_07.png)

4. Select **Add a Web Part**.

5. Under **Categories**, select **Media and Content**. Under **Parts**, select **Content Editor**, and then select **Add**.

    ![Select Content Editor Web Part](media/quickstart-embed/quickstart_embed_09.png)

6. Select **Click here to add new content**.

7. From the top menu, select **Format Text**, and then select **Edit Source**.

     ![Edit Source](media/quickstart-embed/quickstart_embed_11.png)

8. In the **Edit Source** window, paste your iFrame code in **HTML Source**, and then select **OK**.

    ![iFrame code](media/quickstart-embed/quickstart_embed_12.png)

     For example:
     ```html
     <iframe width="800" height="600" src="https://myserver/reports/powerbi/Sales?rs:embed=true" frameborder="0" allowFullScreen="true"></iframe>
     ```

9. In the top menu, select **Page**, and then select **Stop Editing**.

    ![Stop Editing](media/quickstart-embed/quickstart_embed_13.png)

    The report appears on the page.

    ![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)

## Related content

- [Create a Power BI report for Power BI Report Server](quickstart-create-powerbi-report.md).  
- [Create a paginated report for Power BI Report Server](quickstart-create-paginated-report.md).  

More questions? [Try the Power BI Community](https://community.powerbi.com/).
