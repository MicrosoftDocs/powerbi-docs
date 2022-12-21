---
title: Get started with hierarchies in Power BI metrics
description: You can set up a hierarchy for a scorecard and map the Power BI datasets referenced by your metrics to the hierarchy levels and owner fields, automatically creating a new scorecard view for each slice of your data.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/29/2022
ms.custom: intro-get-started
---
# Get started with hierarchies in Power BI scorecards

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics support cascading scorecards that roll up along hierarchies you set up in your scorecard. You can set up a hierarchy for a scorecard and map the Power BI datasets referenced by your metrics to the hierarchy levels and owner fields, automatically creating a new scorecard view for each slice of your data. That’s potentially thousands of automated scorecard views with just a few clicks.
Power BI will cascade connected metric values to each level of the hierarchy. Users can easily drill into the hierarchy to see progress, statuses and do check-ins at different levels. In the following images, you see the different levels of a project hierarchy in the slicer, and as you navigate to each level or sublevel of the hierarchy, your metric values, statuses, owners, and progress will change along with it.

This scorecard is set up with a hierarchy, and the filter is open exposing the hierarchy slicer.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-scorecard-overview.png" alt-text="Example of a scorecard with a hierarchy in place, filter is open exposing the hierarchy slicer." lightbox="media/service-metrics-get-started-hierarchies/hierarchies-scorecard-overview.png":::

In this image, the filter is open exposing the hierarchy slicer and filters applied on the scorecard.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-scorecard-overview-2.png" alt-text="Example of a scorecard with a hierarchy in place, filter is open exposing the hierarchy slicer and filters applied on the scorecard." lightbox="media/service-metrics-get-started-hierarchies/hierarchies-scorecard-overview-2.png":::

## Requirements for creating hierarchies

Here are the requirements for setting up a hierarchical scorecard:

- Hierarchies require a Premium or Premium Per User workspace.
- You need Edit permission to the scorecard.
- Your scorecard needs at least one connected metric.
- You need Build access to the datasets connected in your scorecard.

## Set up your hierarchy

In scorecard edit mode, select **Manage hierarchies** from the **All** slicer

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-entry-point-1.png" alt-text="Screenshot of First entry point in hierarchy slicer.":::

You can also select **Set up a hierarchy** from the **New** menu.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-entry-point-2.png" alt-text="Screenshot of Other entry point in +New menu.":::

### Map hierarchy levels to data

Start setting up your hierarchy by giving it a name, building the levels, and mapping them to connected datasets in your scorecard.  You can build multiple hierarchies to see cross sections between slices of data, for example if there is a geography and product hierarchy, you can use the slicer to view a scorecard showing your metrics by “laptops in Germany” or “smart devices in Seattle, WA.”

In the setup experience you will see all the datasets that are connected to metrics in the scorecard.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-map-datasets.png" alt-text="Screenshot of UI showing how users can name hierarchy levels.":::

Map the data in your underlying datasets to your hierarchy levels.  If there are fields you don’t want to bring into the mapping, you can deselect them using the checkboxes in the fields list.  

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-map-datasets-2.png" alt-text="Screenshot of UI showing how users can map hierarchy levels to connected datasets.":::

As you map your datasets to the corresponding data in each hierarchy level, you’ll see a preview on the right-hand pane to double check you’re on the right track.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-preview.png" alt-text="Screenshot of the hierarchy preview pane showing the hierarchy tree.":::

There is also an option in the upper right to view related metrics, showing an overview of the metrics on your scorecard, which values are connected to data, and which dataset they come from.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-related-metrics.png" alt-text="Screenshot of the hierarchy related metrics pane showing the connected metrics from the scorecard.":::

### Map owners

You can map owners in the ‘assign owners’ section so the owner column dynamically changes with each slice of the data.  Owners are mapped per hierarchy, so for an owner mapping to work correctly, there needs to be a relationship between the owner field and the hierarchy data in the underlying datasets. Owner mappings will apply per hierarchy level, not per metric.

:::image type="content" source="media/service-metrics-get-started-hierarchies/hierarchies-map-owner.png" alt-text="Screenshot of the UI showing how you can assign owners from data.":::

Save your hierarchy and watch as all the connected values and owners dynamically change.  Hierarchies support manual metrics (metrics not connected to data) as well – manual metrics will show up on child scorecards but will show manual values as blank.  These can be checked-in and updated on the child scorecard views.

Other metric data inherited from original scorecard:

- Metric metadata: name, owners, statuses, and start and due dates
- Data connections
- Status rules
- Tracking settings

Metric data that can be edited on child scorecards:

- Check-in data: notes, statuses when applicable, and values when applicable.

## Considerations for hierarchy setup

- There are data limits on hierarchies:

  - Up to 10,000 items per hierarchy (across all datasets)
  - Up to five hierarchies
  - Up to five levels per hierarchy

- Dynamic and static row-level security (RLS) is supported but it's routed through the hierarchy creator.  All scorecard viewers impersonate the hierarchy creator’s access.
- Other users with edit access to the scorecard can edit the hierarchy, but will take over the hierarchy connections upon save, and all data. Connections are routed through their UserID, which may result in different data values or broken metrics.
- Reusing Power BI hierarchies isn't yet supported. You have to create hierarchies in each scorecard.
- For hierarchies to reflect proper changes, you need to have established relationships between the hierarchy fields in the underlying data. This is true for owners as well.
- Hierarchies aren't included in the scorecard dataset.
- Owners mapped in the hierarchy don't automatically receive permissions to the scorecard.
- Owners are applied per hierarchy level, not per metric.
- Roll ups aren't yet supported on child scorecards.

## Next steps

- [Scenarios: When to use hierarchies in Power BI scorecards](service-metrics-hierarchies-scenarios.md)
- [View hierarchies in Power BI metrics](service-metrics-view-hierarchies.md)
