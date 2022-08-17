---
title: Import Power BI visuals from AppSource or from a file
description: Learn how you can download a custom visual from AppSource, Partner Center, or elsewhere. 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 05/08/2022
---

# Import a Power BI visual from Appsource into your workspace

Power BI comes with many out-of-the-box visuals that are available in the visualization pane of both [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and [Power BI service](https://app.powerbi.com).

Many more certified Power BI visuals are available from the Microsoft [AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals). These visuals are created by Microsoft and Microsoft partners, and are validated by the AppSource validation team. You can [download these visuals](#import-a-power-bi-visual-directly-from-appsource) directly to your visualization pane.

You can also [develop your own Power BI visual](develop-power-bi-visuals.md), or get one from a trusted friend or coworker.

If you download or receive a Power BI visual file, you have to [upload](#import-a-visual-file-from-your-local-computer-into-power-bi) it to the visualization pane before you can use it to create Power BI content.

## Import a Power BI visual directly from AppSource

To import a Power BI visual directly from AppSource:

1. Open your report in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) or [Power BI service](https://app.powerbi.com).
2. Select the ellipsis from the visualizations pane.

   :::image type="content" source="media/import-visual/ellipsis.png" alt-text="Screenshot of visualization pane ellipsis.":::

3. Select **Get more visuals** from the menu.

   :::image type="content" source="media/import-visual/get-visuals.png" alt-text="Screenshot of get more visuals.":::

4. Select *AppSource visuals* and select on the visual you want to import.

   :::image type="content" source="media/import-visual/select-visual.png" alt-text="Screenshot showing visuals available for import.":::

5. Select **Add** to add the visual to your report.

   :::image type="content" source="media/import-visual/add-download-sample.png" alt-text="Screenshot of visual description and download link.":::

    > [!TIP]
    > Click on **Download Sample** to download a sample Power BI dataset and report created by the visual publisher. The sample report demonstrates what the visual looks like and how it can be used. It can also include useful comments, tips, and tricks from the publisher.
  
6. When the visual has successfully imported, select **OK**.

   :::image type="content" source="media/import-visual/success.png" alt-text="Screenshot of successful import.":::

7. The visual now appears as a new icon in the visualizations pane of the current report. Select it to create the visual on the report canvas.

   :::image type="content" source="media/import-visual/new-visualization.png" alt-text="Screenshot of new imported visualization pane.":::

8. If you want the visual to remain on the visualization pane for all reports right-click on it and select **Pin to visualization pane**.
  
## Import a visual file from your local computer into Power BI

Power BI visuals are packaged as *.pbiviz* files that can be stored on your computer. These files can be shared with other Power BI users. Visual files can be downloaded from Appsource onto your computer, but you can also get custom visuals from a trusted friend or colleague. Custom visuals that come from sources other than official Microsoft sources should be imported only if you trust the source.

 To import a Power BI visual (`.pbiviz` file) that has been downloaded to your local computer:

1. Open your report in [Power BI Desktop](https://powerbi.microsoft.com/desktop/) or [Power BI service](https://app.powerbi.com).
2. Select the ellipsis from the visualizations pane.

   :::image type="content" source="media/import-visual/ellipsis.png" alt-text="Screenshot of visualization pane ellipsis.":::

3. Select **Import a  visual from a file** from the menu.

   :::image type="content" source="media/import-visual/import-from-file.png" alt-text="Screenshot of import from a file.":::

4. If you get a message cautioning you about importing custom files, select **Import** if you trust the source of the file.

   :::image type="content" source="media/import-visual/caution.png" alt-text="Screenshot of caution: import custom visual.":::
  
5. Navigate to the folder that has the custom visual file (*.pbiviz) and open it.
6. When the visual has successfully imported, select **OK**.

   :::image type="content" source="media/import-visual/success.png" alt-text="Screenshot of successful import.":::

7. The visual now appears as a new icon in the visualizations pane of the current report. Select it to create the visual on the report canvas.

   :::image type="content" source="media/import-visual/new-visualization.png" alt-text="Screenshot of new imported visualization pane.":::

8. If you want the visual to remain on the visualization pane so you can use it in future reports, right-click on it and select **Pin to visualization pane**.

## Next steps

>[!div class="nextstepaction"]
>[Developing a Power BI circle card visual](develop-circle-card.md)

>[!div class="nextstepaction"]
>[Visualizations in Power BI](../../visuals/power-bi-report-visualizations.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
