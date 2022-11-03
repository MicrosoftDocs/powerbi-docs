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
ms.date: 11/03/2022
ms.custom: intro-get-started
---
# Get started with cascading scorecards in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Metrics supports cascading scorecards that roll up along hierarchies you set up in your scorecard. You can set up a hierarchy for a scorecard and map the Power BI datasets referenced by your metrics to the hierarchy levels and owner fields, automatically creating a new scorecard view for each slice of your data. That’s potentially thousands of automated scorecard views with just a few clicks.
Power BI will cascade connected metric values to each level of the hierarchy. Users can easily drill into the hierarchy to see progress, statuses and do check-ins at different levels. In the images below, you can see the different levels of a project hierarchy in the slicer, and as you navigate to each level or sublevel of the hierarchy, your metric values, statuses, owners, and progress will change along with it.

This scorecard is set up with a hierarchy, and the the filter is open exposing the hierarchy slicer.

:::image type="content" source="media/get-started-hierarchies/hierarchies-scorecard-overview.png" alt-text="Example of a scorecard with a hierarchy set up, filter is open exposing the hierarchy slicer." lightbox="media/get-started-hierarchies/hierarchies-scorecard-overview.png":::

In this image, the scorecard has a hierarchy set up, and the filter is open exposing the hierarchy slicer and filters applied on the scorecard.

:::image type="content" source="media/get-started-hierarchies/hierarchies-scorecard-overview2.png" alt-text="Example of a scorecard with a hierarchy set up, filter is open exposing the hierarchy slicer and filters applied on the scorecard." lightbox="media/get-started-hierarchies/hierarchies-scorecard-overview2.png":::

## Requirements for creating hierarchies

Here are the requirements for setting up a hierarchical scorecard:

- Hierarchies require a Premium or Premium Per User workspace.
- You need Edit permission to the scorecard.
- Your scorecard needs at least one connected metric.
- You need Build access to the datasets connected in your scorecard.

## Set up your hierarchy

In scorecard edit mode, select **Manage hierarchies** from the **All** slicer

:::image type="content" source="media/get-started-hierarchies/hierarchies-entry-point1.png" alt-text="First entry point in hierarchy slicer.":::

You can also select **Set up a hierarchy** from the **New** menu.

:::image type="content" source="media/get-started-hierarchies/hierarchies-entry-point2.png" alt-text="Other entry point in +New menu.":::

## Map hierarchy levels to data

Start setting up your hierarchy by giving it a name, building the levels, and mapping them to connected datasets in your scorecard.  You can build multiple hierarchies to see cross sections between slices of data, for example if there is a geography and product hierarchy, you can use the slicer to view a scorecard showing your metrics by “laptops in Germany” or “smart devices in Seattle, WA.”

In the setup experience you will see all the datasets that are connected to metrics in scorecard.

:::image type="content" source="media/get-started-hierarchies/hierarchies-map-datasets.png" alt-text="Screenshot of UI showing how users can name hierarchy levels.":::

Map the data in your underlying datasets to your hierarchy levels.  If there are fields you don’t want to bring into the mapping, you can deselect them using the checkboxes in the fields list.  

:::image type="content" source="media/get-started-hierarchies/hierarchies-map-datasets2.png" alt-text="Screenshot of UI showing how users can map hierarchy levels ti connected datasets.":::

As you map your datasets to the corresponding data in each hierarchy level, you’ll see a preview on the right-hand pane to double check you’re on the right track.

:::image type="content" source="media/get-started-hierarchies/hierarchies-preview.png" alt-text="Screenshot of the hierarchy preview pane showing the hierarchy tree.":::

There is also an option in the upper right to view related metrics, showing an overview of the metrics on your scorecard, which values are connected to data, and which dataset they come from.

:::image type="content" source="media/get-started-hierarchies/hierarchies-related-metrics.png" alt-text="Screenshot of the hierarchy related metrics pane showing the connected metrics from the scorecard.":::

## Map owners

You can map owners in the ‘assign owners’ section so the owner column dynamically changes with each slice of the data.  Owners are mapped per hierarchy, so for an owner mapping to work correctly, there needs to be a relationship between the owner field and the hierarchy data in the underlying datasets. Owner mappings will apply per hierarchy level, not per metric.

:::image type="content" source="media/get-started-hierarchies/hierarchies-map-owner.png" alt-text="Screenshot of the UI showing how you can assign owners from data..":::

Save your hierarchy and watch as all the connected values and owners dynamically change.  Hierarchies support manual metrics (metrics not connected to data) as well – manual metrics will show up on child scorecards but will show manual values as blank.  These can be checked-in and updated on the child scorecard views.

Other metric data inherited from original scorecard:
-	Metric metadata (name, owners, statuses, start and due dates)
-	Data connections
-	Status rules 
-	Tracking settings

Metric data that can be edited on child scorecards:
-	Check-in data (notes, statuses when applicable and values when applicable)

## Considerations for hierarchy setup

-	There are data limits on hierarchies:

    - Up to 10,000 items per hierarchy (across all datasets)
    - Up to five hierarchies
    - Up to five levels per hierarchy
    
-	Dynamic and static RLS is supported but it is routed through the hierarchy creator.  All scorecard viewers will impersonate the hierarchy creator’s access 
-	Other users with edit access to the scorecard can edit the hierarchy, but will take over the hierarchy connections upon save, and all data connections will be routed through their UserID, which may result in different data values or broken metrics
-	Reusing Power BI hierarchies is not yet supported – hierarchies must be created in the scorecard
-	For hierarchies to reflect proper changes, there needs to be established relationships between the hierarchy fields in the underlying data. This is true for owners as well.
-	Hierarchies are not included in the scorecard dataset
-	Owners mapped in the hierarchy will not automatically receive permissions to the scorecard
-	Owners are applied per hierarchy level, not per metric
-	Roll ups are not yet supported on child scorecards

## View your hierarchy

### Scorecard list view
To view your hierarchical scorecard, you can use the slicer to navigate to whichever level of your hierarchy you want to view.  From here you can do things like open the details pane, go to a report, and perform check-ins, just like any other scorecard view. 

:::image type="content" source="media/get-started-hierarchies/hierarchies-cross-section.png" alt-text="Screenshot of a scorecard showing a hierarchy that's been set up.":::

All connected values, mapped owners, and statuses dictated by rules will reflect the appropriate data at each hierarchy level, so long as the relationships exist.  There needs to be a relationship between the hierarchy level fields in the underlying datasets to correctly filter the values.  Manual metrics will be indicated by an information icon showing which values are manual for that metric.

:::image type="content" source="media/get-started-hierarchies/hierarchies-manual-info-icon.png" alt-text="Screenshot of hover text indicating a manual metric.":::

You can view intersections of multiple hierarchies.  For example, you can look at a cross section between one selection from product, and one selection from the geography hierarchy, indicated in the slicer name as shown in the images below.

:::image type="content" source="media/get-started-hierarchies/hierarchies-two-slicers.png" alt-text="A hierarchy slicer that shows two hierarchies set up.":::
:::image type="content" source="media/get-started-hierarchies/hierarchies-cross-section-slicer.png" alt-text="A header within a scorecard that restates the two levels of the hierarchy a user chose, Germany and Laptops.":::

### Heatmap view

By selecting ‘heatmap’ from the view options, you can start to build a custom heatmap view that allows for side by side comparison of different hierarchy levels.  This experience is exposed in read mode, so consumers can also do their own exploration using the pane, showing and comparing different segments, though saving and sharing views are not yet supported.

:::image type="content" source="media/get-started-hierarchies/hierarchies-heatmap-view.png" alt-text="A screenshot of a heatmap view of a hierarchical scorecard.":::

You can also customize what information to show in each metric box by selecting the slicer dropdown and then selecting open display settings. Here you can see your display options to curate your view.  This is a great view to use in business reviews.

:::image type="content" source="media/get-started-hierarchies/hierarchies-heatmap-display-settings-entry-point.png" alt-text="A screenshot of a heatmap view display settings entry point.":::
:::image type="content" source="media/get-started-hierarchies/hierarchies-heatmap-display-settings.png" alt-text="A screenshot of a heatmap view display settings.":::

### Additional considerations for viewing a hierarchy

-	Premium or PPU workspace is required.
-	There are data limits on hierarchies:

    - Up to 10000 items per hierarchy (across all datasets)
    - Up to five hierarchies
    - Up to five levels per hierarchy

-	Permissions can't be set at a hierarchy level – metric level permissions are set at the scorecard and applied to all hierarchy views
-	Data connections will be evaluated by impersonating the hierarchy owner/creator where RLS may apply.  This does not change metric level permissions. 
-	Dynamic and static RLS is supported but it is routed through the hierarchy creator.  All scorecard viewers will impersonate the hierarchy creator’s access
-	Hierarchy permissions can't be set at a specific hierarchy level, metric level permissions (which are inherited from the original scorecard and are applied at all levels) and RLS via the hierarchy creator dictate permissions
-	Non-admin users may experience refresh issues when setting up hierarchies on top of a dataset with dynamic RLS
-	Manual metrics will be indicated by an information icon showing which values are manual for that metric
-	Notifications regarding status changes on child scorecard levels will not be triggered 
-	There is a limit of one selection per hierarchy for viewing a hierarchical scorecard
-	History for hierarchical metrics is not supported because data is always queried live from the dataset, instead of cached when the dataset refreshes 
-	Saving / sharing heatmap views is not yet supported

## Scenarios: when to use hierarchies

This is a big feature, and you may be wondering where to get started or how you can use this in your organization.  To help you along, we’ve compiled a few useful scenarios where cascading scorecards provide an elegant, large-scale, and most importantly efficient solution.  They may help inspire you.

## Scenario 1: Measuring organizational health across teams
Cascading scorecards are great tools for standardized metrics across many different segments in an organization.  In this scenario, it’s made it easy to track the health of an organization by measuring employee engagement, satisfaction, and hiring goals – metrics that are often mapped across an entire company. This scorecard below allows senior leadership to see how each division within the organization is measuring against standard metrics like attrition rates, compliance trainings, employee satisfaction, and diverse and inclusive hiring goals.
This scorecard becomes not only an artifact for metric tracking, but an integral tool for decision making at high level of an organization to improve company culture and overall organizational health.

:::image type="content" source="media/get-started-hierarchies/hierarchies-scenario-1.png" alt-text="A screenshot of a heatmap view of a hierarchy scorecard applying to the described scenario 1 above.":::

## Scenario 2: Retail metrics across locations and product areas
For retail scenarios, it’s often useful to create two hierarchies and use the slicer to view cross sections between them.  Here, a retail organization has set up a scorecard that has a geography and a product hierarchy, so they can look at their standard metrics by product, location, or a combination of both.  Here they are looking at laptop metrics in Germany.  They could even dive deeper and look at specific laptop models in Berlin.
This view is helpful because the owners can be mapped as part of the hierarchy as well, ensuring that each retail locations’ metrics are being owned and managed by the appropriate branch manager.
Check-ins can be performed at any intersection of the hierarchies, ensuring that all integral areas of the business are tracked and updated accordingly.  In this case, the same scorecard can be used at every branch location to increase metric performance, driving a data culture at all levels of the company.

:::image type="content" source="media/get-started-hierarchies/hierarchies-scenario-2-1.png" alt-text="A screenshot of a heatmap view of a hierarchy scorecard applying to the described scenario 2 above.":::
:::image type="content" source="media/get-started-hierarchies/hierarchies-scenario-2-2.png" alt-text="A screenshot of a heatmap view of a hierarchy scorecard applying to the described scenario 2 above, showing both hierarchies selected.":::

## Scenario 3: Organizational hierarchies
We often see senior leadership use scorecards driven by organizational hierarchies. There are a set of metrics that the company tracks along an organizational hierarchy – in many cases, compliance metrics.  Each person’s team is required to meet these standards, and leadership needs a fast and easy way to see the overall numbers and break them down according to the org hierarchy to see whose team is performing well, and who is behind.
This scorecard uses the organizational hierarchy as the scorecard hierarchy, so that all metrics can be broken down by the accountable person.  The heatmap view is also very useful in this scenario as it allows you to get a deeper, side by side glance of whose team is red and whose is green, and identify specific teams that need to increase compliance performance.  The heatmap view of organizational scorecards drives alignment and clarity at every level of the business.

:::image type="content" source="media/get-started-hierarchies/hierarchies-scenario-3-1.png" alt-text="A screenshot of a heatmap view of a hierarchy scorecard applying to the described scenario 3 above.":::
:::image type="content" source="media/get-started-hierarchies/hierarchies-scenario-3-2.png" alt-text="A screenshot of a heatmap view of a hierarchy scorecard applying to the described scenario 3 above, showing the heatmap customization.":::
