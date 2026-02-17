---
title: Create data function buttons
description: Learn how to configure buttons in Power BI desktop with the data function action to enable translytical task flows.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: zoedouglas
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 05/16/2025
LocalizationGroup: Create reports
#customer intent:
---

# Create a data function button in Power BI (preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can create a *data function* button in Power BI Desktop and Power BI service. This button takes input from the user and calls a function to take action.

>[!NOTE]
>The translytical task flow feature is currently in public preview.

## Prerequisites

* Enable [required preview features](./translytical-task-flow-overview.md) in Power BI and Fabric.
* Create a [user data functions in Fabric](/fabric/data-engineering/user-data-functions/user-data-functions-overview). For examples, see [Translytical task flow examples](https://gist.github.com/Sujata994/c354ec8d0821e875e45c86f2bd1d5cc8).

  >[!IMPORTANT]
  >Data function buttons require that the reference function returns a string.

## Best practices for user data functions

When you write your own functions for translytical task flow scenarios, follow these best practices to ensure a quality end-user experience.

* Write input validation logic for each parameter. Use the `fn.UserThrownError()` method to send an expected error response to the Power BI report. For example:

  ```python
  if (discount < 0):
      raise fn.UserThrownError("Discount cannot be negative.")
  ```

* Use a try/catch statement for all execute database calls. Return a friendly message to handle cases when the database is offline or unreachable.
* Ensure that your SQL statements aren't vulnerable to SQL injection attacks.
* Write a friendly success message that tells the end user that their operation was successful.

## Configure inputs for function parameters

Each parameter that your user data function takes as input needs to map to an element in the Power BI report. This element can be a button, list, or input slicer; a data field; or measures.

### Slicers as input controls

The three supported slicer types (button, list, and input) are all preview features, sometimes called *new slicers*. Make sure you enable them as described in the prerequisites.

To use a button or list slicer as a parameter, it needs to be linked to a data field from the **Data** pane. If you want to use a button or list slicer only as an input control and not to filter data, remove all visual interactions through **Edit interactions**. For more information about editing interactions, see [Change how visuals interact in a Power BI report](./service-reports-visual-interactions.md).

To use an input slicer as a parameter, linking it to a data field is optional. Link it to a data field only if you want to filter data in the report. Otherwise, create it without using a data field from the **Data** pane. 

### Data fields or measures as input controls

Data fields and measures can also be linked as parameters. You can only select fields that match the input parameter type. 

If you need to pass a single primary key to a data function such as CustomerID for an edit/delete operation, you can use the `SELECTEDVALUE DAX` expression. 

For example: 

```sql
SelectedCustomerID = SELECTEDVALUE(Customer[CustomerID]) 
```

For more information, see [Create measures for data analysis](../transform-model/desktop-measures.md)

## Set up a data function button

Create a data function button and configure it to connect report elements or user input to a user data function.

1. In Power BI Desktop, add a button to your report.
1. In the **Format button** pane, expand the **Action** menu. Toggle the **Action** switch to **On** if it isn't already.
1. From the **Type** dropdown menu, select **Data function**.

   Once you select the data function option, the following parameters appear: **Workspace**, **Function set**, and **Data function**.

   >[!TIP]
   >If you don't see the **Data function** option, make sure that the **Translytical task flows** preview feature is enabled in Power BI desktop.

1. Provide the following values for your button:

   | Parameter | Value |
   | --------- | ----- |
   | **Workspace** | Select the workspace that contains the user data function. |
   | **Function Set** | Select the function set that contains your data function. |
   | **Data function** | Select your data function. |

   >[!TIP]
   >If you don't see the user data function that you want to use, make sure that your data function returns a string.

1. Once you select your data function, other parameters appear to represent the parameters that the function takes. For each parameter, you can either: 

   * Use the dropdown menu to select a slicer from your report.
   * Select the **Conditional formatting** (**fx**) button to select a data field or measure from your report. 

## Customize the report interface

In a report, you can use any combination of slicers, data fields, and buttons to create customized interactive visuals. The following sections provide examples and recommendations.

### Interface with slicers

On a report page, you can create a section with slicers that don't interact with other visuals so they only function as input controls. At the bottom, place a button and set its action to **Data function**, linking it to its parameters with the slicers. You can design this section in any way you like, but the key is to make it look like an actionable section that stands out from the report content. 

The following example shows an interactive section with three elements:

* An *input slicer* to input a new order ID
* A *button slicer* to select the order status from one of three options
* A *button* to submit the input from the slicers to a user data function 

:::image type="content" source="./media/translytical-task-flow-button/example-slicers.png" alt-text="Screenshot that shows a report example that contains two slicers and a data function button.":::

You can test if the button is linked properly with your slicers by adding input values to each. If the parameters are accepted, the button changes its style. Customize the button style to make its status more appealing. In Power BI Desktop, you can't trigger actions until the report is published.

:::image type="content" source="./media/translytical-task-flow-button/example-slicers-enabled.png" alt-text="Screenshot that shows the same report example with two slicers and a data function button. The slicers have sample input and the button is enabled.":::

### Interface with data fields and measures

On a report page, you can use report visuals and a button with a **Data functions** action, linking a parameter to a data field.

The following example shows an interactive section with two elements:

* A *table* whose rows can be selected as order ID input
* A *button* to submit the table row as input to a user data function

:::image type="content" source="./media/translytical-task-flow-button/example-table.png" alt-text="Screenshot that shows a report example that contains a table and a data function button.":::

You can test if the button is linked properly with your table by clicking on a row. If the parameter is accepted, the button changes its style. Customize the button style to make its status more appealing. In Power BI Desktop, you can't trigger actions until the report is published.

:::image type="content" source="./media/translytical-task-flow-button/example-table-enabled.png" alt-text="Screenshot that shows the same report example with a table and a data function button. The table has a row selected and the button is enabled.":::

### Interface with mixed inputs

You can use a mix of slicers and data fields/measures to create the most creative experiences. Link each parameter defined in your data function with the correct option, which can be either a slicer located on your page or a visible data field or measure.

The following example shows an interactive section with three elements:

* A *table* whose rows can be selected as order ID input
* A *button slicer* to select the order status from one of three options
* A *button* to submit the input to a user data function 

:::image type="content" source="./media/translytical-task-flow-button/example-mixed.png" alt-text="Screenshot that shows a report example that contains a table, a button slicer, and a data function button.":::

You can test if the button is linked properly with your table by clicking on a row and a slicer button. If the parameter is accepted, the button changes its style. Customize the button style to make its status more appealing. In Power BI Desktop, you can't trigger actions until the report is published.

:::image type="content" source="./media/translytical-task-flow-button/example-mixed-enabled.png" alt-text="Screenshot that shows the same report example with a table, a slicer, and a data function button. The table and slicer have input selected and the button is enabled.":::
