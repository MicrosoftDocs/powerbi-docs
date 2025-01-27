---
title: Use Copilot to create measure descriptions (preview)
description: Learn how you can add descriptions to your semantic model measures with Fabric Copilot for Power BI.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: how-to
ms.date: 04/10/2024
LocalizationGroup: Model your data
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---
# Use Copilot to create measure descriptions (preview)

Add descriptions to your semantic model measures with Fabric Copilot for Power BI. People building reports from your semantic model can see the name and description of your measures, making the description property essential documentation. Fabric Copilot can streamline your semantic model documentation by creating measure descriptions for you.

## Turn on the preview feature

To try this preview feature, you need to turn it on. 

- In **Options** > **Preview features**, select **Measure descriptions with Copilot**.

Learn more about how to access to Fabric Copilot for Power BI on your tenant in the [Copilot requirements](../create-reports/copilot-introduction.md#copilot-requirements) section of the Copilot introduction article.

## Create a description with Copilot

1. Select an existing model measure in the Data pane of Model view to see the measure properties.  

1. Select the **Create with Copilot** (preview) button under the **Description** textbox.  

1. Review the measure description from Copilot, then select **Keep it**.  

1. Now the measure description is in the **Description** box. You can edit the description, if you need to.  

If you update the measure later, just select the button again so Copilot can update the description.

## Fabric Copilot to help write measure descriptions: Responsible AI FAQ

**What is Copilot to help write measure descriptions?**
- A button near the measure description field in Power BI modeling view, available in the modeling view of Power BI Desktop or Power BI workspace, for model authors to click and have Fabric Copilot create a description of the semantic model measure. 

**What can Copilot to help write measure descriptions do?**
- The generated description is a natural language description based on the DAX formula of the measure. If the measure DAX formula is updated, the model author can click the button again to have Copilot create an updated description. This description is important as report authors can only see the name and description of a measure when determining which measure to use in their report. Copilot can help the model author save time as creating descriptions can be a time-consuming task.

**What is Copilot to help write measure descriptions’ intended use?**
- Create measure descriptions: Intended to create a description for a measure in a semantic model based on the DAX formula. 

**How was Copilot to help write measure descriptions evaluated? What metrics are used to measure performance?**
- Measure descriptions were generated for Multiple Power BI semantic models with measures, including the quick measures available in Power BI Desktop, and then graded for accuracy and readability by members of the product team. 

**What are the limitations of Copilot to help write measure descriptions? How can users minimize the impact of Copilot to help write measure descriptions’ limitations when using the system?**
- To use Copilot to help write measure descriptions, you need to select a workspace with a Fabric capacity. 
- The measure in the semantic model will only work with Copilot if the measure is in a valid state, with no errors.
- Text contained in double-quotes in the measure DAX formula are not used by Copilot to help write measure descriptions.
- Comments in a measure DAX formula are not used by Copilot to help write measure descriptions.

**What operational factors and settings allow for effective and responsible use of Copilot to help write measure descriptions?**
- Operational factors and settings include the current workload on a Fabric capacity and network speed. 
- Copilot to help write measure descriptions is contained in the [privacy, security, and responsible use of Copilot in Fabric](/fabric/get-started/copilot-privacy-security).

**How do I provide feedback on Copilot to help write measure descriptions?**
- Submit feedback using the [Power BI support](/power-bi/support/). 


## Related content

- [Overview of Copilot for Power BI (preview)](../create-reports/copilot-introduction.md)
- [Tutorial: Create your own measures in Power BI Desktop](desktop-tutorial-create-measures.md). Download a sample file and get step-by-step lessons on how to create more measures.  
- [Learn DAX basics in Power BI Desktop](desktop-quickstart-learn-dax-basics.md). 
- [Data Analysis Expressions Reference](/dax/)
