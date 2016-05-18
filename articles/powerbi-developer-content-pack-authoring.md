<properties 
   pageTitle="ISV Content Pack Authoring"
   description="ISV Content Pack Authoring"
   services="powerbi" 
   documentationCenter="" 
   authors="theresapalmer" 
   manager="mblythe" 
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/17/2016"
   ms.author="tpalmer"/>

# ISV Content Pack Authoring

>**Note:** Developing ISV content packs is currently in preview and requires initial approval through the [Microsoft Azure Certified](powerbi-developer-content-pack-overview.md/#Nomination) program to access. If you're interested, please submit a nomination.

Authoring an ISV content pack uses the Power BI Desktop and the PowerBI.com. There are four components to your content pack:

-	Queries allow you to [connect](powerbi-desktop-connect-to-data/) and [transform](powerbi-desktop-query-overview/) the data, as well as define parameters <link>.
-	Data model to create [relationships](powerbi-desktop-create-and-manage-relationships), [measures](powerbi-desktop-measures), and Q&A improvements <link>.
-	Report [pages](powerbi-desktop-report-view) include visuals and filters to provide insights into your data.
-	[Dashboard](powerbi-service-dashboards/) and [tiles](powerbi-service-create-a-dashboard/) offer an overview of the insights included

You may be familiar with each piece as existing Power BI features. When building a content pack, there are additional things to consider for each aspect, see each section below for more details.

**Note:** an ISV content pack currently requires a single dashboard, report and dataset per content pack.

<a name="queries"></a>
## Queries
For ISV content packs, queries developed in the Power BI Desktop are used to connect to your data source. These queries are required to return a consistent schema and are supported for Scheduled Data refresh. If your data source is not currently supported by the Power BI Desktop, please respond to your Azure Certified nomination.

**Note:** ISV content packs only support one data source per content pack content pack. If your scenario requires more than one data source, please contact the Power BI team through your Azure Certified nomination.

### Consider the source
The queries define the data that will be included in the data model. Depending on the size of your system, these queries should also include filters to ensure your customers are dealing with a manageable size that fits your business scenario.

Power BI content packs can execute multiple queries in parallel and for multiple users concurrently.  Plan ahead your throttling and concurrency strategy and ask us how to make your content pack fault tolerant.

### Schema enforcement
Ensure your queries are resilient to changes in your system, changes in schema on refresh can break the model. If the source could return null/missing schema result for some queries, consider returning an empty table or throw a custom error messages that is meaningful to your user.

### Parameters
Parameters in Power BI Desktop <link> allow your users to provide input values that customize the data retrieved by the user. Think of the parameters upfront to avoid rework after investing time to build detailed queries or reports.

### Additional query tips
-	Ensure all columns are typed appropriately
-	Columns have informative names (see Q&A)
-	For shared logic, consider using functions or queries
-	Privacy levels are not currently supported in the service - if you get a prompt about privacy levels, you may need to re-write the query to use relative paths

## Data Model
A well-defined data model will ensure your customers can easily and intuitively interact with the content pack. Create the data model in the Power BI Desktop.

**Note**: Much of the basic modelling (typing, column names) should be done in the query step.

### Q&A
The modelling will also affect how well Q&A can provide results for your customers. Ensure you add synonyms <link> to commonly used columns and that your columns are properly named in the [queries](#queries).

### Additional data model tips
-	All value columns have formatting applied (note: types should bethat applyied in the Query)
-	All measures have formatting applied
-	Default Summarization is set. Especially "Do Not Summarize", when applicable (for unique values for example)
-	Data Category has been set, when applicable
-	Relationships are set, as necessary


## Reports
The report pages offer additional insight into the data included in your content pack. Use the pages of the reports to answer the key business questions your content pack is trying to address. Create the report using the Power BI Desktop.

**Note:** Only one report may be included in a content pack, so take advantage of the different pages to call out particular sections of your scenario.

### Additional report tips
-	Use more than one visual per page for cross-filtering
-	Align the visuals carefully (no overlapping)
-	Page is set to "4:3" or "16:9" mode for layout
-	All of the aggregations presented make numeric sense (averages, unique values)
-	Slicing produces rational results
-	Logo is present on at least the top report
-	Elements are in the client's color scheme to the extent possible

## Dashboard
The dashboard is the main point of interaction with your content pack for your customers. It should include an overview of the content included, especially the important metrics for your business scenario.

To create a dashboard for your ISV content pack, simply upload your PBIX through Get Data > Files or publish directly from the Power BI Desktop.

### Additional dashboard tips
-	Maintain the same theme when pinning so that the tiles on your dashboard are consistent
-	Pin a logo to the theme so consumers know where the pack is from
-	Suggested layout to work with most screen resolutions is 5-6 small tiles wide
-	All dashboard tiles should have appropriate titles/subtitles
-	Consider groupings in the dashboard for different scenarios, either vertically or horizontally


Next: [Content Pack Testing](powerbi-developer-content-pack-testing.md)
