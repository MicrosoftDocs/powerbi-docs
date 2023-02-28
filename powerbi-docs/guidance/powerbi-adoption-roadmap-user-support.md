---
title: "Power BI adoption roadmap: User support"
description: Support users to drive strong and successful adoption of Power BI.
author: davidiseminger
ms.author: davidi
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 10/31/2022
---

# Power BI adoption roadmap: User support

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

This article addresses user support. It focuses primarily on the resolution of issues.

The first sections of this article focus on user support aspects you have control over internally within your organization. The final topics focus on external resources that are available.

For a description of related topics, including skills mentoring, training, documentation, and co-development assistance provided to the internal Power BI user community, see the [Mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article. The effectiveness of those activities can significantly reduce the volume of formal user support requests and increase user experience overall.

## Types of user support

If a user has an issue, do they know what their options are to resolve it?

The following diagram shows some common types of user support that organizations employ successfully:

:::image type="content" source="media/powerbi-adoption-roadmap-user-support/powerbi-adoption-roadmap-user-support.png" alt-text="Image shows the four types of internal Power BI user support, and the two types of external support, which are described in the table below." border="false":::

The six types of user support shown in the above diagram include:

| **Type** | **Description** |
| --- | --- |
| ![Type 1.](media/common/icon-01-red-30x30.png) | **Intra-team support (internal)** is very informal. Support occurs when team members learn from each other during the natural course of their job. |
| ![Type 2.](media/common/icon-02-red-30x30.png) | **Internal community support (internal)** can be organized informally, formally, or both. It occurs when colleagues interact with each other via internal community channels. |
| ![Type 3.](media/common/icon-03-red-30x30.png) | **Help desk support (internal)** handles formal support issues and requests. |
| ![Type 4.](media/common/icon-04-red-30x30.png) | **Extended support (internal)** involves handling complex issues escalated by the help desk. |
| ![Type 5.](media/common/icon-05-red-30x30.png) | **Microsoft support (external)** includes support for licensed users and administrators. It also includes [comprehensive Power BI documentation](/power-bi/index). |
| ![Type 6.](media/common/icon-06-red-30x30.png) | **Community support (external)** includes the worldwide community of Power BI experts, [Microsoft Most Valued Professionals (MVPs)](https://mvp.microsoft.com/), and enthusiasts who participate in forums and publish content. |

In some organizations, intra-team and internal community support are most relevant for self-service BI (content is owned and managed by creators and owners in decentralized business units). Conversely, the help desk and extended support are reserved for technical issues and enterprise BI (content is owned and managed by a centralized business intelligence team or Center of Excellence). In some organizations, all four types of support could be relevant for any type of content.

> [!TIP]
> For more information about business-led self-service BI, managed self-service BI, and enterprise BI concepts, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article.

Each of the four types of internal user support introduced above are described in further detail in this article.

## Intra-team support

*Intra-team support* refers to when team members learn from and help each other during their daily work. People who emerge as your [Power BI champions](powerbi-adoption-roadmap-community-of-practice.md#champions-network) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help. Although it's an informal support mode, it shouldn't be undervalued. Some estimates indicate that a large percentage of learning at work is peer learning, which is particularly helpful for analysts who are creating domain-specific Power BI solutions.

> [!NOTE]
> Intra-team support does not work well for individuals who are the only data analyst within a department. It's also not effective for those who don't have very many connections yet in their organization. When there aren't any close colleagues to depend on, other types of support, as described in this article, become more important.

## Internal community support

Assistance from your fellow community members often takes the form of messages in a discussion channel or a forum set up specifically for the Power BI community of practice. For example, someone posts a message that they're having problems getting a DAX calculation to work. They then receive a response from someone in the organization with suggestions or links.

> [!TIP]
> The goal of an internal Power BI community is to be self-sustaining, which can lead to reduced formal support demands and costs. It can also facilitate managed self-service BI occurring at a broader scale versus a purely centralized BI approach. However, there will always be a need to monitor, manage, and nurture the internal community. Here are two specific tips:
>
> - Be sure to cultivate multiple experts in the more difficult topics like [Data Analysis eXpressions (DAX)](/power-bi/transform-model/desktop-quickstart-learn-dax-basics) and the [Power Query M formula language](/powerquery-m/quick-tour-of-the-power-query-m-formula-language). When someone becomes a recognized expert, they may become overburdened with too many requests for help.
> - A greater number of community members may readily answer certain types of questions (for example, report visualizations), whereas a smaller number of members will answer others (for example, complex DAX). It's important for the COE to allow the community a chance to respond yet also be willing to promptly handle unanswered questions. If users repeatedly ask questions and don't receive an answer, it will significantly hinder growth of the community. In this case, a user is likely to leave and never return if they don't receive any responses to their questions.

An internal community discussion channel is commonly set up as a Teams channel or a Yammer group. The technology chosen should reflect where users already work, so that the activities occur within their natural workflow.

One benefit of an internal discussion channel is that responses can come from people that the original requester has never met before. In larger organizations, a [community of practice](powerbi-adoption-roadmap-community-of-practice.md) brings people together based on a common interest. It can offer diverse perspectives for getting help and learning in general.

Use of an internal community discussion channel allows the [Center of Excellence (COE)](powerbi-adoption-roadmap-center-of-excellence.md) to monitor the kind of questions people are asking. It's one way the COE can understand the issues users are experiencing (commonly related to content creation, but it could also be related to consuming content).

Monitoring the discussion channel can also reveal additional Power BI experts and potential champions who were previously unknown to the COE.

> [!IMPORTANT]
> It's a best practice to continually identify emerging Power BI champions, and to engage with them to make sure they're equipped to support their colleagues. As described in the [Community of practice](powerbi-adoption-roadmap-community-of-practice.md) article, the COE should actively monitor the discussion channel to see who is being helpful. The COE should deliberately encourage and support community members. When appropriate, invite them into the champions network.

Another key benefit of a discussion channel is that it's searchable, which allows other people to discover the information. It is, however, a change of habit for people to ask questions in an open forum rather than private messages or email. Be sensitive to the fact that some individuals aren't comfortable asking questions in such a public way. It openly acknowledges what they don't know, which might be embarrassing. This reluctance may reduce over time by promoting a friendly, encouraging, and helpful discussion channel.

> [!TIP]
> You may be tempted to create a bot to handle some of the most common, straightforward questions from the community. A bot can work for uncomplicated questions such as "How do I request a Power BI license?" or "How do I request a workspace?" Before taking this approach, consider if there are enough routine and predictable questions that would make the user experience better rather than worse. Often, a well-created FAQ (frequently asked questions) works better, and it's faster to develop and easier to maintain.

## Help desk support

The help desk is usually operated as a shared service, staffed by the IT department. Users who will likely rely on a more formal support channel include those who are:

- Less experienced with Power BI.
- Newer to the organization.
- Reluctant to post a message to the internal discussion community.
- Lacking connections and colleagues within the organization.

There are also certain technical issues that can't be fully resolved without IT involvement, like software installation and upgrade requests when machines are IT-managed.

Busy help desk personnel are usually dedicated to supporting multiple technologies. For this reason, the easiest types of issues to support are those which have a clear resolution and can be documented in a knowledgebase. For instance, software installation prerequisites or requirements to get a license.

Some organizations ask the help desk to handle only very simple break-fix issues. Other organizations have the help desk get involved with anything that is repeatable, like new [workspace](/power-bi/collaborate-share/service-create-the-new-workspaces) requests, managing [gateway data sources](/power-platform/admin/onpremises-data-gateway-source-management#add-new-data-source), or requesting a new [Premium capacity](/power-bi/enterprise/service-premium-what-is).

> [!IMPORTANT]
> Your Power BI governance decisions will directly impact the volume of help desk requests. For example, if you choose to limit [workspace creation permissions in the tenant settings](/power-bi/admin/service-admin-portal-workspace), it will result in users submitting help desk tickets. While it's a legitimate decision to make, you must be prepared to satisfy the request very quickly. Respond to this type of request within 1-4 hours, if possible. If you delay too long, users will use what they already have or fine a way to work around your requirements. That may not be the ideal scenario. Promptness is critical for certain help desk requests. Consider that automation by using [Power Apps](/power-apps/powerapps-overview) and [Power Automate](/power-automate/getting-started) can help make some processes more efficient.

Over time, troubleshooting and problem resolution skills become more effective as help desk personnel expand their knowledgebase and experience with Power BI. The best help desk personnel are those who have a good grasp of what users need to accomplish with Power BI.

> [!TIP]
> Purely technical issues, for example [data refresh](/power-bi/connect-data/refresh-data) failure or the need to [add a new user to a gateway data source](/power-platform/admin/onpremises-data-gateway-source-management#manage-users), usually involve straightforward responses associated with a service level agreement. For instance, there may be an agreement to respond to blocking issues within one hour and resolve them within eight hours. It's generally more difficult to define service level agreements (SLAs) for troubleshooting issues, like data discrepancies.

## Extended support

Since the COE has deep insight into how Power BI is used throughout the organization, they're a great option for extended support should a complex issue arise. Involving the COE in the support process should be by an escalation path.

Managing requests as purely an escalation path from the help desk gets difficult to enforce since COE members are often well-known to business users. To encourage the habit of going through the proper channels, COE members should redirect users to submit a help desk ticket. It will also improve the data quality for analyzing help desk requests.

## Microsoft support

In addition to the internal user support approaches discussed in this article, there are valuable [external support options](/power-bi/support/service-support-options) directly available to Power BI users and administrators that shouldn't be overlooked.

### Microsoft documentation

Check the [Power BI support site](https://powerbi.microsoft.com/support/) high-priority issues that broadly affect all customers. Global Microsoft 365 administrators have access to additional support issue details within the Microsoft 365 portal.

Monitor the [Microsoft 365 Twitter account](https://twitter.com/MSFT365Status). Microsoft posts timely information and updates about outages for all Microsoft 365 services.

Refer to the comprehensive [Power BI documentation](/power-bi/index). It's an authoritative resource that can aid troubleshooting and search for information. You can prioritize results from the Power BI documentation site. For example, enter a site-targeted search request into your web search engine, like `power bi dataset site:learn.microsoft.com`.

### Power BI Pro and Premium Per User end-user support

Users with a Power BI Pro or Premium Per User license are eligible to [log a support ticket with Microsoft](https://powerbi.microsoft.com/support/pro/).

> [!TIP]
> Make it clear to your internal user community whether you prefer technical issues be reported to the internal help desk. If your help desk is equipped to handle the workload, having a centralized internal area collect user issues can provide a superior user experience versus every user trying to resolve issues on their own. Having visibility and analyzing support issues is also helpful for the [COE](powerbi-adoption-roadmap-center-of-excellence.md).

### Administrator support

There are several support options available for [global and Power BI administrators](/power-bi/support/service-support-options#get-started-with-support-for-admins).

For customers who have a [Microsoft Unified Support](https://www.microsoft.com/en-us/msservices/unified-support-solutions) contract, consider granting help desk and COE members access to the [Microsoft Services Hub](https://serviceshub.microsoft.com/home). One advantage of the Microsoft Services Hub is that your help desk and COE members can be set up to [submit and view support requests](/services-hub/getting-started/roles-permissions#support-contact-permissions).

## Worldwide community support

In addition to the internal user support approaches discussed in this article, and Microsoft support options discussed previously, you can leverage the worldwide Power BI community.

The worldwide community is useful when a question can be easily understood by someone not close to the problem, and when it doesn't involve confidential data or sensitive internal processes.

### Publicly available community forums

There are several [public Power BI community forums](https://community.powerbi.com/t5/Forums/ct-p/PBI_Comm_Forums) where users can post issues and receive responses from any Power BI user in the world. Getting answers from anyone, anywhere, can be very powerful and exceedingly helpful. However, as is the case with any public forum, it's important to validate the advice and information posted on the forum. The advice posted on the internet may not be suitable for your situation.

### Publicly available discussion areas

It's very common to see people posting Power BI technical questions on platforms like Twitter. A quick look at the [`#PowerBI` hashtag](https://twitter.com/search?q=%23PowerBI&amp;f=live) reveals a vibrant global community of Power BI enthusiasts. You'll find discussions, post announcements, and users helping each other. The [`#PowerBIHelp` hashtag](https://twitter.com/search?q=%23PowerBIHelp&amp;f=live) is sometimes used, though less frequently.

### Community documentation

The Power BI global community is vibrant. Every day, there are a great number of Power BI blog posts, articles, webinars, and videos published. When relying on community information for troubleshooting, watch out for:

- How recent the information is. Try to verify when it was published or last updated.
- Whether the situation and context of the solution found online truly fits your circumstance.
- The credibility of the information being presented. Rely on reputable blogs and sites.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.png" border="false":::

**Checklist** - Considerations and key actions you can take for user support follow.

**Improve your intra-team support:**

> [!div class="checklist"]
> - **Provide recognition and encouragement:** Provide incentives to your Power BI champions as described in the [Community of practice](powerbi-adoption-roadmap-community-of-practice.md#champions-network) article.
> - **Reward efforts:** Recognize and praise meaningful grassroots efforts when you see them happening.
> - **Create formal roles:** If informal intra-team efforts aren't adequate, consider formalizing the roles you want to enact in this area. Include the expected contributions and responsibilities in the HR job description, when appropriate.

**Improve your internal community support:**

> [!div class="checklist"]
> - **Continually encourage questions:** Encourage users to ask questions in the designated community discussion channel. As the habit builds over time, it will become normalized to use that as the first option. Over time, it will evolve to become more self-supporting.
> - **Actively monitor the discussion area:** Ensure that the appropriate COE members actively monitor this discussion channel. They can step in if a question remains unanswered, improve upon answers, or make corrections when appropriate. They can also post links to additional information to raise awareness of existing resources. Although the goal of the community is to become self-supporting, it still requires dedicated resources to monitor and nurture it.
> - **Communicate options available:** Make sure your user population knows the internal community support area exists. It could include the prominent display of links. You can include a link in regular communications to your user community. You can also [customize the help menu links](/power-bi/admin/service-admin-portal-help-support#publish-get-help-information) in the Power BI service to direct users to your internal resources.
> - **Set up automation:** Ensure that all your Free, Power BI Pro, and Premium Per User licensed users automatically have access to the community discussion channel. It's possible to automate license setup using [group-based licensing](/azure/active-directory/enterprise-users/licensing-groups-assign).

**Improve your internal help desk support:**

> [!div class="checklist"]
> - **Determine help desk responsibilities:** Decide what the initial scope of Power BI topics that the help desk will handle.
> - **Assess the readiness level:** Determine whether your help desk is prepared to handle Power BI support. Identify whether there are readiness gaps to be addressed.
> - **Arrange for additional training:** Conduct knowledge transfer sessions or training sessions to prepare the help desk staff.
> - **Update the help desk knowledgebase:** include known Power BI questions and answers in a searchable knowledgebase. Ensure someone is responsible for regular updates to the knowledgebase to reflect new and enhanced features over time.
> - **Set up a ticket tracking system:** Ensure a good system is in place to track requests submitted to the help desk.
> - **Decide if anyone will be on-call for any issues related to Power BI:** If appropriate, ensure the expectations for 24/7 support are clear.
> - **Determine what SLAs will exist:** When a specific service level agreement (SLA) exists, ensure that expectations for response and resolution are clearly documented and communicated.
> - **Be prepared to act quickly:** Be prepared to address specific common issues extremely quickly. Slow support response will result in users finding workarounds.

**Improve your internal COE extended support:**

> [!div class="checklist"]
> - **Determine how escalated support will work:** Decide what the escalation path will be for requests the help desk cannot directly handle. Ensure that the COE (or equivalent personnel) is prepared to step in when needed. Clearly define where help desk responsibilities end, and where COE extended support responsibilities begin.
> - **Encourage collaboration between COE and system administrators:** Ensure that COE members have a direct escalation path to reach global administrators for Microsoft 365 and Azure. It's critical to have a communication channel when a widespread issue arises that's beyond the scope of Power BI.
> - **Create a feedback loop from the COE back to the help desk:** When the COE learns of new information, the IT knowledgebase should be updated. The goal is for the primary help desk personnel to continually become better equipped at handling more issues in the future.
> - **Create a feedback loop from the help desk to the COE:** When support personnel observe redundancies or inefficiencies, they can communicate that information to the COE, who might choose to improve the knowledgebase or get involved (particularly if it relates to governance or security).

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.png" border="false":::

The following maturity levels will help you assess the current state of your Power BI user support.

| **Level** | **State of Power BI user support** |
| --- | --- |
| 100: Initial | Individual business units find effective ways of supporting each other. However, the tactics and practices are siloed and not consistently applied. </br></br>An internal discussion channel is available. However, it's not monitored closely. Therefore, the user experience is inconsistent. |
| 200: Repeatable | The COE actively encourages intra-team support and growth of the champions network. </br></br>The internal discussion channel gains traction. It becomes known as the default place for Power BI questions and discussions. </br></br>The help desk handles a small number of the most common Power BI technical support issues. |
| 300: Defined | The internal discussion channel is popular and largely self-sustaining. The COE actively monitors and manages the discussion channel to ensure that all questions are answered quickly and correctly. </br></br>A help desk tracking system is in place to monitor support frequency, response topics, and priorities. </br></br>The COE provides appropriate extended support when required. |
| 400: Capable | The help desk is fully trained and prepared to handle a broader number of known and expected Power BI technical support issues. </br></br>SLAs are in place to define help desk support expectations, including extended support. The expectations are documented and communicated so they're clear to everyone involved. |
| 500: Efficient | Bidirectional feedback loops exist between the help desk and the COE. </br></br>Key performance indicators measure satisfaction and support methods. </br></br>Automation is in place to allow the help desk to react faster and reduce errors (for example, use of APIs and scripts). |

## Next steps

In the [next article](powerbi-adoption-roadmap-system-oversight.md) in the Power BI adoption roadmap series, learn about system oversight and administration activities.
