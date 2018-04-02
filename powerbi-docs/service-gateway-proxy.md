---
title: Configuring proxy settings for the On-premises data gateway
description: Information regarding configuration of proxy settings for the On-premises data gateway.
services: powerbi
documentationcenter: ''
author: davidiseminger
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
ms.date: 11/21/2017
ms.author: davidi

LocalizationGroup: Gateways
---
# Configuring proxy settings for the On-premises data gateway
Your work environment may require that you go through a proxy to access the internet. This could prevent the On-premises data gateway from connecting to the service.

## Does your network use a proxy?
The following post on superuser.com discusses how you can try to determine if you have a proxy on your network.

[How do I know what proxy server I'm using? (SuperUser.com)](https://superuser.com/questions/346372/how-do-i-know-what-proxy-server-im-using)

## Configuration file location and default configuration
Proxy information is configured within a .NET configuration file. The location, and file names, will be different depending on the gateway you are using.

### On-premises data gateway
There are two main configuration files that are involved with the On-premises data gateway.

**Configuration**

The first is for the configuration screens that actually configure the gateway. If you are having issues configuring the gateway, this is the file you will want to look at.

    C:\Program Files\On-premises data gateway\enterprisegatewayconfigurator.exe.config

**Windows Service**

The second is for the actual windows service that interacts with the Power BI service, and handles the requests.

    C:\Program Files\On-premises data gateway\Microsoft.PowerBI.EnterpriseGateway.exe.config

## Configuring proxy settings
The default proxy configuration is the following.

    <system.net>
        <defaultProxy useDefaultCredentials="true" />
    </system.net>

The default configuration works with Windows authentication. If your proxy uses another form of authentication, you will need to change the settings. If you are not sure, you should contact your network administrator.

To learn more about the configuration of the proxy elements for .NET configuration files, see [defaultProxy Element (Network Settings)](https://msdn.microsoft.com/library/kd3cf2ex.aspx).

## Changing the gateway service account to a domain user
When configuring the proxy settings to use default credentials, as explained above, you may encounter authentication issues with your proxy. This is because the default service account is the Service SID and not an authenticated domain user. You can change the service account of the gateway to allow proper authentication with your proxy.

> [!NOTE]
> It is recommended that you use a managed service account to avoid having to reset passwords. Learn how to create a [managed service account](https://technet.microsoft.com/library/dd548356.aspx) within Active Directory.
> 
> 

### Change the On-premises data gateway service account
1. Change the Windows service account for the **On-premises data gateway service**.
   
    The default account for this service is *NT SERVICE\PBIEgwService*. You will want to change this to a domain user account within your Active Directory domain. Or, you will want to use a managed service account to avoid having to change the password.
   
    You will want to change the account on the **Log On** tab within the properties of the Windows service.
2. Restart the **On-premises data gateway service**.
   
    From an admin command prompt, issue the following commands.
   
        net stop PBIEgwService
   
        net start PBIEgwService
3. Start the **On-premises data gateway configurator**. You can select the windows start button and search for *On-premises data gateway*.
4. Sign in to Power BI.
5. Restore the gateway using your recovery key.
   
    This will allow the new service account to be able to decrypt stored credentials for data sources.

## Next steps
[On-premises data gateway (personal mode)](service-gateway-personal-mode.md)
[Firewall information](service-gateway-onprem-tshoot.md#firewall-or-proxy)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)

