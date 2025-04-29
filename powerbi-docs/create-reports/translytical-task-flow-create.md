---
title: Tutorial - Create translytical task flow
description: In this tutorial, learn how to enable and create translytical task flows with Fabric user data functions.
author: kgremban
ms.author: kgremban
ms.reviewer: miguelmyers
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: tutorial
ms.date: 04/29/2025
LocalizationGroup: Create reports
#customer intent:
---

# Tutorial: Create a translytical task flow (preview)

In this end-to-end scenario, you create an example translytical task flow that writes back to a SQL Database in Fabric. To help illustrate the end-to-end step-up experience, we focus on a translytical task flow for a data annotation scenario.

In this tutorial, you learn how to:

> [!div class="checklist"]
> * Create a SQL database in Fabric with sample data.
> * Configure a user data function that writes back to SQL database.

If you don't have an existing Fabric capacity, [start a Fabric trial](/fabric/fundamentals/fabric-trial).

## Prerequisites

* Enable [required preview features](./translytical-task-flow-overview.md) in Power BI and Fabric.
* [Enable SQL database in Fabric using admin portal tenant settings](/fabric/database/sql/enable).

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

   :::image type="content" source="./media/translytical-task-flow-create/new-item-user-data-functions.png" alt-text="A screenshot that shows the user data functions tile on the new item menu.":::

1. Provide a name for the new user data function, then select **Create**.

   Take note of the name you use, and the workspace name. You use both of these values later in the tutorial.

1. Select **New function**.

## Connect to your SQL database

Connect the user data function to the SQL database you created previously. Make sure that you have access permissions to the SQL database before continuing.

1. Select **Manage connections** on the page for your new user data function.

   :::image type="content" source="./media/translytical-task-flow-create/manage-connections.png" alt-text="Screenshot that shows selecting 'manage connections' on the functions page.":::

1. Select **Add data connection**.
1. Select the SQL database that you created previously, then select **Connect**.
1. After the connection is created, copy the **Alias** value to use later in the tutorial.
1. Close the **Connections** page to return to your user data function.

## Add function code

Add code to the user data function that writes a new row to your database.

1. Select **Edit** on the functions page.

   :::image type="content" source="./media/translytical-task-flow-create/edit-function.png" alt-text="Screenshot that shows selecting 'edit' on the functions page.":::

1. On the **Edit** toolbar, select **Insert sample** > **SQL Database** > **Write one row of data into a table in SQL database**.

   :::image type="content" source="./media/translytical-task-flow-create/write-one-row-of-data.png" alt-text="Screenshot that shows the nested dropdown menus to select the 'write one row of data into a table in SQL database' sample.":::

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

You can view the finished code for this section in the following [Complete function code](#appendix-function-code) section.

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

```python
import datetime
import fabric.functions as fn
import logging
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

    return "Product Description was added" 
```

## Grant user permissions (optional)

If other users will interact with the Power BI report that calls this function, grant them **Execute functions** permissions.

1. On the functions page, select **Share**.
1. Select the first box of the **Create and send link** pop-up window.
1. Select **Execute Functions and View Functions Logs** from the **Additional permissions** list, then select **Apply**.

   :::image type="content" source="./media/translytical-task-flow-create/select-permissions.png" alt-text="Screenshot that shows adding the 'execute functions and view function logs' permissions.":::

1. In the **Enter a name or email address** box, provide the users or groups that you want to have permissions for this function.
1. Select **Send**.

## Best practices

When you start to write your own functions for translytical task flow scenarios, follow these best practices to ensure a quality end-user experience.

* Write input validation logic for each parameter. Use the `fn.UserThrownError()` method to send an expected error response to the Power BI report. For example:

  ```python
  if (discount < 0):
      raise fn.UserThrownError("Discount cannot be negative.")
  ```

* Use a try/catch statement for all execute database calls. Return a friendly message to handle cases when the database is offline or unreachable.
* Ensure that your SQL statements aren't vulnerable to SQL injection attacks.
* Write a friendly success message that tells the end user that their operation was successful.

## Next steps

In this tutorial, you created a user data function that writes to a SQL database. In the next tutorial, you'll create a Power BI report that integrates this function so that end users can interact with the data.

> [!div class="nextstepaction"]
> [Build a Power BI report with a translytical task flow](./translytical-task-flow-report.md)
  