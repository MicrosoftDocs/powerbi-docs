---
title: Private endpoints for secure access to Power BI for on-premises clients
description: Use the Azure private link feature to provide secure access to Power BI using Azure Networking private endpoints, for on-premises clients. Data is sent privately instead of over the Internet.
author: DandanZhang
ms.author: danzhang
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-security
ms.topic: how-to
ms.date: 08/21/2023
ms.custom: 
LocalizationGroup: Administration
---

# Private endpoints for secure access to Power BI for on-premises clients

If you've configured private links for secure access to data in Power BI, using Azure Private Links and Azure Networking private endpoints as described in [Private endpoints for secure access to Fabric](/fabric/security/security-private-links-overview), then you can also enable Azure Virtual Machines to access the Power BI service through private IP addresses.

You can extend your on-premises networks to the Azure Virtual Network (VNet) using an ExpressRoute circuit, or a site-to-site VPN, to access and use services deployed in the Azure Virtual Networks with private connections.

## Understand private endpoints for on-premises clients

When access to the Power BI service from the Virtual Network is already established, described in [Private endpoints for secure access to Fabric](/fabric/security/security-private-links-overview), with few further steps you can extend private access to the Power BI service to on-premises clients.

This article describes the steps you must take to configure such private connectivity between the Azure VNet and the on-premises networks. To successfully complete the configuration, you must already have an ExpressRoute connection successful established, with established communication between the on-premises networks and Azure VNet. For more details about ExpressRoute setup, see [Create and modify an ExpressRoute circuit](/azure/expressroute/expressroute-howto-circuit-portal-resource-manager). 

The following network diagram shows how the configuration works. 

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-01.png" alt-text="Image of private links for on premises clients network diagram.":::

The network diagram includes a handful of components: 
* The Azure VNet
* **Private DNS zone** for the name resolution of Power BI URLs in private endpoint IP Addresses
* **Azure DNS private resolver** to extend the naming resolution of Azure private DNS zones to the on-premises network
* The **ExpressRoute Gateway, ExpressRoute Connection**, and **ExpressRoute circuit** to establish the connectivity between the on-premises network and Azure VNet
* The **on-premises DNS server** for local naming resolution and to forward the DNS requests for the Power BI service to the Azure Private DNS resolver

The following sections describe the steps required to configure connectivity to your existing private endpoints configuration for on-premises clients. 

## Configure connections for on-premises clients

The following list provides an overview of the steps necessary to configure access to the Power BI service from on-premises, through ExpressRoute private peering. Sections following this list provide more detail and examples to help with configuration. 

An overview of the necessary steps is described in the following steps:

1. In the Azure Virtual Network, create a subnet for hosting the ExpressRoute Gateway. The network assigned to the subnet needs to be at least /27 or larger (/26, /25, and so on), as described in the [ExpressRoute documentation](/azure/expressroute/expressroute-howto-add-gateway-portal-resource-manager). The name assignment to the subnet *must* be **GatewaySubnet**; changing or modifying the subnet name will disable your configuration.
2. Deploy an [ExpressRoute gateway](/azure/expressroute/expressroute-howto-add-gateway-portal-resource-manager) in the **GatewaySubnet**. You can deploy the ExpressRoute Gateway in various ways, including in the Azure management portal, PowerShell, Azure CLI, or using REST APIs.
3. Verify your ExpressRoute circuit is already deployed and working, and that private peering is properly configured. To verify, follow the tutorial that explains [how to create Azure private peering](/azure/expressroute/expressroute-howto-routing-portal-resource-manager).
4. Create a connection, the steps for which are described in [this tutorial](/azure/expressroute/expressroute-howto-linkvnet-portal-resource-manager), to link the ExpressRoute Gateway in the VNet to the ExpressRoute circuit.
5. Verify the on-premises hosts or VMs can successfully access the workload or workloads. You can begin by using a simple PING test, but a better verification is to use applications (such as an HTTP/HTTPS connection between on-premises client and a web server in an Azure VM).
6. In the Azure VNet, create two subnets to host the endpoints of the Azure DNS Private Resolver: one subnet for inbound endpoints, one subnet for outbound endpoints.
7. Inside the Azure Virtual Network create an [Azure DNS Private Resolver](/azure/dns/dns-private-resolver-get-started-portal). Inside the Azure DNS Private Resolver, configure the **inbound endpoint**. The inbound endpoint in the Azure DNS Private Resolver enables you to query Azure DNS Private Zones for the Power BI services from an on-premises network.  
8. Configure on-premises DNS Servers with Condition Forwarders for the naming resolution associated to the DNS Private Zones for the Power BI service. 

While many of the previous steps are self explanatory, some merit more explanation. The following sections provide more detail for some of the previous configuration steps.


### Step 6: Create two subnets to host endpoints

The **Azure DNS Private Resolver** uses two subnets: one subnet for the inbound endpoint, and another subnet for the outbound endpoint. For the endpoint subnets of the DNS Private Resolver, you must assign the delegation to **Microsoft.Network/dnsResolvers**. The subnets can only be delegated to **Microsoft.Network/dnsResolvers** and can't be used for other services. Without such delegation, the inbound endpoint creation will fail.

The following screenshot shows how to configure delegation.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-02.png" alt-text="Screenshot of configuring delegation of endpoints.":::

The following screenshot shows another screen demonstrating the delegation.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-03.png" alt-text="Screenshot of another configuration of delegation of endpoints.":::


### Step 7: Create An Azure DNS Private Resolver

To create an **Azure DNS Private Resolver**, to do the Azure Marketplace and search for *DNS private resolver*, and select the result shown in the following screenshot.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-04.png" alt-text="Screenshot of Azure DNS Private Resolver in the Azure Marketplace.":::

Configure the Azure DNS Private Resolver to the VNet. The DNS Private Resolver and the VNet must exist in the same Azure region.

The Azure DNS Private Resolver is based on two components: inbound endpoints and outbound endpoint. For naming resolution of Power BI URLs in the on-premises hosts/VMs, only the inbound endpoint is required. The following image shows where you can configure the inbound endpoints.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-05.png" alt-text="Screenshot of where to configure the inbound endpoints.":::

An inbound endpoint enables name resolution from on-premises devices using an IP address that's part of your private VNet address space. In the **Azure Management** portal, in the DNS private resolver, select **inbound endpoints** as shown in the previous image, then select **Add an endpoint** as shown in the following screenshot.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-06.png" alt-text="Screenshot of where to add inbound endpoints.":::

Next you assign an *endpoint name* and select the subnet you defined in previous step, as shown in the following screenshot:

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-07.png" alt-text="Screenshot of naming and assigning an endpoint.":::

Once the process of deployment of inbound endpoint is completed, an IP address is automatically associated to the inbound endpoint.

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-08.png" alt-text="Screenshot of an IP address automatically being assigned to an endpoint.":::

In this example, and shown in the previous screenshot, the IP address assigned to the inbound endpoint is 10.7.2.4. That assigned IP address is used in step 8 as Conditional Forwarder IP in the on-premises DNS server, described in more detail in the following section.


### Step 8: Configure on-premises DNS servers

To properly resolve your Azure Private DNS zones from on-premises, define the Conditional Forwarders associated with the Power BI service in your on-premises DNS server configuration. 

The IP address of each Conditional Forwarder points to the IP address of the inbound endpoint in the Azure DNS Private Resolver.

The following screenshot shows an example of DNS Conditional Forwarder entries in Windows server. 

:::image type="content" source="media/service-security-private-links-on-premises/service-security-private-links-on-premises-09.png" alt-text="Screenshot of an IP address used for the conditional forwarder.":::


## Verification of successful configuration

As final step for your configuration, sign in to the on-premises Windows client and perform a verification by using nslookup. If properly configured, you'll receive a response similar to the following message.

```
C:\ > nslookup <tenant-object-id-without-hyphens>-api.privatelink.analysis.windows.net
Server:  UnKnown
Address:  10.1.21.10           <- IP address of on-premises DNs server
Non-authoritative answer:
Name:    <tenant-object-id-without-hyphens>-api.privatelink.analysis.windows.net
Address:  10.7.0.5              
```

The Power BI service URL is translated into the private IP that's assigned to the private endpoint, which is configured in the VNet and connected to the Power BI service.


## Considerations and limitations

* You must configure private endpoints before enabling private endpoints for on-premises clients. See [Private endpoints for secure access to Fabric](/fabric/security/security-private-links-overview) for more information.

## Related content

- [Private endpoints for secure access to Fabric](/fabric/security/security-private-links-overview)
- [Create and modify an ExpressRoute circuit](/azure/expressroute/expressroute-howto-circuit-portal-resource-manager)
- [ExpressRoute documentation](/azure/expressroute/expressroute-howto-add-gateway-portal-resource-manager)
- [ExpressRoute gateway](/azure/expressroute/expressroute-howto-add-gateway-portal-resource-manager)
- [How to create Azure private peering](/azure/expressroute/expressroute-howto-routing-portal-resource-manager)
- [Azure DNS Private Resolver](/azure/dns/dns-private-resolver-get-started-portal)

More questions? [Ask the Power BI Community](https://community.powerbi.com).
