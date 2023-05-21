---
title: Sensitivity label inheritance from data sources in Power BI
description: Learn how Power BI datasets can inherit sensitivity labels from data sources
author: paulinbar
ms.author: painbar
manager: kfollis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 05/21/2023
LocalizationGroup: Data from files
---
# Sensitivity label inheritance from data sources (preview)

Power BI datasets that connect to sensitivity-labeled data in supported data sources can inherit those labels, so that the data remains classified and secure when brought into Power BI.

Currently supported data sources:
* Excel files stored on OneDrive or SharePoint Online*
* Azure Synapse Analytics (formerly SQL Data Warehouse)
* Azure SQL Database

*Inheritance from Excel files requires specific configuration and isn't supported for files stored behind a gateway, such as files stored locally. See [Sensitivity label inheritance from Excel files](#sensitivity-label-inheritance-from-excel-files) for more detail.

To be operative, [sensitivity label inheritance from data sources must be enabled on the tenant](../admin/service-admin-portal-information-protection.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview).

## Requirements
* The data in the data source must be labeled with sensitivity labels from Microsoft Purview Information Protection.

    For Azure Synapse Analytics and Azure SQL Database, this is accomplished using a two-step Purview flow:
    1. [Automatically apply sensitivity labels to your data](/azure/purview/create-sensitivity-label).
    1. [Classify your Azure SQL data using Azure Purview labels](/azure/sql-database/scripts/sql-database-import-purview-labels).
    * The scope of the labels must be **Files and emails** and **Azure Purview assets**. See [Extending sensitivity labels to Azure Purview](/azure/purview/create-sensitivity-label#extending-sensitivity-labels-to-azure-purview) and [Creating new sensitivity labels or modifying existing labels](/azure/purview/create-sensitivity-label#creating-new-sensitivity-labels-or-modifying-existing-labels).
* [Sensitivity labels must be enabled in Power BI](service-security-enable-data-sensitivity-labels.md).
* All conditions for applying a label must be met.
* The **[Apply sensitivity labels from data sources to their data in Power BI (preview)](../admin/service-admin-portal-information-protection.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview)** tenant admin setting must be enabled. **Note**: This requirement applies to the Power BI service only. In Desktop, a *.pbix* file will inherit the label from the data source even if the tenant admin setting is off. However, after publishing to the service, upon refresh, changes to the label in the data source will only be inherited by the report and dataset if the setting is enabled. 

## Inheritance behavior
* In the Power BI service, when the dataset is connected to the data source, Power BI inherits the label and applies it automatically to the dataset. Subsequently, inheritance occurs upon dataset refresh. In Power BI Desktop, when you connect to the data source via **Get data**, Power BI inherits the label and automatically applies it to the *.pbix* file (both the dataset and report). Subsequently inheritance occurs upon refresh. 
* If the data source has sensitivity labels of different degrees, the most restrictive is chosen for inheritance. In order to be applied, that label (the most restrictive) must be published for the dataset owner.
* Labels from data sources never overwrite manually applied labels.
* Less restrictive labels from the data source never overwrite more restrictive labels on the dataset.
* In Desktop, if the incoming label is more restrictive than the label that is currently applied in Desktop, a banner will appear that recommends to the user to apply the more restrictive label.
* Dataset refresh will succeed even if for some reason the label from the data source isn't applied.

>[!NOTE]
> No inheritance takes place if the dataset owner is not authorized to apply sensitivity labels in Power BI, or if the specific label in question has not been published for the dataset owner.

## Sensitivity label inheritance from Excel files

Sensitivity label inheritance from an Excel file is supported when all of the following are true:

* The Excel file is stored in OneDrive or SharePoint Online.
* The connection to the Excel file was established in Power BI Desktop using the web connector, as described in [Use OneDrive for work or school links in Power BI Desktop](../connect-data/desktop-use-onedrive-business-links.md). The process described there applies to both OneDrive and SharePoint Online.
* The authentication credentials for the dataset created in the service after publishing are properly configured, also as described in the above article.

## Considerations and limitations

* Inheritance from data sources is supported only for datasets with enhanced metadata. See [Using enhanced dataset metadata](../connect-data/desktop-enhanced-dataset-metadata.md) for more information.
* Inheritance from data sources is supported only for datasets using the Import data connectivity mode. Live connection and DirectQuery connectivity isn't supported.
* Inheritance from data sources isn't supported in connections via gateways or Azure Virtual Network (VNet). This means that inheritance from an Excel file located on a local machine won't work, because this requires a gateway. 

## Next steps
* [Enable sensitivity label inheritance from data sources](../admin/service-admin-portal-information-protection.md#apply-sensitivity-labels-from-data-sources-to-their-data-in-power-bi-preview)
* [Sensitivity label overview](service-security-sensitivity-label-overview.md)