---
title: Use Copilot to write and explain DAX queries in DAX query view
description: Learn how to use Copilot to write DAX queries in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/22/2024
LocalizationGroup: Create reports
---

# Use Copilot to write and explain DAX queries in DAX query view

With DAX query view in Power BI, you can use Copilot to write and explain DAX queries in DAX query view with Data Analysis Expressions (DAX) queries in semantic models. DAX query view comes with several ways to help you be as productive as possible with DAX queries. This feature is currently in public preview.

> [!NOTE]
> DirectQuery model authors can also use DAX query view. View the data in your tables whenever you want.

## DAX query features

DAX query view comes with several ways to help you be as productive as possible with DAX queries.

### Quick queries

Have the DAX query written for you from the context menu of tables, columns, or measures in the Data pane of DAX query view. Get the top 100 rows of a table, statistics of a column, or DAX formula of a measure to edit and validate in just a few clicks.

### Create and edit measures

Edit one or multiple measures at once. Make changes and see the change in action in a DA query. Then update the model when you are ready. All in DAX query view.

### See the DAX query of visuals

Investigate the visuals DAX query in DAX query view. Go to the Performance Analyzer pane and choose **Run in DAX query view**. 

### Write DAX queries

You can create DAX queries with Intellisense, formatting, commenting/uncommenting, and syntax highlighting. And additional professional code editing experiences such as “Change all occurrences” and block folding to expand and collapse sections. Even expanded find and replace options with regex. 

## Copilot writes and explains DAX queries

Copilot can write and explain DAX queries in DAX query view public preview updates in DAX query view public preview updates

DAX query view includes an inline Fabric Copilot to write and explain DAX queries, which remains in public preview. This month we have made the following updates. 

### 1. Run the DAX query before you keep it

Previously the **Run** button was disabled until the generated DAX query was accepted or Copilot was closed. Now you can Run the DAX query then decide to Keep or Discard the DAX query. 

:::image type="content" source="media/dax-query-copilot/copilot-run-query.png" alt-text="Screenshot of running the DAX query before you save it.":::

### 2. Build the DAX query conversationally

Previously the DAX query generated was not considered if you typed additional prompts and you had to keep the DAX query, select it again, then use Copilot again to adjust. Now you can simply adjust by typing in additional user prompts. 

:::image type="content" source="media/dax-query-copilot/copilot-explain-query.png" alt-text="Screenshot of asking DAX to explain the query."::: 

### 3. Syntax checks on the generated DAX query

Previously there was no syntax check before the generated DAX query was returned. Now the syntax is checked, and the prompt automatically retried once. If the retry is also invalid, the generated DAX query is returned with a note that there is an issue, giving you the option to rephrase your request or fix the generated DAX query. 

:::image type="content" source="media/dax-query-copilot/copilot-query-contains-errors.png" alt-text="Screenshot of showing the query contains errors."::: 

### 4. Inspire buttons to get you started with Copilot
 
Previously nothing happened until you entered a prompt. Now select any of these buttons to see quickly what you can do with Copilot.

:::image type="content" source="media/dax-query-copilot/copilot-inspire-buttons-get-started.png" alt-text="Screenshot of showing Copilot offers suggestions."::: 

## Related content

Learn more about DAX queries with Copilot with these resources.

- [DAX queries](/dax/dax-queries)  
- [Work with Modeling view](desktop-modeling-view.md)
