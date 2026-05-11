---
title: Create Parameters for Paginated Reports in Power BI Report Builder
description: Learn how to create parameters for paginated reports in Power BI Report Builder, including setting available values, default values, and connecting parameters to datasets.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: report-builder
ms.topic: how-to
ms.date: 12/01/2025
ai-usage: ai-assisted
---

# Create parameters for paginated reports in Power BI Report Builder

[!INCLUDE [applies-yes-report-builder-no-desktop](../../includes/applies-yes-report-builder-no-desktop.md)]

In this article, you learn how to create parameters in Power BI Report Builder for paginated reports. A report parameter provides a way for report readers to choose report data and vary the report presentation. Creating a fully functional parameter involves several steps: defining the parameter, setting available values, configuring default values, and connecting the parameter to your dataset query.

For more information about how your business users interact with parameters in the Power BI service, see [View parameters for paginated reports](../../explore-reports/paginated-reports-view-parameters.md).

The following illustration shows Design view in Power BI Report Builder for a report with the parameters @BuyingGroup, @Customer, @FromDate, and @ToDate.
  
:::image type="content" source="media/paginated-reports-create-parameters/power-bi-paginated-parameters-report-builder.png" alt-text="Screenshot showing parameters in Report Builder." lightbox="media/paginated-reports-create-parameters/power-bi-paginated-parameters-report-builder.png":::
  
1. The report parameters in the Report Data pane.  
1. The table with one of the parameters in the dataset.  
1. The Parameters pane. You can customize the layout of parameters in the parameters pane.
1. The parameters @FromDate and @ToDate have the data type **DateTime**. When viewing the report, you can either type a date in the text box, choose a date in the calendar control, or select **Go to today**.
1. One of the parameters in the **Dataset Properties** dialog box.  

## Prerequisites

[!INCLUDE [power-bi-paginated-prerequisites](../../includes/power-bi-paginated-prerequisites.md)]

## Overview: Steps to create a working parameter

Creating a parameter that filters your report data requires these steps:

1. **Create the report parameter** - Define the parameter name, data type, and prompt text.
1. **Set available values** (recommended) - Specify the list of values users can choose from.
1. **Set default values** (optional) - Provide initial values so the report runs automatically.
1. **Connect the parameter to your dataset** - Link the parameter to your query so it filters the data.

The following sections walk through each step.

## Step 1: Create the report parameter
  
1. Open your paginated report in Power BI Report Builder.
1. In the **Report Data** pane, right-click the **Parameters** node and select **Add Parameter**. The **Report Parameter Properties** dialog box opens.  
1. In **Name**, type a name for the parameter (for example, `ProductCategory`). The name must begin with a letter and can contain only letters, numbers, or underscores (_). Spaces aren't allowed.
1. In **Prompt**, type text to appear next to the parameter (for example, `Select a category:`).
1. In **Data type**, select the data type for the parameter value. Common types include:
   - **Text** - For string values
   - **Integer** - For whole numbers
   - **DateTime** - For date values (displays a calendar picker)
   - **Boolean** - For true/false values (displays radio buttons)
1. Configure additional options as needed:
   - **Allow blank value** - User can submit an empty string.
   - **Allow null value** - User can leave the parameter unset.
   - **Allow multiple values** - User can select more than one value (displays checkboxes).
1. Set the visibility:
   - **Visible** - Parameter appears on the report toolbar.
   - **Hidden** - Parameter doesn't display but can be set via URL.
   - **Internal** - Parameter is hidden and can't be modified after publishing.
1. Don't select **OK** yet. Continue to set available values.

## Step 2: Set available values

Available values create a dropdown list that limits users to valid choices. You can specify values manually or retrieve them from a dataset query.

### Option A: Specify values manually

1. In the **Report Parameter Properties** dialog, select the **Available Values** page.
1. Select **Specify values**.
1. Select **Add** to create each value:
   - **Value** - The actual value passed to the query (for example, `1`).
   - **Label** - The friendly name displayed to users (for example, `Bikes`).
1. Repeat for each value. Use the arrow buttons to reorder the list.

### Option B: Get values from a query

1. First, create a dataset that retrieves the available values. For example, create a dataset named `CategoryList` with this query:

   ```sql
   SELECT CategoryID, CategoryName FROM ProductCategory ORDER BY CategoryName
   ```

1. In the **Report Parameter Properties** dialog, select the **Available Values** page.
1. Select **Get values from a query**.
1. In **Dataset**, select your dataset (for example, `CategoryList`).
1. In **Value field**, select the field containing the actual values (for example, `CategoryID`).
1. In **Label field**, select the field containing the display names (for example, `CategoryName`).

## Step 3: Set default values (optional)

Default values cause the report to run automatically when first opened. Without defaults, users must select values and select **View Report**.

1. In the **Report Parameter Properties** dialog, select the **Default Values** page.
1. Choose one of these options:
   - **No default value** - Users must make a selection.
   - **Specify values** - Manually enter one or more default values.
   - **Get values from a query** - Use a dataset to provide defaults.
1. Select **OK** to close the dialog.

## Step 4: Connect the parameter to your dataset

The parameter doesn't filter data until you connect it to your dataset query. There are two common approaches:

### Option A: Add a query variable

1. In the **Report Data** pane, right-click your main dataset and select **Dataset Properties**.
1. On the **Query** page, modify your query to include a WHERE clause with a variable:

   ```sql
   SELECT ProductID, ProductName, CategoryID, Price
   FROM Products
   WHERE CategoryID = @ProductCategory
   ```

1. When you select **OK**, Report Builder automatically creates a dataset parameter and links it to your report parameter.

### Option B: Link parameters manually

If you've renamed a parameter or need to manually link them:

1. In the **Report Data** pane, right-click your dataset and select **Dataset Properties**.
1. Select the **Parameters** page.
1. In the **Parameter Value** column, select the report parameter to link to each query parameter (for example, `[@ProductCategory]`).
1. Select **OK**.

## Test your parameter

1. Select **Run** (or press F5) to preview the report.
1. The parameter appears in the toolbar with your available values.
1. Select a value and select **View Report** to verify the data filters correctly.

## Related content

- [View parameters for paginated reports](../../explore-reports/paginated-reports-view-parameters.md) - How users interact with parameters in the Power BI service
- [Report parameters in Power BI Report Builder](report-builder-parameters.md) - Comprehensive reference for parameter properties and concepts
- [Add or modify available values for a report parameter](add-change-or-delete-available-values-for-a-report-parameter.md) - Detailed guidance on configuring value lists
- [Add or modify default values for a report parameter](add-change-or-delete-default-values-for-a-report-parameter.md) - Configure automatic report execution
- [Add cascading parameters to a report](add-cascading-parameters-report-builder.md) - Create dependent parameter dropdowns
- [Associate a query parameter with a report parameter](associate-query-parameter-report-parameter-report-builder.md) - Link parameters to dataset queries
- [Add a multivalue parameter to a report](add-multi-value-parameter-to-report.md) - Allow users to select multiple values
- [Pass a report parameter in a URL](pass-report-parameter-url.md) - Set parameter values programmatically
