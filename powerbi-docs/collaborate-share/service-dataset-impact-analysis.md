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

Dataset impact analysis makes it easier to track and analyze the use of shared datasets, so that when dataset owners need to make changes to their datasets, they can assess the downstream impact of changes their changes and take action to mitigate any risks that those changes create.

## Identifying shared datasets

In lineage view, different dataset icons indicate whether a dataset is being shared across workspaces or just being used internally within the workspace.

![Shared and unshared dataset icons](media/service-dataset-impact-analysis/dataset-impact-analysis-shared-unshared-icon.png)

While dataset impact analysis can be performed on both shared and unshared datasets, it is particularly useful for datasets that are shared across workspaces. 

## Perform dataset impact analysis

To see all the downstream dependencies for a dataset, click the impact analysis button on the dataset node.

![Dataset impact analysis button](dataset-impact-analysis-button.png)

You can perform impact analysis on any dataset in the workspace, whether it is shared or not. You cannot perform impact analysis on external datasets that are displayed in lineage view but that located in another workspace. To perform impact analysis on an external dataset, you need to navigate to the source workspace.

## View usage metrics: viewers and views

You can see the total number of views that summarize the number of views for all the downstream reports and dashboards that are connected to the dataset.

![image placeholder]()

In addition, you can see the usage breakdown for each workspace, report and dashboard. The usage metrics can assist you to understand how the dataset is being used across the tenant and also to assess how big is the impact of your dataset and how careful you should be before making a change. 
The usage metrics includes two metrics: 
* Viewers – number of distinct users that viewed a report or dashboard 
* Views – number of views for report or dashboard
The usage metrics relates to the last 30 days excluding today.
It counts also usage that comes from related apps.


## Notify contacts

If a dataset change already happened or is about to happen, you might want to choose to contact the relevant users to tell them about the change.

![Image placeholder]()

After selecting the 'Notify contacts' button, you will be prompt with a message that allows you to provide a custom text to describe the exact change and its timeline. 
The message will be sent as an email from Power BI service to all the workspaces' contact list. The contact list is defined by default to the workspace admins. For personal workspaces that are impacted, the workspace owner will get the email. 
Your name will be on the email that is sent so the contacts can find you and reply back with a new email thread. 

## Privacy

* To perform dataset impact analysis, you have to have write permissions to the dataset.
* There are cases that items names might contain personal information and as such you can only see names of workspaces, reports and dashboards that you have access to. In case that you don't have access to some workspaces, you will still be able to see their related usage metrics and when you use 'Notify contacts' you'll also reach to those contacts for workspaces that you don't have access to.

## Impact analysis from Power BI Desktop

Power BI Desktop is where users change their datasets. When republishing a dataset to the service you will get a message that tells you what items might be impacted because of this dataset change. If there is more than one workspace with reports and dashboards connected, then you will see the number of workspaces in the message. You will see also the number of reports and dashboards connected. 
In the message you will see a link to a link that takes you to the full dataset impact analysis in the service, where you can see more information and take an action to mitigate the risk of this change. 

![We need to update the image later]()

Note: the information that is displayed is on potential impact and not necessarily identifying any breaking change. For example, there are cases that nothing in the reports and dashboards will change based on the dataset change but still you'll get this message that gives you more clarity on the potential impact.

## Limitations

* Usage metrics is currently not supported for classic workspaces and personal workspaces.
* Notify contacts feature is not available if your dataset that you perform impact analysis on, is in classic workspace

## Next steps

* [Intro to datasets across workspaces (preview)](../service-datasets-across-workspaces.md)
* [Data lineage](service-data-lineage.md)
