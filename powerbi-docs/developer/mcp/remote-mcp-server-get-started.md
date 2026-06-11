---
title: Get started with the remote Power BI MCP server
description: Learn how to set up and configure the remote Power BI MCP server to enable AI agents to query Power BI semantic models.
author: billmath
ms.author: billmath
ms.reviewer: sgodderidge
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: get-started
ms.date: 11/19/2025
ms.collection: ce-skilling-ai-copilot
ms.update-cycle: 180-days
#customer intent: As a developer, I want to set up the remote Power BI MCP server so that I can enable AI agents to query my Power BI semantic models using natural language.
---

# Get started with remote Power BI MCP server (preview)

> [!IMPORTANT]
> This feature is in preview.

The remote Power BI MCP server is a remote-hosted endpoint that enables AI agents to chat with data in Power BI semantic models using natural language. Built on the Model Context Protocol (MCP), it translates your prompts into Power BI operations - generating DAX queries and executing them while respecting your permissions and security policies.

> [!IMPORTANT]
> - The remote Power BI MCP server is in preview. Tool definitions, request formats, and response schemas may change as we enhance capabilities.
> - The remote Power BI MCP server isn't a traditional REST API. Access it through MCP-compatible agents and frameworks rather than making direct HTTP calls. The server implements the [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest), which provides a standardized interface for AI agents to discover and invoke tools.

This article shows you how to:

- Connect to the remote Power BI MCP server in Visual Studio Code
- Connect GitHub Copilot to your Power BI semantic models
- Validate the connection with test queries

## Prerequisites

Before you begin, ensure you have:

- **Administrator approval** - Your Power BI admin must enable the tenant setting: "Users can use the Power BI Model Context Protocol server endpoint (preview)"
- **Visual Studio Code** - [Download VS Code](https://code.visualstudio.com/download)
- **GitHub Copilot** - [Enable GitHub Copilot in VS Code](https://code.visualstudio.com/docs/copilot/overview)
- **Semantic model access** - Build permissions on at least one Power BI semantic model
- (Recommended) **Optimized models** - [Prepare your semantic models for AI](/power-bi/create-reports/copilot-prepare-data-ai) to improve query generation quality
 

## Set up in VS Code

The remote Power BI MCP server is available at:

```
https://api.fabric.microsoft.com/v1/mcp/powerbi
```

### Quick installation (recommended)

The easiest way to configure the server is using the one-click installer:

> [!div class="button"]
> [Install Power BI MCP server (remote)](https://vscode.dev/redirect/mcp/install?name=powerbi-remote&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fapi.fabric.microsoft.com%2Fv1%2Fmcp%2Fpowerbi%22%7D)

This automatically configures the MCP server in your VS Code settings.

### Manual installation

To manually configure the server, add the following to your MCP configuration file:

```json
{
    "servers": {
        "powerbi-remote": {
            "type": "http",
            "url": "https://api.fabric.microsoft.com/v1/mcp/powerbi"
        }
    }
}
```

**Learn more:** [MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)

## Test your connection

Once configured, verify the setup is working:

1. **Start the MCP server** in VS Code
   - Open the MCP servers panel
   - Ensure the Power BI MCP server shows as connected

2. **Open GitHub Copilot**
   1. Launch the chat window in VS Code
   2. Enable agent mode

3. **Provide your semantic model ID**
   1. Get your semantic model ID from the Power BI service (see [Find your semantic model ID](#find-your-semantic-model-id))
   2. Share the ID with Copilot in your conversation

4. **Ask a question**
   - Example: "What tables are in this semantic model?"
   - Example: "Show me the top 10 products by sales"

5. **Authorize the tool**
   1. When prompted, allow Copilot to use the MCP server tool
   2. Authenticate with your Microsoft credentials if requested

6. **Review the response**
   - Copilot will query your model and return results

> [!TIP]
> For best query results, [prepare your semantic models for AI](/power-bi/create-reports/copilot-prepare-data-ai) by adding AI instructions and verified answers.

**Troubleshooting:** [Manage MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers#_manage-installed-mcp-servers)

## Available tools

The MCP server provides the following tools for AI agents to invoke. 

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

> [!TIP]
> - Store frequently used model IDs where your agent can access them like a `semantic-model-ids.json` local file or agent instruction files.
> - You can also retrieve semantic model IDs programmatically using the [Power BI REST API](/rest/api/power-bi/datasets/get-datasets-in-group).


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
- [Power BI Modeling MCP server on GitHub](https://github.com/microsoft/powerbi-modeling-mcp)
- [Prepare your data for AI](/power-bi/create-reports/copilot-prepare-data-ai)
- [MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)
- [Power BI REST APIs](/rest/api/power-bi/)
- [DAX reference](/dax/)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)
  

