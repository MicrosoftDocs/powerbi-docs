---
title: Use Copilot with semantic models
description: Discover how to use Copilot in Power BI to enhance data analytics, streamline semantic model development, and improve report consumption experiences.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: daengli
ms.service: powerbi
ms.topic: concept-article
ms.date: 04/15/2025
ms.collection: ce-skilling-ai-copilot
---

# Use Copilot with semantic models

This article helps you to use the Copilot experiences in Power BI for semantic models.

Copilot in Microsoft Fabric is a generative AI assistant that aims to enhance the data analytics experience in the Fabric platform, including the Power BI workload. You can use Copilot in Power BI to support both the development and the consumption of semantic models by both self-service and enterprise users. When used effectively, Copilot can support both analysts and business users to improve productivity and get more value from their semantic models.

However, to use Copilot with semantic models in Power BI, you must first prepare your data, your semantic model, and your users. If you fail to do so, then Copilot produces mainly low-quality and inaccurate outputs that might be incorrect or even misleading. The following sections guide you through how you can use Copilot in Power BI to either develop or consume a semantic model with the available Copilot experiences.

> [!NOTE]
> For additional information, see the [Copilot in Power BI documentation](copilot-introduction.md).
>
> Copilot and its capabilities are evolving over time. The Copilot experiences in the following sections will change, and new experiences might become available with semantic models. As such, you should keep up to date with the monthly Power BI releases and any relevant Copilot announcements.

> [!IMPORTANT]
> You can't enable or disable Copilot in specific workloads, or for specific Copilot experiences. If Copilot in Fabric is enabled in your capacity for a user or security group, then all workloads and Copilot experiences are accessible for those users.

## Develop a semantic model with help from Copilot

When you develop a semantic model in Power BI, you can use Copilot to help improve the efficiency and convenience of certain tasks. Typically, this involves leveraging Copilot to streamline redundant or repetitious changes for you (such as generating measure descriptions) or helping you to tackle or understand challenging model design or DAX (such as using Copilot in the DAX query view to explain DAX concepts or to generate DAX queries).

The following sections explain how a Power BI developer or analyst who creates semantic models can leverage the various Copilot experiences in Power BI.

> [!NOTE]
> The following sections focus on the experiences that support semantic model development in Power BI Desktop, and not online by using [*Edit data models in the Power BI service*](../transform-model/service-edit-data-models.md). The guidance and considerations in the following sections might still apply when you edit data models in the Power BI service, but be aware that differences exist between these two experiences.
>
> In general, we recommend that you develop Power BI semantic models by using Power BI Desktop or third-party tools, then publish these models to the Power BI service when you're ready to use them. However, you can also edit data models in the Power BI service if that is your preference, or if you can't use desktop tools to develop your model.

### Ask data questions

While you develop a semantic model, you often need to explore and query the data. Normally, you would do this by using a combination of the Power Query editor, the report canvas, and DAX queries. However, you can also ask data questions about your model and its contents by using the Copilot chat pane. Generally, asking data questions is more of a consumption experience, where business users can ask questions about the data when they can't find the answer in a report. However, developers might use this to explore data or validate how Copilot performs on their model.

The following image shows an example of a user asking a data question to Copilot about a semantic model. The image shows the following prompt: *What was the profit % for the Australia sales region in 2023?*

:::image type="content" source="media/copilot-semantic-models/copilot-chat-pane-01.svg" alt-text="Screenshot showing the Copilot chat pane where user asks a data question that Copilot answers with the semantic model.":::

#### Use cases

You can use Copilot to ask data questions for the following use cases:

- **Explore data in your model:** A developer might use the *Ask data questions* experience to explore the data in their model by using Copilot. However, it's likely more efficient to explore the data by adding visuals to the report canvas, or by using DAX queries. That's because report visuals automatically update whenever you make changes in the model, but answers to data questions in the Copilot chat pane are static, and disappear whenever you close the Copilot chat pane. Additionally, visuals generated by Copilot can contain visual-specific filters that you can't create yourself in Power BI Desktop. These filters can be misleading or troublesome to investigate.

- **Validate Copilot use for consuming the semantic model:** Developers should use the *Ask data questions* experience to understand and test how Copilot consumption experiences perform on their semantic model. This is the main use case for using *Ask data questions* when you develop a semantic model. This use case lets a developer make changes to their semantic model that might better support Copilot to produce more useful outputs.

> [!IMPORTANT]
> When you design your semantic model, ensure that you discuss with users and document how they'll consume it, including which items, tools, and experiences they'll use. If users won't use Copilot in Power BI, then a developer doesn't need to use the *Ask data questions* experience to test their model. However, if users plan to use Copilot to consume semantic models now or in the future, then it's essential for developers to account for this during both model design and development.

#### Benefits

A developer can use *Ask data questions* to understand how the experience will be for business users who consume the semantic model by using Copilot in Power BI. This testing is essential if business users want to use Copilot to consume a semantic model.

#### Specifics of the experience

The *Ask data questions* experience differs from the standard Copilot in Fabric process in the following areas. This overview applies to use of the *Ask data questions* experience when both *developing* and *consuming* semantic models:

- **Input:** Users provide a written prompt asking a question or requesting specific information from the semantic model.

- **Preprocessing and grounding data:** Copilot retrieves grounding data from the model schema. It performs schema reduction to try to restrict the context to what is most important. As context, Copilot takes the following information to try to improve the usefulness and specificity of the Copilot output:
  - Any report metadata on the current report page. If there's relevant report metadata, then Copilot in Power BI answers data questions from the report instead of the model.
  - The conversation with Copilot in the current session. This includes any previous questions and outputs, which includes data points from data questions that Copilot previously answered.
  - The semantic model schema, which includes tables, rows, columns, measures, and other objects (like relationships, calculation groups, and so forth).
  - The full model linguistic schema.
  - Certain semantic model properties, including descriptions, data types, format strings, and data category.

  The following information is excluded:
  - Any report page that's hidden.
  - Any field (measure or column) in the model that's hidden.
  - Any table in the model that's marked as *private*.

- **Output:** The output that Copilot provides contains several parts:
  - **Visual:** Copilot answers the data question by rendering a Power BI visual, such as a card, a line chart, or a table. Copilot chooses the visual and its formatting, which the user can't control or request in their prompt. The visual might time out if the underlying model, DAX, or data isn't optimized or is too complex.
  - **Summary:** Copilot summarizes the query result. This summary is generated by sending a semantic query result back to Azure OpenAI (which includes data points) and requesting a natural language explanation.
  - **Errors or clarification request:** If Copilot is unable to produce a response, it might return a generic error message. This error message could include a request for clarification, including suggested variants of the user's original data question.

> [!CAUTION]
> When using Copilot in Power BI with semantic models in Power BI Desktop, Copilot might use report metadata as grounding data. In certain circumstances, report metadata can contain data points, such as column values, which might include sensitive information. This is true both for the legacy report metadata format and the new [Power BI enhanced report (PBIR) format](../developer/projects/projects-report.md).

#### Tips to improve Copilot outputs

Copilot can produce inaccurate or low-quality outputs, including incorrect answers to data questions. Often, incorrect answers arise from either user mistakes or model issues. To reduce the probability of wrong or unexpected Copilot outputs, you can address user prompts and data model design.

> [!IMPORTANT]
> Inaccurate responses to data questions can lead to incorrect decisions and actions by business users, which produces bad results. To avoid this negative impact, it's important that you mitigate the probability of inaccurate responses by Copilot as much as possible.

A user can only really produce incorrect results by writing a poor prompt. Examples of poor prompts include:

- **Vague or incomplete prompts:** If you inaccurately or incompletely describe the desired output or you use ambiguous language in your prompt, then Copilot is less likely to produce a useful result. When writing prompts, you should try to be as specific and descriptive as possible in stating your desired result.

- **Incorrect prompts:** If you make spelling mistakes when you refer to a measure, column, or table name, then Copilot might not refer to the correct field. When writing prompts, you should ensure that the fields you mention in your prompt refer correctly to the fields in the semantic model schema. This includes avoiding abbreviations, acronyms, or excessive punctuation. Note that you can also use synonyms to refer to fields, but there's no way to validate which synonyms are available for a given field (like how you can see descriptions when hovering on a measure or column in the Data pane).

- **Excessive or inappropriate grounding data:** If you submit a prompt via the Copilot chat pane, then Copilot takes the chat history from that session as grounding data during preprocessing. Depending on what that chat history entails, you might get different or unexpected results. When writing prompts, you should take into consideration that any previous prompts and outputs will be used as grounding data. To avoid this, you can select the Copilot button to close and reopen the Copilot chat pane, clearing the chat history before you submit a new prompt.

The following image shows an example of an incorrect output from Copilot due to a poor user prompt:

:::image type="content" source="media/copilot-semantic-models/copilot-chat-pane-01.svg" alt-text="Screenshot showing the Copilot chat pane where user asks a data question that Copilot answers with the semantic model.":::

The image shows the following prompt: *What was the profit % for the Australia sales region in 2023?* In the output, Copilot returns the profit value rather than the profit as a percentage. In this case, the user could obtain a better result from Copilot by specifying more clearly that they want the profit in percentage (rather than using the percentage symbol).

Aside from user prompts, the *Ask data questions* experience can also produce incorrect or unexpected results due to the quality or organization of the underlying semantic model. Examples of when your semantic model produces poor results include:

- **Poor model design or implementation:** If your semantic model doesn't follow common best practices (such as a [star schema design](../guidance/star-schema.md)), then you're likely to get poor results with any consumption tool or experience. You should always strive for quality semantic models to get the most out of Power BI and Fabric. See also [Data modeling guidance for Power BI](../guidance/index.yml) for more tips and guidance to improve your Power BI semantic models.

- **Poor naming conventions:** If your fields have inconsistent or excessive naming conventions (such as acronyms, abbreviations, and punctuation), then users are more likely to make mistakes in their prompts and Copilot will get confused when referring to these fields. Copilot works best when tables, columns, and measures have names in human-readable English.

- **Poor model organization:** If you don't organize your model, then you're likely to experience more issues with Copilot. Model organization is a large topic that encompasses many tasks, including field descriptions, hiding columns and measures, and avoiding fields with the same names across different tables.

- **Linguistic modeling:** If your semantic model doesn't have linguistic modeling set up, including synonyms for fields or verbs for relationships, then Copilot might be more likely to return unexpected results. Power BI relies on the same linguistic modeling as the Q&A feature. Setting up a linguistic model for your semantic model costs additional time and effort on top of your semantic model development tasks. However, you can offset this slightly by [using Copilot to generate synonyms](#linguistic-schema), explained later in this article.

- **Model complexity:** The more complex your model is, including having more fields, dependencies, and business logic, the more likely you are to experience difficulties when using Copilot. For instance, complex patterns like currency conversion or disconnected tables (like [field parameters](power-bi-field-parameters.md)) might cause unexpected or incorrect results when users reference these fields or tables in their prompts. With more complex models, you might need to consider specific model design decisions to obtain the best results with Copilot. In general, you should test your model with Copilot to determine whether you get consistently correct and reliable results. If not, you might want to consider advising users not to use Copilot to consume your semantic model.

> [!NOTE]
> For more information, see [Prepare a semantic model for Copilot consumption](#prepare-a-semantic-model-for-copilot-consumption) later in this article. See also the separate article [update your data model to work well with Copilot for Power BI](copilot-evaluate-data.md) for additional considerations.

The following image shows an example of an incorrect output from Copilot due to problems with the semantic model:

:::image type="content" source="media/copilot-semantic-models/copilot-chat-pane-02.svg" alt-text="Screenshot showing an example of a user asking a data question that Copilot answers incorrectly with the semantic model.":::

The image depicts the following prompt: *How many units were sold in Australia in 2023?* In the response, Copilot returns the number of units where the *Country* column in the *Customer* table is filtered to "Australia", instead of filtering the *Country* column in the *Sales region* table. In this case, the user could have improved the prompt to specify sales region country. However, the semantic model developer could also hide or rename the *Country* column in the *Customer* table if it isn't intended to be used by Copilot. Alternatively, they could disable the field from the [field synonyms](../natural-language/q-and-a-tooling-intro.md#field-synonyms) of the linguistic model by using the Q&A setup.

We discuss the importance of the linguistic schema and Q&A setup in the section [Linguistic schema](#linguistic-schema).

> [!TIP]
> You can identify which fields and filters Copilot uses to generate a visual or answer a data question by clicking the *Add to page* button. This adds the visual to the report canvas, where you can select the visual and view any filters Copilot applies or the fields Copilot uses.

Irrespective of prompt or model quality, you can still obtain inaccurate or low-quality outputs from Copilot when you use the *Ask data questions* experience. That's because the underlying model—with its current configuration—is nondeterministic and isn't guaranteed to produce a correct answer, or the same answer with the same prompt, model, and data.

The following image shows an example of Copilot producing inaccurate or inappropriate results:

:::image type="content" source="media/copilot-semantic-models/copilot-chat-pane-03.svg" alt-text="Screenshot showing another example of a user asking a data question that Copilot answers incorrectly with the semantic model.":::

In this example, the image shows the prompts: *Question: Which country produced the highest profit in 2024?* and *Question: Which country produced the highest profit in 2023?* The outputs show Copilot first asking for clarification after it says that there's no data for 2024 in the model. However, there *is* data in the model in 2024 when filtering to that year using the date table. Copilot then returns a result filtering the *Birthday* column from the *Customer* table, rather than the marked date table in the model. While the user could produce a more specific prompt or the developer could hide the *Birthday* field, in this case, Copilot should produce the expected result.

To mitigate this, it's important to train users to critically appraise any outputs that they obtain from Copilot in Fabric and Power BI, and what to do to troubleshoot unexpected results or to try a new prompt by closing and reopening the Copilot chat pane or window.

### DAX query view

While developing a semantic model, you can use Copilot to generate DAX queries in the DAX query view. In these queries, you can also define DAX measures, which you can then add to your semantic model. You can also use Copilot to explain DAX concepts either in generated queries or queries that you authored yourself.

The following image shows an example of a user asking Copilot to generate a DAX query.

:::image type="content" source="media/copilot-semantic-models/copilot-dax-query-01.svg" alt-text="Screenshot showing an example of a user asking for a DAX query that Copilot answers in the DAX query view.":::

The image depicts the following prompt: *YTD profit by month in 2023.* The user could then ask Copilot to explain the query, as depicted in the following image.

:::image type="content" source="media/copilot-semantic-models/copilot-dax-query-02.svg" alt-text="Screenshot showing an example of a user asking to explain a DAX query that Copilot answers in the DAX query view.":::

The image depicts the following prompt: *Explain this DAX query.* The explanation is shown at the bottom of the Copilot window.

#### Use cases

You can use Copilot in the DAX query view for the following use cases:

- **Generate DAX queries:** You can use Copilot to suggest DAX queries, which you can use to:
  - Explore or analyze your model or data.
  - Test and validate your model or data.
  - Try new approaches or patterns to calculations in DAX.

- **Refactor existing DAX queries:** You can use Copilot to more conveniently or efficiently modify queries that you copied or wrote yourself, such as:
  - Adding comments to explain and document a DAX query or measure.
  - Making the query easier to read and understand, such as a query copied from a Power BI report visual that you're investigating.
  - Making large or repetitious replacements in the code.
  - Asking Copilot to remove or replace variables.

- **Generate DAX measures:** You can use Copilot to suggest DAX measures which are defined upstream of a generated query. These measures can be limited to the DAX query you generate or added to your semantic model.

- **Explain DAX concepts:** You can use Copilot to explain and better understand different concepts in DAX, such as:
  - DAX query or a defined measure in the query.
  - DAX functions, such as [CALCULATE](https://dax.guide/calculate/) or [KEEPFILTERS](https://dax.guide/keepfilters/).

#### Benefits

The main benefit of using Copilot in the DAX query view is that you get support when you write DAX queries. This means that less experienced developers and analysts can use Copilot to learn DAX concepts or generate DAX to use in their model. It can also save intermediate and experienced developers time when they need to develop DAX, but they can't remember a particular function or pattern, or when they want to refactor or simplify an existing query.

There are other generative AI tools that you can use for DAX code, but Copilot in Power BI has the following specific benefits:

- Copilot in Power BI is developed in collaboration with the authors of the DAX language.
- Copilot doesn't use any model fine-tuning, but it contains metaprompts with specific DAX examples by Microsoft.
- You don't have to copy or paste code or model information, since Copilot is integrated in Power BI Desktop.
- During postprocessing, Copilot uses a DAX parser to ensure that the query is valid, which reduces the probability of receiving hallucinations in your queries.

> [!WARNING]
> Inexperienced Power BI developers or analysts should ensure that they validate and understand any DAX that they generate *before* they use it. This is particularly important when you use Copilot in the DAX query view to suggest measures that you add to your model. That's because Copilot doesn't know where you'll use that measure, and while the suggested code might work in the initial DAX query, in a different filter context of your report, it could produce unexpected or incorrect results.
>
> To validate and understand DAX, these inexperienced developers can use Copilot to add comments to the code, explain concepts, and also research the patterns or functions by using verified online sources, such as [Microsoft documentation](/dax/).

#### Specifics of the experience

The Copilot experiences in the DAX query view have steps during preprocessing and postprocessing that differ from the other Copilot experiences in Fabric.

Copilot in the DAX query view has the following specifics to keep in mind:

- **Input:** Users provide a written prompt in an input box specific to a single DAX query window. They can request a query, request changes to an existing query that Copilot already generated or explain a DAX concept. In the input box, users can also select buttons to generate queries. The Retry button will re-generate the query while neglecting the current context, so that you can try to get a different approach.

- **Preprocessing and grounding data:** Copilot retrieves grounding data from the model schema and anything in the query window. Copilot takes the following information as context to try to improve the usefulness and specificity of the Copilot output:
  - Any text that's in the current DAX query window, including DAX code you've written, comments, or previous DAX queries that you generated.
  - The conversation history with Copilot from the currently active session. This includes any previous questions and outputs, but not data points.
  - The semantic model schema, which includes tables, rows, columns, measures, and other objects (like relationships, calculation groups, and so forth). This includes all objects irrespective of whether they're hidden or not (except when you have a live connection to a shared semantic model).
  - Synonyms from the model linguistic schema.
  - Certain semantic model properties, including DAX expressions, descriptions (truncated after the first 200 characters), data types, format strings (and format string expressions), and data category.
  - Some statistical aggregations like minimum and maximum values of columns from your model that might be used in a query. These are data points sent to Copilot as context.
  - Copilot might also send the query result back to Azure OpenAI to be able to explain the generated query or its results.

  The following information is excluded:
  - The conversation history with Copilot in the current session when you select the Retry button.
  - Any table in the model that's marked as *private.*
  - Comments in DAX expressions.

- **Output:** The output that Copilot provides contains either DAX code and DAX comments in the DAX query window, or explanations of the DAX in the Copilot input box. A user typically must then choose to run and keep the query themselves.

#### Tips to improve Copilot outputs

To improve the quality of DAX queries generated by Copilot, you should use the same tips as when you use the [*Ask data questions* experience in Copilot](#ask-data-questions). Specifically, you should ensure that your prompts are clear, accurate, and descriptive, and that your semantic model is well-designed, organized, and doesn't contain too much complexity or exceptions.

> [!NOTE]
> For more information, see [Prepare a semantic model for Copilot consumption](#prepare-a-semantic-model-for-copilot-consumption) later in this article. See also the separate article [update your data model to work well with Copilot for Power BI](copilot-evaluate-data.md) for additional considerations.

Some tips specific to the DAX query experience are as follows:

- **Differences between local and live connection models:** Copilot works differently depending on whether you're querying a local model open in Power BI Desktop or a shared semantic model in the Power BI service. For instance, when you have a live connection to a shared semantic model and use the DAX query view experience:
  - Copilot can't see the DAX expressions of measures, or any hidden or private objects.
  - Copilot must run the DAX query before returning it to ensure the query is valid.

- **Use the Retry button:** The Retry button empties the Copilot cache, ensuring that you get a new result with the same prompt and grounding data. This is useful when you're iteratively working toward a solution that meets your specific requirements.

- **Ask Copilot to add comments to your code:** Comments are a useful way to organize and document your DAX queries, and to help you understand the code that Copilot generates. You can also ask Copilot to explain the DAX concept.

- **Check quality, peer-reviewed sources:** If you still don't understand the generated code with comments and explanations from Copilot, you should research the functions and patterns online from reputable sources either in the [Microsoft documentation](/dax/) or from the [Power BI community](https://community.powerbi.com/).

- **Beware of variable usage by Copilot:** Copilot can struggle to use variables appropriately in DAX queries and defined measures. For instance, Copilot might try to filter or group a variable that's already been declared, which isn't possible and produces an unexpected result.

- **Use concise descriptions to distinguish between similarly named fields:** Descriptions help when similar fields exist in the same model, such as *Name* in the *Customer* table and *Name* in the *Store* table.

- **Beware calculation group usage by Copilot:** Copilot can struggle to use calculation groups in your suggested queries. To improve Copilot's use of calculation groups, you should include calculation item names listed in the calculation group description.

- **Beware newer functions and DAX syntax:** Copilot and other generative AI tools are limited in their training data volume and scope. As such, they're more likely to make mistakes with newer DAX functions or syntax. For these scenarios, you might want to try authoring the query yourself first, then revising it by using Copilot.

- **When generating measures, always ask for a query:** The Copilot experience in the DAX query view is designed to generate DAX queries. You'll get the best results when you instruct Copilot to perform this task, rather than asking it to generate a measure or another DAX expression.

### Linguistic schema

You can use Copilot to suggest synonyms for fields and linguistic relationships for your model. You create synonyms or relationships when creating the linguistic schema for your semantic model. This *linguistic modeling* is important to ensure that both Q&A and Copilot can return useful results when users pose questions to a semantic model. They're used to interpret user prompts and identify the right fields, such as the synonym *Turnover* being used to identify a measure named *Sales amount*.

To add synonyms and relationships to your semantic model, you have to enable the Power BI Desktop setting [*Turn on Q&A to ask natural language questions about your data*](../natural-language/q-and-a-data-sources.md) in the Data Load settings of the current file. Then, you can open the Q&A setup window via *Q&A Setup* in the *Modeling* ribbon of Power BI Desktop.

The following image depicts the Q&A setup window in Power BI Desktop, where you can add synonyms and relationships for use by both Q&A and Copilot in Power BI.

:::image type="content" source="media/copilot-semantic-models/desktop-q-and-a-setup-01.svg" alt-text="Screenshot showing user interface of Q&A setup in Power BI Desktop.":::

From here, you can add synonyms or relationships manually, or add suggested synonyms from your organization, a thesaurus, or by using Copilot suggestions. Copilot can suggest both synonyms and new relationship types to add to your semantic model. Copilot can also interpret unrecognized terms. For synonyms, you can adjust this from the *Suggestion settings* menu, as shown in the following image.

:::image type="content" source="media/copilot-semantic-models/desktop-q-and-a-setup-02.svg" alt-text="Screenshot showing user interface of synonyms view in Q&A setup of Power BI Desktop.":::

For more information about using the Q&A setup menu, see [Intro to Q&A tooling to train Power BI Q&A](/power-bi/natural-language/q-and-a-tooling-intro).

Instead of using the Q&A setup window, you can also add synonyms and relationships by using linguistic schema YAML files. For more information, see the blog post [Editing Q&A linguistic schemas](https://powerbi.microsoft.com/blog/editing-q-a-linguistic-schemas/).

We recommend that you use Copilot to generate synonyms as the first step when performing linguistic modeling for your semantic model. Then, you can curate the suggested synonyms, removing the ones that don't make sense, and adding additional synonyms where necessary. Ensure that you [share useful synonyms with your organization](../natural-language/q-and-a-tooling-intro.md#synonym-sharing) to reuse them.

Also, if you want to exclude a table, column, or measure from use by Q&A or Copilot, you can disable *Include in Q&A* in the *Synonyms* window of Q&A setup. This is recommended when you have technical or redundant fields that you don't want to reference using the various Copilot experiences.

> [!NOTE]
> If you don't plan to use Copilot or Q&A for your semantic model, then you don't need to set up a linguistic schema. Linguistic modeling only benefits these specific features.

#### Benefits

Using Copilot to suggest synonyms can save developers time and help come up with new synonyms that they wouldn't otherwise consider. This can make linguistic modeling more efficient and effective, if you need to use it.

#### Tips to improve Copilot outputs

This Copilot experience uses the following grounding data for context:

- The semantic model schema, which includes unhidden tables, rows, columns, measures, and other objects (like relationships, calculation groups, and so forth).
- The full model linguistic schema.
- Certain semantic model properties, including descriptions, data types, format strings, and data category.

Given this grounding data, you can ensure that suggested synonyms are useful by:

- Using consistent and accurate naming conventions.
- Avoiding the use of punctuation, acronyms, and abbreviations, where possible.
- Naming tables, columns, and measures in English.

### Measure descriptions

You can use Copilot to [generate descriptions for model measures](../transform-model/desktop-measure-copilot-descriptions.md). Measure descriptions are important for both model consumers and other developers to understand the purpose of a measure and how they should use it. Also, measure descriptions can improve the usefulness of Copilot outputs for other Copilot experiences, such as when you [use Copilot to generate DAX queries in the DAX query view of a Power BI semantic model](#dax-query-view).

We recommend that you use Copilot to generate measure descriptions for your model measures. Then, you can review the results and revise them to ensure they're accurate, concise, and helpful.

#### Benefits

Creating measure descriptions is normally an arduous task that's often neglected. Generating measure descriptions reduces the time that you have to spend organizing and documenting your semantic model. Unlike a linguistic schema, all semantic models can benefit from adding descriptions to tables, columns, and measures. This helps to improve model documentation and usefulness for others in your organization.

> [!TIP]
> If you need measure descriptions in another language, you can generate them in English first. Then, you can translate your published model automatically using other tools, such as [semantic link labs in notebooks](https://semantic-link-labs.readthedocs.io/en/stable/sempy_labs.html#sempy_labs.translate_semantic_model).

#### Tips to improve Copilot outputs

This Copilot experience uses the following grounding data for context:

- DAX expressions for measures and calculated objects.
- Field properties, including descriptions, data types, format strings, and data category.
- Field synonyms.

Given this grounding data, you can ensure that suggested synonyms are useful by:

- Using consistent naming conventions.
- Limiting the use of punctuation, acronyms, and abbreviations.
- Naming measures in English.

## Consume a semantic model by using Copilot

You can use Copilot to pose data questions to your semantic models during consumption. This experience is available whenever you use a report, including in [Power BI Desktop](#power-bi-desktop), a [published report](#published-report) in a workspace, app, or OrgApp item, or in the [Power BI mobile app](#power-bi-mobile-app).

Consumers might ask data questions of a semantic model in the following scenarios:

- They can't find the information or analysis that they need in their reports.
- They want to see data presented in a different way, and [personalize visuals](/power-bi/create-reports/power-bi-personalize-visuals?tabs=powerbi-desktop) isn't enabled.
- They want to ask a data question using natural language, rather than using tools or code.

> [!NOTE]
> See [Ask data questions](#ask-data-questions) earlier in this article about developing a semantic model with help from Copilot. The images and guidance there also apply when using the ask data questions experience to consume a semantic model.

For more information about how you can use Copilot in reports, which consume a semantic model, see the article [Use Copilot with Power BI reports](copilot-reports-overview.md).

### Prepare a semantic model for Copilot consumption

You should only use Copilot to consume semantic models once you've taken the necessary steps to [update your data model to work well with Copilot for Power BI](copilot-evaluate-data.md).

> [!TIP]
> Consider using [tags to label semantic models](/fabric/governance/tags-apply) as ready for Copilot consumption. This can be a convenient way to allow data consumers to identify models that they can use with Copilot and expect better results. Alternatively, you can also consider the readiness of a semantic model for use with Copilot as a criteria for its [endorsement](/fabric/governance/endorsement-overview) to promoted or even [certified](/fabric/admin/endorsement-certification-enable) status.
>
> If your models aren't ready for use with Copilot in Power BI, but users still want the flexibility to interrogate the data themselves, consider using [personalize visuals](power-bi-personalize-visuals.md?tabs=powerbi-desktop). Alternatively, you can show users how to use [explorations of the data](../explore-reports/explore-data-service.md) or to [connect to the semantic model](../connect-data/desktop-report-lifecycle-datasets.md) from Power BI Desktop or Excel to create their own reports.

### Power BI Desktop

In Power BI Desktop, you can ask data questions of your semantic model by using the Copilot chat pane. This works both with local models open in Power BI Desktop, and when you're connected to a shared semantic model by using a live connection. For more information, see [*Ask data questions*](#ask-data-questions) earlier in this article.

You can also use the DAX query view to consume a semantic model by generating DAX queries. Advanced users of Power BI might do this if they prefer to explore data using code.

However, for most data consumers, it's generally more convenient and more efficient to consume and explore a semantic model by adding visuals to the report canvas, or using other items like [explorations](../explore-reports/explore-data-service.md) or Analyze-in-Excel pivot tables. These items typically have a simpler user interface and user experience better suited to exploring and understanding data than natural language chat-like experiences, such as Copilot.

> [!TIP]
> You can use Copilot experiences in Power BI when connected to semantic models that are published to Pro or PPU workspaces. The only requirement is that you configure Power BI Desktop to consume Copilot from a F64 workspace; this occurs independently of which semantic model that you connect to and consume.

### Published report

In a published report, you can also ask data questions of the connected semantic model by using the Copilot chat pane. This experience in Fabric is identical to the *Ask data questions* experience in Power BI Desktop for both model development and consumption.

> [!NOTE]
> Slight differences might exist between Copilot experiences in Fabric and in Power BI Desktop. Eventually, over time, these experiences will have parity and work the same way.

### Power BI mobile app

In the Power BI mobile app, you can also ask data questions for any report by using the Copilot chat pane in the app. The questions will be directed to the connected semantic model for that report. This works similarly to the [*Ask data questions*](#ask-data-questions) experience explained earlier in this article.

## Related content

- [Update your data model to work well with Copilot for Power BI](copilot-evaluate-data.md)
- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Copilot in Power BI integration](copilot-integration.md)
