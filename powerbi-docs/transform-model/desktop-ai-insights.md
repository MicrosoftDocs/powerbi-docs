---
title: Connect to AI Insights in Power BI Desktop
description: Learn how to apply a collection of pre-trained machine learning models from AI Insights to your data in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.custom: build-2023, build-2023-dataai
ms.topic: how-to
ms.date: 11/10/2023
LocalizationGroup: Connect to data
---
# Use AI Insights in Power BI Desktop

In Power BI, you can use AI Insights to gain access to a collection of pre-trained machine learning models that enhance your data preparation efforts. You can access AI Insights in the **Power Query Editor**. You can find its associated features and functions through the **Home** and **Add Column** tabs in **Power Query Editor**.

:::image type="content" source="media/desktop-ai-insights/ai-insights-00.png" alt-text="Screenshot of AI Insights in the Add Column tab.":::

This article describes the functions for Text Analytics and Vision functions, both from Azure Cognitive Services. Also in this article is a section that describes the custom functions available in Power BI from Azure Machine Learning.

## Use Text Analytics and Vision

With Text Analytics and Vision in Power BI, you can apply different algorithms from [Azure Cognitive Services](https://azure.microsoft.com/services/cognitive-services/) to enrich your data in Power Query.

The following services are currently supported:

* [Sentiment Analysis](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis)
* [Key Phrase Extraction](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-keyword-extraction)
* [Language Detection](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-language-detection)
* [Image Tagging](/azure/cognitive-services/computer-vision/concept-tagging-images).

The transformations are executed on the Power BI service and don't require an Azure Cognitive Services subscription.

> [!IMPORTANT]
>
> Using the Text Analytics or Vision features requires Power BI Premium.

### Enable Text Analytics and Vision on Premium capacities

Cognitive Services are supported for Premium capacity nodes EM2, A2, or P1 and other nodes with more resources. A separate AI workload on the capacity is used to run Cognitive Services. Before you use Cognitive Services in Power BI, you must enable the AI workload in the **capacity settings** of the admin portal. You can turn on the **AI workload** in the **workloads** section and define the maximum amount of memory you would like this workload to consume. The recommended memory limit is 20%. Exceeding this limit causes the query to slow down.

### Available functions

This section describes the available functions in Cognitive Services in Power BI.

#### Detect language

The **Detect language** function evaluates text input, and for each field, returns the language name and ISO identifier. This function is useful for data columns that collect arbitrary text, where language is unknown. The function expects data in text format as input.

Text Analytics recognizes up to 120 languages. For more information, see [supported languages](/azure/cognitive-services/text-analytics/text-analytics-supported-languages).

#### Extract key phrases

The **Key phrase extraction** function evaluates unstructured text, and for each text field, returns a list of key phrases. The function requires a text field as input and accepts an optional input for a **Language ISO code**.

Key phrase extraction works best when you give it bigger chunks of text to work on, opposite from sentiment analysis. Sentiment analysis performs better on smaller blocks of text. To get the best results from both operations, consider restructuring the inputs accordingly.

#### Score sentiment

The **Score sentiment** function evaluates text input and returns a sentiment score for each document, ranging from 0 (negative) to 1 (positive). **Score sentiment** also accepts an optional input for a **Language ISO code**. This function is useful for detecting positive and negative sentiment in social media, customer reviews, and discussion forums.

Text Analytics uses a machine learning classification algorithm to generate a sentiment score between 0 and 1. Scores closer to 1 indicate positive sentiment. Scores closer to 0 indicate negative sentiment. The model is pre-trained with an extensive body of text with sentiment associations. Currently, it's not possible to provide your own training data. The model uses a combination of techniques during text analysis, including text processing, part-of-speech analysis, word placement, and word associations. For more information about the algorithm, see [Introducing Text Analytics](/archive/blogs/machinelearning/machine-learning-and-text-analytics).

Sentiment analysis is performed on the entire input field, as opposed to extracting sentiment for a particular entity in the text. In practice, there's a tendency for scoring accuracy to improve when documents contain one or two sentences rather than a large block of text. During an objectivity assessment phase, the model determines whether an input field as a whole is objective or contains sentiment. An input field that is mostly objective doesn't progress to the sentiment detection phrase, resulting in a 0.50 score, with no further processing. For input fields continuing in the pipeline, the next phase generates a score greater or less than 0.50, depending on the degree of sentiment detected in the input field.

Currently, Sentiment Analysis supports English, German, Spanish, and French. Other languages are in preview. For more information, see [supported languages](/azure/cognitive-services/text-analytics/text-analytics-supported-languages).

#### Tag images

The **Tag Images** function returns tags based on more than 2,000 recognizable objects, living beings, scenery, and actions. When tags are ambiguous or not common knowledge, the output provides *hints* to clarify the meaning of the tag in context of a known setting. Tags aren't organized as a taxonomy, and no inheritance hierarchies exist. A collection of content tags forms the foundation for an image *description* displayed as human readable language formatted in complete sentences.

After uploading an image or specifying an image URL, Computer Vision algorithms output tags based on the objects, living beings, and actions identified in the image. Tagging isn't limited to the main subject, such as a person in the foreground, but also includes the setting (indoor or outdoor), furniture, tools, plants, animals, accessories, gadgets, and so on.

This function requires an image URL or a base-64 field as input. At this time, image tagging supports English, Spanish, Japanese, Portuguese, and Simplified Chinese. For more information, see [supported languages](/java/api/com.microsoft.azure.cognitiveservices.vision.computervision.computervision.tagimage#azure-java-stable).

### Invoke Text Analytics or Vision functions in Power Query

To enrich your data with Text Analytics or Vision functions, open **Power Query Editor**. This example walks through scoring the sentiment of a text. You can use the same steps to extract key phrases, detect language, and tag images.

Select the **Text analytics** button in the **Home** or **Add Column** ribbon. Then sign in when you see the prompt.

:::image type="content" source="media/desktop-ai-insights/ai-insights-02.png" alt-text="Screenshot of the Text analytics dialog box showing the Detect language function.":::

After signing in, select the function you want to use and the data column you want to transform in the pop-up window.

:::image type="content" source="media/desktop-ai-insights/ai-insights-03.png" alt-text="Screenshot of the Text analytics dialog box showing the Score sentiment function.":::

Power BI selects a Premium capacity to run the function on and send the results back to Power BI Desktop. The selected capacity is only used for Text Analytics and Vision function during application and refreshes in Power BI Desktop. Once Power BI publishes the report, refreshes run on the Premium capacity of the workspace the report is published to. You can change the capacity used for all Cognitive Services in the dropdown in the lower left corner of the popup window.

:::image type="content" source="media/desktop-ai-insights/ai-insights-04.png" alt-text="Screenshot of the dropdown option to select the Premium capacity used for AI Insights.":::

**Language ISO code** is an optional input to specify the language of the text.  You can use a column as input, or a static field. In this example, the language is specified as English (en) for the whole column. If you leave this field blank, Power BI automatically detects the language before applying the function. Next, select **Apply.**

The first time you use AI Insights on a new data source, Power BI Desktop prompts you to set the privacy level of your data.

:::image type="content" source="media/desktop-ai-insights/ai-insights-05.png" alt-text="Screenshot of a warning that states Information is required about data privacy.":::

> [!NOTE]
> Refreshes of the semantic model in Power BI will only work for data sources where the privacy level is set to public or organizational.

After you invoke the function, the result is added as a new column to the table. The transformation is also added as an applied step in the query.

In the cases of image tagging and key phrase extraction, the results can return multiple values. Each individual result is returned on a duplicate of the original row.

### Publish a report with Text Analytics or Vision functions

While editing in Power Query and performing refreshes in Power BI Desktop, Text Analytics and Vision use the Premium capacity that was selected in Power Query Editor. After Text Analytics or Vision publishes the report, they use the Premium capacity of the workspace into which it was published.

Reports with applied Text Analytics and Vision functions should be published to a workspace that is on a Premium capacity, otherwise refreshing the semantic model fails.

### Manage impact on a Premium capacity

The following sections describe how you can manage the impacts of Text Analytics and Vision on capacity.

#### Select a capacity

Report authors can select the Premium capacity on which to run AI Insights. By default, Power BI selects the first created capacity to which the user has access.

#### Monitor with the Capacity Metrics app

Premium capacity owners can monitor the impact of Text Analytics and Vision functions on a capacity with the [Microsoft Fabric Capacity Metrics app](/fabric/enterprise/metrics-app). The app provides detailed metrics on the health of the AI workloads within your capacity. The top chart shows the memory consumption by AI workloads. Premium capacity admins can set the memory limit for the AI workload per capacity. When memory usage reaches the memory limit, you can consider increasing the memory limit or moving some workspaces to a different capacity.

### Compare Power Query and Power Query Online

The Text Analytics and Vision functions used in Power Query and Power Query Online are the same. There are only a couple differences between the experiences:

* Power Query has separate buttons for Text Analytics, Vision, and Azure Machine Learning. In Power Query Online, these features are combined in one menu.
* In Power Query, the report author can select the Premium capacity that's used to run the functions. This choice isn't required in Power Query Online, since a dataflow is already on a specific capacity.

### Considerations and limitations of Text Analytics

There are a few considerations and limitations to keep in mind when using Text Analytics.

* Incremental refresh is supported but can cause performance issues when used on queries with AI insights.
* Direct Query isn't supported.

## Use Azure Machine Learning

Numerous organizations use **Machine Learning** models for better insights and predictions about their business. The ability to visualize and invoke insights from these models can help disseminate these insights to the business users who need it the most. Power BI makes it simple to incorporate the insights from models hosted on Azure Machine Learning, using straightforward point-and-click gestures.

To use this capability, a data scientist can grant access to the Azure Machine Learning model to the BI analyst using the Azure portal. Then, at the start of each session, Power Query discovers all the Azure Machine Learning models to which the user has access and exposes them as dynamic Power Query functions. The user can then invoke those functions by accessing them from the ribbon in Power Query Editor, or by invoking the M function directly. Power BI also automatically batches the access requests when invoking the Azure Machine Learning model for a set of rows to achieve better performance.

This functionality is supported in Power BI Desktop, Power BI dataflows, and for Power Query Online in the Power BI service.

To learn more about dataflows, see [Self-service data prep in Power BI](./dataflows/dataflows-introduction-self-service.md).

To learn more about Azure Machine Learning, see the following articles:

* Overview: [What is Azure Machine Learning?](/azure/machine-learning/overview-what-is-azure-machine-learning)
* Quick Starts and Tutorials for Azure Machine Learning: [Azure Machine Learning Documentation](/azure/machine-learning/)

### Grant access to an Azure Machine Learning model

To access an Azure Machine Learning model from Power BI, the user must have **Read** access to the Azure subscription. In addition, they must also have **Read** access to the Machine Learning workspace.

The steps in this section describe how to grant a Power BI user access to a model hosted on the Azure Machine Learning service. With this access, they can use this model as a Power Query function. For more information, see [Manage access using RBAC and the Azure portal](/azure/role-based-access-control/role-assignments-portal).

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Go to the **Subscriptions** page. You can find the **Subscriptions** page through the **All Services** list in the left navigation menu of the Azure portal.
1. Select your subscription.
1. Select **Access control (IAM)**, and then select the **Add** button.
1. Select **Reader** as the Role. Select the Power BI user to whom you wish to grant access to the Azure Machine Learning model.
1. Select **Save**.
1. Repeat steps three through six to grant **Reader** access to the user for the specific Machine Learning workspace hosting the model.

### Schema discovery for Machine Learning models

Data scientists primarily use Python to develop, and even deploy, their machine learning models for Machine Learning. The data scientist must explicitly generate the schema file using Python.

This schema file must be included in the deployed web service for Machine Learning models. To automatically generate the schema for web service, you must provide a sample of the input/output in the entry script for the deployed model. For more information, see the subsection on [(Optional) Automatic Swagger schema generation in the Deploy models with the Azure Machine Learning](/azure/machine-learning/how-to-deploy-managed-online-endpoints) service documentation. The link includes the example entry script with the statements for the schema generation.

Specifically, the _@input\_schema_ and _@output\_schema_ functions in the entry script reference the input and output sample formats in the _input\_sample_ and _output\_sample_ variables. The functions use these samples to generate an OpenAPI (Swagger) specification for the web service during deployment.

These instructions for schema generation, by updating the entry script, must also be applied to models created using automated machine learning experiments with the Azure Machine Learning SDK.

> [!NOTE]
> Models created by using the Azure Machine Learning visual interface don't currently support schema generation, but they will in subsequent releases.
>
### Invoke an Azure Machine Learning model in Power Query

You can invoke any Azure Machine Learning model to which you have been granted access, directly from the Power Query Editor. To access the Azure Machine Learning models, select **Azure Machine Learning** button in the **Home** or **Add Column** ribbon in the Power Query Editor.

:::image type="content" source="media/desktop-ai-insights/ai-insights-06.png" alt-text="Screenshot shows the Azure Machine Learning button in the Power Query Editor.":::

All Azure Machine Learning models to which you have access are listed here as Power Query functions. Also, the input parameters for the Azure Machine Learning model are automatically mapped as parameters of the corresponding Power Query function.

To invoke an Azure Machine Learning model, you can specify any of the selected entity's columns as an input from the drop-down. You can also specify a constant value to be used as an input by toggling the column icon to the left of the input dialog.

:::image type="content" source="media/desktop-ai-insights/ai-insights-07.png" alt-text="Screenshot of the Azure Machine Learning Models dialog box.":::

Select **OK** to view the preview of the Azure Machine Learning model's output as a new column in the entity table. The model invocation appears as an applied step for the query.

If the model returns multiple output parameters, they're grouped together as a record in the output column. You can expand the column to produce individual output parameters in separate columns.

### Considerations and limitations of Azure Machine Learning

The following considerations and limitations apply to Azure Machine Learning in Power BI Desktop.

* Models created by using the Azure Machine Learning visual interface don't currently support schema generation. Support is anticipated in subsequent releases.
* Incremental refresh is supported but can cause performance issues when used on queries with AI insights.
* Direct Query isn't supported.
* Users with a Premium Per User (PPU) only license cannot use AI Insights from Power BI Desktop; you must use a non-PPU Premium license with its corresponding Premium capacity. You can still use AI Insights with a PPU license the Power BI service.

## Related content

This article provided an overview of integrating Machine Learning into Power BI Desktop. The following articles might also be interesting and useful.


* [Tutorial: Using Cognitive Services in Power BI](../connect-data/service-tutorial-use-cognitive-services.md)
* [Cognitive Services in Power BI](./dataflows/dataflows-machine-learning-integration.md)
* [Azure Machine Learning integration in Power BI](./dataflows/dataflows-machine-learning-integration.md)
* [AI metrics in the Premium capacity metrics app](https://powerbi.microsoft.com/blog/ai-metrics-now-available-in-power-bi-premium-capacity-metrics-app/)
