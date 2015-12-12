<properties
   pageTitle="Reference lines in your report"
   description="Reference lines in your report"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/11/2015"
   ms.author="mihart"/>

# Reference lines in your report

Use Power BI Desktop to create a calculated column.  Then use that column to define a reference line that you use in a line chart. 

1. Select and open the table in Desktop.

    Identify the table and column on which you want to create a reference line and value of the reference line. In this example, we'll set our target to 50.

2. From the ribbon, select **New Column**.

    ![](media/powerbi-service-reference-lines-in-your-report/PBI_reference_line_new-column.png)

3. In the formula bar, type the following:

    **Target Value = 50**

    ![](media/powerbi-service-reference-lines-in-your-report/PBI_reference_line_field_list.png)

  This calculated column will return the value 50 regardless of where it is used.  **target** will show up in the Field List. 

3. Add the Target Value calculated column to a line chart to show how any series relates to that specific reference line.  


[Learn more about calculated columns](powerbi-desktop-calculated-columns.md)
