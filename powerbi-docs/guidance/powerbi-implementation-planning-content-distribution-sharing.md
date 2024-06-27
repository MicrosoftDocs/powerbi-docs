---
title: "Power BI implementation planning: Content distribution and sharing"
description: "This article helps you to plan the distribution and sharing of content in Power BI and Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 06/27/2024
---

# Power BI implementation planning: Content distribution and sharing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to plan the distribution and sharing of content in Power BI and Fabric. It's primarily targeted at:

- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization. Fabric administrators manage administration settings that impact how creators can distribute and share content in their organization. Fabric administrators can collaborate with other administrators to control the options available for creators to share their content.
- **Azure administrators:** The administrators who are responsible for overseeing identity management in the organization and creating external guest users to enable Microsoft Entra B2B.
- **Center of Excellence (COE), IT, and BI teams:** The teams that are responsible for overseeing Power BI in the organization. These teams are responsible for defining and promoting a specific content distribution strategy.
- **Content owners and creators:** The teams and individuals that champion analytics in a team or department and that make and distribute Power BI or Fabric content. Content owners and creators should collaborate with Azure administrators to distribute or share content to external users.

Once you create content like semantic models or reports, you'll usually want to share it with other users in your organization so that they can use it to inform their decisions and actions. There are many different approaches that you can take to share Power BI and Fabric content, and each approach has its benefits and considerations. It's important to take care because oversharing of content is a common governance and security challenge for organizations. To overcome this challenge and get people access to the data and reports that they need, it's important that you implement a content distribution strategy that fits your needs and scenarios.

> [!NOTE]
> The terms _sharing_ and _distribution_ are sometimes used interchangeably. In this article, we refer to content sharing and content distribution in the following context:
>
> - _Content sharing_ involves giving others access to an item as part of the day-to-day activities of a content creator. For example, you can share direct access to a report with someone else.
> - _Content distribution_ involves sharing content at scale for a wider audience of content consumers. For example, you can distribute reports to an app audience by using an app.

This article guides you to choose your approach to distribute content to both _content consumers_ and other _content creators_.

- **Content consumers:** Users who view content but don't create or share new items. These users typically have Read permission for reports, but more advanced content consumers might also request [Build permission](../connect-data/service-datasets-build-permissions.md) to perform ad hoc analysis on data items in [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md) scenarios.
- **Content creators:** Enterprise or self-service users who create and distribute content to consumers. These creators often use existing items created by other users in the organization to make new content, for example in [managed](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) or [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) scenarios.

## Set roles and manage permissions

You share content with consumers or creators by granting them access to that content. To grant this access to users and groups, you set their roles and manage their permissions.

- _Roles_ apply certain permissions to all content within a particular scope. For example, the Viewer workspace role applies Read-only permissions to all content within the workspace.
- _Permissions_ define what an individual can do with that content. For example, applying Build permission to a semantic model allows a user to connect to and create reports from this model.

The following diagram depicts where you can set roles and permissions in Power BI and Fabric.

:::image type="content" source="media/powerbi-implementation-planning-content-distribution-sharing/content-permissions-control.svg" alt-text="Diagram shows where you can set roles or permissions. Each element of the diagram is described in the following table." border="false":::

The diagram depicts the following concepts and processes.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | You can share content in workspaces by assigning [workspace roles](../collaborate-share/service-roles-new-workspaces.md). Workspace roles can grant permissions to all items within the workspace. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | You can share content from an app by adding people to [app audiences](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences), or by creating an app that shares content with the entire organization. <br/><br/>&bull;&nbsp;An app audience member will receive Read-only permission to view content only in the app (and can't view individual items in the underlying workspace). <br/>&bull;&nbsp;You can grant Build permissions to app audience members for the underlying semantic models of app reports and dashboards. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | You can grant access to individual items by providing [direct access](../collaborate-share/service-share-dashboards.md) and setting specific permissions. Some items (like dataflows) don't support sharing by direct access. For these items, you share them via workspace roles. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Reports have more options. For instance, you can provide direct access with a link that works for specific users and groups, or with a link for the entire organization. Links work for specific distribution methods, like embedding in [SharePoint online](../collaborate-share/service-embed-report-spo.md) or [securely embedding in an internal webpage](../collaborate-share/service-embed-secure.md). We give an overview of all possible methods [later in this article](#plan-to-distribute-content-to-consumers). |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | It's possible to distribute Power BI reports without setting roles or managing permissions for users and groups. <br/><br/>&bull;&nbsp;You might choose to share Power BI reports by embedding them in a custom website or application. In this case, you manage custom authentication, yourself. Embedding content this way requires an [F, P, EM, or A SKU](../developer/embedded/embedded-capacity.md). <br/>&bull;&nbsp;You can also share reports publicly by using [Publish to web](../collaborate-share/service-publish-to-web.md), which makes content available to everyone through the public internet. |

### Set roles for workspaces or apps

As introduced in the previous diagram, you can share a collection of content by setting roles in [workspaces](/fabric/get-started/workspaces) or [apps](../collaborate-share/service-create-distribute-apps.md). A workspace is a collaborative location to publish and organize content, while an app is a selection of reporting content that you can organize and distribute to audiences.

- _[Workspace roles](/fabric/get-started/roles-workspaces)_ control whether a user can manage workspaces, content, and connected apps (Admin, Member, or Contributor), or only view content in that workspace (Viewer).
- _[App audiences_](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences)_ control which content is visible in an app to a user or group. You can also publish an app to your [entire organization](../collaborate-share/service-create-distribute-apps.md#publish-the-app-to-your-entire-organization).

> [!NOTE]
> Fabric administrators have access to all workspaces and workspace content. Also, Fabric capacities can contain one or more [domains](/fabric/governance/domains), which logically group workspaces together. Giving someone access to a domain _does not_ grant them access to its workspaces, items, or apps.

#### Other supporting roles for content distribution or sharing

There are other roles that don't directly affect how you share content, which you can use to support content distribution and sharing in certain circumstances.

- _[Data source connection roles](powerbi-implementation-planning-data-gateways.md#data-source-connection-roles)_ control whether a user can use a data source connection of a [data gateway](powerbi-implementation-planning-data-gateways.md). If a DirectQuery semantic model uses [DirectQuery with single sign-on (SSO)](../connect-data/service-gateway-sso-overview.md), then you must add a user or group as a _User_ role so that they can use the model or view reports. You might also decide to grant creators a [data gateway role](powerbi-implementation-planning-data-gateways.md#gateway-roles) so that they can add and manage their own data source connections.
- _[Data security roles](/fabric/security/service-admin-row-level-security)_ control what data people can access in the semantic model. If a semantic model has a data security role, then you must add a user or group to that role before you share the model or any connected reports and dashboards.
- _[OneLake data access roles](/fabric/onelake/security/get-started-data-access-roles)_ control what data people can access in a lakehouse. If you want to share only a subset of data in a lakehouse item, you must add a user or group to the OneLake data access role after you provide the appropriate lakehouse read permission.
- _[Deployment pipeline roles](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines)_ control who can deploy content between workspaces. While deployment pipelines aren't directly related to content distribution and sharing, how you decide to deploy content and who deploys it might affect your strategy to share content with creators.

> [!TIP]
> We recommend that you use [security groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups) to manage permissions and role membership instead of using individual user accounts, where feasible. That way, it's easier to manage especially when you have many users. You can use the same security groups to manage other access control, like [row-level security](/fabric/security/service-admin-row-level-security#working-with-members) role membership.
>
> For more information and use-cases for using security groups in Fabric and Power BI, see [Strategy for using security groups](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-using-groups).

### Manage item permissions

When you share content via workspace roles or app audiences, you apply certain _permissions_ to a set of content. These permissions define what an individual can do with the content. For example, if you give someone the Viewer workspace role, they get Read-only permissions to all items in that workspace, which means that they can only view that content, but not modify it or connect to data items to create their own content.

You can also share content via managing permissions to individual content items. For example, if you manage permissions of a semantic model, you can give someone Build permission to connect to and create their own content from that semantic model. When you share a content item via direct access, you're granting certain permissions to that item for user or group.

You can assign users to the following permissions to Power BI or Fabric items.

- **Read-only (view) permission:** Let someone see the content without modifying it. Some items, like [lakehouses](/fabric/data-engineering/lakehouse-sharing#sharing-and-permissions), allow more granular control of how users can view the content (like ReadData or ReadAll). Other items, like [semantic models](../connect-data/service-datasets-share.md), allow users to see [information about the item](../connect-data/service-dataset-details-page.md), but not view its contents (like the data).
- **Reshare permission:** Let someone share the content with others. If someone has both Reshare and Build permissions, they can also grant Build permission to someone else.
- **[Build permission](../connect-data/service-datasets-build-permissions.md)**: Let someone connect to the data item (like a [semantic model](../connect-data/service-datasets-build-permissions.md)) to create their own content (like [reports](../connect-data/service-datasets-discover-across-workspaces.md)). Consumers might also need Build permission to view reports based on [composite semantic models](../transform-model/desktop-composite-models.md#permissions-and-licensing). If you grant Build permission to a report or app audience, it will automatically apply to the underlying semantic models.
- **Write (modify) permission:** Let someone change an item and save their changes.

The remainder of this article guides you to make decisions about which roles and permissions you should give to content consumers and creators to share content with them.

> [!WARNING]
> Don't confuse Build permission with Write permission. For example, Build permission _does_ respect any data security (like row-level security) that's enforced for an item, while Write permission _does not_ (because a user can set and change those security rules).

> [!TIP]
> Content distribution and sharing overlaps with many other important areas. The following are topics covered in the Power BI implementation planning that you should also reference as you plan how you'll share and distribute content.
>
> - **[Workspaces](powerbi-implementation-planning-workspaces-overview.md):** How you plan to set up and use workspaces affects whether you'll share content from a workspace or not. [Workspace-level planning](powerbi-implementation-planning-workspaces-workspace-level-planning.md) is particularly important for your content distribution strategy, such as how you'll set up and manage [workspace access](powerbi-implementation-planning-workspaces-workspace-level-planning.md#workspace-access).
> - **[Data gateways](powerbi-implementation-planning-data-gateways.md):** When you distribute content to other users and that content relies on on-premises or VNet data gateways, you might also need to [manage gateway access](powerbi-implementation-planning-data-gateways.md#provision-gateway-access). Ensure that you manage access to both [the gateway](powerbi-implementation-planning-data-gateways.md#gateway-roles) and its [data source connections](powerbi-implementation-planning-data-gateways.md#data-source-connection-roles).
> - **[Content lifecycle management](powerbi-implementation-planning-content-lifecycle-management-overview.md):** How you decide you'll share content can affect how you'll manage the lifecycle of that content. You typically share content as part of your post-deployment activities, during [Stage 4: deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md).
> - **[Information protection and data loss prevention](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md):** Oversharing content or sharing content inappropriately is a governance and security risk for organizations. One way to mitigate this risk is to practice [data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md).
> - **[Security](powerbi-implementation-planning-security-report-consumer-planning.md):** Sharing is an important topic in the context of securing your Power BI and Fabric content. Ensure that you conduct [report consumer planning](powerbi-implementation-planning-security-report-consumer-planning.md) for sharing content to consumers, and [content creator planning](powerbi-implementation-planning-security-content-creator-planning.md) for sharing content to creators.
> - **[Auditing and monitoring](powerbi-implementation-planning-auditing-monitoring-overview.md):** You should regularly audit and monitor sharing activities and prevalence by conducting [tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md).

> [!IMPORTANT]
> For an overview of the relevant administration settings a Fabric administrator can use to control how creators share content, see [Export and sharing tenant settings](/fabric/admin/service-admin-portal-export-sharing).

## Plan to distribute content to consumers

Most people who use content in your organization will only need to view it (Read-only permission) and not change it (Write permission) or create their own content from it (Build permission). Content consumers are typically business users who need to access reporting items (in which case they're often called _[report consumers](powerbi-implementation-planning-security-report-consumer-planning.md)_). Some users might also need to request Build permission for data items to enable their own analyses in Power BI Desktop, Excel, or other client tools.

> [!NOTE]
> Typically, consumers who request Build permission perform [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md). However, over time, you can expect that some of these users will evolve from being strictly content consumers to becoming content creators who want to share their content with others.
>
> Anticipate early on how you'll [support and educate these users](fabric-adoption-roadmap-mentoring-and-user-enablement.md) not only on how to create content, but also on how they can appropriately share it.

Content consumers can be either internal or external to the organization, depending on whether they have a Microsoft Entra identity in the same organization as where you publish the content.

- **Internal users:** Users who belong to the same organization as the content that they consume.
- **External users:** Users who belong to a different organization as the content that they consume. These users can belong to an affiliate or subsidiary organization, despite sharing the same parent organization. They can also be temporary collaborators (like consultants) or customers.

The following diagram presents an overview of the different approaches that you can take to distribute Power BI or Fabric content to consumers inside or outside your organization.

> [!IMPORTANT]
> This diagram depicts an overview of many possible approaches. The rest of this article helps you to navigate these options and choose the ones that best fit your specific needs.

:::image type="content" source="media/powerbi-implementation-planning-content-distribution-sharing/share-consumers.svg" alt-text="Diagram shows approaches to distribute or share content to consumers. Each element of the diagram is described in the following table." border="false":::

The diagram depicts the following concepts and processes.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators create and deploy content in their organization. They can distribute content to other internal users who use Fabric (such as the Fabric portal or the Power BI mobile app). Creators can also share reporting items by embedding them in other internal, non-Fabric services. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Creators can also share items outside the organization. They can distribute content to external guest users who have been added to the organization with Microsoft Entra B2B. Creators can also share reporting items to external users. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Content is deployed in a Fabric tenant, where consumers can use or view it. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Fabric capacity is required to create and share Fabric items. Without a Fabric capacity, creators can still create, deploy, and share Power BI items (like dataflows, semantic models, and reports). |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Content is deployed to a workspace, which contains different items that can be organized into folders. Workspaces can belong to deployment pipelines and domains (not depicted in this diagram). |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Creators can share content to internal users or external guest users who are content consumers by assigning them to the [Viewer workspace role](../collaborate-share/service-roles-new-workspaces.md). This role grants read-only access to all content in the workspace. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Creators can share individual items to internal users or groups by providing direct access or sharing a link. People who use the link in the organization who don't have direct access can [request it](../collaborate-share/service-request-access.md#request-access). Creators who share content via links can also modify the URL to [filter the report by using query string parameters](../collaborate-share/service-url-filters.md). |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | Selected reporting items in a workspace can be packaged into an app. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Creators can distribute content with apps by creating and adding internal or external guest users who are content consumers to one or more app audiences. Content creators can choose to organize app content into audiences, with each audience having access to different subsets of content. |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | Creators might store content files—like Power BI Desktop (.pbix) files—in SharePoint or OneDrive for Work or School. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Creators can [share a link to .pbix files from SharePoint or OneDrive for Work or School](../collaborate-share/service-sharepoint-viewer.md#share-a-link-to-the-report-with-others). When an internal user has a Power BI Pro license, they can preview the reports from these files without opening them (even when the files aren't published to a workspace). Recipients of the link who don't have access or a Power BI Pro license can't preview the files. |
| ![Item 12.](../media/legend-number/legend-number-12-fabric.svg) | Creators can share reporting items via direct access by using non-Fabric experiences, such as: <br/><br/>&bull;&nbsp;Embed content in [Microsoft Teams](../collaborate-share/service-embed-report-microsoft-teams.md) (as a tab in a chat or team channel). <br/>&bull;&nbsp;Embed content in a [PowerPoint presentation](../collaborate-share/service-power-bi-powerpoint-add-in-about.md). <br/>&bull;&nbsp;Embed content in [SharePoint Online](../collaborate-share/service-embed-report-spo.md). <br/>&bull;&nbsp;Embed content in a [PowerApps canvas app](/power-apps/maker/canvas-apps/how-to/build-powerbi-visual) (which requires [PowerApps licenses](/power-platform/admin/pricing-billing-skus), but not an F, P, A, or EM SKU). <br/>&bull;&nbsp;Embed content in an [internal website](../collaborate-share/service-embed-secure.md) (also known as secure embed). <br/>&bull;&nbsp;Embed content in an [internal application](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-organization) (also known as _Embed for your organization_, which requires an F, P, A, or EM SKU). <br/>&bull;&nbsp;[Report subscriptions](../collaborate-share/end-user-subscribe.md?tabs=creator&preserve-view=true) and [paginated report subscriptions](../collaborate-share/end-user-subscribe.md?tabs=creator&preserve-view=true#subscribe-to-paginated-reports), which provide scheduled delivery of static reports via email. You can also use regular subscriptions and dynamic per recipient subscriptions for both [reports](../collaborate-share/power-bi-dynamic-report-subscriptions.md) and [paginated reports](../collaborate-share/dynamic-subscriptions.md). <br/>&bull;&nbsp;[Export to file API](/rest/api/power-bi/reports/export-to-file) (such as by using [Power Automate](../collaborate-share/service-automate-power-bi-report-export.md) to deliver exported reports via email). |
| ![Item 13.](../media/legend-number/legend-number-13-fabric.svg) | Creators also have various options to share reporting items to external users outside Fabric, such as: <br/><br/>&bull;&nbsp;Embed content securely in an external website (requires an F, P, A, or EM SKU). <br/>&bull;&nbsp;Embed content securely in an [external application](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-customers) (also known as _Embed for your customers_, which requires an F, P, A, or EM SKU). <br/>&bull;&nbsp;[Publish to web](../collaborate-share/service-publish-to-web.md) for reports, which makes content available to everyone through the public internet. Publish to web is recommended only for content that's suitable for a public audience. Publish to web isn't suited for sensitive or confidential reports. For more information, see [Publish to web from Power BI](../collaborate-share/service-publish-to-web.md). |

> [!NOTE]
> There are many valid approaches to distributing content. You might even use multiple approaches to distribute the same content, depending on your needs and use cases. What's important is that you find an approach that's effective and sustainable for you.

The following sections describe the steps you take to decide your approach to sharing content with consumers.

### Step 1: Identify who consumers are and how they get access

The first step when distributing content to consumers is to identify who will need access to what content. Depending on the number and type of consumers, you'll make different choices about how you distribute content.

Investigate and document answers to the following questions.

- How many consumers are there?
- Which content do these consumers need access to?
- Do consumers need access to data gateway data source connections to view content that uses DirectQuery to query on-premises or private network data sources?

> [!TIP]
> Ensure that you define who the consumers of the content are and how they will use it. One group of consumers might have different needs and preferences than another group, and they could benefit from a different content distribution strategy.

Generally, you can choose to either proactively distribute content, set up processes for users to request access themselves, or provision organization-wide access for all users.

The following sections help you to determine which is the better option for your circumstances.

#### Option 1: You distribute content to consumers

You can proactively distribute content to consumers, then notify them about the content and how they can access it. With this approach, you gather a list of all the consumers and assign them to a distribution group, mail-enabled group, or security group to facilitate sharing the content. You can then announce the content availability via a [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) or another method of communication.

> [!TIP]
> See [this tutorial](/entra/fundamentals/groups-view-azure-portal) for a step-by-step guide to create and add members to a Microsoft Entra security group.

This approach is beneficial when:

- You need to distribute content to a defined, large audience, like an entire department or region.
- You want tighter control of content access and releases, such as when you want to conduct user training for an app or report before providing access.
- You haven't yet set up processes for consumers to discover content.
- You use a [centralized model of content ownership](fabric-adoption-roadmap-content-ownership-and-management.md) and delivery.

#### Option 2: Consumers request access to content

You can also take a discovery-driven approach, where consumers can search for content that's relevant for them. With this approach, consumers browse a curated centralized portal for a list and description of the content that's available to them. When they select an item that they don't have access to, they can request access from the content owner, who must approve it before the content consumer can view that item.

This approach is beneficial when:

- You curate a centralized list of content for users to explore and access, such as one maintained on a Microsoft Teams channel or SharePoint site.
- You have processes in place for content owners to quickly and reliably respond to access requests.
- There are many possible items that users might want to view, depending on their current tasks and objectives.
- You use a [decentralized model of content ownership](fabric-adoption-roadmap-content-ownership-and-management.md#business-led-self-service) and [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md).

> [!TIP]
> Use [endorsement](../collaborate-share/service-endorse-content.md) to promote or certify quality content when you distribute it this way. Endorsement helps make quality and trustworthy content more easily discoverable by consumers.
>
> This approach works best to distribute content to creators (rather than consumers) in [managed](powerbi-implementation-planning-usage-scenario-managed-self-service-bi.md) or [customizable managed self-service BI](powerbi-implementation-planning-usage-scenario-customizable-managed-self-service-bi.md) usage scenarios. In these scenarios, you provide creators read-only access to semantic models that they can discover and request Build permissions to. These creators can then use these semantic models to make their own content.

#### Option 3: The entire organization can access the content

Some content might be relevant to the entire organization, like reports about organization-wide initiatives. With this approach, you share content either via apps or direct access, where the entire organization can access content in an app or by link.

This approach is beneficial when:

- Content and the underlying data are suitable for the entire organization.
- You have processes in place for content consumers to find and understand this content, such as training, office hours, or frequently asked questions (FAQ) pages.

> [!WARNING]
> Generally, you should limit which content is available to the entire organization. Some content owners might make apps and links available to the entire organization to circumvent the administrative overhead of managing content access. This approach can quickly lead to content oversharing, and users who can't find the content that they need.
>
> To avoid this situation, regularly [audit your tenant](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md) to identify and review the available organization-wide apps and links.

> [!TIP]
> Expect your approach to distributing content to evolve over time as you scale and grow. For example, you might start by distributing content to self-service users proactively. However, as you progress to higher [maturity levels](fabric-adoption-roadmap-maturity-levels.md) in key areas like [content ownership](fabric-adoption-roadmap-content-ownership-and-management.md), [content delivery scope](fabric-adoption-roadmap-content-delivery-scope.md), and [governance](fabric-adoption-roadmap-governance.md), you might scale to an approach where users discover and request access to content, themselves.

### Step 2: Identify where consumers will view the content

Once you've defined who the consumers are and how they should get access to content, you then identify where these individuals will view the content.

Consumers can view content in four different ways.

- Links to the individual content items
- Workspaces
- Apps
- Embedded in non-Fabric experiences, like other services, custom apps, or websites

The following sections help you to determine which is the better option for your circumstances.

#### Option 1: View individual content items in Fabric

You can give consumers access to individual content items, which they can access via a link. When you share content this way (called _direct access_), you can also give consumers the ability to reshare the content with others or build content with the underlying data items. If someone who receives the link doesn't have access to the item, they will be prompted to request access from the original content owner.

This approach is beneficial when:

- You share content to a limited audience, rather than distributing it to a wide audience.
- Consumers need access to only a few items.
- You want to later embed that content in another internal service or website.
- You want to provide users with a collection of links to different content.

When you share individual content items, consider the following points.

- Use endorsements to help consumers find and request access to quality content.
- [Audit and monitor published items](powerbi-implementation-planning-auditing-monitoring-overview.md#understand-published-items) to identify overshared or underutilized items to review.
- Create a process to regularly review pending [access requests](../collaborate-share/service-request-access.md). Ensure that feedback is provided to users when their access request is denied, explaining the reason, and where they might find alternative information.

> [!WARNING]
> Managing content access can quickly become a burden for content owners. As you improve your maturity level in content delivery scope, consider granting reshare access and training users how to share content among each other, where appropriate.

> [!TIP]
> Consumers with Reshare permission can make links to [shared views](../collaborate-share/service-share-reports.md), which can include state settings, like the current filter and slicer selections. Shared views can be helpful to facilitate discussions about interactive reports. They're also a good alternative to sharing static screenshots because recipients can interact with the content. For example, shared views are an effective way for users to report issues or discrepancies in reports, because creators can easily see the user's active slicer selections.
>
> Content owners can [manage shared views](../collaborate-share/service-share-reports.md#manage-the-shared-view) in the _Manage permissions_ pane.

#### Option 2: View content in a workspace

You can distribute content via [workspaces](powerbi-implementation-planning-workspaces-overview.md). With this approach, you grant consumers Read-only permission to workspace content by adding them to the Viewer role. Viewers can't modify the content or create new content from the items in that workspace. Instead, you distribute a link to the workspace where they can browse and open the individual content items, themselves.

> [!TIP]
> For more information about workspace roles, see [Roles in workspaces](../collaborate-share/service-roles-new-workspaces.md#workspace-roles).

This approach is beneficial when:

- Consumers prefer the workspace experience over the app experience.
- You separate workspaces by item type and have only reporting items in the workspace.
- You want to give users the ability to view data items in a workspace and request Build permissions.
- You want the content reviewed prior to publishing an app.

When you plan to distribute content to workspace viewers, consider the following points.

- Organize workspace items into [folders](/fabric/get-started/workspaces-folders). Workspace organization makes it easier for consumers to find what they need.
- Place content not meant for direct consumption in other workspaces. Separating workspaces by item type ensures that consumers won't be confused or overwhelmed by items that aren't for them to use.
- Regularly [audit workspace role membership](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md). Monitoring role membership helps to avoid situations where a consumer is mistakenly granted elevated permissions.

> [!TIP]
> Ensure that you use clear [workspace naming conventions](powerbi-implementation-planning-workspaces-tenant-level-planning.md#workspace-naming-conventions) so that users can easily find workspaces that contain the content they need.

#### Option 3: View content in an app

You can distribute content via [apps](../consumer/end-user-apps.md), which bundle related content in a straightforward user interface that streamlines the experience for content consumers. Unlike viewing content in workspaces, apps don't confuse or overwhelm consumers by showing non-reporting items (like semantic models). Additionally, when you distribute content via apps, there's no risk of accidentally giving consumers Write permissions. Apps require you to share content by adding consumers to an [app audience](../collaborate-share/service-create-distribute-apps.md#create-and-manage-multiple-audiences). It's also possible to share an app with the [entire organization](../collaborate-share/service-create-distribute-apps.md#publish-the-app-to-your-entire-organization).

You can't publish an app to provide access to content from multiple workspaces. If you want to share content that's published to multiple workspaces with the same consumer, you must either publish multiple apps, or grant them access to the individual items or workspaces.

This approach is beneficial when:

- You want to distribute multiple workspace items (but not all items) to consumers.
- You need to distribute content from a single workspace to many consumers.
- You want to give different consumers access to different subsets of app content.

When you share content in an app, consider the following points.

- Organize content into folders so that it's easier for consumers to find what they need.
- [Add links to the app](../collaborate-share/service-create-distribute-apps.md#add-content-to-the-app) for users to request support, report issues, or provide feedback.
- Include a [useful app description and contact person](../collaborate-share/service-create-distribute-apps.md#set-up-the-app) so that users know what the app is about.
- When reports use [shared semantic models](../connect-data/service-datasets-across-workspaces.md), which are located in other workspaces, ensure that consumers have access to those semantic models so they can view reports in the app.

> [!TIP]
> Generally, we recommend that you distribute content to consumers by using apps. Apps provide a more polished experience than providing access with workspace roles or sharing a collection of links to individual items.

#### Option 4: View content from other services

You have various options to distribute content for consumers in your organization outside of Fabric. In this situation, content consumers view the content from other applications and services.

> [!IMPORTANT]
> Consumers who view content from other services still require direct access to the Power BI item. Ensure that you first share the individual items with these users or distribute the items via direct access to a security group that the users belong to.

This approach is beneficial when:

- Consumers intend to use the content alongside, or together with, other applications.
- You require other services or applications to deliver the best experience for consumers.
- You want to provide convenient access to content spread across multiple workspaces (such as from a SharePoint Online or internal website portal).

Additionally, each approach has specific use cases that they can support, such as the following examples.

- **[Embed in Microsoft Teams](../collaborate-share/service-embed-report-microsoft-teams.md):** This option can be beneficial when you use Power BI reports to help coordinate project or other collaborative work.
- **[Embed in PowerPoint](../collaborate-share/service-power-bi-powerpoint-add-in-about.md):** This option can be beneficial when you want to integrate Power BI reports in your presentations or display multiple reports continuously on a screen (such as reports that show incidents or open orders in a manufacturing plant).
- **[Embed in SharePoint Online](../collaborate-share/service-embed-report-spo.md):** This option can be beneficial when you want to centralize reports in a SharePoint site to enable collaborative work, or when SharePoint is the preferred way to distribute and manage access to different kinds of content in the organization.
- **[Embed in Power Apps canvas apps](/power-apps/maker/canvas-apps/how-to/build-powerbi-visual):** This option can be beneficial when you want Power BI content to inform user decisions and actions in an app built with [Power Apps](/power-apps/powerapps-overview). For example, you might have an app for registering seats in an open office, and a Power BI report that shows data about seat availability and office occupancy. However, Power Apps requires [licenses for both creators and consumers](/power-platform/admin/pricing-billing-skus).
- **[Embed in an internal website or external application](../collaborate-share/service-embed-secure.md):** This option can be beneficial when you want to integrate Power BI reports with other custom developed content. However, this approach requires more development effort. When done for an internal website, you can use the [For your organization](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-organization) embedding approach. When done for an external application, you can use the [For your customers](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-customers) embedding approach, and it will require either Fabric capacity (F SKU) or Power BI Embedded (EM SKU).
- **[Report subscriptions](../collaborate-share/end-user-subscribe.md?tabs=creator&preserve-view=true):** This option lets you subscribe consumers to reports and paginated reports, which can deliver static reports to an email or SharePoint site on a schedule. Additionally, for reports, subscriptions have the benefit of notifying consumers when the data in the underlying semantic model is updated (after a refresh). This is best combined with other methods, like sharing content from an app. That way, consumers know only to check the app once the content inside is updated.
- **[Export-to-file API](/rest/api/power-bi/reports/export-to-file):** This option enables limited scenarios when you want to distribute static versions of reports as a PDF document (.pdf) or PowerPoint (.pptx) file.

> [!WARNING]
> Avoid distributing content as exported files unless it's absolutely necessary. For example, it's common for users to request exported reports via email or SharePoint. This approach isn't a content distribution strategy that scales. Also, files can create governance and security risks. Furthermore, users can't benefit from interactive functionality, like cross-filtering or drillthrough in reports.
>
> Often, a preference for distributed files is an indication of a low maturity level, and a need for [user mentoring and enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md), and [change management](fabric-adoption-roadmap-change-management.md).
>
> A good example of when you might distribute files is when reports must be kept for auditing purposes.

> [!TIP]
> If you do choose to distribute content via report subscriptions or exports, consider using [sensitivity labels](powerbi-implementation-planning-info-protection.md#purpose-of-sensitivity-labels) with [Microsoft Purview Data Loss Prevention policy for Power BI](powerbi-implementation-planning-data-loss-prevention.md#microsoft-purview-dlp-policies-for-power-bi). For example, when you use sensitivity labels, you can prevent exported files with sensitive data from exfiltrating your organization.

### Step 3: Identify whether consumers are outside the organization

In some cases, you might need to distribute content to external consumers. In this case, you have several options to distribute content outside the organization.

#### Option 1: Create duplicate identities for external consumers

In this approach, you create duplicate identities for external consumers that become internal consumers. An Azure administrator creates a new account for the external consumer in the tenant that they must use to access that content. Then, a Microsoft 365 administrator allocates the appropriate per-user licenses to the new identity for them to access content. While this option is the simplest, it involves further overhead and cost to create and manage new accounts.

This approach is beneficial when:

- [Limitations of Microsoft Entra B2B](../enterprise/service-admin-azure-ad-b2b.md#considerations-and-limitations) prevent you from doing what you need to do. Examples of limitations of Microsoft Entra B2B for consumers include:
  - External guest users might not be able to open files exported from reports that have a sensitivity label with protection settings.
  - External guest users can't use Power BI Desktop to connect to semantic models or dataflows that are in the Power BI service.
  - External guest users can't use Analyze-in-Excel.
- You don't have the development skills or resources to embed content in a custom application.
- There aren't many long-term, external consumers.

#### Option 2: Create a Microsoft Entra B2B guest account for external consumers

[Microsoft Entra B2B](/azure/active-directory/b2b/what-is-b2b) is a good option to [distribute content to external consumers](whitepaper-azure-b2b-power-bi.md#alternative-option-1-create-duplicate-identities-for-partner-users). With this approach, an Azure administrator adds the external consumer as an external guest user in Microsoft Entra ID. If the external user is required to access content, the Azure administrator or a Microsoft 365 administrator can provision a per-user license for the identity. External users can also _bring your own license (BYOL)_ from their organization to access content that requires a per-user license. When the guest user has an appropriate license, creators can then share content with them.

> [!TIP]
> If you need to distribute content to consumers outside of your organization, we strongly recommend that you read [Distribute Power BI content to external guest users using Microsoft Entra B2B](whitepaper-azure-b2b-power-bi.md).

The following diagram depicts how you can share content with external users by using Microsoft Entra B2B.

In summary, external users are made external guest users by an Azure administrator. If the guest user requires a license, a Microsoft 365 administrator can then assign a license to the guest user. These guest users can then access Fabric, including workspaces, apps, and items. Access to Fabric by external guest users can be controlled in the tenant settings by a Fabric administrator.

> [!NOTE]
> Consumers don't require a Power BI Pro license to view content in a Fabric capacity. However, creators do require a Power BI Pro license to create and share Power BI content, and consumers require a Power BI Pro license to view content in a workspace that uses Pro or Premium per user (PPU) license mode.

> [!IMPORTANT]
> Microsoft Entra B2B requires that you enable specific admin settings in the Fabric admin portal. For an overview of the relevant admin settings a Fabric administrator can use to control how creators share content, see [Export and sharing tenant settings](/fabric/admin/service-admin-portal-export-sharing).

Here are some scenarios where you can use Microsoft Entra B2B to deliver content to external consumers.

- [Direct collaboration between organizations](whitepaper-azure-b2b-power-bi.md#case-1-direct-collaboration-between-organizations)
- [Parent and subsidiaries or affiliates](whitepaper-azure-b2b-power-bi.md#case-2-parent-and-its-subsidiaries-or-affiliates)
- [Shared tenant among partner organizations](whitepaper-azure-b2b-power-bi.md#case-3-shared-environment-across-partners)
- [Distribution to many external partners](whitepaper-azure-b2b-power-bi.md#case-4-distribution-to-hundreds-or-thousands-of-external-partners)

This approach is beneficial when:

- There's a manageable number of external consumers.
- You have Fabric capacity and want external consumers to benefit from free viewership, or the external consumers have their own Power BI Pro licenses to use with BYOL.
- You don't have the development skills or resources to embed content in a custom application.

> [!WARNING]
> Microsoft Entra B2B is subject to [limitations](/entra/external-id/current-limitations) that you should keep in mind. Plan carefully and conduct a test with one or more external users before you commit to your content distribution approach.

#### Option 3: Embed content in a custom website or application

In this approach, you use an F, P, A, or EM SKU to embed content in a custom external website or application ([Embed for your customers](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-customers)). This approach requires skills, time, and resources to develop a custom application and manage authentication. However, it provides flexibility and control over the access process.

This approach is beneficial when:

- You have the expertise, time, and resources to develop and maintain a custom application.
- You have an existing custom application that you want to embed Power BI content in.
- You distribute content to many external parties or customers.
- You want to monetize access to proprietary Power BI content to earn revenue.

#### Option 4: Publish content for a public audience by using Publish to web

Publish to web provides access to Power BI reports to anyone on the internet. It doesn't require authentication and access isn't logged for auditing purposes. Because report consumers don't need to belong to the organization or have a Power BI license, this technique is well suited to data journalism, a process where reports are embedded in blog posts, websites, emails, or social media.

This option is beneficial when:

- Content doesn't contain sensitive information and is intended for a public audience.
- You want to embed or link to the content in a public website, for example by using an HTML iframe element.

> [!CAUTION]
> The Publish to web feature is a powerful technique that shares Power BI reports with the world. However, it has the potential to expose private or sensitive data, whether accidentally or intentionally. For this reason, this feature is disabled by default. A Power BI administrator must enable the feature and should restrict its use to specific trusted users or security groups.

> [!WARNING]
> Publish to web is subject to many [limitations](../collaborate-share/service-publish-to-web.md#considerations-and-limitations). Test that your report is supported by Publish to web before committing to this approach.

### Step 4: Identify consumer licensing considerations

By now, you're ready to decide how to distribute content to consumers. You should now ensure that consumers have appropriate licenses to access and view that content. Depending on how you decide to distribute content, you might need per-user, per-capacity, or other licenses.

- **Per-user licenses:** Content consumers might require Microsoft Fabric Free, Power BI Pro, or Premium Per User (PPU) licenses to view content, depending on other factors (described later in this section).
- **Per-capacity licenses:** Your organization requires either a Fabric capacity (F SKU) or Power BI Embedded (EM SKU) to embed content in a custom application.
- **Other licenses:** If you distribute content by using other services or applications, content consumers might require other licenses. For example, both content creators and consumers require a Power Apps license to distribute and view content by using this service.

> [!NOTE]
> Before you decide on your approach to distributing content, ensure that you estimate the monthly (and annual) licensing costs (if new licenses are required). This proactive approach can help to avoid surprises that could delay content delivery or lead to unexpected issues and costs later on.

> [!TIP]
> See [subscriptions, licenses, and trials](powerbi-implementation-planning-subscriptions-licenses-trials.md) for guidance about per-user and per-capacity licenses.

The following sections outline specific per-user licenses you might need for consumers.

#### Scenario 1: Consumers require no license

While content creators always require a license to publish and share content, there are certain circumstances where consumers don't require a license to view published content.

- Content is distributed publicly via Publish to web.
- Consumers access embedded content via an external website or application (which uses the [For your customers](/javascript/api/overview/powerbi/embedding-solutions#embed-for-your-customers) embedding approach).

#### Scenario 2: Consumers require Microsoft Fabric Free licenses

When you distribute or share content that's published to a Fabric capacity, consumers still require a license to access that content. They can do so at no cost with a Microsoft Fabric Free license, and they don't need any other per-user license, like Power BI Pro. An organization has unlimited Microsoft Fabric Free licenses, which they can use to provide access to Fabric and Power BI content.

#### Scenario 3: Consumers require Power BI Pro licenses

Content creators always require a Power BI Pro license to share Power BI content, even if that content is published in a workspace on Fabric capacity. However, content creators don't require a Power BI Pro license to create or share Fabric content.

Content consumers require a Power BI Pro license to:

- Consume content that's in a workspace that doesn't use Fabric capacity license mode.
- Share Power BI content with other consumers.
- Preview shared .pbix files that are stored in OneDrive for Work or School, or SharePoint.
- Use a Microsoft Entra B2B guest account that can't use bring your own license (BYOL).

#### Scenario 4: Consumers require Power BI Pro or PPU licenses

If content is published to a workspace that uses PPU license mode, then both content creators and content consumers require a PPU license to share and view that content.

> [!NOTE]
> Granting a user a Power BI Pro or PPU license doesn't automatically grant them build or write permissions to Power BI items that are already deployed to a workspace. Licenses affect what a user can do, but have no effect on item permissions or the various roles within Fabric.

### Step 5: Identify whether consumers require Build permission

Some consumers might have more advanced needs that aren't met with the available read-only content. These consumers could benefit from having Build permission on the underlying data items (like semantic models) so that they can create new content (like reports).

Eventually, consumers might want to share this content with others, at which point they also become content creators.

> [!CAUTION]
> If you grant Build permission, ensure that you train content consumers about how to create their own content by using Power BI or Excel. If you don't, these users might use their permissions to export data to Excel, which invalidates the benefit of them having Build permission in the first place.

#### Option 1: No Build permission

The simplest scenario is when users only need to view content, and they don't want to produce their own content.

This approach is beneficial when:

- You currently lack the resources or processes to support consumers so that they can successfully create their own content.
- You haven't yet trained users how to connect to and create content from data items.
- Consumers express that they only want to view content and not create it.
- There's no business need for consumers to create their own content.

In these scenarios, you should seek to provide alternative approaches to granting Build permission when consumers still want to analyze and explore data.

Consider the following Power BI features that provide flexibility to consumers.

- **Field parameters:** You can create [field parameters](../create-reports/power-bi-field-parameters.md) in semantic models that support the dynamic selection of dimensions and measures in reports. This option provides users with the ability to select the field from a slicer, and that field will be then used in visuals.
- **Decomposition tree visual:** You can use the [decomposition tree](../visuals/power-bi-visualization-decomposition-tree.md) visual in reports to let consumers explore data across multiple dimensions.
- **Personalize visuals:** You can enable [personalization of visuals](../consumer/end-user-personalize-visuals.md) in a report, which lets consumers change visuals to suit themselves. They can modify any visual, including the visual type, format settings, and which fields the visual uses. They can also customize the report page to any field you pre-select from the model, enabling them to perform ad hoc analysis.

> [!NOTE]
> If consumers don't require Build permission now, they might need it in the future. Business objectives and data needs quickly evolve, and teaching users to create their own content and perform their own analysis is a good way to scale your implementation by [enabling users](fabric-adoption-roadmap-mentoring-and-user-enablement.md) and improving your [data culture maturity](fabric-adoption-roadmap-data-culture.md).

#### Option 2: App audience Build permission

You can grant Build permission to members of an app audience, which applies to all the underlying semantic models for the reports and dashboards that are included in the app.

This approach is beneficial when:

- You distribute content by using Power BI apps.
- Consumers require Build permission only for semantic models.
- You need to give multiple users Build permission to multiple items in the same workspace.

> [!WARNING]
> Don't grant Build permission by adding consumers to the [Admin, Member, or Contributor workspace roles](../collaborate-share/service-roles-new-workspaces.md#workspace-roles). These roles grant _Write_ permission, and not _Build_ permission. When users have Write permission, RLS is not enforced, since consumers can view and modify the security rules.

#### Option 3: Item Build permission

You can grant build permissions to individual data items in a workspace.

This approach is beneficial when:

- You provide access to workspace content by adding consumers to the Viewer role.
- You need to grant Build permission on specific items.
- You plan to grant Build permission to a small subset of users.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning content distribution to consumers, key decisions and actions include:

> [!div class="checklist"]
> - **Define who you'll distribute the content to:** If you haven't done so already, determine how many users will need access to the content. Define any relevant user segments, and whether these users have different needs or ways of using the content that could affect the distribution method.
> - **Plan your data security model:** Determine whether your content has data security applied, and how you'll manage security role membership.
> - **Plan your permission model:** Determine who should get access to which content, and how this affects your distribution methods.
> - **Create Microsoft Entra security groups and add users to groups:** Using security groups to manage role membership, access, and permissions is more efficient and scalable than managing individual accounts.
> - **Add security groups to data security roles:** If you use row-level security or object-level security, ensure that you assign security groups to the appropriate roles.
> - **Share data gateways:** If necessary, provision data gateway access by adding consumers to data source connections by using the User (or User with sharing) role.
> - **Decide how you'll handle external users:** Identify whether you need to share content to any consumers outside the organization. If so, decide the approach you'll take to share content with these users.
> - **Add external guest users:** If you'll share content using Microsoft Entra B2B, request that the relevant administrators add the guest users.
> - **Allocate per-user licenses:** Ensure that consumers have the appropriate licenses to access content. If you plan to embed content in other services, ensure that you check whether those services have other licensing requirements.
> - **Decide on the approach to share content:** Decide whether you'll share content via apps, workspaces, or direct access to individual items. If you use direct access, decide how users should access the items (such as via a centralized portal, or via content embedded in another service like Teams).
> - **Decide how you'll grant Build permission:** Decide whether you'll grant Build permission at all, and if so, whether you grant it via app audiences or individual content items.
> - **Grant Build permission:** If necessary, grant Build permission to users who need it to perform their own analysis on the underlying data items.

## Plan to share content with other creators

In enterprise and self-service scenarios, you'll need to share content with other creators. Sharing content with other creators facilitates [collaboration](powerbi-implementation-planning-content-lifecycle-management-plan-design.md#decide-how-content-creators-should-collaborate) among developers who work on the same content. It also facilitates [data discovery](fabric-adoption-roadmap-data-culture.md#data-discovery) and [data democratization](fabric-adoption-roadmap-data-culture.md#data-democratization) among self-service users who create their own content.

The following diagram presents an overview of the different approaches that you can take to share content with other creators.

:::image type="content" source="media/powerbi-implementation-planning-content-distribution-sharing/share-creators.svg" alt-text="Diagram shows approaches to distribute or share content and data with other creators. Each element of the diagram is described in the following table." border="false":::

The diagram depicts the following concepts and processes.

| **Item** | **Description** |
| :-: | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Content creators create and deploy content in their organization. They can share content with other internal users who use Fabric (such as the Fabric portal or the Power BI mobile app). |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Creators can also share items outside the organization. They can distribute content to external guest users who have been added to the organization with Microsoft Entra B2B. In some scenarios, creators can also share their content files to external users. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | Content is deployed in a Fabric tenant, where creators can use or view it. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Fabric capacity is required to create and share Fabric items. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Content is deployed to a workspace. |
| ![Item 6.](../media/legend-number/legend-number-06-fabric.svg) | Creators can distribute content with other internal users or external guest users who are content creators by assigning them to the _Admin_, _Member_, or _Contributor_ [workspace roles](../collaborate-share/service-roles-new-workspaces.md). The [principle of least privilege](/entra/identity-platform/secure-least-privileged-access) is recommended when sharing content by workspace role. |
| ![Item 7.](../media/legend-number/legend-number-07-fabric.svg) | Creators can also share content with other internal users or external guest users who are content creators by sharing individual items via links. When creators have access to data items from direct access or workspace roles, they can discover this content by using the OneLake data hub. |
| ![Item 8.](../media/legend-number/legend-number-08-fabric.svg) | In a workspace on Fabric capacity, creators can make and use [lakehouses](/fabric/data-engineering/lakehouse-overview), which define tables and files in folders. |
| ![Item 9.](../media/legend-number/legend-number-09-fabric.svg) | Creators can share data in a lakehouse folder to other internal users or external guest users who are creators by using [OneLake data access roles](/fabric/onelake/security/get-started-data-access-roles) (also known as role-based access control, or RBAC). |
| ![Item 10.](../media/legend-number/legend-number-10-fabric.svg) | In a workspace on Fabric capacity, creators can make and use [KQL databases](/fabric/real-time-intelligence/create-database), which comprise tables and files in folders. |
| ![Item 11.](../media/legend-number/legend-number-11-fabric.svg) | Creators can share data from a lakehouse or KQL database folders with external users outside the organization by using [external data sharing](/fabric/governance/external-data-sharing-overview). |

### Step 1: Identify who creators are and how they get access

The first step when sharing content with creators is to identify who they are and how they should get access to the items or data that they need to make and share their own content.

You're then ready to complete the following tasks.

- **Share gateways:** If necessary, provision data gateway access by adding consumers to data source connections in the User (or User with sharing) role.
- **Create workspaces:** Create and share access to a workspace where creators should publish their content, if they don't have one already. Creators might need access to more than one workspace if they plan to use separate workspaces to develop, test, and share content with consumers. Alternatively, you might share access to an [existing workspace](#option-2-workspace-access) that contains other content that creators need access to (described later in this article).
- **Allocate licenses:** Creators need different licenses depending on the content that they produce.
  - Power BI Pro licenses are always required to create and share Power BI content.
  - PPU licenses are required to create and share content if the workspace uses PPU license mode.
  - No license is required to create and share Fabric items if the workspace is on Fabric capacity.

#### Option 1: You provide access to creators

You can proactively share content with creators, like the approach [described for content consumers](#option-1-you-distribute-content-to-consumers).

This approach is beneficial when:

- Creators need access to only a few data items.
- You want more control over what content creators can find and use.

#### Option 2: Creators find items and request access from the OneLake data hub

You should encourage users to use the [OneLake data hub](/fabric/get-started/onelake-data-hub) to discover content that they can use as a data source. There, and when necessary, content creators can request access to these data items. When they're granted Build permission, they can then create new content from these items.

> [!IMPORTANT]
> To see a data item in the OneLake data hub, it creators must either have access to that item, or it must be marked as [discoverable](../collaborate-share/service-discovery.md). For example, you can give creators Read-only permission to semantic models or mark those models as discoverable, so that users can find them and then request Build permission to use them.

This approach is beneficial when:

- You use endorsements to promote and certify quality content.
- You mark content as discoverable so that users can find it from the OneLake data hub.
- You've created a process to sustainably manage access requests.
- Users have undergone training on how to find and use data items in Fabric.

### Step 2: Decide on creator permissions

Depending on how creators will use the content, they might need different permissions.

#### Option 1: Write permission

You can grant content creators Write permission to edit and collaborate on an item. When you grant content creators Write permission, ensure that you also grant access to content files, if necessary.

Grant creators Write permissions when:

- Creators need to change or manage the item.
- You will collaborate with the creators on the item.

> [!TIP]
> If content creators will collaborate, you should [plan how they can best do this](powerbi-implementation-planning-content-lifecycle-management-plan-design.md#decide-how-content-creators-should-collaborate). For example, consider how you can leverage [version control](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md#decide-how-youll-use-version-control) to track and manage changes.

#### Option 2: Build permission

You can grant content creators Build permission to connect to and use semantic models to create new content. With Build permission, content creators won't be able to modify the original item.

Grant creators Build permissions when:

- Creators will create new content from existing semantic models

> [!IMPORTANT]
> Some data item types—like lakehouses or data warehouses—don't use Build permissions. Instead, if creators want to use these data items to create their own content, you should grant them Read permissions.

#### Option 3: Read permission

You can grant creators Read permission to certain Fabric data items, like lakehouses. That way, they can make their own content (like semantic models and reports) without modifying the original data item.

Grant creators Read permissions when:

- Creators should discover semantic models in the OneLake data hub to view their metadata and then request Build permission from the content owner.
- Creators should use Fabric data items like lakehouses or data warehouses to make their own content.

### Step 3: Identify whether creators are outside the organization

If content creators outside the organization require access to items or data, then you'll need to take specific actions. The scenarios and considerations for content consumers also apply here.

You have several options to share content with external creators. The first two options are similar to how you share content with external consumers, except you provide creators Write permissions.

#### Option 1: Create duplicate identities for external creators

You can [create a new account for the external consumer](#option-1-create-duplicate-identities-for-external-consumers) in your tenant that they must use to access that content.

Consider using duplicate identities for external creators when:

- External creators need to access other internal services, or they prefer to use a separate, internal account.
- Organizational policies or administrator settings don't allow for B2B sharing.
- [Limitations of Microsoft Entra B2B](../enterprise/service-admin-azure-ad-b2b.md#considerations-and-limitations) prevent you from doing what you need to do. Examples of limitations of Microsoft Entra B2B for creators include:
  - External guest users can't use Power BI Desktop to connect to semantic models or dataflows that are in the Power BI service and can't publish from Power BI Desktop.
  - External guest users can't set sensitivity labels.
  - External guest users can't install an on-premises data gateway.

#### Option 2: Create a Microsoft Entra B2B guest account for external creators

You can [add the external creator as a guest user](#option-2-create-a-microsoft-entra-b2b-guest-account-for-external-consumers) and share the item with them. Guest users can bring their own Power BI Pro or PPU license to use in the host tenant. However, guest users have several key limitations when creating and sharing Power BI content with others, such as the [limitations for in-place semantic model sharing](../collaborate-share/service-dataset-external-org-share-about.md#considerations-and-limitations).

Consider distributing content to external guest users when:

- External creators have their own Power BI Pro and PPU licenses.
- You will share a few content items with a few external creators to use.
- You will distribute content to many external creators who have.

> [!IMPORTANT]
> Ensure that you test whether Microsoft Entra B2B is the best approach for you before you decide to use it. We suggest that you conduct a small trial with several creators before you commit to this content distribution strategy. During this trial, ensure that the creators perform all their necessary activities to discover any possible caveats or limitations that might prevent them from doing what they need to do.

> [!TIP]
> External content consumers can use the OneLake data hub to [view and access semantic models in their own tenant that have been shared with them](../collaborate-share/service-dataset-external-org-share-view.md). This concept is known as _in-place semantic model sharing_, and it requires that Fabric administrators enable the [_Guest users can work with shared semantic models in their own tenants_](../collaborate-share/service-dataset-external-org-share-admin.md#guest-users-can-work-with-shared-semantic-models-in-their-own-tenants) tenant setting.
>
> External content consumers can connect to these semantic models to create [composite semantic models](../collaborate-share/service-dataset-external-org-share-view.md#access-shared-semantic-models) and [reports](../collaborate-share/service-dataset-external-org-share-view.md#publish-reports-made-from-shared-semantic-models) that they can publish to workspaces in their own tenant.

> [!WARNING]
> [Microsoft Entra B2B](/entra/external-id/current-limitations) and [in-place semantic model](../collaborate-share/service-dataset-external-org-share-about.md#considerations-and-limitations) sharing both have various considerations and limitations that you should keep in mind.

### Step 4: Identify what creators need to access

You can grant access to creators at four different levels, depending on what they need to do.

- **Deployment pipeline access:** Gives creators access to a [deployment pipeline](/fabric/cicd/deployment-pipelines/intro-to-deployment-pipelines) and lets them trigger deployments to promote content between stages. Creators require access to the underlying workspaces to use deployment pipelines.
- **Workspace access:** Gives creators access to all the content in a workspace.
- **Item access:** Gives creators access to a single content item within a workspace.
- **Data access:** Gives creators access to specific data within an item. Creators require Write permission for an item to apply data access to data within that item.

> [!NOTE]
> Creators might require access to multiple options, depending on your scenario. For example, you might provide a creator item access to a lakehouse, and data access to limit what they can use from that lakehouse. Then, you might provide that creator access to several workspaces to publish their semantic models and reports, and a deployment pipeline to deploy their content between those workspaces.

> [!CAUTION]
> Follow the [principle of least privilege](/entra/identity-platform/secure-least-privileged-access) when providing creators access to deployment pipelines, workspaces, and items. For example, avoid assigning creators to workspace roles with permissions that they don't need, like the Admin or—if they don't need to update the app or workspace configuration—the Member role.

The following sections help you to determine which access creators should get.

#### Option 1: Deployment pipeline access

You can give creators access to a deployment pipeline to manage content deployment between multiple workspaces. These creators can also change the deployment pipeline and review deployment history.

This approach is beneficial when:

- You'll use deployment pipelines to deploy content between workspaces.
- The content creator will be responsible for reviewing content and during the deployment process.

> [!TIP]
> Limit deployment pipeline access to only a few individuals who will be responsible for deciding when to deploy or release content to the next stage.

#### Option 2: Workspace access

You can give creators access to all content in a workspace by assigning them to either the Member or Contributor workspace role.

This approach is beneficial when:

- Creators will also get deployment pipeline access.
- Creators should collaborate in the workspace.
- You use Git integration to track and manage content changes in a remote repository that's linked to the workspace.
- Creators need to use a Dataflow.

> [!TIP]
> Ensure that you provide content creators access to a workspace to publish their content. If they should publish content to the same workspace as the original item they're using, ensure that you make this clear to them.

#### Option 3: Item access

You can give creators access to individual content items in a workspace by sharing via direct access. With this approach, you share a link to the item (similar to when you [share individual items with consumers](#option-1-view-individual-content-items-in-fabric)), or creators request access after they discover the content in the OneLake data hub.

This approach is beneficial when:

- Creators will only use one or a subset of items in a workspace.
- You want to share items with creators without providing workspace access.
- Creators should publish the content they create to their own, separate workspace.
- Creators should discover data items from the OneLake data hub.

> [!NOTE]
> Sharing access to a data item like a lakehouse or semantic model will also give that user access to the underlying data in that item. It's not the same as granting data access to objects like tables or files by using OneLake data access roles (or RBAC).

> [!IMPORTANT]
> You cannot share some individual content items, such as Dataflows. For these items, you must provide workspace access for creators to view and use the item.

#### Option 4: Data access

In some circumstances, content creators will need access to underlying data. In this case, creators might want to transform or enrich that data for other purposes. You have two options to share data in Fabric.

- **[OneLake data access role](/fabric/onelake/security/get-started-data-access-roles):** You can give someone a data access role for data in a folder of a lakehouse. This approach lets you apply RBAC to OneLake data to limit what data someone can see.
- **[OneLake shortcuts](/fabric/onelake/onelake-shortcuts):** While not strictly a sharing technique, you can provide access to data by creating [internal OneLake shortcuts](/fabric/onelake/onelake-shortcuts#internal-onelake-shortcuts) to reference data within existing Fabric items. This approach lets you reuse data across teams and workspace while maintaining a single copy of the data.

These approaches might be beneficial when:

- Your organization has Fabric capacity and uses lakehouses to store data for creators.
- You want to restrict the data that a creator can see and use from a lakehouse.
- Creators want to transform the underlying data to use in other data items.
- Creators are unable to use other approaches, like [composite semantic models](../transform-model/desktop-composite-models.md).

> [!IMPORTANT]
> Creators must have ReadAll or Write permission to the lakehouse (either via workspace access or item access) to belong to a OneLake data access role. Creators must have Write permission to the lakehouse to create shortcuts. You can't provide data access without first granting access to the item that contains that data.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When sharing content with other creators, key decisions and considerations include:

> [!div class="checklist"]
> - **Identify how content creators get access to content:** Decide whether you'll proactively grant access to content creators, or whether they're expected to find and request access to content themselves from the OneLake data hub.
> - **Create a workspace for creators to publish content:** Ensure that creators have an available workspace to publish semantic models and reports, or to create other content in the Fabric portal.
> - **Allocate licenses to creators:** Work with an appropriate administrator to ensure that creators have the appropriate per-user licenses to create and share content.
> - **Decide what permissions creators should have:** Decide whether creators need Read, Build, or Write permission to existing content.
> - **Share data gateways:** If necessary, provision data gateway access by adding consumers to data source connections in the User (or User with sharing) role.
> - **Decide how you'll handle external users:** Identify whether you'll collaborate with any creators outside the organization. If so, decide the approach you'll take to share content with these users.
> - **Add external guest users:** If you'll share content by using Microsoft Entra B2B, request that the relevant administrators add the guest users.
> - **Decide whether creators need access to existing items:** Identify whether content creators need access to deployment pipelines, workspaces, individual content items, or data within lakehouses or KQL databases.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
