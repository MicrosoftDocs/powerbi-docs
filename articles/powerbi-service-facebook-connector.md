<properties 
   pageTitle="Third-party service: Facebook connector for Power BI Desktop"
   description="Third-party service: Facebook connector for Power BI Desktop"
   services="powerbi" 
   documentationCenter="" 
   authors="pcw3187" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/14/2015"
   ms.author="v-pawrig"/>
# Third-party service: Facebook connector for Power BI Desktop

The Facebook connector in Power BI Desktop relies on the Facebook Graph API. As such, features and availability may vary over time.

You can see a [tutorial about the Facebook Connector for Power BI Desktop](powerbi-desktop-tutorial-facebook-analytics.md).

On April 30<sup>th</sup> 2015, Facebook expired v1.0 of its Graph API. The Graph API is what Power BI uses behind the scenes for the Facebook connector, allowing you to connect to your data and analyze it. Unfortunately this expiration means some changes in the Facebook connector as it currently exists. The most important difference is the set of permissions we’re able to leverage and the data those permissions return. For example, Friends Lists and News Feeds are commonly used permissions that are now changed or inaccessible.

Queries that were built before April 30<sup>th</sup> may no longer work or return less data. Subsequent to April 30<sup>th</sup>, Power BI leverages v2.2 in all calls to the Facebook API. If your query was built prior to that, you’ll likely need to authenticate again, to approve the new set of permissions that we’ll ask for.

Although we attempt to release updates in accordance with any changes, the API may change in a way that affects the results of the queries we generate. In some cases, certain queries may no longer be supported. Due to this dependency we cannot guarantee the results of your queries when using this connector.

More details on the change in the Facebook API are available [here](https://developers.facebook.com/docs/apps/changelog#v2_0).

