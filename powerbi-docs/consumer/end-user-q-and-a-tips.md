---
title: Tips for Asking Questions in Power BI Q&A
description: Use the following tips and tricks to quickly and accurately ask questions with Q&A in the various Power BI apps.
author: kgremban
ms.author: kgremban
ms.reviewer: Mohammad.ali
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 10/01/2025
ai-usage: ai-assisted
LocalizationGroup: Ask questions of your data
---

# Tips for asking questions in Power BI Q&A

[!INCLUDE[consumer-appliesto-yyny](../includes/consumer-appliesto-yyny.md)]

> [!IMPORTANT]
> Q&A experiences are going away in December 2026. We recommend using [Copilot for Power BI](../create-reports/copilot-introduction.md), which offers a more advanced and integrated way to query your data using natural language. For more details and recommended alternatives, see [Deprecating Power BI Q&A](https://powerbi.microsoft.com/blog/deprecating-power-bi-qa).

## Words and terminology that Q&A recognizes

The list of keywords on this page isn't exhaustive. The best way to see if Power BI recognizes a keyword is to try it out by typing it in the question box. If the word or term is grayed out, then Power BI doesn't recognize it. Even when Power BI doesn't recognize a word, it makes a best guess. 

The list below uses present tense, but all tenses are recognized in most cases. For example, "is" includes: **are**, **was**, **were**, **will be**, **have**, **has**, **had**, **will have**, **has got**, **do**, **does**, and **did**. And "sort" includes: **sorted** and **sorting**. Power BI also recognizes and includes singular and plural versions of a word.

> [!NOTE]
> Q&A is also available in the Microsoft Power BI app for iOS on iPads, iPhones, and iPod Touch devices.

|Category  |Keywords  |
|---------|---------|
|**Aggregates**     | total, sum, amount, number, quantity, count, average, most, least, fewest, largest, smallest, highest, biggest, maximum, max, greatest, lowest, littlest, minimum, min          |
|**Articles**     |  a, an, the              |
|**Blank and Boolean**     |   blank, empty, null, prefixed with "non" or "non-", empty string, empty text, true, t, false, f          |
|**Comparisons**     |   vs, versus, compared to, compared with            |
|**Conjunctions**     |  and, or, each of, with, versus, &, and, but, nor, along with, in addition to       |
|**Contractions**     |  Q&A recognizes almost all contractions. Try it out. Here are a few examples: didn't, haven't, he'd, he's, isn't, it's, she'll, they'd, weren't, who's, won't, wouldn't          |
|**Dates**     |       Power BI recognizes most date terms (day, week, month, year, quarter, decade, ...) and dates written in many different formats (see *Relative dates*). Power BI also recognizes the following keywords: MonthName, Days 1-31, decade. Examples: January 3rd of 1995, January 3rd 1995, Jan 03 1995, 3 Jan 1995, the 3rd of January, January 1995, 1995 January, 1995-01, 01/1995, names of months         |
|**Relative dates**     |   today, right now, current time, yesterday, tomorrow, the current, next, the coming, last, previous, ago, before now, sooner than, after, later than, from, at, on, from now, after now, in the future, past, last, previous, within, in, over, N days ago, N days from now, next, once, twice. Example: count of orders in the past six days.  |
|**Equality (Range)**     |   in, equal to, =, after, is more than, in, between, before  |
|  |Examples: Order year is before 2012? Price equals between 10 and 20? Is the age of John greater than 40? Total sales in 200-300?              |
|**Equality (Value)**     |   is, equal, equal to, in, of, for, within, is in, is on |
|   | Examples: Which products are green? Order date equals 2012. Is the age of John 40? Total sales that aren't equal to 200? Order date of 1/1/2016. 10 in price? Green for color?              |
|**Names**     |       If a column in the semantic model contains the phrase "name" (for example, EmployeeName), Q&A understands the values in that column are names. You can ask questions like "which employees are named Robert."          |
|**Pronouns**  | he, him, himself, his, she, herself, her, hers, it, itself, its, they, their, them, themselves, theirs, this, these, that, those|
|**Query commands**     |    sorted, sort by, direction, group, group by, by, show, list, display, give me, name, just, only, arrange, rank, compare, to, with, against, alphabetically, ascending, descending, order             |
|**Range**     |      greater, more, larger, above, over, >, less, smaller, fewer, below, under, <,  at least, no less than, >=, at most, no more than, <=, in, between, in the range of, from, later, earlier, sooner, after, on, at, later than, after, since, starting with, starting from, ending with           |
|**Times**  |am, pm, o'clock, noon, midnight, hour, minute, second, hh:mm:ss  |
|  |  Examples: 10 pm, 10:35 pm, 10:35:15 pm, 10 o clock, noon, midnight, hour, minute, second.  |
|**Top N**     |     (order, ranking): top, bottom, highest, lowest, first, last, next, earliest, newest, oldest, latest, most recent, next            |
|**Visual types**     |  all visual types native to Power BI. If it's an option in the Visualizations pane, then you can include it in your question. The exception to this rule is [Power BI custom visuals](../developer/visuals/develop-power-bi-visuals.md) that you manually added to the Visualization pane.  |
|  |  Example: show districts by month and sales total as bar chart               |
|**Wh (relationship, qualified)**  | when, where, which, who, whom, how many, how much, how many times, how often, how frequently, amount, number, quantity, how long, what                |

## Q&A helps you phrase the question

Q&A does its best to understand and answer the question being asked. It tries to understand in several ways. For all of these phrasings, you can accept the action in full, in part, or not at all. As you type your question, Q&A:

- Autocompletes words and questions. It uses various strategies, including autocompleting recognized words, stored questions, and previously used questions that returned valid responses. If more than one autocomplete option is available, they're presented in a dropdown list.
- Corrects spelling.
- Provides a preview of the answer in the form of a visual. The visual updates as you type and edits the question (it doesn't wait for you to press Enter).
- Suggests replacement terms from one or more of the underlying semantic models when you move the cursor back in the question box.
- Restates the question based on the data in the underlying semantic models. Q&A replaces the words you used with synonyms from the underlying semantic models. By reading the restatement, you know whether Q&A understood your question or not.
- Adds a double underline to words it tries to understand.
- Adds a single underline to words it does understand.
- Adds a dotted underline to words it doesn't understand. These words might be in the [Recognized words list](#words-and-terminology-that-qa-recognizes) that you expect Q&A to understand. But, you might have used that word in an unexpected way.
- Allows you to contact the report or dashboard owner when your term isn't found or your question doesn't get results.

## Tell Q&A which visual to use

When typing natural language queries with Power BI Q&A, you can specify the visual type in your query. For example:

"***sales by state as treemap***"

:::image type="content" source="media/end-user-q-and-a-tips/qa-treemap.png" alt-text="Screenshot of Q&A search for sales by state displayed in a treemap format.":::

## Don't stop now

After Q&A displays your results, keep the conversation going. Use the interactive features of the visual and of Q&A to uncover more insights.

## Related content

- Go to [Q&A for Power BI business users](end-user-q-and-a.md)  
- [Basics of the Power BI service](../fundamentals/service-basic-concepts.md)
- More questions? [Ask the Power BI Community](https://community.powerbi.com/)
