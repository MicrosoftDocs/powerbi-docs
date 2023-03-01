---
title: Edit SAP variables in Power BI
description: Learn how to allow users to edit SAP variables and how to edit variables for SAP Business Warehouse or SAP HANA DirectQuery reports.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 11/23/2022
LocalizationGroup: Data from databases
---

# Edit SAP variables in Power BI

Report authors who use SAP Business Warehouse or SAP HANA with DirectQuery can allow end users to edit SAP variables in Power BI Premium and shared workspaces. This article describes the requirements for editing SAP variables, how to enable this feature, and where to edit variables in Power BI Desktop and the Power BI service.

![Screenshot that shows the Edit variables dialog box.](media/service-edit-sap-variables/sap-edit-variables-dialog.png)

## Requirements to edit SAP variables

The following list describes the requirements for editing SAP variables:

- **DirectQuery connection.** You must connect to the SAP data source by using DirectQuery. Import connections aren't supported.

- **Single sign-on (SSO) set up.** You must configure SSO for your gateway for this feature to work. For more information, see [Overview of single sign-on for on-premises data gateways in Power BI](service-gateway-sso-overview.md).

- **Latest gateway version.** Make sure to download the latest gateway or update your existing gateway. For more information, see [What is an on-premises data gateway?](service-gateway-onprem.md)

## Considerations and limitations

- For SAP HANA, the SAP edit variables feature works only with multidimensional models and doesn't work on relational sources.

- Power Query Online isn't available in sovereign clouds, so the edit SAP variables feature also isn't supported in sovereign clouds.

- You can't edit SAP variables in Power BI mobile apps.

- The edit SAP variables feature doesn't work for reports in the **Shared with me** tab of **My Workspace**, or in apps created from V1 workspaces.

## Enable the SAP edit variables feature

To enable the SAP edit variables feature:

1. In Power BI Desktop, connect to an SAP HANA or SAP BW data source with a DirectQuery connection.

1. Go to **File** > **Options and settings** > **Options**, and in the left pane, select **DirectQuery** under **Current File**.

1. Under **DirectQuery options** in the right pane, select the checkbox next to **Allow end users to change SAP variables for this report**.

   ![Screenshot that shows selecting the edit SAP variables option.](media/service-edit-sap-variables/sap-preview-setting-in-desktop.png)

## Edit SAP variables in Power BI Desktop

In Power BI Desktop, you can edit variables by selecting **Edit variables** from the **Transform data** dropdown menu in the ribbon. This feature has been available in Power BI Desktop for a while. Report creators can select variables for the report by using the following dialog box.

![Screenshot that shows the Add items dialog box.](media/service-edit-sap-variables/sap-variables-add-items.png)

## Edit SAP variables in the Power BI service

Once you publish the report to the Power BI service, users can see the **Edit variables** link in the **Filter** pane for the report. The first time you publish the report, it might take up to five minutes before the **Edit variable** link appears.

> [!NOTE]
> If the link doesn't appear, manually refresh the dataset by selecting it from the **Datasets** tab in the workspace and then selecting the **Refresh** icon.

To edit variables:

1. Select **Edit variables** in the **Filter** pane for the report.

   ![Screenshot that shows the Edit variables link in the Filter pane.](media/service-edit-sap-variables/sap-edit-variables-link.png)

1. In the **Edit variables** dialog box, edit and override the variable values. Select the **Reset** button to reset the variables to the values that appeared when you opened the dialog box.

   ![Screenshot that shows the Edit variables dialog box in the Power BI service.](media/service-edit-sap-variables/sap-edit-variables-dialog.png)

Similar to other persistence behaviors in Power BI, any changes users make in the **Edit variables** dialog box persist only for that user. Selecting **Reset to default** in the top menu bar resets the report to its original state, including the variables.

   ![Screenshot that shows Reset to default.](media/service-edit-sap-variables/reset-to-default.png)

Report owners can change the defaults in their published reports in the Power BI service. The owner of a report that uses SAP HANA or SAP BW with the **Edit variables** feature enabled can change the variables in edit mode. When the report owner saves the report, the changed settings become the *new default settings* for that report. Other users who access the report after the report owner makes such changes see the new settings as the defaults.

If you get errors that Power BI can't load data or retrieve data for a visual, or that the data source connection failed, try the following actions to resolve the error:

- In the Power BI service, select **Edit variables**, set default values for the variables, and then save the report.
- In Power BI Desktop, if you no longer want users to be able to edit variables, you can uncheck the option at the report level.

## Next steps

- [Use SAP HANA in Power BI Desktop](desktop-sap-hana.md)
- [DirectQuery and SAP Business Warehouse (BW)](desktop-directquery-sap-bw.md)
- [DirectQuery and SAP HANA](desktop-directquery-sap-hana.md)
- [Use DirectQuery in Power BI](desktop-directquery-about.md)
