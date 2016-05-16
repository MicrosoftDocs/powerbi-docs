<properties
pageTitle="Power BI Gateway - Enterprise in-depth"
description="A deeper look at how the enterprise gateway works. This looks at how the usernames are passed for Analysis Services via the EffectiveUserName. Also a look at how Active Directory plays into this solution."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="no"
qualityDate=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="05/16/2016"
ms.author="asaxton"/>
# Power BI Gateway - Enterprise in-depth

With Power BI, users in your organization can now see your on-premises data and metrics in a whole new way. But before users can connect to your on-premises data source, a Power BI Gatway - Enterprise needs to be installed and configured. The gateway helps make the behind-the-scenes communication from a user in Power BI to your on-premises Analysis Services server and back to Power BI quick and secure.

Installing and configuring a gateway is usually done by an administrator. It requires special knowledge of your on-premises servers and it in some cases may require Server Administrator permissions.

This article doesn’t provide step-by-step guidance on how to install and configure the gateway. For that, be sure to see [Power BI Gateway - Enterprise](powerbi-gateway-enterprise.md). This article is meant to provide you with an in-depth understanding of how the gateway works. We’ll also go into some detail about usernames and security in both Power BI and Analysis Services, and how Power BI uses the e-mail address a user signs into Power BI with, the gateway, and Active Directory to securely connect to and query your on-premises data. If you want to dig deeper, links to more detailed articles are provided.

## Making the connection

Let’s first look at what happens when a user in Power BI interacts with a report connected to an on-premises data source. This assumes you have already configured a data source for the gateway and entered the credentials to use. [Learn more](powerbi-gateway-enterprise.md#storing-encrypted-credentials-in-the-cloud)

1.  When a user interacts with a report in Power BI, such as click on a chart, select a filter, or add a new field, a query is created by Power BI and sent along to the gateway, along with the encrypted credentials. For Analysis Services, the current users identity will be sent as the effective user. This request will be sent to the Data Movement Service.

2.  The Data Movement Service will analyze the query and will push the request to the service bus instance.

3.  The gateway acts as a bridge. It will poll the service bus for pending requests.

4.  The gateway gets the query, decrypts the credentials and connects to the data sources with those credentials. 

    For Analysis Services, we will also set the EffectiveUserName property with the Power BI user. The EffectiveUserName settings is in the format of a User Principal Name (UPN) and needs to match an account within the Active Directory Domain that the Analysis Services server is joined to.
    
    For SQL Server and SAP HANA, the connection will be made using the supplied credentials of the data source. This will be used regardless of what the end user is within Power BI.

5.  The query is sent by the gateway to the data source for execution.

6.  The results are sent from the data source, back to the gateway, and then onto Power BI where it's rendered in the user's report.

Now, let’s go over what needs to be in-place for this to happen.

## Usernames in Power BI

When a user signs up for a Power BI account, they use an e-mail address. In most cases, this is a work e-mail address, like nancy@contoso.com.

However, in some cases, it could be an e-mail address like nancyt@contoso.onmicrosoft.com. This is most common when a user signs up for Office 365 and doesn’t use their work e-mail address. This is an important distinction and we’ll come back to it later when we talk about when you might need to synchronize your Active Directory with Azure Active Directory by using DirSync.

### Analysis Services

Each time a user interacts with a report connected to Analysis Services, the effective username is passed to the gateway and then onto your on-premises Analysis Services server. The email address, that you sign into Power BI with, is what we will pass to Analysis Services as the effective user. This is passed in the connection property [EffectiveUserName](https://msdn.microsoft.com/library/dn140245.aspx#bkmk_auth). This email address should match a defined UPN within the local Active Directory Domain. The UPN is a property of an Active Directory account. That Windows account then needs to be present in an Analysis Services role. If a match cannot be found, in Active Directory, the login will not be successful. [Learn more](https://msdn.microsoft.com/library/ms677605.aspx)

### Other data sources

For data sources that are using DirectQuery, or are configured for scheduled refresh, the gateway will always connect using the credentials you specified when you setup the data source within Power BI. We will not connect using the individual user trying to run the report.

## Usernames in Analysis Services

Let’s take a quick look at how Analysis Services secures data. There are two levels of security:

### Role-based security

Models provide security based on user roles. Roles are defined for a particular model project during authoring in SQL Server Data Tools – Business Intelligence (SSDT-BI), or after a model is deployed, by using SQL Server Management Studio (SSMS). Roles contain members by Windows username or by Windows group. Roles define permissions a user has to query or perform actions on the model. Most users will belong to a role with Read permissions. Other roles are meant for administrators with permissions to process items, manage database functions, and manage other roles.

### Row-level security

Row-level security is only available with an Analysis Services live connection. Models can provide dynamic, row-level security. Unlike having at least one role in which users belong to, dynamic security is not required for any tabular model. At a high-level, dynamic security defines a users read access to data right down to a particular row in a particular table. Similar to roles, dynamic row-level security relies on a user’s Windows username.

In Power BI, a users ability to query and view model data are determined first by the roles their Windows user account are a member of and second, by dynamic row-level security, if configured.

Implementing role and dynamic row-level security in models is beyond the scope of this article.  You can learn more at [Roles (SSAS Tabular)](https://msdn.microsoft.com/library/hh213165.aspx) and [Security Roles (Analysis Services - Multidimensional Data)](https://msdn.microsoft.com/library/ms174840.aspx) on MSDN. And, for the most in-depth understanding of tabular model security, download and read the [Securing the Tabular BI Semantic Model](https://msdn.microsoft.com/library/jj127437.aspx) whitepaper.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qb5EEjkHoLg" frameborder="0" allowfullscreen></iframe>

## What is Active Directory’s role?

In order for Analysis Services Server to determine if a user connecting to it belongs to a role with permissions to read data, the server needs to convert the effective username passed from Power BI to the gateway and then onto the Analysis Services server. The Analysis Services server passes the effective username to a Windows Active Directory server joined to the same domain. The Active Directory server then validates the effective username is a valid UPN and returns that user’s Windows username back to the Analysis Services server.

## What about Azure Active Directory?

Because Power BI is a cloud service, it uses [Azure Active Directory](http://azure.microsoft.com/documentation/articles/active-directory-whatis/) to take care of authenticating users.

When users connect to an on-premises Analysis Services server from Power BI, their username must also be resolved in your domain’s Active Directory on-premises. If users in your organization login with their work e-mail address, like nancy@contoso.com, username resolution typically isn’t a problem. In some cases, if a user logs into Power BI with an .onmicrosoft.com address, your domains Active Directory server might need to be synchronized with Azure Active Directory. Fortunately, there’s a tool just for this.

## Mapping user names

For Analysis Services data sources, configured for the enterprise gateway, you can configure rules to map a user name logged in with Power BI to a name that is passed for effective user name on the Analysis Services connection. This is a great way to workaround when your user name for Power BI doesn't match a User Principal Name (UPN) in your local Active Directory. [Learn more](powerbi-gateway-enterprise-manage-ssas.md#map-user-names)

## Synchronize an on-premises Active Directory with Azure Active Directory

Synchronizing your Active Directory to Azure Active Directory with the Azure AD Connect tool (DirSync) is not a requirement if users sign into Power BI with their work e-mail address. But if users sign into Power BI with a .onmicrosoft.com email address, you will need to sync your Active Directory server with Azure Active Directory.

Let's assume your Analysis Services server and Active Directory server are joined to the same domain, Contoso.com, and a gateway is installed, configured and running. What happens when a user, Nancy, signs into Power BI with...

**A work email address like nancy@contoso.com**

*You do not need to sync your Active Directory with Azure Active Directory.*

When Nancy interacts with a report connected to an Analysis Services data source, the value of the effective username passed with the query is 'nancy@contoso.com'. Active Directory is able to resolve Nancy’s username and the query is run in Analysis Services. Nancy is able to interact with her reports connected to Analysis Services without any problems. No Active Directory to Azure Active Directory sync is needed. However, keep the following in-mind:

Your on-premises Analysis Services server must be joined to a domain.

If your Analysis Services server is part of a workgroup, Active Directory doesn’t come into the picture at all. The effective username cannot be resolved and users will be unable to connect to the server.

**A .onmicrosoft.com email address, like nancyt@contoso.onmicrosoft.com**

*You will need to sync your on-premises Active Directory with Azure Active Directory.*

Nancy’s work e-mail is nancy@contoso.com, but when she signs into Power BI, she uses a different e-mail address, nancyt@contoso.onmicrosoft.com. When Nancy interacts with a report connected to an on-premises Analysis Services model, the effective username passed with the query is nancyt@contoso.onmicrosoft.com. The on-premises Active Directory won’t be able to resolve this username to Nancy’s on-premises username. Analysis Services cannot identify Nancy’s membership in a role and the query will not be run.

In this case, you can use DirSync, which is part of Azure AD Connect, to synchronize Active Directory to Azure Active Directory. Once synchronized, Nancy can sign into Power BI using her work e-mail address, nancy@contoso.com. Nancy will be able to interact with her reports just like in our scenario above.

> NOTE: This will create a new account for nancy@contoso.com within Azure Active Directory.

To learn more about using DirSync, see [Integrating your on-premises identities with Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-aadconnect/) on TechNet.

## Now, this is where the gateway comes in

The gateway acts as a bridge between the Power BI service running in a user’s browser and your on-premises server. Data transfer between Power BI and the gateway is secured through [Azure Service Bus](http://azure.microsoft.com/documentation/services/service-bus/). The Service Bus creates a secure channel between Power BI and your on-premises server through an outbound connection on the gateway.  An inbound connection is not required to be opened in your on-premises firewall.

If you have an Analysis Services data source, you’ll need to install the gateway on a computer joined to the same forest/domain as your Analysis Services server. This can be the same computer as Analysis Services. 

The closer the gateway is to the server, the faster the connection will be. If you can get the gateway on the same server as the data source, that is best to avoid network latency between the gateway and the server.

## Matching your Power BI Desktop connections with a gateway

The connection string configured in the Power BI Desktop file needs to match a data source already configured in the Power BI service. When a match is found, it will use the gateway that the data source belongs to.

## Where things can go wrong

Sometimes installing the gateway fails. Or, maybe the gateway seems to install ok, but Power BI is still unable to work with it. In many cases, it’s something simple, like the password for the credentials the gateway uses to sign into the data source.

In other cases, there might be issues with the type of e-mail address users sign in with, or Analysis Services’ inability to resolve an effective username. If you have multiple domains with trusts between them, and your Active Directory server is in one and Analysis Services in another, this sometimes can cause some problems.

Rather than go into troubleshooting gateway issues here, we’ve put a series of troubleshooting steps into another article; [Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md). Hopefully you won’t have any problems. But if you do, understanding how all of this works and the troubleshooting article should help.

## Ports
The gateway creates an outbound connection to Azure Service Bus. It communicates on outbound ports: TCP 443 (default), 5671, 5672, 9350 thru 9354.  The gateway does not require inbound ports. [Learn more](https://www.microsoft.com/download/details.aspx?id=41653)

|Domain names|Outbound ports|
|---|---|
|*.powerbi.com|443|
|*.analysis.windows.net|443|
|*.login.windows.net|443|
|*.servicebus.windows.net|443, 5671-5672, 9350-9354|
|*.frontend.clouddatahub.net|443|
|*.core.windows.net|443|
|login.microsoftonline.com|443|
|login.windows.net|443|

## FAQ

**Question:** Can I use msdmpump.dll to create custom effective username mappings for Analysis Services?

**Answer:** No. This is not supported at this time.

**Question:** Can I use the enterprise gateway to connect to a Multidimensional (OLAP) instance.

**Answer:** Yes! The enterprise gateway supports live connections to both Analysis Services Tabular and Multidimensional models.

**Question:** How often are tiles in a dashboard, in Power BI, refreshed when connected through the enterprise gateway?

**Answer:** About ten minutes. DirectQuery and live connections are just that. This doesn’t mean that a tile issue a query to your on-premises server, and show new data, every ten minutes. In-fact, most data sources are processed once a day, usually in the evening. This is different from interacting with a report, where tiles and visualizations will be updated immediately as users slice and dice the data.

**Question:** Can I upload Excel workbooks with Power Pivot data models that connect to on-premises data sources? Do I need an enterprise gateway for this scenario?

**Answer:** Yes, you can upload the workbook. And, no, you don’t need an enterprise gateway. But, because the data will reside in the Excel data model, reports in Power BI based on the Excel workbook will not be live. In order to refresh reports in Power BI, you’d have to re-upload an updated workbook each time. Or, setup a personal gateway to schedule refreshes.

**Question:** What if I install the gateway on a computer in a different domain from my on-premises server that uses Windows authentication?

**Answer:** No guarantees here. It all depends on the trust relationship between the two domains. If the two different domains are in a trusted domain model, then the Connector might be able to connect to the Analysis Services server and the effective user name can be resolved. If not, either the connection or effective username resolution can fail.

**Question:** If users share dashboards that has a DirectQuery or live connection, will those other users be able to see the data even though they might not have the same permissions.

**Answer:** For a dashboard connected to Analysis Services, users will only see the data they have access to. If the users do not have the same permissions, they will not be able to see any data. For other data sources, all users will share the credentials entered by the admin for that data source.

**Question:** How can I find out what effective username is being passed to my on-premises Analysis Services server?

**Answer:** You can use SQL Profiler. You’ll see something like this:

```
    <RestrictionList xmlns="urn:schemas-microsoft-com:xml-analysis">

        <CATALOG_NAME>AdventureWorks_prod</CATALOG_NAME>

        <VERSION>2.0</VERSION>

    </RestrictionList>

    <PropertyList xmlns="urn:schemas-microsoft-com:xml-analysis">

        <Catalog>AdventureWorks_prod</Catalog>

        <Cube>InternetSales</Cube>

        <EffectiveUserName>nancy@contoso.com</EffectiveUserName>

        <SspropInitAppName>PowerBI</SspropInitAppName>

        <LocaleIdentifier>1033</LocaleIdentifier>

        <ClientProcessID>3408</ClientProcessID>

        <Content>SchemaData</Content>

        <Format>Tabular</Format>

        <DbpropMsmdActivityID>381f4fdf-48cf-eb13-a5bd-f585cd05dc5d</DbpropMsmdActivityID>

        <DbpropMsmdRequestID>ed28257d-b516-427e-a299-be5d60f14427</DbpropMsmdRequestID>

    </PropertyList>
```

**Question:** How do I find the gateway service in Services?

**Answer:** The gateway is called **Power BI Enterprise Gateway Service** in Services


## See also

[Power BI Gateway - Enterprise](powerbi-gateway-enterprise.md)

[Manage your enterprise data source - Analysis Services](powerbi-gateway-enterprise-manage-ssas.md)

[Manage your enterprise data source - SAP HANA](powerbi-gateway-enterprise-manage-sap.md)

[Manage your enterprise data source - SQL Server](powerbi-gateway-enterprise-manage-sql.md)

[Manage your enterprise data source - Import/Scheduled refresh](powerbi-gateway-enterprise-manage-scheduled-refresh.md)

[Upgrading the Analysis Services Connector to the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-upgrade-as-connector.md)

[Troubleshooting the Power BI Gateway - Enterprise](powerbi-gateway-enterprise-tshoot.md)

[Azure Service Bus Port Settings](https://msdn.microsoft.com/library/azure/ee732535.aspx)

[User Naming Attributes (UPN)](https://msdn.microsoft.com/library/ms677605.aspx)

[Integrating your on-premises identities with Azure Active Directory](https://azure.microsoft.com/documentation/articles/active-directory-aadconnect/)