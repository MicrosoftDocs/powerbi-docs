---
title: Power BI Report Authoring skill
description: Overview of the Power BI Report Authoring skill that enables AI agents to read, validate, and author Power BI reports in PBIR/PBIP format.
author: billmath
ms.author: billmath
ms.reviewer: kaurharleen
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 06/03/2026
ms.collection: ce-skilling-ai-copilot
ms.update-cycle: 180-days
ai-usage: ai-assisted
ms.custom: copilot-skill, pbir, pbip
#customer intent: As a Power BI developer, I want to understand the Report Authoring skill so that I can decide when to use it for PBIR report creation and editing workflows.
---

# What is the Power BI Report Authoring skill?

> [!IMPORTANT]
> This feature is in preview.

The **Power BI Report Authoring skill** (`powerbi-report-authoring`) is an AI-agent skill that enables natural-language authoring, modification, and validation of Power BI report definitions in the **PBIR (Power BI Report)** format used by **PBIP (Power BI Project)** files. It's distributed as part of the [**PowerBI authoring plugin**](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) in the [**Skills for Fabric**](https://github.com/microsoft/skills-for-fabric) marketplace — Microsoft's first-party catalog of agent skills for Microsoft Fabric — and is optimized for GitHub Copilot CLI with cross-tool compatibility for VS Code Copilot, Claude Code, Cursor, Codex/Jules, and Windsurf.

Combined with the [Power BI MCP servers](../mcp/mcp-servers-overview.md), it provides an end-to-end agentic authoring loop that spans semantic models, report layout, and live Power BI Desktop verification.

Choose this skill when an agent needs to create or modify the **report layer** (pages, visuals, filters, slicers, formatting, themes). 
For semantic model authoring (tables, columns, measures, DAX), use the [Power BI Modeling MCP server](../mcp/mcp-servers-overview.md#power-bi-mcp-server-local).
For data querying and insights, use the [remote Power BI MCP server](../mcp/mcp-servers-overview.md#power-bi-mcp-server-remote).

## Common scenarios

The Report Authoring skill is ideal for AI agents working in editors such as GitHub Copilot in Visual Studio Code that need to make precise, schema-correct changes to Power BI reports.

Use cases:
- Create a new report from an existing semantic model
- Modify an existing report
-Modernize an existing report with better designs

**Example use cases:**

- Create a report with two pages where page 1 includes Cards for salient measures, Bar chart, Table bound to an existing semantic mode 
- Add a new page with a clustered column chart, KPI cards, and a date slicer bound to an existing semantic model.
- Re-theme an existing report with a new dark theme, including `dataColors`, `textClasses`, and `visualStyles` updates.
- Convert legacy `card` or matrix visuals to modern `cardVisual` and `pivotTable` visuals and reapply selector-based formatting.
- Diagnose a visual rendering as an error icon or empty frame in Desktop and fix the underlying queryState or role bindings.

## Companion skill: Power BI Report Design and Power BI Report Planner

For greenfield report builds, redesigns, or "make this look professional" requests, pair this skill with the [Power BI Report Design skill](power-bi-report-design-skill-overview.md). The design skill produces a structured **design brief** — archetype per page, layout variant, chart selection, color map, theme — that becomes the deterministic input to the Report Authoring skill.

For end-to-end guided report creation — requirements gathering, semantic model inspection, brief production, approval, and build — use the [Power BI Report Planner skill](power-bi-planner-fabric-skill-overview.md). The planner orchestrates the full pipeline, calling this skill for all PBIR file mechanics and the [Power BI Report Management skill](power-bi-planner-fabric-skill-overview.md) for Fabric publishing.

| You're starting from… | Begin with |
|------------------------|------------|
| A locked design or an explicit edit request ("add a card showing `[Total Sales]`") | This skill (Report Authoring) |
| A blank slate or design-shaped request ("design a sales dashboard", "what should this look like?") | [Report Design skill](power-bi-report-design-skill-overview.md) → hands off here |
| An existing report that needs visual rework | [Report Design skill](power-bi-report-design-skill-overview.md) for critique → hands off here |
| A new report that needs guided planning, requirements, and end-to-end build | [Report Planner skill](power-bi-planner-fabric-skill-overview.md) → hands off here |

All three skills ship in the same [**PowerBI authoring plugin**](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) and are designed to be installed together.

## How it complements the Power BI MCP server and tools

| Layer | Tool | Responsibility |
|-------|------|----------------|
| Semantic model (tables, columns, measures, DAX) | [Power BI Modeling MCP server](../mcp/mcp-servers-overview.md#power-bi-mcp-server-local) | Create and update the data model |
| Data queries and insights | [Remote Power BI MCP server](../mcp/mcp-servers-overview.md#power-bi-mcp-server-remote) | Generate and execute DAX |
| Report layer (PBIR/PBIP files) | **Power BI Report Authoring skill** | Edit pages, visuals, filters, formatting, themes |
| Live Desktop verification | [Power BI Desktop CLI (Desktop Bridge)](power-bi-desktop-bridge-overview.md) | Open, reload, status, screenshot |
| Greenfield planning and design | [Power BI Report Planner skill](power-bi-planner-fabric-skill-overview.md), [Power BI Report Design skill](power-bi-report-design-skill-overview.md) | Requirements, archetypes, layout, color, typography |

A typical end-to-end agent flow combines these steps:
1. Use the **Modeling MCP server** to ensure the semantic model has the tables, columns, and measures the report needs.
2. Use the **Report Authoring skill** to edit PBIR files for pages, visuals, and formatting.
3. Use **`validate-report`** to catch structural problems.
4. Use the **Power BI Desktop bridge** to reload Desktop and capture screenshots.
5. Delegate review to an independent design-reviewer pass and iterate until both validation and visual checks pass.

> [!NOTE]
> You can also start with step 2 with an existing PBIP files.

## Considerations

The Report Authoring skill works directly with JSON files on disk.

- **Support** - The skill works only with PBIP files.
- **Source control** - Commit a baseline before you allow the agent to modify PBIR files so you can revert changes.
- **Source of truth** - The PBIR file is the source of truth. Save your manual changes in Power BI Desktop before you ask the agent to iterate on your report. If you have unsaved changes in Power BI Desktop and you ask the agent to iterate on your report, the agent fetches the version from PBIR and doesn't include your unsaved changes.
- **Legacy vs. modern visuals** - Some visuals, including Q&A, Bing maps, and filled maps, will be deprecated soon. It is recommended to avoid prompting the agent to create these visuals.


## Next steps

- [What is the Power BI Report Design skill?](power-bi-report-design-skill-overview.md)
- [What is the Power BI Report Planner and powerbi-report-management skill?](power-bi-planner-fabric-skill-overview.md)
- [Power BI MCP servers overview](../mcp/mcp-servers-overview.md)
- [Set up the remote Power BI MCP server](../mcp/remote-mcp-server-get-started.md)

## Related content

- [Skills for Fabric on GitHub](https://github.com/microsoft/skills-for-fabric)
- [Power BI Modeling MCP server on GitHub](https://github.com/microsoft/powerbi-modeling-mcp)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)
- [Power BI Desktop developer documentation](/power-bi/developer/)
