---
title: Private endpoints for secure access to Power BI
description: Use the Azure private link feature to provide secure access to Power BI using Azure Networking private endpoints. Data is sent privately instead of over the internet.
author: DandanZhang
ms.author: danzhang
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-security
ms.topic: how-to
ms.date: 12/06/2023
ms.custom: video--3yFtlZBpqs
LocalizationGroup: Administration
---

# Private endpoints for secure access to Power BI

You can use private links to provide secure access for data traffic in Power BI. In this configuration, Azure Private Link and Azure Networking private endpoints are used to send data traffic privately using Microsoft's backbone network infrastructure instead of going across the internet.

When private link connections are used, those connections go through the Microsoft private network backbone when Power BI users access resources in the Power BI service.

To learn more about Azure Private Link, see [What is Azure Private Link](/azure/private-link/private-link-overview).

Enabling private endpoints has an impact on many items, so you should review the [considerations and limitations](#considerations-and-limitations) section in this article before enabling private endpoints.

>[!IMPORTANT]
>Private endpoints are not supported for most items in Microsoft Fabric, including Microsoft Fabric trial capacities. When the tenant setting **Block public Internet access** is **enabled** you can continue using Power BI semantic models and pipelines, but other items will be disabled or return errors, and third-party application access to OneLake APIs will also be blocked. When **Block public Internet access** is **disabled** and the tenant setting **Azure Private Link** is **enabled**, you may run into errors when using Fabric items from the private-link-setup machine. 

## Understand private endpoints

Private endpoints guarantee that traffic going *into* your organization’s Power BI items, such as reports or workspaces, always follow your organization's configured private link network path. User traffic to your Power BI items must come from the established private link. You can configure Power BI to deny all requests that don’t come from the configured network path.

Private endpoints *do not* guarantee that traffic from Power BI to your external data sources, whether in the cloud or on premises, is secured. Configure firewall rules and virtual networks to further secure your data sources.

### Power BI and private endpoint integration

Powered by Azure Private Link, a private endpoint for Power BI is a network interface that connects you privately and securely to the Power BI service.

Private endpoint integration allows platform as a service (PaaS) to be deployed and accessed privately from a customer's virtual and on-premises networks, while the service is still running outside of the customer’s network. A private endpoint is a single, directional technology that lets clients initiate connections to a given service, but doesn't allow the service to initiate a connection into the customer network. This private endpoint integration pattern provides management isolation, since the service can operate independently of customer network policy configuration. For multi-tenant services, this private endpoint model provides link identifiers to prevent access to other customers' resources hosted within the same service. When you use private endpoints, only a limited set of other PaaS resources can be accessed from services using the integration.  

The Power BI service implements private endpoints, and not service endpoints.  

Using private endpoints with Power BI provides the following benefits:

1. Private endpoints ensure that traffic flows over the Azure backbone to a private endpoint for Azure cloud-based resources.

2. Network traffic isolation from non-Azure based infrastructure, such as on-premises access, requires customers to have ExpressRoute or a virtual private network (VPN) configured.  

## Use secure private endpoints to access Power BI

In Power BI, you can configure and use an endpoint that allows your organization to access Power BI privately. To configure private endpoints, you must be a Fabric administrator and have permissions in Azure to create and configure resources such as virtual machines (VMs) and virtual networks (V-Net).

The steps that allow you to securely access Power BI from private endpoints are:

1. [Set up private endpoints for Power BI](#enable-private-endpoints-for-power-bi).
2. [Create a Power BI resource in the Azure portal](#create-a-power-bi-resource-in-the-azure-portal).
3. [Create a virtual network](#create-a-virtual-network).
4. [Create a virtual machine (VM)](#create-a-virtual-machine-vm).
5. [Create a private endpoint](#create-a-private-endpoint).
6. [Connect to a VM using Remote Desktop (RDP)](#connect-to-a-vm-using-remote-desktop-rdp).
7. [Access Power BI privately from the virtual machine](#access-power-bi-privately-from-the-vm).
8. [Disable public access for Power BI](#disable-public-access-for-power-bi).

The following sections provide additional information for each step.

### Enable private endpoints for Power BI

To get started, sign in to the [Power BI service](https://app.powerbi.com) as an administrator, then perform the following steps:

1. From the page header, select **Settings** > **Admin portal**.

    :::image type="content" source="media/service-security-private-links/power-bi-admin-portal.png" alt-text="Screenshot of the Admin portal option in the Settings menu.":::

1. Select **Tenant settings** and scroll to  **Advanced Networking**. Switch the **Azure Private Link** toggle to **Enabled**.

    :::image type="content" source="media/service-security-private-links/service-private-links-01.png" alt-text="Screenshot of the Azure Private Link switch under Advanced networking.":::

It takes about 15 minutes to configure a private link for your tenant, which includes configuring a separate FQDN for the tenant in order to communicate privately with Power BI services.

After this process is finished, you can move on to the next step.

### Create a Power BI resource in the Azure portal

1. Sign into the [Azure portal](https://portal.azure.com) and then select **Create a resource**. Under **Template deployment**, select **Create**.

    :::image type="content" source="media/service-security-private-links/azure-create-template-1.png" alt-text="Screenshot of the Create template link in the Create a resource section.":::

2. Select **Build your own template in the editor**.

    :::image type="content" source="media/service-security-private-links/azure-create-template-2.png" alt-text="Screenshot of the Build your own template option.":::

3. Replace the parameters in the Azure Resource Manager (ARM) template example, shown in the following table, to create a Power BI resource.

    | Parameter | Value |
    |---------|---------|
    |`<resource-name>`    | myPowerBIResource         |
    |`<tenant-object-id>`     | [Find your tenant ID in the Azure portal](/azure/active-directory/fundamentals/active-directory-how-to-find-tenant) |

    Create the ARM template.

    ```
    {
      "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
      "contentVersion": "1.0.0.0",
      "parameters": {},
      "resources": [
          {
              "type":"Microsoft.PowerBI/privateLinkServicesForPowerBI",
              "apiVersion": "2020-06-01",
              "name" : "<resource-name>",
              "location": "global",
              "properties" : 
              {
                   "tenantId": "<tenant-object-id>"
              }
          }
      ]
    }
    ```

    If you're using an Azure Government cloud, location should be the region name of the tenant. For example, if the tenant is in US Gov Texas, you should put  "location": "usgovtexas" in the ARM template. The list of Power BI US Government regions can be found in the [Power BI for US government article](../enterprise/service-govus-overview.md#connect-government-and-global-azure-cloud-services).

4. On the review screen, select **Create** to accept the terms and conditions.

    :::image type="content" source="media/service-security-private-links/azure-create-template-3.png" alt-text="Screenshot of the Azure Marketplace Terms.":::

### Create a virtual network

The next step is to create a virtual network and subnet. The number of IP address your subnet will need is made up of the number of capacities on your tenant plus three. For example, if you're creating a subnet for a tenant with seven capacities, you'll need ten IP addresses.

Replace the sample parameters in the following table with your own to create a virtual network and subnet.

| Parameter | Value | 
|---------|---------|
| `<resource-group-name>`	| myResourceGroup |
| `<virtual-network-name>`	| myVirtualNetwork |
| `<region-name>`	| Central US  |
| `<address-space>`	| 10.0.0.0/16 |
| `<subnet-name>`	| mySubnet |
| `<subnet-address-range>`	| 10.0.0.0/24 |

1. On the upper-left side of the screen in your Azure portal, select **Create a resource > Networking > Virtual network** or search for **Virtual network** in the search box.

2. In **Create virtual network**, enter or select the following information in the **Basics** tab:

    |Settings |	Value |
    |-------------------|---------|
    |**Project details**|
    |Subscription |	Select your Azure Subscription |
    |Resource group | Select **Create new**, enter `<resource-group-name>`, then select **OK**, or select an existing `<resource-group-name>` based on parameters. |
    |**Instance details** |
    |Name	| Enter `<virtual-network-name>` |
    |Address space	| Enter `<address-space>` |
    |Subnet name | Enter `<subnet-name>` |
    |Subnet address range | Enter `<subnet-address-range>` |
    |Region | Select `<region-name>` |

    The following image shows the **Basics** tab.

    :::image type="content" source="media/service-security-private-links/create-virtual-network.png" alt-text="Screenshot of the Basics tab in Create a virtual network.":::

3. Select **Save**, then select **Review + create** > **Create**.

After you complete these steps, you can create a VM, as described in the next section.

### Create a virtual machine (VM)

The next step is to create a VM.

1. On the upper-left side of the screen in your Azure portal, select **Create a resource > Compute > Virtual Machine**.

2. In the **Basics** tab, enter or select the following information:

    |Settings |	Value |
    |-------------------|---------|
    |**Project details**||
    |Subscription |	Select your Azure Subscription |
    |Resource group |	Select **myResourceGroup** which you created in the previous section |
    |**Instance details** ||
    |VM name | Enter **myVm** |
    |Region | Select **West US** |
    |Availability options| Leave the default **No infrastructure redundancy required** |
    |Image | Select **Windows 10 Pro** |
    |Size | Leave the default **Standard DS1 v2** |
    |ADMINISTRATOR ACCOUNT ||
    |Username | Enter a username of your choosing |
    |Password | Enter a password of your choosing. The password must be at least 12 characters long and meet the [defined complexity requirements](/azure/virtual-machines/windows/faq#what-are-the-password-requirements-when-creating-a-vm) |
    |Confirm password | Reenter password |
    |INBOUND PORT RULES ||
    |Public inbound ports | Leave the default **None** |
    |LICENSING ||
    |I have an eligible Windows 10/11 license | Check the box |

3. Select **Next: Disks**.

4. In the **Disks** tab, leave the defaults and select **Next: Networking**.

5. In the **Networking** tab, select the following information:

    |Settings |	Value |
    |-------------------|---------|
    |Virtual network|	Leave the default **MyVirtualNetwork**|
    |Address space|	Leave the default **10.0.0.0/24**|
    |Subnet	|Leave the default **mySubnet (10.0.0.0/24)**|
    |Public IP|	Leave the default **(new) myVm-ip**|
    |Public inbound ports|	Select **Allow selected **|
    |Select inbound ports|	Select **RDP**|

6. Select **Review + create**. You're taken to the **Review + create** page where Azure validates your configuration.

7. When you see the **Validation passed** message, select **Create**.

### Create a private endpoint

The next step is to create a private endpoint for Power BI.

1. On the upper-left side of the Azure portal screen **Create a resource > Networking > Private Link**.

2. In **Private Link Center - Overview**, under the option to **Build a private connection to a service**, select **Create private endpoint**.

3. In the **Create a private endpoint - Basics** tab, enter or select the following information:

    |Settings |	Value |
    |-------------------|---------|
    |**Project details** ||
    |Subscription| Select your Azure Subscription|
    |Resource group| Select **myResourceGroup**. You created this in the previous section|
    |**Instance details** ||
    |Name| Enter *myPrivateEndpoint*. If this name is taken, create a unique name|
    |Region| Select **West US**|

    The following image shows the **Create a private endpoint - Basics** window.

    :::image type="content" source="media/service-security-private-links/service-private-links-06.png" alt-text="Screenshot of the Basics tab in Create a private endpoint.":::

4. Once that information is complete, select **Next: Resource** and in the **Create a private endpoint - Resource** page, enter or select the following information:

    |Settings |	Value |
    |-------------------|---------|
    |Connection method|	Select connect to an Azure resource in my directory|
    |Subscription|	Select your subscription|
    |Resource type|	Select **Microsoft.PowerBI/privateLinkServicesForPowerBI** |
    |Resource|	myPowerBIResource|
    |Target sub-resource|	Tenant|

    The following image shows the **Create a private endpoint - Resource** window.

    :::image type="content" source="media/service-security-private-links/service-private-links-07.png" alt-text="Screenshot of the Resource tab in Create a private endpoint.":::

5. Once that information is properly input, select **Next: Configuration** and in the **Create a private endpoint - Configuration** and enter or select the following information:

    |Settings |	Value |
    |-------------------|---------|
    |**NETWORKING** ||
    |Virtual network|	Select *myVirtualNetwork* |
    |Subnet	|Select *mySubnet* |
    |**PRIVATE DNS INTEGRATION** ||
    |Integrate with private DNS zone|	Select **Yes** |
    |Private DNS Zone	|Select <br> *(New)privatelink.analysis.windows.net* <br> *(New)privatelink.pbidedicated.windows.net* <br> *(New)privatelink.prod.powerquery.microsoft.com* |

    The following image shows the **Create a private endpoint - Configuration** window.

    :::image type="content" source="media/service-security-private-links/service-private-links-08.png" alt-text="Screenshot of the Configuration tab in Create a private endpoint.":::

    Next select **Review + create**, which displays the **Review + create** page where Azure validates your configuration. When you see the **Validation passed** message, select **Create**.

### Connect to a VM using Remote Desktop (RDP)

After you create your VM, called **myVM**, connect to it from the internet using the following steps:

1. In the portal's search bar, enter *myVm*.

2. Select the **Connect** button, and choose **RDP** from the dropdown menu.

3. Enter an IP address, then select **Download RDP File**. Azure creates a Remote Desktop Protocol (.rdp) file and downloads it to your computer.

4. Open the *.rdp* file to start Remote Desktop Connection, then select **Connect**.

5. Enter the username and password you specified when creating the VM in the previous step.

6. Select **OK**.

7. You might receive a certificate warning during the sign-in process. If you receive a certificate warning, select **Yes** or **Continue**.

### Access Power BI privately from the VM

The next step is to access Power BI privately, from the virtual machine you created in the previous step, using the following steps: 

1. In the Remote Desktop of myVM, open PowerShell.

2. Enter `nslookup <tenant-object-id-without-hyphens>-api.privatelink.analysis.windows.net`.

3. You receive a response similar to the following message:

    ```
    Server:  UnKnown
    Address:  168.63.129.16
    
    Non-authoritative answer:
    Name:    52d40f65ad6d48c3906f1ccf598612d4-api.privatelink.analysis.windows.net
    Address:  10.5.0.4
    ```

4. Open the browser and go to *app.powerbi.com* to access Power BI privately.

### Disable public access for Power BI

Finally, you can optionally disable public access for Power BI. 

If you disable public access for Power BI, certain constraints on access to Power BI services are put into place, described in the next section.

>[!IMPORTANT]
>When you turn on *Block Internet Access*, Microsoft Fabric is disabled.

To disable public access for Power BI, sign to the [Power BI](https://app.powerbi.com) service as an administrator, and navigate to the **Admin portal**. Select **Tenant settings** and scroll to the **Advanced networking** section. Enable the toggle button in the **Block Public Internet Access** section, as shown in the following image. It takes approximately 15 minutes for the system to disable your organization's access to Power BI from the public Internet.

## Completion of private endpoint configuration

Once you've followed the steps in the previous sections and the private link is successfully configured, your organization implements private links based on the following configuration selections, whether the selection is set upon initial configuration or subsequently changed. 

If Azure Private Link is properly configured and **Block public Internet access** is **enabled**:

* Power BI is only accessible for your organization from private endpoints, and is not accessible from the public Internet.
* Traffic from the virtual network targeting endpoints and scenarios that support private links are transported through the private link.
* Traffic from the virtual network targeting endpoints and scenarios that do *not* support private links will be blocked by the service, and will not work.
* There may be scenarios that do not support private links, which therefore will be blocked at the service when **Block public Internet access** is enabled.

If Azure Private Link is properly configured and **Block public Internet access** is **disabled**:

* Traffic from the public Internet will be allowed by Power BI services
* Traffic from the virtual network targeting endpoints and scenarios that support private links are transported through the private link.
* Traffic from the virtual network targeting endpoints and scenarios that do *not* support private links are transported through the public Internet, and will be allowed by Power BI services.
* If the virtual network is configured to block public Internet access, scenarios which do not support private links will be blocked by the virtual network, and will not work.

## Considerations and limitations

There are a few considerations to keep in mind while working with private endpoints in Power BI:

* Power BI supports up to 200 capacities in the private link enabled tenant
* When private link is turned on in the admin portal, tenant migration will be blocked.
* Any uses of external images or themes aren't available when using a private link environment.
* If internet access is disabled, and if the dataset or dataflow connects to a Power BI dataset or dataflow as a data source, the connection fails.
* Each private endpoint can be connected to one tenant only.  You can't set up a private link to be used by more than one tenant. 
* Datamarts don't currently support private links using SSMS. Private link connections using SSMS will be rejected if **Block Public Internet Access** is enabled.
* If your organization is using **Azure Private Link** in Power BI, modern usage metrics reports will contain partial data (only Report Open events). A current limitation when transferring client information over private links prevents Power BI from capturing Report Page Views and performance data over Private Links. If your organization uses **Azure Private Link** and **Block Public Internet Access** in Power BI, the refresh for the dataset fails and the usage metrics report doesn't show any data.
* Publish to Web is not supported when you enable **Azure Private Link** in Power BI.
* Email subscriptions are not supported when you enable **Block Public Internet Access** in Power BI.  
* [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) doesn't currently support Private Links. This means that in [Power BI Desktop](service-security-sensitivity-label-overview.md#sensitivity-labels-in-power-bi-desktop) running in an isolated network, the Sensitivity button will be grayed out, label information will not appear, and decryption of *.pbix* files will fail.

   To enable these capabilities in Power BI Desktop, admins can configure [service tags](/azure/virtual-network/service-tags-overview) for the underlying services that support MIP, [EOP](/azure/virtual-network/service-tags-overview#eopexternalpublishedips), and AIP. Make sure you understand the implications of using service tags in a private links isolated network.
 * **For Power BI users**, On-premise Data Gateway is not supported and fails to register when private links are enabled. To run GW configurator successfully, they must disable private links.
 * **For non-PowerBI (PowerApps or LogicApps) Gateway users**, the gateway does not work properly when private links are enabled. A potential workaround is to turn off private links, configure the gateway in a remote region (a region other than the recommended region), then re-enable the private links. After the private links are re-enabled, the gateway in the remote region won't use private links.

* Private links resource REST APIs don't support tags.
* Exporting a Power BI report as PDF or PowerPoint is not supported when you enable Azure Private Link in Power BI.
* The following URLs must be accessible from the client browser which are required for auth:

    * `login.microsoftonline.com`
    * `aadcdn.msauth.net`
    * `msauth.net`
    * `msftauth.net`
    * `graph.microsoft.com`
    * `login.live.com`, though this may be different based on account type.

## Related content

- [Administering Power BI in your Organization](../admin/service-admin-administering-power-bi-in-your-organization.md)  
- [Understanding Power BI administration roles](../admin/service-admin-role.md)  
- [Track user activities in Power BI](../admin/service-admin-auditing.md)  
- [How to find your Microsoft Entra tenant ID](/azure/active-directory/fundamentals/active-directory-how-to-find-tenant)

The following video shows how to connect a mobile device to Power BI, using private endpoints:

> [!NOTE]  
> This video might use earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.youtube.com/embed/-3yFtlZBpqs]

More questions? [Ask the Power BI Community](https://community.powerbi.com).
