---
title: Power BI Report Planner and Management Skills Overview
description: Learn about the Power BI report planner and powerbi-report-management skills and how they help you plan, build, and manage Power BI reports end to end.
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
#customer intent: As a Power BI developer, I want to understand how the Planner and Management skills work together so that I can orchestrate report creation and Fabric report lifecycle operations.
---

# Power BI report planner and management skills overview

> [!IMPORTANT]
> These skills are currently in preview.

Use this overview to understand how the Power BI report planner and Power BI report management skills work together to support the report lifecycle in Microsoft Fabric.

This article explains when to use each skill, what each skill does, and how they connect with powerbi-report-design and powerbi-report-authoring to move from requirements and planning to PBIR authoring and workspace deployment.

If you're building reports from an existing semantic model and need a controlled workflow with approval points, start with the Planner skill. If you need to create, update, download, or delete report items in a Fabric workspace, use the Management skill.

## Prerequisites

These skills are part of the [**Power BI Authoring plugin**](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) in the [Skills for Fabric](https://github.com/microsoft/skills-for-fabric) marketplace. Follow the instructions in [**Power BI Agentic overview**](power-bi-agentic-overview.md) to install these skills.

## Power BI report planner skill

The Power BI report planner skill guides you through defining, planning, and building a new Power BI report from an existing semantic model:

**Define → Inspect → Brief → Approve**

It's a guided workflow skill that gathers requirements, inspects the semantic model, produces a locked report brief and implementation plan, waits for your approval, and then proceeds to build the report end-to-end.

### When to use the report planner skill

Use this skill when you need both a guided requirements workflow **and** a path to implementation after approval. Typical triggers include:

- "Let's create a new Power BI report from this semantic model."
- "Help me define and then build a Power BI report."
- "Build a new Power BI report."
- "Plan then implement a Power BI report."

> [!NOTE]
> For small edits to an existing report page, use `powerbi-report-authoring` directly. For visual design critique or greenfield design guidance, use `powerbi-report-design`.

### Key capabilities of the report planner skill

- **Guided requirements gathering** — Structured 3–5 clarification rounds covering audience, purpose, model scope, page architecture, design, and delivery target.
- **Semantic model inspection** — Automatically inventories tables, columns, measures, and relationships using available tooling (modeling MCP server, semantic model skill, or local TMDL files).
- **Locked brief and implementation plan** — Produces `requirements.md`, `design-brief.md`, and `plan.md` before any code is written.
- **Approval-gated implementation** — Doesn't build anything until the user explicitly approves the plan.
- **End-to-end build** — Executes model changes, PBIR file generation, Desktop validation and screenshots, and optional Fabric publishing after approval.
- **Dependency awareness** — Explicitly checks for Power BI Desktop, PBIP/PBIR project, modeling MCP, report-authoring skill, and Fabric publishing tools before starting.

## Power BI report management skill

The Power BI report management skill manages Power BI report items in Microsoft Fabric workspaces. It uses the `az rest` CLI against the Fabric REST API to perform the full CRUD lifecycle for report items and their PBIR definitions.

> [!NOTE]
> **Scope**: This skill handles report item CRUD and definition management only. For report layout authoring - pages, visuals, filters, formatting - use `powerbi-report-authoring`.

### When to use the report management skill

Use this skill when you need to:

- Create a report from a PBIR definition
- Get or download a report definition
- Update a report definition or properties
- List reports in a workspace
- Delete a report

### Key capabilities of the report management skill

- **Report CRUD** — List, create, get, update (properties and definition), and delete report items in any Fabric workspace.
- **PBIR definition management** — Download, encode, upload, and update full PBIR definitions including all report, page, and visual files.
- **Long-Running Operation (LRO) support** — Handles asynchronous `202 Accepted` responses for create, get definition, and update definition operations.
- **Semantic model binding verification** — Validates that PBIR entity and query references match the target workspace semantic model before publishing.
- **Workspace and report resolution** — Resolves workspace IDs and report IDs dynamically by name via List APIs.

### Supported operations for the report management skill

| Operation | HTTP method | Endpoint |
|---|---|---|
| List reports | GET | `/v1/workspaces/{workspaceId}/reports` |
| Get report | GET | `/v1/workspaces/{workspaceId}/reports/{reportId}` |
| Get report definition | POST | `/v1/workspaces/{workspaceId}/reports/{reportId}/getDefinition?format=PBIR` |
| Create report | POST | `/v1/workspaces/{workspaceId}/reports` |
| Update report definition | POST | `/v1/workspaces/{workspaceId}/reports/{reportId}/updateDefinition` |
| Update report properties | PATCH | `/v1/workspaces/{workspaceId}/reports/{reportId}` |
| Delete report | DELETE | `/v1/workspaces/{workspaceId}/reports/{reportId}` |

### Tool stack for the report management skill

| Tool | Role |
|---|---|
| `az` CLI | Primary tool - use `az rest` for Fabric REST API calls and `az login` for authentication. |
| `jq` | Parse and construct JSON payloads. |
| `base64` / PowerShell | Encode and decode PBIR file content for definition payloads. |

## How the skills work together

Four complementary skills - [Power BI report authoring skill](power-bi-report-authoring-skill-overview.md), [Power BI report design skill](power-bi-report-design-skill-overview.md), Power BI report planner skill, and Power BI report management skill - cover the full Power BI report lifecycle - from visual design through Fabric publishing:

| Skill | Role in the lifecycle |
|---|---|
| **`powerbi-report-design`** | Design guidance - archetype selection, chart choice, color and layout principles, anti-pattern detection. Use this skill first when you don't have explicit design guidance or want to critique an existing report's visual design. |
| **`powerbi-report-planner`** | End-to-end guided workflow - gathers requirements, inspects the semantic model, produces a locked brief and implementation plan, then builds the report after approval. Hands off to the skills below for authoring and publishing. |
| **`powerbi-report-authoring`** | PBIR file authoring and validation - creates and edits pages, visuals, filters, themes, and formatting in PBIR/PBIP format. All PBIR content must go through this skill; no other skill constructs PBIR JSON directly. |
| **`powerbi-report-management`** | Fabric API transport - uploads, downloads, updates, and deletes report items in Fabric workspaces via the Fabric REST API. Strictly for API transport; relies on `powerbi-report-authoring` for all PBIR content. |

The typical end-to-end flow is:

```
powerbi-report-design          powerbi-report-planner
──────────────────────         ──────────────────────────────
Visual design guidance    →    Requirements gathering
Archetype recommendation  →    Semantic model inspection
Color / layout principles →    Brief and plan production
                               Model changes (measures/cols)
                                         │
                                         ▼
                          powerbi-report-authoring
                          ────────────────────────────────
                          PBIR page and visual authoring
                          Filter, theme, formatting edits
                          Validation (JSON, Desktop, screenshots)
                                         │
                                         ▼
                          powerbi-report-management
                          ────────────────────────────────
                          Upload to Fabric workspace
                          Update existing report definition
                          Download / manage workspace reports
```

Each skill can also be used independently:

- Use **`powerbi-report-design`** alone to get design feedback on an existing report or choose a layout for a new one.
- Use **`powerbi-report-authoring`** directly for targeted edits to an existing PBIR report without going through the full planner workflow.
- Use **`powerbi-report-management`** standalone to list, download, update, or delete reports in Fabric at any time.

## Considerations

- **PBIR content authoring**: All PBIR file content – whether creating a new report or modifying an existing one – must go through the `powerbi-report-authoring` skill. The `powerbi-report-management` skill is strictly for API transport (upload, download, delete). Never construct PBIR JSON from memory or guesswork.
- **PBIR-Legacy format**: Reports in PBIR-Legacy format aren't supported. Use the `?format=PBIR` parameter on `getDefinition`. If a definition returns `"format": "PBIR-Legacy"`, these skills can't process it.
- **Long-running operations**: Create, get definition, and update definition operations might return `202 Accepted`. Always poll the operation to completion before proceeding.
- **Local edits stay local**: The report planner skill doesn't publish to Fabric unless you explicitly approve publishing. The `powerbi-report-management` skill also treats edits as local-only until you request publishing.
- **Semantic model bindings**: When uploading a local PBIP to Fabric, entity names in PBIR must match the target workspace semantic model table names. Verify bindings before publishing.

## Next steps

- [What is the Power BI Report Authoring skill?](power-bi-report-authoring-skill-overview.md)
- [What is the Power BI Report Design skill?](power-bi-report-design-skill-overview.md)

## Related content

- [Power BI MCP servers overview](../mcp/mcp-servers-overview.md)
- [powerbi-report-authoring skill](https://github.com/microsoft/skills-for-fabric/blob/main/skills/powerbi-report-authoring/SKILL.md)
- [Fabric REST API — Reports](/rest/api/fabric/report/items)
- [Power BI REST APIs](/rest/api/power-bi)
