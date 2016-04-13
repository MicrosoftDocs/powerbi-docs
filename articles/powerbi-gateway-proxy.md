<properties
pageTitle="Configurating proxy settings"
description="Information regarding configuration of proxy settings for the personal and enterprise gateways."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
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
ms.date="04/13/2016"
ms.author="asaxton"/>
# Configuring proxy settings for the Power BI Gateways

Your work environment may require that you go through a proxy to access the internet. This could prevent the Power BI Gateway from connecting to the service.

## Does your network use a proxy?

The following post on superuser.com discusses how you can try to determine if you have a proxy on your network.

[How do I know what proxy server I'm using? (SuperUser.com)](https://superuser.com/questions/346372/how-do-i-know-what-proxy-server-im-using)

## Configuration file location and default configuration

Proxy information is configured within a .NET configuration file. The location, and file names, will be different depending on the gateway you are using.

### Power BI Gateway - Enterprise

There are two main configuration files that are involved with the enterprise gateway.

**Configuration**

The first is for the configuration screens that actually configure the gateway. If you are having issues configuring the gateway, this is the file you will want to look at.

    C:\Program Files\Power BI Enterprise Gateway\enterprisegatewayconfigurator.exe.config

**Windows Service**

The second is for the actual windows service that interacts with the Power BI service, and handles the requests.

    C:\Program Files\Power BI Enterprise Gateway\Microsoft.PowerBI.EnterpriseGateway.exe.config

### Power BI Gateway - Personal

The personal gateway can be installed in one of two ways. As a windows service (admin) or as a user mode application. This is determined during installation. As a result, your configuration files may be in one of two locations depending on how the gateway was installed. You will want to check both locations.

**Configuration**

The first is for the configuration screens that actually configure the gateway. If you are having issues configuring the gateway, this is the file you will want to look at.

For the *windows service*, it will be the following.

    C:\Program Files\Power BI Personal Gateway\1.0\Configurator\GWConfig.exe.config
    C:\Program Files\Power BI Personal Gateway\1.0\Configurator\PowerBIGatewayAgentCmdLine.exe.config

For the *user mode application*, it will be the following.

    C:\Users\<user>\AppData\Local\Power BI Gateway - Personal \1.0\Configurator\GWConfig.exe.config
    C:\Users\<user>\AppData\Local\Power BI Gateway - Personal \1.0\Configurator\PowerBIGatewayAgentCmdLine.exe.config

**Windows Service**

The second is for the actual windows service that interacts with the Power BI service, and handles the requests.

For the *windows service*, it will be the following.

    C:\Program Files\Power BI Personal Gateway\1.0\Gateway\diawp.exe.config

For the *user mode application*, it will be the following.

    C:\Users\<user>\AppData\Local\Power BI Gateway - Personal \1.0\Gateway\diawp.exe.config

## Configuring proxy settings

The default proxy configuration is the following.

    <system.net>
        <defaultProxy useDefaultCredentials="true" />
    </system.net>

The default configuration works with windows authentication. If your proxy uses another form of authentication, you will need to change the settings. If you are not sure, you should contact your network administrator.

To learn more about the configuration of the proxy elements for .NET configuration files, see [<defaultProxy> Element (Network Settings)](https://msdn.microsoft.com/library/kd3cf2ex.aspx)
