---
title: How to refresh your Xero content pack credentials
description: If you use the Xero Power BI content pack, you may have experienced a problem with the content pack’s daily refresh due to a recent Power BI service incident.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 08/11/2017
LocalizationGroup: Troubleshooting
---
# How to refresh your Xero content pack credentials if refresh failed
If you use the Xero Power BI content pack, you may have experienced some problems with the content pack’s daily refresh due to a recent Power BI service incident.

You can see if your content pack refreshed successfully by checking the last refresh status for your Xero dataset as shown in the screenshot below.

![Screenshot of the Xero dialog, showing the refresh status for your Xero dataset.](media/service-refresh-xero-credentials/powerbi-xero-refresh-failed.png)

If you do see that refresh failed as shown above, please follow these steps to renew your content pack credentials.

1. Click **More options** (...) next to your Xero dataset, then click **Schedule refresh**. This opens the settings page for the Xero content pack.
   
    ![Screenshot of the Xero dialog, showing the Schedule Refresh selection.](media/service-refresh-xero-credentials/powerbi-xero-schedule-refresh.png)
2. In the **Settings for Xero** page, select **Data source credentials** > **Edit credentials**.
   
    ![Screenshot of the Xero Settings dialog, showing the settings for Xero with Edit credentials selected.](media/service-refresh-xero-credentials/powerbi-xero-settings-page.png)
3. Enter your organization’s name > **Next**.
   
    ![Screenshot of the Configure Xero dialog, showing the Organization's name.](media/service-refresh-xero-credentials/powerbi-xero-configure.png)
4. Sign in with your Xero account.
   
    ![Screenshot of the Xero sign in dialog, showing how to sign into your Xero account.](media/service-refresh-xero-credentials/powerbi-xero-welcome.png)
5. Now that your credentials are updated, let’s make sure the refresh schedule is set to run daily. Check that by clicking **More options** (...) next to your Xero dataset, then clicking **Schedule refresh** again.
   
    ![Screenshot of the Schedule Refresh dialog, showing the refresh frequency and time zone.](media/service-refresh-xero-credentials/powerbi-xero-refresh-schedule.png)
6. You can also choose to refresh the dataset immediately. Click **More options** (...) next to your Xero dataset, then click **Refresh now**.
   
    ![Screenshot of the Xero dialog, showing the Refresh Now selected.](media/service-refresh-xero-credentials/powerbi-xero-refresh-now.png)

If you are still having refresh issues, please don’t hesitate to reach out to us at [https://support.powerbi.com](https://support.powerbi.com) 

To learn more about the Xero content pack for Power BI, please visit the [Xero content pack help page](service-connect-to-xero.md).

### Next steps
* More questions? [Try the Power BI Community](https://community.powerbi.com/)

