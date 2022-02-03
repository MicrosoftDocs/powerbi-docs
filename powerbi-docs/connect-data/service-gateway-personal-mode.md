---
title: Use personal gateways in Power BI
description: Provides information about on-premises data gateway (personal mode) for Power BI that individuals can use for connecting to on-premises data.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 11/09/2020
LocalizationGroup: Gateways
---

# Use personal gateways in Power BI

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

The on-premises data gateway (personal mode) is a version of the on-premises data gateway that works only with Power BI. You can use a personal gateway to install a gateway on your own computer and gain access to on-premises data.

> [!NOTE]
> You can have only one personal mode gateway running for each Power BI user. If you install another personal mode gateway for the same user, even on a different computer, the most recent installation replaces the existing previous installation.

## On-premises data gateway vs. on-premises data gateway (personal mode)

The following table describes differences between an on-premises data gateway and an on-premises data gateway (personal mode).

|   |On-premises data gateway | On-premises data gateway (personal mode) |
| ---- | ---- | ---- |
|**Cloud services supported** |Power BI, PowerApps, Azure Logic Apps, Power Automate, Azure Analysis Services, dataflows |Power BI |
|**Runs** |As configured by users who have access to the gateway |As you for Windows authentication and as configured by you for other authentication types |
|**Can install only as computer admin** |Yes |No |
|**Centralized gateway and data source management** |Yes |No |
|**Import data and schedule refresh** |Yes |Yes |
|**DirectQuery support** |Yes |No |
|**LiveConnect support for Analysis Services** |Yes |No |

## Install the on-premises data gateway (personal mode)

To install the on-premises data gateway (personal mode):

1. [Download the on-premises data gateway](https://go.microsoft.com/fwlink/?LinkId=820925&clcid=0x409).

2. In the installer, select the on-premises data gateway (personal mode), and then select **Next**.

   ![Select the on-premises data gateway (personal mode)](media/service-gateway-personal-mode/personal-gateway-select.png)

The gateway files are installed in _"%localappdata%\Microsoft\On-premises data gateway (personal mode)_. After the installation finishes successfully and you sign in, you see the following screen.

![On-premises data gateway (personal mode) succeeded](media/service-gateway-personal-mode/personal-gateway-complete.png)

## Use Fast Combine with the personal gateway

Fast Combine on a personal gateway helps you ignore specified privacy levels while executing queries. To enable Fast Combine to work with the on-premises data gateway (personal mode):

1. Using File Explorer, open the following file:

   `%localappdata%\Microsoft\On-premises data gateway (personal mode)\Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config`

2. At the bottom of the file, before `</Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.GatewayCoreSettings>` add the following text:

    ```xml
    <setting name="EnableFastCombine" serializeAs="String">
       <value>true</value>
    </setting>
    ```

3. After it finishes, the setting takes effect in approximately one minute. To check that it's working properly, try an on-demand refresh in the Power BI service to confirm that Fast Combine is working.

## Frequently asked questions (FAQ)

**Question:** Can I run the on-premises data gateway (personal mode) side by side with the on-premises data gateway (previously known as the Enterprise version of the gateway)?
  
**Answer:** Yes, both gateways can run simultaneously.

**Question:** Can I run the on-premises data gateway (personal mode) as a service?
  
**Answer:** No. The on-premises data gateway (personal mode) can run only as an application. If you need to run the gateway as a service or in admin mode, you need to consider the [on-premises data gateway](/data-integration/gateway/service-gateway-onprem) (previously known as the Enterprise gateway).

**Question:** How often is the on-premises data gateway (personal mode) updated?
  
**Answer:** We plan to update the personal gateway monthly.

**Question:** Why am I asked to update my credentials?
  
**Answer:** Many situations can trigger a request for credentials. The most common is that you've reinstalled the on-premises data gateway (personal mode) on a different machine than your Power BI - personal gateway. It could also be an issue in the data source, and Power BI failed to perform a test connection, or a timeout or a system error occurred. To update your credentials in the Power BI service, select the gear icon and select **Settings** > **Datasets**. Find the dataset in question, and select **Data source credentials**.

**Question:** How long will my previous personal gateway be offline during the upgrade?
  
**Answer:** Upgrading the personal gateway to the new version takes only few minutes.

**Question:** I'm using R and Python scripts. Are they supported?
  
**Answer:** R and Python scripts are supported for personal mode.​

## Next steps

* [Add or remove a gateway data source](service-gateway-data-sources.md)
* [Configuring proxy settings for the on-premises data gateway](/data-integration/gateway/service-gateway-proxy)  

More questions? Try the [Power BI Community](https://community.powerbi.com/).
