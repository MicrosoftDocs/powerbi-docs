---
title: Power BI Premium Gen2 Metrics app (preview)
description: Learn how to use the Power BI Premium Gen2 Metrics app to manage and troubleshoot your Power BI Premium Gen2 capacities.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 03/25/2021
LocalizationGroup: Premium
---
# Power BI Premium Gen2 metrics app (preview)

With the release of **Power BI Premium Gen2 (preview)**, management of Premium capacities has become easier. To further facilitate managing your use of Premium Gen2 capacities, Power BI provides a self-service monitoring app, referred to in this article as the **Premium Gen2 Monitoring App**. 

The **Premium Gen2 Monitoring App** provides straightforward utilization data that reveals what is causing capacity resource utilization, and can help you plan your capacity needs or help inform changes in resource demand.

>[!TIP]
>The **Premium Gen2 Monitoring App** is also applicable for [Embedded Gen 2](../developer/embedded/power-bi-embedded-generation-2.md).

## Install the Gen2 monitoring app

Capacity administrators can get the **Premium Gen2 Monitoring App** app from its [link location](https://aka.ms/GenutilizationInstall), or by selecting **Apps** section in the Power BI service, selecting the **Get apps** button, and then searching for **Premium Gen 2 Capacity Utilization Metrics**. 

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-01.png" alt-text="Screenshot of select get app button":::

## Using the Gen2 monitoring app

Once the **Premium Gen2 Monitoring App** is installed, launch the app and select the **Connect to your data** message on the top of the report to trigger loading data from your Premium Gen2 capacity. To connect to your capacity you must provide two parameters:

* Your **capacity ID**
* How many days of utilization you want to load. 

Your **capacity ID** can be found in the URL of the Power BI Admin portal. It's the value after the ```/capacity/``` portion in your URL, similar to what's shown in the following image.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-02.png" alt-text="Screenshot of capacity ID in URL":::

When choosing how many **days of utilization** to see in your report, select a value that reflects the analysis you want to perform. For example, if you are analyzing monthly usage for charging users of your capacity, you can choose to load 30 or 45 days of data.

Once you submit those parameters, the **Premium Gen2 Monitoring App** loads the data and refreshes the view. The refresh can take a few minutes to complete.

Once refreshed, open the report. On the right are two charts:

* A line and stacked column chart called **Daily peak usage**, showing v-cores used for each day.
* A stacked bar chart called **Total by workspace ID and operation**, showing utilization by workspaces in your capacity

The **Daily peak usage** chart displays total available v-cores for each day as columns, and the highest v-core utilization recorded on that day as the line. Interact with the chart by selecting any column to filter the report to the selected day.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-03.png" alt-text="Screenshot of Daily peak usage chart":::

The **Total by workspace ID and operation** shows utilization broken down by the workspaces on your capacity. This visual can help you establish internal charge backs inside your organization, by attributing proportional costs to the amount of utilization for workspaces used by a given business unit.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-04.png" alt-text="Screenshot of total by workspace I D and operation chart":::

## Understanding usage patterns

To understand utilization patterns through each day, select any day in the **Daily peak usage** visual. In the following image, the *Feb 04* date is selected.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-05.png" alt-text="Screenshot of Daily peak usage chart with one day selected":::

The right side of the report reveal utilization patterns throughout the day, in 15 minute intervals. In the top left corner of each visual is a spinning wheel icon, which continues to spin as data is being loaded into the chart. Rendering the chart requires significant data, so ensure the wheel icon is not spinning to ensure the data is fully loaded.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-06.png" alt-text="Screenshot of details for selected day from Daily peak usage chart":::

### Interactive and background operations

Throughout the **Premium Gen2 Monitoring App** you'll see two types of utilization values, from various artifacts: *interactive* and *background*. *Interactive* operations include report views and interactions that are rendered in real time. *Background* operations include refreshes of datasets and dataflows.

*Background* operations are typically create spikes in terms of CPU utilization and take a longer time to complete, which is why utilization for background operations is dispersed over 24 hours from the time they completed. A light blue line in the details chart, displayed in the previous image, reveals the overall background utilization value changed only subtly throughout the day due. This is due to the 24-hour distribution of each background operation.

*Interactive* utilization is calculated when an operation completes. Power BI ensures no single operation will exceed your capacity; if an interactive operation's utilization is high enough to do so, its cost is spread over the following minutes. The dark blue line in the chart shows interactive utilization throughout the day.

On the bottom right of the **Premium Gen2 Monitoring App** is a collection of summary visuals, showing peak utilization for the selected day, at what time of day the peak occurred, and how much of the peak was either interactive or background operation. The following image shows the summary visuals:

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-07.png" alt-text="Screenshot of summary data for selected day of utilization":::

### Getting more detail

To see more information on a given data point in a chart, you can **CTRL+Click** on a data point to filter the table that appears beneath it display artifacts that contributed to the capacity's utilization during that 15-minute period. The table includes the artifact (dataset, dataflow, or other item), the operation, and the user who initiated it. The following image shows the results of a **CTRL+Click**:

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-08.png" alt-text="Screenshot of table detail information for a selected period of time":::

You can use the dataset from the **Premium Gen2 Monitoring App** to build customized reports, and to connect to utilization data from other reports. The dataset is refreshed nightly.


## Use a single app for all capacities

You can create a single **Gen2 monitoring app** to monitor all of your Power BI Premium Gen2 capacities. The following steps describe how to create the app.

1. **Create a new workspace:** The new workspace will be published as an app, and include all reports to monitor your Premium Gen2 capacities. You can name the workspace however you like, but it's best to have a good descriptive name, such as *Capacity monitoring*.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-09.png" alt-text="Screenshot of creating a new workspace called capacity monitoring":::

2. Create a new app for each Premium Gen2 capacity you want to monitor, and rename each app with the name of the capacity or capacity ID, or some other naming convention that will enable you to distinguish among them. When installing more than one version of an app, choose **Install to a new workspace**, as shown in the following image.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-10.png" alt-text="Screenshot of installing app to a new workspace":::

3. Open each app that you created in the previous step, and connect each app to its corresponding Premium Gen2 capacity's data. For each app you created, provide its corresponding **Capacity ID**.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-11.png" alt-text="Screenshot of connecting each app to its corresponding capacity":::

4. Edit each app so you can save a *copy* of capacity its report. Select the **pencil** icon to edit, then select **Yes, go to workspace**.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-12.png" alt-text="Editing a workspace":::

    Choose the **more** menu beside the name, and select **Save a copy**.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-13.png" alt-text="Screenshot of copying a report":::    
    
    When you select the destination workspace to which you want to save the copy of the report, select the workspace you created in **Step 1** as its destination. You should also rename the report appropriately, to identify the specific Premium Gen2 capacity to which the report belongs.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-14.png" alt-text="Screenshot of saving a copy of the report":::

5. Next, publish the workspace you created in **Step 1** as an app. In this example, we are publishing two Premium Gen2 capacity reports to our unified workspace and app. You’ll need to provide a description for the app. First, select **Create app** from the upper-right corner.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-15.png" alt-text="Screenshot of creating a new app":::

    Then select **Publish** from the dialog that appears.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-16.png" alt-text="Screenshot of selecting publish from the dialog":::

6. Once the app is published, you can go directly to the app, or copy the link.

    :::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-17.png" alt-text="Screenshot of published app link":::

When completed, you'll see each of the reports you copied in the workspace app you created. In this example, we created two apps, copied them into the new workspace we created in **Step 1**, and now we have a unified app that shows both workspace monitoring reports, all in a single report.

:::image type="content" source="media/service-premium-gen2-metrics-app/premium-gen2-metrics-app-18.png" alt-text="Screenshot of unified capacity app":::

And that's it, you now have a unified app to monitor your Premium Gen2 capacities.

For additional information about sharing the app, or considerations and limitations, check the following articles:

* [Copy reports from other workspaces](../connect-data/service-datasets-copy-reports.md)
* [Intro to datasets across workspaces](../connect-data/service-datasets-across-workspaces.md)

## Next steps

* [What is Power BI Premium?](service-premium-what-is.md)
* [Power BI Premium FAQ](service-premium-faq.yml)
* [Power BI Premium Per User FAQ (preview)](service-premium-per-user-faq.yml)

