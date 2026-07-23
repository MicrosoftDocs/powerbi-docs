---
title: Configure Semantic Model Options
description: Configure semantic model options directly in the Power BI service, including type detection, relationships, auto date/time, and more.
author: kgremban
ms.author: kgremban
ms.reviewer: monicacl
ms.service: powerbi
ms.topic: how-to
ms.date: 07/13/2026
ai-usage: ai-assisted
LocalizationGroup: Transform and shape data

#customer intent: As a Power BI user, I want to configure semantic model options in the Power BI service so that I can control settings like type detection, relationships, and auto date/time without needing Power BI Desktop.

---

# Configure semantic model options in the Power BI service

**Applies to:** [!INCLUDE [applies-to-service](../includes/applies-to-version/service.md)]

The model **Options** dialog in the Power BI service lets you view and edit modeling settings for the current semantic model. You get greater control over model-level behavior without needing to switch back to Power BI Desktop.

## Prerequisites

* Write permission to the semantic model.

## Open the model options dialog

Use the following steps to access the model options dialog.

1. Open a semantic model in **Model view** in the Power BI service.

1. Switch to **Editing mode**.

   :::image type="content" source="media/service-model-options/edit-switch-options.png" alt-text="Screenshot that shows the Editing mode control in the Power BI service.":::

1. Select **File** > **Options**.

   :::image type="content" source="media/service-model-options/entry-point-options-dialog.png" alt-text="Screenshot that shows opening the model options view in the Power BI service.":::

## Review available model options

The model **Options** dialog includes the following settings:

* **Type detection**: Toggle to enable or disable automatic detection of column types and headers for unstructured sources. For more information, see [Data type detection](/power-query/data-types#automatic-detection-of-column-data-type-and-headers).

* **Relationships**: Configure auto-detection behavior for relationships in the model, including importing relationships on first load, updating or deleting relationships on refresh, and autodetecting new relationships after data is loaded. For more information, see [Understand model relationships](desktop-relationships-understand.md).

* **Time intelligence: Auto date/time**: Toggle to enable or disable automatic creation of hidden date tables. For more information, see [Apply auto date/time](desktop-auto-date-time.md).

* **Parallel loading of tables**: Set the concurrency mode used when loading tables. Options include `Default`, `One`, and `Custom` with a configurable job count. For more information, see [Evaluation configuration settings](./desktop-evaluation-configuration.md#change-maximum-number-of-concurrent-jobs-settings-in-power-bi-desktop).

* **Regional settings: Locale**: Set the locale that determines the regional settings used to interpret numbers, dates, and time in imported text. For more information, see [Set the locale for Power BI imports](../create-reports/power-bi-default-format-string-locale.md).

* **DirectQuery connections to this semantic model**: Toggle whether other semantic models can connect to this semantic model using DirectQuery. When enabled, this model can't be used as a DirectQuery source. For more information, see [Manage DirectQuery connections to a published semantic model](../connect-data/desktop-discourage-directquery-connections-to-dataset.md).

* **(DirectQuery only) Maximum connections per data source**: Limit how many concurrent DirectQuery connections can be opened to a single data source. For more information, see [Maximum number of DQ connections](../connect-data/desktop-directquery-about.md#maximum-number-of-connections).

  :::image type="content" source="media/service-model-options/model-options-dialog.png" alt-text="Screenshot that shows the model Options dialog and all of the settings that it makes available.":::

## Considerations and limitations

* Some settings take effect at different times:
  * **Type detection**, **Relationships**, **Parallel loading of tables**, and **Regional settings** take effect on the next data load or refresh, not immediately.
  * **Auto date/time** and **DirectQuery connection restrictions** take effect immediately on save.
* Currently, you configure these settings per model. You can't define default settings for new models or update them in bulk on the web.
* The Power BI Desktop configuration settings persist when you publish a model, so the initial values shown in the web dialog reflect the Power BI Desktop configuration. Once you change a setting in the Power BI service, the service values take precedence.
* If you download the model as a `.pbix` file, edit it in Power BI Desktop, and republish it, the Power BI Desktop settings overwrite the service values. Any changes you made in the Power BI service between the download and republish are lost.
* Turning off **Auto date/time** removes hidden date tables that back auto date/time hierarchies. Reports that use those hierarchies show broken-field errors after refresh. To resolve, either re-enable the setting or update the affected reports to use explicit date tables. For more information, see [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md).
* A few locales might not display correctly in the web options dialog. While models using these locales continue to function as expected, the locale might appear blank in the options dialog UI. In those cases, if you change the locale in the web experience, you can't revert it there. You must republish the model from Power BI Desktop to restore the original locale.

## Troubleshoot model options

If you experience issues with the Model Options dialog, use the following guidance to resolve common problems.

### Model options button isn't visible

* Confirm you have write (edit) access to the semantic model. Without write access, you can't access Model View.
* Make sure you're in **Model View**. The model **Options** dialog isn't available from the report view, DAX Query view, TMDL view, or the semantic model settings page.

### Save operation fails

* Check for an inline error message in the dialog.
* Verify that no concurrent modifications are being made to the model through the XMLA endpoint or other clients.
* If the error persists, close and reopen the model **Options** dialog to refresh the cached model data, and then try again.

## Related content

* [Edit semantic models in the Power BI service](service-edit-data-models.md)
* [Apply auto date/time in Power BI Desktop](desktop-auto-date-time.md)
* [Evaluation configuration settings](desktop-evaluation-configuration.md)
* [Manage DirectQuery connections to a published semantic model](../connect-data/desktop-discourage-directquery-connections-to-dataset.md)
