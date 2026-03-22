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
   (1, 'Website Redesign', 'Customer Portal', 'Complete redesign of the customer-facing website', 'High', '2026-01-15', '2026-03-20', 50000.00, 'Alex Kim', 'Engineering', '2026-01-15', 'Admin', 1),
   (2, 'Mobile App v2', 'Mobile Platform', 'Major update to the mobile application', 'Critical', '2026-02-01', '2026-05-19', 75000.00, 'Jordan Lee', 'Product', '2026-02-01', 'Admin', 1),
   (3, 'Data Migration', 'Infrastructure', 'Migrate legacy data to new platform', 'High', '2026-03-01', '2026-04-15', 30000.00, 'Sam Chen', 'Data Engineering', '2026-02-20', 'Admin', 1),
   (4, 'Security Audit', 'Compliance', 'Annual security compliance audit', 'High', '2026-01-10', '2026-02-28', 25000.00, 'Taylor Smith', 'Security', '2026-01-10', 'Admin', 1),
   (5, 'Customer Portal', 'Customer Portal', 'New self-service portal for customers', 'Medium', '2025-12-01', '2026-03-20', 45000.00, 'Morgan Davis', 'Engineering', '2025-12-01', 'Admin', 1);
   ```

1. Insert sample status updates:

   ```sql
   INSERT INTO [Status updates] ([Update id], [Project id], [Status], [Updated date], [Updated by], [Notes])
   VALUES
   (1, 1, 'Not Started', '2026-01-15', 'Alex Kim', 'Project kickoff scheduled'),
   (2, 1, 'In Progress', '2026-01-20', 'Alex Kim', 'Development started'),
   (3, 2, 'Not Started', '2026-02-01', 'Jordan Lee', 'Requirements gathering'),
   (4, 3, 'In Progress', '2026-03-01', 'Sam Chen', 'Migration scripts ready'),
   (5, 4, 'Completed', '2026-02-15', 'Taylor Smith', 'Audit passed with no findings');
   ```

## Set up a variable library

Store sensitive configuration like the Teams webhook URL in a variable library rather than in your code.

1. In your Fabric workspace, select **+ New item** > **Variable Library**.

1. Name it `ProjectVariables`.

1. Add the following variables:

   | Variable name | Type | Description |
   |--------------|------|-------------|
   | `TEAMS_WEBHOOK_URL` | Secret | Your Teams incoming webhook URL |
   | `POWERBI_REPORT_URL` | String | URL to your Power BI report (added after publishing) |

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
