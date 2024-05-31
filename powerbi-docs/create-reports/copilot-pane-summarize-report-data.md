---
title: Ask Copilot questions about data in the model (preview) 
description: Copilot can create a summary of the data in your report for you in the Copilot pane.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 05/22/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
---

# Ask Copilot questions about data in the model (preview)

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

 The Copilot pane in Power BI offers new capabilities in public preview in view and edit modes. You can ask Power BI Copilot questions about the data in your model. You could already ask questions about the data present in the visuals on your report pages. Now you can get answers directly from the underlying model. Just ask questions about your data, and if the answer isn't already on your report, Copilot queries your model for the data instead and returns the answer in the form of a visual. You can ask Copilot for summaries, insights, and answers from your report content.

:::image type="content" source="media/copilot-pane-summarize-report-data/copilot-show-interesting-customer-segments.png" alt-text="Screenshot of Power BI Copilot pane open and showing interesting customer information on report page." lightbox="media/copilot-pane-summarize-report-data/copilot-show-interesting-customer-segments.png":::

## Copilot in view mode

In view mode, Copilot can act as a knowledgeable assistant as you navigate through your Power BI report. Copilot can generate summaries of your report content with a few clicks. Copilot streamlines the process of manual analysis, delivering concise overviews that illuminate key trends, patterns, and insights across your visuals. Copilot can create an overview of your report page, and you can ask questions about the data visualized on the page, improving your data exploration experience and empowering you to dig deeper. This capability elevates a typical viewing experience to an analysis experience.

> [!NOTE]
> This capability is also available in edit mode.

## Customized guidance at your fingertips 

Copilot doesn't just provide overviews and insights of report content. With customized requests, Copilot tailors its assistance to your specific needs, guiding you through the exploration process. Whether you're unsure where to begin or you're seeking deeper insights, Copilot can lend a helping hand.  You can start with the out-of-box prompts like:

- Create a bulleted list of insights.
- Summarize visuals on this page.
- Give an executive summary of this report.
 
:::image type="content" source="media/copilot-pane-summarize-report-data/copilot-summarize-visuals-page.png" alt-text="Screenshot of Power BI Copilot pane open and showing summary for visuals on report page." lightbox="media/copilot-pane-summarize-report-data/copilot-summarize-visuals-page.png":::

Or you can dig deeper for more nuanced exploration into key slices of your data with custom requests that deliver tailored insights and answers.  Here are some examples of custom requests to get you started. Keep in mind, the requests are specific to the data in the report you're viewing:

- What are some key sales insights on this page?
- What are some interesting customer segments?
- What is the relationship between product type and revenue?

:::image type="content" source="media/copilot-pane-summarize-report-data/copilot-show-interesting-customer-segments.png" alt-text="Screenshot of Power BI Copilot pane showing customer segments." lightbox="media/copilot-pane-summarize-report-data/copilot-show-interesting-customer-segments.png":::

Copilot scans the report page visuals and answers your request in natural language, making analysis of the report easy.  From uncovering insights to highlighting key sales metrics, your Copilot prompts pave the way for data discovery. Then you can copy and paste the Copilot responses into emails, PowerPoint slides, or Teams threads to keep everyone up to date.

:::image type="content" source="media/copilot-pane-summarize-report-data/copilot-interesting-customer-segments.png" alt-text="Screenshot of Power BI Copilot pane explaining the report data." lightbox="media/copilot-pane-summarize-report-data/copilot-interesting-customer-segments.png":::


## Unleash the power of questions 

Another aspect of Copilot's consumption mode is its ability to respond to your questions in real time. Need to know which team dominated in sales or which product boasted the highest profit margin? Ask, and Copilot provides you with a tailored, simple response. What sets Copilot apart is that it shows you the specific visuals within your report it used to answer your question, making it easier to understand the underlying data driving each insight and answer. Here are some real examples: 

- What is the highest grossing product?
- What were the total sales in 2021?
- What is the average length of stay?
- Copilot pane answering a data question

:::image type="content" source="media/copilot-pane-summarize-report-data/copilot-show-relevant-visual.png" alt-text="Screenshot of Power BI Copilot pane highlighting relevant visual." lightbox="media/copilot-pane-summarize-report-data/copilot-show-relevant-visual.png":::

## Empower data exploration 

In a world overflowing with data, the ability to extract meaningful insights is invaluable. Copilot aided exploration empowers users to be in charge of your data, providing you with the tools they need to more quickly understand your reports, and answer your questions promptly. Whether you're a seasoned analyst or a beginning explorer, Copilot's intuitive nature makes data exploration a breeze.  For more details on this feature, see our documentation. To see our other Copilot capabilities like Copilot report page creation (available in edit mode), go here. 

 

## Limitations and considerations

- Copilot in Microsoft Fabric isn't supported on trial SKUs. Only paid SKUs (F64 or higher, or P1 or higher) are supported. 
- Your administrator needs to enable the tenant switch before you start using Copilot. See the article [Copilot tenant settings](/fabric/admin/service-admin-portal-copilot) for details.
- Your F64 or P1 capacity needs to be in one of the regions listed in this article, [Fabric region availability](/fabric/admin/region-availability). If it isn't, you can't use Copilot.  
- These capabilities are also available in edit mode, and in Desktop.
- Fabric Copilot experiences in Power BI are preview experiences.  This experience is in public preview.
- Updates are being made continually, so expect improvements.
- Copilot responses are generated with AI and can make mistakes. Always check your work.

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Next steps

- [Overview of Copilot for Power BI](copilot-introduction.md)
- [Create a report with Copilot for Power BI](copilot-create-report-service.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
