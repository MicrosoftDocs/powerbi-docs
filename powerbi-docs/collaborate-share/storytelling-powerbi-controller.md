---
title: Manage Multiple Add-ins With the Power BI Controller (Preview)
description: Learn how to use the Power BI Controller (preview) to manage multiple Power BI add-ins in PowerPoint presentations efficiently.
#customer intent: As a Power BI user, I want to learn how to manage multiple add-ins in my PowerPoint presentations.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: mayabendov
ms.topic: concept-article
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.date: 10/16/2025
---

# Manage multiple add-ins with the Power BI Controller (preview)

The Power BI Controller (preview) is a task pane add-in that serves as a central command center for all Power BI add-ins within a PowerPoint presentation. With this tool, users can efficiently and consistently perform operations across multiple add-ins.

## Background

Power BI storytelling lets users embed interactive reports and visuals into PowerPoint to support data-driven presentations across organizations. As adoption grows, many users express the need for a centralized way to manage and update multiple Power BI add-ins across slides. Users report using the Power BI add-in for PowerPoint to create data-centric presentations that they update weekly or monthly. They find reviewing all the add-ins in the presentation and repeating the same operation time-consuming. The Power BI Controller addresses this need by letting users perform bulk operations from a single interface.

## Example scenario

You're a business leader who needs to prepare a monthly review presentation with multiple embedded Power BI reports covering sales, operations, and finance. You create a new version of the presentation every month, capturing the latest data in **Snapshot** mode, and share it with relevant stakeholders.

With the Power BI Controller, you can:

- Switch all add-ins from **Snapshot** view to **Live** view with a single action, ensuring every report shows the most current data.
- Revert all add-ins to **Snapshot** view after updating, locking the data for secure sharing.
- Distribute the finalized presentation to stakeholders, ensuring all information is accurate and up to date without repetitive, manual updates.

## Get the Power BI Controller add-in

You can get the add-in directly from the PowerPoint ribbon:

1. Go to **Add-ins** in the PowerPoint ribbon, and search for "Microsoft Power BI Controller."
1. Select **Add**.

## Use the Power BI Controller

A new panel opens with the commands that the Power BI Controller supports. During the preview release, supported commands let you:

- Change view modes from snapshot or public snapshot to live (and vice versa)
- Sync with Power BI

:::image type="content" source="media/power-bi-controller/power-bi-controller-powerpoint.png" alt-text="Screenshot of a PowerPoint presentation showing the Power BI Controller pane with options to reset or change view mode for all add-ins in the presentation.":::

> [!NOTE]
> The presentation file must be **saved** before the controller can execute any command.

### How commands are processed

When you send the **first command**, the controller scans the entire presentation to discover all Power BI add-ins. This initial scan might take some time to complete. Subsequent commands execute immediately because the add-ins have already been identified.

Each add-in found on the slides is listed in the controller pane along with its current status. This gives you visibility into which add-ins are ready for the selected operation.

When you apply a command to the entire presentation, only the add-ins that support the command execute it. Other add-ins might reject it and report back to the controller as "not applicable." For example, if you send a **Switch to snapshot** command:

- Add-ins that are in **Live** mode respect the command and switch to **Snapshot** mode.
- Add-ins that are already in **Snapshot** mode don't change because the command isn't applicable.

> [!IMPORTANT]
> The Power BI Controller is **not yet available for sovereign clouds**.

## Benefits of the Power BI Controller

Benefits of the Power BI Controller include:

- **Efficiency**: Power BI Controller reduces the time and effort required to update and manage presentations with multiple Power BI add-ins.
- **Consistency**: Power BI Controller ensures all embedded reports are updated and managed uniformly.
- **Accuracy**: Power BI Controller reduces the risk of presenting outdated or inconsistent data.
- **Control**: Power BI Controller provides clear feedback and lets you manage or cancel operations as needed.

## Related content

- [About storytelling with Power BI in PowerPoint](service-power-bi-powerpoint-add-in-about.md)
- [Add live Power BI data to PowerPoint](service-power-bi-powerpoint-add-in-install.md)
- [Add data point annotations to visuals](service-power-bi-powerpoint-add-in-annotate.md)
- [View and present live Power BI data in PowerPoint](service-power-bi-powerpoint-add-in-view-present.md)
