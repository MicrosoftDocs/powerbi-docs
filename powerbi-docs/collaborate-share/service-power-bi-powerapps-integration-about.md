---
title: About Power BI in Power Apps Solutions
description: Learn about the Power BI integration with Power Apps solutions.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
featuredvideoid: ''
ms.service: powerbi
ms.subservice: pbi-collaborate-share
ms.topic: how-to
LocalizationGroup: Share your work
ms.date: 09/14/2022
---

# About Power BI in Power Apps Solutions (preview)

The Power BI/Power Apps solutions integration enables Power Apps app makers to add Power BI reports and datasets as Dataverse components in Power Apps solutions. When a Power BI report or dataset is added to a Power Apps solution, it will stay connected as the solution is deployed across environments and tenants, and can be seamlessly managed as part of the solutions Application Lifecycle Management process across environments and tenants.

Working in Power Apps, you add Power BI report and dataset components from Power BI workspaces just like any other Dataverse component. When you add a Power BI report, any dependency between the report and the relevant dataset will be detected, and the dependent dataset will be added as a component automatically. Once the report or dataset is added to the solution, the artifacts will be exported and uploaded to Dataverse, and a new dedicated workspace in Power BI will automatically be created to store the artifacts. This dedicated Power BI workspace inherits privileges from several pre-defined roles (see Permission sync between Power Apps environment and Power BI workspace, giving the users in these roles permission in the workspace, thus enabling co-authoring between Power Apps and Power BI. This process ensures that your Power BI reports and datasets can be embedded as a system dashboard or inside forms and will survive deployment across environments and tenants.

Control Power BI dataset parameters from Power Apps
Once you've added Power BI components to a solution, you can configure connectivity across environments using dataset parameters (see Configure Power BI parameters). Every Power BI dataset that includes a dynamic query parameter can be controlled from Power Apps solutions by defining its value with an environment variable, an environment domain, or custom text. This gives you flexibility in controlling data sources on deployment between your dev, test, and production environments. Datasets that connect to Dataverse and don't have existing parameters can automatically be configured to connect to the target environment domain when you deploy.

Power BI components in the Power Apps solutions package
When you export your solution with Power BI components, the Power BI artifacts are stored in the solution format rather than in .pbix files. In the export zip file, there will be a specific package for each Power BI dataset and report in the solution. This means that when you store, version, or deploy a Power Apps solution, the same action will apply to the embedded Power BI reports and datasets.

Solution Customization
You can fully customize Power BI components to fit your exact needs. When you deploy a managed solution, any customizations you make are saved as an additional, unmanaged layer. This enables you to take a managed solution from your own organization, a vendor, or even from AppSource, and adapt it to suit your own analytics needs.

## Next Steps

* [Add live Power BI report pages to PowerPoint](./service-power-bi-powerpoint-add-in-install.md)
* [View and present live Power BI report pages in PowerPoint](./service-power-bi-powerpoint-add-in-view-present.md)
* [Information for Power BI administrators](./service-power-bi-powerpoint-add-in-admin.md)
* [Troubleshoot the Power BI add-in for PowerPoint](./service-power-bi-powerpoint-add-in-troubleshoot.md)
* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)