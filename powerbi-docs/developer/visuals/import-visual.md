---
title: Import Power BI visuals from AppSource or from a file
description: Learn how you can download a custom visual from AppSource, Partner Center, or elsewhere and import it into Power BI with this tutorial. 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/2/2022
---

# Import a Power BI visual from AppSource into your workspace

Power BI comes with many out-of-the-box visuals that are available in the **Visualizations** pane of both [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and [Power BI Service](https://app.powerbi.com).

Many more certified Power BI visuals are available from [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). These visuals are created by Microsoft and Microsoft partners, and are validated by the AppSource validation team. You can [download these visuals](#import-a-power-bi-visual-directly-from-appsource) directly to your **Visualizations** pane.

You can also [develop your own Power BI visual](develop-power-bi-visuals.md), or get one from a trusted friend or coworker.

If you download or receive a Power BI visual file, you have to [import](#import-a-visual-file-from-your-local-computer-into-power-bi) it to the **Visualizations** pane before you can use it to create Power BI content.

## Import a Power BI visual directly from AppSource

1. Open your report in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) or [Power BI service](https://app.powerbi.com).
2. Select the ellipsis from the **Visualizations** pane.

   :::image type="content" source="media/import-visual/ellipsis.png" alt-text="Screenshot of the Power BI Visualizations Pane, which shows the ellipses icon is highlighted.":::

3. Select **Get more visuals** from the menu.

   :::image type="content" source="media/import-visual/get-visuals.png" alt-text="Screenshot of the Power BI Visualizations Pane, which shows the Get more visuals option is highlighted.":::

4. Select **AppSource visuals** and choose the visual you want to import.

   :::image type="content" source="media/import-visual/select-visual.png" alt-text="Screenshot of the Power BI visuals dialog, which shows the visuals available for import and the highlighted AppSource visuals option.":::

5. Select **Add** to add the visual to your report.

   :::image type="content" source="media/import-visual/add-download-sample.png" alt-text="Screenshot of the Power BI visual description dialog, which shows the Add and Download Sample buttons are highlighted.":::

    > [!TIP]
    > Select **Download Sample** to download a sample Power BI dataset and report created by the visual publisher. The sample report demonstrates what the visual looks like and how it can be used. It can also include useful comments, tips, and tricks from the publisher.
  
6. When the visual is successfully imported, select **OK**.

   :::image type="content" source="media/import-visual/success.png" alt-text="Screenshot of the Power BI successful import dialog box.":::

7. The visual now appears as a new icon in the visualizations pane of the current report. Select the visual's icon to create the visual on the report canvas.

   :::image type="content" source="media/import-visual/new-visualization.png" alt-text="Screenshot of the Power BI Visualizations pane, which shows the new imported visuals.":::

8. If you want the visual to remain on the **Visualizations** pane so you can use it in future reports, right-click the visual's icon and select **Pin to visualization pane**.
  
## Import a visual file from your local computer into Power BI

Power BI visuals are packaged as *.pbiviz* files that can be stored on your computer. You can share these files with other Power BI users. You can download visual files from AppSource onto your computer, but you can also get custom visuals from a trusted friend or colleague. Custom visuals that come from sources other than official Microsoft sources should be imported only if you trust the source.

1. Open your report in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) or [Power BI service](https://app.powerbi.com).
2. Select the ellipsis from the visualizations pane.

   :::image type="content" source="media/import-visual/ellipsis.png" alt-text="Screenshot of the Power BI Visualizations Pane, which shows the ellipses icon is highlighted.":::

3. Select **Import a visual from a file** from the menu.

   :::image type="content" source="media/import-visual/import-from-file.png" alt-text="Screenshot of the Power BI Visualizations Pane, which shows the Import a visual from a file option is highlighted.":::

4. If you get a message cautioning you about importing custom files, select **Import** if you trust the source of the file.

   :::image type="content" source="media/import-visual/caution.png" alt-text="Screenshot of the Power BI caution: import custom visual dialog box.":::
  
5. Navigate to the folder that has the custom visual file (*.pbiviz*) and open it.
6. When the visual has successfully imported, select **OK**.

   :::image type="content" source="media/import-visual/success.png" alt-text="Screenshot of the Power BI successful import dialog box.":::

7. The visual now appears as a new icon in the visualizations pane of the current report. Select the new visual icon to create the visual on the report canvas.

   :::image type="content" source="media/import-visual/new-visualization.png" alt-text="Screenshot of the Power BI Visualizations pane, which shows the new imported visuals.":::

8. If you want the visual to remain on the **Visualizations** pane so you can use it in future reports, right-click the visual's icon and select **Pin to visualization pane**.

## Next steps

>[!div class="nextstepaction"]
>[Developing a Power BI circle card visual](develop-circle-card.md)

>[!div class="nextstepaction"]
>[Visualizations in Power BI](../../visuals/power-bi-report-visualizations.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
