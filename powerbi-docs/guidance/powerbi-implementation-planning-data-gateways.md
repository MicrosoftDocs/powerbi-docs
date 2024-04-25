---
title: "Power BI implementation planning: Data gateways"
description: "Learn how to plan and implement on-premises data gateways and virtual network (VNet) data gateways for Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 02/13/2024
---

# Power BI implementation planning: Data gateways

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan and implement on-premises data gateways and virtual network (VNet) data gateways for Microsoft Fabric. It's primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators might need to collaborate with Power Platform administrators, database administrators, information security teams, networking teams, and other relevant teams.
- **Gateway administrators:** The individuals who are responsible for implementing, managing, and monitoring gateways and their data source connections.
- **Gateway contributors:** The decentralized teams and individuals who are responsible for adding and managing gateway data source connections.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for supporting users that need to access, connect to, and refresh data.
- **Content owners and creators:** The teams and individuals who use gateways to connect to their data sources and refresh Fabric data items.

To access source data for Power BI semantic models, dataflows, and other Fabric data items, you might need a _data gateway_. A [data gateway](/power-bi/connect-data/service-gateway-onprem) securely transfers data between private networks or on-premises data sources and cloud services, including Fabric.

> [!NOTE]
> This article provides an overview of gateways. It focuses on key considerations and actions for planning and implementing gateways to support your Fabric content.
>
> For more information about how gateways work, see:
>
> - [What is an on-premises data gateway?](/data-integration/gateway/service-gateway-onprem)
> - [On-premises gateway architecture](/data-integration/gateway/service-gateway-onprem-indepth)
> - [Virtual network (VNet) gateway architecture](/data-integration/vnet/data-gateway-architecture)
> - [Plan, scale, and maintain a business-critical gateway solution](/data-integration/gateway/plan-scale-maintain)

## Plan key decisions

Gateways are often integral to successful Power BI and Fabric implementations. A COE or central data and BI team typically plans and centrally manages gateways, although some organizations use decentralized teams to manage gateways. To mitigate the possibility of future disruption and governance risks, it's important to carefully plan how and when you'll use gateways.

You typically plan gateway implementation during two distinct stages.

- **[Tenant setup](powerbi-implementation-planning-tenant-setup.md):** When you prepare to implement, or [migrate](powerbi-migration-overview.md) to, Fabric, you should assess whether any data sources need a gateway. Gateway planning activities are also relevant for tenant-level planning of [security](powerbi-implementation-planning-security-tenant-level-planning.md), [workspaces](powerbi-implementation-planning-workspaces-tenant-level-planning.md), and [auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#data-gateway-module).
- **[BI solution planning](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md):** When planning a new BI solution, you should evaluate whether the solution requires a gateway while you gather [technical requirements](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#gather-technical-requirements) for the new solution. You might also need a gateway when adding a new data source to an existing solution.

Planning a gateway implementation begins by making key decisions, starting with whether you need a gateway or not.

> [!TIP]
> First, create an inventory of your data sources. You should evaluate the following key decisions for each data source. Be sure to document your results and store them in a central location that's easily accessible, like a [communication hub](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#create-a-communication-hub) or your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal).

### Identify whether you need a gateway

In general, you need a gateway for your data source when:

- Your data source is located on-premises.
- Your data source is located in a private network.
- You require a host for connector software.
- You require security isolation for certain connectors or functions.

In these situations, you need a gateway to:

- **Refresh data in the Fabric portal.** This scenario applies when a content creator sets up data refresh in the Power BI service for a data source that requires a gateway.
- **Create content in the Fabric portal.** This scenario applies when a content author creates or modifies data items (like a semantic model or dataflow) in the Power BI service that require a gateway.
- **Support DirectQuery connections.** This scenario applies when a content creator publishes a semantic model that includes DirectQuery (or Dual) storage mode tables, and the data source for those tables requires a gateway. This usage scenario also covers the ability to enforce per-user data permissions that are defined in the data source. For example, a SQL Server database [can enforce row-level security (RLS)](/sql/relational-databases/security/row-level-security?view=sql-server-ver16&preserve-view=true), and Power BI can manage [single sign-on (SSO) connectivity](/power-bi/connect-data/service-gateway-sso-overview). For more information, see [Enforce data security based on consumer identity](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity).
- **Live connect to SQL Server Analysis Services.** This scenario applies when a content creator publishes a report that uses a [live connection](/power-bi/connect-data/service-live-connect-dq-datasets#live-connection) to a SQL Server Analysis Services (SSAS) database.

The following sections describe when you need a gateway.

#### On-premises data sources

You need a gateway to connect to on-premises data sources from the Fabric portal. The gateway serves as a bridge, evaluating query expressions on the gateway machine and securely transferring on-premises data to the cloud.

This scenario is relevant when connecting to:

- Data sources that reside on on-premises machines.
- Files stored in a local directory.
- Cloud and on-premises data sources that are combined in a single query.
- A cloud-based virtual machine (VM)—known as infrastructure as a service, or IaaS.

#### Private network data sources

You need a gateway to connect to data sources that are located in a private network, such as an [Azure Virtual Network (Azure VNet)](/azure/virtual-network/virtual-networks-overview). A virtual network, or VNet, is a logically isolated segment of a network that insulates traffic from the public internet. A VNet provides enhanced network security.

This scenario is relevant when the data source:

- Resides in a data center within a private network, such as the organizational network (or is behind a firewall).
- Is a cloud-based VM within a VNet (known as infrastructure as a service, or IaaS).
- Is a cloud-based database service within a VNet (known as platform as a service, or PaaS).

> [!NOTE]
> It's a common misconception that you don't need a gateway for cloud data sources. When a cloud data source resides within a private organizational network, a gateway is required.

#### Host connector software

Sometimes you might need a gateway to host supporting items that are required to connect to your data source. This software might include [custom data connectors](/power-bi/connect-data/service-gateway-custom-connectors), drivers, or libraries that you install on the gateway machine. The Power BI service doesn't have access to this software, so it's unable to refresh data sources that use it without relying on the gateway—even when you're connecting to a cloud data source.

This scenario is relevant when you connect to a data source with connectors such as a:

- **Driver.** An official connector could require installation of prerequisite drivers. For example, when connecting to an [Oracle](/power-query/connectors/oracle-database#prerequisites) database, you might need the Oracle Data Access Client software.
- **Custom connector.** Some data sources might require custom or third-party connectors. For example, you might need a [custom connector](/power-bi/connect-data/desktop-connector-extensibility) to connect to a legacy or proprietary system.
- **Client library.** Some data sources might require a supporting library to allow client tools to connect to it. For example, when connecting to an Analysis Services database, a [client library](/analysis-services/client-libraries) must be installed.
- **ODBC or OLE DB connector.** An official connector might require an ODBC driver or OLE DB provider. For example, when connecting to [SAP HANA](/power-query/connectors/sap-hana/overview#prerequisites), you'll need an ODBC driver.

> [!IMPORTANT]
> When content creators use a client tool such as Power BI Desktop and their solutions rely on drivers, connectors, or providers, you should install the same components on the gateway machine as are installed on the content creators machines. Missing or mismatched components between creator machines and data gateways is a common reason for data refresh failures of published content. For more information, see [User tools and devices](powerbi-implementation-planning-user-tools-devices.md).

#### Security isolation

You need a gateway to use certain Power Query connectors or functions, such as the [Web connector](/power-query/connectors/web/web#load-web-data-using-power-query-online) or [Web.BrowserContents function](/power-query/connectors/web/web-troubleshoot#using-a-gateway-with-the-web-connector). These connectors and functions require a gateway for many reasons, including security isolation.

> [!TIP]
> Consider the following alternatives when connecting to web page data sources.
>
> - **Web.Contents function:** If you're connecting to web content that doesn't need to be accessed through a browser, consider using the [Web.Contents](/powerquery-m/web-contents) function. This function doesn't require a gateway because it doesn't use a browser control.
> - **Notebooks:** If you have Fabric capacity, consider using [Fabric notebooks](/fabric/data-engineering/how-to-use-notebook) to transform data. Notebooks don't require a gateway for webpage data and they can perform better when retrieving webpage information, compared to Power Query.

This scenario is relevant when you connect to a data source by using connectors and drivers such as:

- A query that uses the Web connector.
- A query that uses the [Web.Page](/powerquery-m/web-page)or[Web.BrowserContents](/powerquery-m/web-browsercontents) functions.
- A connection that uses the [Access Database Engine (ACE)](/power-query/connectors/access-database) driver.

### Determine which type of gateway you need

When you've identified that you need a gateway, you should next determine which type of gateway to install. There are three types of gateway.

- On-premises data gateway (standard mode)
- On-premises data gateway (personal mode), known as a _personal gateway_
- Virtual network (VNet) gateway service

The gateway type you choose will depend on your requirements and the data sources. The following sections describe each of the three gateway types.

#### On-premises data gateway (standard mode)

An [on-premises data gateway (standard mode)](/power-bi/connect-data/service-gateway-onprem-indepth) allows multiple users to connect to data sources that through a single shared gateway. Typically, you centrally install and manage standard mode gateways on an always-on VM. With a standard mode gateway, you can connect to data from multiple services, such as Fabric, Power BI, and other Power Platform services.

The following diagram depicts a high-level overview of a standard mode gateway.

:::image type="content" source="media/powerbi-implementation-planning-data-gateways/standard-mode-gateway.svg" alt-text="Diagram shows the on-premises data gateway (standard mode). Items in the diagram are described in the following table." border="false":::

> [!IMPORTANT]
> This diagram doesn't depict the [architecture of an on-premises data gateway](/data-integration/gateway/service-gateway-onprem-indepth).

The diagram depicts the following concepts.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | The on-premises data gateway (standard mode) securely transfers data from on-premises data source to cloud services. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | A standard mode data gateway is required for cloud data sources in specific scenarios (described in the [previous section](#host-connector-software)). |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The standard mode data gateway is installed on an always-on VM. Administrators centrally manage the VM and data gateway. Gateway administrators install software required for data source connections, if necessary. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Multiple users can connect to the data gateway data sources. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Users can use the data gateway for items published to Fabric workspaces, like semantic models, dataflows, pipelines, or paginated reports. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Users can use the data gateway for other Power Platform cloud services, like Power Platform dataflows. |

A standard mode gateway is required in the following specific situations.

- Different Microsoft cloud services (like Power Apps and Fabric) and Fabric data items (like dataflows) need to query on-premises data sources (or cloud data sources that require a gateway).
- Paginated reports need to query on-premises data sources (or cloud data sources that require a gateway).
- Semantic models use [DirectQuery](/power-bi/connect-data/desktop-directquery-about#directquery-connections) storage mode that needs to connect to on-premises data sources (or cloud data sources that require a gateway).
- SSAS [live connections](/power-bi/connect-data/desktop-directquery-about#live-connections).
- Data sources depend on custom data connectors, drivers, or libraries.
- When you anticipate the need to [relocate or migrate the gateway](/data-integration/gateway/service-gateway-migrate).

#### Personal gateway

An [on-premises gateway (personal mode)](/power-bi/connect-data/service-gateway-personal-mode), commonly known as a _personal gateway_, allows a user to connect to on-premises data sources that reside on the same machine. A user typically installs and manages a personal gateway from their own machine. With a personal gateway, users can't connect to data from other Power Platform services. They also can't share the gateway or connections with other users.

A personal gateway is intended for limited, personal use by a single individual. Typically, content creators install and use these gateways to conduct [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md). These gateways are limited to personal BI because they can't be shared. Additionally, a personal gateway requires that the user has machine rights and policy approval to download and install the [personal gateway software](https://www.microsoft.com/download/details.aspx?id=55768).

> [!TIP]
> Don't use a personal gateway with [team](powerbi-implementation-planning-usage-scenario-team-bi.md), [departmental](powerbi-implementation-planning-usage-scenario-departmental-bi.md), or [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) solutions.
>
> For most scenarios where you connect to on-premises data, you should use a gateway in standard mode (described in the [previous section](#on-premises-data-gateway-standard-mode)). That's because you can share a standard mode gateway with multiple users, it supports DirectQuery queries and live connections, and it has more options to centralize gateway governance and management.

> [!CAUTION]
> Because a personal gateway is typically installed on a user machine, it is more difficult to manage and govern. If you _do_ need to use a personal gateway, consider moving it to a centrally-managed VM that uses a service account. This approach ensures gateway availability isn't dependent on a user machine (which might be turned off) and improves gateway governance and management.

The following diagram depicts a high-level overview of a personal gateway.

:::image type="content" source="media/powerbi-implementation-planning-data-gateways/personal-mode-gateway.svg" alt-text="Diagram shows the personal gateway. Items in the diagram are described in the following table." border="false":::

> [!IMPORTANT]
> This diagram doesn't depict the [architecture of an on-premises data gateway](/data-integration/gateway/service-gateway-onprem-indepth).

The diagram depicts the following concepts.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A personal gateway is typically installed on a user machine. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The personal gateway securely transfers data from local data sources on the user machine to cloud services. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The personal gateway is typically managed by the user who installed it. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | A single user uses the personal gateway for limited, personal use. A personal mode gateway can't be shared. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | A personal gateway can only be used for items published to a Power BI workspace, like semantic models or Power BI dataflows. |

To reiterate, a personal gateway is intended for limited, personal use by a single individual. However, there are two specific scenarios that require you to use a personal gateway.

- Self-service content creators need to refresh published content that's connected to local data sources on their machine or other on-premises data sources.
- Semantic models use [Python](/power-bi/connect-data/desktop-python-in-query-editor) or [R code](/power-bi/connect-data/desktop-r-in-query-editor) in Power Query.

> [!TIP]
> Whenever possible, avoid using a personal gateway. Instead, consider the following alternatives.
>
> - **SharePoint:** If you need to connect to local files, consider uploading those files to SharePoint or OneDrive for Work or School instead. You can connect to these files by using the [SharePoint folder](/power-query/connectors/sharepoint-folder) connector, which doesn't require a gateway.
> - **OneLake:** If you need to connect to local files and you have Fabric capacity, you can also use [OneLake file explorer](/fabric/onelake/onelake-file-explorer) to upload and synchronize files with a [lakehouse](/fabric/data-engineering/lakehouse-overview). Connecting to a Fabric lakehouse doesn't require a gateway.
> - **Notebooks:** If you need to transform data with Python or R and you have Fabric capacity, consider using [Fabric notebooks](/fabric/data-engineering/how-to-use-notebook) to transform the data and write it to tables stored in OneLake. Notebooks don't require a gateway to run Python or R code. You also benefit from the enhanced performance and additional features available in notebooks.

#### VNet gateway

A [VNet gateway](/data-integration/vnet/overview) allows multiple users to connect to data sources secured with private networks, including data sources that use [private endpoints](/azure/private-link/private-endpoint-overview). With a VNet gateway, you can connect to data with multiple services, and you can share the gateway or connections with multiple users.

A VNet gateway is a Microsoft managed service. If your organization uses private networks, you need a VNet gateway.

> [!IMPORTANT]
> If you're considering using the VNet gateway service, discuss it with your IT teams that handle networking and security. These teams can help ensure that everything is set up, such as [private endpoints](/fabric/security/security-private-links-overview) (if applicable) and gateway [communication](/data-integration/gateway/service-gateway-communication).
>
> A VNet gateway is only supported for Power BI Fabric or Premium capacities. The VNet gateway is billed as an [additive premium infrastructure charge](https://powerbi.microsoft.com/blog/vnet-data-gateway-for-fabric-and-power-bi-is-now-generally-available/) for that capacity.

The following diagram depicts a high-level overview of a VNet gateway.

:::image type="content" source="media/powerbi-implementation-planning-data-gateways/vnet-gateway.svg" alt-text="Diagram shows the virtual network (VNet) gateway. Items in the diagram are described in the following table." border="false":::

> [!IMPORTANT]
> This diagram doesn't depict the [architecture of a VNet data gateway](/data-integration/vnet/data-gateway-architecture).

The diagram depicts the following concepts.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | You use a virtual network (VNet) gateway is to connect to data sources on a private network, like those in an Azure VNet. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The VNet data gateway is a Microsoft managed service. You centrally manage the VNet data gateway from the Azure portal and the Power Platform admin portal. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Multiple users can use a VNet data gateway. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Users can use a VNet data gateway for items published to a Fabric workspace, like semantic models. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Users can use a VNet data gateway for other Power Platform services, like Power Platform dataflows. |

> [!WARNING]
> VNet gateways have some [limitations](/data-integration/vnet/overview#limitations), and they don't support all data sources or scenarios. Validate that your data sources and scenarios are supported and consult the [frequently asked questions](/data-integration/vnet/data-gateway-faqs) before you proceed with VNet gateway implementation and solution planning.

### Determine the number of gateways

When you've determined that you need a gateway, and which type of gateways, you should next determine how many gateways you need.

Depending on your needs, you might require multiple gateways. Consider the following factors when deciding how many gateways to install and use.

#### Availability and performance

It's important that gateways have high availability to avoid disruption caused by refresh or query delays. One way to ensure gateway availability is to install multiple gateways in a high-availability _gateway cluster_. A [gateway cluster](/data-integration/gateway/service-gateway-high-availability-clusters) is a collection of gateways that you install on different VMs, and that are logically associated together as a single, functional unit (the cluster). Each gateway machine is sometimes called a _node_.

Here are the benefits of using a gateway cluster.

- **Avoid a single point of failure:** [Failover](/data-integration/gateway/service-gateway-high-availability-clusters#high-availability-clusters-for-an-on-premises-data-gateway) avoids a single point of failure when the primary gateway machine becomes unavailable. If it becomes unavailable, queries are sent to another node in the cluster. Using a cluster of multiple machines reduces risk. It also increases uptime, which helps you meet your high availability and disaster recovery requirements.
- **Better performance:** [Load balancing](/data-integration/gateway/service-gateway-high-availability-clusters#load-balance-across-gateways-in-a-cluster) improves performance when there's high concurrent usage. Load balancing distributes the workload by sending queries to other nodes in the cluster. That's helpful when the primary gateway is busy or when a single operation (like a long data refresh) consumes many resources.
- **Avoid downtime:** When installing gateway software updates, you can perform the installation on one node of the cluster at a time. That way, it avoids taking the entire cluster offline.

> [!IMPORTANT]
> We strongly recommend that you use gateway clusters for business-critical workloads.

For more information and guidance on setting up a gateway cluster, see [Plan, scale, and maintain a business-critical gateway solution.](/data-integration/gateway/plan-scale-maintain).

#### Environments

Content creators typically use separate environments to develop and manage business-critical solutions, like development, test, and production. Depending on the number of environments you use and how you use them, you might want to have separate gateway clusters for each environment.

Separating gateway clusters into different environments can:

- Segregate and minimize disruption caused by development and test activities.
- Improve availability and performance of production workloads.
- Provide a safe environment to install and test gateway software updates.

> [!IMPORTANT]
> We recommend that you have separate gateway clusters for production workloads. If you have one gateway cluster across all environments, that can represent additional risk. To minimize cost and management effort, it's common to allocate fewer resources (such as memory and CPU) to a development gateway cluster.

#### Regions

To ensure good performance of data refreshes, it's important that you consider the [location](/power-bi/connect-data/service-gateway-deployment-guidance#location) of your data sources, gateways, and where your users are located. To reduce latency, you should install gateways as close to your data sources as possible. For this reason, you might need to install multiple gateway clusters to support different regions or tenants.

> [!CAUTION]
> Ensure that your gateway installation complies with any data residency requirements for your organization.

> [!IMPORTANT]
> To minimize latency, we recommend that you install gateways on machines that are in the same region as your data sources. Additionally, for VNet gateways, the gateways and data sources should be on the same subnet.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning a gateway implementation, key decisions and actions include:

- **Create an inventory of data sources:** An inventory of your data sources allows you to verify and document which data sources need a gateway.
- **Determine which situations require a gateway:** Consider how content creators and consumers work. Ensure that you're familiar with when a gateway is required. Create documentation and training for the user community.
- **Decide on the type of gateway that you need:** Ensure that you validate any assumptions and assess possible limitations so that you're certain the selected gateway type meets your requirements.
- **Avoid personal gateways:** Consider using a gateway in standard mode instead. Determine whether there are any personal gateway data sources that can be redirected to use a standard mode gateway (so that it's not limited for use by a single individual).
- **Decide on whether you need a gateway cluster:** Use gateway clusters for business-critical solutions. Gateway clusters provide high-availability and load balancing. They also help to avoid a single point of failure and improve performance during periods of high concurrent usage.
- **Decide on how many gateways you need:** Consider separate gateway clusters for different environments to avoid disruption. Consider other factors, like usage or regions.

## Install gateways

At this point, you know which types of gateway you need and how many. Next, you need to plan for the gateway installation. Typically, gateways are installed on VMs that you dedicate to this purpose (often called _gateway machines_). Each machine in the gateway cluster should always be on to ensure continuous support of user activity and data refresh operations.

> [!NOTE]
> Because a VNet gateway is a managed service, you don't download and install it. Instead, you provision and set up a VNet gateway in your [Azure portal](https://portal.azure.com/), and then [bind it to a Fabric or Power BI Premium capacity](https://powerbi.microsoft.com/blog/vnet-data-gateway-for-fabric-and-power-bi-is-now-generally-available/). For more information, see [Create virtual network data gateways](/data-integration/vnet/create-data-gateways).

### Identify gateway owners and installers

Before installing the gateway, identify who will install and own the gateway.

#### Gateway owners

Typically, the gateway owner is a technical person who installs, owns, and manages the gateway. Gateway owners are responsible for various activities.

- **Planning:** Make key decisions as described earlier and define the technical specifications for a gateway machine, including initial system resources. The gateway owner should also ensure that a support plan is in place.
- **Installation:** Select an appropriate machine to install the gateway software and perform first-time installation and setup.
- **Management:** Change gateway settings or preferences for optimization (such as [configuring streaming instead of spooling data](/data-integration/gateway/service-gateway-performance#optimize-performance-by-streaming-data)) or monitoring purposes (such as [configuring performance logging](/data-integration/gateway/service-gateway-performance#configure-performance-logging)). The gateway owner also makes decisions about when to [scale up](/data-integration/gateway/plan-scale-maintain#scaling-up-a-gateway-cluster) (add more resources to the gateway machines) or [scale out](/data-integration/gateway/plan-scale-maintain#scaling-out-a-gateway-cluster) (install more gateways in the cluster).
- **Testing:** Validate the gateway usage during first-time setup, ensuring that sufficient resources are available for the gateway machines. The gateway owner should also test monthly updates before installing them.
- **Updating:** Update and install the gateway software and supporting items (like [connector software](#host-connector-software)) on a timely basis.
- **Monitoring:** [Monitor gateway](/data-integration/gateway/service-gateway-performance#gateway-performance-monitoring-public-preview) uptime and health, including the collection of the [gateway log files](/data-integration/gateway/service-gateway-log-files) that allow monitoring for issues and anomalous activity.
- **Migration:** Store [recovery keys](/data-integration/gateway/service-gateway-recovery-key) in a safe place that's accessible to a wider team. The gateway owner should also be the person to use these keys to [migrate, restore, or relocate the gateway](/data-integration/gateway/service-gateway-migrate), if necessary.

> [!IMPORTANT]
> Ensure that the gateway owner is aware of, and agrees with, these responsibilities. If the gateway owner isn't prepared to manage the gateway, it can quickly become a dependency that blocks content owners and creators. Additionally, identify whether the gateway owner understands how to install and manage a gateway and, if not, how you'll train them to do this.

> [!TIP]
> Some organizations successfully allow gateway ownership within business units and departments, whereas others reserve gateway ownership for a centralized team (such as IT). One way to handle it is to form a partnership where IT manages the gateway cluster nodes, and the business unit manages the data source connections.

Because gateway ownership is an important responsibility, you should clearly define who can install gateways in your organization.

#### Gateway installers

To reduce management overhead and mitigate governance risk, it's important to limit the number of active gateways in your organization. To this end, we recommend that you limit the number of users who can install gateways.

> [!WARNING]
> Gateway owners have full control over the gateways that they manage. This means that malicious gateway owners could potentially intercept information as it flows through an on-premises data gateway. For this reason, it's essential that you restrict the ability to install gateways to trusted people.

For standard mode gateways, you [manage gateway installers](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) either from the Fabric portal or the Power Platform admin center. You also manage [who can create VNet data gateways](/data-integration/vnet/manage-data-gateways#manage-access-to-creating-vnet-data-gateways-gateway-installer-setting) by using the gateway installer setting.

- **Fabric connections and gateways page:** You can [manage gateway installers](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) from within the [connections and gateways](https://app.powerbi.com/groups/me/gateways) page of the Fabric portal.
- **Power Platform admin center:** You can also [manage gateway installers](/power-platform/admin/onpremises-data-gateway-management#manage-gateway-installers) from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/ext/DataGateways). Settings you change here affect gateways you use from Fabric.

You can also manage gateway installers programmatically by using the [PowerShell cmdlets for on-premises gateway management](/powershell/gateway/overview?view=datagateway-ps&preserve-view=true). For personal gateways and standard mode gateways, you can use these cmdlets to [set the gateway tenant policy](/powershell/module/datagateway/set-datagatewaytenantpolicy?view=datagateway-ps&preserve-view=true). Setting the gateway tenant policy by using PowerShell is the only way to manage who can install personal gateways in your tenant.

> [!IMPORTANT]
> We recommend that you closely regulate who can install personal gateways, limiting their installation and use for valid, approved business cases.

### Prepare gateway installation

When you've identified who will install and own the gateway, you should prepare for the gateway installation. You should:

- Identify where to install the gateway.
- Decide on the resources that the gateway machine needs.
- Agree on how you'll name your gateway when it's installed.

The following sections describe these key considerations for planning a gateway installation.

#### Identify where to install the gateway

Typically, you install a gateway on an always-on VM (also called the _gateway machine_). You can install only one gateway of each type (personal mode or standard mode) on a machine.

Here are the key factors for determining where you'll install a gateway.

- **[Location](/power-bi/connect-data/service-gateway-deployment-guidance#location):** Typically, the gateway machine should be located close to the data source to minimize latency. Usually, a standard gateway needs to be installed in your default data region. However, if your Premium capacity location is different from the [default data region](powerbi-implementation-planning-tenant-setup.md#location-for-data-storage) for your tenant, investigate using an [Azure Relay](/data-integration/gateway/service-gateway-azure-relay) as an option to satisfy data residency requirements.
- **[Supporting items](/power-bi/connect-data/service-gateway-custom-connectors):** Determine what connectors, drivers, or libraries you need to install on the gateway machine.
- **[Domain](/data-integration/gateway/service-gateway-install#related-considerations):** Determine what the relationship of the gateway machine is with the target domain. The VM must be a domain-joined machine with a trust relationship with the target domain. It can't be a domain controller.

> [!TIP]
> To avoid resource contention, don't install unrelated software on a gateway machine. The gateway machine should be fully dedicated to hosting the on-premises data gateway.

#### Decide on the gateway machine resources

The gateway machine should have sufficient resources to handle the expected query workload.

Here are the key factors for determining gateway machine resources.

- **[Usage](/power-bi/connect-data/service-gateway-deployment-guidance#number-of-users):** Determine how many and which type of items will use the gateway, and what query concurrence (from many users) will be. Higher usage requires gateway machines with more resources.
- **[Connection type](/power-bi/connect-data/service-gateway-deployment-guidance#connection-type):** Determine whether Power BI semantic models import data, use DirectQuery, or a live connection. For import semantic models, it's important to check the number of data refreshes to estimate gateway resource needs (such as RAM). For DirectQuery or live connections, you should assess the number of report consumers to estimate resource needs (such as CPU).

> [!TIP]
> Validate the gateway machine resources by performing load testing. You can conduct this type of test by monitoring gateway machine health when performing dataset refreshes, and by simulating high concurrent usage of DirectQuery or live connection reports.

#### Agree upon naming conventions

How you'll name the gateway and its data source connections is important. The name should make it straightforward for content creators to know what to connect to. To ensure gateways and data source connections have clear names, you should use a logical naming convention.

When you define your naming conventions, consider the following points.

- Include a variation of _Gateway_ or _DataGW_ in the name to identify the gateway for auditing, logging, and troubleshooting purposes.
- Include the specific purpose of the gateway when it supports specific Fabric items, operations, regions, or business areas.
- Use a variation of _Dev_, _Test_, or _Prod_ in the name when the gateway supports a specific environment.
- Give the gateway a name that aligns with the name of the cluster it belongs to. For example, give each gateway machine within the cluster a unique name, like _Node1_, _Node2_, and so on.

Here are some examples of logical gateway names.

- _DataGW-Prod-Node1_
- _Gateway-DevTest-Node1_
- _Gateway-FinanceTeam-Prod-Node1_

### Install and set up gateways

After making key decisions and preparation, the gateway owner installs the gateways and performs first-time setup.

> [!NOTE]
> For information on how to download and install a gateway, see:
>
> - [Download and install a standard mode gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-standard-gateway)
> - [Download and install a personal mode gateway](/data-integration/gateway/service-gateway-install#download-and-install-a-personal-mode-gateway)

When installing and setting up gateways, consider the following factors.

- **Installation location:** When you want to install the gateway to a location other than the default installation path, you can change the installation location.
- **Recovery key:** When you want to migrate, restore, or takeover an existing gateway, you need to use the gateway's recovery key. Ensure that you keep the recovery key in a safe and secure place that's accessible to other gateway administrators.
- **Data center region:** When you want the region to be different from the registered service's tenant, you can [change the data center region](/data-integration/gateway/service-gateway-data-region).
- **Azure Relay:** When you want to use your own relay instead of the default, you can [provide your own relay details](/data-integration/gateway/service-gateway-azure-relay).
- **Proxy settings:** When your work environment requires the gateway to go through a proxy server to connect to the Fabric portal, you must [set up proxy settings](/data-integration/gateway/service-gateway-proxy-setup-guide).
- **Gateway service account:** When you want to use an explicit domain account, you can [change the gateway service account](/data-integration/gateway/service-gateway-service-account#change-the-service-account) from the default, which is _PBIEgwService_.
- **Communication settings:** When a firewall blocks outbound connections, your security and networking teams can [set up the firewall to allow outbound connections](/data-integration/gateway/service-gateway-communication) from the gateway to its associated Azure region.
- **Tenant registration:** When you want to [restrict which tenants are allowed](/data-integration/gateway/service-gateway-tenant-registration) to register the on-premises data gateway application to prevent data exfiltration.
- **Integration tenant settings:** When you want to ensure that your gateway operates with single sign-on (SSO) (for instance, with [Microsoft Entra ID-based authentication](/fabric/admin/service-admin-portal-integration#microsoft-entra-single-sign-on-sso-for-gateway)) the way you intend.

> [!IMPORTANT]
> We recommend that you restrict tenant registration to only tenants within the organization. This step helps to improve gateway security because the default setting has no restriction on tenant registration.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing for and installing a gateway, key decisions and actions include:

- **Identify the gateway owner and installers:** Ensure the gateway owner is aware of their responsibilities. Restrict gateway installation to the appropriate people.
- **Conduct training:** If needed, train gateway owners and installers to effectively install, manage, and support the gateway. Conduct cross-training for a backup when necessary.
- **Create naming conventions:** Create gateway naming conventions that correspond to purpose, environment, cluster node, and the use cases it supports or the operations it performs.
- **Consider resource needs:** Determine what the workload and usage will be to determine initial resources (such as memory and CPU).
- **Set the integration tenant settings:** Review and set the [integration tenant settings](/fabric/admin/service-admin-portal-integration) to ensure your gateway operates with single sign-on (SSO) the way you intend.
- **Provision the gateway machine:** Set up an always-on VM with sufficient resources to support gateway operations.
- **Install the gateway:** Perform first-time setup of the gateway on the gateway machine.
- **Install supporting items:** Install custom data connectors or dependent software to support your scenario.

## Manage gateways

After installing the gateways, you should then add data source connections. When adding these connections, you should also plan how you'll manage access to the gateway and its connections.

### Add data source connections

You must [add the initial data source connections](/power-bi/connect-data/service-gateway-data-sources) before you can use the gateway. You can add connections manually from the Power BI service or the Power Platform admin center, or programmatically with the [Power BI REST APIs](/rest/api/power-bi/gateways/create-datasource).

When adding connections, consider the following points.

- **Stored credentials:** Consider which credentials will be used to connect to the data source. When you add a connection, you must provide credentials for that data source (unless it supports anonymous authentication). It's an important decision, because all queries to the data source run by using these credentials, unless you're using [Microsoft Entra single sign-on (SSO) for the data gateway](/fabric/admin/service-admin-portal-integration#microsoft-entra-single-sign-on-sso-for-gateway).
- **Naming conventions:** Like gateways, connections should also use logical and consistent naming conventions. Ensure that connection names correspond to the data source name. For example: _FinanceDB-Prod_ is a logical name that indicates the data source.
- **Single sign-on:** In the Fabric administrator settings, you should enable the [Microsoft Entra single sign-on (SSO) for gateway](/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) option when you want to use single-sign on (SSO) with DirectQuery (either by using [Active Directory SSO](/power-bi/connect-data/service-gateway-active-directory-sso) or [Microsoft Entra SSO](/power-bi/connect-data/service-gateway-azure-active-directory-sso)). You should use SSO when you want to [enforce data security in the data source system based on the report user identity](powerbi-implementation-planning-security-report-consumer-planning.md#enforce-data-security-based-on-consumer-identity).
- **Privacy levels:** For import data source connections, you must set the [privacy level](powerbi-implementation-planning-security-content-creator-planning.md#privacy-levels). Ensure that you select the appropriate privacy level to appropriately isolate the data source, if necessary. It's important to understand that the privacy levels set in Power BI Desktop aren't honored by gateways.

> [!NOTE]
> The data source name can be modified afterwards, but the server and database names can't be changed after they've been setup. To avoid errors, ensure that the data source information [matches what will be used in Power BI Desktop](/power-bi/connect-data/service-gateway-onprem-tshoot#error-report-could-not-access-the-data-source-because-you-do-not-have-access-to-our-data-source-via-an-on-premises-data-gateway).

> [!TIP]
> To improve efficiency and accuracy, consider automating the creation of data source connections by using the [Power BI REST APIs](/rest/api/power-bi/gateways/create-datasource). In this case, we recommend including review and approval processes rather than automatically processing each request that creates or updates a connection.

### Provision gateway access

After adding the initial data source connections, you should decide on how to manage access to both the gateway and its connections.

Content creators will need access to a gateway connection to successfully connect to a data source. User access to gateway connections is done for each connection, so consider who needs access to each gateway connection, and how you'll manage that access. You should manage access by using [security roles](/data-integration/gateway/manage-security-roles) for both [gateways](/data-integration/gateway/manage-security-roles#gateway-roles) and [connections](/data-integration/gateway/manage-security-roles#connection-roles).

#### Gateway roles

Gateway roles let you control who can manage the gateway and its data source connections. These roles work similarly to [workspace roles](/power-bi/collaborate-share/service-roles-new-workspaces), allowing different permissions depending on the role. Using roles helps you to manage gateway access more effectively.

> [!TIP]
> We recommend using [security groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups) to manage role membership instead of individual accounts. That way, it's easier to manage users, particularly across multiple gateways. You can use the same security groups to manage other access control, like [row-level security](/fabric/security/service-admin-row-level-security#working-with-members) role membership and [app audience](/power-bi/collaborate-share/service-create-distribute-apps#create-and-manage-multiple-audiences) membership.

> [!IMPORTANT]
> A user who just needs to use the gateway to connect to a data source doesn't need to belong to a gateway role. In this case, they'll only have the _User_ connection role.

There are three gateway roles for managing an on-premises standard gateway.

- **Admin:** Members of this role can manage and update the gateway. A gateway administrator is typically the gateway owner, but there can also be multiple administrators for a gateway. Gateway administrators should be Fabric administrators, or members of the COE or central BI team. The responsibilities of an administrator are the same as a [gateway owner](#gateway-owners).
- **Connection creator with sharing:** Members of this role can create gateway connections, test the gateway status, and share the gateway with others. This role can't remove users from the gateway. Consider adding someone to this role when they're responsible for a subset of analytical solutions, like in a decentralized team for a business unit. The responsibilities of someone with this role include:
  - Setting up and testing new connections.
  - Managing connections that they own, such as setting credentials.
  - Sharing the gateway with other users who need it.
  - Regularly reviewing who has access to a gateway, validating whether they still need it, and removing them when they don't need it.
- **Connection creator:** Members of this role can create connections on the gateway and test their status. The connection creator should be a content owner who can appropriately set up the right connections to use the gateway. The responsibilities of a _Connection creator_ role are the same as the _Connection creator with sharing_ role, with the exception that they can't share access to the gateway.

> [!NOTE]
> VNet gateways only support the _Admin_ gateway role.

#### Data source connection roles

Data source connection roles let you control who can use, manage, and share connections. A user with a connection role doesn't need to belong to a gateway role.

There are three data source connection roles.

- **Owner:** Members of this role can manage the connection or delete it when it's no longer required. Owners can manage the connection roles, including adding other connection owners. An owner is typically also a connection creator. Consider making someone a connection owner when they're the steward or administrator of that data source, or they have significant knowledge about the data source and its contents. The responsibilities of an owner include:
  - Managing connections, such as updating credentials, if necessary.
  - Deleting the connection when it's no longer needed.
  - [Managing connection roles](/data-integration/gateway/manage-security-roles#how-to-manage-the-gateway-and-connection-data-source-roles) from the [Power Platform admin center](https://admin.powerplatform.microsoft.com/ext/DataGateways).
- **User with sharing:** Members of this role can use and share the data source by adding other users. Consider adding someone to this role when they play an important role in the user community. [Champions](fabric-adoption-roadmap-community-of-practice.md#champions-network) can be good candidates for this role. The responsibilities of someone with this role include:
  - Sharing the connection with other users who need it.
  - Regularly reviewing who has access to a connection, validating whether they still need it, and removing them when they don't need it.
- **User:** Members of this role can use the data source in Power BI reports and Power BI dataflows. Users are only responsible for querying the data from their workloads and client tools.

> [!TIP]
> To prevent governance risk from oversharing, you should limit who can share gateways and connections to specific individuals who can accomplish this task effectively and responsibly.

### Document gateway and connections

After you've set up your gateway cluster, you should document it. You should document your gateways so that they're easy for content creators to find, and easy for gateway administrators to maintain. Consider storing gateway documentation in an accessible location, like your [centralized portal](powerbi-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) of the relevant [community of practice](powerbi-adoption-roadmap-community-of-practice.md).

Consider documenting the following information.

- Gateway name and GUID
- Gateway machine name (and any respective identifiers)
- Gateway owner
- Last software update date (gateway version)
- Purpose of the gateway cluster (such as the environment, region, business area)
- Which data source connections should be maintained on this gateway
- Whether the gateway uses a user identity or stored credentials
- Access management policy (how you intend to use gateway roles and connection roles)

> [!IMPORTANT]
> Ensure that you document your gateway [recovery keys](/data-integration/gateway/service-gateway-recovery-key) for standard mode gateways. These recovery keys are required should you ever need to recover or re-locate the gateway. Keep this information in a safe and secure place that's accessible to multiple trusted people in a central team. If you have an organizational password vault, that's an ideal location.

### Update gateways

To ensure your gateways remain functional and perform well, you need to perform several tasks.

- Install Windows updates and perform other server maintenance.
- Update [the gateway software](/data-integration/gateway/service-gateway-update). The gateway software is [updated monthly](/data-integration/gateway/service-gateway-monthly-updates), and Microsoft only supports the last six releases of the on-premises gateway.
- Update custom data connectors, drivers, and libraries, when necessary.

> [!NOTE]
> The gateway owner must manually apply gateway updates to each gateway. For this reason, it's important to plan a process to update your gateways periodically.

> [!TIP]
> When you work with the Power Query Online experience, the [Power Query](/power-query/power-query-what-is-power-query) engine uses the latest version of Power Query that's available. However, when you're using a gateway to apply transformations, it uses the version that's installed on the gateway machine. To ensure a consistent user experience, it is important to keep your gateway machines up to date.

The remainder of this section describes how to update the gateway software.

#### Install updates on development or test gateways

It's important to keep your gateways up to date to avoid unexpected disruption, and also to benefit from the latest improvements. Nonetheless, updates can have unexpected consequences for your gateway performance and function. To avoid impacting business-critical solutions, you should first install gateway software updates to a development or test gateway (before they're applied to gateways that support production environments).

#### Validate updates

You can test gateways by first applying the update to gateways that support development and test environments.

Consider the following points when validating gateway updates.

- **Define repeatable test conditions:** You should define a list of repeatable test conditions to help you ensure that you test all the relevant gateway operations and data sources. For example, you could identify which reports and semantic models are deemed critical and require validation. You might also have some compliance requirements to be met that qualify as repeatable test conditions.
- **Use a set of test reports:** Keep a set of reports to use for functional testing each time the gateway is updated. These reports help you quickly validate your repeatable test conditions. These test reports often only show totals and counts. Your goal is to ensure that you test access, rendering, and refresh for:
  - Each commonly used data source.
  - Each key type of data item, like the most critical semantic models.
  - Different storage modes, like import and DirectQuery.
- **Identify business-critical reports:** Have access to (or copies of) business-critical reports that you can test for the new update. These reports can help you ensure that the data can refresh and DirectQuery reports work as expected.
- **Automate testing processes:** Use the Power BI REST APIs to test the [data refresh for import data items](/rest/api/power-bi/datasets/refresh-dataset) and to [evaluate DAX queries](/rest/api/power-bi/datasets/execute-queries). Ensure that you can catch and log refresh failures or query errors.

> [!IMPORTANT]
> We strongly recommend that you test gateway updates on the development and test cluster before applying them to production. Testing updates is important, as there's no rollback process. As an alternative, before starting the update you can create a [VM image](/azure/virtual-machines/capture-image-portal), which is a complete copy of the file system structure and the data on the machine.

#### Install updates on production

After validating the gateway update, you should apply the update to all gateways that support production environments. A gateway is unavailable while it's being updated, so you should be consistent in when and how you [update your gateways](/data-integration/gateway/service-gateway-update).

Consider the following points about updating gateways.

- In your centralized portal, document the current version of the gateway.
- Apply updates during periods of historically low gateway usage.
- Use a consistent a consistent schedule when you test and apply updates. If monthly updates are too often, ensure that your gateways are updated at least quarterly.
- Update one gateway cluster machine at a time. By rotating through each machine, you can avoid downtime.

### Update credentials

For data source connections that require stored credentials, you might need to rotate the credentials regularly. For example, your organization might have a policy that requires frequent password resets. This practice is also useful when a key team member leaves the organization. To improve efficiency, you can use the Power BI REST APIs to [update credentials](/rest/api/power-bi/gateways/update-datasource).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When managing data gateways, key decisions and actions include:

- **Create data source connections:** Set up the data source connections for common organizational data sources. Ensure that connections follow clear, consistent naming conventions.
- **Document gateways and data sources:** Create concise documentation about gateways and connections. Ensure this documentation is easily accessible from your centralized portal for gateway owners and administrators.
- **Handle connection requests:** Create a process to gather and manage connection requests. Determine whether an approval process is required for connection requests. Consider automating the process by using the Power BI REST APIs.
- **Provision gateway roles:** Use the [principle of least privilege](/entra/identity-platform/secure-least-privileged-access) to assign individuals to gateway roles. Consider adding data source stewards to the _Connection creator_ or _Connection creator with sharing_ role so that they can contribute to connection management.
- **Provision connection roles:** Assign content creators (and consumers when applicable) to connection roles so they can use the gateway. Limit users with sharing to those users who will responsibly share the connection and help to regularly review and manage access.
- **Create concise user documentation:** Document the key items important for content creators to find and use the gateway and its connections. Place the documentation somewhere central and easily accessible to the user community, like a centralized portal or SharePoint support site.
- **Carefully document and store recovery keys:** Store recovery keys in a safe, secure location accessible to more than one team member. Ensure that they can be easily found should you need to recover the gateway.
- **Create a process for installing updates:** Determine how often you'll install gateway software updates and the process to be followed. Aim to update gateways within one to three months of the update release.
- **Install gateway updates first on development and test:** Ensure that development and test gateways are updated prior to production and used for initial testing.
- **Test gateway updates before they're applied to production gateways:** Set up a process to test monthly gateway updates by using repeatable test conditions and items.
- **Install gateway updates promptly and regularly on production:** Ensure that production gateways are kept up to date.
- **Update connection credentials:** As needed, update stored credentials use by connections.

## Monitor, audit, and optimize gateways

Gateways are a crucial part of Fabric data integration. To avoid disruption and mitigate risk, you should monitor and regularly [audit the gateways in your tenant](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#data-gateway-module).

Monitoring gateways helps to:

- Mitigate governance risk.
- Prevent issues.
- Investigate incidents, such as performance issues or data refresh failures.

The following table provides an overview of the typical issues you might encounter when managing a data gateway cluster, and how to monitor or investigate issues.

| **Potential issue** | **Type of issue** | **How to monitor or investigate the issue** |
| --- | --- | --- |
| **Too many gateways** | Governance | &bull;&nbsp;Power Platform admin center <br/><br/>&bull;&nbsp;Gateway PowerShell cmdlets <br/><br/>&bull;&nbsp;Power BI REST APIs |
| **Gateway oversharing** | Governance | &bull;&nbsp;Power Platform admin center <br/><br/>&bull;&nbsp;Gateway PowerShell cmdlets <br/><br/>&bull;&nbsp;Power BI REST APIs <br/><br/>&bull;&nbsp;Power BI activity log |
| **Gateway is offline** | Performance and availability | &bull;&nbsp;Power Platform admin center <br/><br/>&bull;&nbsp;Gateway machine monitoring <br/><br/>&bull;&nbsp;Gateway logs |
| **Gateway errors** | Performance and availability | &bull;&nbsp;Gateway logs |
| **Query failures** | Performance and availability | &bull;&nbsp;Gateway logs <br/><br/>&bull;&nbsp;Gateway logs (additional logging) |
| **Slow refreshes or queries** | Performance and availability |  &bull;&nbsp;Gateway machine monitoring <br/><br/>&bull;&nbsp;Windows event log <br/><br/>&bull;&nbsp;Windows performance counters <br/><br/>&bull;&nbsp;Gateway logs <br/><br/>&bull;&nbsp;Gateway logs (additional logging) <br/><br/>&bull;&nbsp;Server monitoring tools |

> [!NOTE]
> For more information about auditing and monitoring gateways, see:
>
> - [Monitor and optimize on-premises data gateway performance](/data-integration/gateway/service-gateway-performance)
> - [Power BI implementation planning: Data-level auditing](powerbi-implementation-planning-auditing-monitoring-data-level-auditing.md#data-source-monitoring)
> - [Power BI implementation planning: Tenant-level auditing](/data-integration/gateway/service-gateway-tshoot)

> [!TIP]
> If you use Fabric capacity, the tools in Fabric can provide the ideal components for you to build and orchestrate an organizational gateway monitoring solution. For instance, you can:
>
> - Use [Data Factory](/fabric/data-factory/data-factory-overview) to copy gateway logs and land them in OneLake.
> - Use notebooks to programmatically gather gateway information by using the [Power BI REST APIs](/rest/api/power-bi/gateways/get-gateways) and transform gateway log files to tables.
> - Use Power BI to create a semantic model and report on gateway health.
> - Use [Data Activator](/fabric/data-activator/data-activator-introduction) to send alerts to gateway owners and administrators when there's anomalies or disruptions.

### Monitor gateways

You should regularly review how many gateways are installed on your tenant, and who installed them. You can monitor prevalence from the [connections and gateways](https://app.powerbi.com/groups/me/gateways) page of the Fabric portal, and the [Power Platform admin center](https://admin.powerplatform.microsoft.com/ext/DataGateways). Both views provide a concise, functional overview of all the gateways that you have access to. Administrators should review this information regularly.

> [!NOTE]
> You can also programmatically retrieve a list of gateways by using the [PowerShell cmdlets](/powershell/module/datagateway/get-datagatewaycluster?view=datagateway-ps&preserve-view=true) or by using the [Power BI REST APIs](/rest/api/power-bi/gateways/get-gateways). You can also identify gateway installation events by using the activity log.
>
> Consider combining this information with aggregate analytics about the number and type of gateway data sources. You can present this information in consolidated, tenant-wide governance or auditing and monitoring reporting.

When monitoring gateway prevalence, focus attention on the following metrics.

- **Rising number of gateways or installers:** Ensure that you investigate unexpected new gateways or installers.
- **Redundancy in connections across gateways:** Try to consolidate connections to avoid extra maintenance effort of the gateways.
- **Unexpected installers or gateways:** Ensure that any new installers or gateways have undergone an approval process before they're installed.
- **Unexpected gateway machines, connections, or configuration:** Ensure that you identify any anomalous gateway properties such as gateways installed on user machines, or connections to local files. Also identify settings that create risk, like ignoring privacy level.

### Collect and analyze gateway logs

Each gateway machine produces detailed [logs](/data-integration/gateway/service-gateway-tshoot#collect-logs-from-the-on-premises-data-gateway-app) that you can use to identify and resolve issues. These logs are a collection of detailed technical files stored on the gateway machine. You can also temporarily enable additional logs from the [on-premises gateway app](/data-integration/gateway/service-gateway-app) to collect more detailed information about queries and their timings.

To avoid introducing networking delays, we recommend that you allow the gateway logs to be written to the local gateway machine. However, you can choose to change the path where the logs are written with the [gateway configuration files](/data-integration/gateway/service-gateway-log-files). You can also update how long the logs are retained. Always make a copy of the configuration files before you edit them.

Create a data integration solution to gather and consolidate the log files from each gateway machine so you can analyze the data. Ideally, this process should be automated and output to an analytical report to easily view all gateways and identify anomalies.

> [!TIP]
> Consider using data alerts to notify gateway administrators and data source connection creators about anomalous activity for their gateways and connections, respectively. That way, they can take immediate corrective actions.

### Monitor gateway machine health

The health of your gateway is dependent on the health of its server. To avoid disruption, you should [monitor gateway machines](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md#monitor-related-azure-services) to detect when a machine isn't performing well or is offline.

> [!TIP]
> Ensure that your gateway machine is added to any enterprise monitoring tools that your organization uses to monitor servers.

### Optimize and troubleshoot gateways

When issues arise with a gateway, you'll need to investigate and identify the problem. Typically, troubleshooting involves investigating the gateway logs described in the previous section, and testing various optimizations to see whether they resolve the issue.

Here are some common gateway optimizations.

- **Change from spooling to streaming:** By default, gateways will [spool](/data-integration/gateway/service-gateway-configure-disk-space#gateway-spooling-data) data to the gateway machine when evaluating a query. It results in the temporary storage of data before it's transferred to the cloud. Spooling can be slower than the alternative of streaming, where data is transferred directly. You can change this setting in the [gateway configuration files](/power-bi/connect-data/service-gateway-deployment-guidance#optimizing-performance).
- **Antivirus scanning:** [Excluding certain folders](/data-integration/gateway/service-gateway-performance#folders-that-might-have-to-be-excluded-from-antivirus-scanning-in-the-on-premises-data-gateway-server) from antivirus scanning on the gateway machine can improve performance when using file-level antivirus software.
- **Planning to scale up or scale out:** Consider when you'll [scale up a gateway cluster](/data-integration/gateway/plan-scale-maintain#scaling-up-a-gateway-cluster) by adding more resources to the gateway machine, or [scale out the cluster](/data-integration/gateway/plan-scale-maintain#scaling-out-a-gateway-cluster) by adding another gateway to another machine.

> [!IMPORTANT]
> VNet gateways have a [single hardware configuration](/data-integration/vnet/data-gateway-architecture#hardware), which can't be scaled or changed.

> [!NOTE]
> For more information about optimizing and troubleshooting gateways, see:
>
> - [Troubleshoot the on-premises gateway](/data-integration/gateway/service-gateway-tshoot)
> - [Troubleshoot a VNet network gateway](/data-integration/vnet/troubleshoot-data-gateway)
> - [Plan, scale, and maintain a business-critical gateway solution](/data-integration/gateway/plan-scale-maintain)

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** – When monitoring gateways, key decisions and actions include:

- **Monitor gateway machines:** Ensure gateways are installed on machines that are monitored by enterprise monitoring solutions. Otherwise, ensure that you can detect when these machines aren't performing well.
- **Measure gateway prevalence:** Monitor the evolution of how many gateways are installed in your tenant over time.
- **Gather and analyze gateway logs:** Create a solution to automatically collect and combine the log files from the different gateway machines. Analyze these files to extract meaningful information. Consider setting up two types of analytical monitoring solutions: one for alerts and action, and another for exploratory root cause analysis when issues arise.
- **Verify roles and responsibilities:** Ensure that roles and responsibilities are defined for monitoring, optimizing, and troubleshooting.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
