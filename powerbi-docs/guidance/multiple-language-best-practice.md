---
title: Use best practices to localize Power BI reports
description: Learn about best practices for your multiple-language report projects, such as allowing for text size, and packaging reports.
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Use best practices to localize Power BI reports

When it comes to localizing software, there are some universal principles to keep in mind. The first is to plan for localization from the start of any project. It's harder to add localization support to an existing semantic model ([previously known as a dataset](../connect-data/service-datasets-rename.md)) or report that was initially built without any regard for internationalization or localization.

This fact is especially true with Power BI reports because there are so many popular design techniques that don't support localization. Much of the work for adding localization support to existing Power BI reports involves undoing things that don't support localization. Only after that work can you move forward with design techniques that do support localization.

## Package a semantic model and reports in project files

Before you proceed, you need to decide how to package your semantic model definitions and report layouts for distribution. There are two popular approaches used by content creators who work with Power BI Desktop.

- Single .pbix project file
- Multiple project files with a shared semantic model

For adding multiple-language support to a Power BI solution, choose either of these approaches.

### Single project file

You can package both a report layout and its underlying semantic model definition together. Deploy a reporting solution like this by publishing the project into a Power BI service workspace. If you need to update either the report layout or the semantic model definition, upgrade by publishing an updated version of the .pbix project file.

:::image type="content" source="./media/multiple-language-best-practice/single-pbix-scenario.png" alt-text="Diagram shows a report layout and semantic model definition in a single pbix file.":::

### Shared semantic model

The single project file approach doesn't always provide the flexibility you need. Maybe one team is responsible for creating and updating semantic models while other teams are responsible for building reports. It might make sense to share a semantic model with reports in separate .pbix project files.

:::image type="content" source="./media/multiple-language-best-practice/shared-semantic-model-scenario.png" alt-text="Diagram shows two report layouts in separate files associated with a semantic model definition in a third file that also has an unused report.":::

To use the shared semantic model approach, create one .pbix project file with a semantic model and an empty report, which remains unused. After this semantic model has been deployed to the Power BI service, report builders can connect to it using Power BI Desktop to create report-only .pbix files.

This approach makes it possible for the teams building reports to build .pbix project files with report layouts that can be deployed and updated independently of the underlying semantic model. For more information, see [Connect to semantic models](../connect-data/desktop-report-lifecycle-datasets.md).

## Account for text size

Another important concept in localization is to plan for growth. A label that's 400 pixels wide when displayed in English could require a greater width when translated into another language. If you optimize the width of your labels for text in English, you might find that translations in other languages introduce unexpected line breaks or get cut off. These effects compromise the user experience.

Adding a healthy degree of padding to localized labels is the norm when developing internationalized software. It's essential that you test your reports with each language you plan to support. You need to be sure that your report layouts look the way you expect with any language you choose to support.

## Related content

- [Create multiple-language reports with Translations Builder](translation-builder.md)
