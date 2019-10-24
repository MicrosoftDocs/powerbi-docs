---
title: Intro to Q&A tooling to train Power BI Q&A (preview)
description: Introduction to Power BI Q&A tooling
author: mohaali
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 10/17/2019
ms.author: mohaali

---
# Intro to Q&A tooling to train Power BI Q&A (preview)

With Power BI Q&A *tooling*, you can improve the natural language experience for your users. As a designer or administrator, you interact with the natural language engine and make improvements in three areas: 

- Review questions your users have asked.
- Teach Q&A to understand questions.
- Manage terms you've taught Q&A.

In addition to these dedicated tooling capabilities, the **Modeling** tab in Power BI Desktop offers more options:  

- Synonyms
- Row labels
- Hide from Q&A
- Configuring of the linguistic schema (advanced)

## Get started with Q&A tooling

Q&A tooling is only available in Power BI Desktop, and currently only supports import mode.

1. Open Power BI Desktop and use Q&A to create a visual. 
2. From the corner of the visual, select the gear icon. 

    ![Q&A visual gear](media/qna-visual-gear.png)

    The Getting started page opens.  

    ![Q&A Getting started](media/qna-tooling-dialog.png)

### Review questions

Select **Review questions** to see a list of datasets being used in the Power BI service for your tenant. The **Review questions** page also displays the dataset owner, workspace, and last refreshed date. From here you can select a dataset and see what questions users have been asking. The data also shows words that were not recognized. All data shown here is for the last 28 days.

![Q&A review questions](media/qna-tooling-review-questions.png)

### Teach Q&A

The **Teach Q&A** section allows you to train Q&A to recognize words. To begin, type a question that contains a word or words that Q&A doesn't recognize. Q&A prompts you for the definition of that term. Enter either a filter or a field name that corresponds to what that word represents. Q&A then reinterprets the original question. If you're happy with the results, you can save your input. To learn more, see [Teach Q&A](q-and-a-tooling-teach-q-and-a.md)

![Q&A teach synonym preview](media/qna-tooling-teach-fixpreview.png)

### Manage terms

Anything you've saved from the Teach Q&A section shows up here, so you can review or delete terms you've defined. Currently you can't edit an existing definition, so to redefine a term you must delete and recreate that term.

![Q&A Manage terms](media/qna-manage-terms.png)

## Other Q&A settings

### Bulk synonyms

The Power BI Desktop **Modeling** tab has more options for improving the Q&A experience. 

1. In Power BI Desktop, select Modeling view.

2. Select a field or table to display the **Properties** pane.  This pane displays on the right side of the canvas and lists several Q&A actions. One option is **Synonyms**. In the **Synonyms** box, you can quickly define alternatives for the table or field you select. You can also define synonyms the **Teach Q&A** section of the Tooling dialog box, but it's often faster to define synonyms here for lots of fields in a table.

    ![Q&A Modeling pane synonyms](media/qna-modelling-pane-synonyms.png)

3. To define multiple synonyms for a single field, use commas to denote the next synonym.

### Hide from Q&A

You can also hide fields and tables, so they don't appear in Q&A results. 

1. In Power BI Desktop, select Modeling view.

2. Select a field or table to display the **Properties** pane, and turn **Is hidden** **On**.

    Q&A respects that setting and ensures that field isn't recognized by Q&A. For example, you might want to hide ID fields and foreign keys to avoid unnecessary duplicate fields with the same name. Even if you hide the field, you can still use it in Power BI Desktop in visuals outside of Q&A.

### Set a row label

A row label allows you to define which column (or *field*) best identifies a single row in a table. For example, for a table called 'Customer', the row label is usually 'Display Name'. Providing this extra metadata allows Q&A to plot a more helpful visual when users type in 'Show me sales by customer'. Instead of treating 'customer' as a table, it can instead use 'Display Name' and display a bar chart showing each customer's sales. You can only set the row label Modeling view. 

1. In Power BI Desktop, select Modeling view.

2. Select a table to display the **Properties** pane.

3. In the **Row label** box, select a field.

## Configure the linguistic schema (advanced)

In Power BI, you can completely train and enhance the natural language engine inside Q&A, including changing the scoring and weighting of the underlying natural language results. To learn how, see [Edit Q&A linguistic schema and add phrasings](q-and-a-tooling-advanced.md).

## Next steps

There are a number of best practices for improving the natural language engine. For more information, see the following article:

* [Q&A Best Practices](q-and-a-best-practices.md)
