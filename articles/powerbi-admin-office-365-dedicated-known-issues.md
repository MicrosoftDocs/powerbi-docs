<properties 
   pageTitle="Support for Office 365 dedicated customers - known issues"
   description="Support for Office 365 dedicated customers - known issues"
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

# Support for Office 365 dedicated customers - known issues  
[← Troubleshooting](https://support.powerbi.com/knowledgebase/topics/65779-troubleshooting)

Power BI is now supported for Office 365 Dedicated customers.  If you are an O365 Dedicated customer, you can sign in with an account from that tenant and use Power BI. There are two known issues currently.

## Groups  
When selecting **Members** or **Calendar** in the Group context menu, you will be redirected to the Mail app instead.  **Files** and **Conversations** work as expected.  
![](media/powerbi-admin-office-365-dedicated-known-issues/group-menu.png)

### iPhone App - sign in with vanity domain leads to error  
When you sign in, on the iPhone app, using a login with a vanity domain, you may encounter an error.

*Sign In error*  
*An unexpected internal error occurred. Please try again.*

To work around this issue, sign in with the email address listed when you click on the user icon within the Power BI service instead of with the vanity domain.  
![](media/powerbi-admin-office-365-dedicated-known-issues/sign-in-address.png)