---
title: "Power BI adoption roadmap: Mentoring and user enablement"
description: Mentor users to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Mentoring and user enablement

[!INCLUDE [powerbi-adoption-roadmap-context](includes/powerbi-adoption-roadmap-context.md)]

A critical objective for adoption efforts is to enable users to accomplish as much as they can within the requisite guardrails established by [governance guidelines and policies](powerbi-adoption-roadmap-governance.md). For this reason, the act of mentoring users is one of the most important responsibilities of the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md) (COE), and it has a direct influence on how user adoption occurs. For more information about user adoption, see the [Power BI adoption maturity levels](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages) article.

## Skills mentoring

Mentoring and helping users in the Power BI community become more effective can take on various forms, such as:

- Office hours.
- Co-development projects.
- Best practices reviews.
- Extended support.

### Office hours

_Office hours_ are a form of ongoing community engagements managed by the COE. As the name implies, office hours are times of regularly scheduled availability where members of the community can engage with experts from the COE to receive assistance with minimal process overhead. Since office hours are group-based, Power BI champions and other members of the community can also pitch in to help solve an issue if a topic is in their area of expertise.

Office hours are a very popular and productive activity in many organizations. Some organizations call them _drop-in hours_ or even a fun name such as Power Hour. The primary goal is usually to get questions answered and remove blockers. Office hours can also be used as a platform for the user community to share ideas, suggestions, and even complaints.

The COE publishes the times for regular office hours when one or more COE members are available. Ideally, office hours are held on a regular and frequent basis. For instance, it could be every Tuesday and Thursday. Consider offering different time slots or rotating times if you have a global workforce.

> [!TIP]
> One option is to set specific office hours each week. However, people may or may not show up, so that can end up being inefficient. Alternatively, consider leveraging [Microsoft Bookings](https://www.microsoft.com/microsoft-365/business/scheduling-and-booking-app) to schedule office hours. It shows the blocks of time when each COE expert is available, with Outlook integration ensuring availability is up to date.

Office hours are an excellent user enablement approach because:

- Content creators and the COE actively collaborate to answer questions and solve problems together.
- Real work is accomplished while learning and problem solving.
- Others may observe, learn, and participate.
- Individual groups can head to a breakout room to solve a specific problem.

Office hours benefit the COE as well because:

- They're a great way for the COE to identify champions or people with specific skills that the COE didn't previously know about.
- The COE can learn what people throughout the organization are struggling with. It helps inform whether additional resources, documentation, or training might be required.

> [!TIP]
> It's common for some tough issues to come up during office hours that cannot be solved quickly, such as getting a complex DAX calculation to work. Set clear expectations for what's in scope for office hours, and if there's any commitment for follow up.

### Co-development projects

One way the COE can provide mentoring services is during a _co-development project_. A co-development project is a form of assistance offered by the COE where a user or business unit takes advantage of the technical expertise of the COE to solve business problems with data. Co-development involves stakeholders from the business unit and the COE working in partnership to build a high-quality self-service BI solution that the business stakeholders could not deliver independently.

The goal of co-development is to help the business unit develop expertise over time while also delivering value. For example, the sales team has a pressing need to develop a new set of commission reports, but the sales team doesn't yet have the knowledge to complete it on their own.

A co-development project forms a partnership between the business unit and the COE. In this arrangement, the business unit is fully invested, deeply involved, and assumes ownership for the project.

Time involvement from the COE reduces over time until the business unit gains expertise and becomes self-reliant.

:::image type="content" source="media/powerbi-adoption-roadmap-mentoring-and-user-enablement/powerbi-adoption-roadmap-center-of-excellence-mentoring.png" alt-text="Image shows expertise growing in the business unit as C O E involvement decreases over time, and is further described next." border="false":::

The active involvement shown in the above diagram changes over time, as follows:

- **Business unit:** 50% initially, up to 75%, finally at 98%-100%.
- **COE:** 50% initially, down to 25%, finally at 0%-2%.

Ideally, the period for the gradual reduction in involvement is identified up-front in the project. This way, both the business unit and the COE can sufficiently plan the timeline and staffing.

Co-development projects can deliver significant short- and long-term benefits. In the short term, the involvement from the COE can often result in a better-designed and better-performing solution that follows best practices and aligns with organizational standards. In the long term, co-development helps increase the knowledge and capabilities of the business stakeholder, making them more self-sufficient, and more confident to deliver quality self-service BI solutions in the future.

> [!IMPORTANT]
> Essentially, a co-development project helps less experienced users learn the right way to do things. It reduces risk that refactoring might be needed later, and it increases the ability for a solution to scale and grow over time.

### Best practices reviews

The COE may also offer _best practices reviews_. A best practices review can be extremely helpful for content creators who would like to validate their work. They might also be known as _advisory services_, _internal consulting time_, or _technical reviews_.

During a review, an expert from the COE evaluates self-service Power BI content developed by a member of the community and identifies areas of risk or opportunities for improvement. The following bullet list presents some examples of when a best practices review could be beneficial:

- The sales team has an [app](../consumer/end-user-apps.md) that they intend to distribute to thousands of users throughout the organization. Since the app represents high priority content distributed to a large audience, they'd like to have it [certified](../collaborate-share/service-endorsement-overview.md). The standard process to certify content includes a best practices review.
- The finance team would like to [assign a workspace to Premium capacity](../admin/service-admin-premium-manage.md#assign-a-workspace-to-a-capacity). A review of the workspace content is required to ensure sound development practices were followed. This type of review is common when the capacity is shared among multiple business units. (A review may not be required when the capacity is assigned to only one business unit.)
- The operations team is creating a new solution they expect to be widely used. They would like to request a best practices review before it goes into user acceptance testing (UAT), or before a request is submitted to the change management board.

A best practices review is most often focused on the dataset design, though the review can encompass all types of artifacts (dataflows, datasets, reports, or apps).

Before content is deployed to the Power BI service, a best practices review may verify that:

- [Data sources](../connect-data/desktop-data-sources.md) used are appropriate and [query folding](power-query-folding.md) is invoked whenever possible.
- [Connectivity mode](../connect-data/service-dataset-modes-understand.md) and [storage mode](../transform-model/desktop-storage-mode.md) choices (for example, import, live connection, DirectQuery composite model frameworks) are appropriate.
- Location for data sources, like flat files, and original Power BI Desktop files are suitable (preferably stored in a backed-up location with versioning and appropriate security, such as [Teams files or a SharePoint shared library](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes)).
- [Data preparation](../transform-model/desktop-query-overview.md) steps are clean, orderly, and [efficient](power-query-folding.md).
- [Datasets](../connect-data/desktop-data-view.md) are well-designed, clean, and understandable (a [star schema](star-schema.md) design is highly recommended).
- [Relationships](../transform-model/desktop-relationships-understand.md) are configured correctly.
- [DAX calculations](../transform-model/desktop-quickstart-learn-dax-basics.md) use efficient coding practices (particularly if the data model is large).
- The dataset size is within a reasonable limit and [data reduction techniques](import-modeling-data-reduction.md) are applied.
- [Row-level security (RLS)](rls-guidance.md) appropriately enforces data permissions.
- Data is accurate and has been validated against the authoritative source(s).
- Approved common definitions and terminology are used.
- Good [data visualization](https://powerbi.microsoft.com/data-visualization/) practices are followed, including [designing for accessibility](../create-reports/desktop-accessibility-creating-reports.md).

Once the content has been deployed to the Power BI service, the best practices review is not necessarily complete yet. Completing the remainder of the review may also include items such as:

- The target [workspace](../collaborate-share/service-create-the-new-workspaces.md) is suitable for the content.
- [Workspace security roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) are appropriate for the content.
- Other permissions ([app permissions](../collaborate-share/service-create-distribute-apps.md#publish-your-app), [build permission](../connect-data/service-datasets-build-permissions.md), use of the [individual item sharing feature](../collaborate-share/service-share-dashboards.md)) are correctly and appropriately configured.
- [Contacts](../create-reports/service-item-contact.md) are identified, and correctly correlate to the [owners of the content](powerbi-adoption-roadmap-content-ownership-and-management.md).
- [Sensitivity labels](../admin/service-security-apply-data-sensitivity-labels.md) are correctly assigned.
- Artifact [endorsement](../collaborate-share/service-endorse-content.md) (certified or promoted) is appropriate.
- [Data refresh](../connect-data/refresh-data.md) is configured correctly, failure notifications include the proper users, and uses the appropriate [data gateway](/data-integration/gateway/service-gateway-onprem) in standard mode (if applicable).
- All [best practices rules](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance-and-design-v1-1/) are followed and, preferably, are automated via a community tool called Best Practices Analyzer for maximum efficiency and productivity.

### Extended support

From time to time, the COE may get involved with complex issues escalated from the help desk. For more information, see the [User support](powerbi-adoption-roadmap-user-support.md) article.

> [!NOTE]
> Offering mentoring services might be a culture shift for your organization. Your reaction might be that users don't usually ask for help with a tool like Excel, so why would they with Power BI? The answer lies in the fact that Power BI is an extraordinarily powerful tool, providing data preparation and data modeling capabilities in addition to data visualization. The complexity of the tool inherently means that there's a significant learning curve to develop mastery. Having the ability to aid and enable users can significantly improve their skills and increase the quality of their solutions—it reduces risks too.

## Centralized portal

A single centralized portal, or hub, is where the user community can find:

- Access to the community Q&A forum.
- Announcements of interest to the community, such as new features and release plan updates.
- Schedules and registration links for office hours, lunch and learns, training sessions, and user group meetings.
- Announcements of key changes to data artifacts and change log (if appropriate).
- How to request help or support.
- Training materials.
- Documentation, onboarding materials, and frequently asked questions (FAQ).
- Governance guidance and approaches recommended by the COE.
- Templates.
- Recordings of knowledge sharing sessions.
- Entry points for accessing managed processes, such as license acquisition, access requests, and gateway configuration.

> [!TIP]
> In general, only 10%-20% of your community will go out of their way to actively seek out training and educational information. These types of people might naturally evolve to become your Power BI champions. Everyone else is usually just trying to get the job done as quickly as possible because their time, focus, and energy are needed elsewhere. Therefore, it's important to make information easy for your community users to find.

The goal is to consistently direct users in the community to the centralized portal to find information. The corresponding obligation for the COE is to ensure that the information users need is available in the centralized portal. Keeping the portal updated requires discipline when everyone is busy.

In larger organizations, it may be difficult to implement one single centralized portal. When it's not practical to consolidate into a single portal, a centralized hub can serve as an aggregator, which contain links to the other locations.

> [!IMPORTANT]
> Although saving time finding information is important, the goal of a centralized portal is more than that. It's about making information readily available to help your user community do the right thing. They should be able to find information during their normal course of work, with as little friction as possible. Until it's easier to complete a task within the guardrails established by the COE and data governance team, some users will continue to complete their tasks by circumventing policies that are put in place. The recommended path must become the path of least resistance. Having a centralized portal can help achieve this goal.

It takes time for community users to think of the centralized portal as their natural first stop for finding information. It takes consistent redirection to the portal to change habits. Sending someone a link to an original document location in the portal builds better habits than, for instance, including the answer in an email response. It's the same challenge described in the [User support](powerbi-adoption-roadmap-user-support.md#community-documentation) article.

## Training

A key factor for successfully enabling users in a Power BI community is training. It is important that the right training resources are readily available and easily discoverable. While some users are so enthusiastic about Power BI that they'll find information and figure things out on their own, it isn't true for most of the user community.

Making sure your community users have access to the training resources they need to be successful doesn't mean that you need to develop your own training content. Developing training content is often counterproductive due to the rapidly evolving nature of the product. Fortunately, an abundance of training resources are available in the worldwide community. A curated set of links goes a long way to help users organize and focus their training efforts, especially for tool training, which focuses on the technology. All external links should be validated by the COE for accuracy and credibility. It's a key opportunity for the COE to add value because COE stakeholders are in an ideal position to understand the learning needs of the community, and to identify and locate trusted sources of quality learning materials.

You'll find the greatest return on investment with creating custom training materials for _organizational-specific_ processes, while relying on content produced by others for everything else. It's also useful to have a short training class that focuses primarily on topics like how to find documentation, getting help, and interacting with the community.

> [!TIP]
> One of the goals of training is to help people learn new skills while helping them avoid bad habits. It can be a balancing act. For instance, you don't want to overwhelm people by adding in a lot of complexity and friction to a beginner-level class for report creators. However, it's a great investment to make newer content creators aware of things that could otherwise take them a while to figure out. An ideal example is teaching the ability to use a [live connection](../connect-data/desktop-report-lifecycle-datasets.md) to report from an existing dataset. By teaching this concept at the earliest logical time, you can save a less experienced creator thinking they always need one dataset for every report (and encourage the good habit of reusing existing datasets across reports).

Some larger organizations experience continual employee transfers and turnover. Such frequent change results in an increased need for a repeatable set of training resources.

### Training resources and approaches

There are many training approaches because people learn in different ways. If you can monitor and measure usage of your training materials, you'll learn over time what works best. Some training might be delivered more formally, such as classroom training with hands-on labs. Other types of training are less formal, such as:

- Lunch and learn presentations.
- Short how-to videos targeted to a specific goal.
- Curated set of online resources.
- Internal user group presentations.
- One-hour, one-week, or one-month challenges.
- Hackathon-style events.

The advantages of encouraging knowledge sharing among colleagues is described in the [Community of practice](powerbi-adoption-roadmap-community-of-practice.md) article.

> [!TIP]
> Whenever practical, learning should be correlated with building something meaningful and realistic. However, simple demo data does have value during a training course. It allows a learner to focus on how to use the technology rather than the data itself. After completion of introductory session(s), consider offering a _bring your own data_ type of session. These types of sessions encourage the learner to apply their new technical skills to an actual business problem. Try to include multiple facilitators from the COE during this type of follow-up session so questions can be answered quickly.

The types of users you may target for training include:

- Content consumers.
- Report creators.
- Data creators (datasets and dataflows).
- Content owners, subject matter experts, and workspace administrators.
- Satellite COE members and the champions network.
- Power BI administrators.

> [!IMPORTANT]
> Each type of user represents a different audience that has different training needs. The COE will need to identify how best to meet the needs of each audience. For instance, one audience might find a standard introductory Power BI Desktop class overwhelming, whereas another will want more challenging information with depth and detail. If you have a diverse population of Power BI content creators, consider creating personas and tailoring the experience to an extent that's practical.

The completion of training can be a leading indicator for success with [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages). Some organizations grant badges, like _blue belt_ or _black belt_, as people progress through the training programs.

Give some consideration to how you want to handle users at various stages of [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages). Training to onboard new users (sometimes referred to as _training day zero_) and for less experienced users is very different to training for more experienced users.

How the COE invests its time in creating and curating training materials will change over time as adoption and maturity grows. You may also find over time that some community champions want to run their own tailored set of training classes within their functional business unit.

### Sources for trusted Power BI training content

A curated set of online resources is valuable to help community members focus and direct their efforts on what's important. Some publicly available training resources you might find helpful include:

- [Microsoft Learn](/learn/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link).
- [Power BI courses and "in a day" training materials](https://aka.ms/pbitraining).
- [LinkedIn Learning](https://www.linkedin.com/learning/topics/power-bi).
- [Virtual workshops and training](https://www.microsoft.com/store/workshops-training-and-events/#keyword=Power%20BI).

Consider using [Microsoft Viva Learning](https://resources.techcommunity.microsoft.com/viva-learning/), which is integrated into Microsoft Teams. It includes content from sources such as [Microsoft Learn](/learn/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link) and [LinkedIn Learning](https://www.linkedin.com/learning/topics/power-bi). Custom content produced by your organization can be included as well.

In addition to Microsoft content and custom content produced by your organization, you may choose to provide your user community with a curated set of recommended links to trusted online sources. There is a wide array of videos, blogs, and articles produced by the worldwide community. The community comprises Power BI experts, [Microsoft Most Valued Professions (MVPs)](https://mvp.microsoft.com/), and enthusiasts. Providing a curated learning path that contains specific, reputable, current, and high quality resources will provide the most value to your user community.

If you do make the investment to create custom in-house training, consider creating short, targeted content that focuses on solving one specific problem. It makes the training easier to find and consume. It's also easier to maintain and update over time.

> [!TIP]
> The **Help and Support** menu in the Power BI service is customizable. Once your centralized location for training documentation is operational, update the [tenant setting in the admin portal](admin-tenant-settings.md#publish-get-help-information) with the link. The link can then be accessed from menu when users select the **Get Help** option. Also, be sure to teach users about the **Help** ribbon tab in Power BI Desktop. It includes links to guided learning, training videos, documentation, and more.

## Documentation

Concise, well-written documentation can be a significant help for users trying to get things done. Your needs for documentation, and how it's delivered, will depend on how Power BI is managed in your organization. For more information, see the [Content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article.

Certain aspects of Power BI tend to be managed by a centralized team, such as the COE. The following types of documentation are helpful in these situations:

- How to request a Power BI license (and whether there are requirements for manager approval).
- How to request a new Premium capacity.
- How to request a new workspace.
- How to request a workspace be added to Premium capacity.
- How to request access to a gateway data source.
- How to request software installation.

> [!TIP]
> For certain activities that are repeated over and over, consider automating them using Power Apps and Power Automate. In this case, your documentation will also include how to access and use the Power Platform functionality.

Other aspects of Power BI can be managed by self-service users, decentralized teams, or by a centralized team. The following types of documentation might differ based on who owns and manages the content:

- How to request a new report.
- How to request a report enhancement.
- How to request access to a dataset.
- How to request a dataset enhancement.

> [!TIP]
> When planning for a centralized portal, as described earlier in this article, plan how to handle situations when guidance or governance policies need to be customized for one or more business units.

There are also going to be some [governance](powerbi-adoption-roadmap-governance.md) decisions that have been made and should be documented, such as:

- How to request content be certified.
- What are the approved file storage locations.
- What are the data retention and purge requirements.
- What are the requirements for handling sensitive data and personally identifiable information (PII).

Documentation should be located in your centralized portal, which is a searchable location where, preferably, users already work. Either [Teams or SharePoint](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes) work very well. Creating documentation in either wiki pages or in documents can work equally well, provided that the content is organized well and is easy to find. Shorter documents that focus on one topic are usually easier to consume than long, comprehensive documents.

> [!IMPORTANT]
> One of the most helpful pieces of documentation you can publish for the community is a description of the [tenant settings](admin-tenant-settings.md), and the group memberships required for each tenant setting. Users read about features and functionality online, and sometimes find that it doesn't work for them. When they are able to quickly look up your organization's tenant settings, it can save them from becoming frustrated and attempting workarounds. Effective documentation can reduce the number of help desk tickets that are submitted. It can also reduce the number of people who need to be assigned the Power BI administrator role (who might have this role solely for the purpose of viewing settings).

Over time, you may choose to allow some documentation to be maintained by the community if you have willing volunteers. In this case, you may want to introduce an approval process for changes.

When you see questions repeatedly arise in the Q&A forum (as described in the [User support](powerbi-adoption-roadmap-user-support.md) article), during office hours, or during lunch and learns, it's a great indicator that creating new documentation may be appropriate. When the documentation exists, it allows colleagues to reference it when needed. It contributes to user enablement and a self-sustaining community.

> [!TIP]
> When creating custom documentation or training materials, reference existing Microsoft sites using links when possible. Since Power BI is in a continual state of evolution, it will reduce the level of documentation maintenance needed over time.

## Templates

A [Power BI template](../create-reports/desktop-templates.md) is a _.pbit_ file. It can be provided as a starting point for content creators. It's the same as a _.pbix_ file, which can contain queries, a data model, and a report, but with one exception: the template file doesn't contain any data. Therefore, it's a smaller file that can be shared with the community, and it doesn't present a risk of inappropriately sharing data.

Providing Power BI template files for your community is a great way to:

- Promote consistency.
- Reduce learning curve.
- Show good examples and best practices.
- Increase efficiency.

Power BI template files can improve efficiency and help people learn during the normal course of their work. A few ways that template files are helpful include:

- Reports can use examples of good visualization practices.
- Reports can incorporate organizational branding and design standards.
- Datasets can include the structure for commonly used tables, like a date table.
- Helpful DAX calculations can be included, like a year-over-year (YoY) calculation.
- Common parameters can be included, like a data source connection string.
- An example of report and/or dataset documentation can be included.

> [!NOTE]
> Providing templates not only saves your content creators time, it also helps them move quickly beyond a blank page in an empty solution.

## Considerations and key actions

Considerations and key actions you can take to establish, or improve, mentoring and user enablement:

- Establish regular office hours, ideally at least once per week (depending on demand from users as well as staffing and scheduling constraints).
- Decide how you will communicate and advertise office hours to the user community.
- Decide what the expectations will be for office hours, including allowed topics or types of issues users can bring, how the queue of requests will work, if any information should be submitted ahead of time, and whether any follow up afterwards can be expected.
- Beyond office hours, consider what other types of mentoring services the COE could offer, such as co-development projects or best practices reviews.
- Create a centralized portal to serve as the hub for Power BI training, documentation, and resources. The centralized portal should also provide links to other community resources such as the Q&A forum and how to find help.
- Compile a curated list of reputable training resources that target the training needs and interests of your user community. Post the list in the centralized portal and create a schedule to review and validate the list.
- Consider what custom in-house training resources will be useful and worth the time investment.
- Create and promote a top 3-5 list of documentation and resources that will be most useful to the user community.

## Maturity levels

The following maturity levels will help you assess the current state of your mentoring and user enablement:

| **Level** | **State of Power BI mentoring and user enablement** |
| --- | --- |
| 100: Initial | Some documentation and resources exist, though they are siloed and inconsistent.</br></br>Few users are aware of, or take advantage of, available resources. |
| 200: Repeatable | A centralized portal exists with a library of training, documentation, and resources.</br></br>Office hours are held on a regular basis. |
| 300: Defined | The centralized portal is the primary hub for community members to locate information.</br></br>The COE's skills mentoring program is in place to assist users in the community in various ways. |
| 400: Capable | Resources in the centralized portal are commonly referenced by champions and community members when supporting and learning from each other.</br></br>Business units regularly engage with the COE and take advantage of its skills mentoring program. Tangible business value is gained from the program. |
| 500: Efficient | Documentation and resources are continually updated and improved by the COE, based on lessons learned. |

## Next steps

In the [next article](powerbi-adoption-roadmap-community-of-practice.md) in the Power BI adoption roadmap series, learn more about the community of practice.
