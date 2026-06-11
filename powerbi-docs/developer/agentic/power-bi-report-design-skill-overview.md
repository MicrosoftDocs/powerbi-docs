---
title: Power BI Report Design skill
description: Overview of the Power BI Report Design skill that gives AI agents opinionated design guidance — archetype routing, chart selection, color, typography, layout, and a base theme — for Power BI reports.
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
ms.custom: copilot-skill, design, skills-for-fabric
#customer intent: As a Power BI developer, I want to understand the Report Design skill so that I can produce design briefs that guide consistent report authoring outcomes.
---

# What is the Power BI Report Design skill?

> [!IMPORTANT]
> This feature is in preview.

The **Power BI Report Design skill** (`powerbi-report-design`) is an AI-agent skill that supplies opinionated **design guidance** for Power BI reports — archetype routing per page, chart selection, color, typography, layout, accessibility, anti-pattern detection, and an opinionated theme preset. It's distributed as part of the [**PowerBI authoring plugin**](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) in the [**Skills for Fabric**](https://github.com/microsoft/skills-for-fabric) marketplace.

The Report Design skill decides ***what*** a report should look like and ***why***. It does **not** write PBIR files. After producing a structured **design brief**, it hands off to the [Power BI Report Authoring skill](power-bi-report-authoring-skill-overview.md) for all file mechanics: page and visual creation, theme registration, expression encoding, formatting, and validation.

## Common scenarios

The Report Design skill works best when the user's intent is design-shaped rather than file-shaped.

**Example use cases:**

- "Build a sales report for the executive team."
- "Design an ops monitoring page for the on-call rotation."
- "Make this report look professional."
- "What should this report look like?"
- Critiquing or redesigning an existing report's layout, color, and visual mix.
- Producing a multi-page composition for a "cover everything" request (Executive landing + Comparative ranking + Analytical exploration +
  optional Narrative timeline).

## How it complements the Report Authoring and Planner skills

The Design, Planner, and Authoring skills form a **design → plan → author** pipeline. The [Power BI Report Planner skill](power-bi-planner-fabric-skill-overview.md) orchestrates the entire end-to-end flow. It calls the Power BI Report Design skill for design guidance, then the [Power BI Report Authoring skill](power-bi-report-authoring-skill-overview.md) for PBIR file mechanics, and the [Power BI Report Management skill](power-bi-planner-fabric-skill-overview.md) for Fabric publishing.

| Phase | Skill | Output |
|-------|-------|--------|
| Investigate the semantic model | Report Design | Tables, columns, measures, distributions, magnitudes |
| Route per-page archetype + variant | Report Design | Archetype + `layout_variant` + `variant_rationale` per page |
| Pick chart types | Report Design | Visual type per analytical question |
| Configure visuals + theme | Report Design | Sort, color, labels, theme JSON |
| Emit design brief | Report Design | YAML brief with wireframes |
| Validate brief against pre-flight checklist | Report Design | Reviewed brief |
| Author PBIR files | [Report Authoring](power-bi-report-authoring-skill-overview.md) | `report.json`, `page.json`, `visual.json`, `theme.json` |
| Validate + reload + screenshot | [Report Authoring](power-bi-report-authoring-skill-overview.md) | Verified rendering |

The brief is the **contract** between the two skills. It specifies *what* to build. The authoring skill decides exact pixel coordinates, PBIR expression encoding, and visual container objects on its own.

## Considerations

- **Design first, file mechanics second** — The skill produces a brief, not PBIR files. Hand off to the
  [Report Authoring skill](power-bi-report-authoring-skill-overview.md) for implementation.
- **Vague prompts get options, not guesses** — The skill is built to stop, offer 2–3 named options, and proceed only after the user picks
  (or after at most two clarifying rounds with a documented assumption).
- **Existing themes are respected** — The skill won't overwrite a user's existing theme without asking. It adapts selectively or applies the base theme as `customTheme` alongside it.

## Next steps

- [What is the Power BI Report Authoring skill?](power-bi-report-authoring-skill-overview.md)
- [What is the Power BI Report Planner and powerbi-report-management skill?](power-bi-planner-fabric-skill-overview.md)
- [Power BI MCP servers overview](../mcp/mcp-servers-overview.md)

## Related content

- [Skills for Fabric on GitHub](https://github.com/microsoft/skills-for-fabric)
- [Power BI Modeling MCP server on GitHub](https://github.com/microsoft/powerbi-modeling-mcp)
- [Prepare your data for AI](/power-bi/create-reports/copilot-prepare-data-ai)
- [Power BI Desktop developer documentation](/power-bi/developer/)
