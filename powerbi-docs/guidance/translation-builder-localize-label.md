---
title: "Add a localized labels table to a Power BI report"
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Add a localized labels table to a Power BI report

Earlier you learned that report label translations provide localized values for text elements on a report that aren't directly associated with a dataset object. Examples of report labels are the text values for report titles, section headings and button captions. Given that Power BI provides no built-in features to track or integrate report labels, Translations Builder solves this problem using the **Localized Labels** table strategy. Before introducing this strategy, let's take a moment to discuss the problems this strategy has been designed to solve.

If you already have experience building datasets and reports with Power BI Desktop, it's critical that you learn which report design techniques to avoid when building multiple-language reports. Let's begin with the obvious things that cause problems due to a lack of localization support.

- Using textboxes or buttons with hard-coded text values
- Adding a hard-coded text value for the title of a visual
- Displaying page tabs to the user

The key point is that any hard-coded text value that gets added to the report layout can't be localized. Consider the case where you add a column chart to your report. By default, a Cartesian visual such as a column chart is assigned a dynamic value to its **Title** property that is parsed together using the names of the columns and measures that have been added into the data roles such of **Axis**, **Legend** and **Values**.

:::image type="content" source="./media/translation-builder-localize-label/power-bi-visual-title.png" alt-text="Screenshot shows a report visual with its generated title highlighted.":::

There's good news here. The default **Title** property for a Cartesian visual is dynamically parsed together in a fashion that supports localization. As long as you supply metadata translations for the names of columns and measures in the underlying dataset definition, for example,  **Sales Revenue**, **Country** and **Year**, the **Title** property of the visual uses the translations for whatever language has been used to load the report. The following table shows how the default **Title** property of this visual is updated for each of these five languages.

| Language        | Visual Title                         |
|-----------------|--------------------------------------|
| English (en-US) | Sales Revenue by Country and Year    |
| Spanish (es-ES) | Ingresos por ventas por país y año   |
| French (fr-FR)  | Chiffre d'affaires par pays et année |
| German (de-DE)  | Umsatz nach Land und Jahr            |
| Dutch (nl-NL)   | Omzet per land en jaar               |

> Even if you dislike the dynamically-generated visual **Title**, you must resist the temptation to replace it with a hard-coded text value. Any hard-coded text you type into the **Title** property of the visual is added to the report layout and cannot be localized. Therefore, you should either leave the visual **Title** property with its default value or you should use the **Localized Labels** table strategy to create report labels that support localization.

### Introduce the localized labels table strategy

As discussed earlier in this article, the Power BI localization features are supported at the dataset level but not at the report layout level. At first, you might ask the question **"how can I localize text-based values in a Power BI report that are not stored inside the dataset?"** The answer to this question is that there's no simple way to accomplish this goal. A better question to ask is **"how can I add text-based values for report labels into the dataset as dataset objects to enable localization support?"**

The idea behind the **Localized Labels** table isn't complicated. It builds on the idea that Power BI supports metadata translations for specific types of dataset objects including measures. When you add a report label with Translations Builder, the tool automatically adds a new measure to the **Localized Labels** table behind the scenes. Once a measure has been created for each report label, Power BI can store and manage its translations in the exact same fashion that it does for metadata translations. In fact, the **Localized Labels** table strategy uses metadata translations to implement report label translations.

Translations Builder provides commands to create the **Localized Labels** table and to add a measure each time you need a report label. The **Localized Labels** table is created as a hidden table behind the scenes. The idea is that you can do all the work to create and manage report labels inside the Translation Builder user experience. There's no need to inspect or modify the **Localized Labels** table using the Power BI Desktop dataset design experience.

Here's an example of the **Localized Labels** table from the live demo project. As you can see it provides localized report labels for the report title, visual titles and captions for navigation buttons used throughout the report.

:::image type="content" source="./media/translation-builder-localize-label/localize-label.png" alt-text="Screenshot shows the Localized Labels table.":::

> Translations Builder 1.0 introduced the **Localized Labels** table, but it did not take the strategy far enough. Consequently, the user experience was complicated and limited to surface report labels from the **Localized Labels** table directly on a report page. Translations Builder 2.0 introduces an evolved strategy to perform more work behind the scenes in order to make it easier and more natural for content creators to surface localized report labels on a report page.

You can create the **Localized Labels** table to a .pbix project by  running the **Create Localized Labels Table** command from the **Generate Translated Tables** menu.

:::image type="content" source="./media/translation-builder-localize-label/generate-translate-table.png" alt-text="Screenshot shows Translations Builder withe the Create Localized Labels Table selected.":::

When you run this command to create the **Localized Labels** table, you're prompted by the following dialog asking if you want more information about the **Localized Labels** table strategy. If you select **<u>Y</u>es,** interestingly enough, you're redirected back to this very section of this very article.

After the **Localized Labels** table has been created, you see three sample report labels as shown in the following screenshot. In most cases, you want to delete these sample report labels and replace them with the actual report labels required on the current project.

:::image type="content" source="./media/translation-builder-localize-label/sample-report-label.png" alt-text="Screenshot shows the localized labels entries in the Name column." lightbox="./media/translation-builder-localize-label/sample-report-label.png":::

Remember, there's no need to interact with the **Localized Labels** table in Power BI Desktop. You can add and manage all the report labels you need using **Translations Builder**. To create your first report label, you can drop down the **Generate Translated Tables** menu and select **Add Labels to the Localized Labels Table**. Note you can also run the **Add Labels to the Localized Labels Table** command using the shortcut key of **Ctrl+A**.

:::image type="content" source="./media/translation-builder-localize-label/add-localize-label.png" alt-text="Screenshot shows Translations Builder with Add Labels to Localized Labels Table selected.":::

You can add report labels one at a time to your project by typing in the text for the label and then selecting **Add Label**.

:::image type="content" source="./media/translation-builder-localize-label/add-localize-label-dialog.png" alt-text="Screenshot shows the Add Localized Labels dialog box with the label Product Sales Report.":::

You can alternatively switch the **Add Localized Labels** dialog into **Advanced Mode** which makes it possible to delete all existing report labels at once and to enter a large batch of report labels in a single operation.

:::image type="content" source="./media/translation-builder-localize-label/add-localize-label-advanced.png" alt-text="Screenshot shows the Add Localized Labels dialog box with Advanced Mode selected.":::

Once you've added the required report labels to your .pbix project, they appear in the translation grid. At that point, you can add and edit localized label translations just like any other type of translation in the translation grid.

:::image type="content" source="./media/translation-builder-localize-label/label-translation-grid.png" alt-text="Screenshot shows the Translations Builder grid with the report labels added.":::

> As you learned earlier, Translations Builder only populates the translation grid with dataset objects that are not hidden from **Report View**. The measures in the **Localized Labels** table are hidden from **Report View** and they provide the one exception to the rule that excludes hidden objects from being displayed in the translation grid.

One valuable aspect of the **Localized Labels** table strategy is that report labels can be created, managed and stored in the same .pbix project file that holds the metadata translations for the names of tables, columns and measures. The **Localized Labels** table strategy is able to merge metadata translations and report label translations together in a unified experience in the translation gird. There's no need to distinguish between metadata translations and report label translations when it comes to editing translations or when using Translations Builder features to generate machine translations.

In the Power BI community, there are other popular localization techniques that track report label translations in a separate CSV file. While these techniques work fine, they aren't as streamlined as the **Localized Labels** table strategy because report label translations must be stored in a separate CSV file. In other words, report label translations must be created separately and managed differently from the metadata translations in a .pbix project. The **Localized Labels** table strategy allows for report label translations and metadata translations to be stored together and managed in the exact same way.

### Generate the translated localized labels table

The **Localized Labels** table contains a measure with translations for each report label in a .pbix project. However, the measures inside the **Localized Labels** table are hidden and aren't intended to be used directly by report authors. Instead, the **Localized Labels** table strategy is based on running code to generate a second table named **Translated Localized Labels** with measures that are meant to be used directly on a report page. You can create this table by running the **Generate Translated Localized Labels Table** command.

:::image type="content" source="./media/translation-builder-localize-label/generate-translate-localize-table.png" alt-text="Screenshot shows Translations Builder with Generate Translated Localized Labels Table selected.":::

The first time you run the **Generate Translated Localized Labels Table** command, Translations Builder runs code to create the **Translated Localized Labels** table and populate it with measures. After that, running the **Generate Translated Localized Labels Table** command deletes all the measures in the **Translated Localized Labels** table and then recreate them to synchronize all the report label translations between the **Localized Labels** table and the **Translated Localized Labels** table.

:::image type="content" source="./media/translation-builder-localize-label/localize-label-table-view.png" alt-text="Screenshot shows the Localized Labels table mapped to the Translated Localized Labels table.":::

Unlike the **Localized Labels** table, the **Translated Localized Labels** table isn't hidden from **Report View**. In fact, it's quite the opposite. The **Translated Localized Labels** table provides measures that are intended to be used to surface report labels in a report. Here's how the **Translated Localized Labels** table appears to a report author in the **Fields** pane when the report is in **Report View** in Power BI Desktop.

:::image type="content" source="./media/translation-builder-localize-label/translate-localize-label-data.png" alt-text="Screenshot shows the Data pane with the Translated Localized Labels field selected.":::

> You can see that every measure in the **Translated Localized Labels** table has a name that ends with the world **Label**. The reason for this is that two measures inside the same dataset cannot have the same name. Measure names must be unique on a project-wide basis so it's not possible to create measures in the **Translated Localized Labels** table that have the same name as the measures in the **Localized Labels** table. Therefore, the **Localized Labels** table strategy appends the word **Label** to all measure names in the **Translated Localized Labels** table to ensure their names are unique.

If you examine the machine-generated DAX expressions for measures inside the **Translated Localized Labels** table, they're based on the same DAX pattern shown earlier. This pattern uses the DAX functions **USERCULTURE** together with the **SWITCH** function to return the best translation for the current user. This DAX pattern falls back on the translations of the dataset's default language if no match is found with another culture name.

:::image type="content" source="./media/translation-builder-localize-label/dax-expression.png" alt-text="Screenshot shows Product Sales Report Label derived from a SWITCH command in a DAX expression.":::

You must remember to run **Generate Translated Localized Labels Table** anytime you make changes to the **Localized Labels** table. Keep this fact in mind because it's easy to forget. You should also resist any temptation to edit the DAX expressions for measures in the **Translated Localized Labels** table. Any edits you make are lost because all the measures in this table are deleted and recreated each time you run **Generate Translated Localized Labels Table**.

### Surface localized labels on a report page

As you have learned, report labels are implemented as dynamic measures in the **Translated Localized Labels** table. That makes them easy to surface in a Power BI report. For example, you can add a **Card** visual to a report and then configure its **Fields** data role in the **Visualizations** pane with a measure from the **Translated Localized Labels** table.

:::image type="content" source="./media/translation-builder-localize-label/localize-label-card-report.png" alt-text="Image alt text." lightbox="./media/translation-builder-localize-label/localize-label-card-report.png":::

As Microsoft continues to evolve the report design experience in Power BI Desktop, there have been several new enhancements that make it easier for content creators to build multiple-language reports. One essential aspect of these enhancements is a greater ability to use measures in a report layout to configure dynamic property values for report elements such as visuals and shapes.

The live demo project uses a **Rectangle** shape to display the localized report label for the report title. The following screenshot shows how to select a **Rectangle** shape and then navigate to configure its **Text** property value in **Shape** > **Style** > **Text** section in the **Format** pane.

:::image type="content" source="./media/translation-builder-localize-label/rectangle-report-label.png" alt-text="Image alt text." lightbox="./media/translation-builder-localize-label/rectangle-report-label.png":::

The **Text** property of a **Rectangle** shape can be configured with a hard-coded string as shown in this screenshot.

However, you already know you must avoid hard-coding text values into the report layout when creating multiple-language reports. If you select the ***fx*** button to the right, Power BI Desktop displays a dialog box that allows you to configure the **Text** property of the **Rectangle** shape using a measure from the **Translated Localized Labels** table.

:::image type="content" source="./media/translation-builder-localize-label/text-function-button.png" alt-text="Image alt text."":::

Once the **Text - Style** dialog appears, you can navigate to the **Translated Localized Labels** table and select any measure.

:::image type="content" source="./media/translation-builder-localize-label/set-text-style.png" alt-text="Image alt text." lightbox="./media/translation-builder-localize-label/set-text-style.png":::

> You can use the same technique to localize a visual **Title** using a measure from the **Translated Localized Labels** table.

## Next steps
