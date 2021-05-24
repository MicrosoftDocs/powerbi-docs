---
title: Connect to datasets in the Power BI service from Power BI Desktop
description: Use a common dataset for multiple Power BI Desktop reports in multiple workspaces, and manage your report lifecycle
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 05/17/2021
LocalizationGroup: Connect to data
---
# Connect to datasets in the Power BI service from Power BI Desktop

You can establish a live connection to a shared dataset in the *Power BI service*, and create many different reports from the same dataset. You can create your perfect data model in Power BI Desktop and publish it to the Power BI service. Then you and others can create multiple different reports in separate *.pbix* files from that common data model, and save them to different workspaces. This feature is called *Power BI service live connection*.

![Get data from the Power BI service](media/desktop-report-lifecycle-datasets/report-lifecycle_01.png)

There are all sorts of benefits of this feature, including best practices, which we discuss during this article. We recommend you review the [considerations and limitations](#limitations-and-considerations) of this feature.

## Using a Power BI service live connection for report lifecycle management

One challenge with the popularity of Power BI is the proliferation of reports, dashboards, and their underlying data models. It's easy to create compelling reports in Power BI Desktop, then [publish](../create-reports/desktop-upload-desktop-files.md) those reports in the Power BI service, and to create great dashboards from those datasets. Since so many people do so, often using the same or nearly the same datasets, knowing which report was based on which dataset and how fresh each dataset might be becomes a challenge. The Power BI service live connection addresses that challenge, and makes creating, sharing, and expanding upon common-dataset reports and dashboards easier and consistent.

### Create a dataset everyone can use, then share it

Let's say Anna is a business analyst is on your team. Anna is skilled at creating good data models, often called datasets. Anna can create a dataset and report, and then share that report in the Power BI service.

![Screenshot shows the Publish button for the Power B I service.](media/desktop-report-lifecycle-datasets/report-lifecycle_02a.png)

Everyone loves Anna's report and dataset. That's where the trouble would begin. Everyone on Anna's team would attempt to create *their own version* of that dataset, then share their own reports with the team. All of the sudden, there would be a multitude of reports from different datasets in your team's workspace in the Power BI service. Which was the most recent? Were the datasets the same, or only almost? What were the differences? With the Power BI service live connection feature, all that can change for the better. In the next section, we see how others can use Anna's published dataset for their own reports, in their own workspaces, and enable everyone to use the same solid, vetted, published dataset to build their unique reports.

### Connect to a Power BI service dataset using a live connection

Anna creates a report and creates the dataset it's based upon. Anna then publishes it to the Power BI service. The report shows up in the team's workspace in the Power BI service. If Anna saves it to a *new experience workspace*. Anna can set *Build permission* to make it available to everyone in and out of their workspace to see and use.

To learn more about the new experience workspaces, see [workspaces](../collaborate-share/service-new-workspaces.md).

Other members in and out of Anna's workspace can now establish a live connection to Anna's shared data model using the Power BI service live connection feature. They can create their own unique reports, from *their original dataset*, in *their own new experience workspaces*.

In the following image, you see how Anna creates one Power BI Desktop report, and publishes it, which includes its data model, to the Power BI service. Then others can connect to Anna's data model using the Power BI service live connection, and create their own unique reports in their own workspaces, based on Anna's dataset.

![Multiple reports based on the same dataset](media/desktop-report-lifecycle-datasets/report-lifecycle_03.png)

> [!NOTE]
> If you save your dataset to a [classic shared workspace](../collaborate-share/service-create-workspaces.md), only members of that workspace build reports on your dataset. To establish a Power BI service live connection, the dataset to which you connect must be in a shared workspace of which you are a member.
> 
> 

## Step by step for using the Power BI service live connection

Now that we know how useful the Power BI service live connection is, and how you can use it as a best practice approach to report lifecycle management, let's walk through the steps that get us from Anna's great report and dataset to a shared dataset that her Power BI teammates can use.

### Publish a Power BI report and dataset

The first step in managing the report lifecycle using a Power BI service live connection is to have a report and dataset that teammates want to use. So Anna must first *publish* the report from Power BI Desktop. Select **Publish** from the **Home** ribbon in Power BI Desktop.

![Publish a report](media/desktop-report-lifecycle-datasets/report-lifecycle_02a.png)

If Anna isn't signed in to the Power BI service account, Power BI prompts Anna to do so.

![Sign in to Power BI Desktop](media/desktop-report-lifecycle-datasets/report-lifecycle_04.png)

From there, Anna can choose the workspace destination to which the report and dataset will be published. Remember, if Anna saves it to a new experience workspace, then anyone with Build permission can have access to that dataset. Build permission is set in the Power BI service, after publishing. If work is saved to a classic workspace only members who have access to the workspace where a report is published can access its dataset using a Power BI service live connection.

![Publish to the Power BI service](media/desktop-report-lifecycle-datasets/report-lifecycle_05.png)

The publishing process begins, and Power BI Desktop shows the progress.

![Publishing in progress](media/desktop-report-lifecycle-datasets/report-lifecycle_06.png)

Once complete, Power BI Desktop shows you success, and provides a couple links to get you to the report itself in the Power BI service, and a link to get quick insights about the report.

![Publishing succeeded](media/desktop-report-lifecycle-datasets/report-lifecycle_07.png)

Now that your report with its dataset is in the Power BI service, you can also *promote* it. Promotion means that you attest to its quality and reliability. You can even request that it be *certified* by a central authority in your Power BI tenant. With either of these endorsements, your dataset always appears at the top of the list when people are looking for datasets. For more information, see [Endorse your content](../collaborate-share/service-endorse-content.md).

The last step is to set Build permission for the dataset the report is based on. Build permission determines who can see and use your dataset. You can set it in the workspace itself, or when you share an app from the workspace. For more information, see [Build permission for shared datasets](service-datasets-build-permissions.md).

Next, let's see how other teammates who have access to the workspace where the report and dataset were published can connect to the dataset and build their own reports.

### Establish a Power BI service live connection to the published dataset

To establish a connection to the published report, and create your own report based on the published dataset, select **Get data** from the **Home** ribbon in Power BI Desktop, select **Power Platform** in the left pane, and then select **Power BI datasets**.

If you're not signed in, Power BI prompts you to sign in. Once signed in, Power BI shows which workspaces you're a member of. You can select which workspace contains the dataset to which you want to establish a Power BI service live connection.

The datasets in the list are all the shared datasets you have Build permission for, in any workspace. You can search for a specific dataset and see its name, owner, the workspace where it resides, and when it was last refreshed. You also see **Endorsement** for datasets, either certified or promoted, at the top of the list.

![List of available datasets](media/desktop-report-lifecycle-datasets/desktop-select-shared-dataset.png)

When you select **Create**, you establish a live connection to the selected dataset. Power BI Desktop loads the fields and their values that you see into Power BI Desktop in real time.

![Dataset fields in Fields pane](media/desktop-report-lifecycle-datasets/report-lifecycle_10.png)

Now you and others can create and share custom reports, all from the same dataset. This approach is a great way to have one knowledgeable person create a well-formed dataset, such as what Anna does. Many teammates can use that shared dataset to create their own reports.

## Limitations and considerations

When using the Power BI service live connection, there are a few limitations and considerations to keep in mind.

* Only users with Build permission for a dataset can connect to a published dataset using the Power BI service live connection.
* Free users only see datasets in their **My Workspace** and in Premium-based workspaces.
* Since this connection is a live connection, left-navigation and modeling are disabled. You can only connect to one dataset in each report. This behavior is similar to the behavior when connected to *SQL Server Analysis Services*. However, the following article describes how a new feature in Power BI now makes this possible: see [using DirectQuery for Power BI datasets and Azure Analysis Services (preview)](../connect-data/desktop-directquery-datasets-azure-analysis-services.md)
* Since this connection is a live connection, row-level security (RLS) and other such connection behaviors are enforced. This is the same as when connected to SQL Server Analysis Services.
* If the owner modifies the original shared *.pbix* file, the dataset and report that is shared in the Power BI service is overwritten. Reports based on that dataset aren't overwritten, but any changes to the dataset are reflected in the report.
* Members of a workspace can't replace the originally shared report. Attempts to do so result in a warning that prompts you to rename the file, and publish.
* If you delete the shared dataset in the Power BI service, then other reports based on that dataset will no longer work properly or display their visuals.
* For Content Packs, you must first create a copy of a content pack before using it as a basis for sharing a *.pbix* report and dataset to the Power BI service.
* For Content Packs from *My Organization*, once copied, you can't replace the report created on the service or a report created as part of copying a Content Pack with a live connection. Attempts to do so result in a warning that prompts you to rename the file, and publish. In this situation, you can only replace published live connected reports.
* Deleting a shared dataset in the Power BI service means no one can access that dataset any longer from Power BI Desktop.
* Reports that share a dataset on the Power BI service don't support automated deployments using the Power BI REST API.

## Next steps
For more information on DirectQuery and other Power BI data connection features, check out the following resources:

- [Using DirectQuery in Power BI](desktop-directquery-about.md)
- [Data sources supported by DirectQuery](power-bi-data-sources.md)
- [Using DirectQuery for Power BI datasets and Azure Analysis Services (preview)](../connect-data/desktop-directquery-datasets-azure-analysis-services.md)

Here are some additional links for more information about Power BI:

* [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
* [Query overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
* [Data types in Power BI Desktop](desktop-data-types.md)
* [Shape and combine data with Power BI Desktop](desktop-shape-and-combine-data.md)
* [Common query tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
