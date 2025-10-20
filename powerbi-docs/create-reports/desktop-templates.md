---
title: Create and Use Report Templates in Power BI Desktop
description: Learn how to use Power BI Desktop templates to streamline work by creating a report template for a new report's layout, data model, and queries.
author: JulCsc
ms.author: juliacawthra
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 03/15/2024
LocalizationGroup: Connect to data
---

# Create and use report templates in Power BI Desktop

[!INCLUDE [applies-yes-desktop-no-service](../includes/applies-yes-desktop-no-service.md)]

With **Power BI Desktop**, you can create compelling reports that share insights across your entire organization. With Power BI Desktop **templates**, you can streamline your work by creating a report template, based on an existing template, which you or other users in your organization can use as a starting point for a new report's layout, data model, and queries. Templates in **Power BI Desktop** help jump-start and standardize report creation.

:::image type="content" source="media/desktop-templates/desktop-templates-01.png" alt-text="Screenshot of Power BI Desktop, showing Export options.":::

## Creating report templates

Power BI report templates contain the following information from the report from which they were generated:

- Report **pages**, visuals, and other visual elements.
- The **data model definition**, including the schema, relationships, measures, and other model definition items.
- All **query definitions**, such as queries, query Parameters, and other query elements.

While Power BI Desktop reports use the `.PBIX`  extension, report templates use the file extension `.PBIT`.

To create a report template, select **File > Export > Power BI template** from the menu, which brings up the following window, which prompts you to provide a description for the template. In this example, our description for the template is *Monthly sales report template*.

:::image type="content" source="media/desktop-templates/desktop-templates-02.png" alt-text="Screenshot of the Export template description dialog.":::

When you select **OK**, you're prompted for a file location to store the `.PBIT` template file.

:::image type="content" source="media/desktop-templates/desktop-templates-03.png" alt-text="Screenshot of the Save As dialog where you enter a file location for the exported template.":::

And that's it, your Power BI report template is created in the file location you specified, with the `.PBIT` extension.

> [!NOTE]
> Power BI report template files are smaller than a Power BI Desktop report because templates don't contain any data, just the report definitions themselves. Report metadata can be saved with data values from your semantic model. For example, if you apply a filter to a visual for the field 'Company' = 'Contoso', the value 'Contoso' is persisted as part of the metadata. You can also persist other configurations, such as slicer selections, matrix custom columns width, and formatting for specific series.

## Using report templates

To use a Power BI report template, open it in Power BI Desktop and begin. You can open Power BI report templates in two ways:

- Double-click on any `.PBIT` file to automatically launch Power BI Desktop and load the template
- Select **File > Import > Power BI template** from within Power BI Desktop

:::image type="content" source="media/desktop-templates/desktop-templates-04.png" alt-text="Screenshot of Power BI Desktop, showing Import options.":::

When you open a report template, a dialog might appear. The dialog asks for values for any parameters that are defined in the report the template is based on. For example, if a report analyzes customers based on country or region and has a *Country* parameter to specify the customer base, select a *Country* value from that list. Each list of values are specified when defining the parameter.

:::image type="content" source="media/desktop-templates/desktop-templates-05a.png" alt-text="Screenshot of the Enter Parameters dialog.":::

After any required parameters are provided, you're prompted for the location of the underlying data associated with the report. The current report creator can then connect to data based on their credentials.

:::image type="content" source="media/desktop-templates/desktop-templates-05.png" alt-text="Screenshot of an example parameters dialog.":::

Once the parameters and data are specified, a report is created. This report contains all the pages, visuals, data model items, and queries that are in the report on which the template is based.

That's it. Creating and using report templates in Power BI Desktop enables you to easily reproduce compelling layouts and other report aspects, and share them with others.

## Related content

You might also be interested in learning about **Query Parameters**:

- [Using Query Parameters in Power BI Desktop?](/power-query/power-query-query-parameters)

In addition, there are all sorts of things you can do with Power BI Desktop. For more information on its capabilities, check out the following resources:

- [What is Power BI Desktop?](../fundamentals/desktop-what-is-desktop.md)
- [Query Overview with Power BI Desktop](../transform-model/desktop-query-overview.md)
- [Data Types in Power BI Desktop](../connect-data/desktop-data-types.md)
- [Shape and Combine Data with Power BI Desktop](../connect-data/desktop-shape-and-combine-data.md)
- [Common Query Tasks in Power BI Desktop](../transform-model/desktop-common-query-tasks.md)
