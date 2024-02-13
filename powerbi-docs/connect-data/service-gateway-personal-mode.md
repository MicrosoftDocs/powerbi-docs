---
title: Use a personal gateway in Power BI
description: See information about the Power BI on-premises data gateway (personal mode) that you can use for connecting to on-premises data.
author: arthiriyer
ms.author: arthii
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: how-to
ms.date: 12/30/2022
LocalizationGroup: Gateways
---

# Use a personal gateway in Power BI

[!INCLUDE [gateway-rewrite](../includes/gateway-rewrite.md)]

The on-premises data gateway (personal mode) is a version of the on-premises data gateway that works only with Power BI. You can use a personal gateway to install a gateway on your own computer and get access to on-premises data.

> [!NOTE]
> Each Power BI user can have only one personal mode gateway running. If the same user installs another personal mode gateway, even on a different computer, the most recent installation replaces the existing previous installation.

## On-premises data gateway vs. on-premises data gateway (personal mode)

The following table describes differences between an on-premises data gateway and an on-premises data gateway (personal mode).

|   |On-premises data gateway | On-premises data gateway (personal mode) |
| ---- | ---- | ---- |
|**Supports cloud services:** |Power BI, PowerApps, Azure Logic Apps, Power Automate, Azure Analysis Services, dataflows | None |
|**Runs under credentials:** |As configured by users who have access to the gateway |Your credentials for Windows authentication, or credentials you configure for other authentication types |
|**Can install only as computer admin** |Yes |No |
|**Centralized gateway and data source management** |Yes |No |
|**Can import data and schedule refresh** |Yes |Yes |
|**DirectQuery support** |Yes |No |
|**LiveConnect support for Analysis Services** |Yes |No |

## Install the on-premises data gateway (personal mode)

To install the on-premises data gateway (personal mode):

1. [Download the on-premises data gateway](https://go.microsoft.com/fwlink/?LinkId=820925&clcid=0x409).

1. Open the installer, and select **Next**.

1. Select **On-premises data gateway (personal mode)**, and then select **Next**.

   ![Screenshot that shows selecting the on-premises data gateway (personal mode).](media/service-gateway-personal-mode/personal-gateway-select.png)

1. On the next screen, review the minimum requirements, verify or edit the installation path, and select the checkbox to accept the terms of use and privacy statement. Then select **Install**.

1. After the installation completes successfully, enter your email address under **Email address to use with this gateway**, and select **Sign in**. 

1. After you sign in, the following screen appears. Select **Close** to close the installer.

   ![Screenshot that shows the On-premises data gateway (personal mode) success screen.](media/service-gateway-personal-mode/personal-gateway-complete.png)

## Use Fast Combine with the personal gateway

Fast Combine on a personal gateway helps you ignore specified privacy levels when you run queries. To enable Fast Combine for the on-premises data gateway (personal mode):

1. Use Windows File Explorer to open the file *\<localappdata>\\Microsoft\\On-premises data gateway (personal mode)\\Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config*.

2. At the end of the file, before `</Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.GatewayCoreSettings>`, add the following code, and then save the file.

    ```xml
    <setting name="EnableFastCombine" serializeAs="String">
       <value>true</value>
    </setting>
    ```

3. The setting takes effect in approximately one minute. To confirm that Fast Combine is working properly, try an on-demand refresh in the Power BI service.

## Frequently asked questions (FAQ)

- **Question:** Can you run the on-premises data gateway (personal mode) side-by-side with the on-premises data gateway that used to be called the Enterprise gateway?
  
  **Answer:** Yes, both gateways can run simultaneously.

- **Question:** Can you run the on-premises data gateway (personal mode) as a service?
  
  **Answer:** No. The on-premises data gateway (personal mode) can run only as an application. To run a gateway as a service or in admin mode, use the [on-premises data gateway](/data-integration/gateway/service-gateway-onprem), which used to be called the Enterprise gateway.

- **Question:** How often does the on-premises data gateway (personal mode) update?
  
  **Answer:** The personal gateway updates monthly.

- **Question:** Why does the personal gateway ask you to update your credentials?
  
  **Answer:** Many situations can trigger a request for credentials. The most common scenario is that you reinstalled the on-premises data gateway (personal mode) on a different machine than your original Power BI personal gateway. There could also be an issue in the data source, or Power BI failed to make a test connection, or a timeout or system error occurred.
  
  To update your credentials in the Power BI service, select the gear icon in the header and then choose **Settings**. On the **Semantic models** tab, select the dataset, and then choose **Data source credentials**.

- **Question:** How long is a personal gateway offline during an upgrade?
  
  **Answer:** Upgrading the personal gateway to a new version takes only few minutes.

- **Question:** Does the personal gateway support R and Python scripts?
  
  **Answer:** Yes, personal mode supports R and Python scripts.​

## Related content

* [Add or remove a gateway data source](service-gateway-data-sources.md)
* [Configure proxy settings for an on-premises data gateway](/data-integration/gateway/service-gateway-proxy)
* [Power BI implementation planning: Data gateways](../guidance/powerbi-implementation-planning-data-gateways.md)

More questions? Try the [Power BI Community](https://community.powerbi.com/).
