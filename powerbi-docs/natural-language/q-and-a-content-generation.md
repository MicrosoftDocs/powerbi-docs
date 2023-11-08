---
title: How Q&A generates visuals
description: Learn about the process by which the Q&A visual takes in a natural language input and generates a visual answer.
author: maggiesMSFT
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: conceptual
ms.date: 11/08/2023
---
# How Q&A generates visuals

The Q&A engine allows users to ask a question about their data and receive a visual answering that question. To generate the visual, it:

- Maps words from the natural language input to objects in the model using linguistic metadata (synonyms and phrasings) about the model,
- Applies linguistic principles to identify how those words are related to each other and to core built-in concepts in the context of the input,
- Generates visuals based on the possible meanings of the input,
- Scores these visuals based on a variety of internal guidelines, and
- Returns the highest-scoring visual as the result.

This process is *deterministic*, meaning that the same input asking about the same data model always returns the same result. It doesn't require generative AI to function. However, the structure and meaning of language can change across cultures, communities, and individual people. There's no guarantee that Q&A will return a visual matching the intention of the user providing the natural language input. To prevent misunderstandings, Q&A is transparent about which terms it associates with which data fields in the model, as well as how it constructs its visual output as a result, including highlighting low-confidence or unrecognized terms.

## Q&A and Copilot

You can use generative AI to improve the quality of Q&A responses with Copilot for Power BI.

To learn more about Copilot-powered features in Q&A, see [Enhance Q&A with Copilot](q-and-a-copilot-enhancements.md).

> [!IMPORTANT]
> Review the [supplemental preview terms for Fabric](https://azure.microsoft.com/support/legal/preview-supplemental-terms/), which includes terms of use for Microsoft Generative AI Service Previews.

## Next steps

Learn more about:

- Ways to improve the quality of your Q&A outputs, see [Best practices to optimize Q&A](q-and-a-best-practices.md).
- Copilot and other Copilot-powered capabilities in Power BI, see [Overview of Copilot in Power BI](../create-reports/copilot-introduction.md).
