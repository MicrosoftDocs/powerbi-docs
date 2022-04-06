---
title: Uploading paginated report with same name fails - known issue
description: When you try to upload a paginated report with the same name as one existing in the current workspace, you will receive an error and the upload will fail.
author: mihart
ms.author: mihart
ms.topic: troubleshooting  
ms.service: powerbi
ms.date: 04/05/2022
ms.custom: known-issue-152
---

# Uploading paginated report with same name fails - known issue

**APPLIES TO:** ✔️ Power BI service

**Status:** Fixed as of April 5, 2022

**Problem area:** Publish Content

## Description of problem

When you try to upload a paginated report with the same name as one existing in the current workspace, you will receive an error and the upload will fail.

## Symptoms

The error you receive may be similar to: </br>
> **Unable to upload paginated report** </br>
> ReportWithDisplayNameForTheModelExists </br>
> Please try again later or contact support. If you contact support, please provide these details. </br>

or: </br>
> **A paginated report with the same name already exists, replace it or cancel options** </br>

## Solutions and workarounds

Try uploading the paginated report again, which should successfully trigger the replace flow.

## Next steps

- [About known issues](../../power-bi-known-issues.md)
