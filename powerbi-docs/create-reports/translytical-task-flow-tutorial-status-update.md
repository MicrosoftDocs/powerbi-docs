---
title: Tutorial - Create a status update workflow
description: In this tutorial, learn how to create a translytical task flow that tracks project status and posts updates to Microsoft Teams.
author: zoedouglas
ms.author: zoedouglas
ms.reviewer: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: tutorial
ms.date: 03/22/2026
LocalizationGroup: Create reports
#customer intent: As a Power BI user, I want to create a report that tracks project status and posts updates to Teams so that my team stays informed about important changes.
---

# Tutorial: Create a status update workflow

In this end-to-end tutorial, you create a translytical task flow that tracks project status and posts updates from a Power BI report to Microsoft Teams. This tutorial demonstrates how to combine data write-back with external API calls to create a complete communication workflow.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Create a SQL database in Fabric with project and status tracking tables.
> * Set up a variable library to store configuration securely.
> * Configure user data functions that update status and send Teams notifications.
> * Integrate user data functions with a Power BI report using data function buttons.

If you don't have an existing Fabric capacity, [start a Fabric trial](/fabric/fundamentals/fabric-trial).

## Prerequisites

* Power BI Desktop. If you don't have Power BI Desktop installed on your device, follow the instructions in [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).
* A Microsoft Teams channel where you have permission to add incoming webhooks.

## Overview

This tutorial creates a project tracking solution where users can update project status directly from a Power BI report. When a user updates a status, the system:

1. Writes the new status to the SQL database
1. Sends an Adaptive Card notification to Microsoft Teams
1. Refreshes the report to show the updated data

The architecture connects these components:

- **Fabric SQL Database** - Stores project and status update records
- **Variable Library** - Securely stores the Teams webhook URL
- **User Data Functions** - Handles the write-back and Teams notification logic
- **Power BI Report** - Provides the user interface for viewing and updating status

## Create a SQL database

This scenario uses a project tracking dataset. Follow the steps in [Create a SQL database in Fabric](/fabric/database/sql/create) to create a new SQL database in your Fabric workspace.

### Create the database tables

1. In your SQL database, open a new query window.

1. Run the following SQL script to create the Project table:

   ```sql
   CREATE TABLE [Project] (
       [Project id] INT NOT NULL,
       [Project name] NVARCHAR(200) NOT NULL,
       [Product name] NVARCHAR(200),
       [Description] NVARCHAR(4000),
       [Priority] NVARCHAR(20),
       [Start date] DATE,
       [Target end date] DATE,
       [Budget] DECIMAL(18,2),
       [Project manager] NVARCHAR(100),
       [Department] NVARCHAR(100),
       [Created date] DATETIME2,
       [Created by] NVARCHAR(100),
       [Is active] BIT,
       CONSTRAINT PK_Project PRIMARY KEY NONCLUSTERED ([Project id])
   );
   ```

1. Create the Status updates table to track status changes over time:

   ```sql
   CREATE TABLE [Status updates] (
       [Update id] INT NOT NULL,
       [Project id] INT NOT NULL,
       [Status] NVARCHAR(50) NOT NULL,
       [Updated date] DATETIME2 NOT NULL,
       [Updated by] NVARCHAR(100) NOT NULL,
       [Notes] NVARCHAR(4000),
       CONSTRAINT PK_StatusUpdates PRIMARY KEY NONCLUSTERED ([Update id])
   );
   ```

1. Create a view that returns the latest status for each project:

   ```sql
   CREATE VIEW [Project status] AS
   SELECT 
       p.[Project id],
       p.[Project name],
       COALESCE(ls.[Latest status], 'Not Started') AS [Latest status],
       ls.[Latest notes]
   FROM [Project] p
   LEFT JOIN (
       SELECT 
           [Project id],
           [Status] AS [Latest status],
           [Notes] AS [Latest notes],
           ROW_NUMBER() OVER (PARTITION BY [Project id] ORDER BY [Update id] DESC) AS RowNum
       FROM [Status updates]
   ) ls ON p.[Project id] = ls.[Project id] AND ls.RowNum = 1;
   ```

1. Insert sample project data:

   ```sql
   INSERT INTO [Project] ([Project id], [Project name], [Product name], [Description], [Priority], [Start date], [Target end date], [Budget], [Project manager], [Department], [Created date], [Created by], [Is active])
   VALUES
   (1, 'Best Practices with Power BI - FabCon Atlanta', 'FabCon Atlanta', 'Session covering Power BI best practices for enterprise deployments', 'High', '2026-01-15', '2026-03-20', 5000.00, 'person1@somecompany.com', 'Developer Relations', '2026-01-15', 'Admin', 1),
   (2, 'Translytical Task Flows - Build', 'Microsoft Build', 'Deep dive into translytical workloads and real-time analytics patterns', 'Critical', '2026-02-01', '2026-05-19', 7500.00, 'person2@somecompany.com', 'Product Engineering', '2026-02-01', 'Admin', 1),
   (3, 'Advanced DAX Patterns - FabCon Barcelona', 'FabCon Barcelona', 'Workshop on complex DAX calculations and optimization techniques', 'High', '2026-03-01', '2026-09-15', 6000.00, 'person1@somecompany.com', 'Developer Relations', '2026-02-20', 'Admin', 1),
   (4, 'Semantic Modeling Deep Dive - Ignite', 'Microsoft Ignite', 'Comprehensive session on semantic model design and best practices', 'High', '2026-01-10', '2026-11-18', 8000.00, 'person2@somecompany.com', 'Product Engineering', '2026-01-10', 'Admin', 1),
   (5, 'Custom Visuals in Power BI - FabCon Atlanta', 'FabCon Atlanta', 'Hands-on lab for building custom visuals with the Power BI SDK', 'Medium', '2025-12-01', '2026-03-20', 4500.00, 'person1@somecompany.com', 'Developer Relations', '2025-12-01', 'Admin', 1),
   (6, 'TMDL for Version Control - Build', 'Microsoft Build', 'Session on using TMDL for semantic model source control and CI/CD', 'Critical', '2025-11-15', '2026-02-15', 5500.00, 'person2@somecompany.com', 'Product Engineering', '2025-11-15', 'Admin', 1),
   (7, 'Real-time Analytics with Power BI - Ignite', 'Microsoft Ignite', 'Showcase of Direct Lake and real-time streaming capabilities', 'High', '2026-02-10', '2026-11-18', 7000.00, 'person1@somecompany.com', 'Developer Relations', '2026-02-10', 'Admin', 1),
   (8, 'Semantic Modeling Workshop - FabCon Barcelona', 'FabCon Barcelona', 'Interactive workshop on building enterprise-grade semantic models', 'High', '2026-04-01', '2026-09-15', 6500.00, 'person2@somecompany.com', 'Product Engineering', '2026-02-25', 'Admin', 1);
   ```

1. Insert sample status updates:

   ```sql
   INSERT INTO [Status updates] ([Update id], [Project id], [Status], [Updated date], [Updated by], [Notes])
   VALUES
   (1, 1, 'Not Started', '2026-01-15', 'person1@somecompany.com', 'Session abstract submitted and approved'),
   (2, 1, 'In Progress', '2026-01-25', 'person1@somecompany.com', 'Outline completed, starting slide deck'),
   (3, 1, 'In Progress', '2026-02-10', 'person1@somecompany.com', 'Demo environment setup in progress'),
   (4, 1, 'In Progress', '2026-02-25', 'person1@somecompany.com', 'First draft of presentation complete, scheduling dry run'),
   (5, 2, 'Not Started', '2026-02-01', 'person2@somecompany.com', 'Session proposal accepted for Build'),
   (6, 2, 'In Progress', '2026-02-08', 'person2@somecompany.com', 'Research phase - gathering customer scenarios'),
   (7, 2, 'In Progress', '2026-02-15', 'person2@somecompany.com', 'Architecture diagrams drafted'),
   (8, 2, 'In Progress', '2026-02-24', 'person2@somecompany.com', 'Building demo lakehouse environment'),
   (9, 3, 'Not Started', '2026-02-20', 'person1@somecompany.com', 'Call for speakers submission pending review'),
   (10, 4, 'Not Started', '2026-01-10', 'person2@somecompany.com', 'Initial brainstorming session with PM team'),
   (11, 4, 'In Progress', '2026-01-20', 'person2@somecompany.com', 'Content outline approved by leadership'),
   (12, 4, 'In Progress', '2026-02-05', 'person2@somecompany.com', 'Sample semantic models being developed'),
   (13, 5, 'Not Started', '2025-12-01', 'person1@somecompany.com', 'Lab environment requirements documented'),
   (14, 5, 'In Progress', '2025-12-15', 'person1@somecompany.com', 'SDK samples being prepared'),
   (15, 5, 'On Hold', '2026-01-10', 'person1@somecompany.com', 'Paused - waiting on SDK v5 release for new features'),
   (16, 6, 'Not Started', '2025-11-15', 'person2@somecompany.com', 'Session planning initiated'),
   (17, 6, 'In Progress', '2025-12-01', 'person2@somecompany.com', 'GitHub Actions workflow samples created'),
   (18, 6, 'In Progress', '2026-01-15', 'person2@somecompany.com', 'Dry run completed with internal team'),
   (19, 6, 'Completed', '2026-02-15', 'person2@somecompany.com', 'Session delivered at internal summit, ready for Build'),
   (20, 7, 'Not Started', '2026-02-10', 'person1@somecompany.com', 'Topic approved for Ignite breakout session'),
   (21, 7, 'In Progress', '2026-02-18', 'person1@somecompany.com', 'Eventstream demo scenarios identified'),
   (22, 7, 'In Progress', '2026-02-26', 'person1@somecompany.com', 'Direct Lake performance benchmarks in progress'),
   (23, 8, 'Not Started', '2026-02-25', 'person2@somecompany.com', 'Workshop format and duration confirmed');
   ```

## Set up a variable library

Store sensitive configuration like the Teams webhook URL in a variable library rather than in your code.

1. In your Fabric workspace, select **+ New item**.

1. Scroll down to the **Develop data** section and select **Variable library**.

1. Name the variable library `ProjectVariables` and select **Create**.

1. Select **+ New variable** and add the following variables:

   | Variable name | Type | Description |
   |--------------|------|-------------|
   | `TEAMS_WEBHOOK_URL` | Secret | Your Teams incoming webhook URL |
   | `POWERBI_REPORT_URL` | String | URL to your Power BI report (added after publishing) |

1. Select **Save** after adding each variable.

### Get a Teams webhook URL

1. In Microsoft Teams, navigate to the channel where you want to receive status updates.

1. Select **...** (more options) next to the channel name, then select **Connectors**.

1. Search for **Incoming Webhook** and select **Configure**.

1. Name it (for example, "Project Status Bot") and select **Create**.

1. Copy the webhook URL and add it to your variable library as `TEAMS_WEBHOOK_URL`.

> [!IMPORTANT]
> Treat the webhook URL as a secret. Anyone with this URL can post messages to your Teams channel.

## Create the user data functions

Create a user data functions item that handles status updates and Teams notifications.

1. In your Fabric workspace, select **+ New item** > **User Data Functions**.

1. Replace the default code with the following Python code:

   ```python
   import fabric.functions as fn
   import logging
   from datetime import datetime

   udf = fn.UserDataFunctions()


   @udf.connection(argName="sqlDb", alias="ProjectTrackingDb")
   @udf.connection(argName="varLib", alias="ProjectVariables")
   @udf.function()
   def update_project_status(
       sqlDb: fn.FabricSqlConnection,
       varLib: fn.FabricVariablesClient,
       projectId: int,
       newStatus: str,
       updatedBy: str,
       notes: str,
       updatedDate: str
   ) -> str:
       """
       Updates the status of a project by inserting a new record 
       into the Status updates table and sends a Teams notification.
       """
       logging.info(f"Updating status for Project ID: {projectId}")
       
       # Parse and validate the date
       try:
           parsed_date = datetime.fromisoformat(updatedDate)
       except ValueError:
           raise fn.UserThrownError(
               f"Invalid date format. Use ISO format: '2026-02-27T14:30:00'",
               {"providedDate": updatedDate}
           )
       
       # Validate status value
       valid_statuses = ['Not Started', 'In Progress', 'On Hold', 'Completed', 'Cancelled']
       if newStatus not in valid_statuses:
           raise fn.UserThrownError(
               f"Invalid status. Must be one of: {', '.join(valid_statuses)}",
               {"providedStatus": newStatus}
           )
       
       connection = sqlDb.connect()
       cursor = connection.cursor()
       
       try:
           # Get the previous status
           cursor.execute("""
               SELECT TOP 1 [Status] 
               FROM [Status updates] 
               WHERE [Project id] = ? 
               ORDER BY [Update id] DESC
           """, (projectId,))
           prev_row = cursor.fetchone()
           previous_status = prev_row[0] if prev_row else "Not Started"
           
           # Get the next Update ID
           cursor.execute("SELECT ISNULL(MAX([Update id]), 0) + 1 FROM [Status updates]")
           next_update_id = cursor.fetchone()[0]
           
           # Verify the project exists
           cursor.execute("SELECT [Project name] FROM [Project] WHERE [Project id] = ?", (projectId,))
           project_row = cursor.fetchone()
           
           if not project_row:
               raise fn.UserThrownError(f"Project with ID {projectId} not found.")
           
           project_name = project_row[0]
           
           # Insert the new status update
           cursor.execute("""
               INSERT INTO [Status updates] 
               ([Update id], [Project id], [Status], [Updated date], [Updated by], [Notes])
               VALUES (?, ?, ?, ?, ?, ?)
           """, (next_update_id, projectId, newStatus, parsed_date, updatedBy, notes))
           
           connection.commit()
           
           # Send Teams notification
           _send_teams_update(varLib, project_name, previous_status, newStatus, updatedBy, notes)
           
           return f"Status updated for '{project_name}': {previous_status} → {newStatus}"
           
       except Exception as e:
           connection.rollback()
           raise
       finally:
           cursor.close()
           connection.close()


   def _send_teams_update(varLib, project_name, previous_status, new_status, updated_by, notes):
       """Helper function to send Teams notification."""
       import requests
       import json
       
       variables = varLib.getVariables()
       webhook_url = variables.get("TEAMS_WEBHOOK_URL")
       report_url = variables.get("POWERBI_REPORT_URL")
       
       if not webhook_url:
           return
       
       adaptive_card = {
           "type": "message",
           "attachments": [{
               "contentType": "application/vnd.microsoft.card.adaptive",
               "content": {
                   "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
                   "type": "AdaptiveCard",
                   "version": "1.4",
                   "body": [
                       {
                           "type": "TextBlock",
                           "size": "Large",
                           "weight": "Bolder",
                           "text": "📋 Project Status Update"
                       },
                       {
                           "type": "FactSet",
                           "facts": [
                               {"title": "Project:", "value": project_name},
                               {"title": "Status:", "value": f"{previous_status} → {new_status}"},
                               {"title": "Updated By:", "value": updated_by}
                           ]
                       },
                       {
                           "type": "TextBlock",
                           "text": f"**Notes:** {notes}" if notes else "",
                           "wrap": True
                       }
                   ],
                   "actions": [
                       {"type": "Action.OpenUrl", "title": "View Project", "url": report_url}
                   ] if report_url else []
               }
           }]
       }
       
       requests.post(webhook_url, headers={"Content-Type": "application/json"}, 
                     data=json.dumps(adaptive_card), timeout=30)
   ```

1. Configure the connections:
   - Select **Settings** or the connections panel.
   - Add connection `ProjectTrackingDb` pointing to your Fabric SQL Database.
   - Add connection `ProjectVariables` pointing to your Variable Library.

1. Select **Publish** to deploy the function.

## Create the Power BI report

### Connect to your data

1. Open Power BI Desktop.

1. Select **Get data** > **SQL Server database**.

1. Enter your Fabric SQL database connection details.

1. Select the `Project`, `Status updates`, and `Project status` tables/view.

### Create supporting measures

Create measures to support the data function button parameters:

```dax
Selected project id = SELECTEDVALUE(Project[Project id], -1)

Updated by = USERPRINCIPALNAME()

Updated date = FORMAT(NOW(), "yyyy-MM-ddTHH:mm:ss")

Update button text = 
    VAR SelectedProject = SELECTEDVALUE(Project[Project name], "")
    VAR SelectedStatus = SELECTEDVALUE('Status Options'[Status], "")
    RETURN IF(
        SelectedProject <> "" && SelectedStatus <> "",
        "Update " & SelectedProject & " to " & SelectedStatus,
        "Select a project and status"
    )
```

### Design the report

1. Create a table visual that displays project information with columns from the `Project status` view.

1. Add a button slicer with status options: Not Started, In Progress, On Hold, Completed, Cancelled.

1. Add an input slicer for users to enter notes about the status change.

### Add the data function button

1. In the **Insert** tab, select **Button** > **Data function**.

1. In the **Format** pane, configure the button:
   - Set **Text** to your `[Update button text]` measure for dynamic labeling.
   - Select your published `update_project_status` function.

1. Map the function parameters:

   | Parameter | Bound to |
   |-----------|----------|
   | `projectId` | `[Selected project id]` measure |
   | `newStatus` | `SELECTEDVALUE('Status Options'[Status])` |
   | `updatedBy` | `[Updated by]` measure |
   | `notes` | Input slicer value |
   | `updatedDate` | `[Updated date]` measure |

1. Save your report and publish it to the Power BI service.

1. Copy the report URL and add it to your variable library as `POWERBI_REPORT_URL`.

## Test the workflow

1. Open your published report in the Power BI service.

1. Select a project row in the table to set the filter context.

1. Use the button slicer to select a new status (for example, "In Progress").

1. Enter notes in the input slicer (for example, "Started development this week").

1. Select the **Update** button.

1. Watch the report refresh to show the updated status.

1. Check your Teams channel for the Adaptive Card notification with the status change details.

## Related content

- [Understand translytical task flows](./translytical-task-flow-overview.md)
- [Tutorial: Create a translytical task flow](./translytical-task-flow-tutorial.md)
- [Create a data function button in Power BI](./translytical-task-flow-button.md)
- [User data functions overview](/fabric/data-engineering/user-data-functions/user-data-functions-overview)
