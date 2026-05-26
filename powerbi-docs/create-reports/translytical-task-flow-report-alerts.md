---
title: "Set up alerts directly in Power BI reports using translytical task flows"
description: "Use translytical task flows to set up alerts that appear directly in Power BI reports. Create a targeted notification system today."
#customer intent: As a Power BI report owner, I want to set up in-report notifications using translytical task flows, so that I can keep report consumers informed without sending mass emails.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.date: 05/26/2026
ms.topic: concept-article
ms.service: powerbi
ms.subservice: powerbi-service
ai-usage: ai-assisted
---

# Set up alerts directly in Power BI reports using translytical task flows

Translytical task flows help analytics teams set up alerts directly in Power BI reports, so report consumers stay informed about data changes and incidents without mass emails. Email-based alerts tend to suffer from two problems: they either become background noise that users learn to ignore, or they fail to reach the right audience at the right time.

If your team faces the challenge of reports serving a broad set of stakeholders with no reliable way to keep them informed about data problems, refreshes, or changes, translytical task flows offer a lightweight, no-email solution that brings notifications directly into Power BI reports themselves.

This article shows you how to set up an in-report notification system that shows alerts to the right audience, with a single source of truth and no email distribution lists.

You can use this pattern for common scenarios such as data quality incidents, planned maintenance windows, and report-specific messaging.

## Understand the problem this pattern solves

Traditional notification workflows for analytics reports suffer from several shortcomings:

- You can easily send emails but targeting is hard.
- Distribution lists often include people who don't use the affected report or miss people who do.
- After you send an email, there's no central record of active alerts tied to a specific report.
- Users who open a report after the email was sent might never see the alert.

The result is a gap between the people who know about an issue and the people who need to know. A dynamic, in-report notification system closes that gap.

## Review the end-to-end flow

This solution uses a few core Fabric components to create a lightweight, self-service notification pipeline. User Data Functions handle most of the work. The notification lifecycle follows four steps:

1. **Create** – A user opens a dedicated "Data Alert Writeback" report, selects the target report from a predefined list, types a notification message, and selects **Log Data Alert**.
1. **Store** – The button fires a connected User Data Function, which runs a SQL stored procedure to insert a new record into a notification table in SQL database in Fabric.
1. **Replicate** – A Lakehouse shortcut mirrors the notification table, so the data is immediately available to the Direct Lake semantic model without a separate extract, transform, load (ETL) step.
1. **Show** – Every report that references the semantic model can display relevant notifications, filtered by report name, so users see only the alerts that apply to them.

Because the notification table is exposed through a shortcut from SQL database to a Lakehouse on a Direct Lake model, the data flows through naturally.

:::image type="content" source="media/translytical-task-flow-report-alerts/translytical-notification-creation-pipeline.png" alt-text="Screenshot of an architecture diagram showing the translytical task flow pipeline from writeback report through User Data Functions, SQL database in Fabric, Lakehouse shortcut, and Direct Lake Semantic Model to downstream Power BI reports." lightbox="media/translytical-task-flow-report-alerts/translytical-notification-creation-pipeline.png":::

## Define the notification data model

Treat notifications as data and design a table that supports both targeting and lifecycle management. At minimum, include:

- Notification ID
- Created by
- Created date/time
- Target report
- Notification message
- Active status

Depending on your requirements, you might also include severity, effective start and end times, and an optional link for remediation guidance.

Keep this table authoritative for all active alerts so every downstream report reads from the same source of truth.

## Create a notification

To create a notification, use a purpose-built Power BI report that uses translytical task flows. This report provides a guided experience:

1. Select the target production report from a dropdown list. For this scenario, compile a list of valid reports by scraping the production workspace with [SemPy](/fabric/data-science/semantic-link-overview).
1. Enter a clear, concise message describing the issue or update. For example:

   > *"Report A is experiencing data quality issues. Next update expected at 2:00 PM PST."*

1. Select **Log Data Alert** to submit.

:::image type="content" source="media/translytical-task-flow-report-alerts/data-alert-writeback-utility-interface.png" alt-text="Screenshot of the Data Alert Writeback utility report in Power BI showing a report selector dropdown, notification message field, and Log Data Alert button." lightbox="media/translytical-task-flow-report-alerts/data-alert-writeback-utility-interface.png":::

## Track notification visibility

Within seconds of submission, shortcuts and Direct Lake add the notification to the semantic model. A dedicated tracking view lets administrators and report owners monitor all active notifications at a glance. Key fields include:

- Created By
- Creation Date (PST)
- Notification Message
- Target Report

Because the semantic model acts as a single source of truth for all downstream reports, every connected dashboard benefits from the same notification data.

:::image type="content" source="media/translytical-task-flow-report-alerts/notification-tracking-current-alerts-view.png" alt-text="Screenshot of the notification tracking view in Power BI listing active translytical task flow alerts with creator, creation date, message, and target report columns." lightbox="media/translytical-task-flow-report-alerts/notification-tracking-current-alerts-view.png":::

## Control which alerts appear on each report

Not every notification belongs on every report. The framework uses Power BI's built-in filtering to let each report owner decide which alerts are relevant. A typical filter configuration might include:

- **Report = "All"** – for service-wide announcements visible everywhere.
- **Report = "Report A"** – for alerts specific to a single report.

## When to use this pattern

This pattern works best when report consumers need timely, targeted updates in context:

- **Data quality incidents**: Inform users when data is delayed, incomplete, or under investigation.
- **Planned maintenance windows**: Communicate upcoming refresh changes, migrations, or expected downtime.
- **Report-specific messaging**: Share caveats, release notes, or temporary guidance for a specific report or report group.

## Show alerts inside the report

Users interact with notifications through a utility bar at the top of each report:

- **Persistent indicator:** An **Alerts** button is always visible in the utility bar.
- **Live count:** A badge on the button shows the count of active notifications based on the report's filter configuration.
- **Detail view:** Selecting the button opens a detail view listing every active notification with its date, message, target report, and creator.

This design keeps alerts visible but nonintrusive. Users are informed the moment they open the report, and they can drill into details on demand.

:::image type="content" source="media/translytical-task-flow-report-alerts/utility-bar-alerts-button-badge.png" alt-text="Screenshot of a utility bar at the top of a Power BI report showing an Alerts button with a live in-report notification count badge." lightbox="media/translytical-task-flow-report-alerts/utility-bar-alerts-button-badge.png":::

:::image type="content" source="media/translytical-task-flow-report-alerts/alerts-detail-view-notifications-list.png" alt-text="Screenshot of the alert detail view in a Power BI report listing active in-report notifications with date, message, target report, and creator fields." lightbox="media/translytical-task-flow-report-alerts/alerts-detail-view-notifications-list.png":::

## Adapt the pattern for non–Direct Lake models

If your semantic model doesn't use Direct Lake mode, the notification data won't appear automatically after the Lakehouse shortcut is updated. In this case, extend the architecture with two other components:

- **Trigger:** Data Activator monitors the notification table for new records.
- **Refresh pipeline:** A Fabric pipeline uses a refresh semantic model activity to select and hydrate a single table (the notification table) when the Activator fires.

For this variant, keep the refresh scope as narrow as possible (notification table only) so you reduce latency and avoid unnecessary model processing.

The implementation sequence is:

1. Configure Data Activator to detect new or changed active notifications.
1. Trigger a Fabric pipeline run when that event occurs.
1. Refresh only the notification table in the semantic model.
1. Validate that report filters still scope notifications by report name.

The rest of the flow remains identical. Users still create notifications through the same writeback report, and downstream reports still consume them through the semantic model.

:::image type="content" source="media/translytical-task-flow-report-alerts/translytical-task-flow-non-direct-lake.png" alt-text="Screenshot of an architecture diagram showing the non-Direct Lake translytical task flow variant with Data Activator and a Fabric Pipeline semantic model refresh step." lightbox="media/translytical-task-flow-report-alerts/translytical-task-flow-non-direct-lake.png":::

## Summary

By using translytical task flows in Fabric, you can show targeted, in-context notifications without a single email. The benefits include:

- Users see alerts where they work - inside the report.
- Alert targeting is precise, controlled at the report level.
- There's a single source of truth for all notification data.
- The framework is lightweight and built entirely on Fabric.

Whether your semantic model uses Direct Lake or import tables, this pattern is adaptable and puts the right information in front of the right people at the right time.

Ready to get started? [Start with the translytical task flow overview](translytical-task-flow-overview.md) or [explore User Data Functions](/fabric/data-engineering/user-data-functions/user-data-functions-overview) to set up your first notification pipeline.

## Related content

- [Understand translytical task flows](translytical-task-flow-overview.md) – Learn the core concepts behind translytical task flows in Microsoft Fabric.
- [User Data Functions Overview](/fabric/data-engineering/user-data-functions/user-data-functions-overview) – Explore how User Data Functions run stored procedures to power the notification pipeline.
- [Use SQL database as the source data engine for translytical applications](/fabric/database/sql/use-case-translytical-applications) – Use this architecture as a template for SQL-backed translytical patterns in Fabric.
- [Get started with Data Activator](/fabric/data-activator/data-activator-get-started) – Set up triggers to monitor your notification table for non–Direct Lake models.
- [Lakehouse shortcuts in Microsoft Fabric](/fabric/onelake/onelake-shortcuts) – Understand how shortcuts mirror your notification table into the Lakehouse.
