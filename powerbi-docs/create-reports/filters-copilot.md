---
title: Interact with filters in Copilot for Power BI 
description: Read about how you can use Power BI to set, clear, and delete filters.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: shlindsay
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 10/03/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
---
# Interact with filters in Copilot for Power BI 

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

You can use Copilot in Power BI to set, clear, and delete filters. Given a Power BI report populated with visuals, now with Power BI Copilot you can interact with your filters and slicers on the report. With a Power BI report populated with visuals, you can now interact with your filters and slicers using Power BI Copilot. New users often find it unfamiliar to interact with filters on the filter pane or slicers. At the same time, they find it useful to ask Copilot for help with managing the existing filters in the report. You can now apply, remove, append, and clear filters by creating a prompt in the Copilot chat pane. 

copilot-clear-filters.png

Copilot is turned on by default in Fabric. Administrators can turn off Copilot in the Fabric admin portal if your organization isn't ready to use it. For details on turning Copilot on and off, see [Enable Fabric Copilot for Power BI](/fabric/get-started/copilot-enable-fabric).

> [!NOTE]
>
> - Your administrator needs to enable Copilot in Microsoft Fabric.
> - Your F64 of P1 capacity needs to be in one of the regions listed in this article, Fabric regions availability. If it isn't, you can't use Copilot.
You administrator needs to enable the tenant switch before you start using Copilot. See the article Copilot tenant settings for details.
> - If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the Data sent to Azure Open AI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance tenant setting in the Fabric Admin portal.
> - Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F76 or higher, or P1 or higher) are supported.

## Get started with standard filter prompts

To get started, select the **Copilot** button in the ribbon in the Power BI service. In the service, the button is available in both edit mode and view mode.

copilot-filters-copilot-icon.png A screenshot of a computer

Once the copilot pane is open, make sure that there are existing slicers and filters on the report. For now, Copilot is only able to interact with existing filters on the report. It can't create new filters.  

You can ask copilot to interact with your filters as the examples below: 

### Examples of filters

- “Filter by Canada” 
- “Show the sales region as Europe” 
- “Change sales region to North America” 
- “Can you adjust the visuals to reflect Australia only for 2022” 

### Supported filters

These are the filters supported: 

- Slicers 
- Visual-level filters 
- Page-level filters 
- Report-level filters 

### Supported filter types

These filter types are supported:

- Basic filters (Multi-selection) 
- Relative date 
- Relative time 
- Measure filters 
- Top N filters 
- Contains 
- Does not contain  
- Starts with group 
- Does not start with 
- Is less than 
- Is less than or equal to 
- Is greater than  
- Is empty 
- Is not blank 
- Is not empty 

## Apply a filter 

You can ask Power BI Copilot to apply an existing filter or slicer for the report. Once you complete the prompt, the filter or slicer is updated on the report accordingly.

copilot-apply-filter-customer-type.png

## Remove a filter  

You can ask also Power BI Copilot to remove filters that are already applied.

If you have filters that are already applied on the report and you want to add other filters on top of that you can do it, by appending the extra filter and referring that to the Copilot.

copilot-remove-filters-status.png

## Clear filters 

Power BI Copilot can help you to remove filters the same way that the current clear capability helps you to clear all the filters in a filter card or slicer.  

## Interact with multiple filters at the same time 

If you have multiple filters that you interact at the same time, you can currently  

## Interact with filters for a specific visual 

You can interact with filters for a specific visual.

## Limitations and considerations 

Currently the following capabilities aren't supported in Power BI Desktop.

- You can't create filters that don't exist in the report.
- Filter interactions
- For the Copilot button to be available in a report, the report needs to be in: 

  - An eligible workspace: The workspace needs to have a paid dedicated capacity. The workspace needs to be a paid Premium or F64 or higher. 
  - A tenant where the admin setting is enabled. 

## Send feedback  

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.
 
## Next steps

- [Enable Copilot in Power BI](/fabric/get-started/copilot-enable-fabric)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot in the Power BI service](copilot-create-report-service.md)
- [Create a report with Copilot in Power BI Desktop](copilot-create-desktop-report.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
