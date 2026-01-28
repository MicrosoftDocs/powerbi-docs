---
title: Power BI Desktop project report folder
description: Learn about the Power BI Desktop project report folder.
author: billmath
ms.author: billmath
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: concept-article
ms.date: 12/15/2025
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
- [definition.pbir](#definitionpbir)<sup>[1](#required1)</sup>
- [mobileState.json](#mobilestatejson)
- [report.json](#reportjson)<sup>[2](#required1)</sup>
- [definition\ folder](#definition-folder)<sup>[3](#required3)</sup>
- [.platform](#platform)

<a name="required1">1</a> - This file is required.  
<a name="required2">2</a> - This file is required when saving to PBIR-Legacy format.  
<a name="required3">3</a> - This file is required when saving to PBIR format.

Not every project report folder includes all of the files and subfolders described here.

## Report files

#### .pbi\localSettings.json

Contains report settings that apply only for the current user and local computer. It should be included in gitIgnore or other source control exclusions. By default, Git ignores this file.

For more information, see the [localSettings.json schema document](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/localSettings).

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

Contains the overall definition of a report and core settings. This file also holds the reference to the semantic model used by the report. Power BI Desktop can open a PBIR file directly, just the same as if the report were opened from a PBIP file. Opening a PBIR file also opens the semantic model alongside if there's a relative reference using `byPath`.

Example definition.pbir:

```json
{  
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/2.0.0/schema.json",
  "version": "4.0",
  "datasetReference": {
    "byPath": {
      "path": "../Sales.Dataset"
    }    
  }
}

```

The definition includes the `datasetReference` property, which references the semantic model used in the report. The reference can be either:

`byPath` - Specifies a relative path to the target semantic model folder. Absolute paths aren't supported. A forward slash (/) is used as a folder separator. When used, Power BI Desktop also opens the semantic model in full edit mode.

`byConnection` - Specifies the connection to a semantic model in a Fabric workspace by using a connection string. When a `byConnection` reference is used, Power BI Desktop doesn't open the semantic model in edit mode. 

##### [Version 2](#tab/v2)

Using a `byConnection` reference, the following properties must be specified:

|Property |Description  |
|---------|---------|
|connectionString    |   The connection string referring to the semantic model in a Fabric workspace.      |

Example using `byConnection`:

```json
{  
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/2.0.0/schema.json",
  "version": "4.0",
  "datasetReference": {
    "byConnection": {      
      "connectionString": "Data Source=\"powerbi://api.powerbi.com/v1.0/myorg/[WorkpaceName]\";initial catalog=[SemanticModelName];access mode=readonly;integrated security=ClaimsToken;semanticmodelid=[SemanticModelId]"
    }
  }
}
```

When deploying a report through [Fabric REST API](/rest/api/fabric/report/items), you only need to specify the `semanticmodelid` property. For example: 

```json
{  
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/2.0.0/schema.json",
  "version": "4.0",
  "datasetReference": {
    "byConnection": {      
      "connectionString": "semanticmodelid=[SemanticModelId]"
    }
  }
}
```

##### [Version 1](#tab/v1)

Using a `byConnection` reference, the following properties must be specified:

|Property |Description  |
|---------|---------|
|connectionString    |   The connection string referring to the semantic model in a Fabric workspace.      |
|pbiModelDatabaseName     |   The remote semantic model ID.      |
|connectionType     |   Type of connection. For service remote semantic model, this value should be `pbiServiceXmlaStyleLive`.      |
|pbiModelVirtualServerName    |  An internal property that should have the value, `sobe_wowvirtualserver`.       |
|pbiServiceModelId    |  An internal property that should have the value, `null`.       |
|name    |  An internal property that should have the value, `EntityDataSource`.       |

Example using `byConnection`:

```json
{
    "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionProperties/1.0.0/schema.json",
    "version": "4.0",
    "datasetReference": {  
      "byConnection": {
        "connectionString": "Data Source=powerbi://api.powerbi.com/v1.0/myorg/[WorkpaceName];Initial Catalog=[SemanticModelName];Integrated Security=ClaimsToken",
        "pbiServiceModelId": null,
        "pbiModelVirtualServerName": "sobe_wowvirtualserver",
        "pbiModelDatabaseName": "[Semantic Model Id]",
        "connectionType": "pbiServiceXmlaStyleLive",
        "name": "EntityDataSource"
      }
  }
}
```

---

> [!IMPORTANT]
> When deploying a report through [Fabric REST API](/rest/api/fabric/report/items), you must use `byConnection` references. This should not be confused with the [storage mode](../../transform-model/desktop-storage-mode.md) of a semantic model such as DirectQuery. The `datasetReference` in the report only specifies which semantic model the report connects to, it does not define how that model stores or accesses its data.

##### Multiple *.pbir files

When the semantic model and report share the same workspace, [Fabric Git Integration](/fabric/cicd/git-integration/intro-to-git-integration) always exports definitions with a `byPath` reference to the semantic model. If you want to force the report to open in live connect (for example, to work with report-level measures), you can have multiple `*.pbir` files, such as one with a byPath connection and another with a byConnection connection. Fabric Git Integration processes only the *definition.pbir* file and ignores all other *.pbir files. However, these files can coexist in the same repository.

```md
  ├── definition\
  ├── StaticResources\
  ├── .platform
  ├── definition-liveConnect.pbir
  └── definition.pbir
```
The `definition.pbir` file also specifies the supported report definition formats through the 'version' property.

| Version  | Supported formats    |
|----------|----------------------------|
| 1.0      | Report definition must be stored as PBIR-Legacy in the report.json file. |
| 4.0 or higher | Report definition can be stored as PBIR-Legacy (report.json file) or [PBIR](#pbir-format) (\definition folder). |

For more information, see the [definition.pbir schema document](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definitionProperties).

#### mobileState.json

Contains report appearance and behavior settings when rendering on a mobile device. This file doesn't support external editing.

#### report.json

This file contains the report definition in the Power BI Report Legacy format (PBIR-Legacy) and doesn't support external editing.

#### definition\ folder

This folder is only available if the Power BI project is saved using the [Power BI enhanced report format (PBIR)](#pbir-format). It replaces the [report.json](#reportjson) file.

#### .platform

Fabric platform file that holds properties vital for establishing and maintaining the connection between Fabric items and Git.

To learn more, see [Git integration automatically generated system files](/fabric/cicd/git-integration/source-code-format#automatically-generated-system-files).

## PBIR format

> [!IMPORTANT]
> Consider all the PBIR [limitations](#pbir-considerations-and-limitations) during the preview phase.

Saving your Power BI Project files (PBIP) using the Power BI Enhanced Report Format (PBIR) greatly improves change tracking and merge conflict resolution by using properly formatted JSON files.

:::image type="content" source="./media/projects-report/pbir-diff.png" alt-text="Screenshot of friendly PBIR diffs.":::

Each page, visual, bookmark, etc., is organized into a separate, individual file within a folder structure. This format is ideal for codevelopment conflict resolution.

:::image type="content" source="./media/projects-report/pbir-folder.png" alt-text="Screenshot of friendly PBIR folder.":::

Unlike PBIR-Legacy (report.json), PBIR is a publicly documented format that supports modifications from non-Power BI applications. Each file has a public JSON schema, which not only documents the file but also lets code editors like Visual Studio Code perform syntax validation while editing.

Some of the possible scenarios now available with PBIR include:

- Copy pages/visuals/bookmarks between reports.
- Ensure consistency of a set of visuals across all pages, by copying & pasting the visual files.
- Easy find and replace across multiple reports files.
- Apply a batch edit across all visuals using a script (for example, hide visual level filters)

### Enable the PBIR format preview feature

Saving as a Power BI reports using PBIR is currently in preview. Before using it, enable it in Power BI Desktop preview features:

For Power BI Project (PBIP) files:

1. Go to **File > Options and settings > Options > Preview features**.
1. Select the **Store reports using enhanced metadata format (PBIR)** checkbox.

For PBIX files:

1. Go to **File > Options and settings > Options > Preview features**.
1. Select the **Store PBIR reports using enhanced metadata format (PBIR)** checkbox.

Enabling PBIR for PBIX ensures that the PBIR format is saved within PBIX files as well, not only in Power BI Project (PBIP) files.

### Save as a project using PBIR

With the PBIR Preview feature enabled, when you save a project, your report is saved within a folder named *\definition* inside of [report folder](./projects-report.md):  

:::image type="content" source="./media/projects-report/pbip-pbir-definitionfolder.png" alt-text="Screenshot of the definition folder inside a report PBIP folder.":::

Learn more about the [PBIR folder structure](#pbir-folder-and-files).

### Convert existing report to PBIR

If you already have a PBIP using PBIR-Legacy format, you can convert it to PBIR as follows:

1. Open the PBIP in Power BI Desktop.
1. Ensure the Preview Feature is enabled.
1. **Save** the project. A prompt appears asking you to upgrade into PBIR.
1. Select **Upgrade**.

    :::image type="content" source="./media/projects-report/pbir-upgrade.png" alt-text="Screenshot of prompt to upgrade to PBIR.":::

    > [!IMPORTANT]
    > Once you upgrade to PBIR, you can't revert back to PBIR-Legacy from the UI. To revert back to PBIR-Legacy, save a copy of your PBIP files.
    >
    > Power BI Desktop automatically creates a backup of the report before upgrading to PBIR. This backup is retained for 30 days in one of the following locations: 
    > - Microsoft Store version: `%USERPROFILE%\Microsoft\Power BI Desktop Store App\TempSaves\Backups`  
    > - Executable installer version: `%USERPROFILE%\AppData\Local\Microsoft\Power BI Desktop\TempSaves\Backups`

The existing PBIR-Legacy file (*report.json*) is replaced with a *\definition* folder containing the PBIR representation of the report.

If you select to **Keep current** format, Desktop won't prompt again to upgrade.

### PBIR in Service

New reports created in the Service use the PBIR format by default. Existing reports that are edited will also be automatically converted to PBIR format.

During the Public Preview, administrators can choose to opt out of PBIR by disabling the tenant setting: **Automatically convert and store reports in the Power BI enhanced metadata format (PBIR)**.

:::image type="content" source="./media/projects-report/pbir-tenant-setting.png" alt-text="Screenshot of PBIR tenant setting.":::

> [!IMPORTANT]
> - When PBIR reaches General Availability (GA), it will become the only supported report format, and conversion will be mandatory. We recommend that customers begin preparing for this migration ahead of GA.
> - The PBIR in the Power BI service may not yet be available in your tenant. The tenant setting primarily exists to let you opt out before the feature is fully enabled. For the latest updates, visit the [Power BI Blog](https://powerbi.microsoft.com/blog/).


#### Restore to PBIR-Legacy

When a report is converted to PBIR in the Service, a backup copy in the **PBIR-Legacy** format is automatically created and retained for 28 days. You can restore the report to its PBIR-Legacy version by opening the **Report settings** from the workspace and selecting **Restore as PBIR-Legacy**.

:::image type="content" source="./media/projects-report/pbir-service-restore.png" alt-text="Screenshot of PBIR restore setting.":::

A restored report will not be automatically converted back to PBIR. To re-enable automatic conversion, open the report settings and select **Enable PBIR**.

> [!IMPORTANT]
> The **PBIR-Legacy** service backup is only created for reports upgraded directly in the Power BI service. If you upgrade your report by publishing from Power BI Desktop or by uploading a PBIX file and need to restore the **PBIR-Legacy** version, use the backup created by Power BI Desktop.

### PBIR folder and files

The report definition is stored inside the `definition\` folder with the following structure:

```md
├── bookmarks\
│   ├── [bookmarkName].bookmark.json
|   └── bookmarks.json
├── pages\
│   ├── [pageName]\
│   |   ├── \visuals
|   │   |   ├── [visualName]\
|   |   │   │   |── mobile.json
|   |   |   └   └── visual.json
|   |   └── page.json
|   └── pages.json
├── version.json
├── reportExtensions.json
└── report.json
```

|File/Folder                       |Required |Description  |
|----------------------------------|---------|-------------|
|bookmarks\                        |No       |Folder holding all bookmark files of the report.
|── [bookmarkName].bookmark.json   |No       |Bookmark metadata, such as target visuals and filters.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/bookmark).
|── bookmarks.json                 |No       |Bookmarks metadata, such as bookmark order and groups.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/bookmarksMetadata).
|pages\                            |Yes      |Folder holding all pages of the report.
|── [pageName]\                    |Yes      |One folder per page.
|──── visuals\                     |No       |Folder holding all visuals of the page.
|────── [visualName]\              |No       |One folder per visual.
|──────── mobile.json              |No       |Visual mobile layout metadata, such as mobile position and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/visualContainerMobileState).
|──────── visual.json              |Yes      |Visual metadata, such as position and formatting, query.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/visualContainer).
|──── page.json                    |Yes      |Page metadata, such as page level filters and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/page).
|── pages.json                     |No       |Pages metadata, such as page order and active page.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/pagesMetadata).
|version.json                      |Yes      |PBIR file version, among other factors, determines the required files to be loaded.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/versionMetadata)
|reportExtensions.json             |No       |Report extensions, such as report level measures.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/reportExtension)
|report.json                       |Yes      |Report metadata, such as report level filters and formatting.<br/>More information at [schema](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition/report)

> [!IMPORTANT]
> Some report metadata files, such as visual.json or bookmarks.json, can be saved with data values from your semantic model. For instance, if you apply a filter to a visual for the field 'Company' = 'Contoso', the value 'Contoso' will persist as part of the metadata. This also applies to other configurations like slicer selections, matrix custom columns width, and formatting for specific series.

#### PBIR naming convention

All names inside the square brackets ([]) in the preceding table follow a default naming convention but can be renamed to more user-friendly names. By default, pages, visuals, and bookmarks use their report object name as their file or folder name. These object names are initially a 20-character unique identifier, such as '90c2e07d8e84e7d5c026'.

:::image type="content" source="./media/projects-report/pbir-objectname.png" alt-text="Screenshot of PBIR name property.":::

Renaming the 'name' property within each JSON file is supported but might break external references both inside and outside the report. The object name and/or file/folder name must consist of one or more word characters (letters, digits, underscores) or hyphens.

After renaming any PBIR files or folders, you must restart Power BI Desktop. Upon restart, Power BI Desktop will preserve the original file or folder names when saving.

#### Copy report object name

Each object in the report is saved in a separate folder or file, but the name of the folder isn't always obvious. To make this easier, you can copy the name of any report object name (including pages, visuals, bookmarks, and filters) directly from Power BI to your clipboard.

:::image type="content" source="./media/projects-report/computer-ai-generated-report.png" alt-text="Screenshot of a report with an arrow pointing from one of the visuals to the name of its corresponding file.":::

##### [From the desktop](#tab/desktop)

1. Go to **File > Options and settings > Report settings > Report objects** and enable the *Copy object names when right clicking on report objects* setting. This only needs to be done once.

   :::image type="content" source="./media/projects-report/report-objects-check-box.png" alt-text="Screenshot of the report objects report settings.":::

1. Right click on any report object and select *Copy object name*.

   :::image type="content" source="./media/projects-report/copy-object-name.png" alt-text="Screenshot of a desktop report with copy object name selected.":::

With the object name copied to your clipboard, you can easily enter it into the search bar of Windows Explorer or Visual Studio Code to locate or identify the object name within the PBIR folder.

:::image type="content" source="./media/projects-report/search-object-name.png" alt-text="Screenshot of search bar with name of object.":::

##### [From the service](#tab/service)

1. Enable the *Copy object names when right clicking on report objects* setting. This only needs to be done once. You don't need to enable it for each report.

    :::image type="content" source="./media/projects-report/report-settings-service.png" alt-text="Screenshot of the report settings with the switch enabled.":::

1. When editing a report, right click on any report object and select *Copy object name*.

    :::image type="content" source="./media/projects-report/copy-object-name-service.png" alt-text="Screenshot of a service report with copy object name selected.":::

You can use the copied object for identifying file names in PBIR file format, or for performance troubleshooting through Workspace Monitoring or Log Analytics to link the DAX query to a visual in the report.

---

### PBIR Json Schemas

Each PBIR JSON file includes a [JSON schema](https://json-schema.org/) declaration at the top of the document. This schema URL is publicly accessible and can be used to learn more about the available properties and objects for each file. Additionally, it provides built-in IntelliSense and validation when editing with code editors like [Visual Studio Code](https://code.visualstudio.com/).

:::image type="content" source="./media/projects-report/pbir-jsonschema-tooltip.png" alt-text="Screenshot of prompt PBIR JSON Schema tooltip.":::

The schema URL also defines the version of the document, which is expected to change as the report definition evolves.

All the JSON schemas are published [here](https://github.com/microsoft/json-schemas/tree/main/fabric/item/report/definition).

### PBIR annotations

You can include annotations as name-value pairs within the report definition for each `visual`, `page` and `report`. While Power BI Desktop ignores these annotations, they can be valuable for external applications like scripts. 

For instance, you could specify the defaultPage for the report at the `report.json` file, which can then be utilized by a deployment script.

```json
{
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/report/1.0.0/schema.json",
  "themeCollection": {
    "baseTheme": {
      "name": "CY24SU06",
      "reportVersionAtImport": "5.55",
      "type": "SharedResources"
    }
  },
  ...
  "annotations": [
    {
      "name": "defaultPage",
      "value": "c2d9b4b1487b2eb30e98"
    }
  ]
}
```

### External changes to PBIR files

You can edit the PBIR JSON files using a code editor like [Visual Studio Code](https://code.visualstudio.com/) or an external tool, as long as the file obey the JSON schema. Using a wrong property name or type can be easily detected directly in Visual Studio Code:

:::image type="content" source="./media/projects-report/pbir-jsonschema-validation.png" alt-text="Screenshot of prompt PBIR JSON Schema validation.":::

External changes to PBIR content might result in errors when reopening the files in Power BI Desktop. These errors can be of two types:

**Blocking errors** prevent Power BI Desktop from opening the report. These errors help identify the issue and the offending file that must be fixed before reopening:

:::image type="content" source="./media/projects-report/pbir-error-blocking.png" alt-text="Screenshot of prompt PBIR blocking error.":::

Errors such as an invalid schema or missing required properties are considered blocking errors. Those errors can be easily identified by opening the file in Visual Studio Code and inspecting the schema errors.

**Non-blocking errors** don't prevent Power BI Desktop from opening the report and are automatically resolved.

:::image type="content" source="./media/projects-report/pbir-error-nonblocking.png" alt-text="Screenshot of prompt PBIR nonblocking error.":::

Errors such as an invalid *activePageName* configuration are examples of nonblocking errors that are automatically fixed. The warning is necessary to give you the chance to avoid saving the report with the autofix, by that preventing any potential loss of work.

#### Common PBIR errors

**Scenario:** *After rename visual or page folder names, my visual or page no longer appears when opening the report.*

**Solution:** Verify whether the name complies with the [naming convention](#pbir-naming-convention). If it doesn't, Power BI Desktop ignores the file, or folder and treats it as private user files.

**Scenario:** *New report objects are named differently from others. For example, most page folders are named 'ReportSection0e71dafbc949c0853608', while a few are named '1b3c2ab12b603618070b'.*

**Solution:** PBIR adopted a new [naming convention](#pbir-naming-convention) for every object, but it only applies to new objects. When you save an existing report as PBIP, the current names must be preserved to prevent breaking references. If you want consistency, a script a batch rename is allowed.

**Scenario:** *I copied a bookmark file, and upon saving, most of the bookmark configuration was deleted.*

**Solution:** This behavior is intentional, report bookmarks capture the state of a report page along with all its visuals. Since the captured state originates from another report page with different visuals, any invalid visuals are removed from the bookmark configuration. If you also copy the dependent visuals and page, the bookmark maintain its configuration.

**Scenario:** *I copied a page folder from another report and encountered an error stating, "Values for the 'pageBinding.name' property must be unique."*

**Solution:** The pageBinding object is necessary to support drillthrough and page tooltips. Since they might be referenced by other pages, the name must be unique within the report. On the newly copied page, assign a unique value to resolve the error. After June 2024, this situation is no longer an issue because the pageBinding name is a GUID by default.

### PBIR considerations and limitations

PBIR is currently in **preview**. Keep the following in mind:

- PBIR in [Sovereign Clouds](/industry/sovereign-cloud/overview/microsoft-sovereign-cloud) will not be automatically upgraded in the service prior to General Availability. Until then, Sovereign Cloud customers can test their reports in PBIR format in Power BI Desktop by enabling the PBIR preview features.
- Large reports with more than 500 files may experience authoring performance issues (report viewing isn't affected).
- Once a report is converted from PBIR-Legacy to PBIR, it isn't possible to roll it back. Although a backup is created at the moment of conversion.
- Converting a PBIP file to a PBIX file using the "Save As" feature embeds the PBIR report within the PBIX file, carrying over all PBIR limitations to the PBIX.
- [Visual automatic filters](../../create-reports/power-bi-report-filter-types.md#automatic-filters) are persisted to the PBIR `visual.json` file only after the filter pane has been expanded at least once while editing the report.
- Not supported in [Template App workspaces](/power-bi/connect-data/service-template-apps-overview)

PBIR size limitations enforced by the service:

- 1,000 max pages per report.
- 1000 max visuals per page.
- 1,000 max resource package files per report.
- 300-mb max size for all resource package files.
- 300-mb max size of all report files.

> [!IMPORTANT]
> If you reach the limits above, you should consider optimizing your report. See the [Power BI Optimization document](../../guidance/power-bi-optimization.md#power-bi-reports).

[Fabric Git Integration](/fabric/cicd/git-integration/intro-to-git-integration) and [Fabric REST APIs](/rest/api/fabric/articles/item-management/item-management-overview) export reports using the format currently applied in the service. If a report is created or imported into Fabric using the PBIR format, it will be exported in PBIR. Likewise, if a report is PBIR-Legacy, it will be exported in the PBIR-Legacy format. 

## Related content

- [Power BI Desktop project semantic model folder](projects-dataset.md)  
- [Power BI Desktop projects](projects-overview.md)  
