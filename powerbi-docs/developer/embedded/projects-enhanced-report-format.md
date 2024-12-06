---
title: Create a Power BI report in enhanced report format
description: The Power BI enhanced report format (PBIR) for Power BI Project files (PBIP) provides source-control friendly file formats to enhance development efficiency.
author: maggiesMSFT
ms.author: maggies
ms.reviewer: ruiromano
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/06/2024
LocalizationGroup: Create reports
no-loc:
#customer intent: As a report creator, I want to learn how to use the Power BI enhanced report format (PBIR).
---
# Create a Power BI report in enhanced report format

[!INCLUDE [applies-yes-desktop-no-service](../../includes/applies-yes-desktop-no-service.md)]

The Power BI enhanced report format (PBIR) for Power BI Project files (PBIP) marks a milestone in achieving the primary goal of Power BI Desktop developer mode. It provides source-control friendly file formats to unblock codevelopment and enhance development efficiency.

:::image type="content" source="media/project-enhanced-report-format/power-bi-project-tmdl-pbir.png" alt-text="Diagram of Power BI Project with TMDL and PBIR."lightbox="media/project-enhanced-report-format/power-bi-project-tmdl-pbir.png":::

Power BI Projects (PBIP) support saving the report and semantic model into a folder using source-control friendly formats: 

- PBIR for the report.
- TMDL for the semantic model.

The PBIR file format simplifies tracking changes and resolving merge conflicts. It uses properly formatted JSON and organizes each visual, page, bookmark, and so on, in separate individual files within a folder structure.

:::image type="content" source="media/project-enhanced-report-format/pbir-visual-json.png" alt-text="Screenshot of visual json folder structure."lightbox="media/project-enhanced-report-format/pbir-visual-json.png":::

You can enhance report development efficiency in one of two ways:

- Copy and paste visuals, pages, bookmarks, or files between reports.
- Apply manual or programmatic batch changes to the PBIR files.

Unlike PBIR-legacy format (report.json), PBIR is a publicly documented format. This format allows modifications from non-Power BI applications. Each file has a public JSON schema, which documents each property and lets code editors like Visual Studio Code perform syntax validation while editing. On open, Power BI Desktop validates the changed PBIR files to guarantee successful loading.

## How to enable it

PBIR is currently in preview. You can only create or convert existing Power BI project files to PBIR by using Power BI Desktop. You must first enable the feature in Power BI Desktop preview features.

1. Go to **File** > **Options and settings** > **Options** > **Preview features**.
1. Check the box next to **Store reports using enhanced metadata format (PBIR)**.  

During preview, Fabric Git Integration and Fabric REST APIs continue to use PBIR-legacy (report.json) when exporting the report definitions. However, if the report is imported into Fabric using PBIR format, then both features start exporting the report definition using PBIR format. At general availability (GA), PBIR will become the default report format.

## Limitations 

Initially, the PBIR format has some service restrictions, such as these:

- You can't use subscriptions.
- Mobile views are not displayed in Power BI Apps.
- Can't be deployed with deployment pipelines.  
- Large reports with more than 500 files experience authoring performance issues (report viewing isn't affected), including:
  - Saving in Power BI Desktop
  - Synchronization in Fabric Git Integration

Refer to [PBIR documentation](/power-bi/developer/projects/projects-report#pbir-format) for more details.

## Next steps

- [Power BI embedded analytics overview](embedded-analytics-power-bi.md)
- [The Power BI embedded analytics playground](power-bi-playground.md)
