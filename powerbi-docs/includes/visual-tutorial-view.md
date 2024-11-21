---
title: View your Power BI visual in Power BI service
description: Learn how to view your Power BI visual in Power BI service
services: powerbi
author: mberdugo
ms.author: monaberdugo
ms.topic: include
ms.date: 11/20/2024
ms.custom: include file
---

To test the visual in Power BI service, we'll use the **US Sales Analysis** report. You can [download](https://microsoft.github.io/PowerBI-visuals/docs/step-by-step-lab/images/US_Sales_Analysis.pbix) this report and upload it to Power BI service.

You can also use your own report to test the visual.

>[!NOTE]
>Before you continue, verify that you [enabled the visuals developer mode](../developer/visuals/environment-setup.md#enable-developer-mode).

1. Sign in to [PowerBI.com](https://powerbi.microsoft.com/) and open the **US Sales Analysis** report.

2. Select **Edit**.

    :::image type="content" source="media/visual-tutorial-view/edit-report.png" alt-text="Screenshot of the edit option in Power BI service.":::

3. Create a new page for testing, by clicking on the **New page** button at the bottom of the Power BI service interface.

    :::image type="content" source="media/visual-tutorial-view/new-page.png" alt-text="Screenshot of the new page button in Power BI service.":::

4. From the **Visualizations** pane, select the **Developer Visual**.

    :::image type="content" source="media/visual-tutorial-view/developer-visual.png" alt-text="Screenshot of the developer visual in the visualizations pane.":::

    This visual represents the custom visual that you're running on your computer. It's only available when the [custom visual debugging](../developer/visuals/environment-setup.md#enable-developer-mode) setting is enabled.

5. Verify that a visual was added to the report canvas.

    :::image type="content" source="media/visual-tutorial-view/new-visual.png" alt-text="Screenshot of the new visual added to the report.":::

    This is a simple visual that displays the number of times its update method has been called. At this stage, the visual does not retrieve any data.

    >[!NOTE]
    >If the visual displays a connection error message, open a new tab in your browser, navigate to `https://localhost:8080/assets`, and authorize your browser to use this address.
    >
    >:::image type="content" source="media/visual-tutorial-view/connection-error.png" alt-text="Screenshot of the new visual displaying a connection error.":::

6. While the new visual is selected, go to the **Data** pane, expand **Sales**, and select **Quantity**.

    :::image type="content" source="media/visual-tutorial-view/data-sales-quantity.png" alt-text="Screenshot of the Power BI service quantity field in the sales table in the US sales analysis report.":::

7. To test how the visual is responding, resize it and notice that the *Update count* value increments every time you resize the visual.

    :::image type="content" source="media/visual-tutorial-view/resized-visual.png" alt-text="Screenshot of the new visual displaying a different update count number, after being resized.":::