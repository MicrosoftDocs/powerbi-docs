---
title: Use Power BI Q&A Tooling to train Q&A 
description: Introduction to Power BI Q&A Tooling
author: mohaali
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/14/2019
ms.author: mohaali

---
# Introduction to Power BI Q&A Tooling (Preview)
## Power BI Q&A tooling

Power BI Q&A tooling allows you to improve the natural language experience for users. Q&A tooling gives designers and administrators the ability to interact with the natural language engine and make improvements in three areas: 

- Review questions
- Teach Q&A
- Manage terms

In addition to this dedicated tooling capabilities, designers and administrators have several options available through the Modeling tab in Power BI Desktop:  

- Synonyms
- Row label
- Hide from Q&A
- \[Advanced\] configuring of the linguistic schema

## How to access Q&A tooling

> [!NOTE]
> Q&A tooling is only available inside Power BI Desktop and currently only supports import mode.

1. Open Power BI Desktop and use Q&A to create a visual. 
2. From the corner of the visual, select the gear icon. 

    ![Q&A Visual Gear](media/qna-visual-gear.png)

    The Getting started page displays.  

    ![Q&A Tooling Dialog](media/qna-tooling-dialog.png)

### Review questions

Select **Review questions** to see a list of datasets being used in the Power BI service for your tenant. The **Review questions** page also displays the dataset owner, workspace, and last refreshed date. From here you can select a dataset and see what questions users have been asking. The data also shows words that were not recognized. All data shown here is for the last 28 days.

![Q&A Review questions](media/qna-tooling-review-questions.png)

### Teach Q&A

The **Teach Q&A** section allows you to train Q&A to recognize words. To begin, type a question which contains a word or words which are not recognized by Q&A. Q&A will then prompt you for the definition of that term. Enter either a filter or a field name that corresponds to what that word represent. Q&A will then re-interpret the original question and if you are happy with the results, you can then save your input. To learn more, visit [Teach Q&A](qna-tooling-teach-qna.md)

![Q&A Teach synonym preview](media/qna-tooling-teach-fixpreview.png)

### Manage Terms

Anything that has been saved from the Teach Q&A section will show up here to allow you to review or delete terms you have defined. Today there is no ability to edit an existing definition, so to redefine a term you must first delete and then recreate that term.

![Q&A Manage terms](media/qna-manage-terms.png)

## Other Q&A Settings

### Bulk synonyms

The Power BI Desktop **Modeling** tab has more options for improving the Q&A experience. 
Select a field or table to display the **Synonyms** pane.  This pane displays on the right side of the canvas and lists several Q&A actions. One of these options is **Synonyms**. **Synonyms** allows you to quickly define alternatives for the word you selected. Although the **Teach Q&A** feature inside the tooling dialog can also define synonyms, if you wish to define synonyms for lots of fields in a table, it is often easier to do some from here.

![Q&A Modelling Pane Synonyms](media/qna-modelling-pane-synonyms.png)

To define multiple synonyms for a single field, use commas to denote the next synonym.

### Hide from Q&A

Use the Modelling tab to hide terms. Q&A will respect and ensure that field will not be recognized by Q&A. This is helpful when you wish to hide ID fields and foreign keys to avoid unnecessary duplicate fields being called the same thing. If you hide the field, it can still be used in Power BI Desktop to create visuals outside of Q&A

### Row Label

The **Row label** feature is only available on tables in the modelling view. A row label allows you to define which column/field best identifies a single row inside the table. This is important for when you have a table called 'Customer' and the row label will usually be 'Display Name'. Providing this extra metadata allows Q&A to plot a more helpful visual when users type in 'Show me sales by customer' instead of treating 'customer' as a table, it can instead use 'Display Name' and display a bar chart showing each customer's sales.

### \[Advanced\] Configure the linguistic schema

IF you wish to completely train and enhance the natural language engine inside Q&A including changing the scoring and weighting of the underlying natural language results, visit [Teach Q&A tooling](qna-tooling-teach-qna.md).

## Next steps

There are a variety of best practices you can use to improve the natural language engine. For more information, see the following article:

* [Q&A Best Practices](qna-best-practices.md)
