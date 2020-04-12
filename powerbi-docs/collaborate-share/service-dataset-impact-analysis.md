---
title: Dataset impact analysis (preview)
description: Visualize and analyze downstream impact of making changes to datasets.
author: paulinbar
ms.reviewer: 

ms.service: powerbi
ms.topic: conceptual
ms.date: 03/22/2020
ms.author: painbar

LocalizationGroup: 
---
# Dataset impact analysis (preview)

When you make changes to a dataset, or are considering making changes, it is important to be able to assess the impact those changes will have on downstream reports and dashboards that depend on that database. **Dataset impact analysis** provides you with information that can help you make this assessment.
* It shows you how many workspaces, reports, and dashboards might be affected by your change, and provides easy navigation to the workspaces where the affected reports and dashboards are located so that you can investigate further.
* It shows you how many unique visitors and page views there are on the potentially affected items. This helps you determine the seriousness of the change for the downstream item. For instance, it is probably more important to investigate the effect of a change on a report that has 20,000 unique viewers than it is to investigate the effect of the change on a report that has 3 viewers.
* It provides an easy way of notifying the relevant people about a change you made or are thinking about making.

You can perform dataset impact analysis on both shared and unshared datasets. However, it is particularly useful for datasets which are shared across workspaces, where it is much more complicated to get a clear picture of downstream dependencies than it is with unshared datasets, all of whose dependencies are located in the same workspace as the dataset itself.

Dataset impact analysis is easily launched from within [data lineage view](service-data-lineage.md).

## Identifying shared datasets

In lineage view, different dataset icons indicate whether a dataset is being shared across workspaces or just being used internally within the workspace.

![Shared and unshared dataset icons](media/service-dataset-impact-analysis/shared-unshared-icon.png)

While dataset impact analysis can be performed on both shared and unshared datasets, it is particularly useful for datasets that are shared across workspaces. 

## Perform dataset impact analysis

To see all the downstream dependencies for a dataset, click the impact analysis button on the dataset node.

![Dataset impact analysis button](media/service-dataset-impact-analysis/open-analysis-pane-button.png)

You can perform impact analysis on any dataset in the workspace. , whether it is shared or not. You cannot perform impact analysis on external datasets that are displayed in lineage view but that are located in another workspace. To perform impact analysis on an external dataset, you need to navigate to the source workspace.

![Dataset impact analysis side pane](media/service-dataset-impact-analysis/analysis-pane.png)

## View usage metrics: viewers and views

You can see the total number of views that summarize the number of views for all the downstream reports and dashboards that are connected to the dataset.

![Dataset impact analysis summary](media/service-dataset-impact-analysis/summary.png)

In addition, you can see the usage breakdown for each workspace, report and dashboard. The usage metrics can assist you to understand how the dataset is being used across the tenant and also to assess how big is the impact of your dataset and how careful you should be before making a change. 
The usage metrics includes two metrics: 
* Viewers – number of distinct users that viewed a report or dashboard 
* Views – number of views for report or dashboard

The usage metrics relates to the last 30 days excluding today.
It counts also usage that comes from related apps.


## Notify contacts

If you've made a change to a dataset or are thinking about making a change, you might want to contact the relevant users to tell them about the change. When you notify users, an email is sent out to the [contact lists](service-create-the-new-workspaces.md#workspace-contact-list) of the all the impacted workspaces.

Click **Notify contacts** to send a message to the contact lists of all the impacted workspaces.

![Notify contacts dialog](media/service-dataset-impact-analysis/notify-contacts-dialog.png)

After selecting the notify contacts button, you will be prompt with a message that allows you to provide a custom text to describe the exact change and its timeline. 
The message is sent as an email from the Power BI service to everyone on contact lists of all the impacted workspaces. The contact list is defined by default to the workspace admins. For personal workspaces that are impacted, the workspace owner will get the email. 
Your name will be on the email that is sent so the contacts can find you and reply back with a new email thread. 

## Privacy

* To perform dataset impact analysis, you must have write permissions on the dataset.
* You only see names of workspaces, reports, and dashboards that you have access to. This is because some item names may contain personal information. Items that you don't have access to are listed as **Limited access**.
* Even if you don't have access to some workspaces, you will still see summarized usage metrics for those workspaces, and your notify contacts messages will reach the contact lists of those workspaces.

## Impact analysis from Power BI Desktop

Power BI Desktop is where users change their datasets. When republishing a dataset to the service you will get a message that tells you what items might be impacted because of this dataset change. If there is more than one workspace with reports and dashboards connected, then you will see the number of workspaces in the message. You will see also the number of reports and dashboards connected. 
In the message you will see a link to a link that takes you to the full dataset impact analysis in the service, where you can see more information and take an action to mitigate the risk of this change. 

![We need to update the image later](media/service-dataset-impact-analysis/service-dataset-impact-analysis-desktop-warning.png)

Note: the information that is displayed is on potential impact and not necessarily identifying any breaking change. For example, there are cases that nothing in the reports and dashboards will change based on the dataset change but still you'll get this message that gives you more clarity on the potential impact.

## Limitations

* Usage metrics are currently not supported for classic and personal workspaces.
* The notify contacts feature is not available if the dataset you are performing impact analysis on is located in a classic workspace.

## Next steps

* [Intro to datasets across workspaces (preview)](../service-datasets-across-workspaces.md)
* [Data lineage](service-data-lineage.md)
