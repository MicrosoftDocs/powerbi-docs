<properties 
   pageTitle="Office 365 dedicated - known issues"
   description="Support for Office 365 dedicated customers - known issues. This topics describes issues specific to an Office 365 Dedicated customer. This includes limitations to the group feature as well as the iPhone app with vanity domains."
   services="powerbi" 
   documentationCenter="" 
   authors="guyinacube" 
   manager="mblythe" 
   editor=""
   tags=""/>
 
<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="12/08/2015"
   ms.author="asaxton"/>

# Support for Office 365 dedicated customers - known issues  

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