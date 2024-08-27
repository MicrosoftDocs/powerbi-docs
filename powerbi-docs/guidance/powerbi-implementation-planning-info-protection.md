---
title: "Power BI implementation planning: Information protection for Power BI"
description: "Learn about labeling and classification of data assets for use with Power BI."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/12/2022
---

# Power BI implementation planning: Information protection for Power BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes the planning activities related to implementing information protection in Power BI. It's targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security and other relevant teams.
- **Center of Excellence, IT, and BI teams:** Others who are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.

> [!IMPORTANT]
> Information protection and data loss prevention (DLP) is a significant organization-wide undertaking. Its scope and impact are far greater than Power BI alone. This type of initiative requires funding, prioritization, and planning. Expect to involve several cross-functional teams in your planning, usage, and oversight efforts.

Labeling and classification activities extend beyond Power BI and even data assets. The decisions discussed in this article apply to assets for the entire organization, including files and emails, and not just to Power BI. This article introduces topics that apply to labeling and classification in general, because making the right organizational decisions is critical for the success of data loss prevention in Power BI.

This article also includes introductory guidance about defining a sensitivity label structure. Technically, the sensitivity label structure is a prerequisite for implementation of sensitivity labels in Power BI. The purpose of including some basic information in this article is to help you understand what's involved. It's crucial that you collaborate with IT for planning and implementing information protection in the organization.

## Purpose of sensitivity labels

The use of Microsoft Purview Information Protection [sensitivity labels](/power-bi/enterprise/service-security-sensitivity-label-overview) is about classifying content. Think of a sensitivity label like a tag that you apply to an item, file, site, or data asset.

There are many advantages to using information protection. Classifying and labeling content helps organizations to:

- Understand where sensitive data resides.
- Track external and internal compliance requirements.
- Protect content from unauthorized users.
- Educate users on how to responsibly handle data.
- Implement real-time controls to reduce the risk of data leakage.

For more use cases for information protection, see [Information protection and DLP (Common use cases)](powerbi-implementation-planning-info-protection-data-loss-prevention-overview.md#common-use-cases).

> [!TIP]
> It helps to remember that Microsoft Purview Information Protection is the product. Sensitivity labels are a specific feature of that product.

A sensitivity label is a brief description in clear text. Conceptually, you can think of a sensitivity label like a tag. Only one label can be assigned to each item (like a Power BI semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md)—in the Power BI service) or each file (like a Power BI Desktop file).

A label has the following purposes.

- **Classification:** It provides a classification for describing the sensitivity level.
- **User education and awareness:** It helps users understand how to appropriately work with the content.
- **Policies:** It forms the basis for applying and enforcing policies and DLP.

## Prerequisites for Power BI information protection

By now, you should have completed the organization-level planning steps that are described in the [Organization-level information protection planning](powerbi-implementation-planning-organization-level-info-protection.md) article. Before proceeding, you should have clarity on:

- **Current state:** The [current state](powerbi-implementation-planning-organization-level-info-protection.md#current-state-assessment) of information protection in your organization. You should have an understanding whether sensitivity labels are already in use for Microsoft Office files. In this case, the scope of work to add Power BI is much smaller than if you're bringing information protection to the organization for the first time.
- **Goals and requirements** : The [strategic goals](powerbi-implementation-planning-organization-level-info-protection.md#goals-and-requirements) for implementing information protection in your organization. Understanding the goals and requirements will serve as a guide for your implementation efforts.

If information protection isn't in use by your organization, the remainder of this section provides information to help you collaborate with others to introduce information protection to your organization.

If information protection is actively in use within your organization, we recommend that you use this article to verify that the prerequisites are met. If sensitivity labels are actively in use, then most (or all) activities in rollout phases 1-4 (in the next section) will already be complete.

## Rollout phases

We recommend that you plan to enact a gradual rollout plan for implementing and testing information protection. The objective for a gradual rollout plan is to set yourself up to learn, adjust, and iterate as you go. The advantage is that fewer users are impacted during the early stages (when changes are more likely), until information protection is eventually rolled out to all users in the organization.

Introducing information protection is a significant undertaking. As described in the [Organization-level information protection planning](powerbi-implementation-planning-organization-level-info-protection.md#current-state-assessment) article, if your organization has already implemented information protection for Microsoft Office documents, many of these tasks will already be complete.

This section provides an overview of the phases that we recommend you include in your gradual rollout plan. It should give you a sense for what to expect. The remainder of this article describes other decision-making criteria for the key aspects that affect Power BI most directly.

### Phase 1: Plan, decide, prepare

In the first phase, focus on planning, decision-making, and preparatory activities. Most of the remainder of this article focuses this first phase.

As early as possible, clarify where the initial testing will occur. That choice will impact where you'll initially set up, publish, and test. For the initial testing, you can use a non-production tenant (if you have access to one).

> [!TIP]
> Most organizations have access to one tenant, so it can be challenging to explore new features in an isolated way. For those organizations that have a separate development or test tenant, we recommend that you use it for the initial testing phase. For more information about managing tenants and how to create a trial tenant to test out new features, see [Tenant setup](powerbi-implementation-planning-tenant-setup.md).

### Phase 2: Set up supporting user resources

The second phase includes steps to set up the resources for supporting users. Resources include your [data classification and protection policy](#data-classification-and-protection-policy) and the [custom help page](#user-documentation-and-training).

It's important to have some of the [user documentation](#user-documentation-and-training) published early. It's also important to have the [user support](#user-support) team prepared early.

### Phase 3: Set up labels and publish

The third phase focuses on defining [sensitivity labels](#sensitivity-label-structure). When all the decisions have been made, the setup isn't difficult or time-consuming. Sensitivity labels are set up in the Microsoft Purview compliance portal in the Microsoft 365 admin center.

### Phase 4: Publish label policy

Before a label can be used, you must publish it as part of a [label policy](#published-label-policies). Label policies allow certain users to use a label. Label policies are published in the Microsoft Purview compliance portal in the Microsoft 365 admin center.

> [!NOTE]
> Everything up until this point is a prerequisite for implementing information protection for Power BI.

### Phase 5: Enable Power BI tenant settings

There are several information protection [tenant settings](#power-bi-tenant-settings) in the Power BI admin portal. They're required to enable information protection in the Power BI service.

> [!IMPORTANT]
> You should set the tenant settings _after_ you've set up and published the labels in the Microsoft Purview compliance portal.

### Phase 6: Initial testing

In the sixth phase, you perform initial tests to verify that everything behaves as expected. For initial testing purposes, you should publish the label policy only for the implementation team.

During this phase, be certain to test:

- Microsoft Office files
- Power BI items in the Power BI service
- Power BI Desktop files
- Exporting files from the Power BI service
- Other scopes included in the configuration, such as Teams sites or SharePoint

Be sure to check the functionality and user experience by using a web browser and also mobile devices that are commonly used. Update your [user documentation](#user-documentation-and-training) accordingly.

> [!IMPORTANT]
> Even if only a few members of the team are authorized to set a sensitivity label, all users will be able to see labels that are assigned to content. If you're using your production tenant, users might wonder why they see labels assigned to items in a workspace in the Power BI service. Be ready to support and respond to user questions.

### Phase 7: Gather user feedback

The goal for this phase is to obtain feedback from a small group of key users. The feedback should identify areas of confusion, gaps in the [label structure](#sensitivity-label-structure), or technical issues. You might also find reasons to improve the [user documentation](#user-documentation-and-training).

To this end, you should publish (or republish) the label policy to a small subset of users who are willing to provide feedback.

> [!TIP]
> Be sure to factor sufficient time into your project plan. For labels and label policy settings, the product documentation recommends [allowing 24 hours](/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide&preserve-view=true#when-to-expect-new-labels-and-changes-to-take-effect) for the changes to take effect. This time is required to ensure all changes propagate through to related services.

### Phase 8: Release iteratively

The implementation phase is usually an iterative process.

Often, the initial objective is to get to a state where all Power BI content has a sensitivity label assigned. To achieve this objective, you might introduce a mandatory label policy or a default label policy. You might also use the [information protection admin APIs](/fabric/governance/service-security-sensitivity-label-inheritance-set-remove-api) to programmatically set or remove sensitivity labels.

You can gradually include more groups of users until the entire organization is included. This process involves republishing each [label policy](/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide&preserve-view=true#publish-sensitivity-labels-by-creating-a-label-policy) to increasingly larger groups of users.

Throughout this process, be sure to prioritize providing guidance, communications, and training to your users so they'll understand the process and what's expected of them.

### Phase 9: Monitor, audit, adjust, integrate

There are other steps to do after the initial rollout. You should have a primary team to monitor information protection activities and tune them over time. As labels are applied, you'll be able to assess their usefulness and identify areas for adjustments.

There are many aspects to auditing information protection. For more information, see [Auditing of information protection and data loss prevention for Power BI](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md).

The investments you make in setting up information protection can be used in DLP policies for Power BI, which are set up in the Microsoft Purview compliance portal. For more information, including a description of DLP capabilities, see [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md).

Information protection can also be used to create policies in Microsoft Defender for Cloud Apps. For more information, including a description of capabilities that you might find helpful, see [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing your information protection rollout phases, the key decisions and actions include:

> [!div class="checklist"]
> - **Create a gradual rollout plan:** Define the phases for your rollout plan. Clarify what the specific objectives are for each phase.
> - **Identify where to do testing:** Determine where the initial testing can be done. To minimize the impact on users, use a non-production tenant, if possible.
> - **Create a project plan:** Build a project plan that includes all the key activities, estimated timeline, and who will be responsible.

## Sensitivity label structure

The sensitivity label structure is a prerequisite for implementing sensitivity labels in Power BI. This section includes some basic information to help you understand what's involved if you're involved in creating the label structure.

This section isn't an exhaustive list of all possible sensitivity label considerations for all possible applications. Instead, its focus is on considerations and activities that directly affect the classification of Power BI content. Ensure that you work with other stakeholders and system administrators to make decisions that work well for all applications and use cases.

The foundation for implementing information protection begins with a set of sensitivity labels. The end goal is to create a set of sensitivity labels that are clear and straightforward for users to work with.

The sensitivity label structure that's used in an organization represents a _label taxonomy_. It's also commonly referred to as a _data classification taxonomy_ because the goal is to classify data. Sometimes it's referred to as a _schema definition_.

There isn't a standard, or built-in, set of labels. Each organization must define and customize a set of labels to suit their needs. The process of arriving at the right set of labels involves extensive collaboration. It requires thoughtful planning to ensure that the labels will meet goals and requirements. Remember, labels will be applied to more than just Power BI content.

> [!TIP]
> Most organizations start out by assigning labels to Microsoft Office files. They then evolve to classifying other content, such as Power BI items and files.

A label structure includes:

- **Labels:** Labels form a hierarchy. Each label indicates the level of sensitivity for an item, file, or data asset. We recommend that you create between three and seven labels. The labels should rarely change.
- **Sub-labels:** Sub-labels indicate variations in protection or scope within a specific label. By including them in different label policies, you can scope sub-labels to a certain set of users or to users involved with a specific project.

> [!TIP]
> While sub-labels offer flexibility, they should be used in moderation only to satisfy critical requirements. Creating too many sub-labels results in increased management. They can also overwhelm users with too many options.

Labels form a hierarchy, beginning with the least sensitive classification to the most sensitive classification.

Sometimes Power BI content contains data that spans multiple labels. For example, a semantic model could contain product inventory information (_General Internal Use_) and the current quarter sales figures _(Restricted_). When choosing which label to assign to the Power BI semantic model, users should be taught to apply the most restrictive label.

> [!TIP]
> The next section describes the _Data classification and protection policy_ that can provide users with guidance on when to use each label.

> [!IMPORTANT]
> Assigning a label or a sub-label doesn't directly affect access to Power BI content in the Power BI service. Instead, the label provides a useful category that can guide user behavior. Data loss prevention policies can also be based on the assigned label. However, nothing changes for how access to Power BI content is managed, except when a file is encrypted. For more information, see [Use of encryption protection](#use-of-encryption-protection).

Be deliberate with the labels you create because it's challenging to [remove or delete a label](/microsoft-365/compliance/create-sensitivity-labels?view=o365-worldwide&preserve-view=true#removing-and-deleting-labels) once you've progressed beyond the initial testing phase. Because sub-labels can (optionally) be used for a particular set of users, they can change more often than labels.

Here are some best practices for defining a label structure.

- **Use intuitive, unambiguous, terms:** Clarity is important to ensure that users know what to choose when classifying their data. For example, having a _Top Secret_ label and a _Highly Confidential_ label is ambiguous.
- **Create a logical hierarchical order:** The order of the labels is crucial to making everything work well. Remember that the last label in the list is the most sensitive. The hierarchical order, in combination with well-selected terms, should be logical and intuitive for users to work with. A clear hierarchy will also make policies easier to create and maintain.
- **Create just a few labels that apply across the organization:** Having too many labels for users to choose from will be confusing. It will also lead to less accurate label selection. We recommend that you create just a few labels for the initial set.
- **Use meaningful, generic names:** Avoid using industry jargon or acronyms in your label names. For example, rather than creating a label named _Personally Identifiable Information_, use names like _Highly Restricted_ or _Highly Confidential_ instead.
- **Use terms that are easily localized into other languages:** For global organizations with operations in multiple countries/regions, it's important to choose label terms that won't be confusing or ambiguous when they're translated into other languages.

> [!TIP]
> If you find yourself planning for many labels that are highly specific, step back and reassess your approach. Complexity can lead to user confusion, reduced adoption, and less effective information protection. We recommend that you begin with an initial set of labels (or use what you already have). After you've gained more experience, cautiously expand the set of labels by adding more specific ones when needed.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning your sensitivity label structure, key decisions and actions include:

> [!div class="checklist"]
> - **Define an initial set of sensitivity labels:** Create an initial set of between three and seven sensitivity labels. Ensure that they have broad use for a wide range of content. Plan to iterate on the initial list as you finalize the data classification and protection policy.
> - **Determine whether you need sub-labels:** Decide whether there's a need to use sub-labels for any of the labels.
> - **Verify localization of label terms:** If labels will be translated into other languages, have native speakers confirm that localized labels convey the intended meaning.

## Sensitivity label scope

A sensitivity label scope limits the use of a label. While you can't specify Power BI directly, you can apply labels to various scopes. Possible scopes include:

- Items (such as items published to the Power BI service, and files and emails)
- Groups and sites (such as a Teams channel or a SharePoint site)
- Schematized data assets (supported sources that are registered in the [Purview Data Map](/azure/purview/concept-elastic-data-map))

> [!IMPORTANT]
> It's not possible to define a sensitivity label with a scope of Power BI only. While there are some settings that apply specifically to Power BI, scope isn't one of them. The _items_ scope is used for the Power BI service. Sensitivity labels are handled differently from DLP policies, which are described in the [Data loss prevention for Power BI planning](powerbi-implementation-planning-data-loss-prevention.md) article, in that some types of DLP policies can be defined specifically for Power BI. If you intend to use sensitivity label inheritance from data sources in Power BI, there are [specific requirements](/fabric/governance/service-security-sensitivity-label-inheritance-from-data-sources#requirements) for the label scope.

Events related to sensitivity labels are recorded in the [activity explorer](/microsoft-365/compliance/data-classification-activity-explorer-available-events). Logged details of these events will be significantly richer when the scope is broader. You'll also be better prepared to protect data across a broader spectrum of applications and services.

When defining the initial set of sensitivity labels, consider making the initial set of labels available to all scopes. That's because it can become confusing for users when they see different labels in different applications and services. Over time, however, you might discover use cases for more specific sub-labels. However, it's safer to start with a consistent and simple set of initial labels.

The label scope is set in the Microsoft Purview compliance portal when the label is set up.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for the label scope, key decisions and actions include:

> [!div class="checklist"]
> - **Decide the label scope:** Discuss and decide whether each of your initial labels will be applied to all scopes.
> - **Review all prerequisites:** Investigate prerequisites and necessary setup steps that will be required for each scope that you intend to use.

## Use of encryption protection

There are multiple options for protection with a sensitivity label.

- **Encryption:** Encryption settings pertain to files or emails. For example, a Power BI Desktop file can be encrypted.
- **Markings:** Refers to headers, footers, and watermarks. Markings are useful for Microsoft Office files, but they aren't shown on Power BI content.

> [!TIP]
> Usually when someone refers to a label as _protected_, they're referring to encryption. It might be sufficient that only higher-level labels, like _Restricted_ and _Highly Restricted_, are encrypted.

Encryption is a way to cryptographically encode information. Encryption has several key advantages.

- Only authorized users (for example, internal users within your organization) can open, decrypt, and read a protected file.
- Encryption remains with a protected file, even when the file is sent outside the organization or is renamed.
- The encryption setting is obtained from the original labeled content. Consider a report in the Power BI service has a sensitivity label of _Highly Restricted_. If it's exported to a [supported export path](/power-bi/enterprise/service-security-sensitivity-label-overview#supported-export-paths), the label remains intact, and encryption is applied on the exported file.

The Azure Rights Management Service (Azure RMS) is used for file protection with encryption. There are some important [prerequisites](/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide&preserve-view=true#important-prerequisites) that must be met in order to use Azure RMS encryption.

> [!IMPORTANT]
> There's a limitation to consider: An offline user (without an internet connection) can't open an encrypted Power BI Desktop file (or other type of Azure RMS-protected file). That's because Azure RMS must synchronously verify that a user is authorized to open, decrypt, and view the file contents.

Encrypted labels are handled differently depending on where the user is working.

- **In the Power BI service:** The encryption setting doesn't have a direct effect on user access in the Power BI service. Standard Power BI permissions (such as workspace roles, app permissions, or sharing permissions) control user access in the Power BI service. Sensitivity labels don't affect access to content within the Power BI service.
- **Power BI Desktop files:** An encrypted label can be assigned to a Power BI Desktop file. The label is also retained when it's exported from the Power BI service. Only authorized users will be able to open, decrypt, and view the file.
- **Exported files:** Microsoft Excel, Microsoft PowerPoint, and PDF files exported from the Power BI service retain their sensitivity label including encryption protection. For supported file formats, only authorized users will be able to open, decrypt, and view the file.

> [!IMPORTANT]
> It's critical that users understand the distinctions between the Power BI service and files, which are easily confused. We recommend that you provide a FAQs document, together with examples, to help users understand the differences.

To open a protected Power BI Desktop file, or an exported file, a user must meet the following criteria.

- **Internet connectivity:** The user must be connected to the internet. An active internet connection is required to communicate with Azure RMS.
- **RMS permissions:** The user must have [RMS permissions](/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide&preserve-view=true#assign-permissions-to-specific-users-or-groups), which are defined within the label (rather than within the label policy). RMS permissions allow authorized users to decrypt, open, and view supported file formats.
- **Allowed user:** Users or groups must be specified in the [label policy](/microsoft-365/compliance/create-sensitivity-labels). Typically, assigning authorized users is only required for content creators and owners so they can apply labels. However, when using encryption protection there's [another requirement](/power-bi/enterprise/service-security-sensitivity-label-overview#power-bi-desktop). Each user that needs to open a protected file must be specified in the label policy. This requirement means that [information protection licensing](#licensing-requirements) might be required for more users.

> [!TIP]
> The **Allow workspace administrators to override automatically applied sensitivity labels** tenant setting enables workspace administrators to change a label that was automatically applied, even if protection (encryption) is enabled for the label. This capability is particularly helpful when a label was automatically assigned or inherited but the workspace administrator isn't an authorized user.

Label protection is set in the Microsoft Purview compliance portal when you set up the label.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for the use of label encryption, key decisions and actions include:

> [!div class="checklist"]
> - **Decide which labels should be encrypted:** For each sensitivity label, decide whether it should be encrypted (protected). Carefully consider the limitations that are involved.
> - **Identify the RMS permissions for each label:** Determine what the user permissions will be for accessing and interacting with encrypted files. Create a mapping of users and groups for each sensitivity label to help with the planning process.
> - **Review and address RMS encryption prerequisites:** Ensure that technical prerequisites for using Azure RMS encryption are met.
> - **Plan to conduct thorough testing of encryption:** Due to the differences between Office files and Power BI files, ensure that you commit to a thorough testing phase.
> - **Include in user documentation and training:** Ensure that you include guidance in your documentation and training about what users should expect for files that are assigned a sensitivity label that's encrypted.
> - **Conduct knowledge transfer with support:** Make specific plans to conduct knowledge transfer sessions with the support team. Due to the complexity of encryption, they'll likely get questions from users.

## Inheritance of labels from data sources

When importing data from supported data sources (such as Azure Synapse Analytics, Azure SQL Database, or an Excel file), a Power BI semantic model can, optionally, inherit the sensitivity label applied to the source data. Inheritance helps to:

- Promote consistency of labeling.
- Reduce user effort when assigning labels.
- Reduce the risk of users accessing and sharing sensitive data with unauthorized users because it wasn't labeled.

> [!TIP]
> There are two types of inheritance for sensitivity labels. _[Downstream inheritance](/fabric/governance/service-security-sensitivity-label-downstream-inheritance)_ refers to downstream items (like reports) that automatically inherit a label from its Power BI semantic model. However, the focus of this section is on _[upstream inheritance](/fabric/governance/service-security-sensitivity-label-inheritance-from-data-sources). Upstream inheritance refers to a Power BI semantic model that inherits a label from a data source that's upstream from the semantic model.

Consider an example where the organization's working definition for the sensitivity label of _Highly Restricted_ includes financial account numbers. Because financial account numbers are stored in an Azure SQL Database, the _Highly Restricted_ sensitivity label has been assigned to that source. When data from the Azure SQL Database is imported to Power BI, the intent is for the semantic model to inherit the label.

You can assign sensitivity labels to a supported data source in different ways.

- **Data discovery and classification:** You can scan a supported database to identify columns that could contain sensitive data. Based on the scan results, you can apply some or all the label recommendations. [Data Discovery & Classification](/azure/azure-sql/database/data-discovery-and-classification-overview) is supported for databases such as Azure SQL Database, Azure SQL Managed Instance, and Azure Synapse Analytics. [SQL Data Discovery & Classification](/sql/relational-databases/security/sql-data-discovery-and-classification) is supported for on-premises SQL Server databases.
- **Manual assignments:** You can assign a sensitivity label to an Excel file. You might also manually assign labels to database columns in Azure SQL Database or SQL Server.
- **Auto-labeling in Microsoft Purview:** Sensitivity labels can be [applied](/azure/purview/create-sensitivity-label) to supported data sources that are registered as assets in the Microsoft Purview Data Map.

> [!WARNING]
> The details for how to assign sensitivity labels to a data source are out of scope for this article. The technical capabilities are evolving with respect to what's supported for inheritance in Power BI. We recommend that you conduct a technical proof of concept to verify your goals, ease of use, and whether the capabilities meet your requirements.

Inheritance will happen only when you enable the **Apply sensitivity labels from data sources to their data in Power BI** [tenant setting](/fabric/admin/service-admin-portal-information-protection). For more information about tenant settings, see the [Power BI tenant settings](#power-bi-tenant-settings) section later in this article.

> [!TIP]
> You'll need to become familiar with the [inheritance behavior](/fabric/governance/service-security-sensitivity-label-inheritance-from-data-sources#inheritance-behavior). Be sure to include various circumstances in your test plan.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for the inheritance of labels from data sources, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether Power BI should inherit labels from data sources:** Decide whether Power BI should inherit these labels. Plan to enable the tenant setting to allow this capability.
> - **Review technical prerequisites:** Determine whether you need to take extra steps to assign sensitivity labels to data sources.
> - **Test label inheritance functionality:** Complete a technical proof of concept to test how inheritance works. Verify that the feature works as you expect in various circumstances.
> - **Include in user documentation:** Ensure that information about label inheritance is added to guidance provided to users. Include realistic examples in the user documentation.

## Published label policies

After you define a sensitivity label, the label can be added to one or more [_label policies_](/microsoft-365/compliance/sensitivity-labels). A label policy is how you publish the label so it can be used. It defines which labels can be used by which set of authorized users. There are other settings as well, such as the default label and mandatory label.

Using multiple label policies can be helpful when you need to target different sets of users. You can define a sensitivity label once and then include in one or more label policies.

> [!TIP]
> A sensitivity label isn't available for use until a label policy that contains the label is published in the Microsoft Purview compliance portal.

### Authorized users and groups

When you create a label policy, one or more users or groups must be selected. The label policy determines which users can use the label. It allows users to assign that label to specific content, such as a Power BI Desktop file, an Excel file, or an item published to the Power BI service.

We recommend that you keep the authorized users and groups as simple as possible. A good rule of thumb is for the primary labels to be published for all users. Sometimes it's appropriate for a sub-label to be assigned, or scoped, to a subset of users.

We recommend that you assign groups instead of individuals whenever possible. The use of groups simplifies management of the policy and reduces how often it needs to be republished,

> [!WARNING]
> Authorized users and groups for a label are different from the users assigned to Azure RMS for a protected (encrypted) label. If a user is having issues opening an encrypted file, investigate the encryption [permissions for specific users and groups](/microsoft-365/compliance/encryption-sensitivity-labels?view=o365-worldwide&preserve-view=true#assign-permissions-to-specific-users-or-groups) (which are set up within the label configuration, rather than within the label policy). In most situations, we recommend that you assign the same users to both. This consistency will avoid confusion and reduce support tickets.

Authorized users and groups are set in the Microsoft Purview compliance portal when the label policy is published.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for authorized users and groups in your label policy, key decisions and actions include:

> [!div class="checklist"]
> - **Determine which labels apply to all users:** Discuss and decide which sensitivity labels should be available for use by all users.
> - **Determine which sub-labels apply to a subset of users:** Discuss and decide whether there are any sub-labels that will be available for use only by a specific set of users or groups.
> - **Identify whether any new groups are needed:** Determine whether any new Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) groups will need to be created to support the authorized users and groups.
> - **Create a planning document:** If the mapping of authorized users to sensitivity labels is complicated, create a mapping of users and groups for each label policy.

### Default label for Power BI content

When creating a label policy, you can choose a default label. For example, the _General Internal Use_ label could be set as the default label. This setting will affect new Power BI items created in either Power BI Desktop or the Power BI service.

You can set up the default label in the label policy specifically for Power BI content, which is separate from other items. Most information protection decisions and settings apply more broadly. However, the default label setting (and the mandatory label setting that's described next) applies only to Power BI.

> [!TIP]
> While you can set different default labels (for Power BI and non-Power BI content), consider whether that's the best option for users.

It's important to understand that a new default label policy will apply to content created, or edited, _after_ the label policy is published. It won't retroactively assign the default label to existing content. Your Power BI administrator can use the [information protection APIs](/fabric/governance/service-security-sensitivity-label-inheritance-set-remove-api) to set sensitivity labels in bulk to ensure that existing content is assigned to a default sensitivity label.

The default label options are set in the Microsoft Purview compliance portal when the label policy is published.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning whether a default label for Power BI content will be applied, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether a default label will be specified:** Discuss and decide whether a default label is appropriate. If so, determine which label is best suited as the default.
> - **Include in user documentation:** If necessary, ensure information about the default label is mentioned in the guidance provided for users. The goal is for users to understand how to determine whether the default label is appropriate, or whether it should be changed.

### Mandatory labeling Power BI content

Data classification is a common regulatory requirement. To meet this requirement, you can choose to require users to label all Power BI content. This [mandatory labeling](/fabric/governance/service-security-sensitivity-label-mandatory-label-policy) requirement takes effect when users create or edit Power BI content.

You might choose to implement mandatory labels, default labels (described in the previous section), or both. You should consider the following points.

- A mandatory label policy ensures the label won't be empty
- A mandatory label policy requires users to choose what the label should be
- A mandatory label policy prevents users from removing a label entirely
- A default label policy is less intrusive for users because it doesn't require them to take action
- A default label policy can result in content that's mis-labeled since a user didn't expressly make the choice
- Enabling both a default label policy and a mandatory label policy can provide complementary benefits

> [!TIP]
> If you choose to implement mandatory labels, we recommend that you also implement default labels.

You can set up the mandatory label policy specifically for Power BI content. Most information protection settings apply more broadly. However, the mandatory label setting (and default label setting) applies specifically to Power BI.

> [!TIP]
> A mandatory label policy isn't applicable to service principals or APIs.

The mandatory labeling options are set in the Microsoft Purview compliance portal when the label policy is published.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning whether mandatory labeling of Power BI content will be required, key decisions and actions include:

> [!div class="checklist"]
> - **Decide whether labels will be mandatory:** Discuss and decide whether mandatory labels are necessary for compliance reasons.
> - **Include in user documentation:** If necessary, ensure that information about mandatory labels is added to guidance provided for users. The goal is for users to understand what to expect.

## Licensing requirements

[Specific licenses](/power-bi/enterprise/service-security-enable-data-sensitivity-labels#licensing-and-requirements) must be in place to work with sensitivity labels.

A [Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection/microsoft-purview-information-protection) license is required for:

- **Administrators:** The administrators who will set up, manage, and oversee labels.
- **Users:** The content creators and owners who will be responsible for applying labels to content. Users also includes those who need to decrypt, open, and view protected (encrypted) files.

You might already have these capabilities because they're included in license suites, such as [Microsoft 365 E5](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans). Alternatively, [Microsoft 365 E5 Compliance](https://www.microsoft.com/security/business/compliance/e5-compliance) capabilities can be purchased as a standalone license.

A [Power BI Pro or Premium Per User (PPU)](/power-bi/fundamentals/service-features-license-type#licenses-and-license-types) license is also required for users who will apply and manage sensitivity labels in the Power BI service or Power BI Desktop.

> [!TIP]
> If you need clarifications about licensing requirements, talk to your Microsoft account team. Be aware that the Microsoft 365 E5 Compliance license includes additional capabilities that are out of scope for this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When evaluating licensing requirements for sensitivity labels, key decisions and actions include:

> [!div class="checklist"]
> - **Review product licensing requirements:** Ensure that you review all the licensing requirements.
> - **Review user licensing requirements:** Verify that all users you expect to assign labels have Power BI Pro or PPU licenses.
> - **Procure additional licenses:** If applicable, purchase more licenses to unlock the functionality that you intend to use.
> - **Assign licenses:** Assign a license to each user who will assign, update, or manage sensitivity labels. Assign a license to each user who will interact with encrypted files.

## Power BI tenant settings

There are several Power BI tenant settings that are related to information protection.

> [!IMPORTANT]
> The Power BI tenant settings for information protection shouldn't be set until after all prerequisites are met. The labels and the label policies should be set up and published in the Microsoft Purview compliance portal. Until this time, you're still in the decision-making process. Before setting the tenant settings, you should first determine a process for how to test the functionality with a subset of users. Then you can decide how to do a gradual roll out.

### Users who can apply labels

You should decide who will be allowed to apply sensitivity labels to Power BI content. This decision will determine how you set the **Allow users to apply sensitivity labels for content** [tenant setting](/fabric/admin/service-admin-portal-information-protection).

It's typically the content creator or owner who assigns the label during their normal workflow. The most straightforward approach is to enable this tenant setting, which allows all Power BI users to apply labels. In this case, standard workspace roles will determine who can edit items in the Power BI service (including applying a label). You can use the activity log to track when a user assigns or changes a label.

### Labels from data sources

You should decide whether you want sensitivity labels to be inherited from supported data sources that are upstream from Power BI. For example, if columns in an Azure SQL Database have been defined with the _Highly Restricted_ sensitivity label, then a Power BI semantic model that imports data from that source will inherit that label.

If you decide to enable inheritance from upstream data sources, set the **Apply sensitivity labels from data sources to their data in Power BI** [tenant setting](/fabric/admin/service-admin-portal-information-protection). We recommend that you plan to enable inheritance of data source labels to promote consistency and reduce effort.

### Labels for downstream content

You should decide whether sensitivity labels should be inherited by downstream content. For example, if a Power BI semantic model has a sensitivity label of _Highly Restricted_, then all downstream reports will inherit this label from the semantic model.

If you decide to enable inheritance by downstream content, set the **Automatically apply sensitivity labels to downstream content** [tenant setting](/fabric/admin/service-admin-portal-information-protection). We recommend that you plan to enable inheritance by downstream content to promote consistency and reduce effort.

### Workspace administrator overrides

This setting applies for labels that were applied automatically (such as when default labels are applied, or when labels are automatically inherited). When a label has protection settings, Power BI allows only authorized users to change the label. This setting enables workspace administrators to change a label that was applied automatically, even if there are protection settings on the label.

If you decide to allow label updates, set the **Allow workspace administrators to override automatically applied sensitivity labels** [tenant setting](/fabric/admin/service-admin-portal-information-protection). This setting applies to the entire organization (not individual groups). It allows workspace administrators to change labels that were automatically applied.

We recommend that you consider allowing Power BI workspace administrators to update labels. You can use the activity log to track when they assign or change a label.

### Disallow sharing of protected content

You should decide whether protected (encrypted) content can be shared with everyone in your organization.

If you decide to disallow sharing of protected content, set the **Restrict content with protected labels from being shared via link with everyone in your organization** [tenant setting](/fabric/admin/service-admin-portal-information-protection). This setting applies to the entire organization (not individual groups).

We strongly recommend that you plan to enable this tenant setting to disallow sharing of protected content. When enabled, it disallows sharing operations with the entire organization for more sensitive content (defined by the labels that have encryption defined). By enabling this setting, you'll reduce the possibility of data leakage.

>[!IMPORTANT]
> There's a similar [tenant setting](/power-bi/admin/service-admin-portal-export-sharing#allow-shareable-links-to-grant-access-to-everyone-in-your-organization) named **Allow shareable links to grant access to everyone in your organization**. Although it has a similar name, its purpose is different. It defines which groups can create a sharing link for the entire organization, regardless of the sensitivity label. In most cases, we recommend this capability be limited in your organization. For more information, see the [Report consumer security planning](powerbi-implementation-planning-security-report-consumer-planning.md#per-item-permission-links) article.

### Supported export file types

In the Power BI admin portal, there are many export and sharing tenant settings. In most circumstances, we recommend that the ability to export data be available to all (or most) users so as not to limit user productivity.

However, highly regulated industries could have a requirement to restrict exports when information protection can't be enforced for the output format. A sensitivity label that's applied in the Power BI service follows the content when it's exported to a supported file path. It includes Excel, PowerPoint, PDF, and Power BI Desktop files. Since the sensitivity label stays with the exported file, protection benefits (encryption that prevents unauthorized users from opening the file) are retained for these supported file formats.

> [!WARNING]
> When exporting from Power BI Desktop to a PDF file, the protection is not retained for the exported file. We recommend that you educate your content creators to export from the Power BI service to achieve maximum information protection.

Not all export formats support information protection. Unsupported formats, such as .csv, .xml, .mhtml, or .png files (available when using the [ExportToFile API](/power-bi/developer/embedded/export-to)) might be disabled in the Power BI tenant settings.

> [!TIP]
> We recommend that you restrict exporting capabilities only when you must meet specific regulatory requirements. In typical scenarios, we recommend that you use the [Power BI activity log](/power-bi/enterprise/service-admin-auditing) to identify which users are performing exports. You can then teach these users about more efficient and secure alternatives.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning how tenant settings will be set up in the Power BI admin portal, key decisions and actions include:

> [!div class="checklist"]
> - **Decide which users can apply sensitivity labels:** Discuss and decide whether sensitivity labels can be assigned to Power BI content by all users (based on standard Power BI security) or only by certain groups of users.
> - **Determine whether labels should be inherited from upstream data sources:** Discuss and decide whether labels from data sources should be automatically applied to Power BI content that uses the data source.
> - **Determine whether labels should be inherited by downstream items:** Discuss and decide whether labels assigned to existing Power BI semantic models should be automatically applied to related content.
> - **Decide whether Power BI workspace administrators can override labels:** Discuss and decide whether it's appropriate for workspace administrators to be able to change protected labels that were automatically assigned.
> - **Determine whether protected content can be shared with the entire organization:** Discuss and decide whether sharing links for "people in your organization" can be created when a protected (encrypted) label has been assigned to an item in the Power BI service.
> - **Decide which export formats are enabled:** Identify regulatory requirements that will affect which export formats are available. Discuss and decide whether users will be able to use all export formats in the Power BI service. Determine whether certain formats need to be disabled in the tenant settings when the export format doesn't support information protection.

## Data classification and protection policy

Setting up your label structure and publishing your label policies are necessary first steps. However, there's more to do to help your organization be successful with classifying and protecting data. It's critical that you provide guidance to users about what can and can't be done with content that's been assigned to a certain label. That's where you'll find a _data classification and protection policy_ is helpful. You can think of it as your label guidelines.

> [!NOTE]
> A data classification and protection policy is an internal governance policy. You might choose to call it something different. What matters is that it's documentation that you create and provide to your users so they know _how_ to use the labels effectively. Since the label policy is a specific page in the Microsoft Purview compliance portal, try to avoid calling your internal governance policy by the same name.

We recommend that you iteratively create your data classification and protection policy while you're in the decision-making process. It will mean everything is clearly defined when it's time to set up the sensitivity labels.

Here are some of the key pieces of information that you might include in your data classification and protection policy.

- **Description of the label:** Beyond the label name, provide a full description of the label. The description should be clear yet brief. Here are some example descriptions:
  - _General Internal Use_ - for private, internal, business data
  - _Restricted_ - for sensitive business data that would cause harm if compromised or is subject to regulatory or compliance requirements
- **Examples:** Provide examples to help explain when to use the label. Here are some examples:
  - _General Internal Use_ - for most internal communications, non-sensitive support data, survey responses, reviews, ratings, and imprecise location data
  - _Restricted_ - for personally identifiable information (PII) data such as name, address, phone, email, government ID number, race, or ethnicity. Includes vendor and partner contracts, non-public financial data, employee, and human resources (HR) data. Also includes proprietary information, intellectual property, and precise location data.
- **Label required:** Describes whether assigning a label is mandatory for all new and changed content.
- **Default label:** Describes whether this label is a default label that's automatically applied to new content.
- **Access restrictions:** Additional information that clarifies whether internal and/or external users are permitted to see content assigned to this label. Here are some examples:
  - All users, including internal users, external users, and third parties with active non-disclosure agreements (NDAs) in place can access this information.
  - Internal users only can access this information. No partners, vendors, contractors, or third parties, regardless of NDA or confidentiality agreement status.
  - Internal access to information is based on job role authorization.
- **Encryption requirements:** Describes whether data is required to be encrypted at-rest and in-transit. This information will correlate to how the sensitivity label is set up and will affect the protection policies that can be implemented for file (RMS) encryption.
- **Downloads allowed and/or offline access:** Describes whether offline access is permitted. It can also define whether downloads are permitted to organizational or personal devices.
- **How to request an exception:** Describes whether a user can request an exception to the standard policy, and how that can be done.
- **Audit frequency:** Specifies the frequency of compliance reviews. Higher sensitive labels should involve more frequent and thorough auditing processes.
- **Other metadata:** A [data policy](/power-bi/guidance/fabric-adoption-roadmap-governance#data-policies) requires more metadata, such as policy owner, approver, and effective date.

> [!TIP]
> When creating your data classification and protection policy, focus on making it a straightforward reference for users. It should be as short and clear as possible. If it's too complex, users won't always take the time to understand it.

One way to automate the implementation of a policy, such as the data classification and protection policy, is with [Microsoft Entra terms of use](/azure/active-directory/conditional-access/terms-of-use). When a terms of use policy is set up, users are required to acknowledge the policy before they're permitted to visit the Power BI service for the first time. It's also possible to ask them to agree again on a recurring basis, for example every 12 months.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning the internal policy to govern expectations for usage of sensitivity labels, key decisions and actions include:

> [!div class="checklist"]
> - **Create a data classification and protection policy:** For each sensitivity label in your structure, create a centralized policy document. This document should define what can or can't be done with content that's been assigned each label.
> - **Obtain consensus on the data classification and protection policy:** Ensure that all necessary people in the team you assembled have agreed to the provisions.
> - **Consider how to handle exceptions to the policy:** Highly decentralized organizations should consider whether exceptions might arise. Though it's preferable to have a standardized data classification and protection policy, decide how you'll address exceptions when new requests are made.
> - **Consider where to locate your internal policy:** Give some thought to where the data classification and protection policy should be published. Ensure that all users can easily access it. Plan to include it on the custom help page when you publish the label policy.

## User documentation and training

Before rolling out information protection functionality, we recommend that you create and publish guidance documentation for your users. The goal of the documentation is to achieve a seamless user experience. Preparing the guidance for your users will also help you make sure you've considered everything.

You can publish the guidance as part of the sensitivity label's [custom help page](/power-bi/enterprise/service-security-sensitivity-label-custom-help-link). A SharePoint page or a wiki page in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) can work well because it will be easy to maintain. A document uploaded to a shared library or Teams site is also a good approach. The URL for the custom help page is specified in the Microsoft Purview compliance portal when you publish the label policy.

> [!TIP]
> The [custom help page](/power-bi/enterprise/service-security-sensitivity-label-custom-help-link) is an important resource. Links to it are made available in various applications and services.

The user documentation should include the data classification and protection policy [described earlier](#data-classification-and-protection-policy). That internal policy is targeted at all users. Interested users include content creators and consumers who need to understand the implications for labels that have been assigned by other users.

In addition to the data classification and protection policy, we recommend that you prepare guidance for your content creators and owners about:

- **Viewing labels:** Information about what each label means. Correlate each label with your data classification and protection policy.
- **Assigning labels:** Guidance on how to assign and manage labels. Include information they'll need to know, such as mandatory labels, default labels, and how label inheritance works.
- **Workflow:** Suggestions for how to assign and review labels as part of their normal workflow. Labels can be assigned in [Power BI Desktop](/power-bi/enterprise/service-security-sensitivity-label-overview#sensitivity-labels-in-power-bi-desktop) as soon as development begins, which protects the original Power BI Desktop file during the development process.
- **Situational notifications:** Awareness about system-generated notifications that users might receive. For example, a SharePoint site is assigned to a certain sensitivity label, but an individual file has been assigned to more sensitive (higher) label. The user who assigned the higher label will receive an email notification that the label assigned to the file is incompatible with the site where it's stored.

Include information about who users should contact if they have questions or technical issues. Since information protection is an organization-wide project, support is often provided by IT.

FAQs and examples are especially helpful for user documentation.

> [!TIP]
> Some regulatory requirements include a specific training component.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing user documentation and training, key decisions and actions include:

> [!div class="checklist"]
> - **Identify what information to include:** Determine what information should be included so all relevant audiences understand what's expected of them when it comes to protecting data on behalf of the organization.
> - **Publish the custom help page:** Create and publish a custom help page. Include guidance about labeling in the form of FAQs and examples. Include a link to access the data classification and protection policy.
> - **Publish the data classification and protection policy:** Publish the policy document that defines what exactly can or can't be done with content that's been assigned to each label.
> - **Determine whether specific training is needed:** Create or update your user training to include helpful information, especially if there's a regulatory requirement to do so.

## User support

It's important to verify who will be responsible for [user support](fabric-adoption-roadmap-user-support.md). It's common that sensitivity labels are supported by a centralized IT help desk.

You might need to create guidance for the help desk (sometimes known as a _runbook_). You might also need to conduct knowledge transfer sessions to ensure that the help desk is ready to respond to support requests.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing for the user support function, key decisions and actions include:

> [!div class="checklist"]
> - **Identify who will provide user support:** When you're defining roles and responsibilities, make sure to include how users will get help for issues related to information protection.
> - **Ensure the user support team is ready:** Create documentation and conduct knowledge transfer sessions to ensure that the help desk is ready to support information protection. Emphasize complex aspects that might confuse users, such as encryption protection.
> - **Communicate between teams:** Discuss the process and expectations with the support team, as well as your Power BI administrators and Center of Excellence. Make sure that everyone involved is prepared for potential questions from Power BI users.

## Implementation summary

After the decisions have been made and prerequisites have been met, it's time to begin implementing information protection according to your [gradual rollout plan](#rollout-phases).

The following checklist includes a summarized list of the end-to-end implementation steps. Many of the steps have other details that were covered in previous sections of this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When implementing information protection, key decisions and actions include:

> [!div class="checklist"]
> - **Verify current state and goals:** Ensure that you have clarity on the current state of information protection in the organization. All goals and requirements for implementing information protection should be clear and actively used to drive the decision-making process.
> - **Make decisions:** Review and discuss all the decisions that are required. This task should occur prior to setting up anything in production.
> - **Review licensing requirements:** Ensure that you understand the product licensing and user licensing requirements. Procure and assign more licenses, if necessary.
> - **Publish user documentation:** Publish your data classification and protection policy. Create a custom help page that contains the relevant information that users will need.
> - **Prepare the support team:** Conduct knowledge transfer sessions to ensure that the support team is ready to handle questions from users.
> - **Create the sensitivity labels:** Set up each of the sensitivity labels in the Microsoft Purview compliance portal.
> - **Publish a sensitivity label policy:** Create and publish a label policy in the Microsoft Purview compliance portal. Start by testing with a small group of users.
> - **Set the Power BI tenant settings:** In the Power BI admin portal, set the [information protection tenant settings](#power-bi-tenant-settings).
> - **Perform initial testing:** Perform an initial set of tests to verify everything is working correctly. Use a non-production tenant for initial testing, if available.
> - **Gather user feedback:** Publish the label policy to a small subset of users who are willing to test the functionality. Obtain feedback on the process and user experience.
> - **Continue iterative releases:** Publish the label policy to other groups of users. Onboard more groups of users until the entire organization is included.

> [!TIP]
> These checklist items are summarized for planning purposes. For more details about these checklist items, see the previous sections of this article.

## Ongoing monitoring

After you've completed the implementation, you should direct your attention to monitoring and tuning sensitivity labels.

Power BI administrators and security and compliance administrators will need to collaborate from time to time. For Power BI content, there are two audiences who are concerned with monitoring.

- **Power BI administrators:** An entry in the Power BI activity log is recorded each time a sensitivity label is assigned or changed. The activity log entry records details of the event, including user, date and time, item name, workspace, and capacity. Other activity log events (such as when a report is viewed) will include the sensitivity label ID that's assigned to the item.
- **Security and compliance administrators:** The organization's security and compliance administrators will typically use Microsoft Purview reports, alerts, and audit logs.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When monitoring information protection, key decisions and actions include:

> [!div class="checklist"]
> - **Verify roles and responsibilities:** Ensure that you're clear on who is responsible for which actions. Educate and communicate with your Power BI administrators or security administrators, if they'll be directly responsible for some aspects.
> - **Create or validate your process for reviewing activity:** Make sure the security and compliance administrators are clear on the expectations for reviewing the activity explorer regularly.

> [!TIP]
> For more information about auditing, see [Auditing of information protection and data loss prevention for Power BI](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md).

## Related content

In the [next article in this series](powerbi-implementation-planning-data-loss-prevention.md), learn about data loss prevention for Power BI.
