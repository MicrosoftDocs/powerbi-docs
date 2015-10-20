<properties 
   pageTitle="What if my data isn't up to date?"
   description="What if my data isn't up to date?"
   services="powerbi" 
   documentationCenter="" 
   authors="v-aljenk" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/16/2015"
   ms.author="v-aljenk"/>

# What if my data isn't up to date?

If your dashboards or reports aren't showing your latest data, here are some things to check.

-   **Make sure you've set up refresh.** Follow [these instructions to set up scheduled refresh or start a one-time "refresh now"](powerbi-refresh-data.md).

-   **Is your data stored in OneDrive?** Power BI checks OneDrive for
    changes to your data once an hour.  If you need the data sooner, you can click "REFRESH NOW", but only once every five minutes. Learn more about [refresh for data in OneDrive](powerbi-service-refresh-excel-data-stored-in-onedrive.md).

-   **Are your tiles out of date?** Tiles for direct query data
    sources are refreshed once every ten minutes.
