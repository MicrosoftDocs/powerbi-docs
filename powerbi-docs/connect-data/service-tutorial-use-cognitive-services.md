---
title: 'Tutorial: Use Cognitive Services in Power BI'
description: In this tutorial, learn to import data into a dataflow in the Power BI service, score sentiment and extract key phrases, and connect to Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: SarinaJoan
ms.service: powerbi
ms.subservice: powerbi-ai
ms.custom: connect-to-services
ms.topic: tutorial
ms.date: 06/01/2023
#customer intent: "As a Power BI end user, I want to use Cognitive Services, so I can use create dataflows in Power BI."
LocalizationGroup: Connect to services
---

# Tutorial: Use Cognitive Services in Power BI

Power BI provides access to a set of functions from Azure Cognitive Services to enrich your data in the self-service data prep for dataflows. The services that are supported today are [sentiment analysis](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis), [key phrase extraction](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-keyword-extraction), [language detection](/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-language-detection), and [image tagging](/azure/cognitive-services/computer-vision/concept-tagging-images). The transformations run on the Power BI service and don't require an Azure Cognitive Services subscription. This feature requires Power BI Premium.

Cognitive Services transforms are supported in the [self-service data prep for dataflows](https://powerbi.microsoft.com/blog/introducing-power-bi-data-prep-wtih-dataflows/). Use the step-by-step examples for text analytics and image tagging in this article to get started.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Import data into a dataflow
> * Score sentiment and extract key phrases of a text column in a dataflow
> * Connect to the results from Power BI Desktop

## Prerequisites

To complete this tutorial, you need the following prerequisites:

* A Power BI account. If you're not signed up for Power BI, [sign up for a free trial](https://app.powerbi.com/signupredirect?pbi_source=web) before you begin.
* Access to a Power BI Premium capacity with the AI workload enabled. This workload is turned off by default during preview. If you are in on a Premium capacity and AI Insights aren't showing up, contact your Premium capacity administrator to enable the AI workload in the admin portal.

## Text analytics

Follow the steps in this section to complete the text analytics portion of the tutorial.

### Step 1: Apply sentiment scoring in the Power BI service

To get started, navigate to a Power BI workspace with Premium capacity and create a new dataflow using the **Create** button in the upper right of the screen.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_01.png" alt-text="Screenshot shows the Power BI workspace with Create, then Dashboard, selected.":::

The dataflow dialog shows you the options for creating a new dataflow, select **Add new entities.** Next, choose **Text/CSV** from the menu of data sources.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_02.png" alt-text="Screenshot shows Choose a data source, which includes Text/CSV." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_02.png":::

Paste this URL into the URL field: `https://pbiaitutorials.blob.core.windows.net/textanalytics/FabrikamComments.csv` and select **Next.**

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_03.png" alt-text="Screenshot shows Connect to data source where you enter the URL." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_03.png":::

The data is now ready to use for text analytics. You can use Sentiment Scoring and Key Phrase Extraction on the customer comments column.

In Power Query Editor, select **AI Insights**

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_04.png" alt-text="Screenshot shows Edit queries with All insights selected." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_04.png":::

Expand the **Cognitive Services** folder and select the function you would like to use. This example scores the sentiment of the comment column, but you can follow the same steps to try out Language Detection and Key Phrase Extraction.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_05.png" alt-text="Screenshot shows Invoke function with a function selected." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_05.png":::

After you select a function, the required and optional fields appear. To score the sentiment of the example reviews, select the reviews column as text input. Culture information is an optional input and requires an ISO format. For example, enter *en* if you want the text to be treated as English. When the field is left blank, Power BI first detects the language of the input value before it scores the sentiment.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_06.png" alt-text="Screenshot shows the Invoke function dialog box with the text drop-down menu." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_06.png":::

Now select **Invoke** to run the function. The function adds a new column with the sentiment score for each row to the table. You can go back to **AI insights** to extract key phrases of the review text in the same way.

Once you finish the transformations, change the query name to *Customer comments* and select **Done.**

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_07.png" alt-text="Screenshot shows Edit queries with Name called out." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_07.png":::

Next, **Save** the dataflow and name it *Fabrikam*. Select the **Refresh Now** button that pops up after you save the dataflow.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_08.png" alt-text="Screenshot shows the Save button.":::

After you save and refresh the dataflow, you can use it in a Power BI report.

### Step 2: Connect from Power BI Desktop

Open Power BI Desktop. In the **Home** ribbon, select **Get data**.

Select **Power BI** and then choose **Power BI dataflows**. Select **Connect.**

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_09.png" alt-text="Screenshot shows the Get Data pane with Power BI dataflows selected.":::

Sign in with your organization account.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_10.png" alt-text="Screenshot shows a sign-in message for your organizational account.":::

Select the dataflow you created. Navigate to the **Customer comments** table and choose **Load.**

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_11.png" alt-text="Screenshot shows the Navigator with the Customer comments table selected." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_11.png":::

Now that the data is loaded, you can start building a report.

## Image tagging

In the Power BI service, navigate to a workspace with Premium capacity. Create a new dataflow using the **Create** button in the upper right of the screen.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_12.png" alt-text="Screenshot shows the Power BI workspace with Create, then Dataflow, selected.":::

Select **Add new entities**.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_13.png" alt-text="Screenshot shows an option to add new entities to start creating a workflow.":::

Once you're asked to choose a data source, select **Blank query**.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_14.png" alt-text="Screenshot shows Choose a data source, which includes Blank query." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_14.png":::

Copy this query in the query editor and select **Next**. You can replace the URL paths with other images or add more rows. The `Web.Contents` function imports the image URL as binary. If you have a data source with images stored as binary, you can also use that directly.

```python
let
  Source = Table.FromRows({
  { Web.Contents("https://images.pexels.com/photos/87452/flowers-background-butterflies-beautiful-87452.jpeg") },
  { Web.Contents("https://upload.wikimedia.org/wikipedia/commons/5/53/Colosseum_in_Rome%2C_Italy_-_April_2007.jpg") }}, { "Image" })
in
  Source
```

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_15.png" alt-text="Screenshot shows Connect to data source, which shows your query and a Next button." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_15.png":::

When prompted for credentials, select *anonymous*.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_16.png" alt-text="Screenshot shows Edit queries, where you can specify credentials." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_16.png":::

You see the following dialog.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_17.png" alt-text="Screenshot shows the Enter credentials dialog box where you can specify the kind of authentication.":::

Power BI prompts you for credentials for each web page.

Select **AI Insights** in the query editor.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_18.png" alt-text="Screenshot shows Edit queries with All insights selected and one warning displayed." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_18.png":::

Next, sign in with your **organizational account**.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_19.png" alt-text="Screenshot shows the Enter credentials dialog box where you can specify Organizational account.":::

Select the Tag Images function, enter _[Binary]_ in the column field, and enter _en_ in the culture info field.

> [!NOTE]
> You currently cannot pick a column using a dropdown. This issue will be resolved as soon as possible during the private preview.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_20.png" alt-text="Screenshot shows Invoke function with the TagImages function selected." lightbox="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_20.png":::

In the function editor, remove the quotation marks around the column name.

> [!NOTE]
> Removing the quotation marks is a temporary workaround. This issue will be resolved as soon as possible during preview.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_21.png" alt-text="Screenshot shows the function editor with Image called out without quotation marks.":::

The function returns a record with both the tags in comma-separated format and as a *json* record. Select the expand-button to add one or both as columns to the table.

:::image type="content" source="media/service-tutorial-using-cognitive-services/tutorial-using-cognitive-services_22.png" alt-text="Screenshot shows the expand button, which has two opposite pointing arrows.":::

Select **Done** and save the dataflow. Once you've refreshed the dataflow one, you can connect to it from Power BI Desktop using the Dataflows connectors.

## Clean up resources

When you're done using this tutorial, delete the query by right-clicking the query name in the Power Query Editor and selecting **Delete**.

## Limitations

There are some known issues with using Gateway with Cognitive Services. If you need to use a gateway, we recommend creating a dataflow that imports the necessary data by using a gateway first. Then create another dataflow that references the first dataflow to apply these functions.

If your AI work with dataflows fails, you may need to enable Fast Combine when using AI with dataflows. Once you have imported your table and *before* you begin to add AI features, select **Options** from the Home ribbon, and in the window that appears select the checkbox beside *Allow combining data from multiple sources* to enable the feature, then select **OK** to save your selection. Then you can add AI features to your dataflow.

## Related content

In this tutorial, you applied sentiment scoring and image tagging functions on a Power BI dataflow. To learn more about Cognitive Services in Power BI, see the following articles.

* [Azure Cognitive Services](/azure/cognitive-services/)
* Get started [with self-service data prep on dataflows](../transform-model/dataflows/dataflows-introduction-self-service.md)
* Learn more about [Power BI Premium](https://powerbi.microsoft.com/power-bi-premium/)

You might also be interested in the following articles.

* [AI with dataflows](../transform-model/dataflows/dataflows-machine-learning-integration.md)
