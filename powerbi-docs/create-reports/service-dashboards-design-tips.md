---
title: Tips for designing a great Power BI dashboard
description: Learn how to design an effective Power BI dashboard to make the most important information stand out.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 11/23/2022
LocalizationGroup: Dashboards
---
# Tips for designing a great Power BI dashboard

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

After you've created a dashboard and added some tiles, think about how to make your dashboard both visually interesting and functional. In general, you want the most important information to stand out and be clean and uncluttered.

![Screenshot of the Sales and Marketing Sample dashboard.](media/service-dashboards-design-tips/power-bi-marketing-sample-dashboard.png)

> [!TIP]
> Like this dashboard? You can download it and related reports from AppSource. Go to **Get data** > **Services**. Search for **Microsoft Sample - Sales & Marketing** > **Get it now**.

## Dashboard design best practices video

Watch [Dashboard design best practices in Power BI](https://www.youtube.com/watch?v=-tdkUYrzrio) for design tips from Marco Russo of SQLBI.com.

## Consider your audience
When optimizing your dashboard's appearance for your audience, consider the following:

- How do they use the dashboard?
- What key metrics help them make decisions?
- What learned or cultural assumptions might affect design choices?
- What information does your audience need to be successful?

Keep in mind that the dashboard is an overview, a single place to monitor the current state of the data. The dashboard is based on underlying reports and datasets, and those items often contain many details. Your readers can drill into the reports from your dashboard, so don't put a detail on the dashboard unless that's what your readers need to monitor.

Where is the dashboard going to be displayed? If it's on a large monitor, you can put more content on it. However, if readers view it on their tablets, a dashboard with fewer tiles is more readable.

## Tell a story on one screen
Because dashboards are meant to show important information at a glance, having all the tiles on one screen is best.

- Can you avoid scroll bars on your dashboard?
- Is the dashboard too cluttered? Remove all but essential information.

## Make use of full-screen mode
When presenting a dashboard, display it in [full-screen mode](../consumer/end-user-focus.md), without distractions.

## Accent the most important information
If the text and visualizations on a dashboard are all the same size, readers have difficulty focusing on what's most important. For example, card visualizations are a good way to display an important number prominently:  
![Screenshot of an example Card visualization.](media/service-dashboards-design-tips/pbi_card.png)

Be sure to provide context for your visualization.  

Read about [creating a tile with just a number](../visuals/power-bi-visualization-card.md).

## Place the most important information
Most people read from top to bottom. Put the highest level of data at the top left corner, and show more detail as you move in the direction the audience uses for reading (left-to-right, top-to-bottom).

## Use the right visualization for the data
Avoid visualization variety for the sake of variety. Visualizations should paint a picture and be easy to read and interpret. For some data and visualizations, a simple graphic visualization is enough. Other data might need a more complex visualization. Use titles, labels, and other customization to help the reader.  

* Be careful when you use visuals that are hard to read, such as 3D charts.
* Pie charts, donut charts, gauges, and other circular chart types aren't ideal data visualizations. Because humans can't compare values side by side, it’s harder to compare values in a pie chart than in bar and column charts. Pie charts are best if they have fewer than eight categories. Pie charts can be good for viewing part-to-whole relationships rather than for comparing the parts. Gauge charts are great for displaying the current status in the context of a goal.
* Be consistent with chart scales on axes, chart dimension ordering. Be consistent with the colors used for dimension values within charts as well.
* Be careful encoding quantitative data. Don’t exceed three or four numerals when displaying numbers. Display measures to one or two numerals left of the decimal point and scale for thousands or millions. For example, use 3.4 million not 3,400,000.
* Don’t mix levels of precision and time. Make sure that time frames are distinct and consistent. Don’t have one chart that has last month next to filtered charts from a specific month of the year.
* Don’t mix large and small measures on the same scale, such as on a line or bar chart. For example, don't mix one measure that's in the millions with another measure that's in the thousands. With such a large scale, it's difficult to see the differences of the measure that's in the thousands. If you need to mix, choose a visualization that allows the use of a second axis.
* Don’t clutter your charts with data labels that aren't needed. The values in bar charts are usually understood without displaying the actual number.
* Pay attention to how [charts are sorted](../consumer/end-user-change-sort.md). If you want to draw attention to the highest or lowest number, sort by the measure. If you want people to quickly find a particular category within many other categories, sort by the axis.  

For more visualization-specific guidance, see [Visualization types in Power BI](../visuals/power-bi-visualization-types-for-reports-and-q-and-a.md).  

## Learn more about dashboard design
To master the art of excellent dashboard design, consider learning basic Gestalt Principles of visual perception and how to clearly communicate actionable information in context. Luckily, there are many resources already available within our blogs. A few books include:

* *Information Dashboard Design* by Stephen Few  
* *Show Me the Numbers* by Stephen Few  
* *Now You See It* by Stephen Few  
* *Envisioning Information* by Edward Tufte  
* *Advanced Presentations* by Design by Andrew Abela

## Next steps
[Create a dashboard from a report](service-dashboard-create.md)  
[Basic concepts for designers in the Power BI service](../fundamentals/service-basic-concepts.md)  
More questions? [Try the Power BI Community](https://community.powerbi.com/)
