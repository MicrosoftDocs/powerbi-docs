---
title: Enable workflows for human translation in Power BI reports
description: Learn about translations sheets, which Translations Builder uses to export and import .csv files for human translators to use to localize Power BI reports.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/24/2023
---
# Enable workflows for human translation in Power BI reports

Up to this point, you have learned to structure a Power BI report and its underlying dataset to support translations. You also learned how to complete this work in a quick and efficient manner by using Translations Builder and by generating machine translations. However. It's important to acknowledge that machine-generated translations alone aren't adequate for many production scenarios. You need to find a way to integrate other people acting as translators into a human workflow process.

> The Translations Builder introduces the concept of a ***translation sheet***. A translation sheet is a CSV file that you generate with an export operation to send out to a translator. The human acting as a translator performs the work to update the translation sheet and then returns it back to you. You can then run an import command to integrate the changes made by a translator back into the current .pbix project's dataset.

When you select the **Export Translation Sheet** button, Translations Builder generates a CSV file for the selected language using a special naming format, for example, **PbixProjectName-Translations-Spanish.csv**, which includes the dataset name and the language for translation. The generated translation sheet file is saved to a special folder known as the **Outbox** folder.

:::image type="content" source="./media/translation-workflow-human/save-outbox-folder.png" alt-text="Diagram shows Translations Builder exporting two sheets to the Outbox for different languages." lightbox="./media/translation-workflow-human/save-outbox-folder.png":::

Human translators can make edits to a translation sheet using Microsoft Excel. Once you've received an updated translation sheet back from a translator, you can copy it to the **Inbox** folder. Translations Builder provides an **Import Translations** command to integrate those updated translations back into the dataset for the current project.

:::image type="content" source="./media/translation-workflow-human/translation-workflow.png" alt-text="Diagram shows Translations Builder exporting sheets a translator who works on them and returns them and sends them to the Inbox for import." lightbox="./media/translation-workflow-human/translation-workflow.png":::

## Configure target folders for import and export operations

If you're required to work with an external team of translators, you need to manage the translation sheet files that are generated and sent to translators as well as those translations sheet files that are returned and ready for import. Translations Builder allows you to configure the location of the **Output** folder and the **Inbox** folder to assist with the file management of translations sheets.

Let's sat you'd like to configure settings in Translations Builder so that you can decide which folders on your local hard drive are used as targets for export and import operations. You can drop down the **Dataset Connection** menu and select **Configure Settings** to display the **Configuration Options** dialog.

:::image type="content" source="./media/translation-workflow-human/dataset-configuration-configure-setting.png" alt-text="Screenshot shows the Dataset Connection menu with Configure Settings selected.":::

By default, folder paths for the **Outbox** folder and **Inbox** folder are configured to target the current user's **Documents** folder. Select the **set** button to the right to update the setting for **Translations Outbox Folder Path**.

:::image type="content" source="./media/translation-workflow-human/configuration-option-dialog-output.png" alt-text="Screenshot shows the Configuration Options dialog box with the set button and Save Changes button highlighted." lightbox="./translation-workflow-human/configuration-option-dialog-output.png":::

Once you have configured the **Outbox** folder path and the **Inbox** folder path the way you like, select **Save Changes**.

:::image type="content" source="./media/translation-workflow-human/export-import-translation.png" alt-text="Screenshot shows Translations Builder with the Export/Import Translations pane highlighted." lightbox="./media/translation-workflow-human/export-import-translation.png":::

After you have configured the folder paths for **Outbox** and **Inbox**, you can begin to export and import translation sheets. As you can see, the **Export/Import Translations** section provides the commands for export and import operations.

## Next steps

- [Export translation sheets in Translations Builder](translation-sheet-export.md)
