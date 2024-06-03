---
title: "Power BI implementation planning: Subscriptions, licenses, and trials"
description: "This article helps you to plan for subscriptions, licenses, and trials for Power BI and Microsoft Fabric."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 05/23/2024
---

# Power BI implementation planning: Subscriptions, licenses, and trials

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces the key considerations for planning subscriptions, licenses, and trials for Power BI and Fabric. This article is targeted at:

- **Billing administrators:** The administrators who are responsible for purchasing subscriptions and analyzing costs.
- **Azure administrators:** The administrators who are responsible for purchasing and managing Azure subscriptions and services.
- **Fabric administrators:** The administrators who are responsible for overseeing Fabric in the organization.
- **License and user management administrators:** The administrators who are responsible for assigning licenses (that have been purchased) to users.
- **Center of Excellence (COE) and BI teams:** The teams that are responsible for overseeing Power BI and supporting Power BI users in the organization. These teams make key decisions and collaborate with the Fabric administrators.
- **Content owners and creators:** This article might also be relevant for self-service content creators who need to obtain licenses so that they can create, publish, and manage content.

One key aspect of managing Microsoft Fabric is to ensure that users have access to the capabilities that they need. To this end, you must purchase and manage subscriptions, licenses, and trials for your organization. Managing subscriptions, licenses, and trials is necessary to ensure that both content creators and content consumers can use Fabric and Power BI.

> [!NOTE]
> Licensing is an important topic that can be complex, especially when your organization is implementing Fabric or Power BI for the first time. While this article describes key decisions and considerations about subscriptions, licenses, and trails, we recommend that you refer to the following supplementary articles and resources for more detailed and practical information.
>
> - **[Power BI pricing](https://powerbi.microsoft.com/pricing/):** This webpage provides the latest information about the pricing of the different licenses available for Power BI and Fabric in your region, as well as a feature comparison.
> - **[Power BI service per-user and capacity-based licenses](../fundamentals/service-features-license-type.md):** This article provides detailed information about the different licenses available to use Power BI.
> - **[Licensing the Power BI service for users in your organization](../enterprise/service-admin-licensing-organization.md):** This article (and related articles) provides practical information about how to purchase and assign licenses for Power BI.
> - **[Microsoft Fabric concepts and licenses](/fabric/enterprise/licenses):** This article provides detailed information about the different capacity licenses available to use Fabric, including information about the different [stock-keeping units (SKUs)](/fabric/enterprise/licenses#capacity-license) for each license. It also describes the difference between a [Premium capacity](../enterprise/service-premium-what-is.md) and a [Fabric capacity](/fabric/enterprise/licenses#capacity), both with respect to the SKUs and capabilities.
> - **[Buy a Microsoft Fabric subscription](/fabric/enterprise/buy-subscription):** This article provides practical information about where and how you can purchase Fabric capacity licenses for your organization. It also describes the difference between pay-as-you-go subscriptions ([Azure SKUs](/fabric/enterprise/buy-subscription#azure-skus)) and reserved instances with monthly or yearly billing ([Microsoft 365 SKUs](/fabric/enterprise/buy-subscription#microsoft-365-skus)).

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-premium-notification.md)]

The following table introduces key concepts used by this article.

| **Concept** | **Description** | **Example** |
|---|---|---|
| **Tenant** | Fabric operates within the organization's Microsoft Entra [tenant](powerbi-implementation-planning-tenant-setup.md). An organization will typically have a single _tenant_ (though some large organizations might have multiple tenants). | At Contoso, one tenant exists for _contoso.com_. |
| **Subscription** | One or more _subscriptions_ must be active for a tenant. Each subscription has a start date and an end date that references a product: <br/><br/>&bull;&nbsp;[Per-user subscriptions](/fabric/enterprise/licenses#per-user-licenses) are managed in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview). A specific number of licenses are available within each subscription. <br/>&bull;&nbsp;A Power BI Premium capacity subscription is managed in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview). <br/>&bull;&nbsp;A Fabric capacity subscription is managed in the [Azure portal](/azure/azure-portal/azure-portal-overview). | Contoso has four active subscriptions: <br/><br/>&bull;&nbsp;Unlimited Free licenses. <br/>&bull;&nbsp;100 Pro licenses. <br/>&bull;&nbsp;15 PPU licenses. <br/>&bull;&nbsp;Three capacity licenses. |
| **Per-user license** | A _per-user license_ is based on a subscription. All users require a [user license](/fabric/enterprise/licenses#per-user-licenses), which can be Fabric Free, Power BI Pro (Pro), or Premium Per User (PPU). | Contoso has 450 active users: <br/><br/>&bull;&nbsp;All 450 users are assigned a Fabric Free license. <br/>&bull;&nbsp;92 users are assigned a Power BI Pro license (leaving eight available on the subscription). <br/>&bull;&nbsp;15 users are assigned a PPU license (leaving none available on the subscription). |
| **Capacity license** | A _capacity license_ is based on a subscription. Workspaces are assigned to a [capacity](/fabric/enterprise/licenses#capacity-license), which determines the capabilities and resources that are available to the content and users of the workspace. | Contoso has three active capacities: <br/><br/>&bull;&nbsp;Two Fabric capacities. <br/>&bull;&nbsp;One Power BI Premium capacity. |
| **SKU** (stock-keeping unit) | _SKUs_ are a product ID for the subscription that was purchased. For capacity, there are two ways to refer to SKUs. <br/><br/>&bull;&nbsp;**Grouping:** The type of [capacity](/fabric/enterprise/licenses#capacity-license) that's purchased. For example, an _F SKU_ refers to a Fabric capacity in general.<br/>&bull;&nbsp;**Specific:** The specific SKU for a capacity designates the level of its compute power. For example, an _F64 capacity_ has a specific set of [compute resources](/fabric/enterprise/licenses#capacity-license) (such as CPU and memory) that are available to all workspaces that are assigned to that capacity. | Contoso has three active capacities: <br/><br/>&bull;&nbsp;One F16 capacity. <br/>&bull;&nbsp;One F64 capacity. <br/>&bull;&nbsp;One P1 capacity. |
| **Trial** | A [trial](../fundamentals/service-self-service-signup-for-power-bi.md) license allows you to try out features. A trial can be activated for either a per-user license or a Fabric capacity license. | Contoso has active trials: <br/><br/>&bull;&nbsp;Two users have an active PPU trial. <br/>&bull;&nbsp;One Fabric capacity trial is active. |

> [!NOTE]
> The _subscriptions_ referred to in this article relate to costs for a product. It's a different concept than _[report subscriptions](../collaborate-share/end-user-subscribe.md?tabs=creator&preserve-view=true)_, which are reports delivered on a schedule.

> [!IMPORTANT]
> Speak with your Microsoft account manager when you have any questions about your organization's subscriptions and licenses for Fabric, Power BI, or Microsoft 365.

Licensing options can be mixed and matched based on the workload for individual users and groups. The following diagram depicts how a subscription has per-user or per-capacity licenses, which you manage either from the Microsoft 365 admin center or the Azure portal.

:::image type="content" source="media/powerbi-implementation-planning-subscriptions-licenses-trials/subscriptions-and-licenses.svg" alt-text="Diagram shows both the Microsoft 365 admin center and the Azure portal." border="false":::

In the Microsoft 365 admin center, administrators can [purchase](../enterprise/service-admin-purchasing-power-bi-pro.md#purchase-licenses-in-microsoft-365) and [assign](../enterprise/service-admin-purchasing-power-bi-pro.md#assign-licenses-from-the-microsoft-365-admin-center) per-user licenses or Premium capacity.

- The organization has a Microsoft Fabric Free subscription with unlimited Free licenses. Billing administrators can assign these licenses to users in the organization.
- Billing administrators can purchase Power BI Pro subscriptions and assign Power BI Pro licenses to users in the organization.
- Billing administrators can purchase Power BI Premium Per User (PPU) licenses as add-ons to an existing Power BI Pro subscription. These administrators can then assign PPU licenses to users in the organization.
- Billing administrators can purchase Power BI Premium capacity subscriptions (P SKUs) for the organization. These licenses are per-capacity and not per-user.

In the Azure portal, Azure administrators can [assign per-user licenses](../enterprise/service-admin-purchasing-power-bi-pro.md#assign-licenses-from-the-azure-portal) and purchase and manage per-capacity licenses.

- Azure administrators assign per-user licenses, like Microsoft Fabric Free, in the Azure portal in Microsoft Entra ID.
- Azure administrators manage their Azure subscription, where they can purchase and manage per-capacity licenses.
  - Billing administrators can purchase Premium capacity subscriptions (A SKUs or EM SKUs), which are linked to, and billed as part of, an Azure subscription.
  - Billing administrators can purchase Fabric capacity subscriptions (F SKUs), which are linked to, and billed as part of, an Azure subscription.

> [!NOTE]
> Many of the capabilities described in this article aren't available to Fabric administrators. Instead, Fabric administrators must [collaborate with other administrators](powerbi-implementation-planning-tenant-administration.md#collaborate-with-other-administrators) who have additional permissions to view (or update) subscriptions, billing, and licenses.

The remainder of this article describes licensing considerations for both [per-user licensing](#review-and-manage-per-user-licensing) and [capacity licensing](#review-and-manage-capacity-licensing).

## Review and manage per-user licensing

Every user who works with Fabric requires a user license (either Free, Pro, or PPU, which will be described in [Step 2](#step-2-decide-on-user-licenses)). Even if you intend to purchase capacity licenses (covered later in this article), per-user licenses are required so that each user can access Fabric. This access is facilitated by [integration with Microsoft Entra ID](powerbi-implementation-planning-security-tenant-level-planning.md#integration-with-microsoft-entra-id).

### Step 1: Review user licenses

It's important that you first understand the current state of user subscriptions and licenses. Your [billing administrators](../enterprise/service-admin-licensing-organization.md#which-admins-can-purchase-licenses-and-subscriptions) can help by confirming any user subscriptions you currently have, and how user licenses are assigned.

Here are two common ways that you can compile a list of user subscriptions and licenses.

- View the [Billing](/microsoft-365/commerce) area of the Microsoft 365 admin center.
- Programmatically extract the data by using the relevant [Microsoft Graph](/graph/overview) REST APIs.

> [!TIP]
> You can also use this information as part of your [tenant-level auditing](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md). Specifically, see this section about retrieving data about [users and groups](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#users-and-groups-data).

As you conduct your review, compile the following information.

- Active subscriptions for user licenses:
  - Microsoft Fabric Free
  - Power BI Pro
  - Power BI Premium Per User
- Subscription status
- Subscription start and end dates
- Subscription quantities:
  - Total purchased
  - Number of licenses assigned to users
  - Number of available licenses
- Subscription cost:
  - Pricing for each subscription
  - Organizational pricing information (if applicable)
  - Who approved the purchase (if applicable)
- User trials that are currently active

> [!IMPORTANT]
> Make sure that you include existing self-service subscriptions in your list so that you get the full picture. For more information, see [Manage self-service purchases](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins).

### Step 2: Decide on user licenses

After you've reviewed user licenses, you should next make some key decisions about how to assign and manage these licenses in your organization.

> [!IMPORTANT]
> Your decisions for per-user licenses, with or without capacity (described in the next section of this article), will significantly impact what capabilities are available for authors and consumers.

#### Decide which per-user licenses you need

You should determine which user licenses are required. Every user needs to be assigned a Microsoft Fabric (Free) license _or_ a Power BI Pro license. If they're creating or viewing content that's published to a workspace that uses _Premium per user_ license mode, then they also need a Power BI Premium Per User (PPU) license.

Here's each of the [user license types](/fabric/enterprise/licenses#per-user-licenses) and their uses.

- **Microsoft Fabric (Free) license:** A [Free license](../fundamentals/service-features-license-type.md#free-per-user-license) that has no subscription cost. It can be used in different ways:
  - **Personal BI:** A Free user can [use their personal workspace](/fabric/enterprise/licenses#:~:text=you%20need%20a-,Microsoft%20Fabric%20%28Free%29%20license,-with%20a%20viewer) in the Fabric portal. Because the purpose is [personal BI](powerbi-implementation-planning-usage-scenario-personal-bi.md), no report distribution, sharing, or collaboration features are available to the Free user.
  - **Consuming BI**: A Free user can view content that's been deployed to a workspace that's assigned to a capacity (minimum of F64 or P1). This [enterprise BI](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) use case is significant when you have a large number of report consumers who don't author BI content, because you don't have to purchase a Power BI Pro license for these consumers. For more information, see [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md).
  - **Fabric authoring:** A Free user can [create and share Fabric (non-Power BI) items](/fabric/enterprise/licenses#per-user-licenses) in a workspace that's assigned to an F SKU.
- **Power BI Pro license:** A [Power BI Pro license](../fundamentals/service-features-license-type.md#pro-license) is required to author Power BI content. It's required for any form of sharing, collaboration, or content distribution. For more information, see [Content creator security planning](powerbi-implementation-planning-security-content-creator-planning.md).
- **Power BI Premium Per User (PPU) license:** A [PPU license](../fundamentals/service-features-license-type.md#premium-per-user-ppu-license) provides all Pro license capabilities and includes certain Premium features, on a per-user basis. It's a good choice for smaller organizations and teams that want to use specific features but don't need the full set of Fabric capabilities. For more information, see [Power BI Premium Per User](../enterprise/service-premium-per-user-faq.yml).

> [!TIP]
> You can mix and match user licenses with capacity licenses. For example, you might have development, test, and production workspaces that rely on specific [enterprise content publishing](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md) approaches. Since the development and test workspaces have very few users, those workspaces might be assigned a smaller capacity size or PPU license mode (if they don't require a Fabric experience or capabilities). The production workspace could use a capacity license to support many consumers (with Free licenses). That way, you might potentially reduce cost, while segregating the development and test content from the production workload.

#### Decide prerequisites for obtaining a user license

Consider whether there are any requirements that must be met before a user license is assigned.

Here are some examples of prerequisites.

- Requiring the user to acknowledge an organizational data policy (such as a data privacy or a data handling policy) prior to being assigned a user license.
- Requiring the user to complete an initial training session or certification before a license is granted.
- Implementing a workflow, such as:
  - Require manager approval.
  - Confirm which subscription to assign the license from.
  - Approve where to charge the cost.
  - Confirm that the user's role and responsibilities justify a license (and access to data).

> [!TIP]
> Don't introduce too many obstacles that could prevent users from getting a license. If it's too difficult, busy professionals might not bother to request a license. Instead, to get work done, they'll find another way, which might involve suboptimal workarounds. For instance, without a license, people might share files on a file system or via email when better—and more secure—approaches are available.

#### Decide the process for handling user license requests

Determine whether you need to implement a custom license request process that's defined by your organization. This request could handle scenarios such as:

- Requiring prerequisites (described in the previous section).
- Integrating with an existing license management platform.
- Informing users of training offerings and available help as part of the user license assignment process.
- Determining how costs will be allocated, or how chargebacks will be done.

> [!TIP]
> You can set a custom URL for licensing requests in the _[Publish Get Help Information](/fabric/admin/service-admin-portal-help-support#publish-get-help-information)_ tenant setting. The URL can direct users to a form, or to your internal licensing request page.

#### Decide how user subscriptions will be purchased

It's important to plan exactly how your process to purchase subscriptions will work.

Here are some questions you should consider.

- Are subscriptions purchased individually or in bulk?
  - In smaller organizations, you might choose to purchase each subscription (and assign the license) upon request. That approach works well when there's a low volume of requests.
  - In larger organizations, it's often efficient to purchase subscriptions in batches (such as 50 Pro licenses, for example). This approach works well when sufficient funds are available in the budget, and you expect the licenses to be assigned (and used) soon.
- Do you have an Enterprise Agreement (EA)? For example, your organization procured a Microsoft 365 subscription that includes 500 enterprise [E5 licenses](https://www.microsoft.com/microsoft-365/enterprise/microsoft365-plans-and-pricing). In that case, each user that's assigned an E5 license will have a Power BI Pro license (note that [access to individual apps](/microsoft-365/admin/manage/assign-licenses-to-users#change-the-apps-and-services-a-user-has-access-to) can be removed for users when necessary).
- Is purchasing a centralized function that's handled by one department? Or is [self-service purchasing](#decide-whether-self-service-purchasing-is-enabled) permitted?

> [!TIP]
> We recommend that you prioritize [mentoring and user enablement](fabric-adoption-roadmap-mentoring-and-user-enablement.md) and [user support](fabric-adoption-roadmap-user-support.md) activities. These activities become even more important when licenses are widely distributed to users throughout your organization.

#### Decide whether trials are enabled

An important [governance](fabric-adoption-roadmap-governance.md) decision is whether user trials are allowed. An in-product trial provides users with a way to try out features before making a commitment to buy a license. There are two types of trials that a user could initiate: a [Premium Per User (PPU) trial](../enterprise/service-premium-per-user-faq.yml#using-premium-per-user--ppu-) and a [Fabric capacity trial](/fabric/get-started/fabric-trial).

When trials are enabled, a _Start trial_ button is displayed in the portal that permits a user to begin a Fabric trial. Also, a user can be prompted to start a trial while they're working. For example, if a Free user tries to create a workspace or share a report, they'll be prompted to start a PPU trial by selecting the _Try free_ button. Similarly, if a Pro user tries to view content in a PPU workspace, they'll be prompted to start a trial by selecting the _Try free_ button.

The ability to use in-product trials is controlled by the _[Users can try Microsoft Fabric paid features](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features)_ tenant setting. Its behavior is closely correlated with how self-service purchasing works (described next). For more information, see [Users can try Microsoft Fabric paid features](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features).

> [!NOTE]
> The trial experience is intended to be a convenience that allows users to continue with their normal workflow. Generally, disabling trials isn't recommended. Restricting trials might encourage users to seek workarounds, perhaps by exporting data or working outside of supported tools and processes.

Consider disabling trials only when:

- There are significant cost concerns that would make it unlikely to grant the user a full license at the end of the trial period.
- Prerequisites are required for obtaining a license (such as approval, justification, or a training requirement) that must be met prior to beginning a trial or obtaining a license.
- There's a valid need, such as a regulatory requirement, to control access to Fabric closely.

#### Decide whether self-service purchasing is enabled

Users can purchase licenses on their own when _[self-service purchasing](/microsoft-365/commerce/subscriptions/self-service-purchase-faq?view=o365-worldwide&preserve-view=true)_ is enabled. In this case, a user can purchase a license while they're working. For example, if a Pro user tries to view content in a PPU workspace, they could choose to purchase a license by selecting the _Upgrade account_ or the _Buy now_ button. For more information, see [Sign up for or purchase the Power BI service as an individual](../fundamentals/service-self-service-signup-for-power-bi.md).

Self-service purchasing is useful for:

- Larger organizations with decentralized business units that have purchasing authority and want to handle payment directly with a credit card.
- Organizations that intend to make it as easy as possible to purchase subscriptions on a monthly commitment.

The following diagram depicts how self-service purchasing works (when there isn't a custom URL for license requests).

:::image type="content" source="media/powerbi-implementation-planning-subscriptions-licenses-trials/self-service-purchasing.svg" alt-text="Diagram shows self-service purchasing of licenses." border="false":::

The diagram depicts the following processes and steps in the self-service purchasing of licenses.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | A self-service user can purchase their own license only when they have an existing organizational account. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | The user can purchase their own license when self-service publishing is supported by the organization. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The user has a limited view of the licenses purchased from the Microsoft 365 admin center that they can assign to others within their scope of responsibility. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Microsoft 365 administrators have a holistic view of all the licenses acquired through self-service publishing in the Microsoft 365 admin center. |
| ![Item 5.](../media/legend-number/legend-number-05-fabric.svg) | Users with a self-service purchased license can access and use Power BI. |

Consider disabling self-service purchasing when:

- Centralized procurement processes are in place to meet regulatory, security, and governance requirements.
- Discounted pricing is obtained through an Enterprise Agreement (EA).
- Existing processes are in place to handle intercompany chargebacks.
- Existing processes are in place to handle [group-based](/azure/active-directory/enterprise-users/licensing-groups-assign) licensing assignments.
- Prerequisites are required for obtaining a license, such as approval, justification, training, or a governance policy requirement.

There are many considerations when planning for self-service purchasing.

Here are some other factors to consider.

- Is there an existing organization-wide policy in place for [self-service purchases and trials](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins)?
- Does [Fabric](../fundamentals/service-self-service-signup-for-power-bi.md#use-self-service-sign-up-to-start-an-individual-fabric-trial) follow the existing organizational policy for self-service purchases and trials?
- Should purchasing and trials both be enabled, both be disabled, or a combination? The user's experience will depend on how you [combine the settings](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features) for purchasing and trials.
- Should users who try to purchase a license be directed to a specific page?
  - With a [custom URL for licensing requests](/fabric/admin/service-admin-portal-help-support#publish-get-help-information), the user is immediately directed to that page when they select the _Upgrade account_ or the _Buy now_ button. You can provide further instructions or ask them to submit details in a form. Using a custom URL is a way to disallow the use of self-service purchasing by redirecting the user elsewhere.
  - Without a custom URL, a user choosing to purchase a license is directed to Microsoft 365 to complete their purchase.

#### Decide how to handle licensing for external users

You might need to work with guest users who are external to your organization. Guests could include customers, partners, or vendors. They could also be consultants or external collaborators. This topic could also apply to organizations that have multiple legal entities or [tenants](powerbi-implementation-planning-tenant-setup.md) due to mergers and acquisitions.

Here are some considerations when you're planning how to handle licensing for guest users.

- How will your process for assigning user licenses be different when an external user is involved?
- Does the external user work for an organization that has Microsoft Entra ID set up? In that case, their credentials can be managed by their home tenant. For more information, see [Strategy for external users](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-external-users).
- Which external users are consumers only versus those who need to create and publish content?
- In what situations will a license be provided by the external user (known as bring-your-own-license, or BYOL). In what circumstances will a license be provided by your organization? For more information, see the licensing topic in [Distribute Power BI content to external guest users using Microsoft Entra B2B](whitepaper-azure-b2b-power-bi.md#licensing).
- Which type of guest invitation process will you use? There are different capabilities for occasional versus planned guest user invitations. The user experience is different as well. For more information, see [Guest invitation process](powerbi-implementation-planning-security-tenant-level-planning.md#guest-invitation-process).

> [!TIP]
> For more information, see the [Microsoft Entra B2B white paper](whitepaper-azure-b2b-power-bi.md). It's a good resource to learn about strategies for handling external users.

### Step 3: Update user licenses

At this point, information is available on your existing subscriptions and licenses, and you've made purposeful decisions. Now you're ready to make any updates that are necessary.

> [!IMPORTANT]
> Be sure to coordinate changes with your Microsoft account manager should you have any questions or need clarification.

The following topics are actions that might be appropriate.

#### Increase or decrease user subscription quantity

Based on the information you've gathered, you might choose to adjust your existing [user subscriptions](/microsoft-365/commerce). For example, you might choose to increase or decrease the quantity of your Pro or PPU subscriptions.

> [!NOTE]
> Adjustments to your user subscriptions might correlate with other changes to a capacity subscription. [Capacity licensing](#review-and-manage-capacity-licensing) is covered later in this article.

#### Assign or unassign user licenses

You might need to [assign or unassign](/microsoft-365/admin/manage/assign-licenses-to-users) user licenses. For example, you might identify that you need to assign more Pro licenses to certain users, or unassign PPU licenses from other users.

#### Take over self-service purchases

If your objective is to centrally manage all subscriptions, you might need to [take over](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-admins#take-over-a-purchase-or-trial-subscription) a purchase previously made by a self-service user. For more information, see [Decide whether self-service purchasing is enabled](#decide-whether-self-service-purchasing-is-enabled).

#### Adjust tenant settings

Based on your decisions for handling user licensing and trials, you might need to adjust some tenant settings in the Fabric admin portal.

You might need to update the:

- _[User can try Microsoft Fabric paid features](/fabric/admin/service-admin-portal-help-support#users-can-try-microsoft-fabric-paid-features)_ tenant setting depending on how you want to handle in-product trials.
- _[Publish Get Help information](/fabric/admin/service-admin-portal-help-support#publish-get-help-information)_ tenant setting if you intend to direct users to a custom URL for licensing requests.

### Step 4: Document user licenses

Depending on your internal processes, you might choose to create documentation that augments the information that's available in the portal for your user subscriptions and licenses.

You can build on the information captured in [Step 1](#step-1-review-user-licenses) by including the following details in your documentation.

- Key decisions, including more context or detail
- Who approved user license purchases, and when
- Timing or pending action items
- Governance requirements related to user licenses
- Auditing requirements related to user licenses
- A snapshot of user license information

> [!TIP]
> Unless you're a very small organization with very few changes, don't manually document every user license. Instead, use the [Microsoft Graph APIs](/graph/use-the-api) to extract information about subscriptions and licenses regularly. Consider storing a snapshot of the user license data every week or every month. That way, you can compare snapshots to determine what's changed. For more information, see [Audit user licenses](#step-6-audit-user-licenses).

> [!IMPORTANT]
> Refer to the [Product plans and service plan identifiers](/entra/identity/users/licensing-service-plan-reference) documentation when comparing the Microsoft Graph results to what's displayed in the Microsoft 365 admin center.

### Step 5: Manage user licenses

User licenses will need attention on an ongoing basis. The following topics are aspects to consider.

#### Create a process to accept user license requests

You should create a repeatable, documented process for requesting a user license. It typically involves creating an online form. Information about required [prerequisites](#decide-prerequisites-for-obtaining-a-user-license) should be included as well.

#### Monitor user trials

Every month you should identify users who have started a trial that will soon expire. It's possible that the user will need to have a license assigned. The goal is to avoid a service interruption for these users. For more information, see [User trial auditing](#user-trial-auditing).

#### Automate user license assignments

In large organizations, handling requests for user licenses can involve significant administrative effort. One way to improve efficiency is to use [group-based licensing](/azure/active-directory/active-directory-licensing-group-assignment-azure-portal). Group-based licensing allows you to automatically assign a license based on membership of a security group. A group such as _Fabric content authors_ works well for this purpose, allowing the assignment of licenses to users in an efficient manner.

The following diagram depicts how group-based licensing works.

:::image type="content" source="media/powerbi-implementation-planning-subscriptions-licenses-trials/group-based-licensing.svg" alt-text="Diagram shows group-based licensing." border="false":::

The diagram depicts the following processes and steps involved in group-based licensing.

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](../media/legend-number/legend-number-01-fabric.svg) | Billing administrators purchase and assign per-user licenses from the Microsoft 365 admin center. |
| ![Item 2.](../media/legend-number/legend-number-02-fabric.svg) | Administrators assign these licenses to groups that they manage in Microsoft Entra ID. |
| ![Item 3.](../media/legend-number/legend-number-03-fabric.svg) | The groups are set up to assign licenses to all members. |
| ![Item 4.](../media/legend-number/legend-number-04-fabric.svg) | Any user added to a group is automatically granted the Power BI license that's assigned to that group (providing one is available). |

#### Review and optimize user licensing costs

Periodically compare licensed users with the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data) to determine whether users are actively using their license. Look for users who are assigned a license but haven't used it. For example, a user might have a Pro license assigned but they only view content that exists in a capacity. Use consistent criteria whenever possible, such as:

- The license isn't used for a specific period (for example, six months).
- The license is used infrequently or sporadically.
- The license was used once for a single activity.

The [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data) will help you identify when activities occurred for a user, and what they are (for example, viewing a report or publishing a report).

### Step 6: Audit user licenses

It's important to have a process to regularly audit subscriptions, licenses, and trials for users. A Fabric administrator will need to work together with other [administrators](/microsoft-365/admin/add-users/about-admin-roles) to obtain this information (such as a global administrators, billing administrators, and Azure administrators).

#### User subscription auditing

Here are some actions to look for when you audit subscriptions.

- **List of active subscriptions:** You can view products that have an active subscription in the [billing area](/microsoft-365/commerce) of the Microsoft 365 admin center. Or, with [Microsoft Graph](/graph/api/overview), use the [List Subscribed SKUs](/graph/api/subscribedsku-list) REST API to extract active subscriptions.
- **New subscription was created:** Recently purchased products display a _New_ indicator in the [billing area](/microsoft-365/commerce) of the Microsoft 365 admin center.

#### User license auditing

Here are some actions to look for when to audit user licenses.

- **List of user licenses:** View the total number of licenses that are available and assigned in the billing area of the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview). You can also drill down to review users who are assigned a license for each product subscription. Or, with [Microsoft Graph](/graph/api/overview), use the [List License Details](/graph/api/user-list-licensedetails) REST API to extract details of each user (to provide the ID parameter, first obtain each user ID from the [List Users](/graph/api/user-list) REST API).
- **User was assigned a license:** Search the audit log in the [Microsoft Purview compliance portal](/purview/microsoft-365-compliance-center). Look for the _Change user license_ operation. The _ModifiedProperties_ property indicates that a new license was assigned.
- **Users who are assigned a license but haven't used it:** Use the list of user licenses (described previously). Compare those results to the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data). Look for users that have no activity in the activity log. To make this easier, you can also view activities from the [Feature usage and adoption report](/fabric/admin/feature-usage-adoption#activity-overview-page) and its underlying semantic model from the [Admin monitoring workspace](/fabric/admin/monitoring-workspace).
- **Subscription has available licenses not yet assigned:** View the number of available licenses per product subscription in the billing area of the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/admin-center-overview). Or, with [Microsoft Graph](/graph/api/overview), use the [List Subscribed SKUs](/graph/api/subscribedsku-list) REST API to extract license details. The _ConsumedUnits_ property indicates how many licenses are assigned, and the _Enabled_ property indicates the number of licenses purchased.

#### User trial auditing

When searching for new user trials in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data), look for the _OptInForPPUTrial_ or _OptInForProTrial_ activities.

> [!IMPORTANT]
> The information presented in this step isn't intended to be an all-inclusive list of ways to audit the data. Rather, it's intended to provide you with ideas to get you started with your auditing efforts. For other ideas, we recommend that you consult with your billing administrators.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for user licenses, key decisions and actions include:

- **Conduct a review:** Determine the current state by reviewing current user subscriptions, licenses, and trials.
- **Identify existing policies and decisions:** Compile existing internal policies or previous decisions related to user licensing so that they're readily available.
- **Discuss and decide:** Schedule [workshops](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#plan-workshops) to make key decisions related to user subscriptions, licenses, and trials. Involve all relevant decision makers, stakeholders, and the executive sponsor, when appropriate.
- **Create documentation:** Compile the information gathered, and document key decisions for future reference.
- **Make updates:** Update user subscriptions and licenses based on the decisions made in the workshops.
- **Create a process to manage user requests:** Set up a process for how users can request a license.
- **Set up auditing:** Create auditing processes so you can track activities related to user subscriptions, licenses, and trials.

## Review and manage capacity licensing

In addition to user licenses (described [earlier in this article](#review-and-manage-per-user-licensing)), your organization might find significant value in purchasing one or more capacity licenses. For instance, capacity licenses provide access to other features, such as the Fabric experiences that come with a Fabric license. These features can help you to support and scale your Power BI implementation.

### Step 1: Review capacity subscriptions

It's important that you first understand the current state of your capacity subscriptions. Your [billing and license administrators](../enterprise/service-admin-licensing-organization.md#which-admins-can-purchase-licenses-and-subscriptions) can help confirm what capacity subscriptions you have. You might also need to speak with current capacity administrators or capacity contributors to gain a clear understanding of the purpose of each existing capacity. For more information, see [Manage user permissions](../enterprise/service-admin-premium-manage.md#manage-user-permissions).

You can compile the current state of your capacity subscriptions and licenses in different ways.

- View [capacity settings](/fabric/admin/service-admin-portal-capacity-settings) in the Fabric admin portal.
- View the [billing area](/microsoft-365/commerce) of the Microsoft 365 admin center (applicable to Power BI Premium).
- View the [Azure portal](/azure/azure-portal/azure-portal-overview) (applicable to Fabric capacity and Power BI Embedded).
- Programmatically extract the data by using the relevant [Microsoft Graph](/graph/overview) APIs.

As you conduct your review, compile the following information.

- Active subscriptions for capacity licenses:
  - Microsoft Fabric capacity
  - Power BI Premium capacity
  - Power BI Embedded
- Subscription status
- Subscription type (pay-as-you-go or reserved with a start and end date)
- Subscription cost:
  - Pricing for each subscription
  - Organizational pricing incentives from Microsoft (if applicable)
  - Who approved the purchase (if applicable)
  - Cost allocations within the organization (if applicable)

### Step 2: Decide on capacity licenses

After you've reviewed the capacity subscriptions, you should decide on capacity licenses.

The use of capacity can play a significant role in your strategy for creating, managing, publishing, and distributing content. Your decisions related to capacity licenses are in addition to the per-user licenses, which were [described earlier](#review-and-manage-per-user-licensing).

#### Decide whether you need a capacity license

As you begin to analyze the needs for a capacity license, it's important to have clarity on your architecture needs and user needs that'll inform the decision to use a capacity.

Here are some questions you might initially explore.

- **Data architecture:** What type of data architecture investments are currently in progress? How will they affect the choices you make? Do you have large semantic models that contain large volumes of data?
- **Fabric experiences:** Which experiences are currently in use or are planned for future use? For example, you might be currently using the Power BI experience but you intend to invest in a lakehouse architecture in Fabric, which is part of the Data Engineering experience.
- **Data and BI requirements:** Are there business requirements to address analytical needs that are currently unmet? How do the requirements correlate to architecture (and licensing) decisions?
- **Consumers:** How many view-only consumers do you have?
- **Authors:** How many content authors do you have? Are authors centralized, distributed across various business units, or both?
- **Usage patterns:** What are the current usage patterns for user queries and data refresh? Are usage patterns predictable and consistent from day to day?

> [!NOTE]
> As you work through the process of analyzing and planning for capacity licenses, it's possible you'll determine a need to perform a full [technical assessment](powerbi-implementation-planning-bi-strategy-bi-strategic-planning.md#complete-the-technical-assessment).

#### Decide which capacity license you need

When you determine that you need a capacity, you'll need to decide which type of capacity license is best suited.

Here's each of the capacity licenses and their uses and suitability.

- **Fabric capacity (F SKUs):** F SKUs are purchased in Azure (note the pricing is regional). F SKUs have some advantages (that aren't available with P SKUs), including the ability to:
  - [Scale](/fabric/enterprise/scale-capacity) the capacity to resize it up or down at any time. This ability to scale allows you to adjust the size—and cost—as you better understand your workload.
  - [Pause](/fabric/enterprise/pause-resume) the capacity at any time. This functionality is useful for infrequently used capacities.
  - Test the capabilities with a [Fabric trial](/fabric/get-started/fabric-trial) before committing to a purchase.
  - Use a lower tier [capacity license](/fabric/enterprise/licenses#capacity-license) for small workloads as a way to reduce the cost.
  - Choose the preferred commitment level:
    - **Pay-as-you-go:** The pay-as-you-go pricing model has no usage commitment. You can [resize](/fabric/enterprise/scale-capacity) the capacity up and down as needed, and even pause it. It's suitable when you want flexibility.
    - **Reservation:** The reserved pricing model involves a precommitted size (SKU) for a specific period, which results in a lower cost option than pay-as-you-go. However, a reserved instance can't be paused, so it's suitable when you need to run a capacity 24/7.
  - Use organizational pricing incentives. If you have a monetary agreement in place with Microsoft, programs such as the [Microsoft Azure Consumption Commitment (MACC)](/azure/cost-management-billing/manage/track-consumption-commitment) apply to F SKUs.
  - Use [Microsoft Cost Management](/fabric/enterprise/azure-billing) capabilities to monitor and track costs.
- **Power BI Premium per capacity (P SKUs):** P SKUs are purchased in the Microsoft 365 admin portal. Power BI Premium uses a reserved pricing model, so it runs 24/7 and can't be scaled or paused. [You can't purchase P SKUs after July 1, 2024.](https://powerbi.microsoft.com/blog/important-update-coming-to-power-bi-premium-licensing/)
- **Power BI Premium (EM SKUs):** EM SKUs are a specialized type of Power BI Premium capacity license that are purchased in the Microsoft 365 admin portal or through volume licensing (available through your Microsoft account manager). EM SKUs are targeted at straightforward embedding scenarios, such as [embedding a report](powerbi-implementation-planning-usage-scenario-embed-for-your-organization.md) in an application. The EM SKUs offer is a subset of functionality that's available in the P SKUs. They have less compute power, and no access to the Power BI service. Also, EM SKUs don't support Fabric experiences. For more information, see [Capacity and SKUs](../developer/embedded/embedded-capacity.md#capacity-and-skus).
- **Power BI Embedded (A SKUs):** A SKUs are purchased in Azure (however, this offering is different from the F SKUs previously described). Power BI Embedded is primarily targeted to independent software vendors (ISVs) that want to embed Power BI content in their applications. A SKUs don't support Fabric items. For more information, see the [Embed for your customers](powerbi-implementation-planning-usage-scenario-embed-for-your-customers.md) usage scenario.

> [!TIP]
> You can also use F SKUs to embed Power BI content as you would with the A and EM SKUs. For more information, see [Power BI Embedded with Microsoft Fabric](https://powerbi.microsoft.com/blog/power-bi-embedded-with-microsoft-fabric/).

The remainder of this article focuses on the F SKUs and P SKUs.

#### Decide to use one or multiple capacities

A key decision is whether to use one larger capacity or multiple smaller capacities. Your choice should involve the following considerations.

- **Level of centralization versus decentralization:** How important is centralized management versus decentralized management for the capacity? When you have a distributed or mesh architecture, it's more likely that multiple capacities will be necessary to allow different teams to manage their own capacities.
- **Data storage location:** Do you have regional, industry-specific, or organizational data residency requirements? The geographic location where data is stored is correlated to the capacity using the [Multi-Geo](/fabric/admin/service-admin-premium-multi-geo) feature.
- **Resource isolation:** What level of resource isolation per capacity is required? For example, you might need to create different capacities for specific business units. Or, you might create a capacity specifically to support workspaces for a [domain](/fabric/governance/domains).
- **Compute resources:** What level of compute resources are required for each capacity? For example, if you choose to provision two F32 capacities instead of one F64, then fewer capacity units are available for both capacities because they're split. The capacity units translate to [constraints for each SKU](../enterprise/service-premium-what-is.md#semantic-model-sku-limitation), such as the maximum memory size for a semantic model.
- **Features required:** In addition to the level of compute power, are certain capabilities necessary? For example, an F64 (or P1) or higher capacity allows users with a Free license to view BI content or use [Copilot](/fabric/get-started/copilot-fabric-enable).
- **Cost:** Do you need to track or allocate cost separately for each SKU? That's easier to accomplish when you have separate capacities.

#### Decide size of capacity

At this point, you're ready to select a specific [capacity SKU](/fabric/enterprise/licenses#capacity-license). Consider what environment(s) you intend to run: development, test, and/or production. It's common for development and test environments to run on a smaller capacity than what's required for a production environment.

To gain confidence about the capacity size that you'll need, consider doing load testing of the capacity. For more information, see [Capacity Planning](../developer/embedded/embedded-capacity-planning.md) and [Assess Your Capacity Load](../developer/embedded/load-assessment-planning-tool.md).

#### Decide needs for scaling up and down

It's important to consider scalability needs during the license planning process because it contributes to cost. For example, you might have needs to occasionally [resize](/fabric/enterprise/scale-capacity) (or pause) an F SKU capacity. Alternatively, you can set up [autoscale](../enterprise/service-premium-auto-scale.md) to handle occasional or unexpected bursts in P SKU capacity usage levels. For more information, see [Resize capacity](#resize-capacity).

> [!TIP]
> You can think about scalability in two ways.
>
> - _Scaling up or down_ is when you add or remove resources (for example, scaling up to an F16 from an F8 capacity).
> - _Scaling out_ is when you add more capacities (for example, you could purchase two F8s instead of an F16). However, capacities don't use combined resources (like a [data gateway cluster](/data-integration/gateway/service-gateway-high-availability-clusters) would when you scale out). Therefore, if you're considering scaling out to multiple capacities, be aware that separate capacities purposefully work in isolation.

#### Decide whether on-premises or a hybrid license is needed

Power BI Report Server (PBIRS) is a simplified reporting solution. It's targeted at organizations that want to implement a hybrid approach where Power BI content might be published to either the cloud-based Fabric portal, to Power BI Report Server, or both. You can install Report Server on a machine that's running within on-premises infrastructure, or on an Azure virtual machine (with [Azure Hybrid Benefit](/windows-server/get-started/azure-hybrid-benefit)).

You can obtain a Report Server license in one of two ways.

- Power BI Premium (P SKU) subscription
- SQL Server Enterprise Edition with Software Assurance (SA)

> [!NOTE]
> An author who publishes content to the Report Server is required to have a Pro license.

> [!TIP]
> Conduct a technical [proof of concept](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-3-conduct-a-proof-of-concept) to ensure that Power BI Report Server will meet your needs. Be aware that feature parity with the Fabric portal isn't a goal. Also, when publishing content to Power BI Report Server, the use of [Power BI Desktop for Report Server](powerbi-implementation-planning-user-tools-devices.md#power-bi-desktop-for-report-server) (different from regular Power BI Desktop) is recommended.

For more information, see [Licensing Power BI Report Server](../report-server/get-started.md#licensing-power-bi-report-server).

> [!IMPORTANT]
> We strongly recommend that you refer to your volume license agreement and speak with your Microsoft account representative for specific details. For example, the Report Server licensing agreement includes limits related to the number of cores on the target machine.

### Step 3: Update capacity licenses

At this point, your existing capacity subscription information is available, and you've made purposeful decisions. Now you're ready to make updates that are necessary.

The following topics are actions that might be appropriate.

#### Adjust capacity subscription

Sometimes you might need to make an adjustment to an existing capacity subscription based on what you found during your review ([Step 1](#step-1-review-capacity-subscriptions)) and the decisions made ([Step 2](#step-2-decide-on-capacity-licenses)).

Here are some examples of changes you might make.

- **Change to reserved pricing:** The workloads running on your capacity are consistent and need to run 24/7. Therefore, to save costs, it's prudent to change the Fabric capacity from pay-as-you-go pricing to reserved pricing.
- **Change to pay-as-you-go pricing:** The workloads running on your capacity change regularly and would benefit from the ability to frequently scale up and down. In this case, the most cost effective approach might be to change to pay-as-you-go pricing.

> [!IMPORTANT]
> Contact your Microsoft account manager should you have any questions or need clarification about subscription costs and options.

#### Resize capacity

You might discover there's a need to resize your capacity when a smaller or larger size would better meet your needs.

There are two ways to handle resizing of a capacity.

- **Manual scaling:** You can choose to [resize](/fabric/enterprise/scale-capacity) (or pause) an F SKU capacity in the Azure portal. That's helpful when you're troubleshooting performance issues, or you have a known period of time when the load will be higher (such as the final week of every month).
- **Automated scaling:** You can enable [autoscale](../enterprise/service-premium-auto-scale.md) to handle occasional or unexpected bursts in P SKU capacity usage levels without requiring any manual effort. Autoscale can respond to these bursts by elastically resizing the resources to support the increased workload. Automated scaling up reduces the risk of incurring performance or user experience challenges, in exchange for extra cost. If your capacity isn't well managed, autoscale might trigger more often than expected, which could lead you to consider a larger capacity size.

### Step 4: Document capacity licenses

Depending on your internal processes, you might choose to create documentation that will augment the information that's available in the portal for your capacity subscriptions.

You can build on the information captured in [Step 1](#step-1-review-capacity-subscriptions) by including the following details in your documentation.

- Key decisions, including more context or detail
- Who approved capacity license purchases, and when
- Timing or pending action items
- Governance requirements related to capacity licenses
- Auditing requirements related to capacity licenses
- A snapshot of capacity license information

### Step 5: Manage capacity licenses

Capacity management and subscription management are two separate topics. However, they're highly interrelated. Both need attention on an ongoing basis. The following topics are aspects to consider.

#### Create a process to accept capacity requests

You should create a repeatable, documented, process for users to request a capacity. It typically involves creating an online form. Request information that you'll need to assess the capacity request, such as:

- Purpose and type of content to be hosted on the capacity.
- Who will administer the capacity.
- Whether the capacity will run 24/7 or not.
- Where the data needs to be stored geographically.
- How to charge or allocate the cost internally.

#### Monitor and understand capacity usage

Here are some considerations for monitoring and understanding [capacity usage](/fabric/enterprise/metrics-app).

- Analyze the load to determine whether the current capacity size (SKU) works well for the specific data and BI needs. Be sure to understand how [capacity units (CUs)](/fabric/enterprise/licenses#capacity-license) work. Analyze any [bursting and smoothing](https://blog.fabric.microsoft.com/blog/fabric-capacities-everything-you-need-to-know-about-whats-new-and-whats-coming/#BurstSmooth) activity to analyze whether you're using your capacity efficiently over time, or whether it's consistently overloaded. You can analyze capacity usage by using the [Fabric Capacity Metrics App](/fabric/enterprise/metrics-app).
- Resize a capacity when you discover that it's too large or too small to serve your current needs. Changing the size is the same as changing the SKU. The change affects the pricing tier.
- Create a new capacity when you need to:
  - Segregate a workload.
  - Store data in a different region.
  - Assign different capacity administrators (for decentralized capacity administration).
- Create user training or communicate with authors when you find that they can take specific action to improve the efficiency of the capacity.

#### Set up notifications

If your capacity is regularly overloaded, it indicates that you might need to purchase a larger capacity (scale up) or create other capacities (scale out)—or move content to a different capacity. For these reasons, [capacity management](/fabric/admin/capacity-settings?tabs=power-bi-premium) and licensing management have a significant impact on each other.

You should set up the following notifications to be kept informed.

- Set the _[Enable notifications for service outages or incidents](../support/service-interruption-notifications.md#enable-notifications-for-service-outages-or-incidents)_ tenant setting so Fabric notifies you when the capacity becomes overloaded, or when an outage or incident occurs.
- Set up [Azure Monitor](/azure/azure-monitor/alerts/alerts-overview) alerts to be notified when certain capacity metrics exceed a threshold. This feature is available for F SKUs, A SKUs, and autoscale for P SKUs.

#### Review and optimize capacity costs

You should regularly review and manage your billing. Consider the following options to optimize cost.

- **Differences in purpose:** For example, you might choose to use a smaller capacity size (such as an F16) for test workspaces, and a larger capacity size (such as an F64) for production workspaces.
- **Efficient use of compute resources:** Use the [Fabric Capacity Metrics App](/fabric/enterprise/metrics-app) to determine whether the compute resources are being used efficiently and whether there's any potential to optimize cost.
- **Monitoring compute cost:** Monitor the cost of your capacity, and how frequently capacities are scaled up and down. Consider using cost analysis, spending limits, or budgets with [Microsoft Cost Management](/azure/cost-management-billing/costs/overview-cost-management).
- **Billable storage cost:** Check the billable storage for each workspace in the [Fabric Capacity Metrics App](/fabric/enterprise/metrics-app). For Fabric items, storage cost is computed separately from the compute cost. Also, check the [disaster recovery](/fabric/security/disaster-recovery-guide#disaster-recovery-capacity-setting) capacity setting. This setting will have an impact on the billable storage costs.
- **Scale up and down:** Create a process to automatically scale the capacity up or down (or pause it, when applicable) when the workload is intermittent yet predictable.
- **Cost chargebacks:** When you need to distribute costs to other departments, create a chargeback process to allocate subscription costs.

### Step 6: Audit capacity licenses

It's important to have a process to regularly audit capacities. A Fabric administrator will need to work together with other [administrators](/microsoft-365/admin/add-users/about-admin-roles) to obtain this information (such as a global administrator, billing administrator, or Azure administrator).

> [!TIP]
> This section focuses on auditing for subscriptions, licenses, and trials. There are many additional auditing and monitoring aspects for capacity, including monitoring of usage and performance (and identifying needs to scale up or down) by using the [Fabric Capacity Metrics App](/fabric/enterprise/metrics-app). You will also want to monitor the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data) for situations such as when capacity settings change, capacity administrators are updated, capacity contributors are added, or when workspaces are assigned to a capacity.

Here are some actions to identify when to audit subscriptions, trials, and cost for capacities.

- **List of active capacities:** The [Get Capacities as Admin](/rest/api/power-bi/capacities/get-capacities) REST API can provide you with information such as SKU, state, administrators, and region for all of the capacities in your tenant. It's an [admin API](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#choose-a-user-api-or-admin-api) that returns a snapshot as of a point in time. If you capture this data regularly, you can compare snapshots (for example, this week versus last week) to detect changes that have occurred.
- **A new Fabric trial was started by a user:** Look for the _ChangeCapacityState_ activity in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data). The _CapacityState_ property indicates a new Fabric capacity was provisioned. The _ItemName property_ indicates that it's a trial capacity, the SKU, and its ID.
- **A new Fabric capacity was created, or an existing capacity was resized:** Look for the _Update Fabric Capacity Create_ operation in the [Azure Monitor activity log](/azure/azure-monitor/essentials/activity-log). You can also view Fabric capacities in the Azure portal.
- **The compute engine for a Fabric capacity was paused or restarted:** In [Azure Monitor activity log](/azure/azure-monitor/essentials/activity-log), look for the _Suspend_ operation, or the _Resume_ operation. You can also view the state of a Fabric capacity in the Azure portal.
- **A new Premium capacity was created:** In the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data), look for the _ChangeCapacityState_ activity. The _CapacityState_ property indicates that it was provisioned as a new capacity. You can also view products that have an active subscription in the [billing area](/microsoft-365/commerce) of the Microsoft 365 admin center.
- **Monitor cost for a Fabric capacity:** Use [Microsoft Cost Management](/fabric/enterprise/azure-billing) capabilities to [analyze costs](/azure/cost-management-billing/costs/quick-acm-cost-analysis) for Microsoft Fabric capacities and other Azure services.
- **Monitor cost for Premium capacity:** You can [view invoices](/microsoft-365/commerce/billing-and-payments/view-your-bill-or-invoice) in the billing area of the Microsoft 365 admin center.
- **A workspace was assigned to, or removed from, a capacity:** Look for the _MigrateWorkspaceIntoCapacity_ activity or the _RemoveWorkspacesFromCapacity_ activity in the [activity log](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#access-user-activity-data).

> [!TIP]
> When you navigate the Azure Portal, don't be confused by the _Service Fabric_ resources. These resources are different services from Microsoft Fabric.

> [!IMPORTANT]
> The information presented in this step isn't intended to be an all-inclusive list of ways to audit the data. Rather, it's intended to provide you with ideas to get you started with your auditing efforts. For other ideas, we recommend that you consult with your billing administrators.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for capacity licenses, key decisions and actions include:

- **Conduct a review:** Determine the current state by reviewing current capacity subscriptions.
- **Identify existing policies and decisions:** Compile existing internal policies or previous decisions related to capacity subscriptions so that the information is readily available.
- **Discuss and decide:** Schedule workshops to make key decisions related to capacity subscriptions. Involve all relevant decision makers, stakeholders, and the executive sponsor, when appropriate.
- **Create documentation:** Compile the information gathered about capacity subscriptions, and document key decisions for future reference.
- **Make updates:** Update capacity subscriptions based on the decisions made in the workshops.
- **Create a process to manage capacity requests:** Set up a process for how users can request a new capacity.
- **Set up auditing:** Create auditing processes so you can track activities related to capacity subscriptions and trials.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md).
