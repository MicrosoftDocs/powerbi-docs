---
title: "Quickstart: Install a gateway for Power BI"
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

# Quickstart: Install a gateway for Power BI

A Power BI gateway is software that you install within an on-premises network; it facilitates access to data in that network. In this article, you install a gateway and add users to that gateway.

If you're not signed up for Power BI, [sign up for free](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.

## Download and install a gateway

The first step is to download the gateway from the Power BI service, and install it on your local computer.

1. In the Power BI service, select the **download icon** in the upper right corner, and select **Data Gateway**.

    ![](media/service-gateway-install/gw_gettingstarted_01.png)

2. On the download page, where click the **Download gateway** button.

3. Read the information about gateways, then click **Next**.     

    ![](media/service-gateway-getting-started/gw_gettingstarted_02.png)

4. Select **On-premises data gateway**, then click **Next**.

5. Keep the default install path, and click **Install**.

    ![](media/service-gateway-getting-started/gw_gettingstarted_06.png)

6. Enter the account the username and password you use to sign in to Power BI. The gateway is associated with your Power BI account, and you configure gateways from within the Power BI service.

    ![](media/service-gateway-getting-started/gw_gettingstarted_07.png)

    You’ll be signed in, as shown in the following image.

    ![](media/service-gateway-getting-started/gw_gettingstarted_08.png)

7. Enter a **Recovery key**. You need this key if you ever want to recover or move your gateway. [TODO] - give some guidance on recovery key and gateway naming

    ![](media/service-gateway-getting-started/gw_gettingstarted_09.png)

8. Review the information in the fianl window, then click **Close**.

    ![](media/service-gateway-getting-started/gw_gettingstarted_10.png)


## Add users to the gateway

Now that you have a gateway installed, you add users from the Power BI service.

1. In the Power BI service select the Gear icon in the upper-right corner, then select **Manage gateways**.

    ![](media/service-gateway-getting-started/gw_gettingstarted_15.png)

2. Click or tap **Administrators** to see which users can *administer* the gateway. Right now, it should show only your Power BI account. [TODO] - need to figure out data source first.

    ![](media/service-gateway-getting-started/gw_gettingstarted_13.png)

3. Select **Users**, and enter a user from your organization who you want to grant access to the selected data source. In the following screen, you can see that I’ve added Maggie and Adam.

    ![](media/service-gateway-getting-started/gw_gettingstarted_17.png)

4. Select **Add**, and the added member shows up in the box.

    ![](media/service-gateway-getting-started/gw_gettingstarted_18.png)

And that’s all there is to it. Remember that you need to add users to each data source to which you want to grant access. Each data source has a separate list of users, and you must add users to each data source separately.

## Next steps
[TODO] - add links for adding a data source and refreshing data 

More questions? [Try the Power BI Community](http://community.powerbi.com/)

