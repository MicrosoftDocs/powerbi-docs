---
title: Power BI Desktop Developer Mode - TMDL Folder Structure 
description: Learn about folder structure for Power BI Desktop Developer Mode TMDL files. 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 01/03/2024
---

# Power BI Desktop Developer mode (Preview)

## Overview

The preferred semantic model file format of Power BI Project files is Tabular Model Definition Language (TMDL). TMDL has several advantages over the previous format, Tabular Model Scripting Language (TMSL), including:

* Source control and co-development-friendly experience
* Easy to read and edit in any text editor

By default, TMDL uses a folder structure, a more suitable format for source control and collaboration.

Learn more about TMDL here at [Tabular Model Definition Language (TMDL)](/analysis-services/tmdl/tmdl-overview).

## Enable Preview feature

Saving as a Power BI Project using TMDL is currently in preview. Before using it, you must first enable it in Preview features:

Go to **File > Options and settings > Options > Preview features** and check the box next to **Store semantic model using TMDL format**.

:::image type="content" source="./media/projects-tmdl-folder/preview-features.png" alt-text="Screenshot of checklist of preview features.":::

## Save as a Power BI project file using TMDL

With the TMDL Preview feature enabled, when you save a project, your semantic model is saved as a TMDL folder named *\definition* inside of [semantic model folder](./projects-dataset.md):  

:::image type="content" source="./media/projects-tmdl-folder/semantic-model-folder.png" alt-text="Screenshot of the definition folder inside a semantic model folder.":::

Learn more about the [TMDL folder structure](/analysis-services/tmdl/tmdl-overview#tmdl-folder-structure).

## Convert existing PBIP from TMSL to TMDL

If you already have a PBIP using TMSL as semantic model format, you can convert it to TMDL as follows: 

1. Open the PBIP in Power BI Desktop.
1. Ensure the Preview Feature is enabled.
1. **Save** the project. A prompt appears asking you to upgrade into TMDL.
1. Select **Upgrade**.

:::image type="content" source="./media/projects-tmdl-folder/upgrade-project.png" alt-text="Screenshot of prompt to upgrade semantic model folder to TMDL.":::

The existing Tabular Model Scripting Language (TMSL) file (*model.bim*) is replaced with a *\definition* folder containing the TMDL representation of the semantic model.

:::image type="content" source="./media/projects-tmdl-folder/tmsl-to-tmdl-folders.png" alt-text="Screenshot of PBIP projects with TMSL folders and with TMDL folders.":::

If you select to **Keep current** format, Desktop won't prompt again to upgrade.

## Make external changes to TMDL files

For a better experience reading and editing your TMDL files, install the [TMDL - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=analysis-services.TMDL) Microsoft VS Code extension.

Open the PBIP folder using VS Code and navigate to semantic model definition folder.

:::image type="content" source="./media/projects-tmdl-folder/semantic-model-definition-folder.png" alt-text="Screenshot of a semantic model definition folder in VS Code.":::

Power BI Desktop isn't aware of changes to project files made by other tools. Therefore, if you make any changes to open files outside of Power BI Desktop, you need to restart for those changes to be shown in Power BI Desktop.

### TMDL Errors

If any invalid edits are made to the TMDL files, Power BI Desktop throws an error on open, with the location of the error:

:::image type="content" source="./media/projects-tmdl-folder/edit-error.png" alt-text="Screenshot of an error message for an invalid file.":::

## Limitations / Known Issues 

TBD 
