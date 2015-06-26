<properties pageTitle="appFigures content pack for Power BI" description="appFigures content pack for Power BI" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/25/2015" ms.author="v-anpasi"/>
#appFigures content pack for Power BI

[← Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770-services-in-power-bi)

Tracking important statistics about your apps is easy with Power BI and the appFigures content pack. Power BI retrieves your data, including app sales, downloads, and ad statistics, then builds a default dashboard and related reports based on that data.

![](media/powerbi-content-pack-appfigures/appFiguresDoc_01.png)

After you have created the connection, you can explore your data and customize the dashboard to meet your needs. Data is automatically refreshed every day.

1. In the navigation pane on the left, click **Get Data**.  

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_02.png)

2. In the **Services** box, select **Get**.

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_02b.png)

3. Click **appFigures** and select **Connect**.

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_03.png)

4. Select **oAuth2** for Authentication Method and select **Sign In**.

5. When prompted, enter your appFigures credentials and follow the appFigures authentication process.

	The first time you connect you will be prompted to allow Power BI read-only access to your account. Select **Allow** to begin the import process. This can take a few minutes depending on the volume of data in your account.

	![](media/powerbi-content-pack-appfigures/appFiguresDoc_06.png)

6. After Power BI imports the data you will see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*:

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_07.png)

7. Select the appFigures dashboard. This is the default dashboard that Power BI created to display your data. You can modify this dashboard to display your data in any way you want.

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_08.png)
## What can you do now?

- Try [asking a question in the Q&A box](https://support.powerbi.com/knowledgebase/articles/474566-q-a-in-power-bi-preview) at the top of the dashboard, such as "total downloads by product"

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_10.png)

- [Change the tiles](https://support.powerbi.com/knowledgebase/articles/424878) in the dashboard.

- [Select a tile](https://support.powerbi.com/knowledgebase/articles/425669) to open the underlying report.

- Rename the dashboard: Select the ellipsis (…) next to the appFigures dashboard \> **Rename**.

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_09.png)

- While your dataset will be refreshed automatically, you can also refresh it on demand using **﻿Refresh Now**﻿

  ![](media/powerbi-content-pack-appfigures/appFiguresDoc_12.png)


## Dataset

The following data is available from appFigures in Power BI.

| **Table Name** | **Description** |
|----------------|-----------------|
| Countries | This table provides country name information. |
| Dates | This table contains dates from today back to the earliest PublishDate of apps that are Active and Visible in your appFigures account. |
| Events | This table contains download, sales, and ad information for each app, by country, on a daily basis. Note that both app and in-app purchase information is all in this single table—you can use the **Type** column to differentiate. |
| Inapps | This table contains data about the different types of In-App Purchases that are associated with Active, Visible apps on your appFigures account. |
| Products | This table contains data about the different apps that are Active and Visible on your appFigures account. |

## Troubleshooting

If data from some of your apps is not showing up in Power BI, check to make sure that those apps are Visible and Active on the **apps** tab of the appFigures site.

![](media/powerbi-content-pack-appfigures/appFiguresDoc_11.png)

## See Also

[Get started in Power BI](https://support.powerbi.com/knowledgebase/articles/430814-get-started-with-power-bi)  
﻿[Get data in Power BI](https://support.powerbi.com/knowledgebase/topics/63369)  
﻿[Services in Power BI](https://support.powerbi.com/knowledgebase/topics/88770)  