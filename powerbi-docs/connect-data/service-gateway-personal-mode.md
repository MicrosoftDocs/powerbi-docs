---
title: Use a Personal Gateway in Power BI
description: Learn when to use the Power BI on-premises data gateway (personal mode), how it differs from standard, and install it to securely refresh on-premises data.
author: kgremban
ms.author: kgremban
ms.reviewer: arthii
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 09/25/2025
LocalizationGroup: Gateways
ai-usage: ai-assisted
#customer intent: As a Power BI user, I want to understand how to use a personal gateway in Power BI so that I can easily and securely connect to on-premises data.
---

# Use a personal gateway in Power BI

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

The on-premises data gateway (personal mode) works only with Power BI. Install it on your computer to refresh import semantic models from on-premises data sources. This article shows when to use personal mode, how it differs from the standard gateway, and how to set up refresh securely.

> [!NOTE]
> Each Power BI user can run only one personal mode gateway. If the user installs another on a different computer, the most recent installation replaces the previous one.

## When to (and not to) use personal mode

Use personal mode when:

- You’re an individual author refreshing a few Import semantic models.
- You don’t need to share data sources or manage centralized credentials.

Use the standard on-premises data gateway instead when:

- Multiple authors or admins manage data sources and credentials.
- You need DirectQuery, live connection, composite models, or virtual network gateway scenarios.
- You need high availability, clustering, or load balancing.
- You need centralized auditing and governance.

<a id="on-premises-data-gateway-vs-on-premises-data-gateway-personal-mode"></a>

## On-premises data gateway versus personal mode

This table shows the differences between the standard gateway and the personal mode gateway.

|   | On-premises data gateway | On-premises data gateway (personal mode) |
| ---- | ---- | ---- |
| **Supports cloud services** | Power BI, Power Apps, Power Automate, Azure Logic Apps, Azure Analysis Services, Power BI dataflows | Power BI only |
| **Runs under credentials** | As configured by authorized gateway users | Your Windows credentials (interactive sign-in) or per data source credentials you set |
| **Install only as a local admin** | Yes | No |
| **Centralized gateway and data source management** | Yes | No |
| **Import data and schedule refresh** | Yes | Yes |
| **DirectQuery support** | Yes | No |
| **Live connection to Analysis Services** | Yes | No |

> [!NOTE]
> Personal mode supports only Import semantic models that use scheduled or on-demand refresh. It doesn’t support DirectQuery, live connection to Analysis Services, composite models, multiple custom connector sources in DirectQuery, virtual network data gateway, clustering, or high availability.

## Install the on-premises data gateway (personal mode)

Use these steps to install the on-premises data gateway (personal mode).

1. [Download the on-premises data gateway](https://go.microsoft.com/fwlink/?LinkId=820925&clcid=0x409).
1. Open the installer and select **Next**.
1. Select **On-premises data gateway (personal mode)**, then select **Next**.

   :::image type="content" source="media/service-gateway-personal-mode/personal-gateway-select.png" alt-text="Screenshot of selecting the on-premises data gateway personal mode option in the installer.":::

1. On the next screen, review requirements, check or change the installation path, accept the terms, and select **Install**.
1. Enter your email address in **Email address to use with this gateway**, and select **Sign in**.
1. After you sign in, select **Close** on the confirmation screen.

## Use Fast Combine with the personal gateway

> [!IMPORTANT]
> Enabling Fast Combine disables privacy level isolation for combined queries, so enable it only if all sources are trusted.

Fast Combine lets you ignore privacy levels when you run queries. Enable Fast Combine:

1. Open *%LOCALAPPDATA%\Microsoft\On-premises data gateway (personal mode)\Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*.
1. Before `</Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.GatewayCoreSettings>`, add the following:

   ```xml
   <setting name="EnableFastCombine" serializeAs="String">
     <value>true</value>
   </setting>
   ```

1. Wait about a minute, then run an on-demand refresh in the Power BI service to confirm.

## Frequently asked questions

- **Question:** Can you run the on-premises data gateway (personal mode) side by side with the standard gateway (previously called Enterprise gateway)?  
  
  **Answer:** Yes.

- **Question:** Can personal mode run as a Windows service?  
  
  **Answer:** No. It's only an interactive application. Use the standard gateway for service mode.

- **Question:** How often does personal mode update?  
  **Answer:** Monthly.

- **Question:** Why are you prompted to update credentials?  
  
  **Answer:** Common causes include reinstalling on a different machine, changed data source credentials, a test connection failure, a timeout, or a transient system error. Update credentials in the semantic model’s **Data source credentials** pane in the Power BI service.

- **Question:** How long is personal mode offline during an upgrade?  
  
  **Answer:** Typically only a few minutes.

- **Question:** Does personal mode support R and Python scripts?  
  
  **Answer:** Yes. To refresh a model that uses R or Python in Power Query steps:

  1. Install the matching R or Python version locally.
  1. Set the executable paths via **File > Options and settings > Options > R script / Python script**, then save and republish if you changed them.
  1. Install the required packages for the gateway user.
  1. Keep the machine powered on and the gateway signed in during refresh.
  
  > [!NOTE]
  > Script visuals render at view time. The gateway runs only the Power Query transformation steps during refresh.

- **Question:** How do you reopen or check the personal gateway?  
  
  **Answer:** Use the system tray icon, search the Start menu for On-premises data gateway (personal mode), or launch *%LOCALAPPDATA%\Microsoft\On-premises data gateway (personal mode)\GatewayApp.exe*. If the status shows **Not connected**, sign in again and check network access.

## Related content

- [Add or remove a gateway data source](service-gateway-data-sources.md)
- [Configure proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy)
- [Power BI implementation planning: Data gateways](../guidance/powerbi-implementation-planning-data-gateways.md)

Go to the [Power BI Community](https://community.powerbi.com/) for more answers.
