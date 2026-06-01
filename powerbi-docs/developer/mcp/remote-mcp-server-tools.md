---
title: Remote Power BI MCP server tools
description: Learn about the available tools in the remote Power BI MCP server for querying semantic models through AI agents.
author: billmath
ms.author: billmath
ms.reviewer: sgodderidge
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.date: 11/19/2025
#customer intent: As a developer, I want to understand the available MCP server tools so that I can build AI agents that effectively query Power BI semantic models.
---

# Power BI MCP server (remote) tools

The remote Power BI MCP server provides tools that enable AI agents to chat with data in Power BI semantic models using natural language. Through these tools, AI assistants can retrieve model schemas, generate DAX queries, and execute queries to deliver insights from your data.

> [!IMPORTANT]
> - The remote Power BI MCP server is in preview. Tool definitions, request formats, and response schemas may change as we enhance capabilities.
> - The remote Power BI MCP server isn't a traditional REST API. Access it through MCP-compatible agents and frameworks rather than making direct HTTP calls. The server implements the [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest), which provides a standardized interface for AI agents to discover and invoke tools.

## Available tools

The MCP server provides the following tools for AI agents to invoke. For connection details, see [Get started with the remote Power BI MCP server](remote-mcp-server-get-started.md).

### Execute Query

Executes a DAX query against a semantic model and returns the results to the AI agent.

**Required inputs:**
- Semantic model ID
- DAX query expression

**Permissions:**
- Users must have at least [Build permissions](/power-bi/connect-data/service-datasets-build-permissions) on the semantic model
- Queries execute in the context of the authenticated user

**Security considerations:**
- [Row-level security (RLS)](/fabric/security/service-admin-row-level-security) is enforced for user authentication
- RLS is currently not supported when using Service Principal authentication

**See also:** [Execute Queries REST API](/rest/api/power-bi/datasets/execute-queries)

### Get Semantic Model Schema

Retrieves comprehensive metadata for a Power BI semantic model, including tables, columns, measures, relationships, and any AI-optimized metadata that the model author configured. Use this tool to ground DAX query generation in the structure of the model and to surface author-provided guidance that improves query accuracy.

**Required input:** Semantic model ID

**What's included:**

- Tables, columns, measures, and relationships
- Data types and hierarchies
- [Copilot tooling metadata](/power-bi/create-reports/copilot-prepare-data-ai-data-schema), when configured, which provides more context about your model, help guide Copilot to the right data in the model, and help increase the quality of Copilot output.

### Get Report Metadata

Retrieves the high-level schema of a Power BI report, including workspace information, semantic model details, pages, visual information, and filters. Reports reveal how the semantic model is used in practice and can clarify the intended context, relationships, and filtering logic that should guide DAX query generation. Use this tool to ground DAX query generation in the structure of the model schema used in the report and to surface author-provided guidance that improves query accuracy.

**Required input:** Report ID

**What's included:**

- Pages in the report, regardless of hidden state
- Visuals with valid model schema references, including charts, tables, matrices, slicers, and cards. Non-data visuals such as action buttons, shapes, images, and rectangles are excluded.
- Hidden columns and measures when they're referenced in visuals
- Visual bindings that map fields to visual roles such as Category, Values, Legend, and Tooltips
- Textbox content from each page

**Limits:**

- Requests fail when the report metadata exceeds the maximum supported size.

### Generate Query

Generates optimized DAX queries from natural language prompts using Copilot in Power BI. The tool uses the same DAX generation engine as Copilot for Power BI to create queries that follow best practices.

**Required inputs:**
- Semantic model ID
- Natural language question or prompt
- Relevant schema context as determined by the agent (tables, columns, measures)

**Requirements:**
- [Copilot license](/power-bi/create-reports/copilot-enable-power-bi) for the user or organization

> [!NOTE]
> If you prefer not to consume Copilot capacity, disable this tool in your MCP client configuration and rely on your client's LLM to generate DAX directly.


## Best practices

### Store semantic model IDs for reuse

Each tool requires a semantic model ID. Rather than asking users to provide the ID in every chat session, store frequently used model IDs where your agent can access them. For example:

- **VS Code:** Create a `semantic-model-ids.json` file in your workspace
- **Custom agents:** Store IDs in environment variables or configuration files
- **Multi-model scenarios:** Maintain a catalog mapping friendly names to model IDs


## Find your semantic model ID

To get a semantic model ID from the Power BI service:

1. Sign in to [Power BI](https://app.powerbi.com)
2. Navigate to the workspace containing your semantic model
3. Select the semantic model to open its details page
4. Copy the semantic model ID from the URL

Semantic model URLs follow this format:

```
https://app.powerbi.com/groups/{workspaceId}/datasets/{semanticModelId}
```

You can also retrieve semantic model IDs programmatically using the [Power BI REST API](/rest/api/power-bi/datasets/get-datasets-in-group).


## Limitations and considerations

### Authentication and security

- **Row-level security (RLS):** Currently not enforced when using Service Principal authentication. When a service principal executes queries, it has access to all data the principal is authorized to access. Carefully review security implications before exposing service principal-authenticated agents to end users.
- **Tenant settings:** Administrators must enable "Users can use the Power BI Model Context Protocol server endpoint (preview)" for your organization.

### Query generation

- **Complex DAX:** Highly complex calculations or nested logic may not translate perfectly from natural language prompts.
- **Model optimization:** Query generation quality improves significantly when you [prepare your data for AI](/power-bi/create-reports/copilot-prepare-data-ai).

### Performance

- **Model design impact:** Query execution performance depends on semantic model design, size, and optimization.
- **Large schemas:** Models with hundreds of tables or thousands of columns may result in large schema payloads.
- **Query complexity:** Complex DAX queries may take longer to generate and execute.

### Context and conversation

- **Context window limits:** There are limits to how much context can be maintained across conversation turns, depending on the AI model used by your MCP client.
- **Stateless queries:** Each query executes independently. The server doesn't maintain query state between requests.

## Related content

- [What are the Power BI MCP servers?](mcp-servers-overview.md)
- [Get started with the remote Power BI MCP server](remote-mcp-server-get-started.md)
- [Prepare your data for AI](/power-bi/create-reports/copilot-prepare-data-ai)
- [Power BI REST APIs](/rest/api/power-bi/)
- [DAX reference](/dax/)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)
