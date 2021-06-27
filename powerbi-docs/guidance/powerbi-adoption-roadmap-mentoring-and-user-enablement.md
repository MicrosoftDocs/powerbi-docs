---
title: "Power BI adoption roadmap: Mentoring and user enablement"
description: Mentor users to drive strong and successful adoption of Power BI.
author: peter-myers
ms.author: maroche
ms.reviewer: asaxton
ms.service: powerbi
ms.subservice: powerbi
ms.topic: reference
ms.date: 06/30/2021
---

# Power BI adoption roadmap: Mentoring and user enablement

A critical objective for adoption efforts is to enable users to accomplish as much as they can within the requisite guardrails established by governance guidelines and policies. For this reason, the act of mentoring users is one of the most important responsibilities of the [Center of Excellence](powerbi-adoption-roadmap-center-of-excellence.md) (COE), and has a direct influence on how user adoption occurs. See the [Power BI adoption maturity levels article](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages) for more information about user adoption.

## Skills mentoring

Mentoring and helping users in the Power BI community be more effective can take on various forms, such as:

- Office hours
- Co-development projects
- Best practices reviews
- Extended support

### Office hours

Office hours are a form of ongoing community engagements managed by the COE. As the name implies, office hours are times of regularly scheduled availability where members of the community can engage with experts from the COE and receive assistance with minimal process overhead. Since office hours are group-based, Power BI champions and other members of the community may also pitch in to help solve an issue if a topic is in their area of expertise.

Office hours are a very popular, and productive, activity in a lot of organizations. Some organizations call them drop-in hours or even a fun name such as Power Hour. The primary goal is usually to get questions answered and remove blockers. Office hours can also be used as a platform for the user community to share ideas, suggestions, and even complaints.

The COE publishes regular office hours when one or more COE members are available. Ideally, office hours are held very frequently. For instance, this could be Tuesdays and Thursdays. Consider offering different time slots or rotating times if you have a global workforce.

> [!TIP]
> One option is to set specific office hours each week. However, people may or may not show up which can be inefficient. As an alternative, consider leveraging [Microsoft Bookings](https://www.microsoft.com/microsoft-365/business/scheduling-and-booking-app) for scheduling office hours. This allows you to show what blocks of time each COE expert is available, with Outlook integration to ensure availability is up-to-date.

Office hours are an excellent user enablement approach because:

- Content creators and the COE actively collaborate to answer questions and solve problems together.
- Real work is accomplished while learning and problem solving.
- Others may observe, learn, and participate.
- Individual groups can head to a breakout room to solve a specific problem.

Office hours benefit the COE as well because:

- They're a great way for the COE to identify champions, or people with specific skills, that the COE didn't previously know about.
- The COE can learn what people are struggling with throughout the organization. This helps inform what additional resources, documentation, or training might be helpful.

> [!TIP]
> It's common for some tough issues to come up during office hours which cannot be solved quickly (such as getting a tricky DAX calculation to work). Set clear expectations for what's in scope for office hours, and if there's any commitment for follow-up.

### Co-development projects

One way the COE can provide mentoring services is during a co-development project. A co-development project is a form of assistance offered by the COE where a user or business unit can take advantage of the technical expertise of the COE to solve business problems with data. Co-development involves stakeholders from the business unit and the COE working in partnership to build a high-quality self-service BI solution that the business stakeholders may not be able to deliver independently.

The purpose of co-development is to help the business unit develop expertise over time while also delivering value. As an example: the sales team has a pressing need to develop a new set of commission reports, but the sales team knows they don't yet have the knowledge to handle it completely on their own.

A co-development project forms a partnership between the business unit and the COE. In this arrangement, the business unit is fully invested, deeply involved, and assumes ownership for the project.

Time involvement from the COE reduces over time until the business unit gains expertise and becomes self-reliant:

:::image type="content" source="media/powerbi-adoption-roadmap-mentoring-and-user-enablement/powerbi-adoption-roadmap-center-of-excellence-mentoring.png" alt-text="Image shows expertise growing in the business unit as C O E involvement decreases over time, and is further described next.":::

The active involvement shown in the above visual changes over time as follows:

- Business unit: 50% initially, up to 75%, finally at 98%-100%
- COE: 50% initially, down to 25%, finally at 0%-2%

Ideally, the period for the gradual reduction in involvement is identified up-front in the project so both the business unit and the COE can sufficiently plan the timeline and staffing.

Co-development projects can deliver significant short-and long-term benefits. In the short term, the involvement from the COE can often result in a better-designed and better-performing solution that follows best practices and aligns with organizational standards. In the long term, co-development helps increase the knowledge and capabilities of the business stakeholder, making them more self-sufficient, and more confident of delivering quality self-service BI solutions in the future.

> [!IMPORTANT]
> Essentially, a co-development project helps less experienced users learn the right way to do things. This reduces risk that refactoring might be needed later and increases the ability for a solution to scale and grow over time.

### Best practices reviews

The COE may also offer best practices reviews, where an expert from the COE evaluates self-service Power BI content developed by a member of the community and identifies areas of risk or opportunities for improvement. This might also be known as advisory services or internal consulting time or technical reviews.

A best practices review can be extremely helpful for content creators who would like to validate their work. Examples of when a best practices review is beneficial:

- The sales team has an [app](../consumer/end-user-apps.md) which they intend to distribute to hundreds or thousands of users throughout the organization. Since this is high priority content distributed to a large audience, they'd like to have the app [certified](../collaborate-share/service-endorsement-overview.md). The standard process to certify content includes a best practices review.
- The finance team would like to [assign a workspace to Premium capacity](../admin/service-admin-premium-manage.md#assign-a-workspace-to-a-capacity). A review of the content in the workspace to ensure sound practices were followed is common when the capacity is shared among multiple business units (it can be more lenient if the capacity is allocated to only one business unit).
- The operations team is creating a new solution they expect to be widely used and would like to request a best practices review before it goes into user acceptance testing, or before a request is submitted to the change management board.

A best practices review is most often focused on the dataset design, though the review can encompass all types of artifacts (dataflows, datasets, reports, and apps) depending on the goals for the solution being deployed.

Before content is deployed to the Power BI service, a best practices review may include items such as:

- [Data sources](../connect-data/desktop-data-sources.md) used are appropriate and [query folding](power-query-folding.md) is invoked whenever possible.
- [Connectivity mode](../connect-data/service-dataset-modes-understand.md) and [storage mode](../transform-model/desktop-storage-mode.md) choices (for example, import, live connection, DirectQuery composite model frameworks).
- Location for data sources (ex: flat files) and original Power BI Desktop files are suitable (preferably stored in a backed-up location with versioning and proper security such as [Teams files or a SharePoint shared library](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes)).
- [Data preparation](../transform-model/desktop-query-overview.md) steps are clean, orderly, and [efficient]power-query-folding.md).
- [Dataset](../connect-data/desktop-data-view.md) is well-designed, clean, and understandable (a [star schema](star-schema.md) is highly recommended).
- [Relationships](../transform-model/desktop-relationships-understand.md) are used correctly.
- [DAX calculations](../transform-model/desktop-quickstart-learn-dax-basics.md) use efficient coding practices (particularly if the model is large).
- The dataset size is within a reasonable limit and [data reduction techniques](import-modeling-data-reduction.md) have been applied.
- [Row-level security](rls-guidance.md) is defined accurately and fit for purpose.
- Data is accurate and has been validated against the authoritative source.
- Approved common definitions and terminology are used.
- Good [data visualization](https://powerbi.microsoft.com/data-visualization/) practices have been followed, including [designing for accessibility](../create-reports/desktop-accessibility-creating-reports.md).

Once the content has been deployed to the Power BI service, the best practices review is not necessarily complete yet. Completing the remainder of the review may also include items such as:

- The target [workspace](../collaborate-share/service-create-the-new-workspaces.md) is suitable for the content.
- [Workspace security roles](../collaborate-share/service-new-workspaces.md#roles-in-the-new-workspaces) are appropriate for the content.
- Other permissions ([app permissions](../collaborate-share/service-create-distribute-apps.md#publish-your-app), [build permission](../connect-data/service-datasets-build-permissions.md), use of the [individual item sharing feature](../collaborate-share/service-share-dashboards.md)) are correctly used
- [Contacts](../create-reports/service-item-contact.md) are identified, and correctly correlate to the [owners of the content](powerbi-adoption-roadmap-content-ownership-and-management.md).
- [Sensitivity label](../admin/service-security-apply-data-sensitivity-labels.md) is correctly assigned.
- [Endorsement](../collaborate-share/service-endorse-content.md) (certified or promoted) is suitable.
- [Data refresh](../connect-data/refresh-data.md) is configured correctly, failure notifications include the proper personnel, and uses the appropriate [data gateway](/connect-data/service-gateway-onprem.md) in standard mode (if applicable).
- All [best practices rules](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance-and-design-v1-1/) have been followed and, preferably, are automated via a community tool called Best Practices Analyzer for maximum efficiency and productivity.

### Extended support

The COE may get involved from time to time with complex issues escalated from the help desk. This is discussed in the Power BI [user support](powerbi-adoption-roadmap-user-support.md) article.

> [!NOTE]
> Offering these types of skills mentoring services might be a culture change for your organization. Your reaction might be that users don't usually ask for help with a tool like Excel, so why would they with Power BI? The answer lies in the fact that Power BI is an extraordinarily powerful tool with capabilities for data preparation and data modeling in addition to reporting and visualizations. This inherently means that there's a learning curve to ensure solutions produce accurate information, perform well, are secured properly, and can scale over time. Having the ability to aid and enable users increase their skills can significantly increase the quality of solutions produced and reduce risks as well.

## Centralized portal

A single centralized portal, or hub, is where the user community can find:

- Access to the community Q&amp;A forum
- Announcements of interest to the community, such as new features and release plan updates
- Schedules and registration links for office hours, lunch and learns, training sessions, and user group meetings
- Announcements of key changes to data artifacts and change log (if appropriate)
- How to request help or support
- Training materials
- Documentation, onboarding materials, and frequently asked questions
- Governance guidance and approaches recommended by the COE
- Templates
- Recordings from knowledge sharing sessions
- Entry points for accessing managed processes such as license acquisition, access requests, and gateway configuration

> [!TIP]
> In general, only 10%-20% of your community will go out of their way to actively seek out training and educational information. These types of people might naturally evolve to be your Power BI champions. Everyone else is usually just trying to get the job done as quickly as possible because their time, focus, and energy are needed elsewhere. Therefore, it's important to make information very easy for your community users to find.

The goal is to consistently direct users in the community to the centralized portal to find information. The corresponding obligation for the COE is to ensure that the information needed is there. This requires discipline when everyone is busy - it's an important priority.

In larger organizations, it may be difficult to implement one single centralized portal. When it's not practical to consolidate, the centralized hub can serve as an aggregator which contain links to the other locations.

> [IMPORTANT]
> Although saving time finding information is important, our goal for a centralized portal is more than that. It's about making information readily available to help your user community do the right thing (i.e., desirable behaviors set forth by your governance plan) during their normal course of work, with as little friction as possible. Until it's easier to complete a task within the guardrails established by the COE and data governance team, some users will continue to complete their tasks by circumventing the policies that are put in place. The recommended path must become the path of least resistance. Having a centralized portal can help achieve this goal.

It takes time for community users to think of the centralized portal as their natural first stop for finding information. It takes consistent redirection to the portal to change habits. Sending someone a link to an original document location in the portal builds better habits than, for instance, including the answer in an email response. This is the same challenge that was discussed in the [user support](powerbi-adoption-roadmap-user-support.md) article (when discussing the internal community Q&amp;A forum).

## Training

A key factor for successfully enabling users in a Power BI community of practice is having the right training resources readily available and easily discoverable. Although some people will be so enthusiastic about Power BI that they'll find information and figure things out on their own, that isn't true for most of the user community.

Making sure your community of users has access to the training resources they need to be successful doesn't mean that your organization needs to develop extensive custom in-house training. Developing extensive custom in-house training is often counterproductive due to the rapidly evolving nature of the product and the plethora of resources and training available in the worldwide community. A curated set of links goes a long way to help users organize and focus their training efforts, especially for tool training which focuses on the technology. All external links should be validated by the COE for accuracy and credibility. This is a key opportunity for the COE to add value because COE stakeholders are in an ideal position to understand the learning needs of the community, and to identify and locate trusted sources of quality learning materials.

You'll find the greatest return on investment with creating custom training materials for organizational-specific processes, while relying on content produced by others for everything else. It's also useful to have a short training class which is focused primarily on topics such as how to find documentation, getting help, and interacting with the community.

> [!TIP]
> One of the goals of training is to help people learn new skills while helping them avoid bad habits. This can be a balancing act. For instance, you don't want to overwhelm people by adding in a lot of complexity and friction to a beginner-level class for report creators. However, it's a great investment to make newer content creators aware of things that could otherwise take them a while to figure out. An ideal example is teaching the ability to use live connection for reports to an existing dataset. By teaching this concept at the earliest logical time, you can save someone thinking they always need one dataset for every report and encourage the good habit of reusing existing datasets across reports.

Some larger organizations experience a lot of continual employee transfers and turnover. This results in an increased need for a repeatable set of training resources.

### Training resources and approaches

There are a lot of training approaches because people learn in different ways. If you can monitor and measure usage of your training materials, you'll learn over time what works the best. Some training might be delivered more formally (such as classroom training with hands-on labs), while other types of training are less formal, such as:

- Lunch and learn presentations
- Short how-to videos targeted to a specific goal
- Curated set of online resources
- Internal user group presentations
- One-hour, one-week, or one-month challenges
- Hackathon-style events

Advantages of encouraging knowledge sharing by colleagues is discussed further in the Power BI [community of practice]s(powerbi-adoption-roadmap-community-of-practice.md) article.

> [!TIP]
> Whenever practical, learning should be correlated with building something meaningful and realistic. However, simple demo data does have value during a training course which focuses on how to use the technology. Consider following it up with a "bring your own data" type of session which encourages the learner to apply the technical skills they just learned to an actual business problem. Try to have multiple facilitators from the COE available during this type of follow-up session so questions can be answered quickly.

The types of users you may target for training include:

- Content consumers
- Report creators
- Data creators (datasets and dataflows)
- Content owners, subject matter experts, and workspace administrators
- Satellite COE members and champions network
- Power BI administrators

> [!IMPORTANT]
> Each type of user will have different training needs, and the COE will need to identify how best to meet the needs of each audience. For instance, one audience might find a standard introductory Power BI Desktop class overwhelming, whereas another will want more challenging information with depth and detail. If you have a diverse population of Power BI content creators, consider creating personas and tailoring the experience to the extent that it's practical.

The completion of relevant training can be a leading indicator for success with [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages). Some organizations grant badges like blue belt or black belt as people progress through the stages of training.

Give some consideration to how you want to handle users in various stages of [user adoption](powerbi-adoption-roadmap-maturity-levels.md#user-adoption-stages). Training needs for onboarding brand new users (sometimes thought of as "training day zero" concerns) and for less experienced users are very different than for more experienced users.

How the COE invests its time in creating and curating training materials will change over time as adoption and maturity grows. You may also find over time that some community champions want to run their own tailored set of training classes within their functional business unit.

### Sources for trusted Power BI training content

A curated set of online resources is valuable to help community members focus and direct their efforts on what's important. Some publicly available training resources you might find helpful include:

- [Microsoft Learn](https://aka.ms/pbilearn)
- [Power BI courses and "in a day" training materials](https://aka.ms/pbitraining)
- [LinkedIn Learning](https://www.linkedin.com/learning/topics/power-bi)
- [Virtual workshops and training](https://www.microsoft.com/store/workshops-training-and-events/#keyword=Power%20BI)

Consider using [Microsoft Viva Learning](https://resources.techcommunity.microsoft.com/viva-learning/) which is integrated in Microsoft Teams. It includes content from sources such as [Microsoft Learn](https://aka.ms/pbilearn) and [LinkedIn Learning](https://www.linkedin.com/learning/topics/power-bi). Custom content produced by your organization can be included as well.

In addition to Microsoft content and custom content produced by your organization, you may choose to provide your user community with a curated set of recommended links from trusted online sources. There are a wide array of videos, blogs, and articles produced by the worldwide community of Power BI experts, MVPs, and enthusiasts. Providing a curated learning path which contains specific, reputable, high quality resources will provide the most value to your user community.

When you do make the investment to create custom in-house training, create short, targeted training that's targeted to solving one problem rather than long, comprehensive content. This makes specific topics easier to find and easier to consume by the user. It's also easier to maintain and update over time.

> [!TIP]
> The Help and Support menu in the Power BI service is customizable. After your centralized location for training documentation is operational, update the [tenant setting in the admin portal](admin-tenant-settings.md#publish-get-help-information) to redirect users to your training materials and documentation from the 'get help' menu. Also, be sure to teach users about the Help menu in Power BI Desktop which includes links to guided learning, training videos, documentation, and more.

## Documentation

Concise, well-written documentation can be a significant help for users trying to get things done. Your needs for documentation, and how it's delivered, will depend on how Power BI is managed in your organization. See the [content ownership and management](powerbi-adoption-roadmap-content-ownership-and-management.md) article for further discussion.

Certain aspects of Power BI tend to be managed by a centralized team such as the COE. The following types of documentation are helpful in these situations:

- How to request a Power BI license (and if there are requirements to get a license such as manager approval)
- How to request a new Premium capacity
- How to request a new workspace be created
- How to request a workspace be added to Premium capacity
- How to request access to a gateway data source
- How to request software installation

> [!TIP]
> For certain activities that are repeated over and over, consider automating with Power Apps and Power Automate. In that case, your documentation will also include how to access and use the Power Platform functionality.

Other aspects of Power BI can be managed by self-service users, decentralized teams, or by a centralized team. The following types of documentation might differ based on who owns and manages the content:

- How to request a new report
- How to request a report enhancement
- How to request access to a dataset
- How to request a dataset enhancement

> [!TIP]
> When planning for a centralized portal, as discussed earlier in this article, plan for how to handle situations when guidance or governance policies need to be customized for one or more business units.

There are also going to be some [governance](powerbi-adoption-roadmap-governance.md) decisions which have been made and should be documented, such as:

- How to request content to be certified
- What are the approved file storage locations
- What are the data retention and purge requirements
- What are the requirements for handling sensitive data and personally identifiable data

Documentation should be located in your centralized portal - a searchable location where users already work, such as [Teams or SharePoint](/microsoft-365/community/should-i-store-my-files-in-teams-or-sharepoint-an-understanding-of-behind-the-scenes), works well. Creating the documentation in either wiki pages or in documents can work equally well, provided that the content is organized well and easy to find. Shorter documents which focus on accomplishing one thing are usually easier to consume than comprehensive documents.

> [!IMPORTANT]
> One of the most helpful pieces of documentation you can publish for the community is what the [tenant settings](admin-tenant-settings.md) are, and what group membership is required for each tenant setting. Users read about features and functionality online, only to sometimes find that it doesn't work for them. Being able to quickly reference what your organization's tenant settings are can save users from being frustrated and from creating workarounds. Effective documentation can reduce the number of help desk tickets that are submitted. It can also reduce the number of people who need to be assigned the Power BI administrator role (who might have this role solely for the purpose of viewing settings).

Over time, you may choose to allow some documentation to be maintained by the community if you have willing volunteers. In that case, you may want to introduce an approval process for changes.

When you see questions repeatedly come up in the Q&amp;A forum (discussed in the [user support](powerbi-adoption-roadmap-user-support.md) article, during office hours, or during lunch and learns, that's a great indicator that documentation may be appropriate. When the documentation exists, that allows colleagues to reference it when needed. This contributes to user enablement and a self-sustaining community.

> [!TIP]
> When creating custom documentation or training materials, reference existing Microsoft sites when possible. Since Power BI is in a continual state of evolution, this will reduce the level of documentation maintenance needed over time.

## Templates

A [Power BI template](../create-reports/desktop-templates.md) is a _.pbit_ file which can be provided as a starting point for content creators. It's the same as a pbix file which can contain queries, dataset, and reports, with one exception: the template file doesn't contain any data. Therefore, it's a much smaller file to share with the community and does not present a risk of inappropriately sharing data.

Providing templates for your community is a great way to:

- Promote consistency
- Reduce learning curve
- Show good examples and best practices
- Increase efficiency

Power BI template files can improve efficiency and help people learn during the normal course of their work. A few ways that template files are helpful include:

- Reports can use examples of good visualization practices
- Reports can incorporate organizational branding and design standards
- Datasets can include the structure for commonly used tables (ex: date or customer)
- Helpful DAX calculations can be included (ex: year over year or percent of total)
- Common parameters can be included (ex: for handling data source connectivity)
- A good example of report and/or dataset documentation can be included

> [!NOTE]
> Having templates can not only save your content creators time, but it helps them quickly advance past the stage of starting from a blank page.

## Considerations and key actions

Considerations and key actions you can take to establish or improve mentoring and user enablement:

- Establish regular office hours, ideally at least once per week, depending on demand from users as well as staffing and scheduling constraints.
- Decide how you will communicate and advertise office hours to the user community.
- Decide what the expectations will be for office hours, including allowed topics or types of issues user can bring, how the queue will work, if any information should be submitted ahead of time, and if any follow-up afterwards can be expected.
- Beyond office hours, consider what other type of mentoring services the COE might offer such as co-development projects or best practices reviews.
- Create a centralized portal to serve as the hub for Power BI training, documentation, and resources. The centralized portal should also provide links to other community resources such as the Q&amp;A forum and how to find help.
- Compile a curated list of reputable training resources which target issues applicable to your user community. Post the list in the centralized portal and create a schedule to re-review and validate the list.
- Consider what custom in-house training resources will be useful and worth the time investment.
- Create the top 3-5 documentation and resources that will be most useful to the user community.

## Maturity levels

The following maturity levels will help you assess the current state of your mentoring and user enablement:

| **Level** | **State of Power BI mentoring and user enablement** |
| --- | --- |
| 100: Initial | Some documentation and resources exist, though they are siloed and inconsistent.</br></br>Few users are aware of or take advantage of available resources. |
| 200: Repeatable | A centralized portal exists with a library of training, documentation, and resources.</br></br>Office hours are held on a regular basis. |
| 300: Defined | The centralized portal has become the primary hub for community members to locate information.</br></br>The COE's skills mentoring program is in place to assist users in the community in various ways. |
| 400: Capable | Resources in the centralized portal are commonly referenced by champions and community members when supporting and learning from each other.</br></br>Business units regularly engage with the COE and take advantage of its skills mentoring program. Tangible business value is gained from the program. |
| 500: Efficient | Documentation and resources are continually updated and improved by the COE based on lessons learned. |

## Next steps

In the [next article in this series](powerbi-adoption-roadmap-community-of-practice.md), learn more about the community of practice.
