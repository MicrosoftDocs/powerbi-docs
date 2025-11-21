---
title: Get started with the remote Power BI MCP server
description: Learn how to set up and configure the remote Power BI MCP server to enable AI agents to query Power BI semantic models.
author: sgodderidge
ms.author: sgodderidge
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: get-started
ms.date: 11/19/2025
#customer intent: As a developer, I want to set up the remote Power BI MCP server so that I can enable AI agents to query my Power BI semantic models using natural language.
---

# Get started with the remote Power BI MCP server (preview)

The remote Power BI MCP server enables AI agents to query Power BI semantic models using natural language. Through the Model Context Protocol (MCP), AI assistants can retrieve model schemas, generate DAX queries, and execute queries to deliver insights from your data.

This article shows you how to:

- Connect to the remote Power BI MCP server in Visual Studio Code
- Connect GitHub Copilot to your Power BI semantic models
- Validate the connection with test queries

> [!NOTE]
> Not all MCP clients support remote endpoints. Verify that your MCP client supports HTTP-based MCP servers before proceeding.

> [!TIP]
> **Advanced scenario:** For custom agents using Service Principal authentication, see:
> - [Azure AI Foundry MCP tools](/azure/ai-foundry/agents/how-to/tools/model-context-protocol)
> - [Power BI service principal setup](/power-bi/developer/embedded/embed-service-principal?tabs=azure-portal#step-3---enable-the-power-bi-service-admin-settings)


## Prerequisites

Before you begin, ensure you have:

- **Administrator approval** - Your Power BI admin must enable the tenant setting: "Users can use the Power BI Model Context Protocol server endpoint (preview)"
- **Visual Studio Code** - [Download VS Code](https://code.visualstudio.com/download)
- **GitHub Copilot** - [Enable GitHub Copilot in VS Code](https://code.visualstudio.com/docs/copilot/overview)
- **Semantic model access** - Build permissions on at least one Power BI semantic model
- (Recommended) **Optimized models** - [Prepare your semantic models for AI](/power-bi/create-reports/copilot-prepare-data-ai) to improve query generation quality
 

## Set up the remote Power BI MCP server in VS Code

The remote Power BI MCP server is available at:

```
https://api.fabric.microsoft.com/v1/mcp/powerbi
```

### Quick installation (recommended)

The easiest way to configure the server is using the one-click installer:

> [!div class="button"]
> [Install Power BI MCP server](https://vscode.dev/redirect/mcp/install?name=powerbi-remote&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fapi.fabric.microsoft.com%2Fv1%2Fmcp%2Fpowerbi%22%7D)

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
   1. Get your semantic model ID from the Power BI service (see [Find your semantic model ID](remote-mcp-server-tools.md#find-your-semantic-model-id))
   2. Share the ID with Copilot in your conversation

4. **Ask a question**
   - Example: "What tables are in this semantic model?"
   - Example: "Show me the top 10 products by sales"

5. **Authorize the tool**
   1. When prompted, allow Copilot to use the MCP server tool
   2. Authenticate with your Microsoft credentials if requested

6. **Review the response**
   1. Copilot will query your model and return results

> [!TIP]
> For best query results, [prepare your semantic models for AI](/power-bi/create-reports/copilot-prepare-data-ai) by adding AI instructions and verified answers.

**Troubleshooting:** [Manage MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers#_manage-installed-mcp-servers)


## Next steps

Now that your MCP server is configured, explore the available tools and capabilities:

> [!div class="nextstepaction"]
> [Remote Power BI MCP server tools](remote-mcp-server-tools.md)

## Related content

- [What are the Power BI MCP servers?](mcp-servers-overview.md)
- [Remote Power BI MCP server tools](remote-mcp-server-tools.md)
- [Power BI Modeling MCP server on GitHub](https://github.com/microsoft/powerbi-modeling-mcp)
- [Prepare your data for AI](/power-bi/create-reports/copilot-prepare-data-ai)
- [MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers)

