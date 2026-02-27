---
title: Understand translytical task flows
description: Learn how translytical task flows enable data write-back capabilities in Power BI reports with user data functions in Fabric.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: concept-article
ms.date: 05/16/2025
LocalizationGroup: Create reports
#customer intent: As a Power BI user, I want to learn how to create reports that allow readers to edit the data source so that end users have interactive access to their data.
---

# Understand translytical task flows (preview)

With translytical task flows, you can automate end-user actions like updating records, adding annotations, or creating workflows that trigger actions in other systems. Translytical task flows enable automated scenarios including:

* **Add data**: Add a record of data to a table in your database and see it reflected in your report. For example, adding a new customer record.
* **Edit data**: Edit an existing record of data in a table in your database and see it reflected in your report. For example, updating a status field or an annotation.
* **Delete data**: Delete an existing record of data from a table in your database and see it removed from your report. For example, removing a customer record that's no longer needed.
* **Call an external API**: Make an API request that's accessible through a network request. For example, making a request to the REST endpoint of a public API that either updates the underlying data or end user's input, or takes action in a different system.

Translytical task flows work by using [user data functions in Fabric](/fabric/data-engineering/user-data-functions/user-data-functions-overview) to invoke functions on the underlying Fabric data sources.

The following example shows a translytical task flow that connects a Power BI report that shows sales opportunities to a workflow that posts requests to Teams. In this example, you can see that the user filtered the table to display only high-risk high-quantity opportunities with limited time windows. The user requests a 10% discount for these opportunities and justifies the request in a comment field. Once they select the **Request discount** button, the input from the table and the text fields are passed to a user data function. The function posts a message in Teams with the details so that the request can be approved or rejected.

:::image type="content" source="./media/translytical-task-flow-overview/example-request-discount.gif" alt-text="Animated gif that shows a user requesting a discount for opportunities found in a Power BI report, and that request surfacing as a Teams post." lightbox="./media/translytical-task-flow-overview/example-request-discount.gif":::

Ready to get started?

* If you want to follow an end-to-end tutorial to build your first translytical task flow, see [Tutorial: Create a translytical task flow](./translytical-task-flow-tutorial.md). This tutorial guides you through creating a SQL database, writing a user data function, and connecting the function to a Power BI report with a data function button.

* If you already have a user data function that you want to connect to a Power BI report, see [Create a data function button in Power BI](./translytical-task-flow-button.md).

>[!NOTE]
>The translytical task flow feature is currently in public preview.

## Data write-back

Translytical task flows can enable data write-back so that end users can update, add, or delete data in Fabric databases from within Power BI reports. Using Fabric's user data functions, you can programmatically update, add, or delete records of data based on the filter context passed from the report. 

For example, the following Power BI report lets you modify the discount value seen in the table without ever leaving the report. When you enter the new value in the input slicer and select **Submit discount**, a Fabric User data function automatically updates the data source records that match the applied filters. 

:::image type="content" source="./media/translytical-task-flow-overview/example-write-back.gif" alt-text="Animated gif that shows a Power BI report that includes an interactive interface for modifying a data record." lightbox="./media/translytical-task-flow-overview/example-write-back.gif":::

For data write-back scenarios, user data functions have native connection management for the following Fabric data sources:

* Fabric SQL databases
* Fabric warehouses 
* Fabric lakehouses (for files)

For most write-back scenarios, we recommend using SQL database as your underlying data source. SQL databases perform well with the heavy read/write operations required in reporting scenarios.

For working samples of user data functions, see [Translytical task flow examples](https://gist.github.com/Sujata994/c354ec8d0821e875e45c86f2bd1d5cc8).

## Custom automation

Translytical task flows can also automate many tasks and even take actions in other systems using external APIs.

For example, the following Power BI report lets you generate tailored AI suggestions for the influencers seen in the table using Azure OpenAI Responses API. When you select an influencer and then select **Generate AI Suggestion**, a Fabric user data function provides an Azure OpenAI response based on a fully customizable prompt.

:::image type="content" source="./media/translytical-task-flow-overview/example-ai-suggestion.gif" alt-text="Animated gif that shows a sample Power BI report that includes an interactive interface for making a call to Azure OpenAI API." lightbox="./media/translytical-task-flow-overview/example-ai-suggestion.gif":::

For working samples of user data functions, see [Translytical task flow examples](https://gist.github.com/Sujata994/c354ec8d0821e875e45c86f2bd1d5cc8).

## Required preview features

Translytical task flows are currently in public preview, and also rely on other features in public preview. Make sure that the required features are enabled in Power BI Desktop.

In Power BI Desktop, you need to enable translytical task flows and list slicers.

Use the following steps to enable preview features in Power BI:

1. Open the latest version of Power BI Desktop.
1. Navigate to **File** > **Options and settings** > **Options** > **Preview features**.
1. Select the following features:

   * **Translytical task flows**
   * **List slicer visual** for scenarios that require slicer selection.

The input slicer is generally available and doesn't require enabling a preview feature.

Translytical task flows work by using [user data functions in Fabric](/fabric/data-engineering/user-data-functions/user-data-functions-overview) to invoke functions on the underlying Fabric data sources.

## Limitations

Currently, the following limitations apply to translytical task flows:

* Only the new preview slicers (button slicer, list slicer, and input slicer) are automatically recognized as input controls for function parameters. If you need to use old slicers, you need to create a data analysis expression (DAX) measure to reference those inputs.
* PBIR (Power BI enhanced report) and PBIP (Power BI Project) formats aren't supported.
* Power BI Embedded isn't supported.

The following service limitations can also affect your translytical task flows:

* [Service details and limitations of Fabric user data functions](/fabric/data-engineering/user-data-functions/user-data-functions-service-limits)
* [Limitations in SQL database in Microsoft Fabric](/fabric/database/sql/limitations)

## Next steps

* If you want to follow an end-to-end tutorial to build your first translytical task flow, see [Tutorial: Create a translytical task flow](./translytical-task-flow-tutorial.md). This tutorial guides you through creating a SQL database, writing a user data function, and connecting the function to a Power BI report with a data function button.

* If you already have a user data function that you want to connect to a Power BI report, see [Create a data function button in Power BI](./translytical-task-flow-button.md).
