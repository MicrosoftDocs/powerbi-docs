<properties 
   pageTitle="Visual Studio Online content pack for Power BI"
   description="Visual Studio Online content pack for Power BI"
   services="powerbi" 
   documentationCenter="" 
   authors="jastru" 
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
   ms.author="jastru"/>
# Visual Studio Online content pack for Power BI

Use the Visual Studio Online content pack for Power BI to gain insights into your git and TFVC team projects. After you make a connection, your data comes to you automatically on a dashboard and in reports. 

**Update**: Power BI now supports Visual Studio Online work item trend and roll-up reporting capabilities. You can now do things like create sprint burn-down charts based on story points, effort, size, or remaining work. Read the [blog about Power BI support for these capabilities](http://blogs.msdn.com/b/visualstudioalm/archive/2015/09/04/general-availability-of-work-item-trend-and-rollup-reporting-in-power-bi.aspx).

Before you start, you’ll need:

-   Access to the Visual Studio Online account with permission to collect the data using the REST API.

-   Permission granted to the “Power BI for VSO” application during initial connection

Connect to the [Visual Studio Online content pack](https://app.powerbi.com/getdata/services/visual-studio-online) for Power BI.

Having trouble logging in? Skip to Authentication Troubleshooting

## Import data from your Visual Studio Online project  
1.  Select **Get Data** at the bottom of the left navigation pane.  
    ![](media/powerbi-content-pack-visual-studio-online/PBI_GetData.png) 

2.  In the Services box, select Get.  
    ![](media/powerbi-content-pack-visual-studio-online/PBI_GetServices.png) 

3.  Select the **Visual Studio Online** content pack and click **Connect**.     
    ![](media/powerbi-content-pack-visual-studio-online/PBI_VSOConnect.png)

4.  Enter information about your Visual Studio Online account.  
    ![](media/powerbi-content-pack-visual-studio-online/PBI_VSOSignIn.png)

    Your account name is the front of your URL to visualstudio.com:    
    ![](media/powerbi-content-pack-visual-studio-online/URLimage.png)

    Your Project name is the name you see at the top of every page in VSO:  
	![](media/powerbi-content-pack-visual-studio-online/Projectimage.png)

    For more information, see: <https://www.visualstudio.com/get-started/setup/connect-to-visual-studio-online-vs>

    >**Note:**  
    >You can use wildcards to select multiple projects. For example, you can select all projects by entering just “\*”, or all projects that start with “Azure” by entering “Azure\*”.

5.  Authenticate with Visual Studio Online using oAuth2. You may see a VSO sign-in dialog box as a result.  
    ![](media/powerbi-content-pack-visual-studio-online/importantIcon.png)  

	>**Important:**  
	>Some Visual Studio Online deployments don't support oAuth2.  Follow the guidance in the Authentication Troubleshooting section if sign-in fails.

    ![](media/powerbi-content-pack-visual-studio-online/PBI_VSOSignIn2.png)

6.  Follow the Visual Studio Online authentication screens to grant the Visual Studio content pack for Power BI permission to your team project data.   
    ![](media/powerbi-content-pack-visual-studio-online/VSOAuthorizeApp450.png)

    This connects Power BI with Visual Studio Online and allows Power BI to connect to the data.  The data will be refreshed once per day, by default.  

7.  After you connect to your Visual Studio Online project, you see a new dashboard, report, and dataset in the left navigation pane. New items are marked with a yellow asterisk \*.  
![](media/powerbi-content-pack-visual-studio-online/VisualStudioOnline800px.png) 

You can customize the dashboard to show the data the way you want to see it. You can ask a question in Q&A to investigate your data or click a tile to open the underlying report and change the tiles in the dashboard.

Visual Studio Online in Power BI provides a variety of tables and fields for your reporting. The full list of what is included in the content pack can be found here:   <https://www.visualstudio.com/get-started/report/vso-pbi-whats-available-vs>

To disconnect Power BI and remove its authorization to access your Visual Studio Online account, you can Revoke access in Visual Studio Online. See <https://www.visualstudio.com/get-started/setup/change-application-access-policies-vs>.

## Authentication troubleshooting  
When you attempt to login to your Visual Studio Online, you may receive a Login failed message.  
![](media/powerbi-content-pack-visual-studio-online/loginerror.png)

There are two common reasons why you may not be able to authenticate successfully:

1) You are signed in with a personal account, rather than your work or school account

2) Your Visual Studio Online deployment does not support oAuth 

**Signing in with your work or school account**

If you see this issue, it may mean that you’re already authenticated with Visual Studio Online under a different account than the account you’re trying to load data from – for example, if you have connected to Visual Studio Online with a personal Microsoft account, and connected to PowerBI with a work or school account.

To resolve this:

-   Cancel out of the configuration dialog

-   Sign out of Visual Studio Online under your personal account

-   Sign into Visual Studio Online using your work or school account

-   Restart the “Get data” process above 


Connecting with your work or school account (Azure Active Directory / AAD):  
![](media/powerbi-content-pack-visual-studio-online/vsologinscreen.png)

If you see this dialog, and you want to connect with your work or school account (Azure Active Directory), make sure to click the link on the left to sign in with that account – do not provide your AAD credentials on the right hand side, as that is expecting a Microsoft account (your personal account).

**Visual Studio Online deployments that do not support oAuth2**

Your VSO administrator may have disabled oAuth for your Visual Studio Online deployment.  When this happens you will not be able to use the Visual Studio content pack for Power BI at this time. 