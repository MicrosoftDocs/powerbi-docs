---
title: Power BI Desktop Developer Mode - JSON Schemas 
description: Learn about Power BI Desktop Developer Mode - JSON Schemas 
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice:
ms.topic: conceptual
ms.date: 01/03/2024
---

# Power BI Desktop Developer Mode - JSON Schemas

## Overview

???

## Schema locations

The public URL for these schemas are found in: `https://developer.microsoft.com/json-schemas`

> [!NOTE]
> You can't access the schemas directly from the above URL. They are just hosted there based on the folder structure in this repository. Tools point automatically to the exact schema files as needed.

Instructions on how to publish: JsonPublishing.docx (sharepoint-df.com) 

## Schema URLs

The schema URLs are organized into four parts:

* Root namespace
* Feature namespace (can have multiple levels)
* Version number
* File name

The following examples show valid schema URLs:

* /fabric/item/report/definition/visual/1.0/schema.json
* /fabric/item/report/definition/bookmarkl/1.5/schema.json
* /fabric/item/report/definitionPbir/1.0/schema.json

## Folder structure

|       Root    |                Feature           |      Version  |          File     |
|:-------------:|:--------------------------------:|:-------------:|:-----------------:|
|      /fabric  |                                  |               |                   |
|               |     /pbip                        |               |                   |
|               |     /pbipProperties              |     /1.0      |     /schema.json  |
|               |     /gitIntegration              |               |                   |
|               |     /platformProperties          |     /1.0      |     /schema.json  |
|               |     /item/report                 |               |                   |
|               |     /definition                  |               |                   |
|               |     /visual                      |     /1.0      |     /schema.json  |
|               |                                  |     /2.0      |     /schema.json  |
|               |     /page                        |     /1.0      |     /schema.json  |
|               |     /report                      |     /1.0      |     /schema.json  |
|               |     /definitionPbir              |     /1.0      |     /schema.json  |
|               |     /localSettings               |     /1.0      |     /schema.json  |
|               |     /theme                       |     /2.115    |     /schema.json  |
|               |                                  |     /2.116    |     /schema.json  |
|               |     /item/semanticModel          |               |                   |
|               |     /definitionPbiSemanticModel  |     /1.0      |     /schema.json  |
|               |     /localSettings               |     /1.0      |     /schema.json  |
|               |     /editorSettings              |     /1.0      |     /schema.json  |
|               |     /datasetDiagram              |     /1.0      |     /schema.json  |
|               |                                  |               |                   |

* Allow easy view all the versions of a certain feature (e.g. report/visual)

* All files are named *schema.json*. Though this method is problematic for copy & paste in file explorer but avoids name duplication: namespace and file name

* Why version on folder and not in the file name? 

  * Allows for a feature to have more than one file, for example the visual could be composed by two json schemas and all under the same version. Version 1 has one json schema and version 2 has two json schemas. 

  * Avoid ending up with a “messy” folder with mix of files in different versions 

  * Easily add markdown documentation files next to the schema 

* The schema version should describe and govern the content of the file and not the folder content, if its required to have a version for file content it must be a version property in the file as a property (for example, definition.pbir and definition.pbidataset must have a version property to describe the folder “file” format) 

## Rules

The following naming conventions can be used in the JSON schema names:

* Camel case

* Dashes

The following characters are not allowed:

* Underscores

* Dots

## Syntax examples

definition.pbir

```json
{ 
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definitionPbir/1.0/schema.json", 
  "datasetReference": { 
    "byPath": { 
      "path": "../Sales.Dataset" 
    }, 
    "byConnection": null 
  } 
} 
```

Page.json

```json
{ 
  "$schema": "https://developer.microsoft.com/json-schemas/fabric/item/report/definition/page/1.5/schema.json", 
  "name": "Page1", 
  "displayName": "Page 1", 
  "displayOption": "FitToPage", 
  "height": 600, 
  "width": 800, 
  … 
} 
```
