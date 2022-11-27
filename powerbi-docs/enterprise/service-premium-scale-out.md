---
title: Power BI Premium Scale-out
description: Learn how Power BI Premium Scale-out improves your Power BI performance by reducing dataset query and refresh times
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 09/15/2022
LocalizationGroup: Premium
---

# Power BI Query Scale Out

Power BI Query Scale Out helps Power BI deliver fast performances while your reports and dashboards are consumed by a large audience. Scale Out uses your Premium capacity to host dataset copies. The copies boost the performance of your reports and dashboards, by increasing throughput when multiple users submit queries at the same time.

When Power BI creates the dataset copies, it separates *read-only* datasets from *read/write* datasets. The *read-only* datasets serve the Power BI report and dashboard consumption, and the *read/write* dataset is used when write operations and refreshes are required. During write operations and refreshes, the *read-only* datasets continue to serve your reports and dashboards without being disturbed. When needed, the *read-only* and *read/write* datasets are synced so that the *read-only* datasets are kept up-to-date. Using this method, Power BI Query Scale Out reduces the impact of write operations and dataset refreshes on your capacity.

1 - 
*Refresh isolation* - one read-only replica - one dataset replica deals with queries; read/write and read-only replica

2 - End of feb
Automatic scale out of replicas to support multi user concurrency - coming in the 2nd public preview step

3 - March (?)
GA - On by default


Refreshes - happen at the original dataset. It needs to be syncned manaully via an API call.

Changes to the model (metadata) - happen at the original dataset. It needs to be sycned manaully via an API call.


Only XMLA - connects to read/write; everything else connects to read-only.


Refresh method	        AutoSync = Off
OnDemand UI	            Ignored, Always syncs
Scheduled Refresh	    Ignored, Always syncs
Basic REST API	        Ignored, Always syncs
Advanced REST API	    Honored, manual sync required
XMLA	                Honored, manual sync required


## Prerequisites

* One of the following Power BI Premium [capacities](service-premium-gen2-what-is.md#capacities-and-skus):
    * P SKUs
    * A SKUs for Power BI Embedded (also known as [embed for your customers](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-customers)) - Enable using Power scripts or APIs

* [Large datasets](service-premium-large-models.md)

## Enable Query Scale Out

Use the XMLA endpoint to turn on scale out. Before you begin verify that:

* [XMLA read/write](service-premium-connect-tools.md#enable-xmla-read-write) is enabled.

* Your workspace resides on a Premium capacity and the [Large dataset storage format](service-premium-large-models.md) is enabled.

### Step 1 - Establish the XML connection

1. Start SQL Server Management Studio (SSMS) and in the **Connect to Server** dialog box, fill in the fields as listed below.

    | Field          | Value |
    |----------------|-------|
    | **Server type**    | Analysis Services |
    | **Server name**    | Paste the workspace connection string. You can get the connection string by going into your workspace settings, selecting Premium and copying the *Workspace Connection* string. |
    | **Authentication** | Select the correct authentication type for your environment |
    | **User name**      | Provide a valid UPN |

2. Select **Connect**.

3. In the *Object Explorer* pane, select the **Databases** node.

4. In the toolbar, select **XMLA**. If a *Connect to Analysis Services* dialog box appears, select *Connect*.

5. Paste the following request into the XMLA window. Replace `WorkspaceName` with the name of your workspace.  

    ```xml
    <Execute xmlns="urn:schemas-microsoft-com:xml-analysis"> 
        <Command> 
            <Batch xmlns="http://schemas.microsoft.com/analysisservices/2003/engine"> 
                <Alter ObjectExpansion="ObjectProperties" xmlns="http://schemas.microsoft.com/analysisservices/2003/engine"> 
                    <Object /> 
                    <ObjectDefinition><Server xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
                                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                                xmlns:ddl2="http://schemas.microsoft.com/analysisservices/2003/engine/2" 
                                xmlns:ddl2_2="http://schemas.microsoft.com/analysisservices/2003/engine/2/2" 
                                xmlns:ddl100_100="http://schemas.microsoft.com/analysisservices/2008/engine/100/100" 
                                xmlns:ddl200="http://schemas.microsoft.com/analysisservices/2010/engine/200" 
                                xmlns:ddl200_200="http://schemas.microsoft.com/analysisservices/2010/engine/200/200" 
                                xmlns:ddl300="http://schemas.microsoft.com/analysisservices/2011/engine/300" 
                                xmlns:ddl300_300="http://schemas.microsoft.com/analysisservices/2011/engine/300/300" 
                                xmlns:ddl400="http://schemas.microsoft.com/analysisservices/2012/engine/400" 
                                xmlns:ddl400_400="http://schemas.microsoft.com/analysisservices/2012/engine/400/400" 
                                xmlns:ddl500="http://schemas.microsoft.com/analysisservices/2013/engine/500" 
                                xmlns:ddl500_500="http://schemas.microsoft.com/analysisservices/2013/engine/500/500"> 
                            <Name>WorkspaceName</Name> 
                            <ServerProperties> 
                                <ServerProperty> 
                                    <Name>Feature\PBIP\QueryScaleOut</Name> 
                                    <Value>1</Value> 
                                </ServerProperty> 
                            </ServerProperties> 
                        </Server> 
                    </ObjectDefinition> 
                </Alter> 
            </Batch> 
        </Command> 
        <Properties /> 
    </Execute>  
    ```

6. Select **Execute**.

    :::image type="content" source="media/service-premium-scale-out/ssms-connect.png" alt-text="A screenshot showing how to add the scale out XMLA script to S Q L Server Management Studio (S S M S).":::

### Step 2 - Create a scale out query

1. Open Power BI Desktop and sign into your account.

2. Select **Transform data** to open the Power BI *Power Query Editor*.

    :::image type="content" source="media/service-premium-scale-out/transform-data.png" alt-text="A screenshot highlighting the transform data button in Power B I Desktop.":::

3. In the Power BI *Power Query Editor*, select **New Source**.

    :::image type="content" source="media/service-premium-scale-out/new-source.png" alt-text="A screenshot highlighting the new source button in the power query editor in Power B I Desktop.":::

4. In the *Get Data* pop-up window, select **Blank Query** and select **Connect**.

    :::image type="content" source="media/service-premium-scale-out/blank-query.png" alt-text="A screenshot highlighting the blank query option in the get data window in Power B I Desktop.":::

5. Select *Query 1*, and then select **Advanced editor**.

    :::image type="content" source="media/service-premium-scale-out/advanced-editor.png" alt-text="A screenshot highlighting the advanced editor button in the power query editor in Power B I Desktop.":::

6. Enter the following *M Formula language* code.

    ```
    let 
        Source = "Dataset last refreshed:",    
        #"Converted to Table" = #table(1, {{Source}}), 
        #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "RefreshInfo"}}) 
    in 
        #"Renamed Columns"

7. Select **Done**.

8. In the *Power Query Editor* select **Close & Apply**.

    :::image type="content" source="media/service-premium-scale-out/close-and-apply.png" alt-text="A screenshot showing the close and apply button in the power query editor in Power B I Desktop.":::

### Step 3 - Create a time column

1. In Power BI Desktop select **Data**.

    :::image type="content" source="media/service-premium-scale-out/data.png" alt-text="A screenshot showing the data button highlighted in Power B I Desktop.":::

2. In the *Fields* pane, select **Query 1**.

3. Select **New column**.

4. Enter the following DAX expression to define a new calculated column.

    ```dax
    Time = NOW()
    ```

    :::image type="content" source="media/service-premium-scale-out/time-now-dax-query.png" alt-text="A screenshot showing the time equals now dax query.":::

5. Select **Report**.

    :::image type="content" source="media/service-premium-scale-out/report.png" alt-text="A screenshot showing the report button highlighted in Power B I Desktop.":::

6. Select **Publish** and in the *Microsoft Power BI Desktop* pop-up window, select **Save**.

    :::image type="content" source="media/service-premium-scale-out/publish-dataset.png" alt-text="A screenshot showing the Microsoft Power B I Desktop pop up window after the publish button is selected. The publish and save buttons are highlighted.":::

7. in the *Publish to Power BI** pop-up window, select the workspace you want to enable scale out for, and then select **Select**.

    :::image type="content" source="media/service-premium-scale-out/publish.png" alt-text="A screenshot showing the publish to Power B I pop up window in the Power B I Desktop.":::

### Step 4 - Connect to the read/write dataset copy (optional)

By default, Power BI Desktop connects to the *read-only* dataset copy. To connect to the *read/wrtie* replica, follow these steps:

1. In SQL Server Management Studio (SSMS), expand *Databases* and select the uploaded Power BI dataset.

2. Run a simple DAX query such as:

    ```dax
    Evaluate Query1
    ```

    :::image type="content" source="media/service-premium-scale-out/evaluate-query.png" alt-text="A screenshot showing the evaluate query 1 D A X query in S Q L Server Management Studio.":::

### Step 5 - Validate the read/write connection (optional)

If you followed [step 4](#step-4---connect-to-the-readwrite-dataset-copy-optional), you're connected to the *read/write* dataset copy. You can validate this connection by following these steps:

1. In SQL Server Management Studio (SSMS), right-click your dataset, select **Process Database**.

    :::image type="content" source="media/service-premium-scale-out/process-database.png" alt-text="A screenshot showing the process database option highlighted in S Q L Server Management Studio.":::

2. In the *Process Database* dialog box, select **OK**.

    :::image type="content" source="media/service-premium-scale-out/process-database-dialog.png" alt-text="A screenshot showing the process database window with the O K button highlighted.":::

3. Once the process completes successfully, select **Close** and close the *Process Database* window.

4. In the DAX query window, execute the query *Evaluate Query1* again.

5. Switch back to Power BI Desktop, and select **Refresh**. Note that Power BI Desktop shows the old time because it is connected to the read-only replica while SSMS shows the new time because it is connected to the read/write replica, and the replicas have not been synchronized yet.

    :::image type="content" source="media/service-premium-scale-out/refresh.png" alt-text="A screenshot showing the refresh button in Power B I Desktop.":::

6. In SQL Server Management Studio (SSMS), expand your query and then expand **Tables**.

    :::image type="content" source="media/service-premium-scale-out/expand tables.png" alt-text="A screenshot showing query 1 in the expanded tables view in S Q L Server Management Studio.":::

7. Right-click *Query 1*, and then select **Script table as > Create Or Replace To > New Query Editor Window**.

    :::image type="content" source="media/service-premium-scale-out/new-query-editor-window.png" alt-text="A screenshot showing selecting Script table as, then Create Or Replace To, then New Query Editor Window in S Q L Server Management Studio.":::

8. In the Tabular Model Scripting Language (TMSL) script file, change the table `name` property to `RefreshTimeTable` and select **execute**.

    :::image type="content" source="media/service-premium-scale-out/refresh-time-table.png" alt-text="A screenshot showing changing the name property in table, to RefreshTimeTable in the in the Tabular Model Scripting Language (T M S L) script file in S Q L Server Management Studio.":::

9. In SQL Server Management Studio (SSMS), right-click the *Tables* node and then select **Refresh**.

    :::image type="content" source="media/service-premium-scale-out/refresh-time-table.png" alt-text="A screenshot showing the refresh option after right clicking the table node in S Q L Server Management Studio.":::

    The *Query 1* table name changes to *RefreshTimeTable*.

    :::image type="content" source="media/service-premium-scale-out/new-table-name.png" alt-text="A screenshot showing that the table name is now RefreshTimeTable in S Q L Server Management Studio.":::



## Connecting to a specific dataset type

When scale out is enabled, the following connections are maintained.

* Power BI Desktop connects to the *read-only* dataset by default.

* [Live connection](./../connect-data/desktop-report-lifecycle-datasets) reports, are connected to the *read-only* dataset copy.

* XMLA clients are connected to the *read/write* dataset copy by default.

* Refreshes in Power BI service and refreshes using the [Enhanced Refresh REST API](./../connect-data/asynchronous-refresh.md), are connected to the *read/write* dataset copy.

You can connect to specific type of dataset copy by appending one of the following strings to the dataset's URL.

* **read-only** - `?readonly`
* **Read/write** - `?readwrite`

## Disable Power BI Query Scale Out

Power BI Query Scale Out is enabled by default and can be disabled by a Power BI admin. To disable this feature, follow the instructions below.

1. Go to your [tenant settings](./../admin/service-admin-portal-about-tenant-settings.md)

2. Expand the **Scale-out settings**.

3. Toggle the switch so that it shows **Disabled**.

4. Select **Execute** and wait for the query to complete.

    :::image type="content" source="media/service-premium-scale-out/disable-scale-out.png" alt-text="A screenshot showing how to disable the scale out tenant settings in the Power BI admin portal.":::




    ```






## Considerations and limitations

* Client applications can connect to the *read-only* dataset copy through the XMLA endpoint, provided they support the mode specified on the connection string. Client applications can also connect to the *read/write* instance using XMLA endpoint.

* Manual and scheduled refreshes are automatically synchronized with the latest version of the *read-only* dataset copies. REST API refreshes must be synced with the *read-only* dataset copies using the manual sync REST API.

* XMLA updates and refreshes must be synced with the *read-only* dataset copies using the Sync REST API.

* When deleting a Power BI Query Scale Out dataset, and creating another dataset with the same name. Allow five minutes to pass before creating the new dataset. It might take Power BI a short while to remove the copies of the original dataset.

* The following operations are not supported on Power BI Query Scale Out datasets:
    * Deleting data sources for direct query or Dual models
    * Adding, deleting and updating roles
    * Changes that affect the dynamic security of the model. For example, adding or removing dynamic expressions, and changes to Object Level Security (OLS)

## Next steps

> [!div class="nextstepaction"]
> [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
