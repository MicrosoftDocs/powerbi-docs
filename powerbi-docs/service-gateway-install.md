---
title: "Install a gateway for Power BI"
description: Learn how to install a gateway so you can connect to on-premises data in power BI.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 07/15/19
ms.author: mblythe

LocalizationGroup: Gateways
---

# Install a gateway for Power BI

A Power BI gateway is software that you install within an on-premises network; it facilitates access to data in that network. As described in the [overview](service-gateway-getting-started.md), you can install a gateway in personal mode or standard mode (recommended). In standard mode, you can install a stand-alone gateway or add a gateway to a *cluster*, which is recommended for high availability. In this article, we show you how to install a standard gateway, then add another gateway to create a cluster.

If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.


## Download and install a gateway

The gateway runs on the computer where you install it, so ensure that you install on a computer that is always on. For better performance and reliability, we recommend that the computer is on a wired network, rather than a wireless one.

1. In the Power BI service in the upper right corner, select the **download icon** ![Download icon](media/service-gateway-install/icon-download.png) > **Data Gateway**.

    ![Data Gateway](media/service-gateway-install/data-gateway.png)

2. On the download page, select the **DOWNLOAD GATEWAY** button.

3. Select **Next**.     

    ![Data gateway installer](media/service-gateway-install/gateway-installer.png)

4. Select **On-premises data gateway (recommended)** > **Next**.

    ![Gateway type](media/service-gateway-install/gateway-type.png)

5. Keep the default install path, and accept the terms > **Install**.

    ![Install path](media/service-gateway-install/install-path.png)

6. Enter the account you use to sign in to Power BI > **Sign in**.

    ![Email address](media/service-gateway-install/email-address.png)

    The gateway is associated with your Power BI account, and you manage gateways from within the Power BI service. You're now signed in to your account.

7. Select **Register a new gateway on this computer** > **Next**.

    ![Register gateway](media/service-gateway-install/register-gateway.png)

8. Enter a name for the gateway (must be unique across the tenant) and a recovery key. You need this key if you ever want to recover or move your gateway. Select **Configure**.

    ![Configure gateway](media/service-gateway-install/configure-gateway.png)

    Notice the option **Add to an existing gateway cluster**. We'll use this option in the next section of the article.

9. Review the information in the final window. Notice that the gateway is available for Power BI, and also PowerApps and Flow, because I use the same account for all three. Select **Close**.

    ![Summary screen](media/service-gateway-install/summary-screen.png)

Now you've successfully installed a gateway, you can add another gateway to create a cluster.


## Add another gateway to create a cluster

A cluster allows gateway administrators to avoid having a single point of failure for on-premises data access. If the primary gateway is unavailable, data requests are routed to the second gateway that you add, and so on. You can install only one standard gateway on a computer, so you must install the second gateway for the cluster on a different computer. This makes sense because you want redundancy in the cluster.

High availability gateway clusters require the November 2017 update to On-premises data gateway, or later.

1. Download the gateway to a different computer, and install it.

2. After you've signed in to your Power BI account, register the gateway. Select **Add to an existing cluster**. Under **Available gateway clusters**, select the first gateway you installed (the *primary gateway*), and enter the recover key for that gateway. Select **Configure**.

    ![Add a gateway to a cluster](media/service-gateway-install/add-cluster.png)


## Next steps

[Manage a Power BI gateway](service-gateway-manage.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)