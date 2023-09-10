---
title: Manage Premium Per User
description: Learn how to manage and understand how to use Power BI Premium Per User settings in the Admin portal.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.custom: admin-portal
ms.topic: how-to
ms.date: 12/08/2022
LocalizationGroup: Administration
---

# Manage Premium Per User

[Premium Per User (PPU)](../enterprise/service-premium-per-user-faq.yml) is a way to license Premium features on a per user basis. After the first user is assigned a PPU license, associated features can be turned on in any workspace. Admins can manage the auto refresh and dataset workload settings that are shown to users and their default values. For example, access to the XMLA endpoint can be turned off, set to read only, or set to read and write.

[!INCLUDE[Get to the admin settings](../includes/admin-portal-settings.md)]

## PPU settings

You can configure the following PPU settings in the admin portal on the **Premium Per User** tab.

   :::image type="content" source="media/service-admin-portal-premium-per-user/premium-per-user-options.png" alt-text="Screenshot of the Premium per user settings.":::

### Auto refresh

[Automatic refresh](./../create-reports/desktop-automatic-page-refresh.md) enables your active report page to query for new data, during predefined intervals. By default, these settings are turned on. If you turn them off, PPU reports that use automatic refresh and [change detection](./../create-reports/desktop-automatic-page-refresh.md#change-detection) won't get updated automatically.

Use the following settings to override the *automatic refresh* settings in individual reports that reside on the PPU capacity. For example, when the *minimum refresh interval* setting is configured to refresh every 30 minutes, if you have a report that's set to refresh every five minutes, its setting will be overridden and the report will be refreshed every 30 minutes instead.

* **Minimum refresh interval** - Use to specify a minimum value for the automatic refresh for all the reports in the PPU capacity. Power BI service will override any automatic refresh settings that are higher than this setting.

* **Change detection measure** - Use to specify a minimum value for all the reports in the PPU capacity that use [change detection](./../create-reports/desktop-automatic-page-refresh.md#change-detection). Power BI service will override any change detection settings that are higher than this setting.

### Dataset workload settings

[XMLA endpoints](./../enterprise/service-premium-connect-tools.md) allow Microsoft and third-party apps and tools to connect to Power BI datasets. Use this setting to determine if in the PPU capacity XMLA endpoints are turned off, or configured for read only or read and write.

## Next steps

>[!div class="nextstepaction"]
>[About the Admin portal](service-admin-portal.md)

>[!div class="nextstepaction"]
>[Power BI Premium Per User FAQ](../enterprise/service-premium-per-user-faq.yml)

>[!div class="nextstepaction"]
>[Automatic page refresh in Power BI](./../create-reports/desktop-automatic-page-refresh.md)

>[!div class="nextstepaction"]
>[Dataset connectivity with the XMLA endpoint](./../enterprise/service-premium-connect-tools.md)
