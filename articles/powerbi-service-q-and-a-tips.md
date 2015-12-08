<properties
   pageTitle="Tips and tricks for asking questions with Q&A in Power BI"
   description="Tips and tricks for asking questions with Q&A in Power BI"
   services="powerbi"
   documentationCenter=""
   authors="jastru"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/06/2015"
   ms.author="mihart"/>

# Tips for asking questions in Power BI Q&A

##  Words and terminology that Q&A recognizes

These are just some of the words and terms that Q&A automatically recognizes.

* **Aggregations**: such as less than, maximum, number of, count of, average, between, before

* **Date keywords**: such as last month, this year  

* **Date ranges**: before, after

* **Display verbs**: show, is, what is, are, what are

* **Equality keywords**:  between, more than, less than, equal

* **Names**: If a column in the dataset contains the phrase "name" (e.g., EmployeeName), Q&A understands the values in that column are names and you can ask questions like "which employees are named robert."

* **Plurals**: for example, both "opportunity" and "opportunities".

* **Possessives**: "what is the total of Jaine's orders"

* **Relationship**: datasets have tables and within tables are columns. Most columns will be related to their containing table with a simple phrasing like "hosts have flags" as well as "flags have hosts." These relationships can be described using words such as: have and of.

* **Sort order**: descending, ascending, alphabetical order, sort

* **Tenses**: for example, both buy" and "bought"

* **Type of visualization**: specify the visualization to use, "show sales by year as a clustered bar chart."

>**NOTE**: If you are the owner of a dataset, add phrasings and synonyms to improve the Q&A results for your customers.

## Q&A helps you phrase the question

Q&A does its best to ensure that the answer accurately reflects the question being asked. It does this in several ways. For all of these, you can accept the action in full, in part, or not at all. As you type your question, Q&A:

* auto-completes words and questions. It uses various strategies, including auto-completing recognizable words, popular questions for the underlying workbooks, and previously-used questions that returned valid responses. If more than one auto-complete option is available, they are presented in a dropdown list.

* corrects spelling.

* provides a preview of the answer in the form of a visualization The visualization updates as you type and edit the question â€“ it doesnâ€™t wait for you to press Enter.

* auto-suggests replacement terms from the underlying dataset(s) when you move the cursor back in the question box.

* restates the question based on the data in the underlying dataset(s). This helps ensure Q&A understood your question as Q&A replaces the words you used with synonyms from the underlying dataset(s).

* dims words it does not understand.

## Which dataset was used to create the visualization
Q&A displays the name of the dataset(s) that was used to produce the currently-displayed results. If you're getting strange results, perhaps you need to search in a different dataset.

## Tell Q&A which visualization to use

When typing natural language queries with Q&A, there are some visualization types that you can specify in the query.  For example:

"sales by state as a treemap"

## Question templates
When you have a workbook prepared for Q&A, you are on your way to start asking questions. Here's a sample of the types of questions you can ask:

* Show \<table\>

    Examples:

    Show sales

    Show orders

* Average \<column\> (if the column has number values)

    Example: Average employee age

* Show \<column\>, where \<column\> is between <range>

    Examples:

    Show products, where price is between $10 and $30

    Show sales, where date is between 2012 and 2014

* Show \<column\>, where \<column\> is before <value>

    Examples:

    Show products, where date sold is before December 9th, 2014

    Show employees, where date of birth is after 3/3/1985

* <measure> by \<column name\>

    a. Year over year growth by year

    b. Total sales by product

    c. Number of sales by location

    d. Total profit and total cost by product

* \<measure\> by \<column name\> for \<specific entity within another column\>

    Example: Total sales by sales rep for Surface Pro 3

## Don't stop now
After Q&A displays your results, keep the conversation going! Use the interactive features of the visualization and of Q&A to uncover more insights.


## See also
Back to [Q&A in Power BI](powerbi-service-q-and-a.md)  
[Tutorial: Introduction to Q&A with Power BI](powerbi-service-tutorial-introduction-to-q-and-a.md)
[Prepare a workbook for Q&A](powerbi-service-make-your-data-work-well-with-q-and-a.md)
[Pin a tile to the dashboard from Q&A](powerbi-service-pin-a-tile-to-a-dashboard-from-the-question-box.md)
[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)  
