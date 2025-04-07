---
title: "Power BI implementation planning: User tools and devices"
description: "Learn about user tools and managing devices to enable and support Power BI consumers and authors in the organization."
author: denglishbi
ms.author: daengli
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.custom: fabric-cat
ms.date: 12/30/2024
---

# Power BI implementation planning: User tools and devices

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

This article introduces key considerations for planning user tools and managing devices to enable and support Power BI consumers and authors in the organization. This article is targeted at:

- **Center of Excellence (COE) and BI teams**: The teams that are responsible for overseeing Power BI in the organization. These teams include decision makers who need to decide which tools to use for creating Power BI content.
- **Fabric administrators**: The administrators who are responsible for overseeing Fabric in the organization.
- **IT and infrastructure teams**: Technical staff who installs, updates, and manages user devices and machines.
- **Content creators and content owners**: Users who need to communicate with colleagues and make requests for what they need to have installed.

One important aspect of analytics adoption is ensuring that content consumers and content creators have the software applications they need. The effective management of tools–particularly for users who create content–leads to increased [user adoption](fabric-adoption-roadmap-maturity-levels.md#user-adoption-stages) and reduces [user support](fabric-adoption-roadmap-user-support.md) costs.

## Requests for new tools

How you handle requests for new tools and software applications is a [governance](fabric-adoption-roadmap-governance.md) decision. Many users who are new to the organization, or are just getting started with analytics, don't know what to request. To simplify the process, consider handling the following requests together:

- Software requests
- User license requests
- Training requests
- Data access requests

Software installations are usually the responsibility of the IT department. To ensure an optimal user experience, it's critical that IT collaborate with the [Center of Excellence (COE)](fabric-adoption-roadmap-center-of-excellence.md) on key decisions and processes, such as:

- **Process for users to request software installation.** There are several ways to handle software installation requests:
  - Common tools can be included in a standard machine setup. IT teams sometimes refer to it as the _standard build_.
  - Certain applications might be installed automatically based on job role. The software that's installed could be based on an attribute in the [user profile](/azure/active-directory/fundamentals/how-to-manage-user-profile-info) in Microsoft Entra ID.
  - For custom requests, using a standard request form works well. A form (rather than email) builds up a history of requests. When prerequisites or more licenses are required, approval can be included in the workflow.
- **Process for installing software updates.** The timely installation of software updates is important. The goal is to stay as current as possible. Be aware that users can read online what's possible and might become confused or frustrated when newer features aren't available to them. For more information, see [Client tools](#client-tools) later in this article.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for how to handle requests for new tools, key decisions and actions include:

> [!div class="checklist"]
> - **Decide how to handle software requests**: Clarify who's responsible for receiving and fulfilling new requests for software installation.
> - **Confirm whether prerequisites are required**: Determine what organizational prerequisites exist related to training, funding, licensing, and approvals prior to requesting software to be installed.
> - **Create a tracking system**: Create a system to track the status and history of software requests.
> - **Create guidance for users**: Provide documentation in the [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal) for how to request new tools and software applications. Consider co-locating this guidance with how to request licenses, training, and access to data.

## Plan for consumer tools

In an organization, many users are classified as _consumers_. A consumer views content that's been created and published by others.

The most common ways that a consumer can access Power BI content include:

| Software | Target audience |
| --- | --- |
| Power BI service | Content consumers view content by using a web browser (such as Microsoft Edge). |
| Teams | Content consumers who view content that's been published to the Power BI service by using the [Power BI app for Microsoft Teams](../collaborate-share/service-microsoft-teams-app.md). This option is convenient when users spend a lot of time in Teams. For more information, see [Guide to enabling your organization to use Power BI in Microsoft Teams](https://powerbi.microsoft.com/blog/guide-to-enabling-your-organization-to-use-power-bi-in-microsoft-teams/). |
| Power BI Mobile Application | Content consumers who interact with content that's been published to the Power BI service (or Power BI Report Server) using iOS, Android, or Windows 10 applications. |
| OneDrive/SharePoint viewer | Content consumers who view [Power BI Desktop (.pbix) files that are stored in OneDrive or SharePoint](../collaborate-share/service-sharepoint-viewer.md) by using a web browser. This option is a useful alternative to sharing the original Power BI Desktop files. The OneDrive/SharePoint viewer is most suitable for informal teams who want to provide a friendly, web-based, report consumer experience without explicitly publishing .pbix files to the Power BI service. |
| Custom application | Content consumers who view content from the Power BI service that's been embedded in a custom application [for your organization](powerbi-implementation-planning-usage-scenario-embed-for-your-organization.md) or [for your customers](powerbi-implementation-planning-usage-scenario-embed-for-your-customers.md). |

> [!NOTE]
> This list isn't intended to be an all-inclusive list of ways to access Power BI content.

Because the user experience can vary slightly between different web browsers, we recommend that you document browser recommendations in your [centralized portal](fabric-adoption-roadmap-mentoring-and-user-enablement.md#centralized-portal). For more information, see [Supported browsers for Power BI](../fundamentals/power-bi-browsers.md).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for consumer tools, key decisions and actions include:

> [!div class="checklist"]
> - **Use a modern web browser**: Ensure that all users have access to a modern web browser that's supported for Power BI. Confirm that the preferred browser is updated regularly on all user devices.
> - **Decide how Teams should be used with Power BI**: Determine how users currently work, and to what extent Teams integration is useful. Set the _Enable Teams integration_ and the _Install Power BI app automatically_ tenant settings in the [Fabric admin portal](/fabric/admin/admin-center) according to your decision.
> - **Enable and install the Teams app**: If Teams is a commonly used tool, enable the Power BI app for Microsoft Teams. Consider pre-installing the app for all users as a convenience.
> - **Decide whether viewing Power BI Desktop files is permitted**: Consider whether viewing Power BI Desktop files stored in OneDrive or SharePoint is allowed or encouraged. Set the _Users can view Power BI files saved in OneDrive and SharePoint_ tenant setting according to your decision.
> - **Educate users**: Provide guidance and training for content creators on how to make the best use of each option, and where to securely store files. Include recommendations, such as preferred web browsers, in your centralized portal.
> - **Conduct knowledge transfer with the support team**: Confirm that the support team is prepared to answer frequently asked questions from users.

## Plan for authoring tools

Some users are considered _content creators_. A content creator authors and publishes content that's viewed by consumers.

There are several tools that content creators can use to author Power BI content. Some tools are targeted at _self-service_ content creators. Other tools are targeted at _advanced_ content creators.

> [!TIP]
> This section introduces the most common authoring tools. However, an author doesn't need all of them. When in doubt, start by only installing Power BI Desktop.

### Available tools for authoring

The following table lists the most common tools and applications that are available for content creators.

| Software | Target audience |
| --- | --- |
| Power BI service | Content consumers and creators who develop content by using a web browser. |
| Power BI Desktop | Content creators who develop data models and interactive reports that will be published to the Power BI service. |
| Power BI Desktop Optimized for Report Server | Content creators who develop data models and interactive reports that will be published to [Power BI Report Server](../report-server/get-started.md) (a simplified on-premises report portal). |
| Power BI Report Builder | Report creators who develop paginated reports that will be published to the Power BI service or to Power BI Report Server. |
| Power BI App for Teams | Content creators and consumers who interact with content in the Power BI service, when their preference is to remain within the Microsoft Teams application. |
| Power BI Mobile Application | Content creators and consumers who interact with and manage content that's been published to the Power BI service (or Power BI Report Server) using iOS, Android, or Windows 10 applications. |
| Excel | Content creators who develop Excel-based reports in workbooks that might include PivotTables, charts, slicers, and more. Optionally, Excel workbooks can be viewed in the Power BI service when they're stored in SharePoint or OneDrive for work or school. |
| Third-party tools | Advanced content creators can optionally use third-party tools and extend the built-in capabilities for purposes such as [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md) and [enterprise content publishing](powerbi-implementation-planning-usage-scenario-enterprise-content-publishing.md). |

### Choose an authoring tool

When choosing an authoring tool, there are some key factors you should consider. Some of the following decisions can be made once, whereas other decisions need to be evaluated for each project or solution that you create.

- **Is browser-based authoring desirable?** To improve ease of use and reduce friction, Power BI (and other Fabric workloads) supports browser-based functionality for both content consumption as well as content creation. That's an advantage because a web browser is readily available to all users, regardless of the desktop operating system they use (including Mac users).
- **What's the desired development experience?** Consider that Power BI Desktop can be used to create data models and interactive reports, whereas Power BI Report Builder is a design tool for creating [paginated reports](report-paginated-or-power-bi.md). Also, [third-party tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) offer extra functionality to developers that isn't available in Power BI Desktop. Because development experience differs among tools, the requirements for each specific solution should factor into your decision on which tool to use.
- **What's the desired publishing experience?** Advanced content creators and content owners might prefer to publish content by using a [third-party tool](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) (such as ALM Toolkit to compare and merge models). The requirements for each specific solution should be considered.
- **What's the preferred way to access and/or manage semantic models?** Rather than using the standard Power Query experience, advanced content creators might prefer to read and/or write to semantic models with their tool of choice by using the [XMLA endpoint](../enterprise/service-premium-connect-tools.md). The requirements for each specific solution should be considered.
- **How easily can you keep client tools updated?** Some organizations find it challenging to install frequent updates of client applications. In this case, users might prefer to use a web browser whenever possible.
- **What are the skills and expertise of the users?** There might be existing knowledge and preferences that impact which tool is selected. This choice impacts both initial development activities, and also whoever will [support users](fabric-adoption-roadmap-user-support.md) and maintain existing solutions.
- **How will versioning be managed?** Version control can be accomplished in multiple ways. When working in a client tool, self-service users might prefer to use [OneDrive or SharePoint](../create-reports/desktop-sharepoint-save-share.md#version-history), whereas more advanced users might prefer [Git integration with client tools](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools). When working in the Power BI service, [Git workspace integration](/fabric/cicd/git-integration/manage-branches#develop-using-another-workspace) is available.

> [!TIP]
> We recommend that you adopt one method of working and then consistently use that method. For example, when content creators are inconsistent about using Power BI Desktop versus the Power BI service for report creation, it becomes much harder to determine where the original report resides and who's responsible for it.

### When to use each authoring tool

The remainder of this section considers when to use the most common authoring tools.

#### Web-based authoring

The capabilities in the Power BI service for authoring and editing content are continually evolving (alongside capabilities for viewing, sharing, and distributing content). For content creators that use a non-Windows operating system (such as macOS, Linux, or Unix), web-based authoring in the Power BI service is a viable option. Web-based authoring is also useful for organizations that aren't capable of keeping Power BI Desktop updated on a timely basis.

> [!NOTE]
> Because the Power BI service is a web application, Microsoft installs all updates to ensure it's the latest version. That can be a significant advantage for busy IT teams. However, it's also important to closely [monitor](powerbi-implementation-planning-auditing-monitoring-tenant-level-monitoring.md#monitor-updates-and-fixes) when releases occur so that you're informed about feature changes.

There are some types of Power BI items that can be created in the web-based experience, such as:

- Dataflows
- Datamarts
- Paginated reports
- Power BI reports
- Dashboards
- Scorecards

A Fabric solution can be created end-to-end in a browser. The solution can include Power BI items, and also non-Power BI items (such as a lakehouse).

> [!IMPORTANT]
> When choosing to create content in the browser, it's important that you educate content creators where to save content. For example, it's easy to save a new report to a personal workspace, but that's [not always an ideal choice](powerbi-implementation-planning-workspaces-workspace-level-planning.md#appropriate-use-of-personal-workspaces). Also, it's important to consider how versioning will be handled (such as [Git integration](/fabric/cicd/git-integration/intro-to-git-integration)).

#### Power BI Desktop

Because it's a free application, Power BI Desktop is a great way for content creators to get started with developing data models and creating interactive reports. Power BI Desktop allows you to connect to many data sources, combine data from multiple data sources, clean and transform data, create a data model, add DAX calculations, and build reports within a single application. Power BI Desktop is well-suited to building _interactive reports_ with a focus on exploration.

Here are some points to consider when using Power BI Desktop.

- You can create reports within Power BI Desktop or the Power BI service. Due to this flexibility, a consistent process for how and where to develop content is necessary.
- Using version control is considered a best practice. One option for self-service content creators is to save files created by Power BI Desktop in a location with versioning enabled (such as [OneDrive or SharePoint](../create-reports/desktop-sharepoint-save-share.md#version-history)) that can be secured to authorized users. Advanced content creators might prefer to use [Git integration](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools).
- Power BI Desktop is available as a Windows desktop application. Optionally, it's possible to run Power BI Desktop in a [virtualized environment](../fundamentals/desktop-get-the-desktop.md#power-bi-desktop-in-a-virtualized-environment).
- Power BI Desktop is usually updated every month. Regular updates allow users to access new features quickly. However, rolling out frequent updates in a large organization requires planning. For more information, see [Client tools](#client-tools) later in this article.

> [!NOTE]
> There are many options and settings in Power BI Desktop that significantly affect the user experience. Not all settings can be programmatically maintained with [group policy](#group-policy-settings) or [registry](#registry-settings) settings (described later in this article). One key setting relates to preview features that users can enable in Power BI Desktop. However, preview features are subject to change, have limited support, and might not always work in the same way in the Power BI service (during the preview period).
>
> We recommend that you only use preview features to evaluate and learn new functionality. Preview features shouldn't be used for mission-critical production content.

#### Power BI Desktop for Report Server

Like the standard version of Power BI Desktop, content creators can use [Power BI Desktop for Report Server](../report-server/install-powerbi-desktop.md) to create .pbix files. It supports publishing content to Power BI Report Server. New versions align with the release cadence of Power BI Report Server, which is usually three times per year.

It's important that content creators use the correct report server version of Power BI Desktop to avoid compatibility issues after content has been published to Power BI Report Server. You can manually download and install Power BI Desktop for Report Server from the Microsoft Download Center.

For users who publish content to _both_ the Power BI service and Power BI Report Server, there are two options.

- **Option 1**: Only use Power BI Desktop for Report Server because it produces files that can be published to both the Power BI service and the report server. New authoring features will become available to users approximately every four months (to remain consistent with the Power BI Report Server release cadence).
  - **Pros**:
    - Content creators only need to use one tool.
    - Content creators are assured that the content they publish is compatible with the report server.
    - Fewer tools are simpler to manage.
  - **Cons**:
    - Some features that are only supported in the Power BI service aren't available in the Report Server version of Power BI Desktop. Therefore, content creators might find it limiting.
    - New features are slower to become available.
    - Preview features aren't available.
- **Option 2**: Run both versions—Power BI Desktop, and Power BI Desktop for Report Server—side by side.
  - **Pros**:
    - All features in standard Power BI Desktop are available to be used.
    - New features for the standard Power BI Desktop are available more quickly.
    - Preview features for the standard Power BI Desktop are available to use, at the content creator's discretion.
  - **Cons**:
    - Content creators must be prepared for complexity because they need to remember which version to use when, based on the target deployment location. The risk is that when a .pbix file from the newer version is inadvertently published to Power BI Report Server, it might not function correctly. For example, data model queries fail, data refresh fails, or reports don't render properly.
    - Content creators need to be aware of the default behavior when they directly open [.pbix files](../report-server/install-powerbi-desktop.md#file-extension-association) (instead of opening them from within Power BI Desktop).

#### Microsoft Excel

Many business users are proficient with Microsoft Excel and want to use it for data analysis by using PivotTables, charts, and slicers. There are other useful Excel features as well (such as [cube functions](https://support.microsoft.com/office/cube-functions-reference-2378132b-d3f2-4af1-896d-48a9ee840eb2)) that allow greater flexibility and formatting when designing a grid layout of values. Some content creators might also prefer to use Excel formulas for some types of calculations (instead of DAX calculations in the data model), particularly when they perform data exploration activities.

Here are several ways to efficiently use Excel with Power BI.

- **Connect Excel to a Power BI semantic model**: This capability is known as an _Excel live connection_ (when you [start from Excel](../collaborate-share/service-connect-excel-power-bi-datasets.md#discover-power-bi-semantic-models-in-excel)) or as _Analyze in Excel_ (when you [start from the Power BI service](../collaborate-share/service-analyze-in-excel.md#analyze-in-excel)). Connecting Excel to a Power BI semantic model is best suited to report creators who prefer using Excel for creating visualizations that are connected to an existing shared semantic model. The advantage of this approach is that it's a connection—rather than an export of data—so the data in the Excel workbook is [refreshable](../collaborate-share/service-analyze-power-bi-datasets-excel.md).
- **Connect Excel to featured tables in a Power BI semantic model**: If you prefer to connect Excel to a [subset of tables](../collaborate-share/service-excel-featured-tables.md) within a Power BI semantic model (rather than the entire shared semantic model), you can use [featured tables](../collaborate-share/service-create-excel-featured-tables.md). This option works well when you need to relate data that's in Excel to data that's stored in Power BI.
- **Export to Excel with a live connection**: When viewing a visual, you can [export a table of refreshable data](../collaborate-share/service-analyze-in-excel.md#export-to-excel-with-live-connection) to Excel. This technique is useful when you want to further explore the data by using a PivotTable in Excel.
- **Create an Excel data model**: The [Excel data model](https://support.microsoft.com/office/create-a-data-model-in-excel-87e7a54c-87dc-488e-9410-5c75dbcb0f7b) (formerly known as _Power Pivot_) is a native feature of Excel. It uses the same database engine as Power BI for storing imported semantic models, and the same Power Query functionality to get data. However, in Excel, the functionality is updated much less frequently than Power BI. It's useful for content creators who create [small models](../connect-data/reduce-the-size-of-an-excel-workbook.md) and have a strong preference for working in Excel. Optionally, you can import your workbook from SharePoint or OneDrive for work or business. That allows you to view the workbook in the Power BI service. Or you can create a new Power BI semantic model that's synchronized with the data in the workbook (when it's stored in OneDrive for work or school).

There are other ways to work with Excel. These options are less optimal, and so you should use them only when necessary.

- **Export to Excel**: Many users have established a habit of [exporting data](../visuals/power-bi-visualization-export-data.md) to Excel from reports or dashboards. While Power BI supports this capability, it should be used cautiously and in moderation because it results in a static set of data. To ensure that data exports to Excel aren't overused, users in the organization should be educated on the downsides of exports and administrators should track exports in the [user activity data](powerbi-implementation-planning-auditing-monitoring-tenant-level-auditing.md#user-activity-data).
- **Get source data from Excel**: Excel can be used as a [data source](../connect-data/service-excel-workbook-files.md) when importing data to Power BI. This capability works best for small projects when a user-friendly Excel-based solution is required to maintain source data. It can also be useful to quickly conduct a proof of concept (POC). However, to reduce the risk associated with Excel data sources, the source Excel file should be stored in a secure, shared location. Also, column names shouldn't be changed to ensure data refreshes succeed.

> [!TIP]
> We recommend that you primarily encourage the use of Excel as a live connection.

Here are some important points to consider when determining whether Excel is an appropriate authoring tool.

- [Certain prerequisites](../collaborate-share/service-connect-excel-power-bi-datasets.md#requirements) must be in place to allow users to connect to a Power BI semantic model from Excel.
- In some organizations, users have the 32-bit version of Excel installed rather than the 64-bit version. The 64-bit version of Excel can support larger data volumes, and generally performs better than the 32-bit version. All data providers must also align with this choice.
- Some features in Power BI Desktop aren't available in the Excel data model, or they're released on a significantly slower cadence. Therefore, complex modeling requirements might not be (easily) possible in Excel.
- Some connectors and data sources that are available in Power BI Desktop aren't available in Excel.

> [!TIP]
> Many organizations have existing Excel solutions that can be modernized by connecting the Excel file to a Power BI shared semantic model (rather than using a data export). Live connectivity saves users from repeating tedious steps, prevents data from becoming stale, and ensures data security is consistently applied when users refresh the Excel data.

#### Power BI Report Builder

[Power BI Report Builder](../paginated-reports/report-builder-power-bi.md) is a tool for creating a paginated report (.rdl) file. Paginated reports can be deployed to either the Power BI service or Power BI Report Server. If you have experience creating reports in SQL Server Reporting Services (SSRS), you'll find it's a similar report creation experience.

Paginated reports are best suited to highly formatted, or print-ready, reports such as financial statements. They're also suitable for reports that are intended to be printed or for PDF generation, and when user input (with report parameters) is required.

> [!TIP]
> For other scenarios that favor choosing paginated reports, see [When to use paginated reports in Power BI](report-paginated-or-power-bi.md).

Here are some important points to consider when deciding on using Power BI Report Builder.

- Approach working in Power BI Report Builder with a different mindset than when you work in Power BI Desktop. A paginated report always focuses on the creation of one individual report (conversely, a semantic model created in Power BI Desktop can serve many different reports).
- Developing paginated reports involves more skill than creating Power BI reports. However, the main benefit is fine-grained control over data retrieval, layout, and placement.
- A paginated report is concerned with both data retrieval and layout. You're required to develop a query (known as a _dataset_) to retrieve data from an external data source, which might involve writing a native query statement (in DAX, T-SQL, or other language). The dataset belongs to one report, so it can't be published and used by other paginated reports.
- Report consumers become accustomed to the built-in interactivity of Power BI reports. However, report interactivity isn't a strength of paginated reports. Attempting to achieve similar interactivity in paginated reports can be challenging or impossible.
- If you need to access data by using a database stored procedure (such as an Azure SQL Database stored procedure), that's possible with paginated reports.
- There are some [feature differences](../paginated-reports/paginated-reports-faq.yml#what-paginated-report-features-in-ssrs-aren-t-yet-supported-in-power-bi-) and unsupported capabilities depending on whether the paginated report is published to the Power BI service or Power BI Report Server. We recommend that you conduct a proof of concept to determine what's possible for your target environment.

> [!TIP]
> For more information, see [Paginated reports in Power BI FAQ](../paginated-reports/paginated-reports-faq.yml) and [Design tips for reports in Power BI Report Builder](../paginated-reports/report-builder-design-tips.md).

#### Third-party tools

Advanced content creators can choose to use third-party tools, especially for enterprise-scale operations. They can use third-party tools to develop, publish, manage, and optimize data models. The goal of these tools is to broaden the development and management capabilities available to semantic model creators. Common examples of [third-party tools](../enterprise/service-premium-connect-tools.md#client-applications-and-tools) include Tabular Editor, DAX Studio, and ALM Toolkit. For more information, see the [advanced data model management](powerbi-implementation-planning-usage-scenario-advanced-data-model-management.md#tabular-editor) usage scenario.

> [!NOTE]
> The use of third-party tools has become prevalent in the global Power BI community, especially by advanced content creators, developers, and IT professionals.

There are three main ways to use third-party tools for semantic model development and management.

- **Use an external tool to connect to a local data model in Power BI Desktop**: Some third-party tools can connect to the data model in an open Power BI Desktop file. When registered with Power BI Desktop, these tools are known as external tools and extend the native capabilities of Power BI Desktop.
- **Use the XMLA endpoint to connect to a remote data model in the Power BI service**: Some third-party tools can use the _[XML for Analysis (XMLA)](/analysis-services/xmla/xml-for-analysis-xmla-reference)_ protocol to connect to a semantic model that's been published to the Power BI service. Tools that are compliant with the XMLA protocol use Microsoft [client libraries](../enterprise/service-premium-connect-tools.md#client-libraries) to read and/or write data to a data model by using [Tabular Object Model (TOM)](/analysis-services/tom/tom-pbi-datasets) operations.
- **Use a template file to connect to a local data model in Power BI Desktop**: Some third-party tools distribute their functionality in a lightweight way by using a Power BI Desktop template (.pbit) file.

Some third-party tools are proprietary and require a paid license (such as Tabular Editor 3). Other community tools are free and open source (such as Tabular Editor 2, DAX Studio, and ALM Toolkit). We recommend that you carefully evaluate the features of each tool, cost, and its support model so you can sufficiently support your content creators.

> [!TIP]
> Some organizations find it easier to get a new tool approved that's fully supported (even when there's a licensing cost). However, other organizations find it easier to get a free open-source tool approved. Your IT department can provide guidance and help you do the necessary due diligence.

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When planning for authoring tools, key decisions and actions include:

> [!div class="checklist"]
> - **Decide which authoring tools to encourage**: For self-service creators and advanced content creators, consider which of the available tools will be actively promoted for use in the organization.
> - **Decide which authoring tools will be supported**: For self-service creators and advanced content creators, consider which of the available tools will be supported and by whom.
> - **Evaluate the use of third-party tools**: Consider which third-party tools will be allowed or encouraged for advanced content creators. Investigate the privacy policy, licensing cost, and the support model.
> - **Create guidance for content creators**: Provide guidance and training to help users choose and use the appropriate authoring tool for their circumstances.

## Manage and set up devices

This section describes considerations for installing and updating tools and applications and setting up user devices.

### Client tools

IT often uses the term _client tools_ to refer to software that's installed on client machines (user devices). The most common Power BI software installed on a user device is Power BI Desktop.

Because Microsoft usually updates Power BI Desktop every month, it's important to have a seamless process for managing installations and updates.

Here are several ways that organizations can manage [installations and updates of Power BI Desktop](../fundamentals/desktop-get-the-desktop.md#minimum-requirements).

| Type of installation | Supports automatic updates | Description |
| --- | --- | --- |
| Microsoft Store | Yes | Power BI Desktop is distributed from the [Microsoft Store](https://www.microsoft.com/store). All updates, including bug fixes, are automatically installed. This option is an easy and seamless approach, provided that your organization doesn't block some (or all) apps from the Microsoft Store for some (or all) users. |
| Manual installation | No | You can manually download and install an executable (.exe) file from the [Microsoft Download Center](https://aka.ms/pbiSingleInstaller). However, be aware that the user who installs the software must have local administrator rights—in most organizations, those rights are restricted. If you choose to use this approach (and it isn't managed by IT), there's a risk that users will end up with different versions of Power BI Desktop installed, possibly resulting in compatibility issues. Also, with this approach, every user will need to be notified to install quick fix engineering (QFE) releases, also known as _bug fixes_, when they come out. |
| IT-managed systems | Depends upon the setup | You can use a variety of IT-managed organizational deployment methods, like Microsoft System Center or Microsoft Application Virtualization (App-V). This option is best suited for organizations that need to manage many installations at scale or in a customized way. |

It's important that user devices have adequate system resources. To be productive, content creators who work with large data volumes might need system resources that exceed the [minimum requirements](../fundamentals/desktop-get-the-desktop.md#minimum-requirements)—especially memory (RAM) and CPU. IT might have suggested machine specifications based on their experience with other content creators.

All content creators collaborating on Power BI development should use the same version of the software—especially Power BI Desktop, which is usually updated every month. We recommend that you make updates automatically available to users because:

- Multiple content creators who collaborate on a Power BI Desktop file are assured of being on the same version. It's essential that creators who work together on the same .pbix file use the same software version.
- Users won't have to take any specific action to obtain updates.
- Users can take advantage of new capabilities, and their experience is aligned to announcements and documentation. It can impact adoption and user satisfaction when content creators learn about new capabilities and features, yet they experience long delays between software updates.
- Only the latest version of Power BI Desktop is supported by Microsoft. If a user has an issue and files a support ticket, they'll be asked by Microsoft support to upgrade their software to the latest version.

In addition to Power BI Desktop (described previously), you might need to install and manage other Microsoft tools or third-party tools on user devices, including mobile devices. For a list of possible tools, see [Available tools for authoring](#available-tools-for-authoring) earlier in this article.

Users who create and manage files located in Fabric OneLake might also benefit from [OneLake File Explorer](/fabric/onelake/onelake-file-explorer). This tool allows them to conveniently upload, download, edit, or delete files in OneLake by using Windows file explorer.

> [!NOTE]
> Your IT department might have managed device policies in place. These policies could control what software can be installed, and how it's managed.

### Client tool prerequisites

Content creators that have client tools installed, such as Power BI Desktop, might require specific prerequisite software or packages.

- **WebView2**: (Mandatory) For content creators running Power BI Desktop, the [Microsoft Edge WebView2 Runtime](../fundamentals/desktop-get-the-desktop.md#minimum-requirements) is a prerequisite. WebView2 allows the embedding of web technologies (such as HTML, CSS, and JavaScript) in Power BI Desktop in a secure way. WebView2 will already be installed if the user device has the latest version of Windows or has Microsoft 365 applications installed and monthly updates are enabled.
- **.NET Framework**: (Mandatory) For content creators running Power BI Desktop or a third-party tool, the [.NET Framework](/dotnet/framework/get-started/overview) is a prerequisite. The .NET Framework is a technology that supports building and running Windows apps. Power BI Desktop requires a [specific version, or later](../fundamentals/desktop-get-the-desktop.md#minimum-requirements).
- **Microsoft Edge**: (Mandatory) For content creators running Power BI Desktop, the [Edge browser](../fundamentals/desktop-get-the-desktop.md#minimum-requirements) is a prerequisite.
- **Python and R packages**: (Optional) Python and R scripts can be used in multiple ways with Power BI, when enabled by the [tenant setting](../admin/service-admin-portal-r-python-visuals.md). Scripts can be used to create [Python visuals](../connect-data/desktop-python-visuals.md) or [R visuals](../visuals/service-r-visuals.md). Scripts can also be created in the Query Editor; in this case, a personal gateway is required because Python and R are [not supported](../connect-data/desktop-python-in-query-editor.md#considerations-and-limitations) in the standard data gateway. [Python packages](../connect-data/service-python-packages-support.md) or [R packages](../connect-data/service-r-packages-support.md) are a prerequisite. To avoid incompatibilities, IT should manage which packages get installed, where they're installed, and that the versions installed match what's supported in the Power BI service.

### Data connectivity components

Depending on your data sources, you might need to install drivers, connectors, or providers on user devices. These components enable data connectivity when a user works in a client tool (such as Power BI Desktop) or a third-party tool.

- **Drivers**: A _driver_ is a software component that connects to other systems. For example, to connect to an [Oracle](/power-query/connectors/oracle-database#prerequisites) database, you might need the Oracle Data Access Client software. Or, to connect to [SAP HANA](/power-query/connectors/sap-hana/overview#prerequisites), you might need an ODBC driver.
- **Custom connectors**: A [custom data source connector](../connect-data/desktop-connector-extensibility.md) might be required when connecting to a legacy or proprietary system.
- **Excel provider**: The [Analyze in Excel](../collaborate-share/service-connect-power-bi-datasets-excel.md) provider allows users to create visualizations in Excel while connected to an existing shared semantic model that's been published to the Power BI service.
- **Analysis Services client libraries**: When connecting to an Analysis Services source, a [client library](/analysis-services/client-libraries) needs to be installed.
- **Access Database OLE DB provider**: When connecting to an Access database, an [OLE DB provider](/power-query/connectors/access-database#prerequisites) needs to be installed.

> [!IMPORTANT]
> For data sources that require connectivity through a gateway, the same drivers, connectors, and providers will need to be installed on each [data gateway](/power-platform/admin/wp-onpremises-gateway) machine. Missing components on a data gateway are a common reason for data refresh failures once content has been published to the Power BI service.

> [!TIP]
> To simplify delivery to a larger number of users, many IT teams deploy the most common drivers, connectors, and providers as part of a standard user device setup.

### Version control tools

Content creators that have client tools installed, such as Power BI Desktop, should also have a way to save _versions_, or historical copies, of files. Access to previous versions is particularly helpful when a change needs to be rolled back.

There are two main ways to handle versioning of development files.

- **Teams, OneDrive for Business, SharePoint**: Self-service content creators often [save files](../create-reports/desktop-sharepoint-save-share.md) in Teams, OneDrive for work or school, or SharePoint. Users find these tools are familiar and simple to use. Shared libraries can be organized, secured for appropriate coworkers, and versioning is built in.
- **Source control plug-ins**: Advanced content creators might need to integrate with a source control tool. For example, this typically involves installing [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for source control, then using a source control management tool like [Visual Studio Code](/training/modules/work-source-control-git/) to commit content changes to a remote repository, such as [Azure DevOps Repos](/azure/devops/repos/get-started/what-is-repos). For Power BI Desktop, [developer mode](../developer/projects/projects-overview.md) can be used. In this mode, content is saved as a Power BI project (.pbip) file, which is compatible for use with your preferred source control system. When working with Fabric, [Git integration](/fabric/cicd/git-integration/manage-branches#develop-using-client-tools) is supported for working with a client tool.

For more information, see [Strategy for file locations](powerbi-implementation-planning-security-tenant-level-planning.md#strategy-for-file-locations).

### Custom visuals

Power BI custom visuals, which developers can create by using the [Power BI visuals SDK](https://powerbi.microsoft.com/developers/custom-visualization/), allow Power BI report creators to work beyond the built-in core visuals. A custom visual can be created and released by Microsoft, software developers, vendors, or partners.

To use a custom visual in Power BI Desktop, it must first be installed on the machine of the content creator. There are several ways to distribute visuals to users.

- **AppSource**: [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) is a marketplace for applications, add-ins, and extensions for Microsoft software. Visuals are distributed in AppSource using a Power BI visual (.pbiviz) file. A visual might be distributed [freely or requires a license](../developer/visuals/power-bi-custom-visuals.md#download-from-appsource).
  - **Advantages**:
    - It's simple for users to search for, and locate, visuals in AppSource.
    - All reports and dashboards are automatically updated to use the latest version of custom visuals that have been sourced from AppSource.
    - Supports the use of [certified visuals](../developer/visuals/power-bi-custom-visuals-faq.yml#certified-power-bi-visuals).
    - Microsoft performs [basic validations](/legal/marketplace/certification-policies#1180-power-bi-visuals) of visuals published to AppSource. The extent of the review depends on whether the visual is [certified](../developer/visuals/power-bi-custom-visuals-certified.md) or not.
  - **Potential disadvantages**:
    - When each content creator downloads what they need from AppSource, it can lead to incompatibilities when users have different versions installed.
    - A content creator might download a visual that hasn't yet been tested or approved for use in the organization.
    - The developer of the visual needs to follow a strict [publishing process](../developer/visuals/office-store.md). Although it strengthens security and improves stability, the process can make it challenging to release a bug fix quickly,
- **Import a visual file**: A content creator can [import a visual file](../developer/visuals/import-visual.md#import-a-visual-file-from-your-local-computer-into-power-bi) into Power BI Desktop.
  - **Advantages**:
    - Visuals that are available publicly, or privately distributed, can be installed. That includes internally developed visuals or proprietary visuals purchased from a vendor.
    - Allows a way to obtain a visual file outside of AppSource.
  - **Potential disadvantages**:
    - Without a centralized system, it can be difficult for content creators to know what visuals have been approved for use in the organization.
    - When each content creator imports the visual file they have, it can lead to incompatibilities when users have different versions installed.
    - Updates aren't automatically propagated to user devices. Reports in local Power BI Desktop files aren't updated until each user updates their visual files.
    - Doesn't support the use of certified visuals.
- **Organizational visuals**: The [organizational visuals](../developer/visuals/power-bi-custom-visuals-organization.md) repository is a centralized area in the Fabric admin portal for managing visuals.
  - **Advantages**:
    - Content creators don't have to manage visual files. Instead, a Fabric administrator centrally manages the version of a visual that's available for all users. Version consistency is ensured for all users and all reports.
    - Visuals that are available publicly or privately distributed can be installed. That includes internally developed visuals or proprietary visuals purchased from a vendor.
    - Visuals can be tested and pre-approved for use in the organization. This verification process reduces the risk that non-approved visuals are used. It also allows greater flexibility for setting which specific version of a visual is approved for use.
    - All reports and dashboards are automatically updated to use the latest version (when a visual file is updated in the admin portal or made available in AppSource).
    - If a visual that's currently in use by the organization is deemed to be no longer trustworthy, it can be disabled or deleted from the organizational visuals repository. In this case, the visual won't be rendered in reports and dashboards.
    - Allows the use of non-certified visuals from AppSource. That's useful when you've set the tenant setting to block uncertified visuals, yet a specific non-certified visual has been validated and approved for use in the organization.
  - **Potential disadvantages**:
    - Organizational visuals need to be managed centrally by a Fabric administrator.
    - Centralization correlates to reduced user flexibility and the potential for delays in updating the version of a visual.
    - [Some features](../developer/visuals/power-bi-custom-visuals-organization.md#user-considerations) aren't available when a visual isn't certified (which requires importing from AppSource).

> [!IMPORTANT]
> If your organization is highly concerned about data privacy and data leakage, consider governing all custom visuals through the organizational visuals repository.

> [!TIP]
> How you distribute custom visuals is a [governance](fabric-adoption-roadmap-governance.md) consideration. We recommend that you carefully evaluate the features of each visual, considering its cost and support model so you can sufficiently support your content creators.
>
> Also, before you approve the use of a new custom visual, it's critical that you evaluate any security and data privacy risks because:
>
> - Visuals execute JavaScript code and have access to the data that they visualize.
> - Visuals can transmit data to an external service. For example, a visual might need to transmit data to an API to run an AI algorithm or to render a map. Just because a visual transmits data to an external service, it doesn't mean it's untrustworthy. A visual that transmits data can't be certified.

For more information, see [Govern organizational visuals](powerbi-implementation-planning-tenant-administration.md#govern-organizational-visuals).

### Group policy settings

[Group policy](/azure/active-directory-domain-services/manage-group-policy) provides centralized management and configuration of operating systems, applications, and user settings of Windows machines and the network environment. It helps IT roll out and manage consistent user accounts and machine settings. For Power BI Desktop, the most common use of group policy is to manage custom visuals (described in the previous section).

You can specify whether [uncertified visuals](../admin/organizational-visuals.md#certified-power-bi-visuals) are allowed or blocked in Power BI Desktop. To ensure users have a consistent experience in both Power BI Desktop and the Power BI service, it's important that custom visuals be managed consistently in two places.

- **Tenant setting**: The _Add and use certified visuals only (block uncertified)_ tenant setting allows or blocks using custom visuals when users create or edit reports in the Power BI service.

- **Group policy**: The group policy setting controls the use of custom visuals when users create or edit reports in Power BI Desktop. If a content creator spent considerable time creating content in Power BI Desktop that can't be displayed in the Power BI service (due to a misaligned tenant setting), it would result in a significant amount of user frustration. That's why it's important to keep them both aligned.

You can also use group policy to specify whether [data exports](../admin/organizational-visuals.md#export-data-to-file) are allowed or blocked from custom visuals.

### Registry settings

The Windows operating system stores machine information, settings, and options in the [Windows registry](/troubleshoot/windows-server/performance/windows-registry-advanced-users). For Power BI Desktop, registry settings can be set to customize user machines. Registry settings can be updated by group policy, which helps IT set up default settings that are consistent for all users (or groups of users).

Here are several common uses of registry settings related to Power BI Desktop.

- Disable [notifications](../fundamentals/desktop-get-the-desktop.md#disable-notifications) that a software update is available. That's useful when you're certain that IT will obtain the Power BI Desktop update, perform validations, and then push updates to user devices through their normal process.
- Set the global [privacy level](../enterprise/desktop-privacy-levels.md). It's wise to set this setting to _Organizational_ as the default because it can help to avoid data privacy violations when different data sources are merged.
- Disable the Power BI Desktop [sign-in form](../enterprise/desktop-admin-sign-in-form.md). Disabling the form is useful when organizational machines are automatically signed in. In this case, the user doesn't ever need to be prompted.
- Tune [Query Editor performance](../create-reports/desktop-evaluation-configuration.md). This setting is useful when you need to influence query execution behavior by changing defaults.
- Disable the [external tools](../transform-model/desktop-external-tools.md#disabling-the-external-tools-ribbon) ribbon tab. You might disable the ribbon tab when you know you can't approve or support the use of external tools.

> [!TIP]
> Usually, the goal isn't to significantly limit what users can do with tools. Rather, it's about improving the user experience and reducing support needs.

### Mobile device management

Many users like to interact with Power BI content on a mobile device, such as a tablet or a phone, whether they're at home or traveling. The [Power BI mobile apps](../consumer/mobile/mobile-apps-for-mobile-devices.md) for iOS, Android, and Windows are primarily designed for smaller form factors and touch screens. They make it easier to interact with content that's been published to the Power BI service or Power BI Report Server.

You can specify app protection policies and device protection policies for managed and unmanaged devices by using [Microsoft Intune](../enterprise/service-admin-mobile-intune.md). Intune is a software service that provides mobile device and application management, and it supports mobile application management (MAM) policies. Policies can be set at various [levels of protection](/mem/intune/apps/app-protection-policy#app-protection-policy-data-protection-framework).

Optionally, a mobile device management (MDM) solution from Microsoft 365, or a third party, might also be used to [customize](../consumer/mobile/mobile-app-configuration.md) the behavior of Power BI mobile apps. The Power BI app for Windows also supports [Windows Information Protection (WIP)](/windows/security/information-protection/windows-information-protection/protect-enterprise-data-using-wip).

Here are several ways that you might choose to use MAM and MDM policies.

- Specify data protection settings.
- Encrypt application data when the app isn't in use.
- Selectively wipe data when a device if it gets lost.
- Prevent saving of data to a personal storage location.
- Restrict actions to cut, copy, and paste.
- Prevent printing of organizational data.
- Require biometric data, or an access PIN, to open the mobile app.
- Specify the default behavior when a user selects or taps in a mobile app.

For more information about securing devices and data, see the [Power BI security whitepaper](whitepaper-powerbi-security.md#power-bi-mobile).

:::image type="icon" source="media/common/checklist.svg" border="false":::

**Checklist** - When managing devices, key decisions and actions include:

> [!div class="checklist"]
> - **Determine how Power BI Desktop will be updated**: Consider how to install Power BI Desktop (and other client tools). Whenever possible, ensure that updates are automatically installed.
> - **Identify the necessary client tool prerequisites**: Ensure that all prerequisite software and packages are installed and updated regularly.
> - **Identify the necessary data connectivity components**: Ensure that all drivers, connectors, and providers that are required for data connectivity are installed and updated regularly.
> - **Determine how to handle custom visuals**: Decide how custom visuals will be handled from AppSource and other sources. Set the _Allow visuals created from the Power BI SDK_ tenant setting and the _Add and use certified visuals only_ tenant setting to align with your decisions. Consider creating a process that allows users to request a new custom visual.
> - **Set up group policy settings**: Set up group policy to ensure that custom visuals are managed the same way in Power BI Desktop as they are in the Power BI service.
> - **Set up registry settings**: Set up the registry settings to customize user machines, when applicable.
> - **Investigate mobile device management**: Consider using app protection policies and device protection policies for mobile devices, when appropriate.

## Related content

For more considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see [Power BI implementation planning](powerbi-implementation-planning-introduction.md#subject-areas).
