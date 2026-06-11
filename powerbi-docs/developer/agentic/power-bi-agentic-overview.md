---
title: Power BI Agentic Overview
description: Overview of Power BI Agentic — a set of agent skills and tools, packaged in the powerbi-authoring plugin, that improve the experience of developing Power BI with AI coding agents such as GitHub Copilot.
author: billmath
ms.author: billmath
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
ms.date: 06/04/2026
ms.collection: ce-skilling-ai-copilot
ai-usage: ai-assisted
#customer intent: As a Power BI developer, I want to understand Power BI Agentic so that I can install the powerbi-authoring plugin and use an AI coding agent to build and refine Power BI semantic models and reports.
---

# Power BI Agentic overview

Power BI Agentic is a set of agent skills and tools that improve your experience when developing Power BI with AI coding agents such as GitHub Copilot. It's not a Power BI feature you turn on — it's a curated bundle you install into your agent so the agent can build and refine Power BI semantic models and reports using natural language.

It combines two building blocks:

- **Agent skills** — Folders of instructions, scripts, and resources that an agent loads on demand to follow Power BI authoring best practices. Skills cover both **semantic model authoring** (designing a star schema, writing DAX, structuring a PBIP project, preparing a model for AI) and **report authoring** (creating pages and visuals, formatting, and validating PBIR report definitions).
- **Tools** — MCP servers and CLI bridges that let the agent inspect schemas, run DAX, edit semantic models, validate reports, and drive Power BI Desktop directly — for example, reloading a model or capturing screenshots for visual verification.

Skills tell the agent *what* to do. Tools let the agent *do* it. Used together, they turn a natural-language prompt into a working semantic model or report.

## Get started

The recommended way to get started is installing the **`powerbi-authoring`** plugin from the [**Skills for Fabric**](https://github.com/microsoft/skills-for-fabric) marketplace. The plugin bundles the skills and tools you need to author Power BI content with an AI agent:

- **Power BI agent skills**, semantic model skills for semantic model creation, editing, deployment, and AI readiness, and the report authoring skills for building and validating PBIR report definitions.
- **The Power BI Modeling MCP server**, registered automatically so the agent can connect to Power BI Desktop and Fabric workspaces.

Without the plugin, you'd register MCP server and add each skill manually. The plugin wires them up in a single command so you can go from install to prompting in minutes.

> [!NOTE]
> Skills for Fabric is optimized for **GitHub Copilot CLI** and provides cross-tool compatibility shims for **VS Code Copilot**, **Claude Code**, **Cursor**, **Codex/Jules**, and **Windsurf**. The install scripts configure the appropriate compatibility files automatically.

### Prerequisites

Before you begin, ensure you have:

- **GitHub Copilot CLI** - [Install GitHub Copilot CLI](https://docs.github.com/copilot/github-copilot-in-the-cli).
- **Node.js 18 or later** - Required to install the Power BI Modeling MCP server. [Install Node.js](https://nodejs.org/en).

### Install the plugin with GitHub Copilot CLI

1. Add the `skills-for-fabric` marketplace and install the `powerbi-authoring` plugin:

    ```bash
    copilot plugin marketplace add microsoft/skills-for-fabric
    copilot plugin install powerbi-authoring@fabric-collection
    ```

1. Start GitHub Copilot and confirm the Power BI skills are loaded by running:

    ```text
    /skills
    ```

    Verify that skills such as `semantic-model-authoring` appear in the list. 
    
### Install the plugin with Visual Studio Code

To install the plugin in VS Code, follow the steps in [Customize AI in Visual Studio Code](https://code.visualstudio.com/docs/agent-customization/overview#_agent-customizations-editor) and search for the `powerbi-authoring` plugin.

## Skills

| Skill | Description |
| --- | --- |
| [`semantic-model-authoring`](https://github.com/microsoft/skills-for-fabric/blob/main/skills/semantic-model-authoring/SKILL.md) | Create, edit, deploy, and manage Power BI semantic models across Power BI Desktop, PBIP projects, and the Fabric service. Covers Import, DirectQuery, and Direct Lake models; DAX measures, tables, columns, and relationships; deployment, refresh, data sources and permissions; and DAX performance optimization. |
| [`power-bi-report-authoring`](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) | Create, edit and validate Power BI report in the PBIR (Power BI Report) format used by PBIP (Power BI Project) files.|
| [`power-bi-report-design`](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) | Produce a structured design brief to provide design guidance for Power BI reports in the PBIR format used by PBIP.|
| [`power-bi-report-planner`](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) | Follow a guided workflow to define, plan, and build a new Power BI report from an existing semantic model|
| [`power-bi-report-management`](https://github.com/microsoft/skills-for-fabric/tree/main/plugins/powerbi-authoring) | Get, publish and manage Power BI reports in Microsoft Fabric workspaces.|

For the full list of skills and to discover new ones as they're released, see [microsoft/skills-for-fabric](https://github.com/microsoft/skills-for-fabric).

## Tools

| Tool | Description |
| --- | --- |
| [Power BI MCP server](https://github.com/microsoft/powerbi-modeling-mcp) | Local MCP server that lets the agent inspect schemas, run DAX, and edit semantic models in Power BI Desktop or Microsoft Fabric. Registered automatically by the `powerbi-authoring` plugin. |
| [Power BI Desktop Bridge](power-bi-desktop-bridge-overview.md) | Local server hosted within the Power BI Desktop process which enables external tools to communicate with a running instance of Power BI Desktop on the local machine.|

## Next steps

- [Get started with the Semantic model authoring skill](semantic-model-authoring-skill-overview.md)
- [Get started with the Power BI report authoring skill](power-bi-report-authoring-skill-overview.md)

## Related content

- [Skills for Fabric on GitHub](https://github.com/microsoft/skills-for-fabric)
- [Power BI MCP servers overview](../mcp/mcp-servers-overview.md)
