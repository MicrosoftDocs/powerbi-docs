---
title: What are the Power BI MCP servers?
description: Learn about the Power BI Model Context Protocol (MCP) servers and how they enable AI assistants to interact with Power BI.
author: sgodderidge
ms.author: sgodderidge
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: overview
ms.date: 11/19/2025
#customer intent: As a developer, I want to understand what the Power BI MCP servers are so that I can determine if they're suitable for my use cases.
---

# Overview of the Power BI MCP servers (Preview)
> [!IMPORTANT]
> This feature is in preview.

The Power BI MCP servers enable AI agents to interact with Power BI through natural language. Both the Modeling MCP server and the Remote MCP server implement the [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro), each exposing specialized tools for different scenarios:

- **Modeling MCP server:** Build and modify semantic models programmatically
- **Remote MCP server:** Query data and generate insights from existing models

Choose the Modeling server for development and model management workflows, or the Remote server for data analysis and insights scenarios. 

## Power BI Modeling MCP server

The Modeling MCP server runs locally and provides AI agents with comprehensive semantic modeling capabilities. It enables developers and AI applications to interact with Power BI models through natural language, from simple property updates to complex agentic development workflows.

### Key capabilities

- **Natural language model editing** - Create, update, and manage tables, columns, measures, and relationships across Power BI Desktop and Fabric semantic models using conversational commands
- **Bulk operations at scale** - Execute batch operations on hundreds of objects simultaneously with transaction support and error handling
- **Best practice application** - Evaluate and implement modeling best practices easily
- **Agentic development workflows** - Work with TMDL and Power BI Project files, enabling AI agents to autonomously plan and execute complex modeling tasks
- **DAX query validation** - Execute and validate DAX queries to test measures, troubleshoot calculations, and explore data

**Get started:** [Power BI Modeling MCP server on GitHub](https://github.com/microsoft/powerbi-modeling-mcp)

## Remote Power BI MCP server

The remote Power BI MCP server is a hosted endpoint that enables AI agents to query Power BI semantic models. It generates and executes DAX queries using Copilot's intelligence, enabling natural language conversations with your data.  

### Key capabilities:

- **Custom agent development** - Build agents that answer user questions by querying semantic models
- **Schema-aware querying** - Agents automatically learn model structure to generate accurate queries
- **Copilot-powered DAX generation** - Leverage the same query generation engine used in Copilot for Power BI
- **Flexible LLM integration** - Use any LLM provider supported by your MCP client 

### Common scenarios

The Remote MCP server is ideal for enhancing personal AI assistants like GitHub Copilot in VS Code. The server uses the authenticated user's permissions to execute queries, ensuring proper security and data access controls.

**Example use cases:**
- Ask GitHub Copilot about last quarter's sales trends from your semantic model
- Generate ad-hoc analyses through conversational queries
- Explore data relationships and patterns using natural language

**Get started:** [Set up the Remote MCP server](remote-mcp-server-getting-started.md)

## About the Model Context Protocol

The Model Context Protocol (MCP) is an open standard that defines how AI assistants interact with external tools and data sources in a structured, secure way.

**MCP architecture components:**

- **Host** - Applications that run MCP clients (for example, VS Code)
- **Client** - Components within a host that connect to MCP servers and consume their capabilities (for example, GitHub Copilot)
- **Server** - Local or remote programs that expose tools, resources, and prompts to clients

For example, when you use GitHub Copilot in VS Code with a Power BI MCP server, VS Code is the host, Copilot is the client, and Power BI provides the server.

**Learn more:** [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)  

## Considerations
MCP as a phenomenon is very novel and cutting-edge. As with all new technology standards, consider doing a security review to ensure any systems that integrate with MCP servers follow all regulations and standards your system is expected to adhere to. This includes not only the Power BI MCP servers, but any MCP client/agent that you choose to implement down to the model provider.

You should follow Microsoft security guidance for MCP servers, including enabling Entra ID authentication, secure token management, and network isolation. Refer to [Microsoft Security Documentation](https://learn.microsoft.com/en-us/azure/api-management/secure-mcp-servers) for details.

## Next steps

Choose your path based on your scenario:

> [!div class="nextstepaction"]
> [Get started with the Remote MCP server](remote-mcp-server-getting-started.md)

> [!div class="nextstepaction"]
> [Get started with the Modeling MCP server](https://github.com/microsoft/powerbi-modeling-mcp)


## Related content

- [Remote Power BI MCP server tools](remote-mcp-server-tools.md)
- [Power BI REST APIs](/rest/api/power-bi/)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)
- [Power BI Embedded analytics](/power-bi/developer/embedded/)
