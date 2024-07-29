---
title: Power BI Desktop projects (PBIP)
description: Learn how to save and edit a Power BI Desktop project.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 07/24/2024
---

# Power BI Desktop projects (PREVIEW)

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

> [!TIP]
> For guidance about how to plan a Power BI development, see [Power BI implementation planning](/power-bi/guidance/powerbi-implementation-planning-content-lifecycle-management-overview#the-power-bi-content-lifecycle).

Power BI Desktop introduces a new way to author, collaborate, and save your projects. When you save your work as a ***Power BI Project*** (PBIP), report and semantic model *item* definitions are saved as individual plain text files in a simple, intuitive folder structure.

Saving your work as a project has the following benefits:

- **Text editor support** - Item definition files are JSON formatted text files containing semantic model and report metadata. These files are publicly documented and human readable. While project files support simple text editing tools like Notepad, it's better to use a code editor like [Visual Studio Code (VS Code)](https://code.visualstudio.com/), which provides a rich editing experience including intellisense, validation, and Git integration.

- **Programmatic generation and editing item definitions** - You can create scripts using the popular and easy to use [Tabular Model Scripting Language (TMSL)](/analysis-services/tmsl/tabular-model-scripting-language-tmsl-reference?view=power-bi-premium-current&preserve-view=true) , or create your own custom applications to make changes to your item definitions. Applications can be based on public documentation of the item definition schemas and/or client libraries.

- **Source control** - Power BI semantic model and report item definitions can be stored in a source control system, like Git. With Git, you can track version history, compare revisions (diff), and revert to previous versions. Source control can also unblock collaboration when using Power BI Desktop by using familiar collaboration mechanisms for resolving conflicts (merge) and reviewing changes (pull requests). To learn more, see [Version control in Git](/devops/develop/git/what-is-version-control).

- **Continuous Integration and Continuous Delivery (CI/CD)** - You can use systems where developers in your organization submit a proposed change to the CI/CD system. The system then validates the change with a series of *quality gates* before applying the change to the production system. These quality gates can include code reviews by other developers, automated testing, and automated build to validate the integrity of the changes. CI/CD systems are typically built on top of existing source control systems. To learn more, see [DevOps - Continuous integration](/devops/develop/what-is-continuous-integration), and [DevOps - Continuous delivery](/devops/deliver/what-is-continuous-delivery).

## Video

See Power BI Desktop projects and other developer mode features being introduced at Microsoft Build 2023.

> [!VIDEO https://www.youtube.com/embed/OdkS7DF7ElY?start=277]

## Enable preview features

Saving as a Power BI Project in Power BI Desktop is currently in **preview**, and you must enable it in **Preview features**.

Go to **File > Options and settings > Options > Preview features** and check the box next to **Power BI Project (.pbip) save option**.

## Save as a project

If you're working on a new project or you opened an existing Power BI Desktop file (pbix), you can save your work as a Power BI *project* file (pbip):

:::image type="content" source="media/projects-overview/pbip-saveastype.png" alt-text="Screen grab showing save file as Power BI Project":::

When you save as a project, Power BI Desktop saves report and semantic model items as folders, each containing text files that define the item:

:::image type="content" source="media/projects-overview/pbip-files.png" alt-text="Screen grab showing Power BI Project files":::

After saving as a project, you can see when you're working on a project by looking at the title bar:

:::image type="content" source="media/projects-overview/pbip-desktop-title.png" alt-text="Screen grab showing Power BI Desktop title when saving to project.":::

If you select on the title bar, a flyout appears that's specific for Power BI Project. This flyout lets you locate the project files and the display name settings for the report and the semantic model. You can also open the folder in file explorer by clicking on the paths.

:::image type="content" source="media/projects-overview/pbip-desktop-flyout.png" alt-text="Screen grab showing Power BI Desktop title flyout.":::

Let's take a closer look at what you see in your project's root folder:

##### \<project name>.SemanticModel

A collection of files and folders that represent a Power BI semantic model. To learn more about the files and subfolders and files in here, see [Project Semantic Model folder](projects-dataset.md).

##### \<project name>.Report

A collection of files and folders that represent a Power BI report. To learn more about the files and subfolders and files in here, see [Project report folder](projects-report.md).

##### .gitIgnore

Specifies intentionally untracked files Git should ignore for Power BI Project files, such as the cache.abf and localSettings.json.

Power BI Desktop creates the [.gitignore](https://git-scm.com/docs/gitignore) file only if one doesn't already exist in the chosen save folder or parent Git repository.

Default content of .gitignore when saving as PBIP:

```
**/.pbi/localSettings.json
**/.pbi/cache.abf
```

##### \<project name>.pbip

The PBIP file contains a pointer to a report folder, opening a PBIP opens the targeted report and model for authoring.

For more information, see the [pbip schema document](https://github.com/microsoft/powerbi-desktop-samples/blob/main/item-schemas/common/pbip.md).

## Open a Power BI Project

You can open Power BI Desktop from the Power BI Project folder either by opening the **[pbip](#project-namepbip)** file or the **[pbir](./projects-report.md#definitionpbir)** file in the report folder. Both options open the report for editing, and the semantic model, if there's a relative reference to a semantic model.

You can save multiple reports and semantic models to the same folder. Having a separate pbip file for each report isn't required because you can open each report directly from the **.pbir** within the report folder.

```md
├── project
│   ├── AdventureWorks-Sales.Report
│   │   └── definition.pbir
│   ├── AdventureWorks-Stocks.Report
│   │   └── definition.pbir
│   ├── AdventureWorks.SemanticModel
|   |   └── *.*
│   .gitignore
└──  AdventureWorks.pbip
```

## Changes outside Power BI Desktop

When saved as a project, you're not forced into making changes to your semantic model and report definitions only in Power BI Desktop. You can use other tools such as VS Code, open-source community tools like Tabular Editor, or even Notepad. However, not every file or change supports editing by external, open-source tools.

Changes to files or properties outside of Power BI Desktop can cause unexpected errors, or even prevent Power BI Desktop from opening. In those cases, you must resolve the issues in the files before trying to open the project again in Power BI Desktop.

If possible, Power BI Desktop indicates the file and location of error:

:::image type="content" source="media/projects-overview/pbip-unable-to-open-file.png" alt-text="Screen grab of unable to open file error.":::

Schema details for the following files aren't documented. During **preview**, changes to these files outside of Power BI Desktop aren't supported:

- Report\
  - [report.json](projects-report.md#reportjson)
  - [mobileState.json](projects-report.md#mobilestatejson)
  - [semanticModelDiagramLayout.json](projects-report.md#semanticmodeldiagramlayoutjson)
- SemanticModel\
  - [diagramLayout.json](projects-dataset.md#diagramlayoutjson)

### Model authoring

You can make changes to the semantic model definition by using external tools in two ways:

- By connecting to Power BI Desktop's Analysis Service (AS) instance with [external tools](../../transform-model/desktop-external-tools.md).
- By editing JSON metadata in the model.bim file using VS Code or another external tool.

Not every model object supports write operations. Applying changes outside of those supported can cause unexpected results.

Objects that support write operations:

| Object                        | Connect to AS instance     | File change|
|-------------------------------|----------------------------|----------- |
| Tables                        | No                         | Yes        |
| Columns                       | Yes <sup>[1](#rc)</sup>, <sup>[2](#dt)</sup>| Yes        |
| Calculated tables             | Yes                        | Yes        |
| Calculated columns            | Yes                        | Yes        |
| Hierarchies                   | Yes                        | Yes        |
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

- When changing a model that uses Direct Query to connect a Power BI semantic model or Analysis Services model, you must update the ChangedProperties and PBI_RemovedChildren collection for the changed object to include any modified or removed properties. If ChangedProperties and/or PBI_RemovedChildren isn't updated, Power BI Desktop might overwrite any changes the next time the query is edited or the model is refreshed in Power BI Desktop.

- <a name="rc">1</a> - Changing a column's data type is supported. However, renaming columns isn't supported when connecting to the AS instance.

- <a name="dt">2</a> - If the semantic model has the [Auto date/time](../../transform-model/desktop-auto-date-time.md) feature enabled, and you create a new datetime column outside of Power BI Desktop, the local date table isn't automatically generated.

- <a name="mp">3</a> - Partition [SourceType](/dotnet/api/microsoft.analysisservices.tabular.partitionsourcetype) must be Calculated, M, Entity, or CalculationGroup. Partition [Mode](/dotnet/api/microsoft.analysisservices.tabular.modetype) must be Import, DirectQuery, or Dual.

- <a name="ee">4</a> - Any expression edits outside of Power BI Desktop in a project with [unappliedChanges.json](./projects-dataset.md#pbiunappliedchangesjson) are lost when those changes are applied.

- Modifying table query expressions outside of Power BI Desktop results in the removal of the table data upon restarting Power BI Desktop.

## JSON file schemas

Most project files contain metadata in JSON format. Corresponding JSON schemas can be used for validation and documentation.

With JSON schemas, you can:

- Learn about configurable properties.
- Use inline JSON validation provided by the code editor.
- Improve authoring with syntax highlighting, tooltips, and autocomplete.
- Use external tools with knowledge of supported properties within project metadata.

Use VS Code to map JSON schemas to the files being authored. JSON schemas for project files are provided in the [Power BI Desktop samples Git repo](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas).

## Considerations and limitations

- Power BI Desktop isn't aware of changes made with other tools or applications. Changes made by using external tools require you to restart Power BI Desktop before those changes are shown.
- Sensitivity labels aren't supported with Power BI projects.
- Diagram view is ignored when editing models in the Service.
- When saving as a Power BI Project, the maximum length of the project files path is 260 characters.
- In Power BI Desktop, you can't save as a PBIP directly to OneDrive and SharePoint.
- When editing PBIP files outside of Power BI Desktop, they should be saved using UTF-8 without BOM encoding.
- Report Linguistic Schema isn't supported with Power BI projects.
- Power BI Desktop uses CRLF as end-of-line. To avoid problems in your diffs, configure Git to handle line endings by enabling [autocrlf](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings).
- Power BI Projects is currently not supported in Microsoft Power BI Desktop version optimized for Power BI Report Server.
- [Live connect reports](/power-bi/connect-data/service-live-connect-dq-datasets#live-connection) saved as PBIP require the [XMLA Endpoint](/fabric/admin/service-admin-portal-integration#allow-xmla-endpoints-and-analyze-in-excel-with-on-premises-datasets) to be enabled.

## Frequently asked questions

**Question:** Looking at semantic model and report item folder definitions only a few files are marked as required, what happens if I delete them?

**Answer:** Power BI Desktop automatically creates them when you save as a project (PBIP).

**Question:** Is Power BI Desktop aware of changes I make to the Power BI Project files from an external tool or application?

**Answer:** No. Any change made to the files requires Power BI Desktop to be restarted to reflect those changes.

**Question:** If I convert a PBIX to a PBIP, can I convert it back to PBIX?

**Answer:** Yes. You can save a PBIX as a PBIP, or save a PBIP as a PBIX.

**Question:** Can I convert PBIX into PBIP and vice-versa programmatically?

**Answer:** No. You can only convert a PBIX into a PBIP and vice-versa using Power BI Desktop's **File** > **Save as**.

**Question:** Can I deploy a Power BI Desktop project to Azure Analysis Services (AAS) or SQL Server Analysis Services (SSAS)?

**Answer:** No. Power BI Desktop project report definitions aren't supported in AAS and SSAS. And model definitions use an enhanced metadata unique to Power BI. For AAS and SSAS projects, use Microsoft Visual Studio for model authoring, Git, and Azure DevOps integration.

**Question:** Why isn't there a *.pbip file when I connect my Fabric workspace to Git? How can I edit my report and semantic model in Power BI Desktop?

**Answer:** The PBIP file is optional and simply serves as a shortcut to the report folder. You can open both the report and the semantic model for editing in Power BI Desktop by opening the definition.pbir file located in the report folder.

## Related content

- [Power BI Desktop project semantic model folder](projects-dataset.md)  
- [Power BI Desktop project report folder](projects-report.md)  
- [Power BI Desktop projects Git integration](projects-git.md)  
- [Power BI Desktop projects Azure DevOps integration](projects-git.md)  
- [External tools in Power BI Desktop](../../transform-model/desktop-external-tools.md)  
