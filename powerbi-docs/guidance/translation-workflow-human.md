---
title: Enable workflows for human translation in Power BI reports
description: Learn about translations sheets, which Translations Builder uses to export and import .csv files for human translators to use to localize Power BI reports.
author: kfollis   
ms.author: kfollis
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/24/2023
---
# Enable workflows for human translation in Power BI reports

When you create multiple-language reports for Power BI, you can work quickly and efficiently by using Translations Builder and by generating machine translations. However, machine generated translations alone are inadequate for many production needs. You need to integrate other people acting as translators into a human workflow process.

Translations Builder uses a *translation sheet*, which is a .csv file that you export to send to a translator. The human acting as a translator updates the translation sheet and then returns it to you. You then import the revised sheet to integrate the changes into the current data model.

Translations Builder generates a file for a selected language using a special naming format, for example, *PbixProjectName-Translations-Spanish.csv*. The name includes the data model name and the language for translation. Translations Builder saves the generated translation sheet to a folder known as the *Outbox*.

:::image type="content" source="./media/translation-workflow-human/save-outbox-folder.png" alt-text="Diagram shows Translations Builder exporting two sheets to the Outbox for different languages." lightbox="./media/translation-workflow-human/save-outbox-folder.png":::

Human translators can make edits to a translation sheet using Microsoft Excel. When you receive an updated translation sheet from a translator, copy it to the *Inbox* folder. From there, you can import it to integrate those updated translations back into the data model for the current project.

:::image type="content" source="./media/translation-workflow-human/translation-workflow.png" alt-text="Diagram shows Translations Builder exporting sheets a translator who works on them and returns them and sends them to the Inbox for import." lightbox="./media/translation-workflow-human/translation-workflow.png":::

## Configure import and export folders

By default, folder paths for *Outbox* and *Inbox* in Translations Builder are the *Documents* folder of the current user. To configure settings used as targets for export and import operations, follow these steps.

1. From the **Dataset Connection** menu, select **Configure Settings** to display the **Configuration Options** dialog box.

   :::image type="content" source="./media/translation-workflow-human/dataset-configuration-configure-setting.png" alt-text="Screenshot shows the Dataset Connection menu with Configure Settings selected.":::

1. Select the **set** buttons to update the settings for **Translations Outbox Folder Path** and **Translations Outbox Folder Path**.

   :::image type="content" source="./media/translation-workflow-human/configuration-option-dialog-output.png" alt-text="Screenshot shows the Configuration Options dialog box with the set button and Save Changes button highlighted." lightbox="./media/translation-workflow-human/configuration-option-dialog-output.png":::

1. After you have configured paths, select **Save Changes**.

After you configure the folder paths for *Outbox* and *Inbox*, you can begin to export and import translation sheets by using the **Export/Import Translations** options.

:::image type="content" source="./media/translation-workflow-human/export-import-translation.png" alt-text="Screenshot shows Translations Builder with the Export/Import Translations pane highlighted." lightbox="./media/translation-workflow-human/export-import-translation.png":::

## Related content

- [Export translation sheets in Translations Builder](translation-sheet-export.md)
