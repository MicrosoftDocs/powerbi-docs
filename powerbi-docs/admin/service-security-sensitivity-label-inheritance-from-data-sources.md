---
title: Sensitivity label inheritance from data sources in Power BI
description: Learn how Power BI datasets can inherit sensitivity labels from data sources
author: paulinbar
ms.author: painbar
manager: rkarlin
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 03/11/2021
LocalizationGroup: Data from files
---
# Sensitivity label inheritance from data sources (preview)

Power BI datasets that connect to sensitivity-labeled data in supported data sources can inherit those labels, so that the data remains classified and secure when brought into Power BI.

Currently supported data sources:
* Azure Synapse Analytics (formerly SQL Data Warehouse)
* Azure SQL Database

To be operative, [sensitivity label inheritance from data sources must be enabled on the tenant](service-admin-portal.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview).

## Requirements
* The data in the data source must be labeled with Microsoft Information Protection labels. This is accomplished using a two-step Purview flow:
    1. [Automatically apply sensitivity labels to your data](/azure/purview/create-sensitivity-label).
    1. [Classify your Azure SQL data using Azure Purview labels](/azure/sql-database/scripts/sql-database-import-purview-labels).
* The scope of the labels must be **Files and emails** and **Azure Purview assets**. See [Extending sensitivity labels to Azure Purview](/azure/purview/create-sensitivity-label#extending-sensitivity-labels-to-azure-purview) and [Creating new sensitivity labels or modifying existing labels](/azure/purview/create-sensitivity-label#creating-new-sensitivity-labels-or-modifying-existing-labels).
* [Sensitivity labels must be enabled in Power BI](service-security-enable-data-sensitivity-labels.md).
* The **[Apply sensitivity labels from data sources to their data in Power BI (preview)](service-admin-portal.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview)** tenant admin setting must be enabled.
* All conditions for applying a label must be met.

## Inheritance behavior
* In the Power BI service, when the dataset is connected to the data source, Power BI inherits the label and applies it automatically to the dataset. Subsequently, inheritance occurs upon dataset refresh in the service. 
* If the data source has sensitivity labels of different degrees, the most restrictive is chosen for inheritance. In order to be applied, that label (the most restrictive) must be published for the dataset owner.
* Labels from data sources never overwrite manually applied labels on datasets.
* Less restrictive labels from the data source never overwrite more restrictive labels on the dataset.
* Dataset refresh will succeed even if for some reason the label from the data source is not applied. 

>[!NOTE]
> No inheritance takes place if the dataset owner is not authorized to apply sensitivity labels in Power BI, or if the specific label in question has not been published for the dataset owner.

## Limitations
* Inheritance from data sources is not currently supported in Power BI Desktop. 
* Inheritance from data sources is not supported for datasets located in classic workspaces.
* Inheritance from data sources is supported only for datasets with enhanced metadata. See [Using enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md) for more information.
* Inheritance from data sources is supported only for datasets using the Import data connectivity mode. Live connection and DirectQuery connectivity is not supported.
* Inheritance from data sources is not supported in connections via gateways or Azure Virtual Network (VNet).

## Next steps
* [Enable sensitivity label inheritance from data sources](service-admin-portal.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview)
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)