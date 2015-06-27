<properties pageTitle="3rd Party Service - Facebook connector" description="3rd Party Service - Facebook connector" services="powerbi" documentationCenter="" authors="v-anpasi" manager="mblythe" editor=""/>
<tags ms.service="powerbi" ms.devlang="NA" ms.topic="article" ms.tgt_pltfrm="NA" ms.workload="powerbi" ms.date="06/26/2015" ms.author="v-anpasi"/>
#Third-party service: Facebook connector for Power BI Designer

[← Power BI Designer](https://support.powerbi.com/knowledgebase/topics/68530-power-bi-designer)

The Facebook connector in the Power BI Designer relies on the Facebook Graph API. As such, features and availability may vary over time.

As of April 30<sup>th</sup> 2015, Facebook expired v1.0 of its Graph API. The Graph API is what Power BI uses behind the scenes for the Facebook connector, allowing you to connect to your data and analyze it. Unfortunately this expiration means some changes in the Facebook connector as it currently exists. The most important difference is the set of permissions we’re able to leverage and the data those permissions return. For example, Friends Lists and News Feeds are commonly used permissions that are now changed or inaccessible.

Queries that were built before April 30<sup>th</sup> may no longer work or return less data. After April 30<sup>th</sup>, Power BI will leverage v2.2 in all calls to the Facebook API. You’ll likely need to authenticate again, to approve the new set of permissions that we’ll ask for.

Although we attempt to release updates in accordance with any changes, the API may change in a way that affects the results of the queries we generate. In some cases, certain queries may no longer be supported. Due to this dependency we cannot guarantee the results of your queries when using this connector.

More details on the change in the Facebook API are available [here](https://developers.facebook.com/docs/apps/changelog#v2_0).