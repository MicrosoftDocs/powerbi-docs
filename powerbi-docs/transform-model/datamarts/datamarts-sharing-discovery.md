---
title: Sharing and discovery with datamarts (preview)
description: Share and discover data using datamarts
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-dataflows
ms.topic: how-to
ms.date: 06/29/2022
LocalizationGroup: Data from files
---

# Sharing and discovering data using datamarts (preview)

You can share your datamarts, discover through the data hub, and create reusable and auto-generated datasets to create reports in various ways in Power BI. This article describes the various ways you can share and discover datamarts.


## Sharing datamarts for consumption

Once a datamart has been created, you can share it for downstream consumption by other users in your organization. Sharing a datamart enables the recipient to access the datamart in the following ways:  
* **SQL endpoint:** Connect to the datamart’s underlying SQL endpoint and query the datamart from SQL client tools.
* **Auto-generated dataset:** Build content based on the datamart’s underlying dataset, by providing *Build* permissions.

There are a few ways to share a datamart, described in the following sections. 

### Share from a workspace

While in the workspace, select the **Share** option from the datamart’s context menu, as shown in the following image.

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-01.png" alt-text="Screenshot of sharing a datamart from a workspace.":::


### Share from the data hub

To share a datamart from the data hub, select **Share** from the datamart’s context menu within the data hub. You can perform this sharing from any of tabs in that window: **All**, **My data**, **Trusted in your org** or **Recommended**. 

The following image shows selecting the context menu from within the data hub, and selecting **Share**.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-02.png" alt-text="Screenshot of sharing a datamart from the data hub.":::


### Share from datamart information page

To share a datamart from the information page in the data hub, select the **Share** button from the ribbon at the top of the page.

The following image shows the **Share** button from the ribbon.

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-03.png" alt-text="Screenshot of sharing a datamart from the ribbon within the data hub using the ribbon.":::

You can also select the **Share datamart** button from the information panel itself, within the data hub. The following image highlights the **Share** button on the information panel.

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-04.png" alt-text="Screenshot of sharing a datamart from the information panel in the data hub using a button on the datamart information screen." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-04.png":::


### The share datamart process

Regardless of which way you choose to share a datamart, the **Share datamart** window appears so you can enter the names or email addresses of the people or groups (distribution groups or security groups) in your organization with whom you want to grant access to the datamart. 

You can choose whether recipients can reshare the datamart with others in the organization, by selecting the checkbox next to **Allow recipients to share this datamart**. 

You can also choose to send recipients a message to provide more context, by typing a message into the **Add a message (optional)** field in the **Share datamart** window. 

The following image shows the **Share datamart** window.

:::image type="content" source="media/datamarts-create-reports/datamarts-create-reports-07.png" alt-text="Screenshot of sharing a datamart from the information panel in the data hub.":::

Once you grant access, recipients receive an email stating they've been granted access to the datamart. The email includes a button titled **Open this datamart** that opens  the datamart's information page.

When recipients open the link or otherwise navigate to the shared datamart, its information page shows the SQL connection string for connecting to the datamart. Users can use client tools other than Power BI, such as SSMS, to query the datamart using T-SQL. 

The following image highlights the **SQL connection string** in a datamart information window.

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-07.png" alt-text="Screenshot of SQL connection string for a datamart." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-07.png":::



Users can build reports with the datamart or use Analyze in Excel, and can also connect to the datamart or underlying dataset from Power BI Desktop.
 
> [!NOTE]
> Sharing a datamart allows the recipient to access the datamart for downstream consumption and not to collaborate on the datamart creation. To enable other creators to collaborate on the datamart, you must provide Member, Admin or Contributor access to the workspace where the datamart is created.  


## Data hub

You can see datamarts and their associated auto-generated dataset in the data hub, which makes it easy to find, explore, and use the data. 

In the data hub, endorsed datamarts appear in the **Recommended** section of the data hub, providing quick discovery. When you select a datamart, you're taken to its information page where you can see the datamart’s metadata, supported actions, lineage, and impact analysis along with related reports on that datamart. 

The auto-generated dataset from a datamart behaves the same as other datasets in Power BI. For more information, see [data discovery using the data hub](../../connect-data/service-data-hub.md)

The following image shows how to navigate the data hub and get information about datamarts. The numbered elements in the image refer to the following corresponding information.

1.	Select a datamart to view the datamart details page.
2.	Select to display the options menu.
3.	Select to view the details summary.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-08.png" alt-text="Screenshot of how to get information about datamarts in the data hub." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-08.png":::

### Datamart details and related reports

For more information about a datamart, to explore reports, to view lineage, or to create a new report based on the dataset, select a datamart from the recommended datamarts or from datamarts in the data list. 

A page displays the information about the datamart, provides a button to create a new report, share datamart, pull data into Excel or view lineage. Related reports for the selected datamart are also displayed, if any exist. You can also navigate to the datamart editor, its settings, or manage permissions. 

The page also shows the workspace where the datamart is located, its endorsement status, its last refresh time, and any sensitivity settings that have been applied. It also displays the datamart's SQL endpoint connection string and the datamart's description.

The following image shows the datamarts information page.

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-09.png" alt-text="Screenshot of datamarts information page." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-09.png":::

You can view the lineage of the datamart by selecting **Lineage > Open lineage** from the ribbon menu. The window that appears displays the end-to-end lineage view describing the flow of data from the data source to the datamart, the underlying auto-generated dataset, and all downstream items such as reports, dashboards or apps. 

The following image shows the lineage of a datamart. 

:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-11.png" alt-text="Screenshot of datamart lineage view." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-11.png":::

You view any dependent items of the selected datamart, select the **Impact analysis** menu, which is displayed along the right side of the screen.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-12.png" alt-text="Screenshot of datamart impact analysis pane.":::


### Data hub in Power BI Desktop

The data hub in Power BI Desktop lets you discover datamarts and datasets. Once the datamart filter is selected, the list shows the datamarts to which you have access.

The following image shows how to select datamarts from the data hub **Home** ribbon menu in Power BI Desktop.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-13.png" alt-text="Screenshot of selecting datamarts from the Power B I Desktop data hub.":::

The data hub appears in a window within Power BI Desktop, as the following screen shows.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-14.png" alt-text="Screenshot of selecting datamarts displayed in the Power B I Desktop data hub." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-14.png":::


Selecting a datamart from the list enables the **Connect** button in the window. Selecting **Connect** with a datamart selected loads the datamart's underlying and autogenerated dataset, from which you can begin to build reports.


:::image type="content" source="media/datamarts-sharing-discovery/datamarts-sharing-discovery-15.png" alt-text="Screenshot of being connected to the underlying dataset from a datamart selected from the Power B I Desktop data hub." lightbox="media/datamarts-sharing-discovery/datamarts-sharing-discovery-15.png":::




## Next steps
This article provided information about creating reports using datamarts. 

The following articles provide more information about datamarts and Power BI:

* [Introduction to datamarts](datamarts-overview.md)
* [Understand datamarts](datamarts-understand.md)
* [Get started with datamarts](datamarts-get-started.md)
* [Analyzing datamarts](datamarts-analyze.md)
* [Access control in datamarts](datamarts-access-control.md)
* [Datamart administration](datamarts-administration.md)


For more information about dataflows and transforming data, see the following articles:
* [Introduction to dataflows and self-service data prep](../dataflows/dataflows-introduction-self-service.md)
* [Tutorial: Shape and combine data in Power BI Desktop](../../connect-data/desktop-shape-and-combine-data.md)

