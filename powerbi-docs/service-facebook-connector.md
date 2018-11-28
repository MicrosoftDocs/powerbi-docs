---
title: 'Third-party service: Facebook connector for Power BI Desktop'
description: 'Third-party service: Facebook connector for Power BI Desktop'
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 11/28/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# Facebook connector for Power BI Desktop
The Facebook connector in **Power BI Desktop** relies on the Facebook Graph API. As such, features and availability may vary over time.

You can see a [tutorial about the Facebook Connector for Power BI Desktop](desktop-tutorial-facebook-analytics.md).

Facebook expired v1.0 of its Graph API on April 30<sup>th</sup> 2015. Power BI uses the Graph API behind the scenes for the Facebook connector, allowing you to connect to your data and analyze it.

Queries that were built before April 30<sup>th</sup> 2015 may no longer work or return less data. Subsequent to April 30<sup>th</sup> 2015, Power BI leverages v2.8 in all calls to the Facebook API. If your query was built prior to April 30, 2015 and you have not used it since, you’ll likely need to authenticate again, to approve the new set of permissions that we’ll ask for.

Although we attempt to release updates in accordance with any changes, the API may change in a way that affects the results of the queries we generate. In some cases, certain queries may no longer be supported. Due to this dependency we cannot guarantee the results of your queries when using this connector.

More details on the change in the Facebook API are available [here](https://developers.facebook.com/docs/apps/changelog#v2_0).

