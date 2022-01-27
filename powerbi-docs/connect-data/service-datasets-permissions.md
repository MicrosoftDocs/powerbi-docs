---
title: Dataset permissions
description: Describes dataset permissions and how they are acquired by users.
author: paulinbar
ms.author: painbar
ms.reviewer: ogetchie
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 01/27/2022
LocalizationGroup: Share your work
---
# Dataset permissions

## What are dataset permissions



## How do users acquire dataset permissions?

A  user might acquire dataset permissions in two ways:
* **Implicitly**, via the user's Workspace role
* **Explicitly**, for example, by being granted permissions on the dataset's manage permissions page, or by having a report that uses the dataset shared with them (which might grant them build permission on the dataset).

The table below shows which dataset permissions a user has implicitly based on their workspace role.

|Dataset Permission\Workspace Role  |Admin  |Member  |Contributor  |Viewer |
|-----------------------------------|-------|--------|-------------|-------|
|Read                               |✔️      |✔️       |✔️            |✔️      |
|Build                              |✔️      |✔️       |✔️            |❌      |
|Reshare                            |✔️      |✔️       |❌            |❌      |
|Write                              |✔️      |✔️       |✔️            |❌      |   



|Permission  |Description  |Can be granted explicitly  |
|------------|-------------|---------------------------|
|Read        |Can access reports that read data from the dataset.<br>No enhanced discoverability for report authoring from this dataset.<br>Can't query using XMLA|Yes |
|Build       |Can query using external APIs like XMLA<br>Enhanced discoverability for report authoring from this dataset |Yes        |
|Reshare     |Can assign dataset level permissions (and therefore access) to the dataset |Yes |
|Write       |Can view and modify the dataset metadata |Yes |