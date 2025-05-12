---
title: Copilot in Power BI tutorial - Prepare semantic model for AI
description: This article provides an overview of preparing semantic models for AI using Power BI Desktop and publishing to the cloud service.
ms.reviewer: juliacawthra
ms.author: alpowers
author: itsnotaboutthecell
ms.topic: overview
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
ms.date: 05/06/2025
---

# Copilot in Power BI tutorial: Prepare semantic model for AI

In this tutorial, you prepare and configure your semantic model for AI use by applying recommended practices. In this tutorial, you learn to:

> [!div class="checklist"]
>
> * Simplify the data schema
> * Create verified answers
> * Add AI instructions
> * Mark as Prepped for AI

> [!IMPORTANT]
> This tutorial includes [preview](https://learn.microsoft.com/fabric/fundamentals/preview) features.

> [!NOTE]
> Copilot outputs are nondeterministic, meaning that it's possible that a user receives a different output from a Copilot experience, despite using the same prompt and grounding data. It's important to set expectations with users so that they know what kinds of outputs to expect from Copilot and how they can evaluate or validate these outputs, for themselves.
>
> Learn more about the [Responsible use of Copilot in Power BI](https://learn.microsoft.com/power-bi/create-reports/copilot-integration#responsible-use-of-copilot-in-power-bi).

## Guidance

When developing a semantic model in Power BI, it's crucial to prepare your model to work effectively with Copilot. Without proper preparation, Copilot can generate less helpful and inaccurate results. To ensure the effectiveness of your semantic model, adhere to best modeling practices and take essential steps. Neglecting these preparations can lead to Copilot producing suboptimal outcomes. The following sections outline key considerations for semantic model developers and analysts to enhance Copilot experiences within Power BI:

- **Model organization**: Ensure tasks like providing field descriptions, hiding columns and measures, and avoiding duplicate field names across tables are completed.
- **Consistent naming conventions**: Use human-readable names for tables, columns, and measures, and distinguish between similarly named fields, such as "Name" in the Customer table and "Name" in the Store table.
- **Concise descriptions**: Use descriptive sentences to document and explain the meaning of tables, columns, measures, and other model object properties.
- **Model design**: Follow recommended data modeling practices, like star schema design, to ensure quality semantic models.
- **Model complexity**: Simplify models by removing unused objects (tables, fields, and measures), avoiding ambiguous relationships, and limiting complex patterns (like disconnected field parameter tables).

Continuously test your model with Copilot to ensure consistent and reliable results both as you introduce model changes and as new tools and capabilities become available for preparing your semantic model for AI. If issues persist, review the model with your users, understand common questions they might ask, and simplify the design to achieve better outcomes.

Learn more about [best practices to optimize asking questions and getting answers in Power BI](https://learn.microsoft.com/power-bi/natural-language/q-and-a-best-practices).

## Prep data for AI (preview)

In Power BI Desktop, select the **Prep data for AI** icon located on the Home tab of the ribbon, as shown in the following image.

:::image type="content" source="media/tutorial-copilot-in-power-bi/prep-data-for-ai.png" alt-text="Screenshot of Home tab of the ribbon accessing Prep data for AI experience.":::

## Simplify the data schema (preview)

To ensure consistent and reliable results, the first step is to simplify the schema that Copilot can use. Here are some common scenarios where this process can be beneficial:
- **Duplicative field names across tables**: When multiple tables have fields with the same name, it can be challenging to generate accurate responses. By ensuring unique field names are selected, you can reduce confusion and improve the accuracy of data retrieval.
- **Complexity in semantic models**: Models with many unused objects (such as tables, fields, and measures) can introduce uncertainty in responses. Streamlining the schema by removing unnecessary objects reduces ambiguity and potential errors when dealing with unnecessary elements.

1. In the dialog that opens, choose **Simplify the data schema**, by selecting the card or using the left-hand navigation menu.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/simplify-the-data-schema-card.png" alt-text="Screenshot of Prep data for AI get started screen and the simplify the data schema card option.":::

1. To improve Copilot’s response accuracy, deselect the following fields that aren't relevant for Copilot to analyze, then select **Apply**:
    1. From the **Accounts** table, deselect the unique identifier relationship field by expanding the table explorer and deselecting the box for the **Account ID** field.
    1. From the **Dates** table, deselect the model's sort by column helper fields by expanding the table explorer and deselecting the boxes for the **Day (Sort Order)** and **Month (Sort Order)** fields.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/simplify-the-data-schema-field-selection.png" alt-text="Screenshot of Prep data for AI get started screen and the simplify the data schema card option.":::

1. Select **Close** to return to the **Report view** page, where you create verified answers for the visuals on the report.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/close-button.png" alt-text="Screenshot of the Close button in Prep data for AI dialog window.":::

## Create verified answers (preview)

By creating verified answers, you can add phrases, questions, or keywords that users might ask when seeking insights from the semantic model. When users ask Copilot a question using one of these trigger phrases, Copilot can return an answer based on the configured visual.

1. On the Opportunity Overview page, select the Pipeline by Stage visual in the bottom-left corner, then right-click and select **Set up a verified answer**.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/setup-a-verified-answer-pipeline-by-stage.png" alt-text="Screenshot of the Pipeline by Stage visual and the Set up a verified answer option.":::

1. A set of Copilot suggestions is created based on the information in the visual. You can select these suggestions to add as phrases connected to verified answers, select Refresh to generate a new set of suggestions or add your own.

    Because Copilot suggestions can vary for each session, manually configure the connected phrases by selecting the add (**+**) option.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/create-verified-answers-for-sales-stages.png" alt-text="Screenshot of the verified answers Copilot suggestions and connected phrases.":::

1. Add the following two example verified answers and select **Enter** to confirm each entry when done:
    - How many opportunities are in each sales stage?
    - How does the number of opportunities vary by sales stage?

    To adjust verified answers, hover above each entry and select the edit (pencil) or delete (trash can) options.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/add-verified-answers.png" alt-text="Screenshot of adding verified answers to connected phrases.":::

1. Select **Apply** and then navigate to the **All verified answers** view.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/apply-verified-answers-for-sales-stages.png" alt-text="Screenshot of applying verified answers and returning to the all verified answers view.":::

1. Verified answers list all phrases connected to visuals, along with their phrase counts. You can select each phrase to update or remove it.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/verified-answers-list.png" alt-text="Screenshot of the verified answers list.":::

## Add AI instructions (preview)

AI Instructions enable you to enhance Copilot's capabilities by connecting it to your organization's knowledge. By providing key business context, guidance, and domain-specific logic, you help Copilot understand your business's specific needs and deliver more relevant, accurate responses. Throughout your development, iteratively refine your AI instructions and test Copilot’s responses to ensure accuracy and alignment with business goals.

1. Choose **Add AI instructions**, copy and paste the following example into the instructions field, and select **Apply**.

    ```text
        Tailor responses to industry norms for a software company's sales channel. Sales managers monitor their direct and partner sales channels by tracking opportunities and revenue by region, deal size, and channel.
    
            Specific instances:
            - Key earners refers to the top three partners by total revenue.
            - If asked about "Clients", "Customers", or "Organizations" use the Accounts table.
            - For sales cycle questions, always use the Average Opportunity Days measure.
            - Opportunity Days is synonymous with Sales Cycle duration, or Time to Close (TTC)
            - "Leads", "Deals", "Potential Deals" and "Sales Prospects" are all phrases that refer to the opportunities table. 
            - If asked about early stages of an opportunity, only show the Solution stage. 
            - If the audience is leadership, prioritize revenue and opportunity count, as well as the number of deals in the finalize stage.
    ```

    :::image type="content" source="media/tutorial-copilot-in-power-bi/add-ai-instructions.png" alt-text="Screenshot of adding AI instructions.":::

2. Select **Close** to return to the Report view page.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/close-button.png" alt-text="Screenshot of the Close button in Prep data for AI dialog window.":::

## Test your data with Copilot (preview)

Before sharing your data with others in your organization, you should test it thoroughly with Copilot. This involves trying common questions users might ask to ensure Copilot provides accurate and helpful responses, experimenting with different inputs based on the AI instructions to verify that Copilot can handle a range of scenarios effectively, and attempting to access available fields from your simplified data schema to confirm that Copilot can retrieve and utilize the available information.

1. From the Copilot pane, ask this example question and select **Send** or **Enter** to confirm.
    - What three affiliates had the most leads across the eastern zone?

    :::image type="content" source="media/tutorial-copilot-in-power-bi/copilot-desktop-pane-question.png" alt-text="Screenshot of the Copilot pane and submitting a question.":::

1. A list response is returned using the terms and variances included within the AI instructions. You can provide feedback using the **thumbs up** or **thumbs down** buttons. Select the close (**X**) button to continue.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/copilot-desktop-pane-answer.png" alt-text="Screenshot of the Copilot pane returning a response for a question.":::

## Publish

Publishing your Power BI report to the cloud allows for seamless sharing and collaboration within your organization, enabling team members to access and interact with the report and its semantic model. Additionally, with Copilot, it can help make more informed decisions using natural language inputs with your data.

1. Select the **Publish** button located on the Home tab of the ribbon. Save changes if prompted and search your list of available workspaces to find the workspace into which you want to publish. Select **My workspace**, and then **Select**.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/publish-my-workspace.png" alt-text="Screenshot of the Publish button and destination selection window.":::

1. When publishing is complete, you receive a link to your report. Select the link **Open ‘Revenue Opportunities.pbix’ in Power BI** to open the report.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/open-in-power-bi-service.png" alt-text="Screenshot of the Publishing to Power BI success window.":::

## Descriptions

The item’s name and description are equally important for data discovery with Copilot. Use the description to provide full natural language context about the item, using relevant and distinct keywords when appropriate to help Copilot (and your users) know what the item can answer.

1. From the action bar, select **File** > **Settings**.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/report-settings.png" alt-text="Screenshot of the report settings option.":::

1. Update the report **Description** field to the following example text, then select **Save**.

    - A comprehensive analysis of sales opportunities and revenue distribution across various dimensions for software products.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/report-description.png" alt-text="Screenshot of the report description field.":::

1. From the action bar, select more options (...) and then the **View semantic model** option.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/view-semantic-model.png" alt-text="Screenshot of a published report and the view semantic model option.":::

1. Within the semantic model viewer, select **File > settings**.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/semantic-model-settings.png" alt-text="Screenshot of the semantic model properties and the settings option.":::

1. Update the **Semantic model description** field to the following example text and then select **Apply**.

    - The semantic model offers data for insights into sales opportunities and revenue distribution for software products. It includes information on the number of opportunities at each sales stage, variations by stage, and total revenue by opportunity size and region. Additionally, it tracks accounts, partners, products, sales stages, sales activities, and dates, providing a comprehensive view to optimize sales processes and enhance revenue generation.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/semantic-model-description.png" alt-text="Screenshot of the semantic model description option.":::

## AI preparation (preview)

Marking your semantic model as Prepped for AI is a critical step because it signals to Copilot that the model is optimized for AI experiences. For models that aren't prepped, users should inspect the results thoroughly. Clear messaging and indicators are displayed for answers from items that aren't prepped, advising users to contact the content owner to prepare the data for AI to ensure accuracy and relevance.

1. In the settings for the semantic model, expand the **AI preparation** setting, select the checkbox for **Prepped for AI**, and select **Apply**.

    :::image type="content" source="media/tutorial-copilot-in-power-bi/ai-preparation.png" alt-text="Screenshot of the AI preparation semantic model setting.":::

## Next step

> [!div class="nextstepaction"]
> [Discover data and ask questions](tutorial-copilot-in-power-bi-discover-data.md)