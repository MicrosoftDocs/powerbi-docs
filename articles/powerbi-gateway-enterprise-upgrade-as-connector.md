<properties
pageTitle="Upgrading the Analysis Services Connector to the Power BI Gateway - Enterprise"
description="What is involved for upgrading the Analysis Service Connector to the Power BI Gateway for enterprises."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
editor=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="12/18/2015"
ms.author="asaxton"/>
# Upgrading the Analysis Services Connector to the Power BI Gateway - Enterprise (Preview)

You can now work with live data from Analysis Services with the Power BI Gateway - Enterprise (Preview). This includes both tabular and multidimensional models. This also means you can start to moving your exising Analysis Service Connector deployments over to the new enterprise gateway. The following looks at how you can go about moving from the Analysis Services Connector to the enterprise gateway.

## How to try the enterprise gateway without removing the Analysis Services Connector

1.   Install the Power BI Gateway - Enterprise (Preview)

2.   Add a data source for an Analysis Services server and database. [Learn more](powerbi-gateway-enterprise-manage-ssas.md)

3.   For the users that want to try out the enterprise gateway, add them on the users tab for the data source. For example, Anna.

4.   The moment you do this, all new and existing reports, along with the dashboard tiles based on those reports, published by Anna, will start to go through the enterprise gateway. Users that are not in the users list of the data source will still make use of the Analysis Services Connector.

5.   To move Anna back over to the Analysis Services Connector, delete the data source from the enterprise gateway.

## How to upgrade all users to the enterprise gateway

1.   Install the Power BI Gateway - Enterprise (Preview)

2.   Add all of the Analysis Services Databases, that you want to expose to Power BI, as data sources under the enterprise gateway.

3.   Add the users that can publish reports for each data source on the users tab of the data source. 

    > NOTE: The users list only controls who are allowed to publish reports. The report owners can create dashboards, or content packs, and share those with other users.

4.   Uninstall the Analysis Services Connector.

Support for security groups is planned by the time the enterprise comes out of preview. This will allow you to more easily upgrade from the Analysis Services Connector.

## Username with Analysis Services

Each time a user interacts with a report connected to Analysis Services, the effective username is passed to the gateway and then onto your on-premises Analysis Services server. The email address, that you sign into Power BI with, is what we will pass to Analysis Services as the effective user. This is passed in the connection property [EffectiveUserName](https://msdn.microsoft.com/library/dn140245.aspx#bkmk_auth). This email address should match a defined UPN within the local Active Directory Domain. The UPN is a property of an Active Directory account. That Windows account then needs to be present in an Analysis Services role. If a match cannot be found, in Active Directory, the login will not be successful. [Learn more](https://msdn.microsoft.com/library/ms677605.aspx)

## See also

[Power BI Gateway - Enterprise (Preview)](powerbi-gateway-enterprise.md)

[Power BI Gateway - Enterprise (Preview) in-depth](powerbi-gateway-enterprise-indepth.md)

[Manage your enterprise data source - Analysis Services](powerbi-gateway-enterprise-manage-ssas.md)

[Troubleshooting the Power BI Gateway - Enterprise (Preview)](powerbi-gateway-enterprise-tshoot.md)