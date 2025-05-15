---
title: Tutorial - Create translytical task flow
description: In this tutorial, learn how to enable and create translytical task flows with Fabric user data functions.
author: kgremban
ms.author: kgremban
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: tutorial
ms.date: 05/14/2025
LocalizationGroup: Create reports
#customer intent:
---

# Tutorial: Create a translytical task flow (preview)

In this end-to-end tutorial, you create an example translytical task flow that writes back to a SQL Database in Fabric. To help illustrate the end-to-end step-up experience, we focus on a translytical task flow for a data annotation scenario.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Create a SQL database in Fabric with sample data.
> * Configure a user data function that writes back to SQL database.
> * Create a Power BI report that integrates with a translytical task flow.

If you don't have an existing Fabric capacity, [start a Fabric trial](/fabric/fundamentals/fabric-trial).

>[!NOTE]
>The translytical task flow feature is currently in public preview.

## Prerequisites

* Enable [required preview features](./translytical-task-flow-overview.md) in Power BI and Fabric.
* [Enable SQL database in Fabric using admin portal tenant settings](/fabric/database/sql/enable).
* Power BI Desktop. If you don't have Power BI Desktop installed on your device, follow the instructions in [Get Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).

## Architecture

A translytical task flow connects three tasks to enable your automated scenarios:

* **Store data**

  Start with an existing Fabric data source

* **Develop data**

  Write a Fabric user data function that gets called from a Power BI report. This function can do any number of actions, from editing the report's data source to sending a notification to creating a work item in an approvals pipeline.

* **Visualize data**

  Create a Power BI report that displays the source data and interactive elements to call the data function.

## Create a SQL database

This scenario uses the sample **AdventureWorksLT** dataset in SQL database.

1. Follow the steps in [Create a SQL database in the Fabric portal](/fabric/database/sql/create).

   Take note of the name that you give to the SQL database. You use this value later in the tutorial.

1. After you create the database, choose the **Sample data** option to load the **AdventureWorksLT** sample data into your empty database.

## Create a user data function

Create a user data function in a workspace.

1. Navigate to the workspace of your choice in Power BI or Fabric.
1. Select **New item**.
1. Select **User data functions (preview)** from the **Develop data** group.

   :::image type="content" source="./media/translytical-task-flow-tutorial/new-item-user-data-functions.png" alt-text="A screenshot that shows the user data functions tile on the new item menu.":::

1. Provide a name for the new user data function, then select **Create**.

   Take note of the name you use, and the workspace name. You use both of these values later in the tutorial.

1. Select **New function**.

## Connect to your SQL database

Connect the user data function to the SQL database you created previously. Make sure that you have access permissions to the SQL database before continuing.

1. Select **Manage connections** on the page for your new user data function.

   :::image type="content" source="./media/translytical-task-flow-tutorial/manage-connections.png" alt-text="Screenshot that shows selecting 'manage connections' on the functions page.":::

1. Select **Add data connection**.
1. Select the SQL database that you created previously, then select **Connect**.
1. After the connection is created, copy the **Alias** value to use later in the tutorial.
1. Close the **Connections** page to return to your user data function.

## Add function code

Add code to the user data function that writes a new row to your database.

1. Select **Edit** on the functions page.

   :::image type="content" source="./media/translytical-task-flow-tutorial/edit-function.png" alt-text="Screenshot that shows selecting 'edit' on the functions page.":::

1. On the **Edit** toolbar, select **Insert sample** > **SQL Database** > **Write one row of data into a table in SQL database**.

   :::image type="content" source="./media/translytical-task-flow-tutorial/write-one-row-of-data.png" alt-text="Screenshot that shows the nested dropdown menus to select the 'write one row of data into a table in SQL database' sample.":::

1. Find the following line of code in the sample:

   ```python
   @udf.connection(artName="sqlDB",alias="<alias for sql database>")
   ```

1. Replace the **alias** placeholder with the value that you copied in the previous section.

   You can open the **Manage connections** page again to view the connection alias.

### Test the sample code

Use the steps in this section if you want to test the sample code so far.

1. Select **Publish**.
1. Once the function is published, hover over the **write_one_to_sql_db** function on the **Functions explorer** menu, then select the **Run** icon.
1. On the **Run** page, provide sample data for the three required parameters:

   * **employeeId**: integer
   * **employyName**: string
   * **deptId**: integer

1. Select **Run**.
1. Review the function output as well as the generated logs.
1. Close the **Run** page when you're done testing.

If you get any errors when running the sample code, check that your account has access permissions to the database.

## Add code for the translytical task flow

Update the sample code to write data to the `[SalesLT].[ProductDescription]` table in the SQL database's AdventureWorksLT sample.

User data functions use pyodbc by default for SQL connections, and we recommend that library for this scenario.

You can view the finished code for this section in the following [Complete function code](#complete-function-code) section.

1. In the function editor, add a new import statement to the top of the code file.

   ```python
   import uuid 
   ```

1. Replace the `write_one_to_sql_db` method definition's input parameters to include a product description (string) and product model ID (integer). These parameters map to the values that the users will provide in the PowerBI report that you create in the next tutorial.

   ```python
   def write_one_to_sql_db(sqlDB: fn.FabricSqlConnection, productDescription: str, productModelId:int) -> str:
   ```

1. Delete the `data` variable.
1. Delete the `create_table_query` variable.
1. Replace the `insert_query` variable with the following SQL statement:

   ```python
   insert_query = "INSERT INTO [SalesLT].[ProductDescription] (Description) OUTPUT INSERTED.ProductDescriptionID VALUES (?)" 
   ```

1. Replace the `cursor.execute` method call with the following line:

   ```python
   cursor.execute(insert_query, productDescription)
   ```

1. Add the following new lines:

   ```python
   # Get the ID from the previous query 
   results = cursor.fetchall() 

   # Generate an Id for the Culture column 
   cultureId = str(uuid.uuid4()) 

   # Insert data into the relationship table 
   insert_product_model_relationship_query = "INSERT INTO [SalesLT].[ProductModelProductDescription] (ProductModelID, ProductDescriptionID, Culture) VALUES (?, ?, ?);" 
   cursor.execute(insert_product_model_relationship_query, (productModelId, results[0][0], cultureId[:6])) 
   ```

1. Replace the `return` statement:

   ```python
   return "Product Description was added"
   ```

   Power BI report buttons require that functions return a string.

1. Publish and run your function to test that the database operation works correctly. Use the following guidelines for the input parameters:

   * **productDescription**: string
   * **productModelId**: integer between 1 and 127

### Complete function code

The following code block provides the final function code that you edited in the previous section.

Power BI report buttons require that functions return a string.

```python
import fabric.functions as fn
import uuid

udf = fn.UserDataFunctions()

@udf.connection(argName="sqlDB",alias="<REPLACE_WITH_CONNECTION_ALIAS>") 
@udf.function() 

def write_one_to_sql_db(sqlDB: fn.FabricSqlConnection, productDescription: str, productModelId:int) -> str: 

    # Establish a connection to the SQL database  
    connection = sqlDB.connect() 
    cursor = connection.cursor() 

    # Insert data into the product description table  
    insert_query = "INSERT INTO [SalesLT].[ProductDescription] (Description) OUTPUT INSERTED.ProductDescriptionID VALUES (?)" 
    cursor.execute(insert_query, productDescription) 

    # Get the ID from the previous query 
    results = cursor.fetchall() 

    # Generate an Id for the Culture column 
    cultureId = str(uuid.uuid4()) 

    # Insert data into the relationship table 
    insert_product_model_relationship_query = "INSERT INTO [SalesLT].[ProductModelProductDescription] (ProductModelID, ProductDescriptionID, Culture) VALUES (?, ?, ?);" 
    cursor.execute(insert_product_model_relationship_query, (productModelId, results[0][0], cultureId[:6])) 

    # Commit the transaction 
    connection.commit() 
    cursor.close() 
    connection.close()  

    return "Product description was added" 
```

## Grant user permissions (optional)

If other users will interact with the Power BI report that calls this function, grant them **Execute functions** permissions.

1. On the functions page, select **Share**.
1. Select the first box of the **Create and send link** pop-up window.
1. Select **Execute Functions and View Functions Logs** from the **Additional permissions** list, then select **Apply**.

   :::image type="content" source="./media/translytical-task-flow-tutorial/select-permissions.png" alt-text="Screenshot that shows adding the 'execute functions and view function logs' permissions.":::

1. In the **Enter a name or email address** box, provide the users or groups that you want to have permissions for this function.
1. Select **Send**.

## Best practices for user data functions

When you start to write your own functions for translytical task flow scenarios, follow these best practices to ensure a quality end-user experience.

* Write input validation logic for each parameter. Use the `fn.UserThrownError()` method to send an expected error response to the Power BI report. For example:

  ```python
  if (discount < 0):
      raise fn.UserThrownError("Discount cannot be negative.")
  ```

* Use a try/catch statement for all execute database calls. Return a friendly message to handle cases when the database is offline or unreachable.
* Ensure that your SQL statements aren't vulnerable to SQL injection attacks.
* Write a friendly success message that tells the end user that their operation was successful.

## Create a Power BI report and connect the data source

In this section, you create a Power BI report that pulls data from the SQL database you created in the previous article.

<!-- OneLake catalog -> Sql DB (preview) -> -->

1. In Power BI Desktop, create a new report.
1. Select **Get data** > **More...**.

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-get-data.png" alt-text="Screenshot that shows selecting 'get data' on an empty Power BI report in Power BI Desktop.":::

1. In the **Get Data** window, select **Microsoft Fabric** > **SQL database**. Then, select **Connect**.

   :::image type="content" source="./media/translytical-task-flow-tutorial/sql-database-connect.png" alt-text="Screenshot that shows selecting Fabric SQL database as the data source.":::

1. Select the database that you created in the previous article. For example, **AdventureWorksLT**. Then, select **Connect**.

1. Follow any prompts to authenticate to the database.

1. Once you successfully connect to the database, the **Navigator** window opens. Select the following tables, then select **Load**:

   * `SalesLT.ProductDescription`
   * `SalesLT.ProductModel`
   * `SalesLT.ProductModelProductDescription`

   :::image type="content" source="./media/translytical-task-flow-tutorial/navigator-load-tables.png" alt-text="Screenshot that shows loading three tables from the sample dataset into the Power BI report.":::

1. When prompted, choose **DirectQuery** as the connection mode, then select **Ok**.

   DirectQuery mode is a live connection that enables the report to refresh the data and reflect any data modifications. For more information, see [DirectQuery in Power BI](../connect-data/desktop-directquery-about.md).

## Build the Power BI report

In this section, build visuals with the data that you loaded into your Power BI report.

1. In the **Data** menu, select the following columns:

   * `SalesLT.ProductModel` > `Name`
   * `SalesLT.ProductModelProductDescription` > `ProductModelID`

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-select-columns.png" alt-text="Screenshot that shows selecting the 'Name' and 'ProductModelID' columns to add to the report.":::

   A two-column table appears in your report window.

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-1.png" alt-text="Screenshot that shows the Power BI report with one table added to it.":::

1. In the **Visualizations** menu, select the **Text slicer** icon.

   :::image type="content" source="./media/translytical-task-flow-tutorial/text-slicer.png" alt-text="Screenshot that shows selecting the 'text slicer' visualization to add to the report.":::

   >[!TIP]
   >If you don't see the text slicer icon, make sure that the **Text slicer** preview feature is enabled in Power BI Desktop. For more information, see [Required preview features](./translytical-task-flow-overview.md#required-preview-features).

   A text slicer visual appears in your report window.

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-2.png" alt-text="Screenshot that shows the Power BI report with a text slicer added to it.":::

1. Select the text slicer and use the **Format visual** > **General** > **Title** options to give the text slicer the following title: `Write a new product description`.

1. On the taskbar, select the **Insert** menu and add a **Blank** button to the report. Drag the button under the text slicer.

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-3.png" alt-text="Screenshot that shows the Power BI report with a button added to it.":::

1. Select the button and expand the **Action** options in the **Format button** pane. Turn the **Action** radio button to **On**.

1. Provide the following values for your button:

   | Parameter | Value |
   | --------- | ----- |
   | **Type** | Select **Data function** |
   | **Workspace** | Select the workspace that contains the user data function you made in the previous article. |
   | **Function Set** | Select the function set that contains your data function. For example, **sqlwriteback**. |
   | **Data function** | Select your data function. For example, **write_one_to_sql_db**. |

   >[!TIP]
   >If you don't see the **Data function** option, make sure that the **Translytical task flows** preview feature is enabled in Power BI desktop.
   >
   >If you do see the **Data function** option but don't see your user data function, make sure that your data function returns a string.

1. Once you select your data function, additional parameters appear to represent the parameters that the function takes. Provide the following values:

   | Parameter | Value |
   | --------- | ----- |
   | **productDescription** | Select the text slicer from your report, **Write a new product description**. |
   | **productModelId** | Select the **Conditional formatting** (**fx**) button. A new window opens.<br><br>For the **Format style** parameter, keep the default **Field value** value.<br><br>For the **What field should we base this on?** parameter, select **All data** > **SalesLT.ProductModel** > **ProductModelID**. |
   | **Summarization** | Select **Maximum**. |

1. Select **OK** to complete the action configuration. The **Action** details should look like the following example:

   :::image type="content" source="./media/translytical-task-flow-tutorial/button-action.png" alt-text="Screenshot that shows the final action configuration details.":::

1. Select the button and expand the **Style** options in the **Format button** pane. Turn the **Text** radio button to **On** and label your button `Enter`.

<!-- Adjust style for the loading state. Change the text ("submitting"), change the spinner size (icon size -> 20; left padding -> 20px) -->

1. In the **Visualizations** pane, select the **Table** icon to insert a new table.

1. In the **Data** pane, select the following columns to add to your table:

   * `SalesLT.ProductModel` > `Name`
   * `SalesLT.ProductDescription` > `Description`
   * `SalesLT.ProductDescription` > `ModifiedDate`

   :::image type="content" source="./media/translytical-task-flow-tutorial/report-4.png" alt-text="Screenshot that shows the Power BI report with a second table added to it.":::

## Optional report modifications

As with any Power BI report, there are many ways to customize the appearance and improve the functionality of this report. Consider some of these options:

* Add titles to the two tables. For example, **Select a product** and **Product description**.
* Set the text slicer to auto-clear after submitting a new product description. To do so, select the button that triggers the user data function. In the **Format button** > **Action** menu, set the **Auto clear** toggle to **On**.
* Opt-out of auto-refresh for the report after triggering the user data function. In this scenario, it's helpful to refresh the data and see the new product description appear in the table. In other scenarios, you might not need or want to refresh the report. To turn off this setting, select the button that triggers the user data function. In the **Format button** > **Action** menu, set the **Refresh the report after a successful outcome** toggle to **Off**.

## Publish your report

You built your report in Power BI Desktop. In this section, you publish the report so that your users can interact with it in the web portal.

1. In the **Home** toolbar menu, select **Publish**.

1. Select the Power BI workspace where you want to publish this report, then select **Select**.

1. Once your report finishes publishing, select the link to **Open <REPORT_NAME>.pbix in Power BI**.

   >[!TIP]
   >When you open your report in the Power BI web portal, you might see an error that says, **The data source is missing credentials and cannot be accessed**. To resolve this error, use the following steps:
   >
   >1. Open the semantic model for your report and navigate to **File** > **Settings**. 
   >2. Expand the **Data source credentials** setting if it isn't already.
   >3. Select **Edit credentials**.
   >4. Choose your **Authentication method** from the dropdown menu. For example, **Basic** takes a username and password, and **OAuth2** enables single sign-on with your current account.
   >5. Provide the required information, if any, then select **Sign in**.

Now, you have a translytical task flow in a Power BI report that's available in the Power BI service.

## Run your translytical task flow

In this section, you interact with your report in the Power BI web portal to test the translytical task flow that you built.

Only users that are authorized to trigger data functions can use this feature. Any unauthorized users get a **Something went wrong** response.

1. Open your report in Power BI.
1. Select a product from the product table that lists the name and ID. This selection passes context to the text slicer for which product you want to update. You also see that the product description table filters to show all of the current descriptions for the selected product.
1. Write a new product description in the input text box.
1. Select the arrow icon or use the **Tab** key to submit the input. Once a product is selected an a description is provided, you see that the button switches to an enabled state.
1. Select the button to run the user data function.

If the translytical task flow worked correctly, you receive a message that says **The action on your report was submitted successfully**. The product description table refreshes to show the new description.

If anything goes wrong with the translytical task flow, you receive a message that says **Something went wrong**. Select **View details** to get more information about the reason for the failure. Some common reasons for an unsuccessful function run include:

* **Data validation**: Input values don't meet the data validation rules defined in the user data function.
* **Timeout error**: A function or process takes longer than the allowed time to complete.
* **Improper setup**: Errors in configuring the report elements, usually the button, can cause the task flow to fail or product unexpected results.
* **Unauthorized user**: The user doesn't have permissions to trigger the data function.
  