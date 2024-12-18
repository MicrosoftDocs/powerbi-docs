---
title: Use Tabular Model Definition Language (TMDL) view in Power BI Desktop (preview)
description: Learn how to use TMDL view to see and work with semantic model metadata in a visual format in Power BI Desktop.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-transform-model
ms.topic: conceptual
ms.date: 01/12/2025
LocalizationGroup: Transform and shape data
---

# Work with Tabular Model Definition Language (TMDL) view in Power BI Desktop (preview)

Tabular Model Definition Language view (hereafter, **TMDL view**) lets you script, modify, and apply changes to semantic model objects with a modern code editor using [Tabular Model Definition Language (TMDL)](../developer/projects/projects-dataset.md) in Power BI Desktop, improving development efficiency and providing complete visibility and control over semantic model metadata. 

**TMDL view** offers an alternative experience to semantic modeling using code, instead of a graphical user interface such as [Model view](desktop-relationship-view.md). 

TMDL view offers the following advantages:

* **Enhanced development efficiency** with a rich code editor that includes search-and-replace, keyboard shortcuts, multi-line edits and more. 
* **Increase reusability** by easily scripting, sharing, and reusing TMDL scripts among semantic model developers. For example, use a centralized SharePoint site to easily share reusable semantic model objects such as calendar tables, or time intelligence calculation groups. 
* **Gain more control and transparency**, showing all semantic model objects and properties, and allowing changes to items not available in the Power BI Desktop user interface, such as *[IsAvailableInMDX](/dotnet/api/microsoft.analysisservices.tabular.column.isavailableinmdx)* or *[DetailRowsDefinition](/dotnet/api/microsoft.analysisservices.tabular.measure.detailrowsdefinition)*.  


## Enable preview feature

**TMDL view** is available beginning with the January 2025 version of Power BI Desktop, and is currently in preview. To use TMDL view, you must enable the preview feature. In Power BI Desktop select **File > Options and settings > Options > Preview features** and select the box next to **TMDL View**. 

## Script to TMDL

In Power BI Desktop, select the **TMDL view** icon located along the left side of the window, as shown in the following image. 

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-01.png" alt-text="Screenshot of Tabular Model Definition Language T-M-D-L view.":::

When TMDL view opens the code editor is initially empty. You can script any semantic model object such as a table, measure, or column by selecting the objects from the **Data pane** and dragging them onto the code editor:

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-02.png" alt-text="Screenshot of dragging a semantic model object onto the T-M-D-L view canvas.":::

When using TMDL view and dragging the object from the Data pane, Power BI scripts the entire object metadata into the current tab as TMDL, or opens a new tab if the current tab isn't empty, as a *createOrReplace* TMDL script of the selected objects, as shown in the following image:

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-03.png" alt-text="Screenshot of the T-M-D-L metadata being created automatically.":::

Alternatively, you can right-click an object in the Data view and select **Script TMDL** to new tab or to the clipboard, shown in the following image:

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-04.png" alt-text="Screenshot of right-clicking on an object in Data view to have Power BI create T-M-D-L metadata code.":::

> [!TIP]
> Multi selection is supported by pressing the CTRL key before scripting the objects into the TMDL view code editor.

## Code editor

Once you've scripted a semantic model object or pasted TMDL script into the code editor, you can use the comprehensive code experience features offered by the TMDL view code editor. The code experience features enable you to either explore the model metadata, or make modifications that can later be applied to the semantic model.

### Semantic highlighting

Semantic highlighting is built into the code editor, which improves readability by applying different colors to parts of your code based on meaning. Such color coding makes it easier to understand the structure and functionality of your TMDL code, as shown in the following image.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-05.png" alt-text="Screenshot of color coding and semantic highlighting for T-M-D-L metadata code.":::

You can also expand or collapse sections of your TMDL script, as shown in the following image:

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-06.png" alt-text="Screenshot of collapsing sections of code in the code editor.":::

### Autocomplete

Autocomplete is built into the code editor, and offers intelligent suggestions while you type. Autocomplete can speed up your workflow, reduce the chance of errors, and help you understand your code options by dynamically suggesting possible values or properties by taking into consideration the cursor position. 

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-07.png" alt-text="Screenshot of autocomplete in the code editor.":::

You can also trigger the autocomplete feature in any location by pressing *Ctrl+Space*.

### Error diagnostics

The code editor's built-in error diagnostics help you identify and fix issues by highlighting TMDL language errors in the code editor, with detailed messages that provide guidance on resolving them. Additionally, an error summary is available in the **Problems pane**, allowing easy navigation to the error location in the code editor, as shown in the following image.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-08.png" alt-text="Screenshot of error diagnostics in the code editor.":::

## Apply changes to the semantic model

When you're ready, you can select the **Apply** button to execute the TMDL script against the semantic model, and have your TMDL code changes applied.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-09.png" alt-text="Screenshot of applying your script using the apply button in the code editor.":::

When successful, a notification is displayed and your modeling change are applied to the semantic model.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-10.png" alt-text="Screenshot of success banner in the code editor indicating changes were successfully applied.":::

In the event of a failure, an error notification is displayed to show that your modeling changes weren't applied to the semantic model. You can view more information about the error by selecting the *Show details* link in the notification, which then expands the **Output pane** and displays error details.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-11.png" alt-text="Screenshot of failure banner in the code editor indicating changes weren't successful.":::

> [!NOTE]
> Execution of TMDL scripts with TMDL view only modifies the semantic model metadata, and does not refresh data. If your changes require a data refresh, such as changing a PowerQuery expression or calculated column expression, you must manually refresh the table or model for any such changes to take effect.

## TMDL script tabs

In TMDL view you can have multiple script tabs at once, any of which can be renamed or removed. 

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-12.png" alt-text="Screenshot of multiple tabs in the T-M-D-L view.":::

The contents of the **TMDL view** tabs are saved in the report file when you save the Power BI Desktop report, so you can continue where you left off the next time you open the Power BI Desktop report file. When saving to a Power BI Project (PBIP), each script tab is saved as a .tmdl file in the *\TMDLScripts* folder, as shown in the following image.

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-13.png" alt-text="Screenshot of the file structure for saving tabs in a Power BI Desktop file.":::

> [!TIP]
> You can open and edit TMDL scripts in Visual Studio Code, and they will properly reload after restarting Power BI Desktop.

The *Problems* and *Output* panes display errors and messages specific to the script tab that's currently selected and displayed. Switching to a different TMDL scrip tab refreshes both of those panes with information specific to the selected and currently shown tab.

You can select the *Clear* button to empty the *Output* pane messages. 

:::image type="content" source="media/desktop-tabular-model-definition-language-view/tmdl-view-14.png" alt-text="Screenshot of the clear button used to empty output pane messages.":::

Messages are kept only for each Power BI Desktop session, so restarting Power BI Desktop clears all output messages for all script tabs.

## Considerations and limitations

TMDL view is currently in preview, so keep the following limitations in mind:

* Not all modeling changes are supported. During preview, each *Apply* change undergoes the same validations that occur when opening a Power BI project (PBIP). Refer to the [Model Authoring article](../developer/projects/projects-overview.md) (File change column) for a list of supported changes. Executing unsupported changes may result in unexpected behaviors.
* The *Command palette* displays some commands that aren't currently supported.
* Setting up the *initial* Git integration *from* the workspace won't include TMDL View scripts saved in published semantic model. Learn more in the [Fabric Git integration](/fabric/cicd/git-integration/git-get-started?wt.mc_id=fabric_inproduct_gitintegration&tabs=commit-to-git#connect-a-workspace-to-an-azure-repo) article.
* You can't script model explorer groups such as Measures, Columns, so on.


## Related content

The following articles describe more about data models, and also describe DirectQuery in detail.

* [Automatic aggregations](../enterprise/aggregations-auto.md)
* [Use composite models in Power BI Desktop](desktop-composite-models.md)
* [Manage storage mode in Power BI Desktop](desktop-storage-mode.md)
* [Many-to-many relationships in Power BI Desktop](desktop-many-to-many-relationships.md)

