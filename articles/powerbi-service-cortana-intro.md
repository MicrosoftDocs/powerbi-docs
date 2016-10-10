<properties
   pageTitle="Introduction to Cortana for Power BI"
   description="Use Cortana with Power BI to get answers from your data. Activate Cortana for each Power BI dataset and then enable Cortana to access your datasets from mobile devices."
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
   ms.date="09/19/2016"
   ms.author="mihart"/>


# Introduction to Cortana for Power BI

Ask natural language questions in Cortana and find answers from data stored in Power BI.

>**NOTE**: Cortana for Power BI is currently only available in English. Cortana is not currently available on mobile devices.

## How do Cortana and Power BI work together?

With the November 2015 update of Windows 10, Cortana can now find answers from data stored in Power BI through the integration between Cortana and Power BI.

Similar to Power BI Q&A, ask or type your questions using natural language. Cortana will search your Cortana-enabled datasets in Power BI for answers and display results directly in your Windows 10 device.   

Cortana can find answers either directly from datasets in Power BI or from report pages published to Power BI and designed specifically for Cortana (called *Answer Pages*).  Interact with the visualizations as you would in Power BI or, to further explore an answer, simply open a result in Power BI.

>**NOTE**: Cortana now works with on-premises data that has been [enabled for Q&A](powerbi-service-q-and-a-direct-query.md).

Cortana ranks the answers from Power BI, giving you one or more best matches if there is high confidence a result is a good answer. Other potential answers from Power BI are listed in a Power BI section below any best matches. If you're a dataset owner, you can help Cortana return better answers by [creating specialized reports (called *Answer Pages*) for Cortana](powerbi-service-cortana-desktop-entity-cards.md) in Power BI to answer the most-common questions and by optimizing your model for Power BI Q&A.

## How do I get started?

- Cortana looks for answers in Power BI datasets that you have access to. If you are a dataset owner, [enable Cortana to access the dataset (and its reports)](powerbi-service-cortana-enable.md).  

- If you are a dataset owner, [create Answer Pages designed specifically for Cortana](powerbi-service-cortana-desktop-entity-cards.md).

## Tips for using Power BI with Cortana

### Before you begin

In Power BI, you can work with datasets that you own or that have been shared with you. To access those same datasets in Cortana, a dataset owner must [enable each  dataset for Cortana](powerbi-service-cortana-enable.md).  

### Asking questions

Any Power BI user can use Cortana to ask questions about their Power BI datasets.  Dataset owners can [improve answers by creating Answer Pages in Power BI](powerbi-service-cortana-desktop-entity-cards.md).  

1. Using Cortana, ask or type a question.  For example, ask "how many new stores opened in March?"

2. Cortana looks for answers in the Power BI reports and datasets available to you, and displays them under the heading **Power BI** and marked with the Power BI icon.

3. Power BI first looks for answers in [Answer Pages](powerbi-service-cortana-desktop-entity-cards.md) and then searches your datasets and reports for other answers and displays them in the form of visualizations.  The highest-scoring results display first as *best matches*, followed by links to other possible answers and applications. Best matches come from Power BI Answer Pages or Power BI reports.
  >NOTE: If you speak your question, Cortana will only display **Power BI** answers if it finds a best match.  

4. To open an answer in Power BI, select the link.


### Other Tips

-  If the report has a filter, Cortana will understand questions that specify items in the filter's list, and apply the filter on-the-fly.

- Cortana will only search for answers in Power BI if the question has 2 or more words.

- If you add the word "my" to your question, Cortana searches available datasets for answers that contain information found in your Windows 10 profile (the information you see when you click on your picture).

## See also
[Enable Cortana for Power BI](powerbi-service-cortana-enable.md)

[Introduction to Power BI Q&A](powerbi-service-q-and-a.md)

[Power BI basic concepts](powerbi-service-basic-concepts.md)

More questions? [Try the Power BI Community](http://community.powerbi.com/)
