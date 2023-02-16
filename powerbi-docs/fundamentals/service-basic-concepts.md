---
title: Basic concepts for designers in the Power BI service
description: Learn about Power BI service concepts such as capacities, workspaces, dashboards, reports, workbooks, datasets, and dataflows.
author: mihart
ms.author: mihart
manager: kfollis
ms.reviewer: ''
ms.custom: video-B2vd4MQrz4M
ms.service: powerbi
ms.subservice: pbi-fundamentals
ms.topic: conceptual
ms.date: 02/09/2023
LocalizationGroup: Get started
---

# Basic concepts for designers in the Power BI service

The aim of this article is to orient you to the Power BI service: what the different elements are, how they work together, and how you can work with them. You might get more out of it if you've already [signed up for the Power BI service](service-self-service-signup-for-power-bi.md) and [added some data](../connect-data/service-get-data.md). As a designer, your typical workflow is usually to start by creating reports in Power BI Desktop. Then you publish them to the Power BI service, where you can continue modifying them. You also use the Power BI service to create the dashboards based on your reports.

For this article, if you don't have your own reports yet, install one of the [Power BI samples](../create-reports/sample-datasets.md).

:::image type="content" source="media/service-basic-concepts/power-bi-home-screen-new.png" lightbox="media/service-basic-concepts/power-bi-home-screen-new.png" alt-text="Screenshot of the Power BI service Home screen in a browser with numbered areas listed below.":::

When you open the Power BI service in a browser, you start at your Home screen. Here are the elements you might see:

1. Navigation pane
2. Microsoft 365 app launcher
3. Power BI home button
4. Icon buttons, including settings, help, and feedback
5. Search box
6. Recommended content that you use the most or have marked as favorites
7. **Recent**, **Favorites**, and **My apps** tabs

You and the end users for your reports and dashboards have the same start experience in the Power BI service in a browser.

We'll dig into these features later, but first let's review some Power BI concepts. Or you might want to watch this video first. In the video, Will reviews the basic concepts and gives a tour of the Power BI service.

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2vd4MQrz4M" frameborder="0" allowfullscreen></iframe>

## Power BI concepts

The major building blocks of Power BI are: *dashboards*, *reports*, *workbooks*, *datasets*, *dataflows*, and *apps*. They're all organized into *workspaces*, and they're created on *capacities*. It's important to understand capacities and workspaces before we dig into the building blocks, so let's start there.

## Capacities

Capacities are a core Power BI concept representing a set of resources (storage, processor, and memory) used to host and deliver your Power BI content. Capacities are either *shared* or *reserved*. A shared capacity is shared with other Microsoft customers, while a reserved capacity is reserved for a single customer. Reserved capacities require a [subscription](../enterprise/service-premium-what-is.md), and are fully described in [Managing Premium capacities](../enterprise/service-premium-capacity-manage.md).

By default, workspaces are created in a shared capacity. In shared capacity, workloads run on computational resources shared with other customers. As the capacity must share resources, limitations are imposed to ensure "fair play", such as the maximum model size (1 GB) and maximum daily refresh frequency (eight times per day).

## Workspaces

Workspaces are created on capacities. Essentially, they are containers for dashboards, reports, apps, workbooks, datasets, and dataflows in Power BI.

There are two types of workspaces: *My workspace* and *workspaces*.

- *My workspace* is the personal workspace for any Power BI customer to work with your own content. Only you have access to your My workspace. You can share dashboards and reports from your My workspace. If you want to collaborate on dashboards and reports, or create an app, then you want to work in a workspace.

- *Workspaces* are used to collaborate and share content with colleagues. You can add colleagues to your workspaces and collaborate on dashboards, reports, apps, workbooks, and datasets. With one exception*, each workspace member needs a Power BI Pro or Premium Per User (PPU) license.

  - For more information about workspaces, see [Create a workspace in Power BI](../collaborate-share/service-create-the-new-workspaces.md).
  - For more information about licenses, see [Power BI service per-user and capacity-based licenses](service-features-license-type.md).

  Workspaces are also the places where you create, publish, and manage *apps* for your organization. Think of workspaces as staging areas and containers for the content that will make up a Power BI app (see [the following section](#apps)).

For more information about sharing in general, see [Ways to collaborate and share in Power BI](../collaborate-share/service-how-to-collaborate-distribute-dashboards-reports.md).

Now, on to the Power BI building blocks.

## Apps

An *app* is a collection of dashboards and reports built to deliver key metrics to the Power BI consumers in your organization. Apps are interactive, but consumers can't edit them. App consumers, the colleagues who have access to the apps, don't necessarily need Pro or Premium Per User (PPU) licenses. An app can have permissions that are different than the permissions set on a workspace. This capability makes it easier for designers to manage permissions on an app.

Apps are an easy way for designers to share many types of content at one time. App designers create dashboards and reports and then bundle them together into an app. The designers share or publish the app to a location where the business user can access it. It's easier to find and install content in the Power BI service or on a mobile device when it's organized together as an app. After installing an app, the business user doesn't have to remember the names of several dashboards or reports because they're all together in one app. They can easily access the app in a browser or on a mobile device.

## Dataflows

A *dataflow* helps organizations to unify data from disparate sources. They're optional, and are often used in complex or larger projects. They represent data prepared and staged for use by datasets. Dataflows are surfaced in Power BI Desktop with a dedicated connector to enable reporting. When you connect to a dataflow, your dataset can use the previously prepared data and business logic, promoting a single source of the truth and data reusability. They leverage the extensive collection of Microsoft data connectors, enabling the ingestion of data from on-premises and cloud-based data sources.

Dataflows are created and managed only in workspaces (but not *My workspace*), and they are stored as entities in the Common Data Model (CDM) in Azure Data Lake Storage Gen2. Typically, they're scheduled to refresh on a recurring basis to store up-to-date data. They're great for preparing data for use—and potential re-use—by your datasets. For more information, see [Introduction to dataflows and self-service data prep](../transform-model/dataflows/dataflows-introduction-self-service.md).

You can't have dashboards or reports without data (well, you can have empty dashboards and empty reports, but they're not useful until they have data), so let's look at **datasets**.

## Datasets

A *dataset* is a collection of data that you *import* or *connect* to. Power BI lets you connect to and import all sorts of datasets and bring all of it together in one place. Datasets can also source data from dataflows.

Datasets are associated with *workspaces*, and a single dataset can be part of many workspaces. When you open a workspace, the associated datasets are listed under the **Datasets** tab. Each listed dataset is a source of data available for one or more reports, and the dataset can contain data that comes from one or more sources&mdash;for example, an Excel workbook on OneDrive, or an on-premises SSAS tabular dataset, or a Salesforce dataset. There are many different data sources supported, and we're adding new ones all the time. See the list of [dataset types that you can use with Power BI](../connect-data/service-get-data.md).

In the following example, we selected **My workspace** and then selected the **Datasets + dataflows** tab.

:::image type="content" source="media/service-basic-concepts/power-bi-datasets-new.png" lightbox="media/service-basic-concepts/power-bi-datasets-new.png" alt-text="Screenshot of Power BI showing a sample workspace with Datasets selected.":::

**ONE** dataset...

- Can be used over and over in one or in many workspaces.
- Can be used in many different reports.
- Visualizations from that one dataset can display on many different dashboards.

  :::image type="content" source="media/service-basic-concepts/drawing2.png" alt-text="Diagram showing dataset relationships to a report and a dashboard.":::

To [connect to or import a dataset](../connect-data/service-get-data.md), select **Create** in the nav pane. Follow the instructions to connect to or import the specific source and add the dataset to the active workspace. New datasets are marked with a yellow asterisk. The work you do in Power BI doesn't change the underlying dataset.

Datasets added by one workspace member are available to the other workspace members with an *admin*, *member*, or *contributor* role.

Datasets can be refreshed, renamed, explored, and removed. Use a dataset to create a report from scratch or by running [quick insights](../create-reports/service-insights.md). To see which reports and dashboards are already using a dataset, select **View related**. To explore a dataset, select it. What you're actually doing is opening the dataset in the report editor, where you can really start exploring the data by creating visualizations.

Now, let's move on to the next topic—reports.

### Dig deeper into datasets

- [Datasets in the Power BI service](../connect-data/service-datasets-understand.md)
- [Dataset modes in the Power BI service](../connect-data/service-dataset-modes-understand.md)
- [What is Power BI Premium?](../enterprise/service-premium-what-is.md)
- [Data sources for the Power BI service](../connect-data/service-get-data.md)
- [Get samples for Power BI](../create-reports/sample-datasets.md)

## Reports

A Power BI report is one or more pages of visualizations such as line charts, maps, and treemaps. Visualizations are also called *visuals*. All of the visualizations in a report come from a single dataset. You can create reports from scratch within Power BI, import them with dashboards that colleagues share with you, or Power BI can create them when you connect to datasets from Excel, Power BI Desktop, databases, and SaaS applications. For example, when you connect to an SaaS application, Power BI imports a pre-built report.

There are two modes to view and interact with reports: *Reading view* and *Editing view*. When you open a report, it opens in Reading view. If you have edit permissions, then you see **Edit report** in the upper-left corner, and you can view the report in Editing view. If a report is in a workspace, everyone with an *admin*, *member*, or *contributor* role can edit it. They have access to all the exploring, designing, building, and sharing capabilities of Editing view for that report. The people they share the report with can explore and interact with the report in Reading view.

When you open a workspace, the associated reports are listed under the **Content** tab. Each listed report represents one or more pages of visualizations based on only one of the underlying datasets. To open a report, select it.

When you open an app, you're presented with a dashboard or a report. If the app opens a dashboard, to access the underlying report, select a dashboard tile (more on tiles later) that was pinned from a report. Keep in mind that not all tiles are pinned from reports, so you might have to select a few tiles to find a report.

:::image type="content" source="media/service-basic-concepts/power-bi-app-dashboard.png" alt-text="Screenshot of an app that has opened to a dashboard.":::

If the app opens to a report, you'll see a list of report pages (and optionally a dashboard) along the left side.

:::image type="content" source="media/service-basic-concepts/power-bi-app-report.png" alt-text="Screenshot of an app that has opened to a report.":::

By default, the report opens in Reading view. Just select **Edit report** to open it in Editing view (if you have the necessary permissions).

In the following example, we selected **My workspace** and then chose the **Content** tab.

:::image type="content" source="media/service-basic-concepts/power-bi-reports-new.png" lightbox="media/service-basic-concepts/power-bi-reports-new.png" alt-text="Screenshot of Power BI showing a sample workspace with Content selected.":::

**ONE** report...

- Is contained in a single workspace.
- Can be associated with multiple dashboards within that workspace. Tiles pinned from that one report can appear on multiple dashboards.
- Can be created using data from one dataset. Power BI Desktop can combine more than one data source into a single dataset in a report, and that report can be imported into Power BI.

  :::image type="content" source="media/service-basic-concepts/drawing3new.png" alt-text="Diagram showing Report relationships to a dataset and a dashboard.":::

### Dig deeper into reports

- [Create a report from an Excel file in the Power BI service](../create-reports/service-report-create-new.md)
- [About mobile-optimized Power BI reports](../create-reports/power-bi-create-mobile-optimized-report-about.md)

## Dashboards

A *dashboard* is something you create **in the Power BI service** or something a colleague creates **in the Power BI service** and shares with you. It is a single canvas that contains zero or more tiles and widgets. Each tile pinned from a report or from [Q&A](../consumer/end-user-q-and-a.md) displays a single [visualization](../visuals/power-bi-report-visualizations.md) that was created from a dataset and pinned to the dashboard. Entire report pages can also be pinned to a dashboard as a single tile. There are many ways to add tiles to your dashboard; too many to be covered in this overview topic. For more information, see [Intro to dashboard tiles for Power BI designers](../create-reports/service-dashboard-tiles.md).

Why do people create dashboards?  Here are just some of the reasons:

- To see, in one glance, all the information needed to make decisions.
- To monitor the most-important information about your business.
- To ensure all colleagues are on the same page, viewing and using the same information.
- To monitor the health of a business or product or business unit or marketing campaign, and more.
- To create a personalized view of a larger dashboard&mdash;all the metrics that matter to you.

When you open a workspace, the associated dashboards are listed under the **Content** tab.

:::image type="content" source="media/service-basic-concepts/power-bi-workspace-dashboard.png" alt-text="Screenshot of a workspace that includes dashboards.":::

To open a dashboard, select it. When you open an app, you'll be presented with a dashboard or a report. Each dashboard represents a customized view of some subset of the underlying datasets. If you own the dashboard, you'll also have edit access to the underlying datasets and reports. If the dashboard was shared with you, the actions you can take will depend on the permissions assigned by the owner.

There are many different ways that you, or a colleague, can [share a dashboard](../collaborate-share/service-share-dashboards.md). Power BI Pro is required for sharing a dashboard and might be required for viewing a shared dashboard.

**ONE** dashboard...

- Is associated with a single workspace.
- Can display visualizations from many different datasets.
- Can display visualizations from many different reports.
- Can display visualizations pinned from other tools (for example, Excel).

  :::image type="content" source="media/service-basic-concepts/drawing1.png" alt-text="Diagram showing Dashboard relationships to a dataset and a report.":::

### Dig deeper into dashboards

- [Create a Power BI dashboard from a report](../create-reports/service-dashboard-create.md)
- [Create a copy of a dashboard in Power BI service](../create-reports/service-dashboard-copy.md)
- [Optimize a dashboard for mobile phones - Power BI](../create-reports/service-create-dashboard-mobile-phone-view.md)

## Workbooks

Workbooks are a special type of dataset. If you've read the **Datasets** section above, you know almost all you need to know about workbooks. But you might be wondering why sometimes Power BI classifies an Excel workbook as a **dataset** and other times as a **workbook**.

When you use data from Excel files, you have the option to *Import* or *Connect* to the file. When you choose Connect, your workbook will appear in Power BI just like it would in Excel Online. But, unlike Excel Online, you'll have some great features to help you pin elements from your worksheets right to your dashboards.

You can't edit your workbook in Power BI. If you need to make some changes, you can select **Edit**, and then choose to edit your workbook in Excel Online or open it in Excel on your computer. Any changes you make are saved to the workbook on OneDrive.

### Dig deeper into workbooks

- [Get data from Excel workbook files](../connect-data/service-excel-workbook-files.md)
- [Publish to Power BI from Microsoft Excel](../connect-data/service-publish-from-excel.md)

## A dashboard in My workspace

We've covered workspaces, apps, and building blocks. Let's bring it together and review the pieces that make up the dashboard experience in the Power BI service.

:::image type="content" source="media/service-basic-concepts/power-bi-dashboard-identifier.png" lightbox="media/service-basic-concepts/power-bi-dashboard-identifier.png" alt-text="Screenshot of the Power BI service in a browser showing numbered features listed below.":::

### 1. **Navigation pane**

Use the nav pane to locate and move between your workspaces and the Power BI building blocks: dashboards, reports, apps, workbooks, and datasets.  

  :::image type="content" source="media/service-basic-concepts/power-bi-navigation-new.png" alt-text="Screenshot of Power BI service navigation pane.":::

- Add data or data sources by selecting **Create**.
- Open or manage favorite content, recent content, or content shared with you by selecting **Browse**.
- Explore the datasets in your org to find the data that suits your needs by selecting **Data hub**.
- Track key business metrics by selecting **Metrics**.
- View, open, or delete an app by selecting **Apps**.
- Access your hub for all Power BI training and samples by selecting **Learn**.
- Display and open your collaborative workspaces by selecting **Workspaces**.
- Display and open your personal workspace by selecting **My workspaces**.

### 2. **Canvas**

Because we've opened a dashboard, the canvas area displays visualization tiles. If for example, we had opened the report editor, the canvas area would display a report page.

Dashboards are composed of [tiles](../create-reports/service-dashboard-tiles.md). Tiles are created in report Editing view, Q&A, other dashboards, and can be pinned from Excel, SSRS, and more. A special type of tile called a [widget](../create-reports/service-dashboard-add-widget.md) is added directly onto the dashboard. The tiles that appear on a dashboard were specifically put there by a report creator or owner. The act of adding a tile to a dashboard is called *pinning*.

:::image type="content" source="media/service-basic-concepts/power-bi-dashboard-canvas.png" alt-text="Screenshot of Power BI service showing the dashboard canvas.":::

For more information, see the previous [Dashboards](#dashboards) section.

### 3. **Q&A question box**

One way to explore your data is to ask a question and let Power BI Q&A give you an answer, in the form of a visualization. Q&A can be used to add content to a dashboard or report.

Q&A looks for an answer in the datasets connected to the dashboard. A connected dataset is one that has at least one tile pinned to that dashboard.

:::image type="content" source="media/service-basic-concepts/power-bi-qna.png" alt-text="Screenshot of Power BI service showing the Q and A question box.":::

As soon as you start to type your question, Q&A takes you to the Q&A page. As you type, Q&A helps you ask the right question and find the best answer with rephrasings, autofill, suggestions, and more. When you have a visualization (answer) you like, pin it to your dashboard. For more information, see [Q&A for Power BI business users](../consumer/end-user-q-and-a.md).

### 4. **Icons in the black header bar**

The icons in the upper right corner are your resource for settings, notifications, downloads, getting help, and providing feedback to the Power BI team.  

:::image type="content" source="media/service-basic-concepts/power-bi-icons.png" alt-text="Screenshot of Power BI service showing the icon buttons.":::

### 5. **Dashboard title**

It's not always easy to figure out which workspace and dashboard are active, so Power BI shows you the workspace and the dashboard title. In this example, we see the workspace (My workspace) and the dashboard title (Sales and Marketing Sample). If we opened a report, the name of the report would appear.

:::image type="content" source="media/service-basic-concepts/power-bi-dashboard-title.png" alt-text="Screenshot of Power BI service showing the dashboard title.":::

### 6. **Microsoft 365 app launcher**

With the app launcher, your Microsoft 365 apps are easily available with one click. From here, you can quickly launch your email, documents, calendar, and more.

:::image type="content" source="media/service-basic-concepts/power-bi-waffle.png" alt-text="Screenshot of Power BI service showing the Microsoft 365 app launcher.":::

### 7. **Power BI home**

Selecting **Power BI** brings you back to your Power BI home.

:::image type="content" source="media/service-basic-concepts/version-new.png" alt-text="Screenshot of Power BI service showing icon to return to Power BI home.":::

### 8. **Labeled icons in the gray menu bar**

This area of the screen contains additional options for interacting with the content (in this case, with the dashboard). Besides the labeled icons you can see, selecting the **More options (…)** icon reveals options for seeing related content, opening lineage view, opening usage metrics, and more.

:::image type="content" source="media/service-basic-concepts/power-bi-labeled-icons.png" alt-text="Screenshot of Power BI service showing labeled icon buttons.":::

## Next steps

- [What is Power BI?](power-bi-overview.md)  
- [Power BI videos](videos.md)  
- [Tour the report editor in Power BI](../create-reports/service-the-report-editor-take-a-tour.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
