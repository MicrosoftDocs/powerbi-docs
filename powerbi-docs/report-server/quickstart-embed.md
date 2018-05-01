---
title: Embed a report using an iFrame
description: Installing Power BI Reports Server itself is very quick. From downloading, to installing and configuring, you should be up and running services: powerbi
author: markingmyname
ms.date: 05/03/2018
ms.topic: quickstart
ms.service: powerbi
ms.custom: mvc
manager: kfile
#Customer intent: As a Power BI Report Server (PBI RS) developer, I want to embed my PBI RS reports in an iFrame, so that I can show my reports in other applications.
---
# Quickstart: Embed a Power BI Report Server report using an iFrame in SharePoint

In this quickstart you will learn how to embed a Power BI Report Server report by using an iFrame in a SharePoint page.

![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)

If you're not signed up to use Power BI Report Server, [sign up for a free trial](https://powerbi.microsoft.com/en-us/report-server/) before you begin.
## Prerequisites
* You will need to have Power BI Report Server installed and configured.
* You will need to have the Power BI Report Server Desktop tool installed.
* You will need to have a SharePoint environment installed and configured. 
## Creating the Power BI Report Server report URL

1. Download the sample from GitHub - [Blog Demo](https://github.com/Microsoft/powerbi-desktop-samples).

2. Open up the sample PBIX file from GitHub in the Power BI Report Server Desktop tool.

    ![PBI RS Desktop tool](media/quickstart-embed/quickstart_embed_02.png)

3. Save the report to the Power BI Report Server.

    ![PBI RS Save](media/quickstart-embed/quickstart_embed_03.png)

4. View report in the Web Portal.

    ![Web Portal](media/quickstart-embed/quickstart_embed_04.png)
### Capturing the URL parameter

Once you have your URL, you can create an iFrame within a SharePoint page, to host the report. For any Power BI Report Server report URL you can add a querystring parameter of `?rs:Embed=true` to embed your report into an iFrame.

For example:
```
<iframe width="800" height="600" src="http://myserver/reports/powerbi/Sales?rs:embed=true" frameborder="0" allowFullScreen="true"></iframe>
```
## Embedding a Power BI Report Server report in a SharePoint iFrame

1. Navigate to a SharePoint Site Contents page.

    ![Site Content Page](media/quickstart-embed/quickstart_embed_05.png)

2. Choose which app from the Site Contents page to add the report to.

    ![Site Content Page App](media/quickstart-embed/quickstart_embed_06.png)

3. Select the gear on the top right and select Edit Page.

    ![Edit Page option](media/quickstart-embed/quickstart_embed_07.png)

4. Select Add Web Part

    ![Add Web Part](media/quickstart-embed/quickstart_embed_08.png)

5. Under Categories select Media and Content, Under Parts, select Content Editor, and then select Add.

    ![Select Content Editor Web Part](media/quickstart-embed/quickstart_embed_09.png)

6. Select click here to add new content.

    ![Add new content](media/quickstart-embed/quickstart_embed_10.png)

7. In the ribbon select the Format Text tab then select Edit Source.

     ![Edit Source](media/quickstart-embed/quickstart_embed_11.png)

8. In the Edit Source window paste your iFrame code and select OK.

    ![iFrame code](media/quickstart-embed/quickstart_embed_12.png)

    ```
    <iframe width="800" height="600" src="http://myserver/reports/powerbi/Sales?rs:embed=true" frameborder="0" allowFullScreen="true"></iframe>
    ```

9. In the ribbon select the Page tab and select Stop Editing.

    ![Stop Editing](media/quickstart-embed/quickstart_embed_13.png)

10. Now you should see the report on the page.

    ![iFrame sample](media/quickstart-embed/quickstart_embed_01.png)
## Next steps

[Quickstart: Create a Power BI report for Power BI Report Server](quickstart-create-powerbi-report.md)  
[Quickstart: Create a paginated report for Power BI Report Server](quickstart-create-paginated-report.md)  

More questions? [Try asking the Power BI Community](https://community.powerbi.com/) 