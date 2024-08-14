---
title: Troubleshoot custom visuals in Power BI Desktop for Power BI Report Server
description: This article discusses resources available to troubleshoot issues with custom visuals in Power BI Desktop for Power BI Report Server.
author: jeroenterheerdt
ms.author: jterh
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: powerbi-report-server
ms.topic: troubleshooting
ms.date: 9/2/2021
---
# Troubleshoot custom visuals in Power BI Desktop for Power BI Report Server

In some specific situations, Power BI Desktop for Power Report Server fails to load a custom visual. After loading a custom visual from a local file the visual keeps loading but does not show up:

:::image type="content" source="media/custom-visuals-troubleshoot/import-a-visual.png" alt-text="Select Import a visual.":::


:::image type="content" source="media/custom-visuals-troubleshoot/custom-visuals-does-not-load.png" alt-text="Custom visual does not load.":::

This happens in one of the following scenarios:

- When the computer that has Power BI Desktop for Power BI Report Server isn't connected to the internet.
- When the Power BI Desktop for Power BI Report Server computer’s network device blocks access to `pbivisuals.powerbi.com`.

In order to resolve this situation follow the steps below.

## Loading custom visuals

Use one of the following solutions to get the custom visual to load in Power BI Desktop for Power BI Report Server:

- Ensure that the Power BI Desktop for Power BI Report Server computer is connected to the internet.

- If the computer is connected to the internet but you still encounter the behavior, check to see if the URL `https://pbivisuals.powerbi.com/` has been blocked. If so, add the URL to an allowlist to get the visual to load.

- If the computer isn't allowed internet access, perform these steps:

    1. Configure the Environment variable under “Advanced System settings” as shown below:

        :::image type="content" source="media/custom-visuals-troubleshoot/setting-environment-variable-1.png" alt-text="Open Environment Variables settings.":::

    1. Add `PBI_userFavoriteResourcePackagesEnabled` to environment variables and set it to `0`.

        :::image type="content" source="media/custom-visuals-troubleshoot/setting-environment-variable-2.png" alt-text="Set PBI_userFavoriteResourcePackagesEnabled to 0.":::

    1. After making this change, restart Power BI Desktop for Power BI Report Server, and try loading a custom visual.

## Why this happens

When importing the local copy of the visual, Power BI Desktop for Power BI Report Server tries to connect to the internet and load the updated visual, which results in this behavior. Specifically, Power BI Desktop for Power BI Report Server needs to connect to `https://pbivisuals.powerbi.com:443` to get the latest copy of the visuals but fails with the following error:

```
DNS Lookup for "pbivisuals.powerbi.com" failed. The system reports that no network connection is available. 
System.Net.Sockets.SocketException No such host is known.
```

To get around the issue, use one of the solutions mentioned in this article.

>[!NOTE]
>After implementing the solution of configuring the environment variable (the third solution), you might still encounter a few seconds delay before the visual loads in Power BI Desktop for Power BI Report Server. You encounter this delay because Power BI Desktop for Power BI Report Server tries to fetch the updated copy of the visual from the internet. After a retry period, it displays the local copy of the custom visual after failing to connect to internet. This could result in a 20 to 30 second delay.

## SQL Server certificate isn't trusted on the client

When establishing a connection to an on-premises SQL Server using Power BI Desktop or Power BI Report Server and the SQL Server utilizes a self-signed certificate, it's possible that the refresh operation for a Fabric semantic model or dataflow can fail with the following error message:

```Microsoft SQL: A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - The certificate chain was issued by an authority that is not trusted.)```

To troubleshoot this error when using on-premises data gateway, change the gateway configurations to update the `SqlTrustedServers` setting using the following steps:

1. On the local machine where the on-premises data gateway is installed, navigate to **C:\Program Files\On-premises data gateway**.
2. Make a backup of the configuration file named **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config**.
3. Open the original **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config** configuration file and locate the `SqlTrustedServers` entry.
4. Update the `SqlTrustedServers` value with the names of the SQL servers to trust and connect to.

   The value contains a comma-delimited list of server names and supports **\*** as a wild card. So for instance in the following example:

   `<setting name="SqlTrustedServers" serializeAs="String"> <value>contososql*,mysvr</value> </setting>`

   the value `contososql*,mysvr` matches `contososql6`, `contososqlazure`, and `mysvr`, but doesn't match `mysvr.microsoft.com`.

To troubleshoot this error when using Power BI Desktop, modify the value of the environment variable `PBI_SQL_TRUSTED_SERVERS` to include the SQL Servers. The supported values are the same as outlined for gateway configuration (as described in step 4 above).

For connections to SQL Server from Power BI Desktop and on-premises data gateway versions starting with February 2024 or later, follow one of these options:
- Follow the solution mentioned previously to add the environment variable `PBI_SQL_TRUSTED_SERVERS`.
- Ask your SQL administrators to acquire a certificate from a well-known certificate authority.
- Change the setting `SqlTrustedServers` on the gateway config file. 

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
