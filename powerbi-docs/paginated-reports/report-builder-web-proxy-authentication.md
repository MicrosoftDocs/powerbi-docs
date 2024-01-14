---
title: Use default system credentials for web proxy
description: Learn how system or network administrators can allow the use of default system credentials for web proxy authentication in Power BI Report Builder.
author: maggiesMSFT
ms.author: maggies
ms.date: 02/08/2023
ms.service: powerbi
ms.subservice: report-builder
ms.topic: troubleshooting
---

# Use default system credentials for web proxy in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../includes/applies-yes-report-builder-no-desktop.md)] 

Web requests issued by Power BI Report Builder don't use web proxy credentials. In networks that use a proxy server, Report Builder might not be able to successfully make web requests. You might see the error: "The remote server returned an error: (407) Proxy Authentication Required."

System or network administrators can allow the use of default system credentials for web proxy authentication. Administrators can create a *REG_DWORD* registry entry called **UseDefaultCredentialsForProxy**, and set the value to one (1) to allow the use of default system credentials for web proxy authentication.

The registry entry can be placed in the following location using the Windows Registry Editor. If the **Microsoft Power BI Report Builder** registry key doesn't exist, you need to create it.

`[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft Power BI Report Builder]`

After you create the registry entry, you might need to reboot. From then on, when Power BI Report Builder makes web requests, it uses the proxy settings that are defined for your web browser.

As with any change to proxy or credential settings, there are security implications to creating this registry entry. Administrators must make sure they have configured the proxy settings correctly before they allow this feature.

## Considerations and limitations

For administrators, there are security implications to consider before allowing this capability. Follow these recommendations whenever using this feature for clients:

- Only use **Negotiation** as the authentication scheme for the proxy server, to ensure only proxy servers that are joined to the Active Directory network are used by the client. 
- Don't use **NTLM fallback** on clients that use this feature.
- If users aren't on a network with a proxy when admins enable and configure this feature as recommended in this article, the process of attempting to contact the proxy server and using default system credentials isn't used.

## Related content

- [What are paginated reports in Power BI?](paginated-reports-report-builder-power-bi.md)


