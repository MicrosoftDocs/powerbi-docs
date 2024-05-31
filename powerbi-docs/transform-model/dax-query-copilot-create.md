---
title: Use Copilot to write and explain DAX queries
description: Learn how to use Copilot to write and explain DAX queries in DAX query view in Power BI Desktop.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/22/2024
LocalizationGroup: Create reports
---

# Use Copilot to write and explain DAX queries

With DAX query view in Power BI, you can use Copilot to write and explain DAX queries in DAX query view with Data Analysis Expressions (DAX) queries in semantic models. DAX query view comes with several ways to help you be as productive as possible with DAX queries. This feature is currently in public preview. See [Copilot DAX query features](dax-query-copilot-features.md) for ways that Copilot can help you be as productive as possible with DAX queries.

Copilot can write and explain DAX queries in DAX query view in public preview. DAX query view includes an inline Fabric Copilot to write and explain DAX queries, which remain in public preview.

> [!NOTE]
> DirectQuery model authors can also use DAX query view. View the data in your tables whenever you want.

## 1. Run the DAX query before you keep it

Previously the **Run** button was disabled until the generated DAX query was accepted or Copilot was closed. Now you can Run the DAX query then decide to Keep or Discard the DAX query. 

:::image type="content" source="media/dax-query-copilot/copilot-run-query.png" alt-text="Screenshot of running the DAX query before you save it.":::

## 2. Build the DAX query conversationally

Previously the DAX query generated was not considered if you typed additional prompts and you had to keep the DAX query, select it again, then use Copilot again to adjust. Now you can simply adjust by typing in additional user prompts. 

:::image type="content" source="media/dax-query-copilot/copilot-explain-query.png" alt-text="Screenshot of asking DAX to explain the query."::: 

## 3. Syntax checks on the generated DAX query

Previously there was no syntax check before the generated DAX query was returned. Now the syntax is checked, and the prompt automatically retried once. If the retry is also invalid, the generated DAX query is returned with a note that there is an issue, giving you the option to rephrase your request or fix the generated DAX query:

"This query contains errors. Rephrase your request and try again or try fixing it yourself."

## 4. Inspire buttons to get you started with Copilot
 
Previously nothing happened until you entered a prompt. Now select any of these buttons to see quickly what you can do with Copilot.

:::image type="content" source="media/dax-query-copilot/copilot-inspire-buttons-get-started.png" alt-text="Screenshot of showing Copilot offers suggestions."::: 

## Related content

Learn more about DAX queries with Copilot with these resources.

- [DAX queries](/dax/dax-queries)  
- [Work with Modeling view](desktop-modeling-view.md)
