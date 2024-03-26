---
title: "Power BI implementation planning: Defender for Cloud Apps for Power BI"
description: "Learn about using Defender for Cloud Apps with Power BI."
author: peter-myers
ms.author: v-myerspeter
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 09/15/2022
---

# Power BI implementation planning: Defender for Cloud Apps for Power BI

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article describes the planning activities related to implementing Defender for Cloud Apps as it relates to monitoring Power BI. It's targeted at:

- **Power BI administrators:** The administrators who are responsible for overseeing Power BI in the organization. Power BI administrators need to collaborate with information security and other relevant teams.
- **Center of Excellence, IT, and BI teams:** Others who are responsible for overseeing Power BI in the organization. They might need to collaborate with Power BI administrators, information security teams, and other relevant teams.

> [!IMPORTANT]
> Monitoring and data loss prevention (DLP) is a significant organization-wide undertaking. Its scope and impact are far greater than Power BI alone. These types of initiative require funding, prioritization, and planning. Expect to involve several cross-functional teams in planning, usage, and oversight efforts.

We recommend that you follow a gradual, phased approach to rolling out Defender for Cloud Apps for monitoring Power BI. For a description of the types of rollout phases that you should consider, see [Information protection for Power BI (Rollout phases)](powerbi-implementation-planning-info-protection.md#rollout-phases).

## Purpose of monitoring

[Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps) (formerly known as Microsoft Cloud App Security) is a [Cloud Access Security Broker (CASB)](/defender-cloud-apps/what-is-defender-for-cloud-apps#what-is-a-casb) that supports various deployment modes. It has a broad set of capabilities that extend well beyond the scope of this article. Some capabilities are real-time while others aren't real-time.

Here are some examples of real-time monitoring you can implement.

- **Block downloads from the Power BI service:** You can create a _session policy_ to block certain types of user activities. For example, when a user tries to download a report from the Power BI service that's been assigned a _Highly Restricted_ sensitivity label, the download action can be blocked in real-time.
- **Block access to the Power BI service by an unmanaged device:** You can create an _access policy_ to prevent users from accessing certain applications unless they're using a [managed device](/defender-cloud-apps/proxy-intro-aad#managed-device-identification). For example, when a user tries to access the Power BI service from their personal mobile phone that action can be blocked.

Here are some examples of other capabilities that aren't real time.

- **Detect and alert certain activities in the Power BI service:** You can create an _activity policy_ to generate an alert when certain types of activities occur. For example, when an _administrative activity_ occurs in the Power BI service (indicating that a tenant setting was changed), you can receive an email alert.
- **Monitor advanced security activities:** You can view and monitor sign-ins and security activities, anomalies, and violations. Alerts can be raised for situations such as suspicious activity, unexpected locations, or a new location.
- **Monitor user activities:** You can view and monitor user activities. For example, a Power BI administrator could be assigned permission to view the Power BI activity log, in addition to user sign-in frequency within Defender for Cloud Apps.
- **Detect and alert unusual behavior in the Power BI service:** There are built-in policies for anomaly detection. For example, when a user downloads or exports content from the Power BI service significantly more often than normal patterns, you can receive an email alert.
- **Find unsanctioned applications:** You can find unsanctioned applications in use within the organization. For example, you might become concerned about users sharing files (like Power BI Desktop files or Excel files) on a third-party file sharing system. You can block use of an unsanctioned application, and then contact users to educate them on appropriate ways to share and collaborate with others.

> [!TIP]
> The portal in Defender for Cloud Apps is a convenient place to view activities and alerts without creating a script to extract and download the data. This advantage includes viewing data from the Power BI activity log.

Power BI is one of many applications and services that can be integrated with Defender for Cloud Apps. If you're already using Defender for Cloud Apps for other purposes, it can be used to monitor Power BI too.

Policies created in Defender for Cloud Apps are a form of DLP. The [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md) article covers DLP policies for Power BI that are set up in the Microsoft Purview compliance portal. We recommend that you use DLP policies for Power BI with the capabilities described in this article. Although there's some overlap conceptually, the capabilities are different.

> [!CAUTION]
> This article focuses on capabilities in [Microsoft Defender for Cloud Apps](/defender-cloud-apps/what-is-defender-for-cloud-apps) that can be used to monitor and protect Power BI content. There are many other capabilities in Defender for Cloud Apps that aren't covered in this article. Be sure to work with other stakeholders and system administrators to make decisions that work well for all applications and use cases.

## Prerequisites for Defender for Cloud Apps for Power BI

By now, you should have completed the organization-level planning steps that were described in the [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md) article. Before proceeding, you should have clarity on:

- **Current state:** The [current state](powerbi-implementation-planning-organization-level-info-protection.md#current-state-assessment) of DLP in your organization. You should have an understanding to what extent DLP is already in use, and who's responsible for managing it.
- **Goals and requirements:** The [strategic goals](powerbi-implementation-planning-organization-level-info-protection.md#goals-and-requirements) for implementing DLP in your organization. Understanding the goals and requirements will serve as a guide for your implementation efforts.

Usually, information protection is already implemented before DLP is implemented. If sensitivity labels are published (described in the [Information protection for Power BI](powerbi-implementation-planning-info-protection.md) article), they can be used in certain policies within Defender for Cloud Apps.

You might have already implemented DLP for Power BI (described in the [Data loss prevention for Power BI](powerbi-implementation-planning-data-loss-prevention.md) article). Those DLP capabilities are different to the capabilities that are managed in the Microsoft Purview compliance portal. All DLP capabilities described in this article are managed in the Defender for Cloud Apps portal.

## Key decisions and actions

You'll need to make some key decisions before you're ready to set up policies in Defender for Cloud Apps.

The decisions related to Defender for Cloud Apps policies should directly support the [goals and requirements](powerbi-implementation-planning-organization-level-info-protection.md#goals-and-requirements) for protecting the data that you've previously identified.

### Policy type and activities

You'll need to consider which user activities you're interested in monitoring, blocking, or controlling. The policy type in Defender for Cloud Apps influences:

- What you're able to accomplish.
- Which activities can be included in the configuration.
- Whether the controls will occur in real time or not.

#### Real-time policies

Access policies and session policies created in Defender for Cloud Apps allow you to monitor, block, or control user sessions in real time.

Access policies and session policies allow you to:

- **Programmatically respond in real time:** Detect, inform, and block risky, inadvertent, or inappropriate sharing of sensitive data. These actions allow you to:
  - Improve the overall security setup of your Power BI tenant, with automation and information.
  - Enable analytical use cases that involve sensitive data in a way that can be audited.
- **Provide users with contextual notifications:** This capability allows you to:
  - Help users make the right decisions during their normal workflow.
  - Guide users to follow your [data classification and protection policy](powerbi-implementation-planning-info-protection.md#data-classification-and-protection-policy) without affecting their productivity.

To provide real-time controls, access policies and session policies work with Microsoft Entra ID ([previously known as Azure Active Directory](/azure/active-directory/fundamentals/new-name)), relying on the reverse proxy capabilities of [Conditional Access App Control](/defender-cloud-apps/proxy-intro-aad). Instead of user requests and responses going through the app (the Power BI service in this case), they go through a reverse proxy (Defender for Cloud Apps).

Redirection doesn't affect the user experience. However, the [URL for the Power BI service](/defender-cloud-apps/proxy-intro-aad#how-session-control-works) will change to _https://app.powerbi.com.mcas.ms_ once you've set up Microsoft Entra ID for conditional access app control with Power BI. Also, users will receive a notification when they sign in to the Power BI service that announces that the app is monitored by Defender for Cloud Apps.

> [!IMPORTANT]
> Access policies and session policies operate in real time. Other policy types in Defender for Cloud Apps involve a short delay in alerting. Most other types of DLP and auditing also experience latency, including [DLP for Power BI](/power-bi/enterprise/service-security-dlp-policies-for-power-bi-override) and the [Power BI activity log](/power-bi/enterprise/service-admin-auditing).

##### Access policies

An [access policy](/defender-cloud-apps/access-policy-aad) created in Defender for Cloud Apps controls whether a user is allowed to sign in to a cloud application like the Power BI service. Organizations that are in highly regulated industries will be concerned with access policies.

Here are some examples of how you might use access policies to block access to the Power BI service.

- **Unexpected user:** You can block access for a user who isn't a member of a specific security group. For example, this policy could be helpful when you have an important internal process that tracks approved Power BI users via a specific group.
- **Non-managed device:** You can block access for a personal device that isn't managed by the organization.
- **Updates needed:** You can block access for a user who's using an outdated browser or operating system.
- **Location:** You can block access for a location where you don't have offices or users, or from an unknown IP address.

> [!TIP]
> If you have external users that access your Power BI tenant or employees who travel frequently, that can affect how you define your access control policies. These types of policies are usually managed by IT.

##### Session policies

A [session policy](/defender-cloud-apps/session-policy-aad) is useful when you don't want to allow or block access completely (which can be done with an access policy as [previously described](#access-policies)). Specifically, it allows access for the user while monitoring or limiting what actively occurs during their session.

Here are some examples of ways that you can use session policies to monitor, block, or control user sessions in the Power BI service.

- **Block downloads:** Block downloads and exports when a specific sensitivity label, like _Highly Restricted_, is assigned to the item in the Power BI service.
- **Monitor sign-ins:** Monitor when a user, who meets certain conditions, signs in. For example, the user could be a member of a specific security group or they're using a personal device that isn't managed by the organization.

> [!TIP]
> Creating a session policy (for example, to prevent downloads) for content that's assigned to a particular sensitivity label, like _Highly Restricted_, is one of the most effective use cases for real-time session controls with Power BI.

It's also possible to control file uploads with session policies. However, typically you want to encourage self-service BI users to upload content to the Power BI service (instead of sharing Power BI Desktop files). Therefore, think carefully about blocking file uploads.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning your real-time policies in Defender for Cloud Apps, key decisions and actions include:

> [!div class="checklist"]
> - **Identify use cases to block access:** Compile a list of scenarios for when blocking access to the Power BI service is appropriate.
> - **Identify use cases to monitor sign-ins:** Compile a list of scenarios for when monitoring sign-ins to the Power BI service is appropriate.
> - **Identify use cases to block downloads:** Determine when downloads from the Power BI service should be blocked. Determine which sensitivity labels should be included.

#### Activity policies

[Activity policies](/defender-cloud-apps/user-activity-policies) in Defender for Cloud Apps don't operate in real time.

You can set up an activity policy to check events recorded in the [Power BI activity log](/power-bi/enterprise/service-admin-auditing). The policy can act on a single activity, or it can act on repeated activities by a single user (when a specific activity occurs more than a set number of times within a set number of minutes).

You can use activity policies to monitor activity in the Power BI service in different ways. Here are some examples of what you can achieve.

- **Unauthorized or unexpected user views privileged content:** A user who isn't a member a specific security group (or an external user) has viewed a highly privileged report that's provided to the board of directors.
- **Unauthorized or unexpected user updates tenant settings:** A user who isn't a member a specific security group, like the _Power BI Administrators_ group, has updated the tenant settings in the Power BI service. You can also choose to be notified anytime a tenant setting is updated.
- **Large number of deletes:** A user has deleted more than 20 workspaces or reports in a time period that's less than 10 minutes.
- **Large number of downloads:** A user has downloaded more than 30 reports in a time period that's less than five minutes.

The types of activity policy alerts described in this section are commonly handled by Power BI administrators as part of their oversight of Power BI. When setting up alerts within Defender for Cloud Apps, we recommend that you focus on situations that represent significant risk to the organization. That's because each alert will need to be reviewed and closed by an administrator.

> [!WARNING]
> Because Power BI activity log events aren't available in real-time, they can't be used for real-time monitoring or blocking. You can, however, use operations from the activity log in activity policies. Be sure to work with your information security team to verify what's technically feasible before you get too far into the planning process.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning your activity policies, key decisions and actions include:

> [!div class="checklist"]
> - **Identify use cases for activity monitoring:** Compile a list of specific activities from the Power BI activity log that represent significant risk to the organization. Determine whether the risk relates to a single activity or repeated activities.
> - **Coordinate effort with Power BI administrators:** Discuss the Power BI activities that will be monitored in Defender for Cloud Apps. Ensure that there's not a duplication of effort between different administrators.

### Users impacted

One of the compelling reasons to integrate Power BI with Defender for Cloud Apps is to benefit from real-time controls when users interact with the Power BI service. This type of integration requires [conditional access app control](/azure/active-directory/conditional-access/overview) in Microsoft Entra ID.

Before setting up conditional access app control in Microsoft Entra ID, you'll need to consider which users will be included. Usually, all users are included. However, there might be reasons to exclude specific users.

> [!TIP]
> When setting up the conditional access policy, it's likely that your Microsoft Entra administrator will exclude specific administrator accounts. That approach will prevent locking out administrators. We recommend that the excluded accounts are Microsoft Entra administrators rather than standard Power BI users.

Certain types of policies in Defender for Cloud Apps can apply to certain users and groups. Most often, these types of policies are applicable to all users. However, it's possible that you'll encounter a situation when you'll need to purposefully exclude certain users.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering which users are affected, key decisions and actions include:

> [!div class="checklist"]
> - **Consider which users are included:** Confirm whether all users will be included in your Microsoft Entra Conditional Access app control policy.
> - **Identify which administrator accounts should be excluded:** Determine which specific administrator accounts should be purposefully excluded from the Microsoft Entra Conditional Access app control policy.
> - **Determine whether certain Defender policies apply to subsets of users:** For valid use cases, consider whether they should be applicable to all or some users (when possible).

### User messaging

Having identified use cases, you'll need to consider what should happen when there's user activity that matches the policy.

When an activity is blocked in real time, it's important to provide the user with a customized message. The message is useful when you want to provide more guidance and awareness to your users during their normal workflow. It's more likely that users will read and absorb user notifications when they're:

- **Specific:** Correlating the message to the policy makes it simple to understand.
- **Actionable:** Offering a suggestion for what they need to do, or how to find more information.

Some types of policies in Defender for Cloud Apps can have a customized message. Here are two examples of user notifications.

**Example 1:** You can define a real-time session control policy that prevents all exports and downloads when the sensitivity label for the Power BI item (like a report or semantic model—[previously known as a dataset](../connect-data/service-datasets-rename.md)) is set to _Highly Restricted_. The customized block message in Defender for Cloud Apps reads: _Files with a Highly Restricted label are not permitted to be downloaded from the Power BI service. Please view the content online in the Power BI service. Contact the Power BI support team with any questions._

**Example 2:** You can define a real-time access policy that prevents a user from signing in to the Power BI service when they're not using a machine managed by the organization. The customized block message in Defender for Cloud Apps reads: _The Power BI service might not be accessed on a personal device. Please use the device provided by the organization. Contact the Power BI support team with any questions._

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering user messages in Defender for Cloud Apps, key decisions and actions include:

> [!div class="checklist"]
> - **Decide when a customized block message is needed:** For each policy you intend to create, determine whether a customized block message will be required.
> - **Create customized block messages:** For each policy, define what message should be displayed to users. Plan to relate each message to the policy so that it's specific and actionable.

### Administrator alerting

Alerting is useful when you want to make your security and compliance administrators aware that a policy violation has occurred. When you define policies in Defender for Cloud Apps, consider whether alerts should be generated. For more information, see [alert types](/defender-cloud-apps/managing-alerts#alert-types) in Defender for Cloud Apps.

Optionally, you can set up an alert to send an email to multiple administrators. When an email alert is required, we recommend that you use a mail-enabled security group. For example, you might use a group named _Security and Compliance Admin Alerting_.

For high priority situations, it's possible to send alerts by text message. It's also possible to create custom alert automation and workflows by integrating with [Power Automate](/defender-cloud-apps/flow-integration).

You can set up each alert with a low, medium, or high severity. The severity level is helpful when prioritizing the review of open alerts. An administrator will need to review and action each [alert](/defender-cloud-apps/monitor-alerts#deployment-of-our-enhanced-alert-monitoring-and-management-experience). An alert can be closed as true positive, false positive, or benign.

Here are two examples of administrator alerts.

**Example 1:** You can define a real-time session control policy that prevents all exports and downloads when the sensitivity label for the Power BI item (like a report or semantic model) is set to _Highly Restricted_. It has a helpful customized block message for the user. However, in this situation there isn't a need to generate an alert.

**Example 2:** You can define an activity policy that tracks whether an external user has viewed a highly privileged report that's provided to the board of directors. A high severity alert can be set up to ensure that the activity is promptly investigated.

> [!TIP]
> Example 2 highlights the differences between information protection and security. Its activity policy can help identify scenarios where self-service BI users have permission to manage security for content. Yet these users can take actions that are discouraged by the organizational policy. We recommend that you set up these types of policies only in specific circumstances when the information is especially sensitive.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering alerting for administrators in Defender for Cloud Apps, key decisions and actions include:

> [!div class="checklist"]
> - **Decide when alerts are required:** For each policy you intend to create, decide which situations warrant using alerts.
> - **Clarify roles and responsibilities:** Determine expectations and the action that should be taken when an alert is generated.
> - **Determine who will receive alerts:** Decide which security and compliance administrators will review and action open alerts. Confirm permissions and licensing requirements are met for each administrator who will use Defender for Cloud Apps.
> - **Create a new group:** When necessary, create a new mail-enabled security group to use for email notifications.

### Policy naming convention

Before you create policies in Defender for Cloud Apps, it's a good idea to first create a naming convention. A naming convention is helpful when there are many types of policies for many types of applications. It's also useful when Power BI administrators become involved in monitoring.

> [!TIP]
> Consider granting Defender for Cloud Apps access to your Power BI administrators. Use the [admin role](/fabric/governance/service-security-using-defender-for-cloud-apps-controls#power-bi-admin-role-in-defender-for-cloud-apps), which allows viewing the activity log, sign-in events, and events related to the Power BI service.

Consider a naming convention template that includes component placeholders: \<Application\> - \<Description\> - \<Action\> - \<Type of Policy\>

Here are some naming convention examples.

| **Type of policy** | **Real-time** | **Policy name** |
| --- | --- | --- |
| Session policy | Yes | Power BI - Highly restricted label - Block downloads - RT |
| Access policy | Yes | All - Unmanaged device - Block access - RT |
| Activity policy | No | Power BI - Administrative activity |
| Activity policy | No | Power BI - External user views executive report |

The components of the naming convention include:

- **Application:** The application name. The _Power BI_ prefix helps to group all the Power BI-specific policies together when sorted. However, some policies will apply to all cloud apps rather than just the Power BI service.
- **Description:** The description portion of the name will vary the most. It might include sensitivity labels affected or the type of activity being tracked.
- **Action:** (Optional) In the examples, one session policy has an action of _Block downloads._ Usually, an action is only necessary when it's a real-time policy.
- **Type of policy:** (Optional) In the example, the _RT_ suffix indicates that it's a real-time policy. Designating whether it's real-time or not helps to manage expectations.

There are other attributes that don't need to be included in the policy name. These attributes include the severity level (low, medium, or high), and the category (such as threat detection or DLP). Both attributes can be filtered on the alerts page.

> [!TIP]
> You can rename a policy in Defender for Cloud Apps. However, it's not possible to rename the built-in anomaly detection policies. For example, the _Suspicious Power BI report sharing_ is a built-in policy that can't be renamed.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When considering the policy naming convention, key decisions and actions include:

> [!div class="checklist"]
> - **Choose a naming convention:** Use your first policies to establish a consistent naming convention that's straightfoward to interpret. Focus on using a consistent prefix and suffix.
> - **Document the naming convention:** Provide reference documentation about the policy naming convention. Make sure your system administrators are aware of the naming convention.
> - **Update existing policies:** Update any existing Defender policies to comply with the new naming convention.

## Licensing requirements

Specific licenses must be in place to monitor a Power BI tenant. Administrators must have one of the following [licenses](/fabric/governance/service-security-using-defender-for-cloud-apps-controls#defender-for-cloud-apps-licensing).

- **Microsoft Defender for Cloud Apps:** Provides Defender for Cloud Apps capabilities for all supported applications (including the Power BI service).
- **Office 365 Cloud App Security:** Provides Defender for Cloud Apps capabilities for Office 365 apps that are part of the Office 365 E5 suite (including the Power BI service).

Also, if users need to use real-time access policies or session policies in Defender for Cloud Apps, they will need an [Microsoft Entra ID P1 license](/azure/active-directory/fundamentals/active-directory-whatis#what-are-the-azure-ad-licenses).

>[!TIP]
> If you need clarifications about licensing requirements, talk to your Microsoft account team.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When evaluating licensing requirements, key decisions and actions include:

> [!div class="checklist"]
> - **Review product licensing requirements:** Ensure that you've reviewed all the licensing requirements for working with Defender for Cloud Apps.
> - **Procure additional licenses:** If applicable, purchase more licenses to unlock the functionality that you intend to use.
> - **Assign licenses:** Assign a license to each of your security and compliance administrators who will use Defender for Cloud Apps.

## User documentation and training

Before rolling out Defender for Cloud Apps, we recommend that you create and publish user documentation. A SharePoint page or a wiki page in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) can work well because it will be easy to maintain. A document uploaded to a shared library or Teams site is a good solution, too.

The goal of the documentation is to achieve a seamless user experience. Preparing user documentation will also help you make sure you've considered everything.

Include information about who to contact when users have questions or technical issues.

FAQs and examples are especially helpful for user documentation.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing user documentation and training, key decisions and actions include:

> [!div class="checklist"]
> - **Update documentation for content creators and consumers:** Update your FAQs and examples to include relevant information about policies that users might encounter.
> - **Publish how to get help:** Ensure that your users know how to get help when they're experiencing something unexpected or that they don't understand.
> - **Determine whether specific training is needed:** Create or update your user training to include helpful information, especially if there's a regulatory requirement to do so.

## User support

It's important to verify who will be responsible for [user support](fabric-adoption-roadmap-user-support.md). It's common that using Defender for Cloud Apps to monitor Power BI is done by a centralized IT help desk.

You might need to create documentation for the help desk and conduct some knowledge transfer sessions to ensure the help desk is ready to respond to support requests.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When preparing for the user support function, key decisions and actions include:

> [!div class="checklist"]
> - **Identify who will provide user support:** When you're defining roles and responsibilities, make sure to account for how users will get help with issues that they might encounter.
> - **Ensure the user support team is ready:** Create documentation and conduct knowledge transfer sessions to ensure that the help desk is ready to support these processes.
> - **Communicate between teams:** Discuss messages users might see and the process to resolve open alerts with your Power BI administrators and Center of Excellence. Make sure that everyone involved is prepared for potential questions from Power BI users.

## Implementation summary

After the decisions have been made, and a rollout plan has been prepared, it's time to start the implementation.

If you intend to use real-time policies (session policies or access policies), your first task is to set up Microsoft Entra [conditional access app control](/defender-cloud-apps/proxy-deployment-aad). You'll need to set up the Power BI service as a [catalog app](/defender-cloud-apps/proxy-deployment-aad#to-deploy-catalog-apps) that will be controlled by Defender for Cloud Apps.

When Microsoft Entra Conditional Access app control is set up and tested, you can then create policies in Defender for Cloud Apps.

> [!IMPORTANT]
> We recommend that you introduce this functionality to a small number of test users first. There's also a monitor-only mode that you might find helpful to introduce this functionality in an orderly way.

The following checklist includes a summarized list of the end-to-end implementation steps. Many of the steps have other details that were covered in previous sections of this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When implementing Defender for Cloud Apps with Power BI, key decisions and actions include:

> [!div class="checklist"]
> - **Verify current state and goals:** Ensure that you have clarity on the current state of DLP for use with Power BI. All goals and requirements for implementing DLP should be clear and actively used to drive the decision-making process.
> - **Carry out the decision-making process:** Review and discuss all the decisions that are required. This task should occur prior to setting up anything in production.
> - **Review licensing requirements:** Ensure that you understand the product licensing and user licensing requirements. If necessary, procure and assign more licenses.
> - **Publish user documentation:** Publish information that users will need to answer questions and clarify expectations. Provide guidance, communications, and training to your users so they're prepared.
> - **Create a Microsoft Entra Conditional Access policy:** Create a conditional access policy in Microsoft Entra ID to enable real-time controls for monitoring the Power BI service. At first, enable the Microsoft Entra Conditional Access policy for a few test users.
> - **Set Power BI as a connected app in Defender for Cloud Apps:** Add or verify that Power BI appears as a connected app in Defender for Cloud Apps for conditional access app control.
> - **Perform initial testing:** Sign in to the Power BI service as one of the test users. Verify that access works. Also verify that the message displayed informs you that the Power BI service is monitored by Defender for Cloud Apps.
> - **Create and test a real-time policy:** Using the use cases already compiled, create an access policy or a session policy in Defender for Cloud Apps.
> - **Perform initial testing:** As a test user, perform an action that will trigger the real-time policy. Verify the action is blocked (if appropriate) and that the expected alert messages are displayed.
> - **Gather user feedback:** Obtain feedback on the process and user experience. Identify areas of confusion, unexpected results with sensitive information types, and other technical issues.
> - **Continue iterative releases:** Gradually add more policies in Defender for Cloud Apps until all use cases are addressed.
> - **Review the built-in policies:** Locate the built-in anomaly detection policies in Defender for Cloud Apps (that have Power BI in their name). Update the alert settings for the built-in policies, when necessary.
> - **Proceed with a broader rollout:** Continue to work through your iterative rollout plan. Update the Microsoft Entra Conditional Access policy to apply to a broader set of users, as appropriate. Update individual policies in Defender for Cloud Apps to apply to a broader set of users, as appropriate.
> - **Monitor, tune, and adjust:** Invest resources to review policy match alerts and audit logs on a frequent basis. Investigate any false positives and adjust policies when necessary.

> [!TIP]
> These checklist items are summarized for planning purposes. For more details about these checklist items, see the previous sections of this article.

For more specific information about deploying Power BI as a catalog application in Defender for Cloud Apps, see [the steps to deploy catalog apps](/defender-cloud-apps/proxy-deployment-aad#to-deploy-catalog-apps).

## Ongoing monitoring

After you've completed the implementation, you should direct your attention to monitoring, enforcing, and adjusting Defender for Cloud Apps policies based on their usage.

Power BI administrators and security and compliance administrators will need to collaborate from time to time. For Power BI content, there are two audiences for monitoring.

- **Power BI administrators:** In addition to alerts generated by Defender for Cloud Apps, activities from the Power BI activity log are also displayed in the Defender for Cloud Apps portal.
- **Security and compliance administrators:** The organization's security and compliance administrators will typically use Defender for Cloud Apps alerts.

It's possible to provide your Power BI administrators with a [limited view](/fabric/governance/service-security-using-defender-for-cloud-apps-controls#power-bi-admin-role-in-defender-for-cloud-apps) in Defender for Cloud Apps. It uses a _scoped role_ to view the activity log, sign-in events, and events related to the Power BI service. This capability is a convenience for Power BI administrators.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When monitoring Defender for Cloud Apps, key decisions and actions include:

> [!div class="checklist"]
> - **Verify roles and responsibilities:** Ensure that you're clear on who is responsible for which actions. Educate and communicate with your Power BI administrators if they'll be responsible for any aspect of monitoring.
> - **Manage access for Power BI administrators:** Add your Power BI administrators to the scoped admin role in Defender for Cloud Apps. Communicate with them so they're aware of what they can do with this extra information.
> - **Create or validate your process for reviewing activity:** Make sure your security and compliance administrators are clear on the expectations for regularly reviewing the activity explorer.
> - **Create or validate your process for resolving alerts:** Ensure that your security and compliance administrators have a process in place to investigate and resolve open alerts.

## Related content

In the [next article in this series](powerbi-implementation-planning-auditing-info-protection-data-loss-prevention.md), learn about auditing for information protection and data loss prevention for Power BI.
