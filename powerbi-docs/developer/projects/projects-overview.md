---
title: Power BI Desktop projects (PBIP)
description: Learn how to save and edit a Power BI Desktop project.
author: minewiskan
ms.author: owend
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 05/31/2023
---

# Power BI Desktop projects (PREVIEW)

> [!IMPORTANT]
> Power BI Desktop projects is currently in **PREVIEW**. This information relates to a prerelease feature that may be substantially modified before being released for General Availability (GA). Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

Power BI Desktop introduces a new way to author, collaborate, and save your projects. You can now save your work as a ***Power BI Project*** (PBIP). As a project, report and dataset *artifact* definitions are saved as individual plain text files in a simple, intuitive folder structure.

Saving your work as a project has the following benefits:

- **Text editor support** - Artifact definition files are JSON formatted text files containing model dataset and report metadata. They're publicly documented and human readable. While project files support simple text editing tools like Notepad, it's better to use a code editor like [Visual Studio Code (VS Code)](https://code.visualstudio.com/), which provides a rich editing experience including intellisense, validation, and Git integration.

- **Programmatic generation and editing artifact definitions** - You can create scripts using the popular and easy to use [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true) , or create your own custom applications to make changes to your artifact definitions. Applications can be based on public documentation of the artifact definition schemas and/or client libraries.

- **Source control** - Power BI dataset and report artifact definitions can be stored in a source control system, like Git. With Git, you can track version history, compare revisions (diff), and revert to previous versions. Source control can also unblock collaboration when using Power BI Desktop by using familiar collaboration mechanisms for resolving conflicts (merge) and reviewing changes (pull requests). To learn more, see [Version control in Git](/devops/develop/git/what-is-version-control).

- **Continuous Integration and Continuous Delivery (CI/CD)** - You can use systems where developers in your organization submit a proposed change to the CI/CD system. The system then validates the change with a series of *quality gates* before applying the change to the production system.  These quality gates can include code reviews by other developers, automated testing, and automated build to validate the integrity of the changes. CI/CD systems are typically built on top of existing source control systems. To learn more, see [DevOps - Continuous integration](/devops/develop/what-is-continuous-integration), and [DevOps - Continuous delivery](/devops/deliver/what-is-continuous-delivery).

## Video

See Power BI Desktop projects and other developer mode features being introduced at Microsoft Build 2023.

<iframe width="560" height="315" src="https://www.youtube.com/embed/OdkS7DF7ElY?start=277" title="YouTube video player" frameborder="0" allowfullscreen></iframe>

## Enable preview features

Saving as a project in Power BI Desktop is currently in **PREVIEW**. Before giving it a try, you must first enable it in **Preview features**.

To enable, in Power BI Desktop > **File** > **Options and settings** > **Options** > **Preview features**, select the checkbox for **Power BI Project (.pbip) save option**.

## Save as a project

If you're working on a new project or you've opened an existing Power BI Desktop file (pbix), you can save your work as a Power BI *project* file (pbip):

:::image type="content" source="media/projects-overview/pbip-saveastype.png" alt-text="Screen grab showing save file as Power BI Project":::

When you save as a project, Power BI Desktop saves report and dataset artifacts as folders, each containing text files that define the artifact. You see the following:

:::image type="content" source="media/projects-overview/pbip-files.png" alt-text="Screen grab showing Power BI Project files":::

Let's take a closer look at what you see in your project's root folder:

##### \<project name>.Dataset

A collection of files and folders that represent a Power BI dataset. It contains some of the most important files you're likely to work on, like model.bim. To learn more about the files and subfolders and files in here, see [Project Dataset folder](projects-dataset.md).

##### \<project name>.Report

A collection of files and folders that represent a Power BI report. To learn more about the files and subfolders and files in here, see [Project Report folder](projects-report.md).

##### .gitIgnore

Specifies intentionally untracked files Git should ignore. Power BI Desktop creates the [.gitignore](https://git-scm.com/docs/gitignore) file in the root folder when saving if it doesn't already exist.

Dataset and Report subfolders each have default git ignored files specified in .gitIgnore:

- Dataset
  - \.pbi\localSettings.json
  - \.pbi\cache.abf

- Report
  - \.pbi\localSettings.json

##### \<project name>.pbip

The PBIP file contains a pointer to a report folder, opening a PBIP opens the targeted report and model for authoring.

## Open a Power BI Project

You can open Power BI Desktop from the Power BI Project folder either by opening the **[pbip](#project-namepbip)** file or the **[pbir](./projects-report.md#definitionpbir)** file in the report folder. Both options open the report for editing, and the dataset, if there's a relative reference to a dataset.

You can save multiple reports and datasets to the same folder. Having a separate pbip file for each report isn't required because you can open each report directly from the pbir within the report folder.

:::image type="content" source="media/projects-overview/pbip-files-reports.png" alt-text="Screen grab showing Power BI Project files with multiple report folders":::

## Changes outside Power BI Desktop

When saved as a project, you're not forced into making changes to your dataset and report definitions only in Power BI Desktop. You can use other tools such as VS Code, open-source community tools like Tabular Editor, or even Notepad. However, not every file or change supports editing by external, open-source tools.

Changes to files or properties outside of Power BI Desktop can cause unexpected errors, or even prevent Power BI Desktop from opening. In those cases, you must resolve the issues in the files before trying to open the project again in Power BI Desktop.

If possible, Power BI Desktop indicates the file and location of error:

:::image type="content" source="media/projects-overview/pbip-unable-to-open-file.png" alt-text="Screen grab of unable to open file error.":::

Schema details for the following files aren't documented. During **PREVIEW**, changes to these files outside of Power BI Desktop aren't supported:

- Report\
  - report.json
  - mobileState.json
  - datasetDiagramLayout.json
- \Dataset
  - diagramLayout.json

### Model authoring

You can make changes to the model definition by using external tools in two ways:

- By connecting to Power BI Desktop's Analysis Service (AS) instance with [external tools](../../transform-model/desktop-external-tools.md).
- By editing JSON metadata in the model.bim file using VS Code or another external tool.

Not every model object supports write operations. Applying changes outside of the those supported can cause unexpected results.

Objects that support write operations:

| Object                        | Connect to AS instance     | File change|
|-------------------------------|----------------------------|----------- |
| Tables                        | No                         | Yes        |
| Columns                       | Yes <sup>[1](#rc)</sup>, <sup>[2](#dt)</sup>| Yes        |
| Calculated tables             | Yes                        | Yes        |
| Calculated columns            | Yes                        | Yes        |
| Relationships                 | Yes                        | Yes        |
| Measures                      | Yes                        | Yes        |
| Model KPIs                    | Yes                        | Yes        |
| Calculation groups            | Yes                        | Yes        |
| Perspectives                  | Yes                        | Yes        |
| Translations                  | Yes                        | Yes        |
| Row Level Security (RLS)      | Yes                        | Yes        |
| Object Level Security (OLS)   | Yes                        | Yes        |
| Annotations                   | Yes                        | Yes        |
| M expressions                 | No                         | Yes <sup>[3](#mp)</sup>, <sup>[4](#ee)</sup>        |

Keep in mind:

- Any changes to open files made outside Power BI Desktop requires a restart for those changes to be shown in Power BI Desktop. Power BI Desktop isn't aware of changes to project files made by other tools.
- Power BI Desktop doesn’t support tables with multiple partitions. Only a single partition for each table is supported. Creating tables with empty partitions or more than one partition results in an error when opening the report.
- Automatic date tables created by Power BI Desktop shouldn't be changed by using external tools.
- When changing a model that uses Direct Query to connect a Power BI Dataset or Analysis Services model, you must update the ChangedProperties collection for the changed object to include any modified properties.  If ChangedProperties isn't updated, Power BI Desktop may overwrite any changes the next time the query is edited or the model is refreshed in Power BI Desktop.

- <a name="rc">1</a> - Changing a column's data type is supported. However, renaming columns isn't supported when connecting to the AS instance.

- <a name="dt">2</a> - If the dataset has the [Auto date/time](../../transform-model/desktop-auto-date-time.md) feature enabled, and you create a new datetime column outside of Power BI Desktop, the local date table isn't automatically generated.

- <a name="mp">3</a> - Partition [SourceType](/dotnet/api/microsoft.analysisservices.tabular.partitionsourcetype) must be Calculated, M, Entity, or CalculationGroup. Partition [Mode](/dotnet/api/microsoft.analysisservices.tabular.modetype) must be Import, DirectQuery, or Dual.

- <a name="ee">4</a> - Any expression edits outside of Power BI Desktop in a project with [unappliedChanges.json](./projects-dataset.md#pbiunappliedchangesjson) are lost when those changes are applied.

## JSON file schemas

Most project files contain metadata in JSON format. Corresponding JSON schemas can be used for validation and documentation.

With JSON schemas, you can:

- Learn about configurable properties.
- Use inline JSON validation provided by the code editor.
- Improve authoring with syntax highlighting and autocomplete.
- Use external tools with knowledge of supported properties within project metadata.

You can use VS Code to map JSON schemas to the files being authored, which provides validation, syntax highlighting, auto complete, and tooltips. JSON schemas for project files are provided in the [Power BI Desktop samples Git repo](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas).

## Considerations and limitations

- Power BI Desktop isn't aware of changes made with other tools or applications. Changes made by using external tools require you to restart Power BI Desktop before those changes are shown.
- Sensitivity labels aren't supported with Power BI projects.
- Download PBIX isn't supported for workspaces with Git integration.
- Diagram view is ignored when editing models in the Service.
- When saving as a Power BI Project, the maximum length of the project files path is 260 characters.

## Frequently asked questions

**Question:** Looking at dataset and report artifact folder definitions only a few files are marked as required, what happens if I delete them?

**Answer:** Power BI Desktop automatically creates them when you save as a project (PBIP).

**Question:** Is Power BI Desktop aware of changes I make to the Power BI Project files from an external tool or application?

**Answer:** No. Any change made to the files requires Power BI Desktop to be restarted to reflect those changes.

**Question:** If I convert a PBIX to a PBIP, can I convert it back to PBIX?

**Answer:** Yes. You can save a PBIX as a PBIP, or save a PBIP as a PBIX.

**Question:** Can I convert PBIX into PBIP and vice-versa programmatically?

**Answer:** No. You can only convert a PBIX into a PBIP and vice-versa using Power BI Desktop's **File** > **Save as**.

**Question:** The Publish button is disabled when I'm working in a PBIP. How can I publish my content?

**Answer:** Publish is disabled while this feature is in **PREVIEW**. You can either use Fabric Git Integration to publish your work, or save as a PBIX to publish.

**Question:** Can I deploy a Power BI Desktop project to Azure Analysis Services (AAS) or SQL Server Analysis Services (SSAS)?

**Answer:** No. Power BI Desktop project report definitions aren't supported in AAS and SSAS. And model definitions use an enhanced metadata unique to Power BI. For AAS and SSAS projects, use Microsoft Visual Studio for model authoring, Git, and Azure DevOps integration.

## See also

[Power BI Desktop project Dataset folder](projects-dataset.md)  
[Power BI Desktop project Report folder](projects-report.md)  
[Power BI Desktop projects Git integration](projects-git.md)  
[Power BI Desktop projects Azure DevOps integration](projects-git.md)  
[External tools in Power BI Desktop](../../transform-model/desktop-external-tools.md)  
