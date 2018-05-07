---
title: Embed Power BI content into an application for your customers
description: Learn how to integrate, or embed, a report, dashboard or tile into a web app using the Power BI APIs for your customers.
services: powerbi
author: markingmyname
ms.date: 05/07/2018
ms.topic: quickstart
ms.service: powerbi
ms.custom: mvc
manager: kfile
#Customer intent: As an ISV developer, I want to embed my report, dashboard or tile into an application so that I can share with customers.
---
# Quickstart: Embed a Power BI report, dashboard or tile into your application using app owns data
In this tutorial you will learn how to embed a report, dashboard or tile into an application when embedding for your customers. This is typically for an ISV scenario. To integrate a report into an application, you use the **Power BI** API, and an Azure Active Directory (AD) authorization **access token** to get a report. Then, you load the report using an embed token. The **Power BI** API provides programmatic access to certain **Power BI** resources.

![Embedded dashboard](media/embed-sample-for-customers/Azure-Portal-031.png)

## Prerequisites
To get started, you need a **Power BI Pro** account and a **Microsoft Azure** account.

* If you're not signed up for **Power BI Pro**, [sign up for a free trial](https://powerbi.microsoft.com/en-us/pricing/) before you begin.
* If you don’t have an Azure subscription, create a [free account](https://azure.microsoft.com/free/?WT.mc_id=A261C142F) before you begin.
* You need to have your own [Azure Active Directory tenant ](create-an-azure-active-directory-tenant.md) setup.
* You need to have [Visual Studio](https://www.visualstudio.com/) installed.

## Setup your embedded analytics development environment

Before you start embedding reports, dashboard, or tiles into your application, you need to make sure your environment is setup to allow for embedding. As part of the setup, you will need to do the following.

### Register an application in Azure Active Directory

You register your application with Azure Active Directory to allow your application access to the Power BI REST APIs. This allows you to establish an identity for your application and specify permissions to Power BI REST resources.

1. Accept the [Microsoft Power BI API Terms](https://powerbi.microsoft.com/api-terms).

2. Sign into the [Azure portal](https://portal.azure.com).
 
    ![Azure Portal Main](media/embed-sample-for-customers/embed-sample-for-customers-03.png)

3. In the left-hand navigation pane, choose **More Services**, select **App Registrations** under **Security + Identity** and select **New application registration**.
   
    ![App registration search](media/embed-sample-for-customers/Azure-Portal-06.png)</br>
    ![New App registration](media/embed-sample-for-customers/Azure-Portal-07.png)

4. Follow the prompts and create a new application. This is a Native Application sample, so you need to provide a Redirect URI, which Azure AD uses to return token responses. Enter a value specific to your application, .e.g http://localhost:13526/redirect

    ![Create App](media/embed-sample-for-customers/Azure-Portal-08.png)

### Get the client id
When you register an application, you receive a **Client ID**. The **Client ID** is used by the application to identify themselves to the users that they are requesting permissions from.

1. Sign into the [Azure portal](https://portal.azure.com).

    ![Azure Portal Main](media/embed-sample-for-customers/embed-sample-for-customers-03.png)

2. In the left-hand navigation pane, choose **More Services** and select **App Registrations**.

    ![App registration search](media/embed-sample-for-customers/Azure-Portal-06.png)

3. Select the application that you want to retrieve the client id for.

    ![Choosing App](media/embed-sample-for-customers/Azure-Portal-10.png)

4. You will see **Application ID** listed as a GUID. This is the client id for the application.
   
    ![Client ID](media/embed-sample-for-customers/Azure-Portal-101.png)

### Apply permissions to your application within Azure Active Directory

You will need to enable additional permissions to your application in addition to what was provided in app registration page. You can accomplish this through the Azure Active Directory portal, or programmatically.

You need to be logged in with the *master* account, used for embedding, which needs to be a global admin account.

### Use the Azure Active Directory portal

1. Browse to [App registrations](https://portal.azure.com/#blade/Microsoft_AAD_IAM/ApplicationsListBlade) within the Azure portal and select the app that you are using for embedding.
   
    ![Choosing App](media/embed-sample-for-customers/Azure-Portal-10.png)

2. Select **Settings** then select **Required permissions** under **API Access**.
   
    ![App reg Settings](media/embed-sample-for-customers/Azure-Portal-11.png)</br>
    ![Required Permissions](media/embed-sample-for-customers/Azure-Portal-12.png)

3. Select **Windows Azure Active Directory** and then make sure **Access the directory as the signed-in user** is selected. Select **Save**.
   
    ![Windows Azure AD Permissions](media/register-app/powerbi-embedded-azuread-app-permissions01.png)

4. Select **Add**.

    ![Add Permissions](media/embed-sample-for-customers/Azure-Portal-14.png)

5. Select **Select an API**.

    ![Add API Access](media/embed-sample-for-customers/Azure-Portal-15.png)

6. Select **Power BI Service**, then select **Select**.

    ![Add API Access](media/embed-sample-for-customers/Azure-Portal-16.png)

7. Select all permissions under **Delegated Permissions**. You will need to select them one by one in order to save the selections. Select **Save** when done.
   
    ![Add API Access](media/embed-sample-for-customers/Azure-Portal-17.png)

8. Within **Required permissions**, select **Grant Permissions**.
   
    The **Grant Permissions** action is needed for the *master account* to avoid being prompted for consent by Azure AD. If the account performing this action is a Global Admin, you will grant permissions to all users within your organization for this application. If the account performing this action is the *master account* and is not a Global Admin, you will grant permissions only to the *master account* for this application.
   
    ![Grant permissions within required permissions dialog](media/register-app/powerbi-embedded-azuread-app-grant-permissions.png)

### Create your Power BI Embedded dedicated capacity in Azure

1. Sign into the [Azure portal](https://portal.azure.com).

    ![Azure Portal Main](media/embed-sample-for-customers/embed-sample-for-customers-03.png)

2. In the left-hand navigation pane, choose **More Services** and select **Power BI Embedded**.

    ![App registration search](media/embed-sample-for-customers/Azure-Portal-01.png)

3. Follow the prompts and fill in the proper information needed to create a new Power BI Embedded Dedicated Capacity, and then select **Create**. When choosing the **Pricing Tier**, review the table below to decide which tier bests suits your needs.

    ![App registration search](media/embed-sample-for-customers/Azure-Portal-02.png)

| Capacity Node | Total cores<br/>*(Backend + frontend)* | Backend Cores | Frontend Cores | DirectQuery/live connection limits | Max page renders at peak hour |
| --- | --- | --- | --- | --- | --- |
| A1 |1 v-cores |.5 cores, 3GB RAM |.5 cores | 5 per second |1-300 |
| A2 |2 v-cores |1 core, 5GB RAM |1 core | 10 per second |301-600 |
| A3 |4 v-cores |2 cores, 10GB RAM |2 cores | 15 per second |601-1,200 |
| A4 |8 v-cores |4 cores, 25GB RAM |4 cores |30 per second |1,201-2,400 |
| A5 |16 v-cores |8 cores, 50GB RAM |8 cores |60 per second |2,401-4,800 |
| A6 |32 v-cores |16 cores, 100GB RAM |16 cores |120 per second |4,801-9600 |

4. Now you can view the new **Power BI Embedded dedicated capacity** created.

    ![PBIE dedicated capacity](media/embed-sample-for-customers/Azure-Portal-034.png)

## Setup your Power BI environment

### Create an app workspace

If you are embedding reports, dashboards, or tiles for your customers, those reports, dashboards, or tiles have to be placed within an app workspace. The *master* account must be an admin of the app workspace.

1. Start by creating the workspace. Select **workspaces** > **Create app workspace**. Create app workspace. This will be the place to put content that you and your colleagues collaborate on.

    ![Create Workspace](media/embed-sample-for-customers/pbi-01.png)

2. Give the workspace a name. If the corresponding **Workspace ID** isn't available, edit it to come up with a unique ID. This will be the name of the app, too.

    ![Name Workspace](media/embed-sample-for-customers/pbi-02.png)

3. You have a few options to set. If you choose **Public**, anyone in your organization can see what’s in the workspace. **Private**, on the other hand, means only members of the workspace can see its contents.

    ![Private/Public](media/embed-sample-for-customers/pbi-03.png)

    You can't change the Public/Private setting after you've created the group.

4. You can also choose if members can **edit** or have **view-only** access.

    ![Adding Members](media/embed-sample-for-customers/pbi-04.png)

5. Add email addresses of people you want to have access to the workspace, and select **Add**. You can’t add group aliases, just individuals.

6. Decide whether each person is a member or an admin. Admins can edit the workspace itself, including adding other members. Members can edit the content in the workspace, unless they have view-only access. Both admins and members can publish the app.

7. Expand **Advanced**, then enable **Dedicated capacity**, then select the **Power BI Embedded dedicated capacity** you created. 

    ![Adding Members](media/embed-sample-for-customers/pbi-05.png)

8. Select Save.

Now you can view the new workspace. Power BI creates the workspace and opens it. It appears in the list of workspaces you’re a member of. Because you’re an admin, you can select the ellipsis (…) to go back and make changes to it, adding new members or changing their permissions.

   ![New workspace](media/embed-sample-for-customers/pbi-06.png)

### Create and publish your reports

You can create your reports and datasets using Power BI Desktop and then publish those reports to an app workspace. The end user publishing the reports need to have a Power BI Pro license in order to publish to an app workspace.

1. Download the sample [Blog Demo](https://github.com/Microsoft/powerbi-desktop-samples) from GitHub.

    ![report sample](media/embed-sample-for-customers/embed-sample-for-customers-02.png)

2. Open sample PBIX report in **Power BI Desktop**

   ![PBI desktop report](media/embed-sample-for-customers/pbi-07.png)

3. Publish to the **app workspace**

   ![PBI desktop report](media/embed-sample-for-customers/pbi-08.png)

    Now you can view the report in the Power BI service online

   ![PBI desktop report](media/embed-sample-for-customers/pbi-09.png)

## Embed your content

1. Download the [App Owns Data sample](https://github.com/Microsoft/PowerBI-Developer-Samples) from GitHub to get started.

    ![App Owns Data application sample](media/embed-sample-for-customers/embed-sample-for-customers-01.png)

2. Open up the Web.config file in the sample application.

    ![Web Config file](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-01.png)

    * Fill in the clientId information with the Application Id from Azure.

    ![Client ID](media/embed-sample-for-customers/Azure-Portal-101.png)

    * Fill in the groupId information with the app workspace GUID from Power BI.

    ![groupId](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-02.png)

    * Fill in the reportId information with the report GUID from Power BI.

    ![reportId](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-03.png)    

    * Fill in the pbuUsername with the master user Power BI account.
    * Fill in the pbiPassword with the password for the master user Power BI account.

3. Run the application

    ![Run the application](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-04.png)

    ![Select a content](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-05.png)
 
    ![View application](media/embed-sample-for-customers-qs/embed-sample-for-customers-qs-06.png)

## Next steps
* [Tutorial: App Owns Data embed sample](embed-sample-for-customers.md)

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)