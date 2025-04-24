---
title: Create scorecards and manual metrics
description: Create scorecards and manual metrics in Power BI.
author: kfollis
ms.author: kfollis
ms.reviewer: 'cnews'
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.search.form: Create scorecards
ms.topic: how-to
ms.date: 11/18/2024
ms.custom: sample-sales&returnssamplev201912
---
# Create scorecards and manual metrics in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics in Power BI let customers curate their metrics and track them against key business objectives, in a single pane. In this article, you complete the following steps: 

- Create your first scorecard.
- Create a manual metric.
- Edit a metric.
- Share the scorecard with others.

You can also connect metrics to an existing report visual in Power BI. See [Create connected metrics](service-goals-create-connected.md) for details. 

:::image type="content" source="media/service-goals-create/northwind-scorecard.png" alt-text="Screenshot of Northwind scorecard with metrics and submetrics." lightbox="media/service-goals-create/northwind-scorecard.png":::

## Prerequisites

You need a Power BI Pro license to author and share metrics in standard workspaces. You also need:

- Admin, Member, or Contributor role in a workspace. Read more about [roles in workspaces](../collaborate-share/service-roles-new-workspaces.md).
- [Build permission](../connect-data/service-datasets-build-permissions.md) for a semantic model.

## Step 1: Create a scorecard 

1. Sign in to the Power BI service (app.powerbi.com) in your browser.
1. Select **Metrics** in the navigation pane to open the Metrics hub.

    :::image type="content" source="media/service-goals-create/power-bi-goals-left-nav.png" alt-text="Screenshot of Select Metrics in the left nav.":::

1. In the Metrics hub, select **New metric set**.

    A new scorecard opens, which you can start populating with metrics.

1. Select the edit pencil next to **Untitled Scorecard** and give your new scorecard a name and destination workspace.

    :::image type="content" source="media/service-goals-create/metrics-edit-scorecard-name.png" alt-text="Screenshot of the edit icon that shows on hover and enables scorecard renaming.":::

1. Power BI automatically saves the scorecard to **My Workspace**, but you can move it to another workspace. Select **File** > **Move Scorecard**.

    :::image type="content" source="media/service-goals-create/metrics-move-scorecard.png" alt-text="Screenshot of menu to move a scorecard.":::

1. In the **Move scorecard** dialog, select any available workspace.  If you don’t have another workspace, you need to create one first. See [Create a workspace in Power BI](../collaborate-share/service-create-the-new-workspaces.md) for details.

    :::image type="content" source="media/service-goals-create/metrics-move-scorecard-confirm.png" alt-text="Screenshot of confirmation to move a scorecard to another workspace, and a dropdown to select the correct workspace.":::

    Power BI saves these items in the workspace: the scorecard itself, and a *semantic model* associated with your scorecard that houses all the metrics data. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-scorecard-dataset.png" alt-text="Screenshot of The new scorecard and semantic model that Power BI created.":::

## Step 2: Create a manual metric

1. In the scorecard, select **Add metric**. 
2. Decide on a **Metric name** and an **Owner**. 

    Owners can be individuals or distribution groups within your organization’s Microsoft Entra ID.  

1. Set **Current** and **Target** values for your metrics. In this article, you enter the number manually. You can also connect it to an existing report visual in Power BI. See [Create connected metrics](service-goals-create-connected.md) for details. 
1. Set the format for your values, and choose a **Status**, **Start date**, and **End date**. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-new-number-format.png" alt-text="Screenshot of In the New metric, select a number format.":::

    Power BI automatically represents values in numeric notation. For example, *2044* is represented as *2 K*. 

1. Select **Save**. 

    **Metric name** is the only required field for your metric. You can leave the remaining fields blank and come back to edit it after defining all your metrics.

## Step 3 (Optional): Create submetrics 

You can also define one or more submetrics for your metric. Like their parent metrics, submetrics can be either connected or set manually. See [Create submetrics](service-goals-subgoals.md) for details.

## Step 4 (Optional): Update the metric tracking cycle 

All new metrics created within scorecards have a default daily tracking cycle, which means that the data and progress are calculated on a day-to-day basis. However, many metrics and metrics demand to be tracked on a different cadence. In those cases, you can change the default tracking cycle on the metric through metric settings. The tracking cycle doesn't impact data refresh.

1. Open a scorecard and select **Edit**.

   :::image type="content" source="media/service-goals-create/power-bi-goals-edit-scorecard.png" alt-text="Screenshot of Select the Edit pencil to edit the scorecard.":::

1. Select the name of any metric or submetric. Power BI opens the **Details** pane.  
1. Select the **Settings** tab. 
1. Set the **tracking cycle** frequency for your metric, and select **Track**. 

    :::image type="content" source="media/service-goals-create/power-bi-goals-set-tracking-cycle.png" alt-text="Screenshot of Set the tracking cycle for your metric.":::
 
## Step 5 (Optional): Share your scorecard 

Sharing is the easiest way to give people access to your scorecard in the Power BI service. You can share with people inside or outside your organization.  

When you share a scorecard, the people you share it with can view and interact with it. They can also edit it if they have an [Admin, Member, or Contributor role in the workspace](../collaborate-share/service-roles-new-workspaces.md). Users that have access to the scorecard see the same data you see in the scorecard. The coworkers you share with can also share with their coworkers, if you allow them to. The people outside your organization can view and interact with the scorecard, but can't share it.

- To share, select the **Share** button in the scorecard action bar and follow the steps outlined in the experience. It's the same as sharing a dashboard.

    :::image type="content" source="media/service-goals-create/power-bi-goals-share-link.png" alt-text="Screenshot of Share a link to a scorecard.":::

    When you share scorecards, whether inside or outside your organization, your recipients need Power BI Pro licenses, unless the content is in a [Power BI Premium](../enterprise/service-premium-what-is.md) capacity.

## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)
- [Stay on top of your metrics in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
