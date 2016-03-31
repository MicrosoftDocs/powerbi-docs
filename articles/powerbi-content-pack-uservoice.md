<properties 
   pageTitle="UserVoice content pack for Power BI"
   description="UserVoice content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="theresapalmer" 
   manager="mblythe" 
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/08/2016"
   ms.author="tpalmer"/>
   
# UserVoice content pack for Power&nbsp;BI

Tracking and exploring your UserVoice data is easy with Power BI and the UserVoice content pack. Power BI retrieves your data, including tickets, suggestions and satisfaction ratings, then builds an out-of-box dashboard and reports based on that data.

Connect to the [UserVoice content pack](https://app.powerbi.com/getdata/services/uservoice) for Power BI.

Note: An admin account is required to connect to the Power BI content pack. The content pack also leverages the UserVoice API and will contribute usage towards the UserVoice limits. More details below.


1.  Select **Get Data** at the bottom of the left navigation pane.

	![](media/powerbi-content-pack-uservoice/PBI_GetData.png)

2.  In the **Services** box, select **Get**.

	![](media/powerbi-content-pack-uservoice/PBI_GetServices.png) 

3.  Select **UserVoice**, then select **Connect**.

	![](media/powerbi-content-pack-uservoice/Capture1.PNG)

4.  When prompted, enter your UserVoice URL. The URL needs to follow the following pattern exactly https://fabrikam.uservoice.com replacing "fabrikam" with your product or service name. Note that there is no trailing slash at the end and the connection is in http**s**.

	![](media/powerbi-content-pack-uservoice/Capture.PNG)


5.  When prompted, enter your UserVoice credentials and follow the UserVoice authentication process. If you are already signed in to UserVoice in your browser, you may not be prompted for credentials.

	**Note:** You need admin credentials for your UserVoice account.

6.  Grant the Power BI application access to your data by clicking "Allow Access".

	![](media/powerbi-content-pack-uservoice/Capture3.PNG)

7.  Power BI will retrieve your UserVoice data and create a ready-to-use dashboard and report for you. Power BI will retrieve the following data: all your suggestions, all your open tickets, all tickets created in the last 30 days including closed ones and all the user satisfaction ratings.

	![](media/powerbi-content-pack-uservoice/Capture4.png)

8.  What can you do now?
	-   Rename the dashboard: Select the ellipsis (...) next to the UserVoice dashboard \> **Rename**.
	-   Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard.
	-   [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.
	-   Select a tile to [open the underlying report](powerbi-service-dashboard-tiles.md). 

###Troubleshooting

**"Parameter validation failed, please make sure all parameters are valid"**

If you see this error after typing your UserVoice URL. Make sure the following requirements are satisfied:

-  The URL follows exactly this pattern "https://fabrikam.uservoice.com" replacing "fabrikam" with your correct UserVoice URL prefix.

-  Make sure all the letters are lower case.

-  Make sure the URL is in 'http**s**'.

-  Make sure there are no trailing forward slash at the end of the URL.

**"Login failed"**

If you get a "login failed" error after using your UserVoice credentials to login, then the account you are using doesn't have permissions to retrieve the UserVoice data from your account. Verify it is an admin account and try again.

"**Oops something went wrong**"

If you get this error message while the data is being loaded, make sure your UserVoice account hasn't exceeded its monthly APIs usage quota. If all looks good, try connecting again. If the problem persists, please contact Power BI support at [https://community.powerbi.com](https://community.powerbi.com/).

**Other**
The Power BI UserVoice content pack uses UserVoice's APIs to retrieve your data. Make sure you monitor your API usage so that you don't exceed your limit. If you have a lot of data in your UserVoice account, a suggestion to minimize the impact on your API usage is to change the refresh frequency from the current default which is once a day to only refresh on weekdays or every other day depending on your needs. Another suggestion is to have one admin create the content pack and share it with the rest of the team instead of having every admin in your organization create their own putting extra unnecessary load on the APIs

### See also

[Get data in Power BI](powerbi-service-get-data.md)



