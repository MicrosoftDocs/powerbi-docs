<properties
   pageTitle="More Advanced Data Sources and Transformation"
   description="More Advanced Data Sources and Transformation"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideo=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/17/2016"
   ms.author="v-jescoo"/>

# More Advanced Data Sources and Transformation

[![Basic transformations](./media/powerbi-learning-course1-article4/videothumb.jpg)](http://www.youtube.com/watch?v=8WsY0R2V_bw)

*See some advanced data import and cleaning techniques for Power BI Desktop*

Power BI Desktop can combine data from multiple sources into a single report at any time during the modelling process. To add additional sources to an existing report, select **Edit Queries** in the Home Tab and then select **New Source* in the Query Editor.

We've reviewed many of the different possible data sources you can use with Power BI Desktop, but there is an additional source that has not yet been covered: Folders. By connecting to a folder, you can import data from multiple files at once, such as a series of Excel files. The files contained within your selected folder appear in the Query Editor as a list of content types, but clicking the double-arrow icon at the top of the Content column will load their values.

One of Power BI's most useful tools are its filters. For example, selecting the drop-down arrow next to a column opens a checklist of text filters that you can use to remove values completely from your model.

You can also use the **Append Queries** tool to add the data from a new table to an existing query. Power BI will attempt to match up the columns in your queries as much as possible.

Finally, the **Add Custom Column** tool gives advanced users the option of writing query expressions from scratch using M language.
