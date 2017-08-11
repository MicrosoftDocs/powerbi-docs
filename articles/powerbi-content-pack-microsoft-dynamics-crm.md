<properties
   pageTitle="Microsoft Dynamics CRM content pack"
   description="Microsoft Dynamics CRM content pack for Power BI"
   services="powerbi"
   documentationCenter=""
   authors="ajayan"
   manager="erikre"
   backup="maggiesMSFT"
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
   ms.date="08/10/2017"
   ms.author="ajayan"/>

# Microsoft Dynamics CRM content pack for Power BI

The Microsoft Dynamics CRM Online content packs for Power BI allows you to easily access and analyze your data. The content pack uses the OData feed to create a descriptive model, with all the entities and measures needed such as Accounts, Activities, Opportunities, Product, Leads, Users and more. 

Connect to the Dynamics CRM Online [Sales Manager](https://msit.powerbi.com/groups/me/getdata/services/dynamics-crm-sales-manager) or [Service Manager](https://msit.powerbi.com/groups/me/getdata/services/dynamics-crm-customer-service) content packs, or read more about the [Dynamics CRM Online integration](https://powerbi.microsoft.com/integrations/microsoft-dynamicscrm) with Power BI.

Note: this content pack requires **Microsoft Dynamics CRM Online 2016 or later**. More details on [requirements](#Requirements) below.

## How to connect

1.  Select Get Data at the bottom of the left navigation pane.

    ![](media/powerbi-content-pack-microsoft-dynamics-crm/PBI_GetData.png) 

2.  In the **Services** box, select **Get**.

    ![](media/powerbi-content-pack-microsoft-dynamics-crm/PBI_GetServices.png) 

3.  Select **Microsoft Dynamics CRM Sales Manager** or **Microsoft Dynamics CRM Service Manager** and click **Connect**.

    ![](media/powerbi-content-pack-microsoft-dynamics-crm/connect.png)

4.  Provide the Service URL associated with your account.  This will be in the form `https://company.crm.dynamics.com`, see more details [below](#FindingParams).

	![](media/powerbi-content-pack-microsoft-dynamics-crm/params.png)

5.  When prompted, provide your credentials (this step might be skipped if you are already signed in with your browser). For Authentication Method, enter **oAuth2** and click **Sign In**:

    ![](media/powerbi-content-pack-microsoft-dynamics-crm/creds.png)

6.  After connecting, you'll see a dashboard customized for a Sales Manager or Service Manager, populated with your own data:

    ![](media/powerbi-content-pack-microsoft-dynamics-crm/dashboard.png)

**What Now?**

- Try [asking a question in the Q&A box](powerbi-service-q-and-a.md) at the top of the dashboard

- [Change the tiles](powerbi-service-edit-a-tile-in-a-dashboard.md) in the dashboard.

- [Select a tile](powerbi-service-dashboard-tiles.md) to open the underlying report.

- While your dataset will be schedule to refreshed daily, you can change the refresh schedule or try refreshing it on demand using **Refresh Now**

## What's included
The sections below detail what's included for the [Sales Manager](#Sales) and [Service Manager](#Service) content packs.

Note that data in addition is limited based on the security role assigned to the Dynamics CRM Online user .

The content pack is meant to provide operational reporting on near term data with focus on a team or group. Each query is limited to retrieve a maximum of 100K records from Dynamics CRM Online. If this limit is exceeded due to high volume of data in your organization, content pack provisioning will fail as data refresh Dynamics CRM online will be terminated. If your account is too large, please consider connecting through the Power BI Desktop to build a custom solution.

<a name="Sales"></a>
### Sales Manager
This content pack contains key metrics such as:  
-   Won Revenue   
-   Win Rate   
-   Open Revenue   
-   Lost revenue   
-   Expected Revenue  
-   Average Deal Size and more.  

It also contains key charts such as:  
-   Won and Lost Revenue Trend, Won Revenue Vs Estimated Revenue Trend  
-   Won Revenue by various dimensions such as Industry, Region, Territory   
-   Sales Leaders By Revenue, Activities,   
-   Top Accounts, Top Won/Lost Deals,    
-   New Leads Trend, Sales Pipeline and more.   

These metrics and charts help to understand your sales organization performance and analyze sales pipeline across your sales team.

Following table lists the CRM entities available in this content pack and also gives details on the filters applied to each of the entity records.

| CRM Entity |	Filters applied|
|---|---|
|Account  |	All accounts which have related opportunities that have been modified in the last 365 days. |
|Activity |	All activities modified in the last 90 days <br> [modifiedon] > today - 90 days |
|Business Unit |	All business units which are not disabled <br> [isdisabled] = false |
|Lead | 	All leads modified in the last 180 days <br> [modifiedon] > today - 180 days |
|Opportunity | 	All opportunities modified in last 365 days <br> [modifiedon] > today - 365 days |
|Opportunity Product | 	All opportunity products modified in last 365 days <br> [modifiedon] > today - 365 days |
|Product |	All active products <br> [statecode] <> 1 |
|Territory |	All territories |
| User | 	All active users and not delegated admins <br>  [isdisabled] = false and [accessmode] <> 4 |

<a name="Service"></a>
### Service Manager
This content pack contains key metrics such as:  
-   CSAT Percentage   
-   SLA Met percentage   
-   Escalated Cases Percentage   
-   Average Handling Time   
-   Total Resolved Cases  
-   Total Active Cases  
-   Number of Times KB Article Used in cases and more.    

It also contains key charts such as:   
-   Case Volume Trends for Incoming Cases, Resolved Cases, Escalated Cases   
-   Case Volume by various dimensions such as Origin, Location, Priority, Type  
-   Leaders by CSAT percentage, SLA met percentage, Activities, Resolved cases  
-   Most Used and Most viewed KB Articles and more.  
 
These metrics and charts help to understand your support organization performance and analyze active cases workload across your service team and service queues.

Following table lists the CRM entities available in this content pack as well as details on the filters applied to each of the entity records.

| CRM Entity |	Filters applied|
|---|---|
|Account  |	All accounts which have related cases that have been modified in the last 90 days. |
|Activity | All activities modified in the last 90 days <br> [modifiedon] > today - 90 days |  
|Case | All cases modified in the last 90 days <br> [modifiedon] > today - 90 days |  
|Case Resolution Activity | All case resolution activities modified in the last 90 days <br> [modifiedon] > today - 90 days |  
|Contact | All contacts which have related cases that have been modified in the last 90 days. |  
|Knowledge Article | All latest version of knowledge articles  <br> [islatestversion] = true |  
|Knowledge Article Incident | All knowledge article incidents which are modified in the last 90 days <br> [modifiedon] > today - 90 days |  
|Queue |All active queues  <br> [statecode] = 0 |  
|Queue Item | All case related queue items created on the past 365 days  <br> [createdon] > today - 365 days and <br> [objecttypecode] = 112 |  
|User | All active users <br>  [isdisabled] = false |  


<a name="Requirements"></a>
## System requirements

-   A valid Dynamics CRM Online 2016 or later instance (the content pack will not work with an on-premises CRM version). If you do not have 2016 or later

-   An administrator must enable the OData endpoint in the site settings.

-   An account with less than 100k records in any of the tables. Note if the account has access to more than 100k records the import will fail.

<a name="FindingParams"></a>
## Finding parameters

The address of the instance can be found in the URL bar of your browser. It typically has the format: `https://[instance_name].crm.dynamics.com`.

Note: only Dynamics CRM 2016 endpoints are supported in the content pack. The content pack will not work with earlier versions of CRM Online, please use the Power BI Desktop to connect directly to your account.

## Troubleshooting

If you're having trouble connecting, please confirm:  
- you're providing the correct instance URL (check with your admin)  
- the instance is CRM Online 2016  
- the OData endpoint is enabled  

You may also try connecting directly in the PBI Desktop, with the OData URL https://[instance_name].crm.dynamics.com/api/data/v8.0/`.

If you confirm you have Dynamics CRM Online 2016, however you're still hitting issues connecting, please contact your CRM Admin to confirm you have all available updates.

If you do not have CRM Online 2016 or later, please use the Power BI Desktop to connect directly to your account.

If you see an error "Data refresh failed as query exceeded the maximum limit of 100000 records.", please consider connecting directly from the Power BI Desktop or leveraging the CRM solution template.


### See also

[Get started with Power BI](powerbi-service-get-started.md)

[Power BI - Basic Concepts](powerbi-service-basic-concepts.md)
