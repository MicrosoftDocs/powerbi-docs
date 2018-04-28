---
title: "Install a gateway for Power BI"
description: Learn how to install a gateway so you can connect to on-premises data in power BI.
services: powerbi
documentationcenter: ''
author: mgblythe
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: powerbi
ms.date: 04/18/2018
ms.author: mblythe

LocalizationGroup: Gateways
---

# Install a gateway for Power BI

A Power BI gateway is software that you install within an on-premises network; it facilitates access to data in that network. In this article, you install a gateway and on a local computer.

If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.


## Manage high availability clusters
You can create *high availability clusters* of gateway installations, to ensure your organization can access on-premises data resources used in Power BI reports and dashboards. These clusters allow gateway administrators to group gateways to avoid single points of failure in accessing on-premises data.

During the **On-premises data gateway** installation process, you can specify whether the gateway should be added to an existing gateway cluster. 

![](media/service-gateway-high-availability-clusters/gateway_clusters_01.png)

In order to add a gateway to an existing cluster, you must provide the *recovery key* for the primary gateway instance for the cluster you want the new gateway to join. The primary gateway for the cluster must be running the gateway update from November 2017 or later. 


## Download and install a gateway

The first step is to download the gateway from the Power BI service, and install it on your local computer.

1. In the Power BI service, select the **download icon** in the upper right corner, and select **Data Gateway**.

    ![](media/service-gateway-install/gw_gettingstarted_01.png)

2. On the download page, click the **DOWNLOAD GATEWAY** button.

3. Read the information about gateways, then click **Next**.     

    ![](media/service-gateway-install/gw_gettingstarted_02.png)

    This screen gives you the ultra-condensed explanation of what a gateway does. It also provides a couple important **warnings** – when you install a gateway, it actually runs on the computer on which you perform the installation. And if that computer is turned off, so is the gateway (so it won’t work when it’s not running). Also, installing on a computer using a wireless network is not best, so you should use a computer connected to a wired network.

4. Select **On-premises data gateway**, then click **Next**.

    ![](media/service-gateway-install/gw_gettingstarted_03.png)

    Here’s where you decide which gateway you’ll install – on-premises gateway, or a personal gateway. In this guide, we’ll install the **On-premises data gateway**.
    
    There are a few things to note at this decision point:
    
    * Both gateways require 64-bit Windows operating systems.
    * Gateways can’t be installed on a domain controller.
    * You can install up to two On-premises data gateways on the same computer, one running in each mode (personal and standard). 
    * You cannot have more than one gateway running in the same mode on the same computer.
    * You can install multiple On-premises data gateways on different computers, and manage them all from the same Power BI gateway management interface (excluding personal, see the following bullet point).
    * You can only have one personal mode gateway running for each Power BI user. If you install another personal mode gateway for the same user, even on a different computer, the most recent installation replaces the existing previous installation.

5. Keep the default install path, and click **Install**.

    ![](media/service-gateway-install/gw_gettingstarted_06.png)

6. Enter the account you use to sign in to Power BI. The gateway is associated with your Power BI account, and you configure gateways from within the Power BI service.

    ![](media/service-gateway-install/gw_gettingstarted_07.png)

    You’ll be signed in, as shown in the following image.

    ![](media/service-gateway-install/gw_gettingstarted_08.png)

7. Enter a **Recovery key**. You need this key if you ever want to recover or move your gateway. [TODO] - give some guidance on recovery key and gateway naming

    ![](media/service-gateway-install/gw_gettingstarted_09.png)

8. Review the information in the final window, then click **Close**.

    ![](media/service-gateway-install/gw_gettingstarted_10.png)

## Next steps
[Manage a Power BI gateway](service-gateway-manage.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)