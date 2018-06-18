---
title: Configure mobile apps with Microsoft Intune
description: How to configure the Power BI Mobile apps with Microsoft Intune. This includes how to add, and deploy, the application. And, how to create the mobile application policy to control security.
author: mgblythe
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-admin
ms.topic: conceptual
ms.date: 06/28/2017
ms.author: mblythe

LocalizationGroup: Administration
---
# Configure mobile apps with Microsoft Intune
Microsoft Intune enables organizations to manage devices and applications. The Power BI mobile applications, for iOS and Android, integrate with Intune to allow you to manage the application on your devices, and to control security. Through configuration policies, you can control items like requiring an access pin, controlling how data is handled by the application and even encrypting application data when the app is not in use.

## General mobile device management configuration
This article is not meant as full configuration guide for Microsoft Intune. If you are just now integrating with Intune, there are a few things you will want to make sure you have setup. [Learn more](https://technet.microsoft.com/library/jj676587.aspx)

Microsoft Intune can co-exist with Mobile Device Management (MDM) within Office 365. [Learn more](https://blogs.technet.microsoft.com/configmgrdogs/2016/01/04/microsoft-intune-co-existence-with-mdm-for-office-365/)

This article assumes that Intune is configured properly and you have devices enrolled with Intune. If you are co-existing with MDM, the device will show enrolled within MDM, but is available to manage within Intune.

> [!NOTE]
> After your organization has configured Microsoft Intune MAM, if you use the Power BI mobile app on an iOS or Android device, then background data refresh is turned off. The next time you enter the app, Power BI refreshes the data from the Power BI service on the web.
> 
> 

## Step 1: Get the url for the application
Before we create the application within Intune, we need to get the urls for the apps. For iOS, we will get this from iTunes. For Android, you can get it from the Power BI mobile page.

Save the url, as you will need it when we create the application.

### iOS
To get the app url for iOS, we will need to get it from iTunes.

1. Open iTunes.
2. Search for *Power BI*.
3. You should see **Microsoft Power BI** listed under **iPhone Apps** and **iPad Apps**. You can use either, as you will get the same url.
4. Select the **Get** drop down and select **Copy Link**.
   
    ![](media/service-admin-mobile-intune/itunes-url.png)

It should look similar to the following.

    https://itunes.apple.com/us/app/microsoft-power-bi/id929738808?mt=8

### Android
You can get the url to Google Play from the [Power BI mobile page](https://powerbi.microsoft.com/mobile/). Clicking on the **Download from Google Play** icon will take you to the app page. You can copy the URL from the browser address bar. It should look similar to the following.

    https://play.google.com/store/apps/details?id=com.microsoft.powerbim

## Step 2: Create a mobile application management policy
The mobile application management policy allows you to enforce items like an access pin. You can create one within the Intune portal. 

You can create the application, or the policy first. The order in which they are added doesn't matter. They will just need to both exist for the deploy step.

1. Select **Policy** > **Configuration Policies**.
   
    ![](media/service-admin-mobile-intune/intune-policy.png)
2. Select **Add...**.
3. Under **Software** you can select Mobile Application Management for either Android or iOS. To get started quickly, you can select **Create a policy with the recommended settings**, or you can create a custom policy.
4. Edit the policy to configure the restrictions you want on the application.

## Step 3: Create the application
The application is a reference, or package, that is saved into Intune for deployment. We will need to create an application and reference the app url that we got from either Google Play or iTunes.

You can create the application, or the policy first. The order in which they are added doesn't matter. They will just need to both exist for the deploy step.

1. Go to the Intune portal and select **Apps** from the left menu.
2. Select **Add App**. This will launch the **Add Software** application.

### iOS
1. Select **Managed iOS App from the App Store** from the drop down.
2. Enter the app url, that we got from [Step 1](#step-1-get-the-url-for-the-application), and select **Next**.
   
    ![](media/service-admin-mobile-intune/intune-add-software-ios1.png)
3. Provide a **Publisher**, **Name** and **Description**. You can optionally provide an **Icon**. The **Category** is for the Company Portal app. Once you are done, select **Next**.
4. You can decide if you want the publish the app as **Any** (default), **iPad** or **iPhone**. By default it will show **Any** and will work for both device types. The Power BI app is the same url for both iPhone and iPad. Select **Next**.
5. Select **Upload**.

> [!NOTE]
> You may not see it show up in the app list until you refresh the page. You can click on **Overview** and back to **Apps** to get the page to reload.
> 
> 

![](media/service-admin-mobile-intune/intune-add-software-ios2.png)

### Android
1. Select **External Link** from the drop down.
2. Enter the app url, that we got from [Step 1](#step-1-get-the-url-for-the-application), and select **Next**.
   
    ![](media/service-admin-mobile-intune/intune-add-software-android1.png)
3. Provide a **Publisher**, **Name** and **Description**. You can optionally provide an **Icon**. The **Category** is for the Company Portal app. Once you are done, select **Next**.
4. Select **Upload**.

> [!NOTE]
> You may not see it show up in the app list until you refresh the page. You can click on **Overview** and back to **Apps** to get the page to reload.
> 
> 

![](media/service-admin-mobile-intune/intune-add-software-android2.png)

## Step 4: Deploy the application
After you have added the application, you will need to deploy it so that it is available to your end users. This is the step where you will bind the policy you created with the app.

### iOS
1. On the apps screen, select the app you created. Then select the **Manage Deployment...** link.
   
    ![](media/service-admin-mobile-intune/intune-deploy-ios1.png)
2. In the **Select Groups** screen, you can choose which groups you want to deploy this app to. Select **Next**.
3. In the **Deployment Action** screen, you can choose how you want to deploy this app. Selecting **Available Install**, or **Required Install**, will make the app available in the Company Portal for users to install on-demand. After you are done making your selection, select **Next**.
   
    ![](media/service-admin-mobile-intune/intune-deploy-ios2.png)
4. In the **Mobile App Management** screen, you can select the Mobile App Management policy that we created in [Step 2](#step-2-create-a-mobile-application-management-policy). It will default to the policy you made, if that is the only iOS policy available. Select **Next**.
   
    ![](media/service-admin-mobile-intune/intune-deploy-ios3.png)
5. In the **VPN Profile** screen, you can select a policy if you have one for your organization. It defaults to **None**. Select **Next**.
6. In the **Mobile App Configuration** screen, you can select an **App Configuration Policy** if you created one. It defaults to **None**. This is not required. Select **Finish**.

After you have deployed the app, it should show **Yes** for deployed, in the apps page.

### Android
1. On the apps screen, select the app you created. Then select the **Manage Deployment...** link.
   
    ![](media/service-admin-mobile-intune/intune-deploy-android1.png)
2. In the **Select Groups** screen, you can choose which groups you want to deploy this app to. Select **Next**.
3. In the **Deployment Action** screen, you can choose how you want to deploy this app. Selecting **Available Install**, or **Required Install**, will make the app available in the Company Portal for users to install on-demand. After you are done making your selection, select **Next**.
   
    ![](media/service-admin-mobile-intune/intune-deploy-android2.png)
4. In the **Mobile App Management** screen, you can select the Mobile App Management policy that we created in [Step 2](#step-2-create-a-mobile-application-management-policy). It will default to the policy you made, if that is the only Android policy available. Select **Finish**.
   
    ![](media/service-admin-mobile-intune/intune-deploy-android3.png)

After you have deployed the app, it should show **Yes** for deployed, in the apps page.

## Step 5: Install the application on a device
You will install the application through the Company Portal app. If you haven't installed the Company Portal, you can get it through the app store on either iOS or Android platforms. You will sign into the Company Portal with your organizational login.

1. Open the Company Portal app.
2. If you don't see the Power BI app listed as a featured app, select **Company Apps**.
   
    ![](media/service-admin-mobile-intune/intune-companyportal1.png)
3. Select the Power BI app that you deployed.
   
    ![](media/service-admin-mobile-intune/intune-companyportal2.png)
4. Select **Install**.
   
    ![](media/service-admin-mobile-intune/intune-companyportal3.png)
5. If you are on iOS, it will push the app to you. Select **Install** on the push dialog.
   
    ![](media/service-admin-mobile-intune/intune-companyportal5.png)

After it is installed, you will see that it is **Managed by your company**. If you enabled access with a pin, in the policy, you will see the following.

![](media/service-admin-mobile-intune/intune-powerbi-pin.png)

## Next steps
[Configure and deploy mobile application management policies in the Microsoft Intune console](https://technet.microsoft.com/library/dn878026.aspx)  
[Power BI apps for mobile devices](mobile-apps-for-mobile-devices.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)

