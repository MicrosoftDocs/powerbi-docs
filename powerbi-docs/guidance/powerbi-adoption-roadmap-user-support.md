---
title: "Power BI adoption roadmap: User support"
description: Support users to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: User support

This article addresses user support and is focused primarily on the resolution of issues.

See the [mentoring and user enablement](powerbi-adoption-roadmap-mentoring-and-user-enablement.md) article for a discussion about related topics including skills mentoring, training, documentation, and co-development assistance provided to the internal Power BI user community. The effectiveness of those activities can significantly reduce the volume of formal user support requests and increase user experience overall.

The first sections of this article focus on user support aspects you have control over internally within your organization. The final topics focus on external resources that are available.

## Types of user support

If a user has an issue, do they know what their options are to resolve it? Following are some common types of user support that organizations employ successfully:

:::image type="content" source="media/powerbi-adoption-roadmap-user-support/powerbi-adoption-roadmap-user-support.png" alt-text="Image shows the four types of internal Power B I user support, and the two types of external support, which are described in the table below.":::

The six types of user support shown in the above graphic include:

| **Item** | **Description** |
| --- | --- |
| ![Item 1.](media/common/icon-01-red-30x30.png) | **Intra-team support (internal):** Intra-team support is very informal. Intra-team support occurs when team members learn from each other during the natural course of their job. |
| ![Item 2.](media/common/icon-02-red-30x30.png) | **Internal community support (internal):** The internal community can be organized informally, or formally, or both. This occurs when colleagues interact with each other via internal community channels. |
| ![Item 3.](media/common/icon-03-red-30x30.png) | **Help desk support (internal):** The help desk handles formal support issues and requests. |
| ![Item 4.](media/common/icon-04-red-30x30.png) | **Extended support (internal):** Extended support involves handling complex issues escalated from the help desk. |
| ![Item 5.](media/common/icon-05-red-30x30.png) | **Microsoft support (external):** In addition to publicly available documentation, support from Microsoft is available to licensed users and administrators. |
| ![Item 6.](media/common/icon-06-red-30x30.png) | **Community support (external):** The worldwide community includes Power BI experts, MVPs, and enthusiasts who participate in forums and publish content. |

In some organizations, intra-team and internal community support are most relevant for self-service BI (i.e., content which is owned and managed by creators and owners in the decentralized business units). Conversely, the help desk and extended support are reserved for technical issues and enterprise BI (i.e., content which is owned and managed by a centralized business intelligence team or Center of Excellence). In other organizations, all four types of support could be relevant for any type of content.

Each of the four types of internal user support shown above are discussed in further detail in the remainder of this article.

## Intra-team support

Intra-team support refers to when team members learn from and help each other during their daily work. The people who emerge as your [Power BI champions](powerbi-adoption-roadmap-community-of-practice.md#champions-network) tend to take on this type of informal support role voluntarily because they have an intrinsic desire to help.

Although this is an informal support mode, it should not be undervalued. Some estimates indicate that a large percentage of learning at work is peer learning, which is particularly helpful for analysts who are creating a domain-specific Power BI solution.

> [!NOTE]
> Intra-team support does not work well for individuals who are, for instance, the only data analyst within a department. It's also not effective for people who don't have very many connections yet in their organization. When there are not close colleagues to depend on, the other types of support discussed in this article become more important.

## Internal community support

Assistance from your fellow community members often takes the form of messages in a discussion channel or forum set up specifically for this purpose. For example, someone posts a message that they're having problems getting a DAX calculation to work and receives a response with suggestions or links from others in the organization.

> [!TIP]
> The goal of an internal Power BI community is for it to be self-sustaining, which can reduce formal support demands and costs. It also facilitates managed self-service BI occurring at a broader scale versus a purely centralized BI approach. However, there will always be a need to monitor, manage, and nurture the internal community. Two specific tips:
>
> - Be sure to cultivate multiple experts in the more difficult concepts like [Data Analysis eXpressions (DAX)](../transform-model/desktop-quickstart-learn-dax-basics.md) and the [Power Query M formula language](/powerquery-m/quick-tour-of-the-power-query-m-formula-language). When someone becomes known as an expert, they may get overburdened with too many requests for help.
> - A greater number of community members may readily answer certain types of questions (for instance, report visualizations) whereas a smaller number of members will answer others (for example, complex DAX). It's important for the COE to allow the community a chance to respond yet also be willing to promptly handle unanswered questions. If users repeatedly ask questions and don't receive an answer, that will significantly hinder growth of the community. A user is likely to leave and never return after their second question doesn't receive a response.

An internal community discussion channel is commonly set up as a Teams channel or a Yammer group. The technology chosen should reflect where users already work commonly, so that the activities occur within their natural workflow.

One benefit of an internal discussion channel is that responses can come from people that the original requester has never even met before. In larger organizations where everyone doesn't know each other, a [community of practice](powerbi-adoption-roadmap-community-of-practice.md) that brings people together based on a common interest (Power BI in this case) can offer diverse perspectives for getting help and learning in general.

Use of an internal community discussion channel allows the Center of Excellence (COE) to monitor what kind of questions people are posting. This is one way the COE can understand what kind of issues users are experiencing (commonly related to content creation but could also be related to consuming content). Monitoring the discussion channel can also reveal additional Power BI experts and potential champions who were previously unknown to the COE.

> [!IMPORTANT]
> It's a best practice to continually identify emerging Power BI champions, and engage with them to make sure they're equipped to support their colleagues. As discussed in the [community of practice](powerbi-adoption-roadmap-community-of-practice.md) article, the COE should actively monitor the discussion channel to see who is being helpful, deliberately encourage and support them, and as appropriate invite them into the champions network to make the recognition more formal.

Another key benefit of a discussion channel is that it's searchable, which allows the information to reach additional people at another time. It is, however, a habit change for people to ask questions in an open forum rather than private messages or email. Be aware that some individuals will not be comfortable asking questions in such a "public" way because it openly acknowledges what they don't know which is embarrassing. This reluctance can be reduced over time by having a friendly, encouraging, and helpful discussion channel. However, it will always be present to a certain extent.

> [!TIP]
> You may be tempted to create a bot to handle some of the most common, straightforward questions from the community. This can work for uncomplicated questions such as "how do I request a Power BI license" or "how do I request a workspace?" Before taking that approach, consider if there are enough routine and predictable questions like that to make the user experience better rather than worse. Often, a well-created FAQ (frequently asked questions) works better, is faster to develop, and is easier to maintain.

## Help desk support

The help desk is usually operated as a shared service, usually operated from within the IT department. People who will likely rely on a more formal support channel include those who are:

- Less experienced with Power BI
- Newer to the organization
- Reluctant to post a message in the internal discussion community
- Lacking connections and colleagues within the organization

There are also certain technical issues which cannot be fully resolved without IT involvement (for instance, software installation and upgrade requests when machines are IT-managed).

Busy help desk personnel are usually dedicated to supporting multiple technologies. For this reason, the easiest types of issues to support are those which have a clear resolution and can be documented in a knowledgebase (for example, software installation prerequisites). Some organizations have the help desk handle only very simple break-fix issues, whereas other organizations have the help desk get involved with anything that is repeatable (for example, handling new [workspace](../collaborate-share/service-create-the-new-workspaces.md) requests, managing [gateway data sources](/power-platform/admin/onpremises-data-gateway-source-management#add-new-data-source), or requesting new [Premium capacity](../admin/service-premium-what-is.md)).

> [!IMPORTANT]
> Your Power BI governance decisions will directly impact the volume of help desk requests. One example: if you choose to limit [workspace creation permissions in the tenant settings](admin-tenant-settings.md#create-workspaces), that will result in users needing to submit a ticket. That's a legitimate decision to make. However, you must be prepared to satisfy the request very quickly: within 1-4 hours if possible. Automation with Power Apps and Power Automate can help make the process efficient. If you have too much of a delay, users will use what they already have which may not be the ideal scenario. Promptness is critical for certain help desk requests.

Over time, troubleshooting and problem resolution skills become more effective as help desk personnel expand their knowledgebase and experience with Power BI. The best help desk personnel are those who have a good grasp of what users are trying to accomplish with Power BI.

> [!TIP]
> Purely technical issues (ex: [data refresh](../connect-data/refresh-data.md) failure for a critical dataset, or the need to [add a new user for a gateway data source](/power-platform/admin/onpremises-data-gateway-source-management#manage-users)) are usually straightforward for determining response times associated with a service level agreement. For instance, there may be an agreement to respond within 1 hour and resolve within 8 hours for issues which are blocking worker productivity. It is generally more difficult to define service level agreements for troubleshooting issues (ex: data discrepancies).

## Extended support

Since the Center of Excellence (COE) has deep insight into how Power BI is used throughout the organization, they are a great option for extended support when a complex issue arises. Involvement of the COE in the support process is intended to be an escalation path.

Managing requests as purely an escalation path from the help desk gets difficult to enforce since COE personnel are often well-known to business users through their other training and mentoring efforts. To build the habit of going through the proper channels, COE personnel should redirect users to submit a ticket. This will also improve the data quality for analyzing help desk tickets submitted.

## Microsoft support

In addition to the internal user support approaches discussed in this article, there are valuable [external support options](../admin/service-support-options.md) directly available to Power BI users and administrators which shouldn't be overlooked.

### Microsoft documentation

The [Power BI support site](https://powerbi.microsoft.com/support/) lists high-priority issues which broadly affect all customers. Global Microsoft 365 (M365) administrators have access to additional support issue details within the M365 portal.

The [Microsoft 365 Twitter account](https://twitter.com/MSFT365Status) posts very timely information and updates about outages for all Microsoft 365 services.

Checking the [Power BI documentation](../index.yml) is an authoritative resource when troubleshooting and searching for information. You can prioritize results from the Power BI documentation site. For example, type "power bi dataset site:docs.microsoft.com" in your favorite web browser.

### Power BI Pro and Premium Per User end-user support

Users with a Power BI Pro or Premium Per User license are eligible to [log a support ticket with Microsoft](https://powerbi.microsoft.com/support/pro/).

> [!TIP]
> Make it clear to your internal user community if you prefer for technical issues to be reported to the internal help desk. If your help desk is equipped to handle the workload, having a centralized internal area to collect user issues can provide a superior user experience versus every user trying to get issues resolved on their own. Having visibility into a consolidated view of issues is also helpful for the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md).

### Administrator support

There are several support options available for [global and Power BI administrators](../admin/service-support-options.md#get-started-with-support-for-admins).

For customers who have a [Microsoft Unified Support](https://www.microsoft.com/msservices/unified-support-solutions) contract, consider providing your help desk and COE personnel access to the [Microsoft Services Hub](https://serviceshub.microsoft.com/home). One advantage of the Microsoft Services Hub is that your help desk and COE personnel could be granted permission to [submit and view support requests](/services-hub/getting-started/roles-permissions#support-contact-permissions).

## Worldwide community support

In addition to the internal user support approaches discussed in this article, and Microsoft support discussed previously, you can leverage the worldwide Power BI community. This option is useful when a question can be asked that can be easily understood by someone not close to the problem, and when it doesn't involve sensitive data.

### Publicly available community forums

There are several [public Power BI community forums](https://community.powerbi.com/t5/Forums/ct-p/PBI_Comm_Forums) where users can post an issue and get responses from any Power BI user in the world. This can be very powerful and exceedingly helpful. However, as is the case with any public forum, it's important to validate the advice and information posted on the forum.

### Publicly available discussion areas

It's very common to see people posting Power BI technical questions on platforms like Twitter. A quick look at the [#PowerBI hashtag](https://twitter.com/search?q=%23PowerBI&amp;f=live) and you'll see that a vibrant global community of Power BI enthusiasts have discussions, post announcements, and help each other every day. The [#PowerBIHelp hashtag](https://twitter.com/search?q=%23PowerBIHelp&amp;f=live) is used sometimes as well, though a little less commonly.

### Community documentation

The Power BI global community is vibrant. There are a great many blog posts, articles, webinars, and videos about Power BI released every single day. When relying on community information for troubleshooting, watch out for:

- How recent the information is
- If the situation and context of the solution found online fits your circumstance
- The credibility of the information being presented

## Considerations and key actions

Considerations and key actions you can take to improve your intra-team support:

- Provide recognition and encouragement to your Power BI champions, as well as incentives, as discussed in the [community of practice](powerbi-adoption-roadmap-community-of-practice.md) article.
- Reward and praise meaningful grassroots efforts that you see happening.
- If informal intra-team efforts aren't adequate, consider formalizing the roles you want to enact in this area, and the expected contributions and responsibilities.

Considerations and key actions you can take to improve your internal community support:

- Encourage people to ask a question in the designated community discussion channel. As the habit builds over time, it will become normalized to use that as the first option. Over time, it will evolve to become more self-supporting.
- Ensure that the appropriate team members from the COE are actively monitoring this discussion channel. They can step in if a question is unanswered, improve upon an answer, or even make a correction to an existing answer when appropriate. They can also post links to additional information, raising awareness of existing resources in the process. Although the goal of the community is for it to be self-supporting, it still requires dedicated resources to nurture it and monitor it, including ensuring that questions don't remain unanswered.
- Make sure your user population knows the internal community support area exists. This could include prominent links where users typically work or including a link in regular communications. You can also [customize the help menu links](admin-tenant-settings.md#publish-get-help-information) in the Power BI service to direct users to your internal resources.
- Set up automation to ensure that all your Free, Pro, and Premium Per User licensed users automatically have access to the community discussion channel. One option for automating this is with [group-based licensing](/azure/active-directory/enterprise-users/licensing-groups-assign).

Considerations and key actions you can take to improve your internal help desk support:

- Determine the initial scope of Power BI topics which the help desk will handle.
- Assess the readiness level of your help desk to handle Power BI support.
- Arrange for additional training for help desk staff, based on readiness gaps.
- Determine what the escalation path will be for requests the help desk cannot directly handle.
- Update the help desk knowledgebase for the known Power BI topics. Ensure someone is responsible for regular updates to the knowledgebase to account for new and enhanced Power BI features over time.
- Ensure there is a good issue tracking system in place. This is frequently a ticketing system which can manage priority levels.
- Decide if anyone will be on-call for anything related to Power BI. Ensure the exact expectations for 24/7 support are clear.
- Determine what service level agreements (SLAs) will exist, and that the expectations for response and resolution are clearly communicated.
- Be prepared to address certain common issues extremely quickly. For instance, a request to add a new [gateway data source](/power-platform/admin/onpremises-data-gateway-source-management#add-new-data-source) should be handled very quickly (to avoid user frustration, and to minimize use of personal gateways as an alternative). When support represents a significant delay, users will work around it to keep moving.

Considerations and key actions you can take to improve your internal COE extended support:

- Clearly define where help desk responsibilities end, and the COE extended support responsibilities begin.
- Ensure that COE personnel have a direct escalation path to reach global administrators for Microsoft 365 and Azure. This is critical when a widespread issue is involved that's beyond the scope of Power BI.
- Create a feedback loop from the COE back to the help desk so that documentation can be continually refined. This allows the primary help desk personnel to become more equipped for handling more issues over time.
- Create a feedback loop from the help desk to the COE. When support personnel observe redundancies or inefficiencies, they can communicate that information to the COE, who might choose to improve the documentation or get involved (particularly if it relates to governance or security).

## Maturity levels

The following maturity levels will help you assess the current state of your Power BI user support:

| **Level** | **State of Power BI user support** |
| --- | --- |
| 100: Initial | Individual business units have found effective ways of supporting each other, though tactics are siloed and not consistently applied.</br></br>An internal discussion channel is available, but it's not monitored closely so the user experience is inconsistent. |
| 200: Repeatable | The importance of intra-team support is encouraged and actively supported by the COE, including direct support of the champions network.</br></br>The internal discussion channel is gaining traction as the default place for Power BI Q&amp;A.</br></br>The help desk can handle a small number of the most common Power BI technical support issues. |
| 300: Defined | The internal discussion channel has become popular and is largely self-sustaining. It is actively monitored and managed by the COE to ensure questions are answered timely and correctly.</br></br>The help desk is fully prepared to handle all known and expected Power BI technical support issues, and the COE provides appropriate extended support when required. |
| 400: Capable | A recognition program is established and use of it is a common occurrence to generate enthusiasm and share best practices.</br></br>Service level agreements are in place to ensure expectations for help desk support, including extended support, are clear among everyone involved. |
| 500: Efficient | Bidirectional feedback loops exist between the help desk and the COE.</br></br>Key performance indicators are defined and actively measured for community engagement and satisfaction.</br></br>Automation is in place when it adds direct value to the user experience (ex: automatic access to the community), or for certain help desk activities (ex: use of APIs and scripts to increase speed and reduce error). |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-system-oversight.md), learn about system oversight and administration activities.
