---
title: On-premises data gateway in-depth
description: This article looks at the on-premises gateway in-depth. This looks at how the service works with Azure Active Directory and your local Active Directory when working with Analysis Services
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-gateways
ms.topic: conceptual
ms.date: 07/15/2019
ms.author: mblythe

LocalizationGroup: Gateways
---
# On-premises data gateway in-depth
It's possible for users in your organization to access on-premises data (to which they already have access authorization), but before those users can connect to your on-premises data source, an On-premises data gateway needs to be installed and configured. The gateway facilitates quick and secure behind-the-scenes communication between a user in the cloud, to your on-premises data source, and then back to the cloud.

Installing and configuring a gateway is usually done by an administrator. It may require special knowledge of your on-premises servers and in some cases may require Server Administrator permissions.

This article doesn’t provide step-by-step guidance on how to install and configure the gateway. For that, be sure to see [On-premises data gateway](service-gateway-onprem.md). This article is meant to provide you with an in-depth understanding of how the gateway works. We’ll also go into some detail about usernames and security in both Azure Active Directory and Analysis Services, and how the cloud service uses the e-mail address a user sign in with, the gateway, and Active Directory to securely connect to and query your on-premises data.

<!-- Shared Requirements Include -->
[!INCLUDE [gateway-onprem-how-it-works-include](./includes/gateway-onprem-how-it-works-include.md)]

<!-- Shared Install steps Include -->
[!INCLUDE [gateway-onprem-datasources-include](./includes/gateway-onprem-datasources-include.md)]

## Sign in account
Users will sign in with either a work or school account. This is your organization account. If you signed up for an Office 365 offering and didn’t supply your actual work email, it may look like nancy@contoso.onmicrosoft.com. Your account, within a cloud service, is stored within a tenant in Azure Active Directory (AAD). In most cases, your AAD account’s UPN will match the email address.

## Authentication to on-premises data sources
A stored credential will be used to connect to on-premises data sources from the gateway except Analysis Services. Regardless of the individual user, the gateway uses the stored credential to connect.

## Authentication to a live Analysis Services data source
Each time a user interacts with Analysis Services, the effective username is passed to the gateway and then onto your on-premises Analysis Services server. The user principal name (UPN), typically the email address you sign into the cloud with, is what we will pass to Analysis Services as the effective user. The UPN is passed in the connection property EffectiveUserName. This email address should match a defined UPN within the local Active Directory domain. The UPN is a property of an Active Directory account. That Windows account then needs to be present in an Analysis Services role to have access to the server. The login will not be successful if no match is found in Active Directory.

Analysis Services can also provide filtering based on this account. The filtering can occur with either role based security, or row-level security.

## Role-based security
Models provide security based on user roles. Roles are defined for a particular model project during authoring in SQL Server Data Tools – Business Intelligence (SSDT-BI), or after a model is deployed, by using SQL Server Management Studio (SSMS). Roles contain members by Windows username or by Windows group. Roles define permissions a user has to query or perform actions on the model. Most users will belong to a role with Read permissions. Other roles are meant for administrators with permissions to process items, manage database functions, and manage other roles.

## Row-level security
Row-level security is specific to Analysis Services row-level security. Models can provide dynamic, row-level security. Unlike having at least one role in which users belong to, dynamic security is not required for any tabular model. At a high-level, dynamic security defines a user’s read access to data right down to a particular row in a particular table. Similar to roles, dynamic row-level security relies on a user’s Windows username.

A user’s ability to query and view model data are determined first by the roles their Windows user account are a member of and second, by dynamic row-level security, if configured.

Implementing role and dynamic row-level security in models are beyond the scope of this article.  You can learn more at [Roles (SSAS Tabular)](https://msdn.microsoft.com/library/hh213165.aspx) and [Security Roles (Analysis Services - Multidimensional Data)](https://msdn.microsoft.com/library/ms174840.aspx) on MSDN. And, for the most in-depth understanding of tabular model security, download and read the Securing the [Tabular BI Semantic Model whitepaper](https://msdn.microsoft.com/library/jj127437.aspx).

## What about Azure Active Directory?
Microsoft cloud services use [Azure Active Directory](/azure/active-directory/fundamentals/active-directory-whatis) to take care of authenticating users. Azure Active Directory is the tenant that contains usernames and security groups. Typically, the email address a user signs in with is the same as the UPN of the account.

What is my local Active Directory’s role?

For Analysis Services to determine if a user connecting to it belongs to a role with permissions to read data, the server needs to convert the effective username passed from AAD to the gateway, and onto the Analysis Services server. The Analysis Services server passes the effective username to a Windows Active Directory domain controller (DC). The Active Directory DC then validates the effective username is a valid UPN, on a local account, and returns that user’s Windows username back to the Analysis Services server.

EffectiveUserName cannot be used on a non-domain joined Analysis Services server. The Analysis Services server must be joined to a domain to avoid any login errors.

## How do I tell what my UPN is?
You may not know what your UPN is, and you may not be a domain administrator. You can use the following command from your workstation to find out the UPN for your account.

    whoami /upn

The result will look similar to an email address, but this is the UPN that is on your local domain account. If you are using an Analysis Services data source for live connections, this must match what was passed to EffectiveUserName from the gateway.

## Mapping usernames for Analysis Services data sources
Power BI allows for mapping usernames for Analysis Services data sources. You can configure rules to map a username logged in with Power BI to a name that is passed for EffectiveUserName on the Analysis Services connection. The map user names feature is a great way to work around when your username in AAD doesn't match a UPN in your local Active Directory. For example, if your email address is nancy@contoso.onmicrsoft.com, you could map it to nancy@contoso.com, and that value would be passed to the gateway. You can learn more about how to [map user names](service-gateway-enterprise-manage-ssas.md#map-user-names).

## Synchronize an on-premises Active Directory with Azure Active Directory
You would want your local Active Directory accounts to match Azure Active Directory if you are going to be using Analysis Services live connections. As the UPN has to match between the accounts.

The cloud services only know about accounts within Azure Active Directory. It doesn’t matter if you added an account in your local Active Directory, if it doesn’t exist in AAD, it cannot be used. There are different ways that you can match your local Active Directory accounts with Azure Active Directory.

1. You can add accounts manually to Azure Active Directory.
   
   You can create an account on the Azure portal, or within the Microsoft 365 admin center, and the account name matches the UPN of the local Active Directory account.
2. You can use the [Azure AD Connect](/azure/active-directory/hybrid/how-to-connect-sync-whatis) tool to synchronize local accounts to your Azure Active Directory tenant.
   
   The Azure AD Connect tool provides options for directory synchronization and setting up authentication, including password hash sync, pass-through authentication, and federation. If you are not a tenant admin or a local domain administrator, you will need to contact your IT admin to get this configured.

Using Azure AD Connect ensures that the UPN will match between AAD and your local Active Directory.

> [!NOTE]
> Synchronizing accounts with the Azure AD Connect tool will create new accounts within your AAD tenant.
> 
> 

## Now, this is where the gateway comes in
The gateway acts as a bridge between the cloud and your on-premises server. Data transfer between the cloud and the gateway is secured through [Azure Service Bus](/azure/service-bus-messaging/service-bus-messaging-overview). The Service Bus creates a secure channel between the cloud and your on-premises server through an outbound connection on the gateway.  There are no inbound connections that you need to open on your on-premises firewall. Power BI manages the Service Bus for you, so there are no additional costs or configuration steps required.

If you have an Analysis Services data source, you’ll need to install the gateway on a computer joined to the same forest/domain as your Analysis Services server.

The closer the gateway is to the server, the faster the connection will be. If you can get the gateway on the same server as the data source, that is best to avoid network latency between the gateway and the server.

## What to do next?
After you get the gateway installed, you will want to create data sources for that gateway. You can add data sources within the **Manage gateways** screen. For more information, see the manage data sources articles.

[Manage your data source - Analysis Services](service-gateway-enterprise-manage-ssas.md)  
[Manage your data source - SAP HANA](service-gateway-enterprise-manage-sap.md)  
[Manage your data source - SQL Server](service-gateway-enterprise-manage-sql.md)  
[Manage your data source - Oracle](service-gateway-onprem-manage-oracle.md)  
[Manage your data source - Import/Scheduled refresh](service-gateway-enterprise-manage-scheduled-refresh.md)  

## Where things can go wrong
Sometimes installing the gateway fails. Or, maybe the gateway seems to install ok, but the service is still unable to work with it. In many cases, it’s something simple, like the password for the credentials the gateway uses to sign into the data source.

In other cases, there might be issues with the type of e-mail address users sign in with, or Analysis Services’ inability to resolve an effective username. If you have multiple domains with trusts between them, and your gateway is in one and Analysis Services in another, this sometimes can cause some problems.

Rather than go into troubleshooting gateway issues here, we’ve put a series of troubleshooting steps into another article; [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md). Hopefully, you won’t have any problems. But if you do, understanding how all of this works and the troubleshooting article should help.

<!-- Account and Port information -->
[!INCLUDE [gateway-onprem-accounts-ports-more](./includes/gateway-onprem-accounts-ports-more.md)]

## Next steps

[Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)  
[Azure Service Bus](/azure/service-bus-messaging/service-bus-messaging-overview/)  
[Azure AD Connect](/azure/active-directory/hybrid/how-to-connect-sync-whatis/)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)

