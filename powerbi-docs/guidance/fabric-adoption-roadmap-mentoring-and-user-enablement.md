---
title: "Microsoft Fabric adoption roadmap: Mentoring and user enablement"
description: "Mentor users to drive strong and successful adoption of Microsoft Fabric."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: fabric
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 11/06/2023
---

# Microsoft Fabric adoption roadmap: Mentoring and user enablement

[!INCLUDE [fabric-adoption-roadmap-context](includes/fabric-adoption-roadmap-context.md)]

A critical objective for adoption efforts is to enable users to accomplish as much as they can within the requisite guardrails established by [governance guidelines and policies](fabric-adoption-roadmap-governance.md). For this reason, the act of mentoring users is one of the most important responsibilities of the [Center of Excellence](fabric-adoption-roadmap-center-of-excellence.md) (COE), and it has a direct influence on how user adoption occurs. For more information about user adoption, see [Microsoft Fabric adoption maturity levels](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages).

## Skills mentoring

Mentoring and helping users in the Fabric community become more effective can take on various forms, such as:

- [Office hours](fabric-adoption-roadmap-mentoring-and-user-enablement.md#office-hours)
- [Co-development projects](fabric-adoption-roadmap-mentoring-and-user-enablement.md#co-development-projects)
- [Best practices reviews](fabric-adoption-roadmap-mentoring-and-user-enablement.md#best-practices-reviews)
- [Extended support](fabric-adoption-roadmap-mentoring-and-user-enablement.md#extended-support)

### Office hours

_Office hours_ are a form of ongoing community engagements managed by the COE. As the name implies, office hours are times of regularly scheduled availability where members of the community can engage with experts from the COE to receive assistance with minimal process overhead. Office hours are usually group-based, so Fabric champions and other members of the community can also help solve an issue if a topic is in their area of expertise.

Office hours are a very popular and productive activity in many organizations. Some organizations call them _drop-in hours_ or even a fun name such as _Power Hour_ or _Fabric Fridays_. The primary goal is usually to get questions answered, solve problems, and remove blockers. Office hours can also be used as a platform for the user community to share ideas, suggestions, and even complaints.

The COE publishes the times for regular office hours when one or more COE members are available. Ideally, office hours are held on a regular and frequent basis. For instance, it could be every Tuesday and Thursday. Consider offering different time slots or rotating times if you have a global workforce.

> [!TIP]
> One option is to set specific office hours each week. However, users might not show up, so that can end up being inefficient. Alternatively, consider leveraging [Microsoft Bookings](https://www.microsoft.com/microsoft-365/business/scheduling-and-booking-app) to schedule office hours. It shows the blocks of time when each COE expert is available, with Outlook integration ensuring availability is up to date.

Office hours are an excellent user enablement approach because:

- Content creators and the COE actively collaborate to answer questions and solve problems together.
- Real work is accomplished while learning and problem solving.
- Others might observe, learn, and participate.
- Individual groups can head to a breakout room to solve a specific problem.

Office hours benefit the COE as well because:

- They're a great way for the COE to identify champions or users with specific skills that the COE didn't previously know about.
- The COE can learn what users throughout the organization are struggling with. It helps inform whether additional resources, documentation, or training might be required.

> [!TIP]
> It's common for some tough issues to come up during office hours that cannot be solved quickly, such as getting a complex DAX calculation to work, or addressing performance challenges in a complex solution. Set clear expectations for what's in scope for office hours, and if there's any commitment for follow up.

### Co-development projects

One way the COE can provide mentoring services is during a _co-development project_. A co-development project is a form of assistance offered by the COE where a user or business unit takes advantage of the technical expertise of the COE to solve business problems with data. Co-development involves stakeholders from the business unit and the COE working in partnership to build a high-quality self-service analytics or business intelligence (BI) solution that the business stakeholders couldn't deliver independently.

The goal of co-development is to help the business unit develop expertise over time while also delivering value. For example, the sales team has a pressing need to develop a new set of commission reports, but the sales team doesn't yet have the knowledge to complete it on their own.

A co-development project forms a partnership between the business unit and the COE. In this arrangement, the business unit is fully invested, deeply involved, and assumes ownership of the project.

Time involvement from the COE reduces over time until the business unit gains expertise and becomes self-reliant.

:::image type="content" source="media/fabric-adoption-roadmap-mentoring-and-user-enablement/center-of-excellence-mentoring.svg" alt-text="Diagram shows expertise growing in the business unit as Center of Excellence involvement decreases over time, which is described below." border="false":::

The active involvement shown in the above diagram changes over time, as follows:

- **Business unit:** 50% initially, up to 75%, finally at 98%-100%.
- **COE:** 50% initially, down to 25%, finally at 0%-2%.

Ideally, the period for the gradual reduction in involvement is identified up-front in the project. This way, both the business unit and the COE can sufficiently plan the timeline and staffing.

Co-development projects can deliver significant short- and long-term benefits. In the short term, the involvement from the COE can often result in a better-designed and better-performing solution that follows best practices and aligns with organizational standards. In the long term, co-development helps increase the knowledge and capabilities of the business stakeholder, making them more self-sufficient, and more confident to deliver quality self-service data and BI solutions in the future.

> [!IMPORTANT]
> Essentially, a co-development project helps less experienced users learn the right way to do things. It reduces the risk that refactoring might be needed later, and it increases the ability for a solution to scale and grow over time.

### Best practices reviews

The COE could also offer _best practices reviews_. A best practices review can be extremely helpful for content creators who would like to validate their work. They might also be known as _advisory services_, _internal consulting time_, or _technical reviews_. Unlike a co-development project (described previously), a best practices review occurs after the solution has been developed.

During a review, an expert from the COE evaluates self-service Fabric content developed by a member of the community and identifies areas of risk or opportunities for improvement.

Here are some examples of when a best practices review could be beneficial.

- The sales team has a [Power BI app](/power-bi/consumer/end-user-apps) that they intend to distribute to thousands of users throughout the organization. Since the app represents high priority content distributed to a large audience, they'd like to have it [certified](/power-bi/collaborate-share/service-endorsement-overview). The standard process to certify content includes a best practices review.
- The finance team would like to [assign a workspace to a capacity](/power-bi/enterprise/service-admin-premium-manage#assign-a-workspace-to-a-capacity). A review of the workspace content is required to ensure sound development practices are followed. This type of review is common when the capacity is shared among multiple business units. (A review might not be required when the capacity is assigned to only one business unit.)
- The operations team is creating a new Fabric solution they expect to be widely used. They would like to request a best practices review before it goes into user acceptance testing (UAT), or before a request is submitted to the change management board.

A best practices review is most often focused on the semantic model ([previously known as a dataset](/power-bi/connect-data/service-datasets-rename)) design, though the review can encompass all types of data items (such as a lakehouse, data warehouse, data pipeline, dataflow, or semantic model). The review can also encompass reporting items (such as reports, dashboards, or metrics).

Before content is deployed, a best practices review can be used to verify other design decisions, like:

- Code in notebooks follows organizational standards and best practices.
- The appropriate data preparation approach (dataflows, pipelines, notebooks, and others) are used where needed.
- [Data sources](/power-bi/connect-data/desktop-data-sources) used are appropriate and [query folding](power-query-folding.md) is invoked whenever possible where Power Query and dataflows are used.
- [Data preparation](/power-bi/transform-model/desktop-query-overview) steps are clean, orderly, and [efficient](power-query-folding.md).
- [Connectivity mode](/power-bi/connect-data/service-dataset-modes-understand) and [storage mode](/power-bi/transform-model/desktop-storage-mode) choices (for example, Direct Lake, import, live connection, DirectQuery, and composite model frameworks) are appropriate.
- Location for data sources, like flat files, and original Power BI Desktop files are suitable (preferably stored in a backed-up location with versioning and appropriate security, such as [Teams files or a SharePoint shared library](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes)).
- [Semantic models](/power-bi/connect-data/desktop-data-view) are well-designed, clean, and understandable, and use a [star schema](star-schema.md) design.
- [Relationships](/power-bi/transform-model/desktop-relationships-understand) are configured correctly.
- [DAX calculations](/power-bi/transform-model/desktop-quickstart-learn-dax-basics) use efficient coding practices (particularly if the data model is large).
- The semantic model size is within a reasonable limit and [data reduction techniques](import-modeling-data-reduction.md) are applied.
- [Row-level security (RLS)](rls-guidance.md) appropriately enforces data permissions.
- Data is accurate and has been validated against the authoritative source(s).
- Approved common definitions and terminology are used.
- Good [data visualization](https://powerbi.microsoft.com/data-visualization/) practices are followed, including [designing for accessibility](/power-bi/create-reports/desktop-accessibility-creating-reports).

Once the content has been deployed, the best practices review isn't necessarily complete yet. Completing the remainder of the review could also include items such as:

- The target [workspace](/fabric/get-started/workspaces) is suitable for the content.
- [Workspace security roles](/power-bi/collaborate-share/service-roles-new-workspaces) are appropriate for the content.
- Other permissions (such as [app audience permissions](/power-bi/collaborate-share/service-create-distribute-apps#create-and-manage-audiences), [Build permission](/power-bi/connect-data/service-datasets-build-permissions), or use of the [individual item sharing feature](/power-bi/collaborate-share/service-share-dashboards)) are correctly and appropriately configured.
- [Contacts](/power-bi/create-reports/service-item-contact) are identified, and correctly correlate to the [owners of the content](fabric-adoption-roadmap-content-ownership-and-management.md).
- [Sensitivity labels](/power-bi/enterprise/service-security-apply-data-sensitivity-labels) are correctly assigned.
- Fabric item [endorsement](/power-bi/collaborate-share/service-endorse-content) (certified or promoted) is appropriate.
- [Data refresh](/power-bi/connect-data/refresh-data) is configured correctly, failure notifications include the proper users, and uses the appropriate [data gateway](/data-integration/gateway/service-gateway-onprem) in standard mode (if applicable).
- All appropriate semantic model [best practices rules](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance-and-design-v1-1/) are followed and, preferably, are automated via a community tool called Best Practices Analyzer for maximum efficiency and productivity.

### Extended support

From time to time, the COE might get involved with complex issues escalated from the help desk. For more information, see the [User support](fabric-adoption-roadmap-user-support.md) article.

> [!NOTE]
> Offering mentoring services might be a culture shift for your organization. Your reaction might be that users don't usually ask for help with a tool like Excel, so why would they with Power BI? The answer lies in the fact that Power BI and Fabric are extraordinarily powerful tools. They provide data preparation and data modeling capabilities in addition to data visualization. Having the ability to aid and enable users can significantly improve their skills and increase the quality of their solutions—it reduces risks too.

## Centralized portal

A single centralized portal, or hub, is where the user community can find:

- Access to the community Q&A forum.
- Announcements of interest to the community, such as new features and release plan updates.
- Schedules and registration links for office hours, lunch and learns, training sessions, and user group meetings.
- Announcements of key changes to content and change log (if appropriate).
- How to request help or support.
- Training materials.
- Documentation, onboarding materials, and frequently asked questions (FAQ).
- Governance guidance and approaches recommended by the COE.
- Report templates.
- Examples of best practices solutions.
- Recordings of knowledge sharing sessions.
- Entry points for accessing managed processes, such as license acquisition, access requests, and gateway configuration.

> [!TIP]
> In general, only 10%-20% of your community will go out of their way to actively seek out training and educational information. These types of users might naturally evolve to become your [champions](fabric-adoption-roadmap-community-of-practice.md#champions-network). Everyone else is usually just trying to get the job done as quickly as possible, because their time, focus, and energy are needed elsewhere. Therefore, it's crucial to make information easy for your community users to find.

The goal is to consistently direct users in the community to the centralized portal to find information. The corresponding obligation for the COE is to ensure that the information users need is available in the centralized portal. Keeping the portal updated requires discipline when everyone is busy.

In larger organizations, it can be difficult to implement one single centralized portal. When it's not practical to consolidate into a single portal, a centralized hub can serve as an aggregator, which contains links to the other locations.

> [!IMPORTANT]
> Although saving time finding information is important, the goal of a centralized portal is more than that. It's about making information readily available to help your user community do the right thing. They should be able to find information during their normal course of work, with as little friction as possible. Until it's easier to complete a task within the guardrails established by the COE and data governance team, some users will continue to complete their tasks by circumventing policies that are put in place. The recommended path must become the path of least resistance. Having a centralized portal can help achieve this goal.

It takes time for community users to think of the centralized portal as their natural first stop for finding information. It takes consistent redirection to the portal to change habits. Sending someone a link to an original document location in the portal builds better habits than, for instance, including the answer in an email response. It's the same challenge described in the [User support](fabric-adoption-roadmap-user-support.md#community-documentation) article.

## Training

A key factor for successfully enabling self-service users in a Fabric community is training. It's important that the right training resources are readily available and easily discoverable. While some users are so enthusiastic about analytics that they'll find information and figure things out on their own, it isn't true for most of the user community.

Making sure your self-service users (particularly content creators and owners) have access to the training resources they need to be successful doesn't mean that you need to develop your own training content. Developing training content is often counterproductive due to the rapidly evolving nature of the product. Fortunately, an abundance of training resources is available in the worldwide community. A curated set of links goes a long way to help users organize and focus their training efforts, especially for tool training, which focuses on the technology. All external links should be validated by the COE for accuracy and credibility. It's a key opportunity for the COE to add value because COE stakeholders are in an ideal position to understand the learning needs of the community, and to identify and locate trusted sources of quality learning materials.

You'll find the greatest return on investment with creating custom training materials for _organizational-specific_ processes, while relying on content produced by others for everything else. It's also useful to have a short training class that focuses primarily on topics like how to find documentation, getting help, and interacting with the community.

> [!TIP]
> One of the goals of training is to help users learn new skills while helping them avoid bad habits. It can be a balancing act. For instance, you don't want to overwhelm new users by adding in a lot of complexity and friction to a beginner-level class for report creators. However, it's a great investment to make newer content creators aware of things that could otherwise take them a while to figure out. An ideal example is teaching the ability to use a [live connection](/power-bi/connect-data/desktop-report-lifecycle-datasets) to report from an existing semantic model. By teaching this concept at the earliest logical time, you can save a less experienced creator thinking they always need one semantic model for every report (and encourage the good habit of reusing existing semantic models across reports).

Some larger organizations experience continual employee transfers and turnover. Such frequent change results in an increased need for a repeatable set of training resources.

### Training resources and approaches

There are many training approaches because people learn in different ways. If you can monitor and measure usage of your training materials, you'll learn over time what works best.

Some training might be delivered more formally, such as classroom training with hands-on labs. Other types of training are less formal, such as:

- Lunch and learn presentations
- Short how-to videos targeted to a specific goal
- Curated set of online resources
- Internal user group presentations
- One-hour, one-week, or one-month challenges
- Hackathon-style events

The advantages of encouraging knowledge sharing among colleagues are described in the [Community of practice](fabric-adoption-roadmap-community-of-practice.md) article.

> [!TIP]
> Whenever practical, learning should be correlated with building something meaningful and realistic. However, simple demo data does have value during a training course. It allows a learner to focus on how to use the technology rather than the data itself. After completion of introductory session(s), consider offering a _bring your own data_ type of session. These types of sessions encourage the learner to apply their new technical skills to an actual business problem. Try to include multiple facilitators from the COE during this type of follow-up session so questions can be answered quickly.

The types of users you might target for training include:

- Content owners, subject matter experts (SMEs), and workspace administrators
- Data creators (for example, users who create semantic models for report creators to use, or who create dataflows, lakehouses, or warehouses for other semantic model creators to use)
- Report creators
- Content consumers and viewers
- Satellite COE members and the [champions network](fabric-adoption-roadmap-community-of-practice.md#champions-network)
- [Fabric administrators](/fabric/admin/microsoft-fabric-admin)

> [!IMPORTANT]
> Each type of user represents a different audience that has different training needs. The COE will need to identify how best to meet the needs of each audience. For instance, one audience might find a standard introductory Power BI Desktop class overwhelming, whereas another will want more challenging information with depth and detail for end-to-end solutions that include multiple Fabric workloads. If you have a diverse population of Fabric content creators, consider creating personas and tailoring the experience to an extent that's practical.

The completion of training can be a leading indicator for success with [user adoption](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages). Some organizations add an element of fun by granting badges, like _blue belt_ or _black belt_, as users progress through the training programs.

Give some consideration to how you want to handle users at various stages of [user adoption](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages). Training needs are very different for:

- Onboarding new users (sometimes referred to as _training day zero_).
- Users with minimal experience.
- More experienced users.

How the COE invests its time in creating and curating training materials will change over time as adoption and maturity grows. You might also find over time that some community champions want to run their own tailored set of training classes within their functional business unit.

### Sources for trusted Fabric training content

A curated set of online resources is valuable to help community members focus and direct their efforts on what's important. Some publicly available training resources you might find helpful include:

- [Microsoft Learn training for Power BI](/training/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link)
- [Microsoft Learn training for Fabric](/training/paths/get-started-fabric/)
- [Power BI courses and "in a day" training materials](https://aka.ms/pbitraining)
- [LinkedIn Learning for Power BI](https://www.linkedin.com/learning/topics/power-bi)
- [LinkedIn Learning for Fabric](https://www.linkedin.com/learning/topics/microsoft-fabric)

Consider using [Microsoft Viva Learning](https://www.microsoft.com/microsoft-viva/learning), which is integrated into Microsoft Teams. It includes content from sources such as [Microsoft Learn](/training/powerplatform/power-bi?WT.mc_id=powerbi_landingpage-docs-link) and [LinkedIn Learning](https://www.linkedin.com/learning/topics/power-bi). Custom content produced by your organization can be included as well.

In addition to Microsoft content and custom content produced by your organization, you might choose to provide your user community with a curated set of recommended links to trusted online sources. There's a wide array of videos, blogs, and articles produced by the worldwide community. The community comprises Fabric and Power BI experts, [Microsoft Most Valued Professions (MVPs)](https://mvp.microsoft.com/), and enthusiasts. Providing a curated learning path that contains specific, reputable, current, and high-quality resources will provide the most value to your user community.

If you do make the investment to create custom in-house training, consider creating short, targeted content that focuses on solving one specific problem. It makes the training easier to find and consume. It's also easier to maintain and update over time.

> [!TIP]
> The _Help and Support_ menu in the Fabric portal is customizable. When your centralized location for training documentation is operational, update the [tenant setting in the Admin portal](/fabric/admin/service-admin-portal-help-support) with the link. The link can then be accessed from menu when users select the _Get Help_ option. Also, be sure to teach users about the _Help_ ribbon tab in Power BI Desktop. It includes links to guided learning, training videos, documentation, and more.

## Documentation

Concise, well-written documentation can be a significant help for users trying to get things done. Your needs for documentation, and how it's delivered, will depend on how Fabric is managed in your organization. For more information, see the [Content ownership and management](fabric-adoption-roadmap-content-ownership-and-management.md) article.

Certain aspects of Fabric tend to be managed by a centralized team, such as the COE. The following types of documentation are helpful in these situations:

- How to request a Power BI license (and whether there are requirements for manager approval)
- How to request a new capacity
- How to request a new workspace
- How to request a workspace be added to an existing capacity
- How to request access to a gateway data source
- How to request software installation

> [!TIP]
> For certain activities that are repeated over and over, consider automating them using Power Apps and Power Automate. In this case, your documentation will also include how to access and use the Power Platform functionality.

Different aspects of your documentation can be managed by self-service users, decentralized teams, or by a centralized team. The following types of documentation might differ based on who owns and manages the content:

- How to request a new report
- How to request a report enhancement
- How to request access to data
- How to request new data be prepared and made available for use
- How to request an enhancement to existing data or visualizations

> [!TIP]
> When planning for a centralized portal, as described earlier in this article, plan how to handle situations when guidance or governance policies need to be customized for one or more business units.

There are also going to be some [governance](fabric-adoption-roadmap-governance.md) decisions that have been made and should be documented, such as:

- How to request content be certified
- What are the approved file storage locations
- What are the data retention and purge requirements
- What are the requirements for handling sensitive data and personally identifiable information (PII)

Documentation should be located in your centralized portal, which is a searchable location where, preferably, users already work. Either [Teams or SharePoint](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes) work very well. Creating documentation in either wiki pages or in documents can work equally well, provided that the content is organized well and is easy to find. Shorter documents that focus on one topic are usually easier to consume than long, comprehensive documents.

> [!IMPORTANT]
> One of the most helpful pieces of documentation you can publish for the community is a description of the [tenant settings](/power-bi/admin/service-admin-portal-about-tenant-settings), and the group memberships required for each tenant setting. Users read about features and functionality online, and sometimes find that it doesn't work for them. When they are able to quickly look up your organization's tenant settings, it can save them from becoming frustrated and attempting workarounds. Effective documentation can reduce the number of help desk tickets that are submitted. It can also reduce the number of people who need to be assigned the Fabric administrator role (who might have this role solely for the purpose of viewing settings).

Over time, you might choose to allow certain types of documentation to be maintained by the community if you have willing volunteers. In this case, you might want to introduce an approval process for changes.

When you see questions repeatedly arise in the Q&A forum (as described in the [User support](fabric-adoption-roadmap-user-support.md) article), during office hours, or during lunch and learns, it's a great indicator that creating new documentation might be appropriate. When the documentation exists, it allows colleagues to reference it when needed. Documentation contributes to user enablement and a self-sustaining community.

> [!TIP]
> When creating custom documentation or training materials, reference existing Microsoft sites using links whenever possible. Most community bloggers don't keep blog posts or videos up to date.

## Power BI template files

A [Power BI template](/power-bi/create-reports/desktop-templates) is a .pbit file. It can be provided as a starting point for content creators. It's the same as a .pbix file, which can contain queries, a data model, and a report, but with one exception: the template file doesn't contain any data. Therefore, it's a smaller file that can be shared with content creators and owners, and it doesn't present a risk of inappropriately sharing data.

Providing Power BI template files for your community is a great way to:

- Promote consistency.
- Reduce learning curve.
- Show good examples and best practices.
- Increase efficiency.

Power BI template files can improve efficiency and help people learn during the normal course of their work. A few ways that template files are helpful include:

- Reports can use examples of good visualization practices
- Reports can incorporate organizational branding and design standards
- Semantic models can include the structure for commonly used tables, like a date table
- Helpful DAX calculations can be included, like a year-over-year (YoY) calculation
- Common parameters can be included, like a data source connection string
- An example of report and/or semantic model documentation can be included

> [!NOTE]
> Providing templates not only saves your content creators time, it also helps them move quickly beyond a blank page in an empty solution.

## Power BI project files

A [Power BI project](/power-bi/developer/projects/projects-overview) is a .pbip file. Like a template file (previously described), a project file doesn't contain any data. It's a file format that advanced content creators can use for [advanced data model](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) and report management scenarios. For example, you can use project files to save time in development by sharing common model patterns, like date tables, DAX measure expressions, or calculation groups.

You can use Power BI project files with [Power BI Desktop developer mode](/power-bi/developer/projects/) for:

- Advanced editing and authoring (for example, in a code editor such as Visual Studio Code).
- Purposeful separation of semantic model and report items (unlike the .pbix or .pbit files).
- Enabling multiple content creators and developers to work on the same project concurrently.
- Integrating with source control (such as by using Fabric Git integration).
- Using continuous integration and continuous delivery (CI/CD) techniques to automate integration, testing and deployment of changes, or versions of content.

> [!NOTE]
> Power BI includes capabilities such as .pbit template files and .pbip project files that make it simple to share starter resources with authors. Other Fabric workloads provide different approaches to content development and sharing. Having a set of starter resources is important regardless of the items being shared. For example, your portal might include a set of SQL scripts or notebooks that present tested approaches to solve common problems.

## Considerations and key actions

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - Considerations and key actions you can take to establish, or improve, mentoring and user enablement.

> [!div class="checklist"]
> - **Consider what mentoring services the COE can support:** Decide what types of mentoring services the COE is capable of offering. Types can include office hours, co-development projects, and best practices reviews.
> - **Communicate regularly about mentoring services:** Decide how you will communicate and advertise mentoring services, such as office hours, to the user community.
> - **Establish a regular schedule for office hours:** Ideally, hold office hours at least once per week (depending on demand from users as well as staffing and scheduling constraints).
> - **Decide what the expectations will be for office hours:** Determine what the scope of allowed topics or types of issues users can bring to office hours. Also, determine how the queue of office hours requests will work, whether any information should be submitted ahead of time, and whether any follow up afterwards can be expected.
> - **Create a centralized portal:** Ensure that you have a well-supported centralized hub where users can easily find training materials, documentation, and resources. The centralized portal should also provide links to other community resources such as the Q&A forum and how to find help.
> - **Create documentation and resources:** In the centralized portal, create, compile, and publish useful documentation. Identify and promote the top 3-5 resources that will be most useful to the user community.
> - **Update documentation and resources regularly:** Ensure that content is reviewed and updated on a regular basis. The objective is to ensure that the information available in the portal is current and reliable.
> - **Compile a curated list of reputable training resources:** Identify training resources that target the training needs and interests of your user community. Post the list in the centralized portal and create a schedule to review and validate the list.
> - **Consider whether custom in-house training will be useful:** Identify whether custom training courses, developed in-house, will be useful and worth the time investment. Invest in creating content that's specific to the organization.
> - **Provide templates and projects:** Determine how you'll use templates including Power BI template files and Power BI project files. Include the resources in your centralized portal, and in training materials.
> - **Create goals and metrics:** Determine how you'll measure effectiveness of the mentoring program. Create KPIs (key performance indicators) or OKRs (objectives and key results) to validate that the COE's mentoring efforts strengthen the community and its ability to provide self-service BI.

## Questions to ask

:::image type="icon" source="media/common/questions-to-ask.svg" border="false":::

Use questions like those found below to assess mentoring and user enablement.

- Is there an effective process in place for users to request training?
- Is there a process in place to evaluate user skill levels (such as beginner, intermediate, or advanced)? Can users study for and achieve Microsoft certifications by using company resources?
- What's the onboarding process to introduce new people in the user community to data and BI solutions, tools, and processes?
- Have all users followed the appropriate Microsoft Learn learning paths for their roles during onboarding?
- What kinds of challenges do users experience due to lack of training or mentorship?
- What impact does lack of enablement have on the business?
- When users exhibit behavior that creates governance risks, are they punished or do they undergo education and mentorship?
- What training materials are in place to educate people about governance processes and policies?
- Where's the central documentation maintained? Who maintains it?
- Do central resources exist, like organizational design guidelines, [themes](/power-bi/create-reports/desktop-report-themes), or [template files](fabric-adoption-roadmap-mentoring-and-user-enablement.md#power-bi-template-files)?

## Maturity levels

:::image type="icon" source="media/common/maturity-levels.svg" border="false":::

The following maturity levels will help you assess the current state of your mentoring and user enablement.

| **Level** | **State of mentoring and user enablement** |
| --- | --- |
| 100: Initial | &bull;&nbsp;Some documentation and resources exist. However, they're siloed and inconsistent. <br/><br/>&bull;&nbsp;Few users are aware of, or take advantage of, available resources. |
| 200: Repeatable | &bull;&nbsp;A centralized portal exists with a library of helpful documentation and resources. <br/><br/>&bull;&nbsp;A curated list of training links and resources are available in the centralized portal. <br/><br/>&bull;&nbsp;Office hours are available so the user community can get assistance from the COE. |
| 300: Defined | &bull;&nbsp;The centralized portal is the primary hub for community members to locate training, documentation, and resources. The resources are commonly referenced by champions and community members when supporting and learning from each other. <br/><br/>&bull;&nbsp;The COE's skills mentoring program is in place to assist users in the community in various ways. |
| 400: Capable | &bull;&nbsp;Office hours have regular and active participation from all business units in the organization. <br/><br/>&bull;&nbsp;Best practices reviews from the COE are regularly requested by business units. <br/><br/>&bull;&nbsp;Co-development projects are repeatedly executed with success by the COE and members of business units. |
| 500: Efficient | &bull;&nbsp;Training, documentation, and resources are continually updated and improved by the COE to ensure the community has current and reliable information. <br/><br/>&bull;&nbsp;Measurable and tangible business value is gained from the mentoring program by using KPIs or OKRs. |

## Related content

In the [next article](fabric-adoption-roadmap-community-of-practice.md) in the Microsoft Fabric adoption roadmap series, learn about the community of practice.
