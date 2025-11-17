---
title: Connector Extensibility in Power BI
description: Learn about connector extensibility features, security settings, signing, and certification so you can safely use custom data connectors in Power BI. Get started.
author: kgremban
ms.author: kgremban
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: concept-article
ms.date: 09/25/2025
ai-usage: ai-assisted
LocalizationGroup: Connect to data
#customer intent: As a Power BI user, I want to learn about connector extensibility capabilities, features, security settings, and certification so that I can connect to custom data sources and utilize them in my Power BI reports and dashboards.
---

# Connector extensibility in Power BI

Custom connectors in Power BI extend connectivity so you can use data from hundreds of sources. This article covers connector extensibility capabilities, certified and uncertified connectors, security settings, and signing options to help you build, deploy, and use custom connectors safely in Power BI Desktop.

Power BI connects to data through existing connectors and generic sources like ODBC, OData, OLE DB, Web, CSV, XML, and JSON. Developers add new sources with custom data extensions called *custom connectors*. Microsoft certifies and distributes some as *certified connectors*.

> [!TIP]
> Planning to build a connector? Start with the **Power Query SDK for Visual Studio Code**. Enhancements target this SDK, not the legacy Visual Studio extension.

## Develop custom connectors (Power Query SDK)

Use the Power Query SDK in Visual Studio Code to author, validate, and package custom connectors:

- Install from the Visual Studio Marketplace: [Power Query SDK for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=PowerQuery.powerquery).
- Explore samples and advanced patterns in the GitHub repository: [microsoft/DataConnectors on GitHub](https://github.com/microsoft/DataConnectors).
- Use the SDK to:
  - Create and edit `.pq` and `.m` source files with syntax coloring and schema validation
  - Build a `.mez` package (compressed connector bundle)
  - Run test queries with the built-in query runner
  - Validate navigation tables, authentication flows, and data source kinds

> [!NOTE]
> The legacy Power Query SDK for Visual Studio is in maintenance mode. New features (improved schema validation, updated auth flows, enhanced diagnostics) ship first—or only—in the VS Code SDK.

To use an uncertified custom connector that you or someone else develop, adjust your Power BI Desktop security settings to let extensions load without validation or warning. These extensions can ignore privacy levels and handle credentials, and can send them over HTTP, so enable this setting only when you fully trust your custom connectors.

Alternatively, the developer signs the connector with a certificate and gives you the details you need to use it without changing your security settings. For more information, see [Trusted third-party connectors](desktop-trusted-third-party-connectors.md).

## Custom connectors

Uncertified custom connectors range from small, business-critical APIs to large, industry-specific services that don't yet have a Microsoft connector. Vendors distribute many connectors. If you need an industry- or business-specific connector, contact the vendor.

To use an uncertified custom connector:

1. Copy the connector file (*.pq*, *.pqx*, *.m*, or *.mez*) into your user Documents–scoped custom connectors folder:

   [Documents]\Microsoft Power BI Desktop\Custom Connectors

   If the folder doesn't exist, create it.

   > [!NOTE]
   > If your organization enables OneDrive sync or Known Folder Move, the effective Documents path might be redirected. For example:
   > C:\Users\<user>\OneDrive - Fabrikam\Documents
   > Don’t assume %USERPROFILE%\Documents. To reliably locate the correct folder in PowerShell:
   >
   > ```powershell
   > [Environment]::GetFolderPath('MyDocuments')
   > Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Microsoft Power BI Desktop\Custom Connectors'
   > ```
   >
   > Place the connector files there, then restart Power BI Desktop.

1. In Power BI Desktop, go to **File** > **Options and settings** > **Options** > **Security** to adjust the data extension security settings.
1. Under **Data Extensions**, select **(Not Recommended) Allow any extension to load without validation or warning**.
1. Select **OK**, then restart Power BI Desktop.

:::image type="content" source="media/desktop-connector-extensibility/data-extension-security-1.png" alt-text="Screenshot of Data Extension Security options showing the setting to allow noncertified custom connectors.":::

The default Power BI Desktop data extension security setting is **(Recommended) Only allow Microsoft certified and other trusted third-party extensions to load**. With this setting, if uncertified custom connectors are on your system, the **Uncertified Connectors** dialog box appears at startup and lists the connectors that can't load.

:::image type="content" source="media/desktop-connector-extensibility/data-extension-security-2.png" alt-text="Screenshot of the Uncertified Connectors dialog box listing blocked custom connectors.":::

If you don't need these connectors in this session, select **OK** to dismiss the error.

Prevent the error by changing your **Data Extensions** security setting or removing the uncertified connectors from your *Custom Connectors* folder.

> [!IMPORTANT]
> Use only one custom connector data source in DirectQuery mode. Multiple custom connector data sources don't work with DirectQuery.

## Signing custom connectors

Signing a `.mez` package with a trusted code signing certificate lets users load the connector without enabling the "allow any extension" setting.

### High-level steps

1. Obtain a code-signing certificate (internal PKI or a public CA). Avoid deprecated test tools for pro1. Run the following `signtool.exe` command (Windows SDK) to sign the `.mez` file.

   ```powershell
   signtool sign /tr http://timestamp.sectigo.com /td SHA256 /fd SHA256 /a YourConnector.mez
   ```gntool sign /tr http://timestamp.sectigo.com /td SHA256 /fd SHA256 /a YourConnector.mez
   ```

1. Distribute the signed `.mez` to users by placing it in the Custom Connectors folder.
1. Renew certificates before they expire, and re-sign each updated build.

### Effect on load behavior

- A properly signed connector from a trusted publisher loads under the recommended security setting.
- Unsigned or self-signed connectors trigger the uncertified dialog unless the permissive setting is enabled.

For certificate trust requirements and edge cases (root store, intermediate chains, revocation), see [Trusted third-party connectors](desktop-trusted-third-party-connectors.md).

> [!NOTE]
> Timestamping (with `/tr`) preserves signature validity after the signing certificate expires.

## Certified connectors

Microsoft certifies a limited set of custom data extensions. Microsoft distributes these connectors but isn't responsible for their performance or continued functionality. The third-party developer maintains and supports the connector.

In Power BI Desktop, certified third-party connectors appear in the **Get Data** dialog box with generic and common connectors. You don't need to change security settings to use certified connectors.

## Troubleshooting custom connector issues

The following table lists common issues you may encounter when working with custom connectors and provides guidance for resolving them.

| Symptom | Likely cause | Resolution |
| ------- | ------------ | ---------- |
| Connector not listed in **Get Data** | File in wrong folder or blocked | Check the path with `[Environment]::GetFolderPath('MyDocuments')`. Open the file's properties: select the file, then select **Properties**. Select **Unblock** if it appears. Restart Power BI Desktop. |
| “Uncertified” dialog appears every launch | Unsigned connector with recommended security mode enabled | Sign the connector or switch Data Extensions to permissive mode (only if you trust the source). |
| Security prompt never appears | Already trusted (signed) or permissive mode enabled | Check the signature: open the file properties, then select the Digital Signatures tab. |
| Connector fails silently | M script error or authentication kind mismatch | Turn on tracing (File > Options > Diagnostics). Check the logs at `%LOCALAPPDATA%\Microsoft\Power BI Desktop\Traces`. |
| Load error after updating connector | Cached previous version | Restart Power BI Desktop. Clear the cache in **File > Options > Data Load** if needed. |
| DirectQuery connection fails with multiple custom sources | Unsupported scenario | Use only one custom connector with DirectQuery. Switch secondary sources to Import mode. |
| Credential dialog loops | Unsupported auth kind or incorrect `Authentication` section | Check the `AuthenticationKind` value. Compare it with samples in the SDK repo. |

> [!TIP]
> For more diagnostics, open the most recent Analysis Services temporary workspace folder at `%LOCALAPPDATA%\Microsoft\Power BI Desktop\AnalysisServicesWorkspaces\`. Check `DataMashupTrace` and connector-specific logs.

## Related content

- See [Power Query Connector Certification](/power-query/connectorcertification) to certify a custom connector.
