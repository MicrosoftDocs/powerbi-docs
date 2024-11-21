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

In some specific situations, Power BI Desktop for Power Report Server fails to load a custom visual. When you try to load a custom visual from a local file by selecting **Import a visual from a file**, the visual keeps loading but doesn't show up.

:::image type="content" source="media/custom-visuals-troubleshoot/import-a-visual.png" alt-text="Screenshot that shows the option for importing a visual from a file.":::

:::image type="content" source="media/custom-visuals-troubleshoot/custom-visuals-does-not-load.png" alt-text="Screenshot of the indicator that shows the loading status of a custom visual.":::

This problem happens in one of the following scenarios:

- The computer that has Power BI Desktop for Power BI Report Server isn't connected to the internet.
- The network device for the computer that has Power BI Desktop for Power BI Report Server blocks access to `pbivisuals.powerbi.com`.

To resolve this situation, follow the steps in this article.

## Why this problem happens

When you import the local copy of the visual, Power BI Desktop for Power BI Report Server tries to connect to the internet and load the updated visual. Specifically, Power BI Desktop for Power BI Report Server needs to connect to `https://pbivisuals.powerbi.com:443` to get the latest copy of the visual. But it fails with the following error:

```
DNS Lookup for "pbivisuals.powerbi.com" failed. The system reports that no network connection is available. 
System.Net.Sockets.SocketException No such host is known.
```

## Solutions for loading custom visuals

Use one of the following solutions to get the custom visual to load in Power BI Desktop for Power BI Report Server:

- Ensure that the computer that has Power BI Desktop for Power BI Report Server is connected to the internet.

- If the computer is connected to the internet but you still encounter the behavior, check whether the URL `https://pbivisuals.powerbi.com/` is blocked. If so, add the URL to an allowlist.

- If the computer isn't allowed internet access, perform these steps:

  1. In **System Properties**, on the **Advanced** tab, select **Environment Variables**.

     :::image type="content" source="media/custom-visuals-troubleshoot/setting-environment-variable-1.png" alt-text="Screenshot that shows selections for opening settings for environment variables.":::

  1. For the variable name, enter **PBI_userFavoriteResourcePackagesEnabled**. For the value, enter **0**. Then select **OK**.

     :::image type="content" source="media/custom-visuals-troubleshoot/setting-environment-variable-2.png" alt-text="Screenshot that shows setting a name and a value for a new user variable.":::

  1. Restart Power BI Desktop for Power BI Report Server, and try loading a custom visual.

> [!NOTE]
> After you configure the environment variable in the third solution, you might still encounter a delay of 20 to 30 seconds before the visual loads in Power BI Desktop for Power BI Report Server. You encounter this delay because Power BI Desktop for Power BI Report Server tries to fetch the updated copy of the visual from the internet. After a period of retrying and failing to connect to the internet, it displays the local copy of the custom visual.

## Solutions for a SQL Server certificate that isn't trusted on the client

When you're establishing a connection to an on-premises SQL Server by using Power BI Desktop or Power BI Report Server, and the SQL Server instance uses a self-signed certificate, it's possible that the refresh operation for a Microsoft Fabric semantic model or dataflow can fail with the following error message:

```Microsoft SQL: A connection was successfully established with the server, but then an error occurred during the login process. (provider: SSL Provider, error: 0 - The certificate chain was issued by an authority that is not trusted.)```

To troubleshoot this error when you're using an on-premises data gateway, change the gateway configurations to update the `SqlTrustedServers` setting by using the following steps:

1. On the local machine where the on-premises data gateway is installed, go to **C:\Program Files\On-premises data gateway**.
2. Make a backup of the configuration file named **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config**.
3. Open the original **Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config** configuration file and locate the `SqlTrustedServers` entry.
4. Update the `SqlTrustedServers` value with the names of the SQL Server instances to trust and connect to.

   The value contains a comma-delimited list of server names and supports an asterisk (**\***) as a wildcard. Consider the following example:

   `<setting name="SqlTrustedServers" serializeAs="String"> <value>contososql*,mysvr</value> </setting>`

   The value `contososql*,mysvr` matches `contososql6`, `contososqlazure`, and `mysvr`, but doesn't match `mysvr.microsoft.com`.

To troubleshoot this error when you're using Power BI Desktop, modify the value of the environment variable `PBI_SQL_TRUSTED_SERVERS` to include the SQL Server instances. The supported values are the same as those outlined for gateway configuration in step 4 of the preceding procedure.

For connections to SQL Server from Power BI Desktop and on-premises data gateway versions starting with February 2024, use one of these options:

- Follow the solution mentioned previously to add the environment variable `PBI_SQL_TRUSTED_SERVERS`.
- Ask your SQL Server administrators to acquire a certificate from a well-known certificate authority.
- Change the setting `SqlTrustedServers` on the gateway configuration file.
