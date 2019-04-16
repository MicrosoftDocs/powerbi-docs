---
title: How to refresh your Xero content pack credentials
description: If you use the Xero Power BI content pack, you may have experienced a problem with the content pack’s daily refresh due to a recent Power BI service incident.
author: SarinaJoan
manager: kfile
ms.reviewer: kayu

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 08/10/2017
ms.author: sarinas

LocalizationGroup: Troubleshooting
---
# How to refresh your Xero content pack credentials if refresh failed
If you use the Xero Power BI content pack, you may have experienced some problems with the content pack’s daily refresh due to a recent Power BI service incident.

You can see if your content pack refreshed successfully by checking the last refresh status for your Xero dataset as shown in the screenshot below.

![](media/service-refresh-xero-credentials/powerbi-xero-refresh-failed.png)

If you do see that refresh failed as shown above, please follow these steps to renew your content pack credentials.

1. Click the ellipsis (...) next to your Xero dataset, then click **Schedule refresh**. This opens the settings page for the Xero content pack.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-schedule-refresh.png)
2. In the **Settings for Xero** page, select **Data source credentials** > **Edit credentials**.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-settings-page.png)
3. Enter your organization’s name > **Next**.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-configure.png)
4. Sign in with your Xero account.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-welcome.png)
5. Now that your credentials are updated, let’s make sure the refresh schedule is set to run daily. Check that by clicking the ellipsis (...) next to your Xero dataset, then clicking **Schedule refresh** again.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-refresh-schedule.png)
6. You can also choose to refresh the dataset immediately. Click the ellipsis (...) next to your Xero dataset, then click **Refresh now**.
   
    ![](media/service-refresh-xero-credentials/powerbi-xero-refresh-now.png)

If you are still having refresh issues, please don’t hesitate to reach out to us at [http://support.powerbi.com](http://support.powerbi.com) 

To learn more about the Xero content pack for Power BI, please visit the [Xero content pack help page](service-connect-to-xero.md).

### Next steps
* More questions? [Try the Power BI Community](http://community.powerbi.com/)

