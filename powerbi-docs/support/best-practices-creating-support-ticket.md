---
title: Power BI support ticket best practices
description: "Learn best practices for Power BI support tickets: key information to include, troubleshooting tips, and data to expedite resolution. Create effective tickets."
author: JulCsc
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 10/01/2025
ai-usage: ai-assisted
---

# Best practices when creating a support ticket

Creating an effective Power BI or Fabric support ticket requires providing specific information to help Microsoft troubleshoot your issue quickly. This article provides best practices and key information to include when submitting support requests, helping you get faster resolution. The specific information needed depends on your issue, and not all tips apply to every case.

## Information to provide to Microsoft

Depending on your specific issue, you might be asked to provide the following information.

1. The URL for the browser page where you're experiencing the issue.
    The URL provides information about where (workspace) you experience the issue and the item or feature type and ID.
1. Location of issue (Power BI Desktop/ Power BI service/ both)
    This information is always relevant for a service request. If a process fails on the Power BI service but succeeds on Desktop, or vice versa, this information provides useful information to Microsoft as to the possible cause of the issue. Another example would be where the same M code works in a dataset but fails in a dataflow. Beyond these two examples, there are many scenarios where it's possible to troubleshoot the issue by identifying exactly where it occurs and where it doesn't.
1. Error codes

    If an error code is generated when something goes wrong, make a copy of that error code. Microsoft saves detailed information about all error codes and uses this information to diagnose your issue. The error code is unlikely to resolve the issue on its own, but it significantly speeds up the troubleshooting process.

    > [!TIP]
    > Use the **Copy** button to retrieve the code. Don't send a screenshot. Error codes are long (typically 30 characters long), and manually transcribing from a screenshot increases the possibility of getting it wrong.

1. Data sources and storage mode being used
    Data source information is always relevant for a service request. Each data source has certain issues only relevant to itself. Where multiple sources are used, use trial and error to identify which sources are contributing to the issue.

    Power BI also behaves differently when different storage modes are used. The three main storage mode options are:
    - [Import](../connect-data/service-dataset-modes-understand.md#import-mode)
    - [Direct Query](../connect-data/service-dataset-modes-understand.md#directquery-mode)
    - [Live connection](../connect-data/service-live-connect-dq-datasets.md)

    There are also two special cases:
    - [Mixed modes storage (composite models)](../transform-model/desktop-composite-models.md)
    - [Direct Query for PBI Datasets and Analysis Services](../connect-data/desktop-directquery-datasets-azure-analysis-services.md)

    To identify data sources being used in the Power BI Desktop, select **Data source settings** > **Data sources** in the current file. In the Power BI service, navigate to the settings page under Data source credentials or via the lineage view. You can access this information by selecting '**View lineage**' or changing the workspace view from list to lineage.

   > [!TIP]
   > To understand the storage mode being used, contact the report developer or review the PBIX file.

1. Capacity ID

     The capacity ID lets Microsoft know the type of capacity being used (for example, Premium). Only the Capacity administrator can look up the capacity ID. If you're the capacity admin, open the Admin portal and select **Capacity settings** > **Power BI Premium** and select the name of the capacity. The capacity ID is the last part of the URL.

    `https://app.powerbi.com/admin-portal/capacities/`**XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX**

    Alternatively, the Capacity administrator can use this [REST API](/rest/api/power-bi/capacities/get-capacities) to retrieve the capacity ID.

1. Dataset ID

    If your issue impacts a dataset, the ID helps Microsoft identify the correct dataset and then investigate the processes running on that dataset. To find the dataset ID, navigate to the workspace that contains the dataset and open the **Dataset settings**. The dataset ID is the last part of the URL (datasets/dataset-id).

    `https://app.powerbi.com/groups/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/settings/datasets/`**XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX**

1. A copy of the PBIX file (import queries only)

    When experiencing an issue with an import model, having the PBIX file helps the support engineer reproduce the issue and expedite the troubleshooting. If the PBIX contains confidential information, be sure to share an anonymized version.

    > [!IMPORTANT]
    > Be sure to confirm with the relevant parties within your organization before sharing potentially confidential information.

1. Gateway logs

    Gateways logs are required when troubleshooting any Gateway or network issue. To analyze the gateway performance yourself, use the [Gateway performance monitoring template](../data-integration/gateway/service-gateway-performance). For more information, see [export logs for a support ticket](../connect-data/service-gateway-onprem-tshoot.md#export-logs-for-a-support-ticket).

1. Diagnostic information

    Follow the steps in [Power BI Desktop diagnostics collection](../fundamentals/desktop-diagnostics.md) to view and collect diagnostic information.

1. Dataflow JSON

    This option is useful when a dataflow is in use. To export the JSON and share it with your support engineer, go to the workspace, select the dataflow item, and choose **Export.json**.

    :::image type="content" source="media/service-support-options/export-json.png" alt-text="Screenshot of export JSON option for a dataflow.":::

## Frequently asked questions

Beyond the standard information described earlier, the following information helps your support engineer troubleshoot your issue.

### Does the issue only occur in a certain capacity?

Does switching to another capacity or shared capacity resolve the issue? Sometimes issues are specific to certain environments.

### Does the issue impact all users?

Is the issue company-wide, impacting only a set number of people, or only one individual?

### Is this a new issue for something that was previously working?

Did the error begin without any changes being made on the user side, or was it triggered by some kind of change or a new implementation? Identifying the break point helps narrow down the potential root cause.

### Is the issue narrower or wider than initially experienced?

Is the issue impacting all, some, or just one "thing"? For instance, if the issue relates to APIs, are other APIs working? If it's an export issue, are all reports impacted? If it's a capacity issue, are all capacities behaving the same way? If a report isn't refreshing and it contains multiple data sources, has each source been tested separately?

### Have you already attempted troubleshooting steps?

This information speeds up resolution of your issue by avoiding repetition. However, in certain circumstances, your support engineer might still want to repeat the steps you took.

### Can you replicate the issue in a simpler form?

Sometimes you can't share confidential information with Microsoft. Try to replicate the issue by using a simplified version of the issue and provide reliable repro steps to your support engineer.
