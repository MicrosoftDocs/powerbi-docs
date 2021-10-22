---
title: Data source impact analysis
description: Understand where your data source is being used.
author: paulinbar
ms.author: painbar
ms.reviewer: 
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 10/19/2021
LocalizationGroup: 
---
# Data source impact analysis

Data source impact analysis helps you see where your data source is being used throughout your organization. This can be useful when the data source is temporarily or permanently taken offline, and you want to get an idea about who is impacted. It shows you how many workspaces, dataflows, and datasets use the data source, and provides easy navigation to the workspaces where the affected dataflows and datasets are located so that you can investigate further.

Data source impact analysis can also help you spot data duplication in the tenant, such as when a number of different users build similar models on top of the same data source. By helping you discover such redundant datasets and dataflows, data source impact analysis supports the goal of having "a single source of truth".

## Perform data source impact analysis

To perform data source impact analysis:

1. Go to the workspace that contains the data source you're interested in and open [lineage view](service-data-lineage.md).
1. Find the data source's card and click the impact analysis icon.

    ![Screenshot of data source card showing impact analysis button.](media/service-data-source-impact-analysis/data-source-impact-analysis-button.png)
 
The impact analysis side panel opens.

![Screenshot of data source impact analysis side pane.](media/service-data-source-impact-analysis/data-source-impact-analyis-side-pane.png)
 
* **Data source type**: Indicates the data source type
* **Path to data source**: Path to the data source as defined in Power BI Desktop. For example, in the image above, the path to the SQL server database data source is the connection string "twitterDB-yaronctestingdb1.database.windows.net", as defined in Power BI Desktop (shown below). It consists of the database name "twitterDB" and the server name "yaronctestingdb1.database.windows.net".

    ![Screenshot of connection string definition in Power B I Desktop.](media/service-data-source-impact-analysis/connection-string-definition-in-desktop.png)
 
* **Impact summary**: Shows you the number of potentially impacted workspaces, dataflows, and datasets. This count includes workspaces you don't have access to.
* **Usage breakdown**: Shows you, for each workspace, the names of the impacted dataflows and datasets. To further explore the impact on a particular workspace, click the workspace name to open the workspace. Once in the affected workspace, use [dataset impact analysis](service-dataset-impact-analysis.md) to see the usage details about connected reports and dashboards.

## Notify contacts

If you've made a change to a data source or are thinking about making a change, you might want to contact the relevant users to tell them about it. When you notify contacts, an email is sent to the [contact lists](service-create-the-new-workspaces.md#create-a-contact-list) of all the impacted workspaces (in case of classic workspaces, the email is sent to the workspace administrators). Your name appears on the email so the contacts can find you and reply back in a new email thread. 

1. Click **Notify contacts** in the impact analysis side pane. The notify contacts dialog will appear.

   ![Screenshot of data source notify contacts dialog.](media/service-data-source-impact-analysis/notify-contacts-dialog.png)

1. In the text box, provide some detail about the change.
1. When the message is ready, click **Send**.

## Privacy

In the impact analysis side pane, you only see real names for workspaces, datasets, and dataflows that you have access to. Items that you don't have access to are listed as Limited access. This is because some item names may contain personal information.
The impact summary counts include all impacted dataflows and datasets, even those that reside in workspaces you don't have access to.

## Considerations and limitations

Data source impact analysis is not yet supported for paginated reports, so you will not see if the data source has any direct impact on these kinds of reports in the tenant.

## Next steps

* [Dataset impact analysis](service-dataset-impact-analysis.md)
* [Data lineage](service-data-lineage.md)