---
title: Package a Power BI visual
description: Learn how to enter property values, update an icon, and package a Power BI visual so it can be shared and imported by other users.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 06/03/2024
#customer intent: As a Power BI visual developer, I want to learn how to package a Power BI visual so that I can share it with others.
---

# Package a Power BI visual

Before you can load your custom visual into [Power BI Desktop](https://powerbi.microsoft.com/desktop/) or share it with the community in the [Power BI Visual Gallery](https://visuals.powerbi.com/), you need to package it. Using this tutorial, you will:

* [Provide property values](#enter-property-values) and metadata for the visual.
* [Update the icon](#update-the-icon-optional).
* [Package](#package-the-visual) the custom visual.

## Enter property values

1. In **PowerShell**, stop the visual if it's running.
2. In **VS Code**, navigate to the root folder of your visual project and open the *pbiviz.json* file.

3. In the `visual` object, set the `displayName` value to what you want to be your visual's display name.

    :::image type="content" source="media/custom-visual-develop-tutorial-format-options/display-name-viz.png" alt-text="Screenshot of VS Code, which shows the display name value is set to Circle Card.":::

    The visual's display name appears in the **Visualizations** pane of Power BI when you hover the cursor over the visual icon.

4. Fill in or modify the following fields in the *pbiviz.json* file:
    * `visualClassName`
    * `description`

    `visualClassName` is optional, but `description` must be filled in for the package command to run.

5. Fill in `supportUrl` and `gitHubUrl` with the URLs that a user can visit to get support and view your visual's GitHub project.

    The following code shows `supportUrl` and `gitHubUrl` examples:

    ```json
    {
        "supportUrl": "https://community.powerbi.com",
        "gitHubUrl": "https://github.com/microsoft/PowerBI-visuals-circlecard"
    }
    ```

6. Enter your name and email in the `author` object.

7. Save the *pbiviz.json* file.

## Update the icon (optional)

1. In the *pbiviz.json* file, notice that the document defines a path to an icon in the `assets` object. The icon is the image that appears in the **Visualizations** pane in Power BI. It must be a PNG format file and 20 x 20 pixels.

2. In **Windows Explorer**, copy the *icon.png* file you want to use, and then paste it to replace the default *icon.png* file located in the *assets* folder.

3. In **VS Code**, in the Explorer pane, expand the *assets* folder, and then select the *icon.png* file.

4. Review the icon.

    :::image type="icon" source="media/package-visual/viz-pane-image.png":::

## Package the visual

1. In **VS Code**, ensure that all files are saved.

2. In **PowerShell**, enter the following command to generate a *pbiviz* file:

    ```powershell
    pbiviz package
    ```

    This command creates a *pbiviz* file in the */dist/* directory of your visual project, and overwrites any previous *pbiviz* file that might exist.

    :::image type="content" source="media/package-visual/dist-folder.png" alt-text="Screenshot of Windows Explorer, which shows the folder hierarchy of the Power BI visual project. The dist folder is highlighted.":::

The package outputs to the */dist/* folder of the project. The package contains everything required to import the custom visual into either the Power BI service or a Power BI Desktop report. You packaged the custom visual, and it's ready for use.

## Related content

* [Publish Power BI visuals to Partner Center](office-store.md)
* [Import a custom visual](import-visual.md)
