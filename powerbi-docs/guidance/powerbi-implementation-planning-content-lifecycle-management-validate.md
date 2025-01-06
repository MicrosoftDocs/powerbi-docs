---
title: "Power BI implementation planning: Validate content"
description: "This article helps you to validate content as part of managing the content lifecycle."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: Validate content

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article helps you to validate content as part of managing the content lifecycle. It's primarily targeted at:

- **Center of Excellence (COE) and BI teams**: The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who decide how to manage the lifecycle of Power BI content. These teams can also include release managers, who handle the lifecycle of content releases, and engineers who create and manage the components needed to effectively use and support lifecycle management.
- **Content creators and content owners**: Users who create content that they want to publish to the Fabric portal to share with others. These individuals are responsible for managing the lifecycle of the Power BI content that they create.

Lifecycle management consists of the processes and practices that you use to handle content from its creation to its eventual retirement. In the [second stage of lifecycle management](powerbi-implementation-planning-content-lifecycle-management-develop-manage.md), you develop content and manage changes, which involve key decisions about how you'll develop content and set up workspaces and version control. In the third stage, you validate content to test whether it's ready for deployment.

> [!NOTE]
> You typically iterate through stages two and three in successive [development and validation cycles](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-4-create-and-validate-content).

Validating content is critical to ensure the quality and trustworthiness of your solutions. For this reason, it's essential that you test content changes before you deploy them to production.

The following image depicts the lifecycle of Power BI content, highlighting stage three, where you validate content.

:::image type="content" source="media/powerbi-implementation-planning-content-lifecycle-management-validate/content-lifecycle-management-stage-3.svg" alt-text="Diagram shows the Power BI content lifecycle. Stage 3, which is about content validation, is highlighted." border="false":::

> [!NOTE]
> For an overview of content lifecycle management, see the [first article in this series](powerbi-implementation-planning-content-lifecycle-management-overview.md).
>
> This article focuses on key considerations and decisions for validating content throughout its lifecycle. For more guidance about how to validate content, see:
>
> - **[Migrate to Power BI: Validate content](powerbi-migration-create-validate-content.md#validate-the-solution)**: This article describes key considerations and decisions for validation when you migrate to Power BI from other technologies.
> - **[BI solution planning: Validate content](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#validate-content)**: This article describes how to plan for iterative development and validation cycles when planning your Power BI or Fabric solution.

Validating content involves making specific decisions or actions to ensure that the content performs as expected.

When you validate content, you assess different aspects of the solution.

- **Functionality**: Whether the items and features that comprise the solution are functional. An example of [testing functionality](powerbi-migration-create-validate-content.md#validate-functionality) is whether a semantic model can complete a [scheduled refresh](../connect-data/refresh-scheduled-refresh.md#scheduled-refresh).
- **Data accuracy**: Whether the figures and results shown are complete and align to business expectations. An example of [testing data accuracy](powerbi-migration-create-validate-content.md#validate-data-accuracy) is whether a value in a report aligns to a known baseline.
- **Performance**: Whether queries produce minimal impact on available user resources or user wait times. An example of [testing performance](powerbi-migration-create-validate-content.md#validate-performance) is whether a dataflow reliably refreshes without reaching [timeout](../transform-model/dataflows/dataflows-understand-optimize-refresh.md#timeout-errors) or experiencing [long refresh durations](../transform-model/dataflows/dataflows-understand-optimize-refresh.md#long-durations).
- **Security**: Whether unauthorized individuals are restricted from viewing or accessing information, or the entire solution. An example of [testing security](powerbi-migration-create-validate-content.md#validate-security) is the impersonation of a user or role when [validating row-level security (RLS)](../enterprise/service-admin-rls.md#validating-the-role-within-the-power-bi-service).
- **Effectiveness**: Whether the solution addresses the relevant business problem or process, and sufficiently supports business objectives as intended. An example of testing effectiveness is the gathering of user feedback when you [conduct user acceptance testing (UAT)](powerbi-migration-deploy-support-monitor.md#conduct-user-acceptance-testing).
- **Accessibility**: Whether the solution meets known [accessibility standards](../create-reports/desktop-accessibility-overview.md#accessibility-standards) so that it's usable by as many people as possible. An example of accessibility testing is checking that your report meets the [Microsoft report accessibility checklist](../create-reports/desktop-accessibility-creating-reports.md#report-accessibility-checklist).

You validate content by conducting different kinds of tests. The following sections describe key considerations for decisions about how content creators and content consumers perform testing.

> [!NOTE]
> Many teams use test methodologies that originate from software development, such as unit tests, integration tests, and smoke tests. There are many equally valid approaches to content testing and validation. What's most important is that you test content by using an approach that works best for your needs and the way your team works.

## Decide how creators should validate content

Content creators should validate their own changes to content to ensure the quality and functionality of the changes. Tests typically happen in the development workspace, which contains the latest working version of a solution. Content creators test their own changes before content is deployed to a test workspace for user validation.

> [!NOTE]
> It's essential that content creators validate their own content before it's made available to users. If a solution is provided to test users with obvious issues, it erodes trust in the solution. Even when testing, users expect to see a reasonable representation of the final product. Additionally, a functional solution allows users to focus on identifying issues related to their business area.

There are two ways for content creators to validate content.

- **Manual testing**: Manual tests involve someone manually validating the content, either through subjective assessment or by comparing to some objective test criteria. Manual tests are easy to perform, but they're subject to human error or bias. Additionally, when content reaches a certain scale, manual tests can become laborious to properly perform. You can conduct manual testing in two ways.
  - Independent review, which involves you testing your own content, like semantic models and reports.
  - Peer review, which involves a subjective assessment of the content to critically appraise the solution and provide suggestions to improve it.
- **Automated testing**: Automated tests involve a preprepared test that's evaluated automatically without human intervention. Typically, automated tests check parts of the solution code against specific benchmarks or baselines. Automated testing is more difficult to perform and takes time and effort to set up. However, automated testing is essential in [enterprise scenarios](powerbi-implementation-planning-usage-scenario-enterprise-bi.md) to ensure the quality and trustworthiness of larger implementations and business-critical solutions.

The following sections describe different ways that content creators can conduct manual testing, automated testing, and peer review.

### Conduct manual testing

You should conduct your own manual tests on the content that you create. These tests should ensure that your changes work as expected and achieve desired quality standards. Typically, manual testing involves use and subjective assessment of the content or specific content changes, and describing and documenting the results.

Here are some considerations when testing your own content.

- Decide and document beforehand the test conditions and success criteria.
- Be thorough with testing and with documenting the test results. However, ensure that you avoid superfluous testing so that your test practices don't slow down development.
- Create a standard set of tests for each item type to improve repeatability.
- Document test results and conclusions.
- Test multiple times to ensure that your test results best reflect reality and not random chance.
- Use test conditions that are representative of your production environment.

The following sections describe other key considerations for manual testing.

#### Manually test semantic models

Semantic models are an important part of a solution in Fabric and Power BI because they're an upstream source for reports, dashboards, and other client tools and Fabric workloads. As such, it's important to validate your semantic models before deployment.

Answer questions such as the following to help you validate your semantic model.

- Do tables contain unexpected missing, duplicate, or incorrect values?
- Do DAX measures return the expected results without long query times?
- Does a scheduled refresh complete successfully without long refresh times?
- Do you observe _(Blank)_ results in visuals, filters, or query results caused by [referential integrity violations](../transform-model/desktop-relationships-understand.md#relationship-evaluation)?
- Does data security, like RLS or object-level security (OLS), sufficiently prevent unauthorized individuals from accessing the model or its data?
- Are model objects (like DAX measures or table columns) organized into display folders?

You can use different tools and approaches to help you validate your semantic models.

- **Power BI Desktop**: Power BI Desktop allows you to validate different aspects of your semantic models by using various features. Examples of Power BI Desktop features that facilitate testing semantic models include:
  - **Visual canvas**: Test model functionality and accuracy with drag-and-drop visuals.
  - **DAX query view**: Test model accuracy and [DAX code with DAX queries](../transform-model/dax-query-view.md) that you can save and reuse later.
  - **Query diagnostics**: Test refresh performance by getting [diagnostic information](/power-query/query-diagnostics) about how queries are evaluated in Power Query.
- **Fabric**: Features and items in the Fabric portal allow you to validate aspects of your semantic model once it's deployed to a workspace.
  - **Security**: Test model security by [impersonating security roles or users](../enterprise/service-admin-rls.md#validating-the-role-within-the-power-bi-service).
  - **Notebooks**: Test model functionality and accuracy by using [semantic link](/python/api/semantic-link/overview-semantic-link?view=semantic-link-python&preserve-view=true).
  - **Monitoring hub**: Test and monitor [data refresh of semantic models and other Fabric data items](/fabric/admin/monitoring-hub).
- **Third-party tools**: Third-party tools allow you to validate other aspects of your semantic model, either by providing more detail or other features that facilitate validation. Examples of third-party tools that facilitate testing semantic models include:
  - **DAX Studio**: Test and optimize the performance of DAX code by receiving detailed breakdowns of DAX query timings and query plans.
  - **Tabular Editor**: Test and debug accuracy of DAX code by receiving detailed breakdowns of how DAX queries are evaluated and what evaluation context is active.

> [!TIP]
> You can use [query diagnostics](/power-query/query-diagnostics) to manually validate and optimize the performance of Power Query from other items that use it, like dataflows.
>
> Additionally, you can use the DAX query view and third-party tools like DAX Studio to validate and optimize DAX queries for paginated reports and scorecards.

#### Manually test reports

Reports are a common way for users to interact with your data. Many users depend upon reports to make decisions and take actions to make progress towards their business objectives. As such, it's important to validate your reports before deployment.

Answer questions such as the following to help you validate your reports.

- Do reports fulfill the documented business requirements?
- Are the [right visual types used to address the right question](../create-reports/service-dashboards-design-tips.md#use-the-right-visualization-for-the-data)?
- Are report pages clear and concise without overwhelming colors or too many visuals?
- Does the report work as expected when filtering to a narrow subset of data?
- Does the report allow export to Excel, and if so, does it allow retrieving summarized data or the underlying data?
- Can the report be used for cross-report drill through or personalization of visuals?

You can use different tools and approaches to help you validate your reports.

- **Power BI Desktop**: Power BI Desktop allows you to validate different aspects of your reports by using various features. Examples of Power BI Desktop features that facilitate testing reports include:
  - **Visual canvas**: Test report functionality by using slicers, filters, and other interactive elements.
  - **Performance analyzer**: Test report performance by [measuring visual rendering and DAX query times](../create-reports/desktop-performance-analyzer.md). You can copy visual DAX queries from the performance analyzer to use in other tools and [save performance results](../create-reports/desktop-performance-analyzer.md#save-performance-information) for documentation.
  - **Query limit simulations**: Test report performance by [simulating the memory limits](../create-reports/desktop-set-visual-query-limits.md) in the capacity where it will be deployed.
- **Fabric**: Features and items in the Fabric portal allow you to validate aspects of your report once it's deployed to a workspace.
  - **Update app**: Test report functionality and security when distributing reports in Power BI apps and setting different app audiences to determine who can view which content. When you use app audiences, you can preview which reports they'll have access to, and test the app experience, yourself.
  - **Reading view in the workspace or app**: Test report functionality and accuracy by using it in the same environment as a user.

> [!NOTE]
> You can only develop and validate dashboards in the Fabric portal.

> [!IMPORTANT]
> It's essential to test your reports in both Power BI Desktop and after deployment in the Fabric portal. Visual rendering might behave differently on your local machine compared to reports in a Fabric workspace. Additionally, be aware that the user experience of using a report from a workspace or app differs significantly from using a report in Power BI Desktop.

#### Manually test by performing a peer review

Another way to manually validate content is by performing a peer review. In a peer review, the content creator provides the solution or part of the solution to a colleague to evaluate. The purpose of a peer review is to improve a solution by using the collective experience and expertise of multiple content creators. You can perform peer review both during and after manual and automated testing.

> [!NOTE]
> Peer review is a standard approach that's used in many industries. This approach is commonly known to improve the quality of content, products, and processes.

> [!TIP]
> If you're the only content creator for a solution, consider finding another content creator on a different team to review your solution, and offer to do the same for them.

There are different ways that you can conduct a peer review.

- **Functional review**: A functional review focuses on features, processes, or business requirements that the solution should fulfill. In a functional review, the reviewers use the solution as if they were an end user. They document any defects or issues they find, together with any subjective critique to improve the implementation.
- **Technical review**: A technical review focuses on technical aspects of the solution, like data modeling, code, or design. In a technical review, reviewers assess how certain features or changes were implemented, and suggest alternative approaches or highlight potential flaws or risks to the current approach.
- **Pull request**: When you perform source control, you create a [pull request (PR)](/azure/devops/repos/git/pull-requests?view=azure-devops&tabs=browser&preserve-view=true) to merge your changes to the latest version of a solution. A technical owner reviews the proposed changes and evaluates the source code. This kind of review is useful for ensuring that code adheres to standard conventions, like formatting DAX or M code, or identifying anti-patterns or potentially problematic code.

> [!TIP]
> We recommend that you perform some kind of formal peer review and approval before content changes can move to user acceptance testing. That's because poor quality content can harm trust in your data solutions, even during testing. Furthermore, peer review can also yield benefits to collaboration and knowledge-sharing among team members.

Once you complete a peer review cycle, you should document and incorporate any recommended changes. If necessary, you should resubmit the changes for approval before moving on to user testing. Typically, multiple iterations of peer review are only needed when there are many changes or a few complex changes to test.

### Automate testing

Content creators can automate testing so that tests are performed automatically prior to deployment. Automated tests typically involve preprepared test conditions that are run and orchestrated programmatically in response to certain actions, like saving content or submitting a pull request (PR). The results of automated tests are automatically stored for later reference and documentation.

The purpose of an automated test is to reduce the time and effort to validate content changes, while improving the consistency of the tests and reliability of their results. When content fails an automated test, it's typically prevented from being deployed until issues are resolved by the content creator.

Effective automated testing is a key part of implementing _DataOps_. DataOps allows teams to automate and scale processes by adopting practices that improve and accelerate delivery of data and analytics.

> [!IMPORTANT]
> To effectively automate testing, you should create well-designed tests. Creating such tests can take significant time and effort. If your test conditions and expectations are poorly defined, your automated tests won't be able to validate the right aspects of your content, and you'll receive little benefit automating these tests.

> [!TIP]
> Automated testing is most beneficial when integrated with your solution deployment in [enterprise content publishing scenarios](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md). For example, you can automate testing by using Azure Pipelines as part of a validation pipeline, which ensures content is ready to be deployed. For more information, see [Stage 4: Deploy content](powerbi-implementation-planning-content-lifecycle-management-deploy.md).

The following sections describe key considerations to automatically test Power BI semantic models and reports.

#### Automate testing of semantic models

Automated testing of semantic models is possible, although it typically requires custom setup with third-party tools and frameworks.

You can use different tools and approaches to automate testing of semantic models.

- **Best Practice Analyzer (BPA)**: The [Best Practice Analyzer](https://powerbi.microsoft.com/blog/best-practice-rules-to-improve-your-models-performance/) allows you to specify rules that you can use to evaluate a semantic model. You can run the BPA by using [Tabular Editor](https://tabulareditor.com/), which will identify any rule violations in a semantic model. You can automate checks for BPA rule violations by using the Tabular Editor command line interface (CLI) together with Azure DevOps, or as a part of another scheduled process.
- **Fabric notebooks and semantic link**: [Notebooks in Fabric](/fabric/data-engineering/how-to-use-notebook) allow you to use [semantic link](/fabric/data-science/semantic-link-overview) to programmatically interact with semantic models. You can use notebooks to run frameworks like [Great Expectations (GX)](/fabric/data-science/tutorial-great-expectations) to validate data. Additionally, you can [evaluate measures and DAX queries](/fabric/data-science/read-write-power-bi#use-python-to-read-data-from-semantic-models), then test the results against known baselines.
- **Power Automate**: [Power Automate](/power-automate/getting-started) allows you to run queries against semantic models and export reports by using the [Power BI REST APIs](/rest/api/power-bi/datasets/execute-queries). You can check the query results against known baselines, and then perform downstream actions like triggering alerts to content owners.

> [!TIP]
> Consider combining automated testing and the orchestration of your semantic models. For instance, you can conduct automated tests on a data source and semantic model prior to a refresh by using notebooks or Power Automate. If the tests fail, you can prevent the refresh, which also can prevent refresh errors or incorrect data from arriving in business reports.

#### Automate testing of reports

There are limited options available to automate testing of reports. These options rely on external tools or community solutions to automatically validate visuals or report properties, such as validating report metadata or simulating user interactions with reports.

You can use different tools and approaches to automate testing of reports.

- **Report best practice analyzers**: There are various third-party tools that support Best Practice Analyzer-like functionality to automate the detection of issues in reports by examining the report definition. Two tools that support this functionality are [PBI Explorer](https://www.pbiexplorer.com/) and [PBI Inspector](https://github.com/NatVanG/PBI-Inspector).
- **Power Automate Desktop**: UI automation tools like [Selenium for Python](https://selenium-python.readthedocs.io/) or [Power Automate Desktop](/power-automate/desktop-flows/ui-elements) allow you to simulate user mouse interactions with reports. By defining a user flow, you can test navigation and interactions. These tests pass when they can complete the flow, and fail when they [detect specific words or images](/power-automate/desktop-flows/how-to/access-elements-depend-window) on the screen (like an error message, or a blank visual).

## Decide how users should validate content

Once content passes manual testing, automated testing, and peer review, it can move on to user testing. When users test content, they provide subjective feedback about whether that content fulfills business requirements and performs to their expectations, including returning accurate results.

User validation typically happens in a test workspace. When you set up a test workspace, take into account the following considerations.

- **Create a test app**: If you intend to distribute content by using a Power BI app, set up a test app for test users to validate content. The test app should be identical to the app you'll set up in production. In the navigation of the test app, consider including links to documentation, training, and feedback forms.
- **Provision access**: Identify a subset of users from the community who will validate the solution. Contact these users and form an agreement about when and why they should validate this content. Then, ensure that you provide them with access to the content, and add them to the appropriate security roles. Share links to the content or test app with the users so they can get started with testing.
- **Set up scheduled refresh**: User validation typically spans a longer period. It's worthwhile to set up a scheduled refresh of data items in the test workspace so that users are testing with the latest data.

> [!IMPORTANT]
> When you deploy content to a test workspace, you need to manually update the app before changes to reports and dashboards are visible for users.

> [!NOTE]
> You cannot deploy or copy apps from one workspace to another. Any changes to an app must be made manually in the configuration for that workspace.

Before you commence user validation, you should conduct the necessary preparations.

- Plan when user validation should occur.
- Specify whether user validation is confined to a specific period or part of an iterative process.
- Create a method to gather feedback, such as by using [Microsoft Forms](/microsoft-forms/).
- Communicate to users involved in validation the planning and expectations.
- Organize a kick-off for user validation to guide users and manage expectations.
- Conduct training for users to demonstrate the validation and feedback process.

Here are some different ways to facilitate user validation of content.

- **Observatory testing**: Observatory tests are short sessions where content creators watch one or more users use the content without guidance or instruction. In these sessions, content creators use their observations to identify potential flaws, issues, or improvements to the solution. These tests can be valuable as they require little time and effort to organize, and can be limited to specific features or parts of a solution. Observatory tests are most beneficial to get early feedback about a design or approach, such as with [a proof of concept (POC)](powerbi-implementation-planning-bi-strategy-bi-solution-planning.md#step-3-conduct-a-proof-of-concept).
- **Focus group testing**: Focus group tests are limited sessions organized with a small group of users who go through the content together. These focus groups are curated to select key stakeholders and subject matter experts who can provide the best feedback about certain features or functionalities. Focus group tests can occur over multiple, interactive sessions. Focus group testing requires more time and effort than observatory testing, but can provide more detailed feedback about a solution.
- **User acceptance testing**: [User acceptance testing (UAT)](powerbi-migration-deploy-support-monitor.md#conduct-user-acceptance-testing) is a formal process where a larger group of individuals from the user community validate and provide asynchronous feedback about a solution. UAT requires the most time and effort to organize, but it's the most thorough way to conduct user testing. Once test users accept the solution and feedback issues are resolved, the content can be deployed to the production workspace.

Once you decide how to validate content, you can plan how you'll deploy it to and between workspaces.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for how to validate content, key decisions and actions include:

> [!div class="checklist"]
> - **Design and document test conditions**: Describe the tests that you'll conduct, what they test, and how you'll perform them.
> - **Decide on a peer review process**: Describe who else will validate the content aside from yourself.
> - **Decide on an approach to manual testing**: Decide which tools and features you'll use to validate the content that you create.
> - **Decide whether you'll use automated testing**: Identify whether the scale and scope of your content justifies that you set up automated tests. If so, ensure that you plan for the necessary time and resources to design and implement these tests so that they validate what you expect.
> - **Deploy content from the development workspace to the test workspace**: Deploy changes from the development workspace to the test workspace so that changes are visible for users. Ensure that you've done the necessary [post-deployment activities](powerbi-implementation-planning-usage-scenario-self-service-content-publishing.md#post-deployment-activities) in the test workspace, such as setting up and updating a test app.
> - **Decide on an approach to user testing**: Decide how users will validate content.
> - **Identify test users**: Identify who among the user community will validate the content. Reach agreement with those individuals on the extent of their involvement and expectations.
> - **Collect user feedback**: Set up tools and processes to automatically gather feedback. For instance, you can use Tasks and Planner in Microsoft Teams or Microsoft Forms.
> - **Document test results**: Document the results of all content validation, and any changes made as a result of the test results. Ensure that this documentation is easy to find.
> - **Plan your deployment to production**: Once user testing concludes, prepare to deploy content from the test workspace to the production workspace.

## Related content

In the [next article in this series](powerbi-implementation-planning-content-lifecycle-management-deploy.md), learn how to deploy content as part of managing the content lifecycle.
