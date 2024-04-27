---
title: "Power BI implementation planning: Data loss prevention for Power BI"
description: "Learn about data loss prevention for Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 09/15/2022
---

# Power BI implementation planning: Data loss prevention for Power BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes the planning activities related to implementing data loss prevention (DLP) in Power BI. It's targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security teams and other relevant teams.
- **Center of Excellence, IT, and BI teams:** Others who are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.

> [!IMPORTANT]
> Data loss prevention (DLP) is a significant organization-wide undertaking. Its scope and impact are far greater than Power BI alone. This type of initiative requires funding, prioritization, and planning. Expect to involve several cross-functional teams in your planning, usage, and oversight efforts.

We recommend that you follow a gradual, phased approach to rolling out DLP for Power BI. For a description of the types of rollout phases that you should consider, see [Information protection for Power BI (Rollout phases)](powerbi-implementation-planning-info-protection.md#rollout-phases).

## Purpose of DLP

Data loss prevention (DLP) refers to activities and practices that safeguard the organization's data. The goal for DLP is to reduce the risk of data leakage, which can happen when sensitive data is shared with unauthorized people. Although responsible user behavior is a critical part of safeguarding data, DLP usually refers to policies that are automated.

DLP allows you to:

- Detect and inform administrators when risky, inadvertent, or inappropriate sharing of sensitive data has occurred. Specifically, it allows you to:
  - Improve the overall security setup of your Power BI tenant, with automation and information.
  - Enable analytical use cases that involve sensitive data.
  - Provide auditing information to security administrators.
- Provide users with contextual notifications. Specifically, it allows you to:
  - Help users make the right decisions during their normal workflow.
  - Guide users to follow your [data classification and protection policy](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy) without negatively affecting their productivity.

## DLP services

Broadly, there are two different services that can implement data loss prevention.

- Microsoft Purview DLP policies for Power BI
- Microsoft Defender for Cloud Apps

### Microsoft Purview DLP policies for Power BI

A [DLP policy for Power BI](/power-bi/enterprise/service-security-dlp-policies-for-power-bi) is set up in the Microsoft Purview compliance portal. It can detect sensitive data in a semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) that's been published to a Premium workspace in the Power BI service.

[!INCLUDE [powerbi-premium-notification](includes/powerbi-premium-notification.md)]

The goal for this type of DLP policy is to bring awareness to users and inform administrators of where sensitive data is stored. The DLP policy can generate user notifications and administrator alerts based on sensitive information types or sensitivity labels. For example, you can determine whether credit card information or personally identifiable information (PII) is stored in a semantic model.

> [!NOTE]
> DLP for Power BI is the focus of this article.

### Microsoft Defender for Cloud Apps

[Microsoft Defender for Cloud Apps](/fabric/governance/service-security-using-defender-for-cloud-apps-controls) is a tool with many capabilities. Some policies that can be set up in Microsoft Defender for Cloud Apps (with integration with Microsoft Entra ID—[previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)) include DLP. These policies can block, log, or alert when certain user activities happen. For example, when a user attempts to download a report from the Power BI service that's been assigned a _Highly Restricted_ sensitivity label, the download action is blocked.

The [Defender for Cloud Apps for Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md) article covers using Defender for Cloud Apps for monitoring the Power BI service. The remainder of this article focuses on DLP for Power BI.

> [!IMPORTANT]
> A DLP policy for Power BI that's set up in the Microsoft Purview compliance portal can be applied only for content that's stored in a Power BI [Premium](/power-bi/enterprise/service-premium-what-is) workspace. However, policies that are set up in Defender for Cloud Apps don't have a similar Power BI Premium prerequisite. Be aware that the functionality, purpose, and available actions differ for the two toolsets. To achieve maximum effect, we recommend that you consider using both toolsets.

## Prerequisites for DLP for Power BI

By now, you should have completed the organization-level planning steps that are described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article. Before proceeding, you should have clarity on:

- **Current state:** The [current state](powerbi-implementation-planning-organization-level-info-protection.md#current-state-assessment) of DLP in your organization. You should have an understanding to what extent DLP is already in use, and who's responsible for managing it.
- **Goals and requirements:** The [strategic goals](powerbi-implementation-planning-organization-level-info-protection.md#goals-and-requirements) for implementing DLP in your organization. Understanding the goals and requirements will serve as a guide for your implementation efforts.

Usually, you implement information protection (described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article) before you implement DLP. However, that isn't a prerequisite for using DLP for Power BI. If sensitivity labels are published, they can be used with DLP for Power BI. You can also use sensitive information types with DLP for Power BI. Both types are described in this article.

## Key decisions and actions

The intention of a DLP policy is to set up an automated action, based on rules and conditions, on the content you intend to protect. You'll need to make some decisions about the rules and conditions that will support your [goals and requirements](powerbi-implementation-planning-organization-level-info-protection.md#goals-and-requirements).

The advantage of defining separate rules within a single DLP policy is that you can enable customized alerts or user notifications.

There's a hierarchical precedence to the list of DLP policies, as well as to DLP policy rules, to consider. The precedence will affect which policy gets invoked when it's encountered first.

> [!CAUTION]
> This section isn't an exhaustive list of all possible DLP decisions for all possible applications. Ensure that you work with other stakeholders and system administrators to make decisions that work well for all applications and use cases. For example, we recommend that you investigate additional DLP policies for protecting source files and exported files that are stored in OneDrive or SharePoint. This set of articles focuses only on content in the Power BI service.

### Type of sensitive data

A DLP policy for Power BI that's set up in the Microsoft Purview compliance portal can be based on either a [sensitivity label](/microsoft-365/compliance/sensitivity-labels) or a [sensitive information type](/microsoft-365/compliance/sensitive-information-type-learn-about).

> [!IMPORTANT]
> Although you can assign sensitivity labels to most types of items in Power BI, the DLP policies described in this article are focused specifically on semantic models. The semantic model must be published to a Premium workspace.

#### Sensitivity label

You can use sensitivity labels to classify content, ranging from less sensitive to more sensitive.

When a DLP policy for Power BI is invoked, a _sensitivity label rule_ checks semantic models (that are published to the Power BI service) for the presence of a certain sensitivity label. As described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article, a label can be assigned either by a user or by an automated process (for example, an inherited label or a default label).

Here are some examples of when you might create a DLP rule based on a sensitivity label.

- **Regulatory compliance:** You have a sensitivity label that's reserved for data that's subject to a particular regulatory requirement. You want to raise an alert for your security administrators when users assign that sensitivity label to a semantic model in the Power BI service.
- **Reminders for content creators about confidential data:** You have a sensitivity label that's used for confidential data. You want to generate a user notification when a user views the semantic model details page within the [data hub](/power-bi/connect-data/service-data-hub?tabs=semantic-models) in the Power BI service. For instance, you could remind users about how to appropriately handle confidential data.

Other considerations about user notifications and alerts are described in this next section of this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering the needs for sensitivity label rules, key decisions and actions include:

> [!div class="checklist"]
> - **Verify current state of information protection:** Ensure that sensitivity labels are deployed in the organization, and that they're ready for use by DLP policies.
> - **Compile use cases for DLP based on sensitivity labels:** Determine which sensitivity labels would benefit from having DLP policies in place. Consider your goals, regulations, and internal requirements.
> - **Prioritize the list of use cases for DLP based on sensitivity labels:** Discuss the top priorities with your team. Identify which items to prioritize on your project plan.

> [!NOTE]
> DLP policies are typically automated. However, responsible user actions also play a crucial role in protecting data.

For more information, see [Information protection for Power BI (Data classification and protection policy)](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy). It describes an internal governance policy that provides guidance about what users can and can't do with content that's been assigned to a certain sensitivity label.

#### Sensitive information types

Not all types of data are the same; certain types of data are inherently more sensitive than others. There are many different [sensitive information types (SITs)](/microsoft-365/compliance/sensitive-information-type-learn-about). Depending on your industry and the compliance requirements, only some SITs will be applicable to your organization.

Some common examples of SITs include:

- Passport, social security, and driver's license numbers
- Bank account and routing numbers
- Credit card and debit card numbers
- Tax identification and national ID numbers
- Health ID numbers and medical information
- Physical addresses
- Account keys, passwords, and database connection strings

> [!TIP]
> If sensitive data doesn't have analytical value, ask yourself whether it should reside in an analytical system. We recommend that you educate your content creators to help them make good decisions about what data to store in Power BI.

SITs are [pattern-based classifiers](/microsoft-365/compliance/sensitive-information-type-entity-definitions). They'll look for a known pattern in text by using [regular expressions](/dotnet/standard/base-types/regular-expression-language-quick-reference).

You'll find many pre-configured SITs in the Microsoft Purview compliance portal. When they meet your requirements, you should use a pre-configured SIT to save time. Consider the [credit card number](/microsoft-365/compliance/sensitive-information-type-entity-definitions#credit-card-number) pre-configured SIT: It detects the correct patterns for all major card issuers, ensures the validity of the checksum, and searches for a relevant keyword within proximity to the credit card number.

If the pre-configured SITs don't meet your needs, or you have proprietary data patterns, you can create a [custom SIT](/microsoft-365/compliance/create-a-custom-sensitive-information-type). For example, you can create a custom SIT to match the pattern of your employee ID number.

Once the SIT is set up, a DLP policy for Power BI is invoked when a semantic model is uploaded or refreshed. At that time, a _sensitive information type rule_ will check semantic models (in the Power BI service) for the presence of sensitive information types.

Here are some examples of when you might create a DLP rule based on a sensitive information type.

- **Regulatory compliance:** You have a sensitive information type that's subject to regulatory requirements. You want to generate an alert for your security administrators when that type of data is detected within a semantic model in the Power BI service.
- **Internal requirements:** You have a sensitive information type that needs special handling. To meet internal requirements, you want to generate a user notification when a user views the semantic model settings or the semantic model details page in the [data hub](/power-bi/connect-data/service-data-hub?tabs=semantic-models) (in the Power BI service).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering the needs for sensitive information types, key decisions and actions include:

> [!div class="checklist"]
> - **Compile use cases for DLP based on sensitive information types:** Determine which sensitive information types would benefit from having DLP policies in place. Consider your goals, regulations, and internal requirements.
> - **Test existing sensitive information types:** Work with the information security team to verify that the pre-configured SITs will meet your needs. Use test data to confirm that patterns and keywords are correctly detected.
> - **Create custom sensitive information types:** If applicable, work with your information security team to create SITs so they can be used in DLP for Power BI.
> - **Prioritize the list of use cases:** Discuss the top priorities with your team. Identify which items to prioritize on your project plan.

### User notifications

When you've identified use cases for DLP with sensitivity labels and SITs, you should next consider what happens when a DLP rule match occurs. Typically, it involves a user notification.

[User notifications](/power-bi/enterprise/service-security-dlp-policies-for-power-bi#what-happens-when-a-dataset-is-flagged-by-a-power-bi-dlp-policy) for DLP policies are also known as _policy tips_. They're useful when you want to provide more guidance and awareness to your users during the normal course of their work. It's more likely that users will read and absorb user notifications if they're:

- **Specific:** Correlating the message to the rule makes it far easier to understand.
- **Actionable:** Offering a suggestion for what the user needs to do, or how to find more information.

For DLP in Power BI, user notifications appear in the semantic model settings. They also appear across the top of the semantic model details page in the data hub, as shown in the following screenshot. In this instance, the notification reads: _This data contains credit cards. That type of data is not permitted in Power BI per the Data Classification, Protection, and Usage policy._

:::image type="content" source="media/powerbi-implementation-planning-data-loss-prevention/data-loss-prevention-user-notification.png" alt-text="Screenshot shows a DLP user notification across the top of the data hub page." border="false":::

You can define one or more rules for each DLP policy. Each rule can optionally have a different policy tip that will be displayed to users.

Consider the following example of how you could define a DLP policy for detecting financial data stored within semantic models in the Power BI service. The DLP policy uses SITs and it has two rules.

- **Rule 1:** The first rule detects credit card numbers. The customized policy tip text reads: _This data contains credit card numbers. That type of data is not permitted in Power BI per the Data Classification and Protection policy._
- **Rule 2:** The second rule detects financial accounts. The customized policy tip text reads: _This data contains sensitive financial information. It requires the use of the Highly Restricted label. Please refer to the Data Classification and Protection Policy for requirements when storing financial data._

Rule 1 is more urgent than rule 2. Rule 1 is intended to communicate that there's a problem that requires action. The second rule is more informational. For urgent issues, it's a good idea to set up alerting. Alerting for administrators is described in the [next section](#administrator-alerting).

When deciding what notifications users should receive, we recommend that you focus on showing only highly important notifications. If there are too many policy notifications, users could become overwhelmed by them. The result is that some notifications might be overlooked.

Users can take action by [reporting an issue](/power-bi/enterprise/service-security-dlp-policies-for-power-bi-override) when they believe it's a false positive (misidentified). It's also possible to allow the user to override the policy. These capabilities are intended to allow communication between Power BI users and the security administrators who manage DLP for Power BI.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering DLP user notifications, key decisions and actions include:

> [!div class="checklist"]
> - **Decide when user notifications are needed:** For each DLP rule you intend to create, determine whether a custom user notification is required.
> - **Create customized policy tips:** For each notification, define what message should be shown to users. Plan to correlate the message to the DLP rule so that it's specific and actionable.

### Administrator alerting

Alerting is useful for certain DLP rules when you want to track incidents when a policy violation occurred. When you define DLP policy rules, consider whether [alerts](/microsoft-365/compliance/dlp-configure-view-alerts-policies) should be generated.

> [!TIP]
> Alerts are designed to call the attention of an administrator to certain situations. They're best suited when you intend to actively investigate and resolve important alerts. You can find all DPS rule matches in the activity explorer in the Microsoft Purview compliance portal.

Alerting is useful when you want to:

- Make your security and compliance administrators aware that something occurred via the [DLP alert management dashboard](/microsoft-365/compliance/dlp-alerts-dashboard-get-started#investigate-a-dlp-alert). Optionally, you can also send an email to a specific set of users.
- See more details for an event that occurred.
- Assign an event to someone to investigate it.
- Manage the status of an event or add comments to it.
- View other alerts generated for activity by the same user.

Each alert can be defined by a severity level, which can be low, medium, or high. The severity level helps to prioritize the review of open alerts.

Here are two examples of how alerts can be used.

**Example 1:** You've defined a DLP policy for detecting financial data stored in semantic models in the Power BI service. The DLP policy uses sensitive information types. It has two rules.

- **Rule 1:** This rule detects credit card numbers. Alerting is enabled with a high severity. An email is generated too.
- **Rule 2:** This rule detects financial accounts. Alerting is enabled with a high severity.

**Example 2:** You've defined a DLP policy that's invoked when the _Highly Restricted\Executive Committee and Board Members_ sensitivity label is assigned to a semantic model in the Power BI service. It doesn't generate a user notification. In this situation, you might not want to generate an alert because you only want to log the occurrence. If needed, you can obtain more information from the [activity explorer](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md#microsoft-purview-activity-explorer).

When an email alert is required, we recommend that you use a mail-enabled security group. For example, you might use a group named _Security and Privacy Admin Alerting_.

> [!TIP]
> Keep in mind that DLP rules for Power BI are checked every time that a semantic model is uploaded or refreshed. That means an alert could be generated each time the semantic model is refreshed. Regular or frequent data refreshes could result in an overwhelming number of logged events and alerts.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering DLP alerting for administrators, key decisions and actions include:

> [!div class="checklist"]
> - **Decide when alerts are required:** For each DLP rule you intend to create, determine which situations warrant using alerts.
> - **Clarify roles and responsibilities:** Determine the expectations and the specific actions that should be taken when an alert is generated.
> - **Determine who will receive alerts:** Decide which security and compliance administrators will handle open alerts. Confirm that permissions and licensing requirements are met for each administrator that will use the Microsoft Purview compliance portal.
> - **Create email groups:** If necessary, create new mail-enabled security groups to handle alerting.

### Workspaces in scope

A [DLP policy for Power BI](/power-bi/enterprise/service-security-dlp-policies-for-power-bi) that's set up in the Microsoft Purview compliance portal is intended to target semantic models. Specifically, it supports scanning semantic models that have been published to a Premium workspace.

You can set up the DLP policy to scan all Premium workspaces. Optionally, you can choose to include, or exclude, specific workspaces. For example, you might exclude certain development or test workspaces that are considered lower risk (particularly if they don't contain real production data). Alternatively, you might create separate policies for certain development or test workspaces.

> [!TIP]
> If you decide that only a subset of your Premium workspaces will be included for DLP, consider the level of maintenance. DLP rules are easier to maintain when all Premium workspaces are included. If you decide to include only a subset of Premium workspaces, make sure that you have an auditing process in place so you can quickly identify whether a new workspace is missing from the DLP policy.

For more information about workspace, see the [workspace planning](powerbi-implementation-planning-workspaces-overview.md) articles.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering which workspaces to include in scope for DLP, key decisions and actions include:

> [!div class="checklist"]
> - **Decide which Premium workspaces should have DLP applied:** Consider whether the DLP policies should affect all Power BI Premium workspaces or only a subset of them.
> - **Create documentation for workspace assignments:** If applicable, document which workspaces are subject to DLP. Include the criteria and reasons why workspaces are included or excluded.
> - **Correlate DLP decisions with your workspace governance:** If applicable, update your workspace governance documentation to include details about how DLP is handled.
> - **Consider other important file locations:** In addition to the Power BI service, determine whether it's necessary to create other DLP policies to protect source files and exported files that are stored in OneDrive or SharePoint.

## Licensing requirements

To use DLP, there are several [licensing requirements](/power-bi/enterprise/service-security-dlp-policies-for-power-bi#licensing-and-permissions). A [Microsoft Purview Information Protection](https://www.microsoft.com/security/business/information-protection/microsoft-purview-information-protection) license is required for the administrators who will set up, manage, and oversee DLP. You might already have these licenses because they're included in some license suites, such as [Microsoft 365 E5](https://www.microsoft.com/microsoft-365/compare-microsoft-365-enterprise-plans). Alternatively, [Microsoft 365 E5 Compliance](https://www.microsoft.com/security/business/compliance/e5-compliance) capabilities can be purchased as a standalone license.

Also, DLP policies for Power BI require [Power BI Premium](/power-bi/enterprise/service-premium-what-is). This [licensing requirement](/power-bi/enterprise/service-security-dlp-policies-for-power-bi#considerations-and-limitations) can be met with a Premium capacity or a Premium Per User (PPU) license.

> [!TIP]
> If you need clarifications about licensing requirements, talk to your Microsoft account team. Note that the Microsoft 365 E5 Compliance license includes other DLP capabilities that are out scope for this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When evaluating DLP licensing requirements, key decisions and actions include:

> [!div class="checklist"]
> - **Review product licensing requirements:** Ensure that you've reviewed all the licensing requirements for DLP.
> - **Review Premium licensing requirements:** Verify that the workspaces you want to configure for DLP are Premium workspaces.
> - **Procure additional licenses:** If applicable, purchase more licenses to unlock the functionality that you intend to use.
> - **Assign licenses:** Assign a license to each of your security and compliance administrators who will need one.

## User documentation and training

Before rolling out DLP for Power BI, we recommend that you create and publish user documentation. A SharePoint page or a wiki page in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) can work well because it will be easy to maintain. A document uploaded to a shared library or Teams site is a good solution, too.

The goal of the documentation is to achieve a seamless user experience. Preparing user documentation will also help you make sure you've considered everything.

Include information about who to contact when users have questions or technical issues. Because information protection is an organization-wide project, support is often provided by IT.

FAQs and examples are especially helpful for user documentation.

> [!TIP]
> For more information, see [Information protection for Power BI (Data classification and protection policy)](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy). It describes suggestions for creating a data classification and protection policy so that users understand what they can and can't do with sensitivity labels.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing user documentation and training, key decisions and actions include:

> [!div class="checklist"]
> - **Update documentation for content creators and consumers:** Update your FAQs and examples to include relevant guidance about DLP policies.
> - **Publish how to get help:** Ensure that your users know how to get help when they're experiencing something unexpected or that they don't understand.
> - **Determine whether specific training is needed:** Create or update your user training to include helpful information, especially if there's a regulatory requirement to do so.

## User support

It's important to verify who will be responsible for [user support](fabric-adoption-roadmap-user-support.md). It's common that DLP is supported by a centralized IT help desk.

You might need to create guidance for the help desk (sometimes known as a _runbook_). You might also need to conduct knowledge transfer sessions to ensure that the help desk is ready to respond to support requests.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing for the user support function, key decisions and actions include:

> [!div class="checklist"]
> - **Identify who will provide user support:** When you're defining roles and responsibilities, make sure to account for how users will get help with issues related to DLP.
> - **Ensure the user support team is ready:** Create documentation and conduct knowledge transfer sessions to ensure that the help desk is ready to support DLP.
> - **Communicate between teams:** Discuss user notifications and the process to resolve DLP alerts with the support team, as well as your Power BI administrators and Center of Excellence. Make sure that everyone involved is prepared for potential questions from Power BI users.

## Implementation and testing summary

After the decisions have been made and prerequisites have been met, it's time to begin implementing and testing DLP for Power BI.

DLP policies for Power BI are set up in the Microsoft Purview compliance portal (formerly known as the Microsoft 365 compliance center) in the Microsoft 365 admin center.

> [!TIP]
> The process to set up DLP for Power BI in the Microsoft Purview compliance portal involves just one step, instead of two, to set up the policy. This process is different from when you set up information protection in the Microsoft Purview compliance portal (described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article). In that case, there were two separate steps to set up the label and publish a label policy. In this case for DLP, there's just one step in the implementation process.

The following checklist includes a summarized list of the end-to-end implementation steps. Many of the steps have other details that were covered in previous sections of this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When implementing DLP for Power BI, key decisions and actions include:

> [!div class="checklist"]
> - **Verify current state and goals:** Ensure that you have clarity on the current state of DLP for use with Power BI. All goals and requirements for implementing DLP should be clear and actively used to drive the decision-making process.
> - **Make decisions:** Review and discuss all the decisions that are required. This task should occur prior to setting up anything in production.
> - **Review licensing requirements:** Ensure that you understand the product licensing and user licensing requirements. If necessary, procure and assign more licenses.
> - **Publish user documentation:** Publish information that users will need to answer questions and clarify expectations. Provide guidance, communications, and training to your users so they're prepared.
> - **Create DLP policies:** In the Microsoft Purview compliance portal, create and set up each DLP policy. Refer to all the decisions previously made for setting up the DLP rules.
> - **Perform initial testing:** Perform an initial set of tests to verify everything is set up correctly. Use test mode with some sample data to determine whether everything behaves as you'd expect, while minimizing the impact on users. Use a small subset of Premium workspaces initially. Consider using a non-production tenant when you have access to one.
> - **Gather user feedback:** Obtain feedback on the process and user experience. Identify areas of confusion, or unexpected results with sensitive information types, and other technical issues.
> - **Continue iterative releases:** Gradually add more Premium workspaces to the DLP policy until they're all included.
> - **Monitor, tune, and adjust:** Invest resources to review policy match alerts and audit logs on a frequent basis. Investigate false positives and adjust policies when necessary.

> [!TIP]
> These checklist items are summarized for planning purposes. For more details about these checklist items, see the previous sections of this article.

For other steps to take beyond the initial rollout, see [Defender for Cloud Apps with Power BI](powerbi-implementation-planning-defender-for-cloud-apps.md).

## Ongoing monitoring

After you've completed the implementation, you should direct your attention to monitoring, enforcing, and adjusting DLP policies based on their use.

Power BI administrators and security and compliance administrators will need to collaborate from time to time. For Power BI content, there are two audiences for monitoring.

- **Power BI administrators:** An entry in the Power BI activity log is recorded each time there's a DLP rule match. The Power BI activity log entry records details of the DLP event, including user, date and time, item name, workspace, and capacity. It also includes information about the policy, such as the policy name, rule name, severity, and the matched condition.
- **Security and compliance administrators:** The organization's security and compliance administrators will typically use Microsoft Purview reports, alerts, and audit logs.

> [!WARNING]
> Monitoring for DLP for Power BI policies doesn't occur in real time because it takes time for DLP logs and alerts to be generated. If your goal is real-time enforcement, see [Defender for Cloud Apps for Power BI (Real-time policies)](powerbi-implementation-planning-defender-for-cloud-apps.md#real-time-policies).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When monitoring DLP for Power BI, key decisions and actions include:

> [!div class="checklist"]
> - **Verify roles and responsibilities:** Ensure that you're clear on who is responsible for which actions. Educate and communicate with your Power BI administrators or security administrators, if they'll be directly responsible for some aspects of DLP monitoring.
> - **Create or validate your process for reviewing activity:** Make sure that the security and compliance administrators are clear on the expectations for regularly reviewing the activity explorer.
> - **Create or validate your process for resolving alerts:** Ensure that your security and compliance administrators have a process in place to investigate and resolve DLP alerts when a policy match occurs.

> [!TIP]
> For more information about auditing, see [Auditing of information protection and data loss prevention for Power BI](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md).

## Related content

In the [next article in this series](powerbi-implementation-planning-defender-for-cloud-apps.md), learn about using Defender for Cloud Apps with Power BI.
