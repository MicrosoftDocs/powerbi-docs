---
title: Use the Power BI Q&A Visual
description: How to setup the Power BI Q&A visual
author: mohaali
manager: mohaali

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/14/2019
ms.author: mohaali

---
# Introduction to Power BI Q&A Visual
## What is the Q&A Visual

The Q&A Visual is a native element that can be placed onto any report. The visual itself allows users to ask natural language questions and get answers to their questions from their data. The great benefit of creating a Q&A visual is it can be customized and placed anywhere within a report allowing report designers to create beautiful looking reports with Q&A.

![Q&A Visual Walkthrough](media/qna-visual-walkthrough.gif)

The Q&A Visual can be both used as a tool to allow your end consumers to quickly get answers to their data but it can also be a way to quickly author reports by simply double clicking anywhere on a report and using natural language to quickly get started. As it behaves like any other visual, the Q&A visual can be cross-filtered/cross-highlighted and also supports bookmarks allowing you to truly create immersive experiences. The Q&A visual also supports themes and supports all the default formatting options available inside Power BI.

The Q&A Visual consist of 4 core components;

- The question box where users type in their question and are shown suggestions to help them complete their question
- A pre-automated list of suggestions which gives consumers a starting point of questions to ask
- Convert to visual which allows report creators to easily convert the answer to a native visual inside Power BI. This is useful for when you wish to create reports quickly and saves time from having to drag and drop.
- [Q&A tooling](qna-tooling-intro.md) which allows you to configure the underlying natural language engine

## How to enable Q&A for reports

The Q&A visual can be enabled on reports through two ways

- Adding the Q&A Visual onto a report
- Double clicking on the report to create the Q&A visual

The Q&A icon is enabled by default and is shown below
![Q&A Visual Icon](media/qna-visual-icon.png)

If you see an error when creating a Q&A visual be sure to check out the [limitations](qna-limitations.md) section to see if the datasource/configuration is supported.

## Customizations

The Q&A visual can be customized in the formatting pane, below is a short list of all the formatting options which are available;

- Question Field - Customize the look and feel for the question box including background/foreground color and text color, you can also change the default colors for red/blue to indicate if a word was recognized or unrecognized
- Suggestions - Control the look and feel for the suggestion boxes including the background color and also control if you wish to show the automated suggestions.

## Next steps

There are a variety of ways you can integrate natural language. For more information, see the following articles:

* [Q&A Tooling](qna-tooling-intro.md)
* [Q&A Best Practices](qna-best-practices.md)
