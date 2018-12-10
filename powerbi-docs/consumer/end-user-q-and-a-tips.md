---
title: Tips and tricks for asking questions with Q&A
description: Tips and tricks for asking questions with Q&A in Power BI
author: mihart
manager: kvivek
ms.reviewer: ''
ms.custom: seodec18

ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: mihart

LocalizationGroup: Ask questions of your data
---
# Tips for asking questions in Power BI Q&A
## Words and terminology that Q&A recognizes
This list of keywords is not exhaustive.  The best way to see if Power BI recognizes a keyword, is to try it out by typing it in the question box.  If the word or term is greyed out, then Power BI does not recognize it, or doesn’t recognize it in the current context.

The list below uses present tense, but all tenses are recognized in most cases. For example, “is” includes are, was, were, will be, have, has, had, will have, has got, do, does, did.  And “sort” includes sorted and sorting.  Also, PowerBI recognizes and includes singular and plural versions of a word. For example, Power BI recognizes “year” and “years”.

> [!NOTE]
> Q&A is also available in the [Microsoft Power BI app for iOS on iPads, iPhones, and iPod Touch devices](mobile/mobile-apps-ios-qna.md).
> 
> 

If you are the owner of a dataset, add phrasings and synonyms to improve the Q&A results for your customers.

**Aggregates**: total, sum, amount, number, quantity, count, average, most, least, fewest, largest, smallest, highest, biggest, maximum, max, greatest, lowest, littlest, minimum, min

**Articles**: a, an, the

**Blank and Boolean**: blank, empty, null, prefixed with “non” or “non-“, empty string, empty text, true, t, false, f

**Comparisons**: vs, versus, compared to, compared with

**Conjunctions**: and, or, each of, with, versus, &, and, but, nor, along with, in addition to

**Contractions**: Q&A recognizes almost all contractions, try it out.  Here are a few examples: didn’t, haven’t, he’d, he’s, isn’t, it’s, she’ll, they’d, weren’t, where’ll, who’s, won’t, wouldn’t.

**Dates**: Power BI recognizes most date terms (day, week, month, year, quarter, decade, etc…) and dates written in many different formats (see below). Power BI also recognizes the following keywords: MonthName, Days 1-31, decade.

Examples: January 3rd of 1995, January 3rd 1995, jan 03 1995, 3 Jan 1995, the 3rd of January, January 1995, 1995 January, 1995-01, 01/1995, names of months.

**Relative dates**: today, right now, current time, yesterday, tomorrow, the current, next, the coming, last, previous, ago, before now, sooner than, after, later than, from, at, on, from now, after now, in the future, past, last, previous, within, in, over, N days ago, N days from now, next, once, twice.

Example: count of orders in the past 6 days.

**Equality (Range)**: in, equal to, =, after, is more than, in, between, before

Examples: Order year is before 2012? Price equals between 10 and 20? Is the age of John greater than 40? Total sales in 200-300?

**Equality (Value)**:  is, equal, equal to, in, of, for, within, is in, is on

Examples: Which products are green? Order date equals 2012. Is the age of John 40? Total sales that are not equal to 200? Order date of 1/1/2016. 10 in price? Green for color? 10 in price?

**Names**: If a column in the dataset contains the phrase "name" (e.g., EmployeeName), Q&A understands the values in that column are names and you can ask questions like "which employees are named robert."

**Pronouns**: he, him, himself, his, she, herself, her, hers, it, itself, its, they, their, them, themselves, theirs, this, these, that, those

**Query commands**: sorted, sort by, direction, group, group by, by, show, list, display, give me, name, just, only, arrange, rank, compare, to, with, against, alphabetically, ascending, descending, order

**Range**: greater, more, larger, above, over, >, less, smaller, fewer, below, under, <,  at least, no less than, >=, at most, no more than, <=, in, between, in the range of, from, later, earlier, sooner, after, on, at, later than, after, since, starting with, starting from, ending with

**Times**: am, pm, o'clock, noon, midnight, hour, minute, second, hh:mm:ss

Examples: 10 pm, 10:35 pm, 10:35:15 pm, 10 oclock, noon, midnight, hour, minute, second.

**Top N** (order, ranking): top, bottom, highest, lowest, first, last, next, earliest, newest, oldest, latest, most recent, next

**Visual types**: all visual types native to Power BI.  If it's an option in the Visualizations pane, then you can include it in your question.  The exception to this is [custom visuals](../power-bi-custom-visuals.md) that you've manually added to the Visualization pane.

Example: show districts by month and sales total as bar chart

**Wh (relationship, qualified)**: when, where, which, who, whom, how many, how much, how many times, how often, how frequently, amount, number, quantity, how long, what

## Q&A helps you phrase the question
Q&A does its best to ensure that the answer accurately reflects the question being asked. It does this in several ways. For all of these, you can accept the action in full, in part, or not at all. As you type your question, Q&A:

* autocompletes words and questions. It uses various strategies, including autocompleting recognizable words, popular questions for the underlying workbooks, and previously used questions that returned valid responses. If more than one autocomplete option is available, they are presented in a dropdown list.
* corrects spelling.
* provides a preview of the answer in the form of a visualization. The visualization updates as you type and edit the question (it doesn't wait for you to press Enter).
* suggests replacement terms from the underlying dataset(s) when you move the cursor back in the question box.
* restates the question based on the data in the underlying dataset(s). This restatement helps ensure Q&A understood your question as Q&A replaces the words you used with synonyms from the underlying dataset(s).
* dims words it does not understand.

## Don't stop now
After Q&A displays your results, keep the conversation going! Use the interactive features of the visualization and of Q&A to uncover more insights.

## Next steps
Back to [Q&A in Power BI](end-user-q-and-a.md)  

[Power BI - Basic Concepts](end-user-basic-concepts.md)  

More questions? [Try the Power BI Community](http://community.powerbi.com/)

