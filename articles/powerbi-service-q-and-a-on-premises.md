<properties
   pageTitle="Power BI Q&A on-premises"
   description="Documentation on how to use Q&A on-premises."
   services="powerbi"
   documentationCenter=""
   authors="mihart"
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
   ms.date="05/12/2016"
   ms.author="mihart"/>
# Power BI Q&A on-premises

Power BI Q&A for enterprise gateway connected data sources now available in public preview
We are pleased to announce improvements to the Power BI Q&A user experience and the start of the public preview for Power BI Q&A for enterprise gateway connected data sources – starting with support for SQL Server 2016 Analysis Services tabular models. The improved Power BI Q&A experience makes it even easier to ask questions and get answers – and can now be used directly with on premise data. 
Public Preview of Power BI Q&A for Enterprise Gateway Connected Data Sources
Using Q&A with on premise data sources has been a top community ask from the very first time we introduced the Q&A feature. To begin the rollout of this capability, Q&A now works with SQL Server 2016 Analysis Services tabular models being access in Power BI via an enterprise gateway. In the coming weeks we’ll be adding additional data sources and capabilities to the public preview – and we’re looking forward to getting your feedback to help us refine Power BI’s Q&A support for enterprise gateway connected data sources. 
To use the Q&A experience with your enterprise gateway connected data source, simply enable the “turn on Q&A for this dataset” option in the “Q&A and Cortana” settings for your dataset. 
 
Once enabled, the full Q&A experience becomes available on dashboards using the dataset. As you ask questions in Power BI, Q&A determines the best visual to construct or report sheet to use to answer your question using an index of text and schema values from your dataset. Power BI then fetches live data from your data source via the enterprise gateway. This enables Power BI to provide a seamless experience for asking questions with Q&A, without the need to host data values or the entire dataset in the Power BI service. Additionally, Power BI integration with Cortana can also access these sources. 
Power BI’s goal is to provide the best experiences for getting insight from any data. Extending our natural language query experience from the cloud directly to your on premise data is another great step to achieving this. We’re excited to get your feedback to tune this capability and continue adding additional supported data sources. 
Improvements to the Power BI Q&A Experience
Whether your data has been published to Power BI, or is being accessed via the enterprise gateway, we’ve updated the Power BI Q&A experience to make getting answers a faster and more intuitive process. Q&A now provides improved auto-complete while typing questions, more intuitive visual cues to help you navigate and adjust your question, and more control to deal with complex or ambiguous data. In addition to this, the overall Q&A experience has been updated to have a cleaner look and feel. Here are some examples of the new capabilities. 
Here for example, when asking a question containing “SEA” with an airline flight metrics data set I might be referring to origin airports, destinations airports, or even flight routes starting in “SEA”.  Q&A now does a better job helping you see these various options and getting the specific answer you want. 
 
Further, after asking a question, adjusting my question to compare different answers is also more intuitive. Switching filters or values in a question is a simple as selecting the value and picking from suggested alternatives. 
 
These new experiences also work with the ability to ask for report sheets as part of a question. This provides a great way to quickly filter a report to specific data using Q&A capabilities such as relative date references like “this year”. 
 
Finally, in case you missed it in the last Power BI Desktop update, the ability to add synonyms to your model in Power BI desktop is also now available. Adding synonyms lets you include alternate names for tables, columns and measures, that Q&A will use to make it easier to find data when asking questions. 
 
We’re excited for you to try out Q&A with all these new improvements. Between enterprise gateway data source support, improved user experiences, and adding synonyms in Power BI Desktop we’ve made some essential improvements to Q&A – and we’re looking forward making it even easier to use natural language to interact with data and find insights. 


## See also

[Visualizations in Power BI reports](powerbi-service-visualizations-for-reports.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
