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

### Step 2 - Enable scale out using Power BI Desktop

1. Open Power BI Desktop.

2. 

## Connecting to a specific dataset type

When scale out is enabled, the following connections are maintained.

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

5. Open Power BI Desktop, %%%%%%%%%%%%%%%%%%sign in, and select **Get Data**.

6. Select **Blank Query**.

7. Select **Query 1** and open the **Advanced Editor**.

    :::image type="content" source="media/service-premium-scale-out/advanced-editor.png" alt-text="A screenshot showing the advanced editor button in the Power Query Editor in Power BI Desktop.":::

8. Enter the following *M Formula language* code.

    ```
    let 
        Source = "Dataset last refreshed:",    
        #"Converted to Table" = #table(1, {{Source}}), 
        #"Renamed Columns" = Table.RenameColumns(#"Converted to Table",{{"Column1", "RefreshInfo"}}) 
    in 
        #"Renamed Columns" 
    ```

9. Select **Done** and in the *Power Query Editor* select **Close & Apply**.

10. In the *Fields* pane, select **Query 1**.

11. From the *Table tools* tab, select **New column**.

12. Enter the following DAX expression to define a new calculated column.

    ```dax
    Time = NOW()
    ```

    :::image type="content" source="media/service-premium-scale-out/time-now-dax-query.png" alt-text="A screenshot showing the time equals now dax query.":::

13. Save and publish the Power BI dataset.

    :::image type="content" source="media/service-premium-scale-out/publish-dataset.png" alt-text="A screenshot showing the Microsoft Power B I Desktop pop up window after the publish button is selected. The publish and save buttons are highlighted.":::


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
