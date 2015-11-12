<properties
   pageTitle="Sign up for Power BI service"
   description="Sign up for Power BI service"
   services="powerbi"
   documentationCenter=""
   authors="derrickv"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="11/1/2015"
   ms.author="derrickv"/>

# Sign up for Power BI service

Power BI displays dashboards that are interactive, and can be created and updated from many different data sources in real-time. Just like a dashboard in your car displays important information about your vehicle, such as its speed, its fuel level, or how healthy the engine is, a dashboard in Power BI displays important information about your business.

This article introduces you to how to sign up for a Power BI account.

**Important** Before you sign up for the **Power BI service**, you need an **Azure Active Directory** and an organizational user. To setup **Azure Active Directory** and add an organizational user, see [Create an Azure Active Directory tenant](Create+an+Azure+Active+Directory+tenant.md).

## Sign up for the Power BI service
When you sign up for the **Power BI service**, you must use an organizational user. Once you login to the **Power BI service** for the first time, you will see the **Power BI service** added to your Azure AD.

 1. Sign up for the **Power BI service**.
 2. In the **Power BI service** registration page, enter an **Azure Active Directory**  organizational user. The format is {user name}@{Azure_AD_Name}.onmicrosoft.com. If you do not have an **Azure Active Directory** organizational user,  see [Add a user to your Azure Active Directory](Create+an+Azure+Active+Directory+tenant.md#newuser).

  [![pbi logo](media/powerbi-developer-sign-up-for-power-bi-service/power-bi-logo.png)Sign up for Power BI](https://powerbi.microsoft.com/)

The registration process validates the user and provisions the **Power BI service** in your **Azure Active Directory**. After the **Power BI service** is provisioned, a Power BI tenant is available for a user.

**Note**:  When you sign up for the **Power BI service** for the first time, you might need to wait up to 30 minutes to for the **Power BI service** to be provisioned.

## Next step to create a Power BI app - Register your app
After you sign up for the **Power BI service**, you’ll see the Power BI service added to your Azure AD and can register a client app or web app with the right permissions.

- [Register a client app](powerbi-developer-register-a-client-app.md)
- [Register a web app](powerbi-developer-register-a-web-app.md)
