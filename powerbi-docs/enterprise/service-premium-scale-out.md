---
title: Power BI Dataset Scale-Out
description: Learn how Power BI Dataset Scale-Out improves your Power BI performance by reducing dataset query and refresh times
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 01/17/2023
LocalizationGroup: Premium
---

# Power BI Dataset Scale-Out (preview)

Power BI Dataset Scale-Out helps Power BI deliver fast performance while your reports and dashboards are consumed by a large audience. Scale-Out uses your Premium capacity to host copies of your dataset. By increasing throughput, the dataset copies ensure that performance doesn’t slow down when multiple users submit queries at the same time.

When Power BI creates the dataset copies, it separates *read-only* copies of the dataset from a *read/write* copy of the dataset. The *read-only* dataset copies serve the Power BI report and dashboard consumption, and the *read/write* dataset copy is used when write operations and refreshes are performed. During write operations and refreshes, the *read-only* dataset copies continue to serve your reports and dashboards without being disrupted. When needed, the *read-only* and *read/write* datasets are synced so that the *read-only* copies are kept up-to-date. Using this method, Power BI Dataset Scale-Out reduces the impact of write operations and dataset refreshes on your capacity.

Only XMLA endpoints and advanced APIs connect to the *read/write* dataset copy. All other operations connect to the *read-only* dataset copy. The table below lists the required sync for each refresh method, when Power BI Dataset Scale-Out is enabled.

| Refresh method    | Sync                 |
|-------------------|----------------------|
| OnDemand UI       | Always syncs         |
| Scheduled Refresh | Always syncs         |
| Basic REST API    | Always syncs         |
| Advanced REST API | Manual sync required |
| XMLA              | Manual sync required |

## Prerequisites

Before you enable Power BI Dataset Scale-Out, verify that the following Prerequisites are met.

* Your workspace resides on a Power BI Premium [capacity](service-premium-gen2-what-is.md#capacities-and-skus):
    * P SKUs
    * A SKUs for Power BI Embedded (also known as [embed for your customers](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-customers)).

* Your workspace is configured to use the [Large datasets](service-premium-large-models.md) storage format.

* [XMLA read/write](service-premium-connect-tools.md#enable-xmla-read-write) is enabled.

* Power BI Management cmdlets. Install by opening PowerShell in Administrator mode, and running the command:

    ```powershell
    Install-Module -Name MicrosoftPowerBIMgmt
    ```

* The following (or higher) app, library and service versions:

    | App, library or service  | Version |
    |--------------------------|---------|
    | Microsoft Analysis Services OLE DB Provider for Microsoft SQL Server (MSOLAP) | 16.0.20.201 (March 2022) |
    | Microsoft.AnalysisServices.AdomdClient (ADOMD.NET) | 19.36.0 (March 2022) |
    | Analysis Services client libraries | 19.49.0.1 |
    | Power BI Desktop         | March 2022 |
    | SQL Server Management Studio (SSMS) | 18.12.1 |
    | Tabular Editor 2         | 2.16.6   |
    | Tabular Editor 3         | 3.2.3    |
    | DAX Studio               | 3.0.0    |

## Enable Dataset Scale-Out

Power BI Dataset Scale-Out is enabled by default for your tenant. However, you'll need to enable it for each workspace individually.

### Enable Scale-Out for your workspace

Use the XMLA endpoint to turn on Scale-Out.

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

    :::image type="content" source="media/service-premium-scale-out/ssms-connect.png" alt-text="A screenshot showing how to add the Scale-Out XMLA script to S Q L Server Management Studio (S S M S).":::

### Disable Scale Out for your workspace

Power BI Query Scale Out is enabled by default and can be disabled by a Power BI admin. To disable this feature, follow the instructions below.

1. Go to your [tenant settings](./../admin/service-admin-portal-about-tenant-settings.md)

2. Expand the **Scale-out settings**.

3. Toggle the switch so that it shows **Disabled**.

4. Select **Execute** and wait for the query to complete.

    :::image type="content" source="media/service-premium-scale-out/disable-scale-out.png" alt-text="A screenshot showing how to disable the scale out tenant settings in the Power BI admin portal.":::

### Disable Scale-Out for your tenant

Power BI Dataset Scale-Out is enabled by default for each tenant. A Power BI admin can disable this tenant settings. To disable Dataset Scale-Out, follow the instructions below.

1. Go to your [tenant settings](./../admin/service-admin-portal-about-tenant-settings.md)

2. Expand the **Scale-out settings**.

3. Toggle the switch so that it shows **Disabled**.

4. Select **Execute** and wait for the query to complete.

    :::image type="content" source="media/service-premium-scale-out/disable-scale-out.png" alt-text="A screenshot showing how to disable the scale out tenant settings in the Power BI admin portal.":::

## Connect to a specific dataset type

When Scale-Out is enabled, the following connections are maintained.

* Power BI Desktop connects to the *read-only* dataset by default.

* [Live connection](./../connect-data/desktop-report-lifecycle-datasets.md) reports, are connected to the *read-only* dataset copy.

* XMLA clients are connected to the *read/write* dataset copy by default.

* Refreshes in Power BI service and refreshes using the [Enhanced Refresh REST API](./../connect-data/asynchronous-refresh.md), are connected to the *read/write* dataset copy.

You can connect to specific type of dataset copy by appending one of the following strings to the dataset's URL.

* **Read-only** - `?readonly`
* **Read/write** - `?readwrite`

## Considerations and limitations

* Client applications can connect to the *read-only* dataset copy through the XMLA endpoint, provided they support the mode specified on the connection string. Client applications can also connect to the *read/write* instance using XMLA endpoint.

* Manual and scheduled refreshes are automatically synchronized with the latest version of the *read-only* dataset copies. REST API refreshes must be synced with the *read-only* dataset copies using the manual sync REST API.

* XMLA updates and refreshes must be synced with the *read-only* dataset copies using the Sync REST API.

* When deleting a Power BI Dataset Scale-Out dataset, and creating another dataset with the same name. Allow five minutes to pass before creating the new dataset. It might take Power BI a short while to remove the copies of the original dataset.

* When Power BI Dataset Scale-Out is turned on, changes to the following features, are not supported:
    * Model roles for RLS and OLS
    * Tables that use DirectQuery and Dual data sources

    To make changes to these features, disable Scale-Out and allow a few minutes for the change to take place.

## Next steps

> [!div class="nextstepaction"]
> [Tutorial: Test Power BI Dataset Scale-Out](service-premium-scale-out-test.md)

> [!div class="nextstepaction"]
> [Sync a read-only Scale-Out replica](service-premium-scale-out-sync-replica.md)

> [!div class="nextstepaction"]
> [Compare Scale-Out dataset copies](service-premium-scale-out-app.md)
