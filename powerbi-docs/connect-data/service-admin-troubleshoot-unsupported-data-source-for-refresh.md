---
title: Troubleshooting unsupported data source for refresh
description: Learn how to troubleshoot unsupported data source for refresh message in Power BI Desktop. This issue happens when the data source isn’t supported for refresh.
author: davidiseminger
ms.author: davidi
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: troubleshooting
ms.date: 11/10/2023
ms.custom: ''
LocalizationGroup: Troubleshooting
---
# Troubleshooting unsupported data source for refresh

You might see an error when trying to configure a semantic model for scheduled refresh.

```output
You cannot schedule refresh for this semantic model because it gets data from sources that currently don't support refresh.
```

This issue happens when the data source you used, within Power BI Desktop, isn't supported for refresh. You need to find the data source that you're using and compare that against the list of supported data sources at [Refresh data in Power BI](refresh-data.md).

## Find the data source

If you aren't sure what data source was used, you can find that using the following steps within Power BI Desktop.

1. In Power BI Desktop, make sure you are on the **Report** pane.

   ![Screenshot shows the Power BI Desktop report pane.](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-report-pane.png)

2. Select **Transform data** from the ribbon bar.

   ![Screenshot shows the Transform data option of the Home ribbon where you can edit queries.](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-edit-queries.png)

3. Select **Advanced Editor**.

   ![Screenshot shows the Advance editor option of Power Query Editor.](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-advanced-editor.png)

4. Make note of the provider listed for the source. In this example, the provider is **ActiveDirectory**.

   ![Screenshot shows the Advanced Editor with the source provider highlighted.](media/service-admin-troubleshoot-unsupported-data-source-for-refresh/tshoot-provider.png)

5. Compare the provider with the list of supported data sources found in [Power BI data sources](power-bi-data-sources.md).

> [!NOTE]
> For refresh issues related to dynamic data sources, including data sources that include hand-authored queries, see [Refresh and dynamic data sources](refresh-data.md#refresh-and-dynamic-data-sources).

## Related content

- [Data Refresh](refresh-data.md)
- [Power BI Gateway - Personal](service-gateway-personal-mode.md)
- [On-premises data gateway](service-gateway-onprem.md)
- [Troubleshooting the On-premises data gateway](service-gateway-onprem-tshoot.md)
- [Troubleshooting the Power BI Gateway - Personal](service-admin-troubleshooting-power-bi-personal-gateway.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
