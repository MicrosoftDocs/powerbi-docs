---
title: Power BI Desktop project report folder
description: Learn about the Power BI Desktop project report folder.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 03/27/2024
---

# Power BI Desktop project report folder

> [!IMPORTANT]
> Power BI Desktop projects is currently in **preview**.

This article describes the files and subfolders in a Microsoft Power BI Desktop project's **Report** folder. The files and subfolders here represent a Power BI report. Depending on your project, the report folder can include:

- .pbi\
  - [localSettings.json](#pbilocalsettingsjson)
- [CustomVisuals\\](#customvisuals)
- StaticResources\\
  - [RegisteredResources\\](#registeredresources)
- [semanticModelDiagramLayout.json](#semanticmodeldiagramlayoutjson)
- [definition.pbir](#definitionpbir)<sup>[1](#required)</sup>
- [mobileState.json](#mobilestatejson)
- [report.json](#reportjson)<sup>[2](#required)</sup>
- [definition\ folder](#definition-folder)<sup>[3](#required3)</sup>
- [.platform](#platform)

<a name="required1">1</a> - This file is required.  
<a name="required2">2</a> - This file is required when saving using PBIR-Legacy format.  
<a name="required3">3</a> - This file is required when saving using PBIR format.

Not every project report folder includes all of the files and subfolders described here.

## Report files

#### .pbi\localSettings.json

Contains report settings that apply only for the current user and local computer. It should be included in gitIgnore or other source control exclusions. By default, Git ignores this file.

For more information, refer to the [localSettings.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/report/localSettings.md).

#### CustomVisuals\\

A subfolder that contains metadata for custom visuals in the report. Power BI supports three kinds of custom visuals:

- Organizational store visuals - Organizations can approve and deploy custom visuals to Power BI for their organization. To learn more, see [Organization store](/power-bi/developer/visuals/power-bi-custom-visuals#organizational-store).
- AppSource Power BI visuals - Also known as "Public custom visuals". These visuals are available from Microsoft AppSource. Report developers can install these visuals directly from Power BI Desktop.
- Custom visual files - Also known as "Private custom visuals". The files can be loaded into the report by uploading a pbiviz package.

Only private custom visuals are loaded into the CustomVisuals folder. AppSource and Organization visuals are loaded automatically by Power BI Desktop.

#### RegisteredResources\\

A subfolder that includes resource files specific to the report and loaded by the user, like custom themes, images, and custom visuals (pbiviz files).

Developers are responsible for the files here and changes are supported. For example, you can change a file and after a Power BI Desktop restart, the new file is loaded into the report. This folder can unblock some useful scenarios, like:

- Authoring custom themes outside of Power BI Desktop by using the public schema.
- Applying batch changes by changing the resource file on multiple reports. For example, you can switch the corporate custom theme, change between light and dark themes, and change logo images.

Every resource file must have a corresponding entry in the report.json file, which during **preview** doesn't support editing. Edits to RegisteredResources files are only supported for already loaded resources that cause Power BI Desktop to register the resource in report.json.

#### semanticModelDiagramLayout.json

Contains data model diagrams describing the structure of the semantic model associated with the report. During **preview**, this file doesn't support external editing.

#### definition.pbir

Contains the overall definition of a report and core settings. This file also holds the reference to the semantic model used by the report. Power BI Desktop can open a pbir file directly, just the same as if the report were opened from a pbip file. Opening a pbir also opens the semantic model alongside if there's a relative reference using `byPath`.

Example definition.pbir:

```json
{
  "version": "1.0",
  "datasetReference": {
    "byPath": {
      "path": "../Sales.Dataset"
    },
    "byConnection": null
  }
}

```

The definition includes the `datasetReference` property, which references the semantic model used in the report. The reference can be either:

`byPath` - Specifies a relative path to the target semantic model folder. Absolute paths aren't supported. A forward slash (/) is used as a folder separator. When used, Power BI Desktop also opens the semantic model in full edit mode.

`byConnection` - Specifies a remote semantic model in the Power BI service by using a connection string. When a `byConnection` reference is used, Power BI Desktop doesn't open the semantic model in edit mode.

When using a `byConnection` reference, the following properties must be specified:

|Property |Description  |
|---------|---------|
|connectionString    |   The connection string referring to the remote semantic model.      |
|pbiModelDatabaseName     |   The remote semantic model ID.      |
|connectionType     |   Type of connection. For service remote semantic model, this value should be `pbiServiceXmlaStyleLive`.      |
|pbiModelVirtualServerName    |  An internal property that should have the value, `sobe_wowvirtualserver`.       |

Example using `byConnection`:

```json
{
  "version": "1.0",
  "datasetReference": {
    "byPath": null,
    "byConnection": {
      "connectionString": "Data Source=powerbi://api.powerbi.com/v1.0/myorg/WorkpaceName;Initial Catalog=SemanticModelName;Integrated Security=ClaimsToken",
      "pbiServiceModelId": null,
      "pbiModelVirtualServerName": "sobe_wowvirtualserver",
      "pbiModelDatabaseName": "e244efd3-e253-4390-be28-6be45d9da47e",
      "connectionType": "pbiServiceXmlaStyleLive",
      "name": null
    }
  }
}

```

When the semantic model and report share the same workspace, [Fabric Git Integration](/fabric/cicd/git-integration/intro-to-git-integration) always uses a `byPath` reference to the semantic model.

For more information, refer to the [definition.pbir schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/report/definition.pbir.md).

#### mobileState.json

Contains report appearance and behavior settings when rendering on a mobile device. This file doesn't support external editing.

#### report.json

This file contains the report definition in the Power BI Report Legacy format (PBIR-Legacy) and does not support external editing.

#### definition\ folder

This folder is only available if the Power BI project is saved using the [Power BI enhanced report format (PBIR)](#pbir-format). It replaces the [report.json](#reportjson) file.

#### .platform

Fabric platform file that holds properties vital for establishing and maintaining the connection between Fabric items and Git.

To learn more, see [Git integration automatically generated system files](/fabric/cicd/git-integration/source-code-format#automatically-generated-system-files).


## PBIR format

You can save your Power BI Project files (PBIP) using Power BI enhanced report format (PBIR) as the report file format. The PBIR file format greatly simplifies the tracking of changes and resolution of merge conflicts by using properly formatted JSON.

:::image type="content" source="./media/projects-report/pbir-diff.png" alt-text="Screenshot of friendly PBIR diffs.":::

And organizing each page, visual, bookmark, etc., in separate individual files within a folder structure.

:::image type="content" source="./media/projects-report/pbir-folder.png" alt-text="Screenshot of friendly PBIR folder.":::

Unlike PBIR-Legacy (report.json), PBIR is a publicly documented format and allows modifications from  non-Power BI applications. Each file has a public JSON schema, which documents each property and lets code editors like Visual Studio Code perform syntax validation while editing. On open, Power BI Desktop will validate the changed PBIR files to guarantee successful loading.

### Enable PBIR format Preview feature

Saving as a Power BI Project using PBIR is currently in preview. Before using it, you must first enable it in Preview features:

Go to **File > Options and settings > Options > Preview features** and check the box next to **Store reports using enhanced metadata format (PBIR)**.

### Save as a project using PBIR

With the PBIR Preview feature enabled, when you save a project, your report is saved within a folder named *\definition* inside of [report folder](./projects-report.md):  

:::image type="content" source="./media/projects-dataset/pbip-pbir-definitionfolder.png" alt-text="Screenshot of the definition folder inside a report pbip folder.":::

Learn more about the [PBIR folder structure](#pbir-folder-structure).

### Convert existing PBIP to PBIR

If you already have a PBIP using PBIR-Legacy format, you can convert it to PBIR as follows:

1. Open the PBIP in Power BI Desktop.
1. Ensure the Preview Feature is enabled.
1. **Save** the project. A prompt appears asking you to upgrade into PBIR.
1. Select **Upgrade**.

    > [!IMPORTANT]
    > Once you upgrade to PBIR, you can't revert back to PBIR-Legacy. If you think you might want to revert back to TMSL, save a copy of your PBIP files first.

    :::image type="content" source="./media/projects-report/pbir-upgrade.png" alt-text="Screenshot of prompt to upgrade to PBIR.":::

The existing PBIR-Legacy file (*report.json*) is replaced with a *\definition* folder containing the PBIR representation of the report.

If you select to **Keep current** format, Desktop won't prompt again to upgrade.

### PBIR folder and files

The report definition is stored inside the **definition\\** folder with the following structure:

|File/Folder                       |Required |Description  |
|----------------------------------|---------|-------------|
|\bookmarks                        |No       |Folder holding all bookmark files of the report.
|── [bookmarkName].bookmark.json   |No       |Bookmark metadata, such as target visuals and filters.<br/>Name that consists of one or more word characters (letters, digits, underscores) or hyphens.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/bookmark).
|── bookmarks.json                 |No       |Bookmarks metadata, such as bookmark order and groups.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/bookmarksMetadata).
|\pages                            |Yes      |Folder holding all pages of the report.
|── \\[pageName]                   |Yes      |One folder per page.<br/>Name that consists of one or more word characters (letters, digits, underscores) or hyphens.
|──── \\visuals                    |No       |Folder holding all visuals of the page.
|────── \\[visualName]             |No       |One folder per visual.<br/>Name that consists of one or more word characters (letters, digits, underscores) or hyphens.
|──────── mobile.json              |No       |Visual mobile layout metadata, such as mobile position and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/visualContainerMobileState).
|──────── visual.json              |Yes      |Visual metadata, such as position and formatting, query.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/visualContainer).
|──── page.json                    |Yes      |Page metadata, such as page level filters and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/page).
|── pages.json                     |No       |Pages metadata, such as page order and active page.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/pagesMetadata).
|version.json                      |Yes      |PBIR file version, determines the required files.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/versionMetadata)
|reportExtensions.json             |No       |Report extensions, such as report level measures.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/reportExtension)
|report.json                       |Yes      |Report metadata, such as report level filters and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/report)

#### PBIR naming convention

By default, the pages, visuals, and bookmarks use their report object name as their file or folder name. The object names are by default a 20-character unique identifier, such as '90c2e07d8e84e7d5c026'.

:::image type="content" source="./media/projects-report/pbir-objectName.png" alt-text="Screenshot of PBIR name property.":::

Renaming the file or folder is supported, and the Power BI report authoring tool will preserve the original file name when saving. However, renaming the 'name' property within each JSON file, while also supported, may result in breaking external references (both inside and outside of the report).

### PBIR Json Schemas

Each PBIR JSON file includes a [JSON schema](https://json-schema.org/) declaration at the top of the document. This schema URL is publicly accessible and can be used to learn more about the available properties and objects for each file. Additionally, it provides built-in IntelliSense and validation when editing with code editors like [Visual Studio Code](https://code.visualstudio.com/).

:::image type="content" source="./media/projects-report/pbir-jsonSchema-tooltip.png" alt-text="Screenshot of prompt PBIR JSON Schema tooltip.":::

The schema URL also defines the version of the document, which is expected to change as the report definition evolves.

All the JSON schemas are published [here](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition).

### External changes to PBIR files

You can edit the PBIR JSON files using a code editor like [Visual Studio Code](https://code.visualstudio.com/) or an external tool, as long as the file JSON schema. Using a wrong property name or type can be easily detected directly in Visual Studio Code:

:::image type="content" source="./media/projects-report/pbir-jsonSchema-validation.png" alt-text="Screenshot of prompt PBIR JSON Schema validation.":::

The following scenarios are just a subset of possibilities now available with PBIR and external changes:
- Copy pages between reports.
- Ensure a certain set of visuals across all pages by simply copy & paste the visual files.
- Find and replace text across multiple reports.
- Apply a batch edit across all visuals using a script (e.g. hide visual level filters)

#### PBIR errors

TODO
- Types of errors: blocking vs non blocking

### Fabric Git Integration with PBIR

During the Public Preview, [Fabric Git Integration](/fabric/cicd/git-integration/intro-to-git-integration) and [Fabric REST APIs](/rest/api/fabric/articles/item-management/item-management-overview) will continue to use PBIR-Legacy (report.json) when exporting the report definitions. However, if the report is imported into Fabric using PBIR format, then both features will start exporting the report definition using PBIR format.

> [!IMPORTANT]
> If you import your semantic model using any other import method, such as [Power BI Desktop Publish](../../create-reports/desktop-upload-desktop-files.md), Fabric Git Integration will switch back to the default TMSL format.

### PBIR file constraints

When publishing a PBIR report to service, the following constraints are applied:

- 1000 max pages per report.
- 300 max visuals per page.
- 5mb max for each bookmark file.
- 1mb max for each file.
- 1000 max resource package files per report.
- 300mb max size for all resource package files.
- 20mb max size of all report files.

### PBIR limitations

During the Public Preview, PBIR reports published to service have the following limitations:

- Cannot be included in Power BI Apps.
- Cannot be downloaded as PBIX.
- Cannot be exported to PPTX or PDF.
- Cannot be included in Subscriptions.
- Cannot be deployed with deployment pipelines.
- Mobile layouts are not applied.
- Cannot be saved as a copy.
- Cannot be published from Power BI Desktop.
- Cannot be uploaded to workspace as PBIX.

## Related content

- [Power BI Desktop project semantic model folder](projects-dataset.md)  
- [Power BI Desktop projects](projects-overview.md)  
