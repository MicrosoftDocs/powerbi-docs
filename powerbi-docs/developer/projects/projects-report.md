---
title: Power BI Desktop project report folder
description: Learn about the Power BI Desktop project report folder.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 01/31/2024
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
- [datasetDiagramLayout.json](#datasetdiagramlayoutjson)
- [definition.pbir](#definitionpbir)<sup>[1](#required)</sup>
- [mobileState.json](#mobilestatejson)
- [report.json](#reportjson)<sup>[1](#required)</sup>
- [item.config.json](#itemconfigjson)
- [item.metadata.json](#itemmetadatajson)

<a name="required">1</a> - This file is required.

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

#### datasetDiagramLayout.json

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

Defines a report including visuals, page layout, and intended interactions. During **preview**, this file doesn't support external editing.

#### item.config.json

Identifies the folder as a source control representation of a service item. To learn more, see [Git integration source code format - Config file](/fabric/cicd/git-integration/source-code-format#config-file).

For more information, refer to the [item.config.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/common/item.config.md).

#### item.metadata.json

Contains attributes that define the item. To learn more, see [Git integration source code format - Metadata file](/fabric/cicd/git-integration/source-code-format#metadata-file)

For more information, refer to the [item.metadata.json schema document](https://github.com/microsoft/powerbi-desktop-samples/tree/main/item-schemas/common/item.metadata.md).

## Related content

- [Power BI Desktop project semantic model folder](projects-dataset.md)  
- [Power BI Desktop projects](projects-overview.md)  
