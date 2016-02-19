<properties
   pageTitle="Cleaning Irregularly Formatted Data"
   description="Learn how to get your irregularly formatted data ready for modeling"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   editor=""
   tags=""
   featuredVideo="74KQmzdvFV8"
   featuredVideoThumb=""
   courseDuration=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/18/2016"
   ms.author="v-jescoo"/>

# Cleaning Irregularly Formatted Data

*Learn how to get your irregularly formatted data ready for modeling*

While Power BI can import your data from almost any source, the visualization and modeling tools work best with columnar data. However, sometimes your data will have been formatted irregularly. This is often the case with Excel spreadsheets, where a table layout that looks good to the human eye is not necessarily optimal for automated queries.

Fortunately, Power BI has tools to quickly transform multi-column tables. For example, use **Transpose** in the Query Editor to break headers into their own column. Select **Use the first row as headers** from the table options to mark these new columns as headers.

Occasionally repeated values in your irregularly formatted source data can be represented as "null" -- the data version of "ditto" -- in your model. To replace null with a repeated value, use **Fill** in the Query Editor. You can choose to fill up or down from a set value.

Power BI Can also pivot and unpivot your queries to turn selected columns into rows, with their data combined with the existing columns. To pivot your query, select the columns you wish to change and use **Pivot** or **Unpivot** in the Query Editor.
