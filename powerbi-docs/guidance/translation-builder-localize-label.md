---
title: "Add a Localized Labels table to a Power BI report"
description: Learn how report label translations provide localized values for text elements on a report that aren't directly associated with a data model object.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/24/2023
---
# Add a Localized Labels table to a Power BI report

Report label translations provide localized values for text elements on a report that aren't directly associated with a data model object. Examples of report labels are the text values for report titles, section headings, and button captions. Power BI provides no built-in features to track or integrate report labels. Translations Builder uses *Localized Labels* tables to support this approach.

> [!NOTE]
> If you haven't installed Translations Builder yet, see [Create multiple-language reports with Translations Builder](translation-builder.md).

## Compare localized labels and hard-coded text

There are some design techniques for building data models and reports with Power BI Desktop that you should avoid when you build multiple-language reports. These elements cause problems due to a lack of localization support:

- Using text boxes or buttons with hard-coded text values.
- Adding a hard-coded text value for the title of a visual.
- Displaying page tabs to the user.

Any hard-coded text value that you add to the report layout can't be localized. Suppose you add a column chart to your report. By default, a Cartesian visual such as a column chart is assigned a dynamic value to its **Title** property. That value is based on the names of the columns and measures that have been added into the data roles, such as **Axis**, **Legend**, and **Values**.

:::image type="content" source="./media/translation-builder-localize-label/power-bi-visual-title.png" alt-text="Screenshot shows a report visual with its generated title highlighted.":::

The default **Title** property for a Cartesian visual is dynamically parsed together in a fashion that supports localization. As long as you supply metadata translations for the names of columns and measures in the underlying data model definition, the **Title** property of the visual uses the translations. So, if you translate **Sales Revenue**, **Day**, and **Year**, the visual creates a localized title.

The following table shows how the default **Title** property of this visual is updated for each of these five languages.

| Language        | Visual Title                           |
|-----------------|----------------------------------------|
| English (en-US) | `Sales Revenue by Day and Year`        |
| Spanish (es-ES) | `Ingresos Por Ventas por Día y Año`    |
| French (fr-FR)  | `Chiffre D'Affaires par Jour et Année` |
| German (de-DE)  | `Umsatz nach Tag und Jahr`             |

You might not like the dynamically generated visual **Title**, but don't replace it with hard-coded text. Any hard-coded text for the **Title** property can't be localized. Either leave the visual **Title** property with its default value or use the Localized Labels table strategy to create report labels that support localization.

## Use the Localized Labels table strategy

The Power BI localization features are supported at the data model level but not at the report layout level. Using a **Localized Labels** table builds on the fact that Power BI supports metadata translations for specific types of data model objects, including measures. When you add a report label by using Translations Builder, it automatically adds a new measure to the **Localized Labels** table behind the scenes.

After a measure has been created for each report label, Power BI can store and manage its translations in the same fashion that it does for metadata translations. In fact, the Localized Labels table strategy uses metadata translations to implement report label translations.

Translations Builder creates the **Localized Labels** table and adds a measure each time you need a report label. The **Localized Labels** table is created as a hidden table. You can do all the work to create and manage report labels inside the Translation Builder user experience. There's no need to inspect or modify the **Localized Labels** table using the Power BI Desktop Model or Data views.

Here's an example of the **Localized Labels** table from the example project. It provides localized report labels for the report title, visual titles, and captions for navigation buttons used throughout the report.

:::image type="content" source="./media/translation-builder-localize-label/localize-label.png" alt-text="Screenshot shows the Localized Labels table.":::

### Create the Localized Labels table

You can create the **Localized Labels** table for a .pbix project:

1. From the **Generate Translated Tables** menu, select **Create Localized Labels Table**.

   :::image type="content" source="./media/translation-builder-localize-label/generate-translate-table.png" alt-text="Screenshot shows Translations Builder with the Create Localized Labels Table selected.":::

1. An informational dialog box asks if you want more information about the **Localized Labels** table strategy. Select **Yes** to review documentation or **No** to proceed.

After you create the **Localized Labels** table, there are three sample report labels as shown in the following screenshot. In most cases, you want to delete these sample report labels and replace them with the actual report labels required on the current project.

:::image type="content" source="./media/translation-builder-localize-label/sample-report-label.png" alt-text="Screenshot shows the localized labels entries in the Name column." lightbox="./media/translation-builder-localize-label/sample-report-label.png":::

There's no need to interact with the **Localized Labels** table in Power BI Desktop. You can add and manage all the report labels you need in Translations Builder.

### Populate the Localized Labels table

To create your first report label, follow these steps:

1. From the **Generate Translated Tables** menu, select **Add Labels to the Localized Labels Table**. You can also run the command using the shortcut key **Ctrl**+**A**.

   :::image type="content" source="./media/translation-builder-localize-label/add-localize-label.png" alt-text="Screenshot shows Translations Builder with Add Labels to Localized Labels Table selected.":::

1. Add report labels one at a time by typing the text for the label. Then select **Add Label**.

   :::image type="content" source="./media/translation-builder-localize-label/add-localize-label-dialog.png" alt-text="Screenshot shows the Add Localized Labels dialog box with the label Product Sales Report.":::

   Alternatively, select **Advanced Mode** to add labels as a batch.

   :::image type="content" source="./media/translation-builder-localize-label/add-localize-label-advanced.png" alt-text="Screenshot shows the Add Localized Labels dialog box with Advanced Mode selected.":::

After you add the report labels to your .pbix project, they appear in the translation grid. Now you can add and edit localized label translations just like any other type of translation in the translation grid.

:::image type="content" source="./media/translation-builder-localize-label/label-translation-grid.png" alt-text="Screenshot shows the Translations Builder grid with the report labels added." lightbox="./media/translation-builder-localize-label/label-translation-grid.png":::

### About the Localized Labels table

Translations Builder only populates the translation grid with data model objects that aren't hidden from **Report View**. The measures in the **Localized Labels** table are hidden from **Report View** and they provide the one exception to the rule that excludes hidden objects from being displayed in the translation grid.

In the Localized Labels table strategy, you can create, manage, and store report labels in the same .pbix project file that holds the metadata translations for the names of tables, columns, and measures. The Localized Labels table strategy can merge metadata translations and report label translations together in a unified experience in the translation grid. There's no need to distinguish between metadata translations and report label translations when it comes to editing translations or when using Translations Builder features to generate machine translations.

There are other popular localization techniques that track report label translations in a separate CSV file. While these techniques work, they aren't as streamlined. Report label translations must be created separately and managed differently from the metadata translations in a .pbix project. This strategy allows for report label translations and metadata translations to be stored together and managed in the same way.

### Generate the translated Localized Labels table

The **Localized Labels** table contains a measure with translations for each report label in a .pbix project. The measures inside the **Localized Labels** table are hidden and aren't intended to be used directly by report authors. Instead, the strategy is based on running code to generate a second table. The **Translated Localized Labels** table has measures that are meant to be used directly on a report page.

To create a **Translated Localized Labels** table, follow these steps.

- In Translations Builder, from the **Generate Translated Tables** menu, select **Generate Translated Localized Labels Table**.

  :::image type="content" source="./media/translation-builder-localize-label/generate-translate-localize-table.png" alt-text="Screenshot shows Translations Builder with Generate Translated Localized Labels Table selected.":::

The first time you generate the **Translated Localized Labels** table, Translations Builder creates the table and populates it with measures. After that, generating the table deletes all the measures in the **Translated Localized Labels** table and recreates them. This action synchronizes all the report label translations between the **Localized Labels** table and the **Translated Localized Labels** table.

:::image type="content" source="./media/translation-builder-localize-label/localize-label-table-view.png" alt-text="Screenshot shows the Localized Labels table mapped to the Translated Localized Labels table.":::

Unlike the **Localized Labels** table, the **Translated Localized Labels** table isn't hidden in the **Report View**. The table provides measures that are intended to be used as report labels in a report. Here's how the **Translated Localized Labels** table appears to a report author in the **Data** pane when the report is in the **Report View** in Power BI Desktop.

:::image type="content" source="./media/translation-builder-localize-label/translate-localize-label-data.png" alt-text="Screenshot shows the Data pane with the Translated Localized Labels field selected.":::

Every measure in the **Translated Localized Labels** table has a name that ends with the word **Label**. The reason for this fact is that two measures in the same data model can't have the same name. Measure names must be unique on a project-wide basis. It's not possible to create measures in the **Translated Localized Labels** table that have the same name as the measures in the **Localized Labels** table.

If you examine the machine-generated Data Analysis Expressions (DAX) expressions for measures in the **Translated Localized Labels** table, they're based on the same DAX pattern shown in [Implement translations using measures and USERCULTURE](multiple-language-locale.md#implement-translations-using-measures-and-userculture). This pattern uses the DAX function `USERCULTURE` together with the `SWITCH` function to return the best translation for the current user. This DAX pattern defaults to the data model's default language if no match is found.

:::image type="content" source="./media/translation-builder-localize-label/dax-expression.png" alt-text="Screenshot shows Product Sales Report Label derived from a SWITCH command in a DAX expression.":::

You must run **Generate Translated Localized Labels Table** anytime you make changes to the **Localized Labels** table.

Don't edit the DAX expressions for measures in the **Translated Localized Labels** table. Any edits you make are lost because all the measures in this table are deleted and recreated each time you generate the table.

### Surface localized labels on a report page

Report labels are implemented as dynamic measures in the **Translated Localized Labels** table. That fact makes them easy to surface in a Power BI report. For example, you can add a Card visual to a report and then configure its **Data** role in the **Visualizations** pane with a measure from the **Translated Localized Labels** table.

:::image type="content" source="./media/translation-builder-localize-label/localize-label-card-report.png" alt-text="Screenshot shows a card visual with a translated localized label." lightbox="./media/translation-builder-localize-label/localize-label-card-report.png":::

The example multiple-language project uses a *Rectangle* shape to display the localized report label for the report title. The following screenshot shows how to select a Rectangle shape and navigate to configure its **Text** property value in the **Shape** > **Text** section in the **Format** pane.

:::image type="content" source="./media/translation-builder-localize-label/rectangle-report-label.png" alt-text="Screenshot shows the text box for a rectangle." lightbox="./media/translation-builder-localize-label/rectangle-report-label.png":::

The **Text** property of a shape can be configured with a hard-coded string. You must avoid hard-coding text values into the report layout when you create multiple-language reports. To use a localized measure, follow these steps.

1. In Power BI Desktop, select the shape, a Rectangle, in this example.

1. Under Format, select **Shape** > **Text**. In the **Text** pane, select the ***fx*** button.

   :::image type="content" source="./media/translation-builder-localize-label/text-function-button.png" alt-text="Screenshot shows the function button next to the text box for this rectangle.":::

   Power BI Desktop displays a dialog box that allows you to configure the **Text** property of the Rectangle shape.

1. In the **Text - Style - Text** dialog box, expand the **Translated Localized Labels** table and select any measure.

   :::image type="content" source="./media/translation-builder-localize-label/set-text-style.png" alt-text="Screenshot shows the Text - Style - Text dialog box with the Product Sales Report Label field selected." lightbox="./media/translation-builder-localize-label/set-text-style.png":::

1. Select **OK**.

You can use the same technique to localize a visual **Title** using a measure from the **Translated Localized Labels** table.

## Related content

- [Generate machine translations using Azure Translator Service](translation-builder-machine-translation.md)
