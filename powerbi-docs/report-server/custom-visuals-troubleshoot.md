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

This article discusses resources available to troubleshoot issues with custom visuals in Power BI Desktop for Power BI Report Server.

## The issue

In Power BI desktop for Power BI Report Server, you try to add a custom visual from a local file:

:::image type="content" source="media/custom-visuals-troubleshoot/import-a-visual.png" alt-text="Select Import a visual.":::

The visual keeps loading, but doesn’t show up:

:::image type="content" source="media/custom-visuals-troubleshoot/custom-visuals-does-not-load.png" alt-text="Custom visual does not load.":::

You encounter this behavior in one of the following scenarios:

- When the computer that has Power BI Desktop for Power BI Report Server isn't connected to the internet.
- When the Power BI Desktop for Power BI Report Server computer’s network device blocks access to `pbivisuals.powerbi.com`.

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

## Why this issue happens

When importing the local copy of the visual, Power BI Desktop for Power BI Report Server tries to connect to the internet and load the updated visual, which results in this behavior. Specifically, Power BI Desktop for Power BI Report Server needs to connect to `https://pbivisuals.powerbi.com:443` to get the latest copy of the visuals but fails with the following error:

```
DNS Lookup for "pbivisuals.powerbi.com" failed. The system reports that no network connection is available. 
System.Net.Sockets.SocketException No such host is known.
```

To get around the issue, use one of the solutions mentioned in this article.

>[!NOTE]
>After implementing the solution of configuring the environment variable (the third solution), you might still encounter a few seconds delay before the visual loads in Power BI Desktop for Power BI Report Server. You encounter this delay because Power BI Desktop for Power BI Report Server tries to fetch the updated copy of the visual from the internet. After a retry period, it displays the local copy of the custom visual after failing to connect to internet. This could result in a 20 to 30 second delay.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
