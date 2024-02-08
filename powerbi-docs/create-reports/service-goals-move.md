---
title: Arrange columns, metrics, and scorecards
description: Learn how to customize your Power BI scorecards to meet your teams' needs.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 07/12/2022
---
# Arrange columns, metrics, and scorecards

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

In some scenarios, you may want to hide a column, or put the columns in a different order. You may also want to reorder the metrics in a scorecard, make one metric a submetric of another, or move or copy the entire scorecard to another workspace. As a scorecard author, you can make these changes, moving metrics and scorecards, deciding the columns that your scorecard consumers see, and the order they're in, to optimize the scorecard for your audience.

:::image type="content" source="media/service-goals-move/power-bi-goals-edit-columns.png" alt-text="Screenshot of the Edit view columns pane.":::

## Reorder the metrics in a scorecard

It's easy to reorder metrics on the scorecard, or make them submetrics.

- Select a metric and drag it up or down. Indent it slightly to make it a submetric of another metric. 

  :::image type="content" source="media/service-goals-move/power-bi-move-metric.png" alt-text="Screenshot that shows moving a metric, and making it a submetric.":::

  When you make it a submetric, it takes the color of the metric it's under.

  :::image type="content" source="media/service-goals-move/power-bi-moved-metric.png" alt-text="Screenshot that shows the moved submetric.":::

## Hide or move a column

1. Open the scorecard in edit mode, and select the arrow icon next to the column you want to hide or move > **Column settings**.
1. Select **Move right**, **Move left**, or **Hide this column**.

    :::image type="content" source="media/service-goals-move/power-bi-goals-move-columns.png" alt-text="Screenshot of Move or Hide columns.":::

## Show a hidden column

1. Open the scorecard in edit mode, and select the arrow icon next to any column > **Column settings**.
1. Select **Show/Hide columns**.
1. In **Edit view columns**, select **Reset to default** or select the column you want to view. 

    :::image type="content" source="media/service-goals-move/power-bi-goals-edit-view-columns.png" alt-text="Screenshot of moving a column in the Edit view columns pane.":::

1. You can also re-order columns in this view by dragging them up or down.
1. Select **Apply**.

## Move or copy a scorecard

Many organizations have 'template' scorecards that different departments or business groups might want to use as a starting point; Or you might want to develop a ‘test’ scorecard in My workspace to make sure the metrics are working correctly before moving it to the correct workspace when it’s ready to share. You can now do all this using the move or copy scorecard functionality. The copy scorecard capability is also useful in getting started quickly if you want to create a new scorecard by reusing the metric definition from an existing scorecard.

1. On the **File** menu, select **Move scorecard** or **Copy scorecard**.

    :::image type="content" source="media/service-goals-move/power-bi-goals-move-copy-scorecard.png" alt-text="Screenshot of move and copy scorecard options in File menu.":::
    
2. You see a dropdown list of workspaces you have access to. Select the workspace you’d like to move or copy the scorecard to > **Continue**.

    :::image type="content" source="media/service-goals-move/power-bi-goals-move-scorecard.png" alt-text="Screenshot of move scorecard dialog.":::
     
    When you copy a scorecard, you have the option to include or exclude check-in history. This makes it easy to reuse the same scorecard for a newer time period (for example, for fiscal year scorecards) so you don't have to do this all over again. 
     
    :::image type="content" source="media/service-goals-move/power-bi-goals-copy-scorecard.png" alt-text="Screenshot of copy scorecard dialog.":::
       
 3. You’ll get a notice when the move or copy operation is complete. It can take a few seconds. Select **Open Scorecard** to open the scorecard in the selected workspace.
 
    :::image type="content" source="media/service-goals-move/power-bi-goals-move-copy-toast.png" alt-text="Screenshot of notice on completion of move and copy scorecard.":::
     
     
## Related content

- [Get started with metrics in Power BI](service-goals-introduction.md)
- [Create scorecards and manual metrics in Power BI](service-goals-create.md)
- [Create connected metrics in Power BI](service-goals-create-connected.md)
- [Stay on top of your metrics in Power BI](service-goals-check-in.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
