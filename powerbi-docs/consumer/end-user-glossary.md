---
title: Glossary for Power BI business users
description: Learn Power BI terminology with this glossary, which provides definitions to help you understand and navigate through the library of articles.
author: kfollis
ms.author: kfollis
services: power-bi
ms.reviewer: kfollis
ms.service: powerbi
ms.subservice: pbi-explore
ms.topic: conceptual
ms.date: 11/13/2024
#Consumer customers commonly ask for help with terminology, so this article provides a one-stop shop to look up definitions for unfamiliar terms so that the consumer understands the actions they're reading about or performing and they don't get confused or frustrated and instead get the result they expect.
---

# Glossary for business users of the Power BI service

The Power BI service can introduce terminology that is unfamiliar or confusing. The glossary is a great place to look up terminology&mdash;you might want to bookmark it. Another great resource for learning about the building blocks that make up Power BI service is [Basic concepts for the Power BI service business user](end-user-basic-concepts.md). The article gives a high level overview of the Power BI *pieces* and how they're connected.

This glossary is a community effort. If you don't see a word here, ask us to add it (you can use the documentation feedback button at the bottom of this article).

## A

### account

Use your work or school account to sign in to Power BI. Administrators manage work or school accounts in Microsoft Entra ID. Your level of access is determined by the Power BI license associated with that account and the capacity type where content is stored. See *license* and *Premium*.

### Admin portal

The location where Power BI admins manage users, features, and settings for Power BI in their organization.

  > [!NOTE]
  > Microsoft 365, Azure, and PowerApps use Admin center.)

### aggregates

When the values of multiple rows are grouped together as input on criteria to form a single value of more significant meaning or measurement. Only implicit measures (see definition) can be aggregated.

### aggregation

The reduction of rows in underlying data sources to fit in a model. The result is an aggregate.

### alert, alerts

A feature that notifies users of changes in the data based on limits they set. Alerts can be set on tiles pinned from report visuals. Users receive alerts on the service and on their mobile app.

### annotate

To write lines, text, or stamps on a snapshot copy of a tile, report, or visual on the Power BI mobile app for iOS and Android devices.

### app, apps

A bundle of dashboards, reports, and semantic models. It also refers to the mobile apps for consuming content, such as the Power BI app for iOS.

### AppSource

Centralized online repository where you can browse and discover dashboards, reports, semantic models, and apps to download.

### ArcGIS for Power BI**

ArcGIS is a mapping and analytics platform created by the company Esri. The name of the visual included in the Power BI visuals library is called ArcGIS for Power BI.

### Auto Insights**

Auto Insights are now called *Quick Insights*.

## B

### BI

Business intelligence.

### bookmark

A view of data captured in the Bookmarks pane of a report in Power BI Desktop or service. In Desktop, the bookmarks are saved in the *pbix* report file for sharing on the Power BI service.
  
### breadcrumbs

The navigation at the top left to quickly navigate between reports and dashboards.

## C

### calculation

A mathematical determination of the size or number of something.

### capacity

[Power BI Premium] Data models running on hardware fully managed by Microsoft in Microsoft cloud data centers to help ensure consistent performance at scale. BI solutions are delivered to the entire organization regardless of Power BI license.

### card (visual type)

A Power BI [visualization type](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md).

### card (Power BI Home)

Power BI Home displays rectangular and square pictures that represent dashboards, reports, apps, and more. These pictures are referred to as *cards*.

### certified custom visual

A Power BI custom visual that met requirements and passed strict security testing.

### connect live

A method of connecting to SQL Server Analysis Services data models. Also called a live connection.

### connector

Power BI Desktop includes an ever-growing collection of data connectors that are built to connect to a specific data source. Examples include: GitHub, MailChimp, Power BI dataflows, Google Analytics, Python, SQL Server, Zendesk, and more than 100 other data sources.

### container

The areas on the navigation pane are *containers*. In the nav pane, you find containers for: Browse, Data hub, Apps, Metrics, Deployment pipelines, Learn, Workspaces, and Home.

### content

Content for the Power BI service is generally dashboards, reports, and apps. It can also include workbooks and semantic models.

### content list

The content index for an app.

### content view

The view that lists Power BI content you created or content that designers shared with you.

### continuous variable

A continuous variable can be any value between its minimum and maximum limits, otherwise it's a discrete variable. Examples are temperature, weight, age, and time. Continuous variables can include fractions or portions of the value. The total number of blue skateboards sold is a discrete variable since we can't sell half a skateboard.

### correlation

A correlation tells us how the behavior of things is related. If their patterns of increase and decrease are similar, then they're positively correlated. And if their patterns are opposite, then they're negatively correlated. For example, if sales of our red skateboard increase each time we run a TV marketing campaign, then sales of the red skateboard and the TV campaign are positively correlated.

### cross-filter

Applies to visual interactions. Cross-filtering removes data that doesn't apply. For example, selecting **Moderation** in the doughnut chart cross-filters the line chart. The line chart now displays only data points that apply to the Moderation segment.

### cross-highlight

Applies to visual interactions. Cross-highlighting retains all the original data points but dims the portion that doesn't apply to your selection. For example, selecting **Moderation** in the doughnut chart cross-highlights the column chart. The column chart dims all the data that doesn't apply to the Moderation segment, and highlights all the data that does apply to the Moderation segment.

### custom visual

Visuals that the community and Microsoft create. They can be downloaded from the Microsoft Store for use in Power BI reports.

## D

### dashboard

In the Power BI service, a dashboard is a single page, often called a canvas that uses visualizations to tell a story. Because it's limited to one page, a well-designed dashboard contains only the most important elements of that story. Dashboards can be created and viewed only in the Power BI service, not in Power BI Desktop. For more information, see [Basic concepts for the Power BI service business user](end-user-basic-concepts.md).

### data connector

See *connectors*.

**data intersections**

Data intersections are the common points where different sets of data overlap.  For example, if you have a list of customers who bought laptops and another list of customers who bought tablets, the intersection would be the customers who bought both laptops and tablets.

**data model, Excel data model**

In Power BI content, a data model refers to a map of data structures in a table format. The data model shows the relationships that are being used to build databases. Report designers, administrators, and developers create and work with data models to create Power BI content.

### dataflow

Dataflows ingest, transform, integrate, and enrich big data by defining data source connections, Extract Transform Load (ETL) logic, refresh schedules, and more. Formerly called "data pool."

### dataset

Refer to **semantic model**.

### diamond

Power BI Premium. The shape of the icon that signifies a workspace is a Premium capacity workspace.

### dimension

Dimensions are categorical (text) data. A dimension describes a person, object, item, product, place, and time. In a semantic model, dimensions are a way to group *measures* into useful categories. For our skateboard company, some dimensions might include looking at sales (a measure) by model, color, country/region, or marketing campaign.

*###  up, drill down, drillthrough

In Power BI, "drill down" and "drill up" refer to the ability to explore the next level of detail in a report or visual.
"Drill through" refers to the ability to select a part of a visual and be taken to another page in the report, filtered to the data that relates to the part of the visual you selected on the original page.
Drill to details commonly means to show the underlying records.

## E

### Editing view

The mode in which report *designers* can explore, design, build, and share a report.

### ellipsis

(...) menu. Selecting an ellipsis displays the menu options. Also referred to as the **More actions** or **More options** menu, depending on the menu options.

### embed code

A common standard across the internet. In Power BI, the customer can generate an embed code and copy it to place content such as a report visual on a website or blog.

### embedded

See *Power BI Embedded*.

### embedding

In the Power BI developer offering, the process of integrating analytics into apps using the Power BI REST APIs and the Power BI SDK.

### environment

[Power BI Desktop, Power BI Mobile, the Power BI service, and others] Another way to refer to one of the Power BI tools. It's OK to use Power BI environment (tenant) in documentation where it might help business analysts who are familiar with the term tenant to know it's the same thing.

### Explicit measures

Power BI uses explicit measures and implicit measures (see definition). Explicit measures are created by report designers and saved with the semantic model. They're displayed in Power BI as fields, and can therefore be used over and over. For example, a report designer creates an explicit measure *TotalInvoice* that sums all invoice amounts. Colleagues who use that semantic model, and who have edit access to the report, can select that field and use it to create a visual. When an explicit measure is added or dragged onto a report canvas, Power BI doesn't apply an aggregation. Creating explicit measures requires edit access to the semantic model.

## F

### favorite, unfavorite

Verb meaning to add to the Favorites list for quick access to frequently visited dashboards and reports in Power BI. When you no longer want them as a favorite, you unfavorite them.

### filter versus **highlight**

A filter removes data that doesn't apply. A highlight grays out the data that doesn't apply.

### focus mode

Use focus mode to pop out a visual or tile to see more detail. You can still interact with the visual or tile while in focus mode.

### free account

See *account*.

### full screen, full-screen mode

Use full screen mode to view Power BI content without the distraction of menus and navigation panes. Full screen is sometimes referred to as TV mode.

## G

### gateways or **on-premises data gateways**

A bridge to underlying data sources. It provides quick and secure data transfer between the Power BI service and on-premises data sources that support refresh. Usually managed by IT.

## H

**high-density visuals

Visuals with more data points than Power BI can render. Power BI samples the data to show the shape and outliers.

### Home

The default landing age for Power BI service users. Doesn't modify anything. Can be called Power BI Home or simply Home.

## I

### implicit measures

Power BI uses implicit measures and explicit measures (see definition). Implicit measures are created dynamically. For example, when you drag a field onto the report canvas to create a visual. Power BI automatically aggregates the value using one of the built-in standard aggregations (SUM, COUNT, MIN, AVG, and others). Creating implicit measures requires edit access to the report.

### insights

See *quick insights*.

## J

## K

### KPIs

Key performance indicators. A type of visual.

## L

### left navigation (left nav)

This term was replaced with *nav pane* but might still appear in some documentation.
The controls along the left edge of Power BI service.
First instance: navigation pane. Subsequent mentions or tight spaces: nav pane.

### license

Your level of access is determined by the Power BI license associated with your account and the capacity type where content is stored. For example, in shared capacity, a user with a Power BI Pro license can collaborate only with users who are also assigned a Pro license. In shared capacity, a free license enables access to only the user’s personal workspace. However, when content is in Premium capacity, users with a Pro license can share that content with users who are assigned a free license.
A license is assigned to a user and can be a free, Power BI Premium Per User(PPU) Pro license. Depending on how the license was acquired, it might be paid or unpaid. The accounts are either per-user or organizational. Per-user accounts are available as *free*, *PPU*, or *Pro*. A Power BI *free* user is either using stand-alone Power BI Desktop or the Power BI service. The Power BI per-user *Pro* account is a paid monthly subscription that allows for collaboration and sharing of content with other *Pro* users.
The organizational *Premium* (also known as *Premium capacity*) subscription adds a layer of features on top of per-user licenses. For example, *free* per-user account holders within an organization that has a *Premium* subscription, are able to do more with Power BI than *free* users without *Premium*. For example, *free* users in *Premium* organizational accounts, can collaborate with colleagues and can view content hosted on Power BI Premium capacity.

### list page or **content list**

One of the section pages for the elements in the nav pane. For example, Create, Data hub, or My workspace.

## M

### measure

A measure is a quantitative (numeric) field that can be used to do calculations. Common calculations are sum, average, and minimum. For example, if our company makes and sells skateboards, our measures might be number of skateboards sold and average profit per year.

### Microsoft R (R)

R is a programming language and software environment for statistical computing and graphics.

### mobile app

Apps that allow you to run Power BI on iOS, Android, and Windows mobile devices.

### modeling

[Power BI Desktop] Getting the connected data ready for use in Power BI. "Getting the data ready" includes creating relationships between tables in multiple data sources, creating measures, and assigning metrics.

### My workspace

The workspace for each Power BI customer to use to create content. If they want to bundle anything created here into an app, and they have *designer* permissions, they upload it to the appropriate workspace or create a new one.

## N

### native

Included with the product. For example, Power BI comes with a set of *native* visualization types. But you can also import other types, such as Power BI visuals.

### navigation pane or **nav pane**

The controls along the left edge of the Power BI service.
First instance: navigation pane. Subsequent mentions or tight spaces: nav pane.

### notification

Messages sent by and to the Power BI Notification center.  

### Notification center

The location in the service where messages are delivered to users, such as notice of sunsetting certain features.

## O

### OneDrive for work or school vs **OneDrive**

OneDrive is a personal account and OneDrive for work or school is for work accounts.  

### on-premises

The term used to distinguish local computing (in which computing resources are located on a customer's own facilities) from cloud computing.

### on-premises data gateways

See *gateways or on-premises data gateways*.

## P

### PaaS

Platform as a service, for example, Power BI Embedded.

### page

Reports have one or more pages. Each tab on the report canvas represents a page.

### paginated reports

Paginated reports are designed to be printed or shared. They're called *paginated* because they're formatted to fit well on a page. They display all the data in a table, even if the table spans multiple pages. You can control their report page layout exactly. Power BI Report Builder is the standalone tool for authoring paginated reports.

### pbiviz

The file extension for a Power BI custom visual.

### pbix

The file extension for a Power BI Desktop file (letters pronounced individually as P-B-I-X).

### permissions

What a user can and can't do in Power BI is based on permissions. As a *consumer* you don't have the same permissions as a *designer*, *administrator*, or *developer*.

### phone report

The name for a Power BI report formatted for viewing on a phone.

### phone view

The user interface in the Power BI service for laying out a phone report.

### pin, unpin

The action a report *designer* takes when placing a visual, usually from a report, onto a dashboard.

### Power BI, **Power BI service**, **Power BI Desktop**, **Power BI mobile**

Some of the Power BI offerings. *Power BI* is the general term. It can be used in place of a full product name, such as *Power BI service* and *Power BI mobile*.

### Power BI Desktop

Also referred to as *Desktop*. The free Windows application of Power BI you can install on your local computer that lets you connect to, transform, and visualize your data. Used by report designers and admins. For more information, see [What is Power BI](../fundamentals/power-bi-overview.md).

### Power BI Embedded

A product used by developers to embed Power BI dashboards and reports into their own apps, sites, and tools.

### Power BI Premium

An add-on to the Power BI Pro license that enables organizations to predictably scale BI solutions through the purchasing of reserved hardware in the Microsoft cloud. See *account* and *license*.

### Power BI Pro

A monthly per-user license that provides the ability to build reports and dashboards, collaborate on shared data, keep data up-to-date automatically, audit and govern how data is accessed and used, and the ability to package content to distribute (Power BI apps). See *account* and *license*.

### Power BI Report Builder

It's a free, standalone Windows Desktop application used for authoring paginated reports. Used by report designers. For more information, see [Power BI Report Builder](../paginated-reports/report-builder-power-bi.md). Power BI Report Builder can be downloaded from the Power BI site.

### Power BI Report Server

An on-premises report server with a web portal in which you display and manage reports and KPIs. It allows organizations to build distributed, hybrid BI systems (a mix of cloud and on-premises deployments).

### Power BI service

An online SaaS (software as a service). For more information, see [What is Power BI](../fundamentals/power-bi-overview.md).

### Premium workspace

A workspace running in a capacity, signified to customers by a diamond icon.  

### Pro license or **Pro** account

See *account* and *license*.

### publish

Power BI service report *designers* bundle the contents of a Power BI workspace to make it available to others as a Power BI app.
Power BI Desktop report *designers* use publish to refer to sending a Power BI Desktop report in *pbix* format to the Power BI service so that they can build dashboards from it and easily share it with others.

## Q

### Q&A

The Power BI feature that allows natural language questions about a semantic model and get responses in the form of visualizations. Appears in the Power BI service and Desktop.

### Q&A virtual analyst

[Power BI Mobile] For iOS, the conversational UI for Q&A.

### QR codes

[Power BI Mobile] A matrix barcode that can be generated for dashboards or tiles in the Power BI service to identify products. QR codes can be scanned with a QR code reader, or with the Power BI Mobile app on iOS or Android, to link directly to the dashboard or tile.

### query string parameter

In the broadest sense, a query string recovers information from a database. Add one to a URL to prefilter the results seen in a Power BI report.

### Quick Insights

Quick Insights refer to automatically generated insights that reveal trends and patterns in data.  

## R

### Reading view

Read-only view for reports (as opposed to *Editing View*).

### real-time streaming

The ability to stream data and update dashboards in real time from sources such as sensors, social media, usage metrics, and anything else from which time-sensitive data can be collected or transmitted.  

### recent

The container on the home page that holds all the individual items that were accessed last.

### related content

Shows the individual pieces of content that contribute to the current content. For example, for a dashboard, you can see the reports and semantic models providing the data and visualizations on the dashboard.

### relative links

Links from dashboard tiles to other dashboards and reports that are shared directly or distributed through a Power BI app. Relative links enable richer dashboards that support drillthrough.

### report

A multi-perspective view into a single semantic model, with visualizations that represent different findings and insights from that semantic model. Can have a single visualization or many, a single page, or many pages.  

### report editor

The report editor is the tool in which new reports are created and changes are made to existing reports by report *designers*.

### report measures

Also called custom calculations. Excel calls these *calculated fields*. See also *measures*.

### responsive visuals

Visuals that change dynamically to display the maximum amount of data and insights, no matter the screen size.

### row-level security (RLS)

Power BI feature that enables database administrators to control access to rows in a database table based on the characteristics of the user executing a query (for example, group membership). Administrators can configure RLS for data models imported into Power BI with Power BI Desktop.  

## S

### SaaS

Software as a service is a way of delivering applications over the internet as a web-based service. Also referred to as: web-based software, on-demand software, or hosted software.

### screenshot

Simple screenshots of a report can be emailed using the send a screenshot feature.

### semantic model

A **semantic model** is a collection of data used to create visualizations and reports.

### Desktop or **Power BI Desktop**

Free Power BI tool used primarily be report designers, admins, and developers.

### service

See *Power BI service*. A standalone resource available to customers by subscription or license. A service is a product offering delivered exclusively via the cloud.  

### settings

The location for Power BI users to manage their own general settings, such as whether to preview new features, set the default language, close their account, and more. Also, users manage individual settings for content assets, alerts, and subscriptions. Represented by a cog icon.

### share, sharing

In Power BI, sharing typically means directly sharing an individual item (a dashboard or report) with one or more people by using their email address. Requires a Power BI Pro license for sender and recipient.
On mobile devices, share can refer to native OS share functionality, such as "annotate and share."  

### Shared with me

The container in the nav pane that holds all the individual items that were directly shared by another Power BI user.

### snapshot

In Power BI, a snapshot is a static image compared with a live image of a tile, dashboard, or report.

### SQL Server Analysis Services (SSAS)

An online analytical data engine used in decision support and business analytics. It provides the analytical data for business reports and client applications such as Power BI, Excel, Reporting Services reports, and other data visualization tools.

### SQL Server Reporting Services (SSRS)

A set of on-premises tools and services to create, deploy, and manage report servers and paginated reports.

### streaming data

See *real-time streaming*.

### subscriptions, **subscribe**

You can subscribe to report pages, apps, and dashboards and receive emails containing a snapshot. Requires a Power BI Pro license.

### summarization

[Power BI Desktop] The operation being applied to the values in one column.

## T

### tiles

Power BI dashboards contain report tiles.

### time series

A time series is a way of displaying time as successive data points. Those data points could be increments such as seconds, hours, months, or years.  

## U

## V

**value, values

Numerical data to be visualized.

### visual, visualization

A chart. Some visuals are: bar chart, treemap, doughnut chart, map.

### visual interaction

One of the great features of Power BI is the way all visuals on a report page are interconnected. If you select a data point on one of the visuals, all the other visuals on the page that contain that data change, based on that selection.

### Visualizations pane

Name for the visualization templates that ship in the shared report canvas for Power BI Desktop and the Power BI service. Contains small templates, also called icons, for each native visualization type.  

## W

### workbook

An Excel workbook to be used as a data source. Workbooks can contain a data model with one or more tables of data loaded into it by using linked tables, Power Query, or Power Pivot.

### workspace

Containers for dashboards, reports, and semantic models in Power BI. Users can collaborate on the content in any workspace except My workspace. The contents can be bundled into a Power BI app. Workspaces stored in Premium capacity can be shared with free users. Personal workspaces (under My workspace) can be hosted in Premium capacity.

## X

### x-axis

The axis along the bottom, the horizontal axis, of a line graph.

## Y

### y-axis

The axis along the side, the vertical axis, of a line graph.

## Z

## Related content

- [Basic concepts for Power BI service consumer](end-user-basic-concepts.md)
