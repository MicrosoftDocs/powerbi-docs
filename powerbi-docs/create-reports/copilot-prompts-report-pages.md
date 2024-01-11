---
title: Write Copilot prompts for creating report pages in Power BI 
description: Read about samples of prompts that help Copilot produce useful visuals in Power BI.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 11/13/2023
LocalizationGroup: Create reports
---

# Write Copilot prompts for creating report pages in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Before your business can start using Copilot capabilities in Power BI, you need to enable Copilot in Microsoft Fabric.

> [!NOTE]
>
> - Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](../admin/region-availability.md). If it isn't, you can't use Copilot.
> - Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](../admin/service-admin-portal-copilot.md) for details.
> - If your tenant or capacity is outside the US or France, Copilot is disabled by default unless your Fabric tenant admin enables the [Data sent to Azure OpenAI can be processed outside your tenant's geographic region, compliance boundary, or national cloud instance](../admin/service-admin-portal-copilot.md) tenant setting in the Fabric Admin portal.
> - Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported.

## Sample prompts for report pages

Here are some examples of prompts that work well with Copilot for Power BI. Use these prompts as examples.

Each sample prompt is paired with a report page that Copilot generated based on the interpretation of that prompt. Your prompts help Copilot understand what you're looking for, but they may not produce a page that's exactly what you want. It's a starting point for report page creation. Use the user interface to modify the report page that Copilot created. 

Also, see the [Considerations and limitations section](copilot-create-report.md#considerations-and-limitations) in the article "Create report pages with Copilot for the Power BI service."

## Sales performance by product

"Create a page to analyze the sales amount, revenue, and profit margin of different products, categories, and subcategories over time and across regions."

:::image type="content" source="media/copilot-prompts/copilot-prompt-product-analysis.png" alt-text="Screenshot showing Copilot sample prompt for sales performance." lightbox="media/copilot-prompts/copilot-prompt-product-analysis.png":::

## Customer segmentation and loyalty

"Create a page to identify and compare the characteristics, behaviors, and preferences of different customer segments based on demographic, geographic, and transactional data."

:::image type="content" source="media/copilot-prompts/copilot-prompt-customer-segmentation.png" alt-text="Screenshot showing Copilot sample prompt for Customer segmentation." lightbox="media/copilot-prompts/copilot-prompt-customer-segmentation.png":::

## Promotion effectiveness and ROI

"Create a page to evaluate the impact and return on investment of various promotions on sales, revenue, and customer acquisition and retention."

:::image type="content" source="media/copilot-prompts/copilot-prompt-promotion-analysis.png" alt-text="Screenshot showing Copilot sample prompt for Promotion effectiveness." lightbox="media/copilot-prompts/copilot-prompt-promotion-analysis.png":::

## Inventory and supply chain management

"Create a page to monitor and optimize the inventory levels, reorder points, safety stock, and product costs of different products and product lines based on demand, lead time, and manufacturing costs."

:::image type="content" source="media/copilot-prompts/copilot-prompt-inventory-optimization.png" alt-text="Screenshot showing Copilot sample prompt for Inventory and supply chain management." lightbox="media/copilot-prompts/copilot-prompt-inventory-optimization.png":::

### Create a table of contents

Now generate a table of contents across your report pages. 

"Make a table of contents for this report that contains a brief description of what each page is about." 

:::image type="content" source="media/copilot-prompts/table-contents.png" alt-text="Screenshot showing create a table of contents." lightbox="media/copilot-prompts/table-contents.png":::

## Send feedback

We always welcome your feedback about our products, but especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Create a report with Copilot for Power BI](copilot-create-report.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)