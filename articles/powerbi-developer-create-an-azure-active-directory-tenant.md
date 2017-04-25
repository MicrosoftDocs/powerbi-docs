<properties
   pageTitle="Create an Azure Active Directory tenant"
   description="Create an Azure Active Directory tenant"
   services="powerbi"
   documentationCenter=""
   authors="guyinacube"
   manager="erikre"
   backup=""
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
   ms.date="04/12/2017"
   ms.author="asaxton"/>

# Create an Azure Active Directory tenant

Using the Power BI REST API, you can create a Power BI app in any platform that supports calling REST operations. However, before you get started creating a Power BI app, you need an **Azure Active Directory**, an organizational user, and a [Power BI service account](powerbi-admin-free-with-custom-azure-directory.md).

## Create an Azure Active Directory tenant for a Power BI app

Power BI apps are integrated with **Azure Active Directory** (Azure AD) to provide secure sign in and authorization for your app. To integrate a Power BI app with Azure AD, you register the details about your application with Azure AD by using the Azure Management Portal.

**Important** To sign up for the **Power BI service**, your **Azure Active Directory** must have at least one organizational user. Use your organizational user to [sign up for the Power BI service](powerbi-admin-free-with-custom-azure-directory.md).

<a name="setup"></a>
### Create an Azure Active Directory tenant
Before you get started creating a Power BI app, you need **Azure Active Directory** and an organizational user. Here's how to setup **Azure Active Directory**:

 1. Navigate to https://manage.windowsazure.com and log in with the account that has an Azure subscription.
 2. Click **ACTIVE DIRECTORY** management icon in the left pane.

    ![](media/powerbi-developer-create-an-azure-active-directory-tenant/active-directory.png)

 3. Click **NEW** button at the bottom of the page.
 4. Choose **APP SERVICES** > **ACTIVE DIRECTORY** > **DIRECTORY** > **CUSTOM CREATE**

    ![](media/powerbi-developer-create-an-azure-active-directory-tenant/new-ad.png)

 5. In the **Add directory** page, enter a name and domain name. For country or region choose United States or the country were Power BI is available.

    ![](media/powerbi-developer-create-an-azure-active-directory-tenant/add-directory.png)

 6. Choose OK icon. An Azure Active Directory is created.

<a name="newuser"></a>
### Add a user to your Azure Active Directory tenant
You need an organizational user from your Azure AD to sign up for the **Power BI service**. Once you login to the **Power BI service** for the first time, you’ll see the **Power BI service** added to your Azure AD which will allow you to create Power BI apps with the right permissions. Here's how to add a user to your Azure Active Directory:

1. Navigate to https://manage.windowsazure.com and log in with the account that has an Azure subscription.
2. Click **ACTIVE DIRECTORY** management icon in the left pane.
3. In your **Azure Active Directory**, click **USERS**.

    ![](media/powerbi-developer-create-an-azure-active-directory-tenant/add-ad-user.png)
4. At the bottom of the page, click **ADD USER**. A user account is used to register a Power BI app.
5. In the **Tell us about this user page**:

	1. For **TYPE OF USER**, choose **New user in your organization**.
	2. Enter your **USER NAME**.
	3. Click **Next**.

        ![](media/powerbi-developer-create-an-azure-active-directory-tenant/add-ad-user2.png)

6. In the **user profile** page, enter your **DISPLAY NAME**. Display name is a required field.

	![](media/powerbi-developer-create-an-azure-active-directory-tenant/user-profile.png)

7. Click **Next**. For **ROLE**, you can use **User**.
8. Click **Create** to create a temporary password. The new user is assigned a temporary password that must be changed on first sign in.
9. In the **Get temporary password** page, copy the temporary password, and click **Complete** icon. You use the temporary password when you first login to your AAD.
10. After you click the **Complete** icon, a new Azure AD user is created.

Once you have an **Azure Active Directory** tenant, and an organizational user, you [sign up for Power BI](powerbi-admin-free-with-custom-azure-directory.md).

**Note** When you sign up for the Power BI service, use your organizational user. Once you login to the **Power BI service** for the first time, you will see the **Power BI service** added to your Azure AD.

## See Also

[What is an Azure AD directory?](https://msdn.microsoft.com/library/azure/jj573650.aspx)  
[How to get an Azure Active Directory tenant](https://azure.microsoft.com/documentation/articles/active-directory-howto-tenant/)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)