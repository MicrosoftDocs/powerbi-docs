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
> * Configure user data functions that update status, request updates, and send Teams notifications.
> * Optionally set up Lakehouse shortcuts with materialized views for Direct Lake views.
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

A variable library stores configuration values separately from your function code. This separation provides a key benefit: you can update values like webhook URLs or report links without editing or republishing your user data functions.

For example, if your Teams channel changes or you need to point to a different report, update the variable library value and the change takes effect immediately—no code changes required.

1. In your Fabric workspace, select **+ New item**.

1. Scroll down to the **Develop data** section and select **Variable library**.

1. Name the variable library `ProjectVariables` and select **Create**.

1. Select **+ New variable** and add the following variables:

   | Variable name | Type | Description |
   |--------------|------|-------------|
   | `TEAMS_WEBHOOK_URL` | String | Your Teams incoming webhook URL |
   | `POWERBI_REPORT_URL` | String | URL to your Power BI report (added after publishing) |

1. Select **Save** after adding each variable.

### Get a Teams webhook URL

1. In Microsoft Teams, navigate to the channel where you want to receive status updates.

1. Select **...** (more options) next to the channel name, then select **Connectors**.

1. Search for **Incoming Webhook** and select **Configure**.

1. Name it (for example, "Project Status Bot") and select **Create**.

1. Copy the webhook URL and add it to your variable library as `TEAMS_WEBHOOK_URL`.

> [!IMPORTANT]
> Anyone with this URL can post messages to your Teams channel.

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


   @udf.connection(argName="sqlDb", alias="ProjectTrackingDb")
   @udf.connection(argName="varLib", alias="ProjectVariables")
   @udf.function()
   def request_status_update(
       sqlDb: fn.FabricSqlConnection,
       varLib: fn.FabricVariablesClient,
       projectId: int,
       requestedBy: str,
       message: str
   ) -> str:
       """
       Sends a Teams notification requesting a status update for a project.
       """
       logging.info(f"Requesting status update for Project ID: {projectId}")
       
       connection = sqlDb.connect()
       cursor = connection.cursor()
       
       try:
           # Get project details
           cursor.execute("""
               SELECT [Project name], [Project manager] 
               FROM [Project] 
               WHERE [Project id] = ?
           """, (projectId,))
           project_row = cursor.fetchone()
           
           if not project_row:
               raise fn.UserThrownError(f"Project with ID {projectId} not found.")
           
           project_name = project_row[0]
           project_manager = project_row[1]
           
           # Get current status
           cursor.execute("""
               SELECT TOP 1 [Status], [Updated date]
               FROM [Status updates] 
               WHERE [Project id] = ? 
               ORDER BY [Update id] DESC
           """, (projectId,))
           status_row = cursor.fetchone()
           current_status = status_row[0] if status_row else "Not Started"
           last_updated = status_row[1].strftime("%Y-%m-%d") if status_row else "Never"
           
           # Send Teams notification
           _send_status_request(varLib, project_name, project_manager, 
                               current_status, last_updated, requestedBy, message)
           
           return f"Status update requested for '{project_name}' from {project_manager}"
           
       finally:
           cursor.close()
           connection.close()


   def _send_status_request(varLib, project_name, project_manager, current_status, 
                           last_updated, requested_by, message):
       """Helper function to send status update request via Teams."""
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
                           "text": "📢 Status Update Requested"
                       },
                       {
                           "type": "FactSet",
                           "facts": [
                               {"title": "Project:", "value": project_name},
                               {"title": "Owner:", "value": project_manager},
                               {"title": "Current Status:", "value": current_status},
                               {"title": "Last Updated:", "value": last_updated},
                               {"title": "Requested By:", "value": requested_by}
                           ]
                       },
                       {
                           "type": "TextBlock",
                           "text": f"**Message:** {message}" if message else "",
                           "wrap": True
                       }
                   ],
                   "actions": [
                       {"type": "Action.OpenUrl", "title": "Update Status", "url": report_url}
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

> [!NOTE]
> Functions used with Power BI data function buttons must return a string (`-> str`). Power BI displays this return value to the user after the function executes, providing feedback about the action's result.

## (Optional) Set up Lakehouse shortcuts for Direct Lake views

Fabric SQL Database stores all data as Delta tables in OneLake, so you can create a Direct Lake semantic model directly on the SQL database tables. However, Direct Lake can't read views from a SQL database—only tables. To use a view with Direct Lake, create shortcuts to the SQL database tables in a Lakehouse, then define the view there.

### Create shortcuts to the SQL database tables

1. In your Fabric workspace, create a new **Lakehouse** and enable schemas.

1. In the Lakehouse Explorer, select **New shortcut** > **Microsoft OneLake**.

1. Browse to your SQL database and select the `Project` table.

1. Repeat to create a shortcut for the `Status updates` table.

The shortcuts provide read access to the underlying Delta tables without duplicating data.

### Create a materialized lake view

Create a materialized view in the Lakehouse that computes the latest status for each project:

1. In the Lakehouse, select **Manage materialized lake views (preview)**.

1. Open a new notebook with Spark SQL.

1. Run the following query:

   ```sql
   CREATE MATERIALIZED LAKE VIEW IF NOT EXISTS dbo.project_status AS
   SELECT 
       p.`Project id` AS ProjectId,
       p.`Project name` AS ProjectName,
       COALESCE(ls.LatestStatus, 'Not Started') AS LatestStatus,
       ls.LatestNotes
   FROM dbo.Project p
   LEFT JOIN (
       SELECT 
           `Project id` AS ProjectId,
           `Status` AS LatestStatus,
           `Notes` AS LatestNotes,
           ROW_NUMBER() OVER (PARTITION BY `Project id` ORDER BY `Update id` DESC) AS RowNum
       FROM dbo.`Status updates`
   ) ls ON p.`Project id` = ls.ProjectId AND ls.RowNum = 1;
   ```

1. Schedule the view refresh by selecting **Schedules** > **On** and setting the frequency.

> [!NOTE]
> The SQL database remains the write target for user data functions. The Lakehouse shortcuts provide read-only access for analytics through the materialized view.

## Create the Power BI report

You can connect to your data using either DirectQuery or Direct Lake:

- **DirectQuery to SQL Database**: Real-time data, supports write-back through user data functions.
- **Direct Lake to SQL Database tables**: Fabric SQL Database stores data as Delta tables in OneLake, so Direct Lake can read tables directly.
- **Direct Lake via Lakehouse (for views)**: Direct Lake can't read views from SQL Database. To use views with Direct Lake, create shortcuts to the SQL database tables in a Lakehouse, then define materialized views there.

> [!TIP]
> Import mode can also be used—there's no limitation on storage mode. With Import, the semantic model must be refreshed before updated values appear in the report.

### Option A: Connect via DirectQuery

1. Open Power BI Desktop.

1. Select **OneLake catalog**.

1. Find your Fabric SQL database.

1. Select **Connect to SQL analytics endpoint**.

1. Select the `Project`, `Status updates`, and `Project status` tables/view.

1. When prompted for storage mode, select **DirectQuery**.

### Option B: Connect via Direct Lake (for analytics performance)

1. In the Power BI service, select **Create** > **OneLake catalog**.

1. Find your Lakehouse.

1. Select the shortcut tables (`Project`, `Status updates`) and the materialized view (`project_status`).

1. Edit the semantic model in the web modeling experience to add measures and relationships.

> [!NOTE]
> With Direct Lake, column names from the materialized view don't have spaces (for example, `ProjectId` instead of `Project id`). Rename the columns in the semantic model to match your measures.

### Create the Status Options calculated table

Create a calculated table that provides the status values for the button slicer. Run this TMDL script in Power BI Desktop:

```tmdl
createOrReplace

	table 'Status Options'

		column Status
			summarizeBy: none
			isNameInferred
			sourceColumn: [Status]
			sortByColumn: 'Sort Order'

		column Description
			summarizeBy: none
			isNameInferred
			sourceColumn: [Description]

		column 'Sort Order'
			isHidden
			formatString: 0
			summarizeBy: sum
			isNameInferred
			sourceColumn: [Sort Order]

		column 'Status Color'
			summarizeBy: none
			isNameInferred
			sourceColumn: [Status Color]

		partition 'Status Options' = calculated
			mode: import
			source =
				DATATABLE(
				    "Status", STRING,
				    "Description", STRING,
				    "Sort Order", INTEGER,
				    "Status Color", STRING,
				    {
				        { "Not Started", "Project has been created but work has not begun", 1, "#808080" },
				        { "In Progress", "Active work is being performed on the project", 2, "#0078D4" },
				        { "On Hold", "Project is paused pending resources, decisions, or dependencies", 3, "#FFB900" },
				        { "Completed", "All project deliverables have been finished", 4, "#107C10" },
				        { "Cancelled", "Project has been terminated and will not be completed", 5, "#D13438" }
				    }
				)
```

### Create supporting measures

Create a calculated table to hold the measures that support the data function buttons. Run this TMDL script in Power BI Desktop:

```tmdl
createOrReplace

	ref table 'Translytical task flow'

		measure 'Selected project id' = SELECTEDVALUE(Project[Project id])
			formatString: 0

		measure 'Updated by' = USERPRINCIPALNAME()

		measure 'Updated date' = FORMAT(TODAY(), "yyyy-mm-dd")

		measure 'Update status button text' = "Update the status of " & SELECTEDVALUE(Project[Project name]) & " to " & SELECTEDVALUE('Status Options'[Status])

		measure 'Latest status' =
				IF(HASONEVALUE(Project[Project id]),
				LASTNONBLANKVALUE('Status updates'[Update id], MAX('Status updates'[Status])),
				BLANK())

		measure 'Latest notes' =
				IF(ISINSCOPE(Project[Project name]), 
				LASTNONBLANKVALUE('Status updates'[Update id], MAX('Status updates'[Notes])), 
				BLANK())

		measure 'Preview of status update' = ```
				VAR _ProjectId = SELECTEDVALUE(Project[Project id], 0)
				VAR _ProjectName = SELECTEDVALUE(Project[Project name], "")
				VAR _PreviousStatus = [Latest Status]
				VAR _NewStatus = SELECTEDVALUE('Status Options'[Status], "N/A")
				VAR _UpdatedBy = [Updated by]
				VAR _UpdatedDate = FORMAT(NOW(), "YYYY-MM-DD HH:mm")
				VAR _NL = UNICHAR(10)
				RETURN 
				IF(_ProjectId = 0 || _NewStatus = "N/A",
				    "⚠️ Select a project and new status to preview",
				    "📋 Teams Notification Preview" & _NL &
				    "━━━━━━━━━━━━━━━━━━━━" & _NL &
				    "Project: " & _ProjectName & _NL &
				    "Status: " & _PreviousStatus & " → " & _NewStatus & _NL &
				    "Updated By: " & _UpdatedBy & _NL &
				    "Date: " & _UpdatedDate & _NL &
				    "Notes: See above" & _NL &
				    "━━━━━━━━━━━━━━━━━━━━" & _NL &
				    "📨 This will be sent to Teams"
				)
				```
```

> [!NOTE]
> If you don't have a `Translytical task flow` table, first create it as a calculated table with `= {1}` or add the measures to an existing table.

These measures serve multiple purposes:

- **Selected project id**: Captures the selected project from a table or other visual
- **Updated by**: Returns the current user's email via `USERPRINCIPALNAME()`
- **Updated date**: Returns today's date formatted for the UDF
- **Update status button text**: Provides dynamic labeling for the update button
- **Latest status/notes**: Show current values in the report using `LASTNONBLANKVALUE`
- **Preview of status update**: Shows what the Teams notification will contain before sending

### Design the report

The report layout guides users through a clear workflow: select a project, choose a new status, add notes, then execute the update.

#### Create the project table

1. Add a **Table** visual to display project information.

1. Add these columns from your data:
   - `Product name`
   - `Project name`
   - `Target end date`
   - `Description`
   - `Latest status` (from the Status or Project status table/view)
   - `Latest notes`

1. Set the title to **1) Pick a project to update**.

1. Sort by **Target end date** ascending to show upcoming deadlines first.

1. Enable row selection so clicking a row sets the filter context for the data function buttons.

#### Create the button slicer for status selection

1. Add a **Button slicer** visual (also called Advanced slicer).

1. In the **Values** field, add `Status Options[Status]`.

1. In the **Label** field, add `FIRST(Status Options[Description])` to show the description beneath each status.

1. In the **Format** pane:
   - Set **Style** to **Cards**.
   - Set **Orientation** to **Horizontal**.
   - Set **Max tiles** to **5** (one for each status).

1. Configure conditional formatting to color each card by the `Status Color` field.

1. Set the title to **2) Pick a new status**.

#### Add input slicers for notes

1. Add a **Text slicer** (input slicer) for users to enter notes about the status update.

1. Set the title to **3) Add notes for this status update**.

1. Optionally, add a second text slicer titled **Or send a message to the Teams channel** for the request update workflow.

#### Add the preview table

1. Add a **Table** visual with a single column: the `[Preview of status update]` measure.

1. Set the title to **Preview update**.

This shows users what their Teams notification will look like before they send it.

### Add the data function buttons

Add two buttons: one for updating status and one for requesting a status update.

#### Update status button

1. In the **Insert** tab, select **Button** > **Data function**.

1. In the **Format** pane, configure the button text:
   - Set **Default text** to your `[Update status button text]` measure for dynamic labeling (for example, "Update the status of Session ABC to In Progress").
   - Set **Disabled text** to static text like "Pick a project, new status, and add notes first".

1. Select your published `update_project_status` function.

1. Map the function parameters:

   | Parameter | Binding type | Bound to |
   |-----------|--------------|----------|
   | `projectId` | Measure | `[Selected project id]` measure |
   | `newStatus` | Slicer | Button slicer visual (auto-clear enabled) |
   | `updatedBy` | Measure | `[Updated by]` measure |
   | `notes` | Slicer | Text slicer visual (auto-clear enabled) |
   | `updatedDate` | Measure | `[Updated date]` measure |

   > [!TIP]
   > Enable **Auto-clear** for slicer parameters so the button slicer and notes text reset after the user triggers the function.

#### Request status update button

1. Add another **Button** > **Data function**.

1. In the **Format** pane, configure the button text:
   - Set **Default text** to static text like "Send Teams message to channel".
   - Set **Disabled text** to "Pick a project and type in a message first".

1. Select your published `request_status_update` function.

1. Map the function parameters:

   | Parameter | Binding type | Bound to |
   |-----------|--------------|----------|
   | `projectId` | Measure | `[Selected project id]` measure |
   | `requestedBy` | Measure | `[Updated by]` measure |
   | `message` | Slicer | Text slicer visual (auto-clear enabled) |

1. Save your report and publish it to the Power BI service.

1. Copy the report URL and add it to your variable library as `POWERBI_REPORT_URL`.

## Test the workflow

### Test the update status flow

1. Open your published report in the Power BI service.

1. Select a project row in the table to set the filter context.

1. Use the button slicer to select a new status (for example, "In Progress").

1. Enter notes in the input slicer (for example, "Started development this week").

1. Select the **Update** button.

1. Watch the report refresh to show the updated status.

1. Check your Teams channel for the Adaptive Card notification with the status change details.

### Test the request status update flow

1. Select a different project row in the table.

1. Enter a message in the input slicer (for example, "Please provide an update on this project").

1. Select the **Request update** button.

1. Check your Teams channel for the request notification, which includes a link back to the report for the project owner to update their status.

## Related content

**Translytical task flows**

- [Understand translytical task flows](./translytical-task-flow-overview.md)
- [Tutorial: Create a translytical task flow](./translytical-task-flow-tutorial.md)
- [Create a data function button in Power BI](./translytical-task-flow-button.md)

**Report visuals**

- [Create buttons in Power BI reports](./desktop-buttons.md)
- [Use the button slicer visual](../visuals/power-bi-visualization-button-slicer.md)
- [Use the input slicer visual](../visuals/power-bi-visualization-input-slicer.md)

**DAX functions**

- [SELECTEDVALUE function (DAX)](/dax/selectedvalue-function-dax)
- [USERPRINCIPALNAME function (DAX)](/dax/userprincipalname-function-dax)

**Fabric data**

- [User data functions overview](/fabric/data-engineering/user-data-functions/user-data-functions-overview)
- [Create user data functions](/fabric/data-engineering/user-data-functions/create-user-data-functions-portal)
- [Connect user data functions to data sources](/fabric/data-engineering/user-data-functions/connect-to-data-sources)
- [Create and manage variable libraries](/fabric/cicd/variable-library/variable-library-overview)
- [Fabric SQL Database overview](/fabric/database/sql/overview)
- [Lakehouse overview](/fabric/data-engineering/lakehouse-overview)
- [Direct Lake overview](/fabric/fundamentals/direct-lake-overview)
- [Materialized lake views overview](/fabric/data-engineering/materialized-lake-views/overview-materialized-lake-view)

**Microsoft Teams**

- [Create an incoming webhook in Teams](/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook)
- [Adaptive Cards](https://adaptivecards.microsoft.com/)
