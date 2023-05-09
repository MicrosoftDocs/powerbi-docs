---
title: Support ticket best practices
description: Best practices when creating a Power BI or Fabric support ticket 
author: mihart
ms.author: rrubinstein
ms.service: powerbi
ms.topic: troubleshooting
ms.date: 05/09/2023
---

# Best practices when creating a support ticket

The specific information Microsoft will require to troubleshoot your case depends on the issue you are experiencing. This article provides tips and best practices for gathering necessary information for support requests. ***Note, many of these won't be applicable to your*** **case**.  

## Information to provide to Microsoft

Depending on your specific issue, you may be asked to provide the following information.

1. The URL for the browser page where you're experiencing the issue.
    The URL provides information on where (workspace) you experience the issue and the item or feature type and ID.

2. Location of issue (Power BI Desktop/ Power BI service/ both)
    This information is always relevant for a service request. If a process fails on the Power BI service but succeeds on Desktop, or vice versa, this provides useful information to Microsoft as to the possible cause of the issue. Another example would be where the same M code works in a dataset but fails in a dataflow. Beyond these two examples there are many scenarios where it is possible to troubleshoot the issue by identifying exactly where it occurs and where it does not.

3. Relevant Error Codes
    Error codes are often generated when something goes wrong. These can be copied at the time of error. Whenever an issue generates an error code, Microsoft uses it to check their systems and identify potential reasons for the error. This is unlikely to resolve the issue on its own, but it significantly speeds up the troubleshooting process.

> [!Tip]
> Use the **Copy** button to retrieve the code. Don't send a screenshot. Error codes are long (typically 30 characters long), and manually transcribing from a screenshot increases the possibility of getting it wrong.  

4. Data sources and storage mode being used
    This is always useful to know. Certain issues only related to specific data sources. Where multiple sources are used it is helpful to understand if only certain sources are causing the issue through trial and error. Power BI also behaves differently when different storage modes are used. The three main storage mode options are:

-   [Import](https://learn.microsoft.com/en-us/power-bi/connect-data/service-dataset-modes-understand#import-mode)

-   [Direct Query](https://learn.microsoft.com/en-us/power-bi/connect-data/service-dataset-modes-understand#directquery-mode)

-   [Live connection](https://learn.microsoft.com/en-us/power-bi/connect-data/service-live-connect-dq-datasets)

There are also two further special cases:

- [Mixed modes storage (composite models)](/power-bi/transform-model/desktop-composite-models)
- [Direct Query for PBI Datasets and Analysis Services](/power-bi/connect-data/desktop-directquery-datasets-azure-analysis-services)

**How do I get it?**

To identify data sources being used in the PBI Desktop, press **Data source settings** > **Data sources** in the current file. 

In the Service, navigate to the artifact settings page under Data source credentials or via the lineage view. You can access this by clicking '**View lineage**' or changing the workspace view from list to lineage. 


   > [!Tip]
   >To understand the storage mode being used discuss with the report developer or review the PBIX file.

## Capacity ID

**When and why does Microsoft need it?**

If the issue is to do with Premium capacity, the support engineer will review the capacity for potential issues and gather other information.

**How do I get it?**

You will need to be a capacity admin to access this information. You can find the capacity that the workspace is assigned to in its settings. The capacity admin will need to follow the below route within the Power BI Service:

Admin Portal > Capacity Settings > Power BI Premium > [click the name of the capacity]

The capacity ID can then be found within the URL e.g.

https://app.powerbi.com/admin-portal/capacities/**XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX**

Alternatively, you can get the ID using [REST API](https://learn.microsoft.com/rest/api/power-bi/capacities/get-capacities). 

## Dataset ID

**When and why does Microsoft need it?**

If a single dataset is being impacted Microsoft can use the dataset ID to investigate further into the processes that are related to that dataset.

**How do I get it?**

To find the Dataset ID, navigate to the workspace in question and open the Dataset setting. The URL of this page (Dataset setting) will include the Dataset ID (datasets/dataset-id)

https://app.powerbi.com/groups/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/settings/datasets/**XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX**

## A copy of the PBIX file (import queries only)

**When and why does Microsoft need it?**

When experiencing an issue with an import model, having the PBIX can help the support engineer to reproduce the issue and expedite the troubleshooting. If the PBIX contains confidential information, sharing an anonymized version can help as well. 

> [!IMPORTANT]
> Be sure to confirm with the relevant parties within your organization before sharing potentially confidential information.

## Gateway logs

**When and why does Microsoft need it?**

Gateways logs are extremely helpful and required when trying to troubleshoot any Gateway or network issue. 

In addition, Microsoft make available a gateway performance template file that you can use to analyze the information yourself - [Gateway performance monitoring](https://learn.microsoft.com/data-integration/gateway/service-gateway-performance)

**How do I get it?**

Follow the instructions on this page to learn how to [export logs for a support ticket](/power-bi/connect-data/service-gateway-onprem-tshoot).

## Diagnostic Information

**When and why does Microsoft need it?**

Desktop diagnostic information can help the support engineer troubleshoot many cases. Usually, your engineer will request this when needed. 

**How do I get it?**

Follow the steps in the following documents to collect diagnostic details - [Power BI Desktop diagnostics collection](/power-bi/fundamentals/desktop-diagnostics)

## Dataflow JSON

**When and why does Microsoft need it?**

This can often be useful where a dataflow is in use.

**How do I get it?**

In the workspace, go to the Dataflow item and click on "Export.json"

![export json](media/service-support-options/export-json.png)

# Additional Considerations

Beyond the standard information mentioned above it is also useful if the issue you are experiencing can be further narrowed down. 

### Does the issue only occur in a certain premium capacity?

Does switching to another capacity or shared capacity resolve the issue?
Sometimes issues are specific to certain environments.

### Does the issue impact all users?

It is useful for the Microsoft team to understand if the issue is companywide, impacting only a set number of people, or only one individual. This can help narrow down potential causes of the issue.

### Is this a new issue for something that was previously working?

Did the error begin without any changes being made on the user side, or was it triggered by some kind of change/ a new implementation. Identifying the break point can help narrow down the potential root-cause.

### Is the issue narrower/ wider than initially experienced?

For instance, if the issue relates to APIs have other APIs been working?

If it's an export issue are all reports impacted? 

If it's a capacity issue, are all capacities acting in the same way? 

If a report isn't refreshing and it contains multiple data sources, has each source been tested separately? 

### Have any troubleshooting steps already been attempted?

Covering these can help avoid repetition when reviewing with the support engineer. However, the support engineer may want to carry out some additional checks in certain circumstances.

### Can the issue be replicated in a simpler form?

Sometimes confidential information cannot be shared with Microsoft so sharing a simplified version of the issue or providing reliable repro steps can help the troubleshooting process.


