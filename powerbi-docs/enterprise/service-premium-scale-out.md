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

When Power BI creates the dataset copies, it separates *read* only datasets from *read/write* datasets. The *read* datasets serve the Power BI report and dashboard consumption, and the *read/write* dataset is used when write operations and refreshes are required. During write operations and refreshes, the *read* datasets continue to serve your reports and dashboards without being disturbed. When needed, the *read* and *read/write* datasets are synced so that the *read* datasets are kept up-to-date. Using this method, Power BI Query Scale Out reduces the impact of write operations and dataset refreshes on your capacity.

## Prerequisites

* One of the following Power BI Premium [capacities](service-premium-gen2-what-is.md#capacities-and-skus):
    * P SKUs
    * A SKUs for Power BI Embedded (also known as [embed for your customers](../developer/embedded/embedded-analytics-power-bi.md#embed-for-your-customers)) - Enable using Power scripts or APIs

* [Large datasets](service-premium-large-models.md)

## Disable Power BI Query Scale Out

Power BI Query Scale Out is enabled by default and can be disabled by a Power BI admin. To disable this feature, follow the instructions below.

1. Go to your [tenant settings](./../admin/service-admin-portal-about-tenant-settings.md)

2. Expand the **Scale-out settings**.

3. Toggle the switch so that it shows **Disabled**.

4. Select **Apply**.

    :::image type="content" source="media/service-premium-scale-out/disable-scale-out.png" alt-text="A screenshot showing how to disable the scale out tenant settings in the Power BI admin portal.":::

## Connecting to a specific dataset type

Power BI Desktop and Power BI service use a different default connection when they connect to a dataset. The connection also depends on the type of operation you're performing. For example, if your're using a [live connection](./../connect-data/desktop-report-lifecycle-datasets.md) to connect to a dataset with Power BI Desktop to view a report, you'll be connected to the *read* dataset. However, if you're viewing a report in Power BI Premium, you'll be connected to the *read/write* dataset. The table below lists the default dataset types used by Power BI Desktop and Power BI service per operation.

|Operation                  |Power BI Desktop live connection |Power BI service |
|---------------------------|---------------------------------|-----------------|
|**Connecting to a report** |Read                             |Read/write       |
|**Refreshes**              |Read/write                       |Read/write       |
|**Write operations**       |Read/write                       |Read/write       |

To connect to a different type of dataset, you can append one of the following strings to the dataset's URL.

* **Read** - `?readonly`
* **Read/write** - `?readwrite`

## Considerations and limitations

* Client applications can connect to the *read* dataset copy through the XMLA endpoint, provided they support the mode specified on the connection string. Client applications can also connect to the *read/write* instance using XMLA endpoint.

* Manual and scheduled refreshes are automatically synchronized with the latest version of the *read* dataset copies. REST API refreshes must be synced with the *read* dataset copies using the manual sync REST API.

* XMLA updates and refreshes must be synced with the *read* dataset copies using the manual Sync REST API.

* When deleting a Power BI Query Scale Out dataset, and creating another dataset with the same name. Allow five minutes to pass before creating the new dataset. It might take Power BI a short while to remove the copies of the original dataset.

* The following operations are not supported on Power BI Query Scale Out datasets:
    * Deleting data sources for direct query or Dual models
    * Adding, deleting and updating roles
    * Changes that affect the dynamic security of the model. For example, adding or removing dynamic expressions, and changes to Object Level Security (OLS)

## Next steps

> [!div class="nextstepaction"]
> [Using Autoscale with Power BI Premium](service-premium-auto-scale.md)
