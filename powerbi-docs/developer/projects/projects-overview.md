---
title: Learn about Microsoft Power BI Desktop projects
description: Learn how to save and edit a Power BI Desktop project
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/03/2023
---

# Power BI Desktop projects (PREVIEW)

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

Microsoft Power BI Desktop projects is a Developer mode feature providing developer specific capabilities like source control, text editor support, and programmatic generation of content.

Projects is a new save option that enables Power BI Desktop to save  into a Power BI Project folder (PBIP) and operate on report and dataset item definitions on the file system, rather than a single PBIX file.

Power BI Desktop introduces a new way for developers to work with Power BI Desktop. You can now save your work as a *project* with report and dataset item definitions as individual plain text files.

Saving your work as a project has the following benefits:

- **Source control** - Power BI item definitions can be stored in a source control system, like Git. With Git, developers can track version history, compare different revisions (diff), and revert to previous versions. Source control can also unblock co-development and collaboration when using Power BI Desktop by leveraging familiar collaboration mechanisms for resolving conflicting changes (merge) and reviewing changes (pull requests). To learn more, see [Version control](/devops/develop/git/what-is-version-control).

- **Continuous Integration and Continuous Delivery (CI/CD)** - You can leverage systems where developers in your organization submit a proposed change to the CI/CD system, and the system validates the change to a series of *quality gates* before applying the change to the production system.  These quality gates can include code reviews by other developers, automated testing, and automated build to validate the integrity of the changes. CI/CD systems are typically built on top of existing source control systems. To learn more, see [DevOps - Continuous integration](/devops/develop/what-is-continuous-integration), and [DevOps - Continuous delivery](/devops/deliver/what-is-continuous-delivery).

- **Text Editor Support** - Item definition files for datasets and reports must be text files, publicly documented and human readable. Allowing developers to use code editors (like Visual Studio Code) for more productive authoring (e.g., batch edits), always with a rich editing experience including intellisense and validation.

- **Programmatic generation and editing or item definitions** - You can write scripts or create applications to make changes to the definition of various items.  These applications can be based on public documentation of the item definitions and/or libraries provided by Microsoft.

## Video

See Power BI Desktop projects and other Developer mode features being introduced at Microsoft Build 2023.

<iframe width="560" height="315" src="https://www.youtube.com/embed/OdkS7DF7ElY?start=277" title="YouTube video player" frameborder="0" allowfullscreen></iframe>

## Enable preview features

Saving as a Power BI Project is currently in **PREVIEW**. Before giving it a try, you must first enable it in **Preview features**.

To enable, in Power BI Desktop > **File** > **Options and settings** > **Options** > **Preview features**, select the checkbox for **Power BI Project (.pbip) save option**.

## Saving as a project

If you're working on a new project or you've opened an existing Power BI Desktop file (.pbix), you can save your work as a Power BI *project* file (.pbip):

:::image type="content" source="media/projects-overview/pbip-saveastype.png" alt-text="Screengrab showing save file as Power BI Project":::

When you save as a project, Power BI Desktop saves report and dataset items as folders, each containing text files that define the item. You'll see the following:

:::image type="content" source="media/projects-overview/pbip-files.png" alt-text="Screengrab showing Power BI Project files":::

Let's take a closer look at what you see in your project's root folder:

##### \<project name>.Dataset

A collection of files and folders that represent a Power BI dataset. It contains some of the most important files you're likely to work on, like model.bim. To learn more about the files and sub-folders and files in here, see [Project dataset folder](projects-dataset.md).

##### \<project name>.Report

A collection of files and folders that represent a Power BI Report. To learn more about the files and sub-folders and files in here, see [Project report folder](projects-report.md).

##### .gitIgnore

Specifies intentionally untracked files that Git should ignore. Power BI Desktop writes and updates the [.gitignore](https://git-scm.com/docs/gitignore) file in the root folder when saving an item.

Dataset and Report sub-folders each have default git ignored files specified in .gitIgnore:

- Dataset
  - \.pbi\localSettings.json
  - \.pbi\cache.abf

- Report
  - \.pbi\localSettings.json

##### \<project name>.pbip

Contains a pointer to a report item and can be opened by Power BI Desktop to open the report for authoring.  

Opening a PBIP opens the targeted report for authoring. It also opens the dataset if the report contains a *byPath* dataset reference.

## Changes outside Power BI Desktop

When saved as a project, you're not forced into making changes to your dataset and report definitions only in Power BI Desktop. You can use other tools such as VSCode, Tabular Editor, or even Notepad. However, not every file or change supports editing by external tools or text editors.

Changes to files or properties outside of the supported list may raise unexpected errors, or even prevent the application from opening, and it's up to the developer to fix the error.

If possible, Power BI Desktop indicates the file and location of error:

:::image type="content" source="media/projects-overview/pbip-unable-to-open-file.png" alt-text="Screengrab of unable to open file error.":::

Details for the following files are not documented. Changes to these files outside of Power BI Desktop are not supported:

- Report\
  - report.json
  - mobileState.json
  - datasetDiagramLayout.json
- \Dataset
  - diagramLayout.json

### Dataset authoring

With Developer mode, it's possible to apply changes to the model definition by using external tools in two ways:

- By connecting to Power BI Desktop's Analysis Service (AS) instance with [External tools](../../transform-model/desktop-external-tools.md).
- By editing the TMSL in the model.bim file using VS Code or another external tool.

Not every object or change is supported. Applying changes outside of the those supported can result in unexpected situations.

Objects and operations that support write operations:

| Object / Operation            | Change using AS Instance   | File Change |
|-------------------------------|-------------------------|-------------|
| Measures                      | Y                       | Y           |
| Calc groups                   | Y                       | Y           |
| Perspectives                  | Y                       | Y           |
| Translations                  | Y                       | Y           |
| OLS rules                     | Y                       | Y           |
| Model KPIs                    | Y                       | Y           |
| Detail rows on measures       | Y                       | Y           |
| Tables                        | N                       | Y           |
| M expressions                 | N                       | Y           |
| Relationships                 | Y                       | Y           |
| Calculated columns & tables   | Y                       | Y           |
| Format strings & descriptions | Y                       | Y           |
| Renaming columns & tables     | N                       | Y           |
| Changing data types           | Y                       | Y           |
| Annotations                   | Y                       | Y           |

Keep in mind:

- Any changes made outside Power BI Desktop requires a restart for those changes to be applied. Power BI Desktop isn't aware of changes to the files made by other tools.
- Power BI Desktop doesn’t support tables with multiple partitions. Only a single partition for each table is supported. Creating more than one partition results in an error when opening the report.
- If the dataset has the [Auto date/time](../../transform-model/desktop-auto-date-time.md) feature enabled, and you create a new datetime column outside of Power BI Desktop, the local date table isn't  automatically generated.
- Automatic date tables created by Power BI Desktop should not be edited by using external tools.

## Metadata JSON file schemas

Most metadata files are JSON, and JSON schema is used for validation and documentation.

JSON schemas allow developers to:

- Learn about properties that can be configured.
- Inline JSON validation provided by the code editor.
- Improve editing experience with syntax highlighting and autocomplete by the code editor.
- Use external tools with knowledge about all the supported properties within the metadata files.

You can use VS Code to author the metadata files and map the JSON schemas to the files being authored. This allows validation, syntax highlighting, auto completion and tooltip documentation.

When authoring the document, only valid properties appear:

:::image type="content" source="media/projects-overview/json-schema-path.png" alt-text="Schema byPath":::

If an incorrect property or type is specified, a warning is shown:

:::image type="content" source="media/projects-overview/json-schema-warning.png" alt-text="JSON schema warning":::

When you hover over properties, additional context is shown:

:::image type="content" source="media/projects-overview/json-schema-warning-context.png" alt-text="JSON schema warning context":::

You can directly reference the schema by adding the **$schema** property to the edited file:

```json
{
  "$schema": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/file-formats/report/ReportDefinition.json",
  "version": "1.0",
  "datasetReference": {
    "byPath": {
      "path": "../Sales.Dataset"
    },
    "byConnection": null
  }
}

```

Or you can map the metadata files to your VS Code user settings:

```json
{
    "json.schemas": [
        {
            "fileMatch": [
                "/*.Report/*.pbir"
            ],
            "url": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/file-formats/report/ReportDefinition.json"
        }
        ,
        {
            "fileMatch": [
                "/*.Dataset/*.pbidataset"
            ],
            "url": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/file-formats/dataset/DatasetDefinition.json"
        }
        ,
        {
            "fileMatch": [
                "/*.Dataset/.pbi/editorSettings.json"
            ],
            "url": "https://raw.githubusercontent.com/microsoft/powerbi-desktop-samples/main/file-formats/dataset/DatasetEditorSettings.json"
        }
    ]
}

```

To learn more, see [Editing JSON with Visual Studio Code](https://code.visualstudio.com/docs/languages/json).

## Considerations and limitations

- Power BI Desktop is not aware of changes made with other tools or applications. Any changes made by using external tools require you to restart Power BI Desktop before those changes are shown.
- Sensitivity Labels are not supported with Power BI Projects.
- Download PBIX isn't supported for workspaces with Git-Integration.
- Diagram view is ignored when editing models in the Service.
- When saving a PBIP to OneDrive, use the new **Save to OneDrive** experience.

## Frequently asked questions

**Question:** Looking at dataset and report item folder definitions only a few files are marked as required, what happens if I delete them? 

**Answer:** Power BI Desktop will automatically generate them when saved.

**Question:** Is Power BI Desktop aware of changes I make to the Power BI Project files from an external tool or application?

**Answer:** No. Any change made to the files requires Power BI Desktop to be restarted to reflect those changes.

**Question:** If I convert a PBIX to a PBIP, can I convert it back to PBIX?

**Answer:** Yes. You can save a PBIX as a PBIP, or save a PBIP as a PBIX.

**Question:** The Publish button is disabled when I'm working in a PBIP. How can I publish my content?

**Answer:** Publish is disabled while this feature is in **PREVIEW**. You can either use Fabric Git Integration to publish your work, or save as a PBIX to publish.

## See also

[Power BI Desktop project Dataset folder](projects-dataset.md)  
[Power BI Desktop project Report folder](projects-report.md)  
[Power BI Desktop projects Git integration](projects-git.md)  
[Power BI Desktop projects Azure DevOps integration](projects-git.md)  
[External tools in Power BI Desktop](../../transform-model/desktop-external-tools.md)  
[Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true)  

