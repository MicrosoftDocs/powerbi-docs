---
title: Register the remote Power BI MCP server with external MCP clients
description: Learn how to register the remote Power BI MCP server with external MCP clients such as Claude Desktop or ChatGPT by creating a Microsoft Entra app.
author: billmath
ms.author: billmath
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 04/24/2026
#customer intent: As a developer, I want to register the remote Power BI MCP server in MCP clients such as Claude Desktop or ChatGPT so that I can query Power BI semantic models from those clients.
---

# Register the remote Power BI MCP server with external MCP clients (preview)

The remote Power BI MCP server works out of the box with MCP clients that ship with a preregistered Microsoft Entra application, such as Visual Studio Code and the GitHub Copilot CLI. Other MCP clients - such as [Claude Desktop](https://claude.ai/download), and [ChatGPT](https://chatgpt.com/) require registration of an OAuth Client ID. Microsoft Entra ID doesn't currently support client registration, so these clients can't automatically obtain a client ID for the Power BI MCP server.

To work around this, you register a Microsoft Entra app yourself and provide its application (client) ID to the MCP client as the OAuth client ID.

This article shows you how to:

- Create and configure a Microsoft Entra app registration for an external MCP client
- Register the remote Power BI MCP server in the external client using the Entra app ID

## Prerequisites

Before you begin, ensure you have:

- **Administrator approval** - Your Power BI admin must enable the tenant setting: **Users can use the Power BI Model Context Protocol server endpoint (preview)**.
- **Permissions to register an app** - You can either register apps in your Microsoft Entra tenant, or work with a tenant administrator who can register the app for you.

## Step 1: Create a Microsoft Entra app registration

Create a new app registration in the same Microsoft Entra tenant that hosts your Power BI environment.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com) as a user who can register applications.
1. Go to **App registrations**, and then select **New registration**.
1. Enter a meaningful name, for example `Power BI MCP - Claude Desktop`.
1. Under **Supported account types**, select **Accounts in this organizational directory only (Single tenant)**.
1. Leave **Redirect URI** empty for now. You configure it in the next step.
1. Select **Register**.
1. On the app's **Overview** page, copy the **Application (client) ID**. You use it later when you configure the MCP client.

## Step 2: Configure the redirect URI

External MCP clients act as public clients, so you must add a redirect URI of type **Public client/native (mobile & desktop)**.

1. In your app registration, select **Authentication** > **Add Redirect URI** > **Mobile and desktop applications**.
1. Add the redirect URI provided by your MCP client. For example:

    | MCP client     | Redirect URI                                         |
    | -------------- | ---------------------------------------------------- |
    | Claude Desktop | `https://claude.ai/api/mcp/auth_callback`            |
    | ChatGPT        | `https://chatgpt.com/connector/oauth/<random_chars>` |
    | Other clients  | Use the OAuth callback URL documented by the client  |

2. Select **Configure** to save the platform configuration.
3. On the **Authentication** page, under **Advanced settings**, confirm that **Allow public client flows** is set to **No** unless your client documentation explicitly requires it.
4. Select **Save**.

> [!IMPORTANT]
> Always use the exact redirect URI documented by your MCP client. A mismatch causes the OAuth sign-in to fail.

## Step 3: Add delegated Power BI API permissions

The remote Power BI MCP server calls the Power BI REST APIs on behalf of the signed-in user. Grant the following delegated permissions on the **Power BI Service** API.

1. In your app registration, select **API permissions** > **Add a permission**.
2. Select **Power BI Service** in **Microsoft APIs**.
3. Select **Delegated permissions**, and then add the following permissions:

    Resource URI: `https://analysis.windows.net/powerbi/api`

    | Scope                 | Description                                                                     |
    | --------------------- | ------------------------------------------------------------------------------- |
    | `Dataset.Read.All`    | Read all semantic models the user can access.                                   |
    | `MLModel.Execute.All` | Allows executing ML models.|
    | `Workspace.Read.All`  | Read the workspaces the user can access.                                        |

4. Select **Add permissions**.
5. (Optional) If your tenant requires admin consent for these permissions, select **Grant admin consent**. Otherwise, users are prompted to consent the first time they sign in from the MCP client.

## Step 4: Register the remote Power BI MCP server in the MCP client

Use the **Application (client) ID** from step 1 as the OAuth client ID when you add the remote Power BI MCP server to your client. The exact configuration steps depend on the client.

If sign-in fails, verify that:

- The redirect URI in your Entra app exactly matches the one expected by the client.
- The required delegated Power BI permissions are granted (and admin-consented if required by your tenant).
- The tenant setting "Users can use the Power BI Model Context Protocol server endpoint (preview)" is enabled.

### Claude Desktop

1. Open Claude Desktop, and then go to **Settings** > **Connectors** > **Add custom connector**.
1. Enter the following values:

    - **Name**: `Power BI`
    - **Remote MCP server URL**: `https://api.fabric.microsoft.com/v1/mcp/powerbi`
    - **OAuth Client ID**: the **Application (client) ID** from step 1.

1. Save the connector. Claude Desktop opens a browser window so that you can sign in with your Microsoft Entra account and consent to the requested Power BI permissions.

### ChatGPT

1. In ChatGPT, go to **Settings** > **Apps** > **Create App**.
1. Fill in the **New App** dialog:

    - **Name**: `Power BI`
    - **MCP Server URL**: `https://api.fabric.microsoft.com/v1/mcp/powerbi`
    - **Authentication**: Select **OAuth**.

1. Expand **Advanced settings** to review the discovered OAuth settings, and then configure:

    - **Registration method**: Select **User-Defined OAuth Client**.
    - **OAuth Client ID**: Enter the **Application (client) ID** from step 1.    

2. Select **Create**. ChatGPT prompts you to sign in with your Microsoft Entra account and consent to the requested Power BI permissions.

### Other MCP clients

For other MCP clients, follow the client's documentation to add a remote MCP server. 

## Test your connection

After you register the server in the client, validate the setup:

1. Start a new conversation in your MCP client.
2. Ask a question that requires the Power BI MCP server, for example: "What tables are in semantic model [ID of the semantic model]?".
4. Confirm that the client returns results from your Power BI semantic model.

## Related content

- [Get started with the remote Power BI MCP server](remote-mcp-server-get-started.md)
- [Register an application with the Microsoft identity platform](/entra/identity-platform/quickstart-register-app)
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification/latest)
