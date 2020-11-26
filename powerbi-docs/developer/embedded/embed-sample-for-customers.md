---
title: Embed content in your application for your customers
description: Learn how to embed, a report, dashboard, or tile into a Power BI embedded analytics sample.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: rkarlin
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.custom: seodec18
ms.date: 06/02/2020
#Customer intent: As an ISV developer, I want to embed a report, dashboard or tile into an application so that my customers can share data.
---

# Tutorial: Embed Power BI content into an application for your customers

**Embedded analytics** and **Power BI Embedded** (the Azure offer) allow you to embed reports, dashboards and tiles, into your application or web app.

In this tutorial you'll learn how to create an *embed for your customers* (also known as *app owns data*) application. Users will not need to sign in to Power BI or have a Power BI license, to use your application. Your application will use one of the following methods to authenticate against Power BI:

* **Master user** account (a Power BI Pro license used for signing in to Power BI)

* [Service principal](embed-service-principal.md)

Use the *embed for your customers* method of embedding Power BI content, if you're an independent software vendor (ISV) or a developer, who wants to create applications for third parties. You can select a sample application in one of the following languages:

* .NET Framework
* .NET Core
* Java
* Node JS
* Python

## Prerequisites

Before you start this tutorial, verify that you're Power BI environment  both the xxx and the yyy 

### Power BI dependencies

To embed in Power BI, you're required to have the following:

* Your own [Azure Active Directory tenant](create-an-azure-active-directory-tenant.md).

* To authenticate your app against Power BI, you'll need one of the following:

    * [Service principal](embed-service-principal.md) - An Azure Active Directory (Azure AD) [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) that allows Azure AD to authenticate your app.

    * [Power BI Pro account](../../admin/service-admin-purchasing-power-bi-pro.md) - This will be your **master user** and your app will use it to sign in to your Power BI Pro account.

>[!NOTE]
>To experiment with embedding, you can use one of these methods:
>* Sign up for a [free *Power BI pro* trial](https://powerbi.microsoft.com/pricing/).
>* Use a Premium Per User (PPU) license. You'll not be able to [move to production](move-to-production.md).

### Code dependencies

Verify that you have your environment and tools set, according to the sample you're going to use.

# [.NET Framework](#tab/net-framework)

* [.NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/) (or higher)

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

# [.NET Core](#tab/net-core)

* [.NET Core 3.1 SKD](https://dotnet.microsoft.com/download/dotnet-core) (or higher)

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

# [Python](#tab/python)

* [Python 3](https://www.python.org/downloads/) (or higher)

    >[!NOTE]
    >* If you're installing *Python* for the first time, select the **Add Python to PATH** option, to add the installation to the `PATH` variable.
    >* If you already have *Python* installed, verify that the `PATH` variable includes its installation path. For more information, see the [Excursus: Setting environment variables](https://docs.python.org/3/using/windows.html#excursus-setting-environment-variables) Python documentation (this link refers to Python 3).

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

# [Java](#tab/java)

* [JDK (or JRE)](https://www.oracle.com/java/technologies/)

* [Eclipse IDE](https://www.eclipse.org/downloads/packages/) - Verify that you have the *Eclipse for Java EE Developers* (enterprise edition)

* [Apache Tomcat Binary Distributions](https://tomcat.apache.org/)

# [Node JS](#tab/node-js)

* [.NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/) (or higher)

* An integrated development environment (IDE). We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

---

### Supported browsers

The code samples in this tutorial support the following browsers:

* Google Chrome

* Microsoft Edge

* Mozilla Firefox

## Method

To create an *embed for your customers* sample app, follow these steps:

1. Select your authentication method.

2. Register an Azure AD app.

3. Create a Power BI workspace.

4. Create and publish a Power BI report.

5. Get values needed for embedding

6. Service principal settings (applies only if you're using a *service principal*).

7. Embed your content.

8. Test your application.

>[!TIP]
>You can crete a ready made sample app using the the [embedding setup tool](https://app.powerbi.com/embedsetup). This tool replicates the steps described in this tutorial, and produces a .NET sample app that you can experiment with.

## Step 1 - Select your authentication method

To embed your Power BI content, you'll need to create an Azure AD app, which will authenticate itself against Power BI. Authenticating against Azure AD allows your embedded app to get an Azure AD token, which lists the permissions (also known as scopes) for the Power BI REST APIs.

You're embedded solution will vary depending on the authentication method you select. Therefore, it's important to understand the differences between the authentication methods, and decide which one best suits your solution.

The table below describes a few key differences between the **master user** and [service principal](embed-service-principal.md) authentication methods.

|Consideration  |Service principal  |Master user  |
|---------|---------|---------|
|Mechanism     |Your Azure AD app's [service principal object](/azure/active-directory/develop/app-objects-and-service-principals.md#service-principal-object) allows Azure AD to authenticate your embedded solution app against Power BI.         |Your Azure AD app uses the credentials (username and password) of a Power BI user, to authenticate against Power BI.         |
|Security     |*Service principal* is the Azure AD recommended authorization method. If you're using a *service principal* you can select between using an *application secret* or a *certificate*, as part of the authentication process.</br></br>This tutorial only describes using *service principal* with an *application secret*. To embed using a *service principal* and a *certificate*, refer to the [service principal with a certificate](embed-service-principal-certificate.md) article.         |This authentication method is not considered as secure as using a *service principal*. This is because you have to be vigilant with the *master user* credentials (username and password). For example, you must not expose them in your embedding application, and you should change the password frequently.         |
|License     |Doesn't require a Pro license. You can use content from any workspace that you're a member or an admin of.         |Requires a [Power BI Pro](../../admin/service-admin-purchasing-power-bi-pro.md) license.         |

## Step 2 - Register an Azure AD application

Registering your application with Azure AD allows you to:

* Establish an identity for your app

* Specify your app's [Power BI REST permissions](/azure/active-directory/develop/v2-permissions-and-consent)

* Let your app access the [Power BI REST APIs](/rest/api/power-bi/)

To register your application with Azure AD, follow the instructions in [Register your application](register-app.md).

>[!NOTE]
>Before registering your application, you'll need to decide which authentication method to use, *service principal* or *master user*.

## Step 3 - Create a Power BI workspace

Power BI keeps your reports, dashboards and tiles in a workspace. To embed these items, you'll need to create them or upload them into a workspace.

>[!TIP]
>If you already have a workspace, you can skip this step.

To create a workspace, do the following:

1. Sign in to Power BI.

2. Select **Workspaces**.

3. Select **Create a workspace**.

4. Name your workspace and select **Save**.

## Step 4 - Create and publish a Power BI report

>[!Tip]
>If you already have a workspace with a report, you can skip this step.

Your next step is to create a report and upload it to your workspace. You can [create your own report](/powerbi-docs/fundamentals/desktop-getting-started#build-reports) using Power BI Desktop, and then [publish](/powerbi-docs/fundamentals/desktop-getting-started#share-your-work) it to your workspace. Or, you can upload a sample report to your workspace.

To download a sample report and publish it to your workspace, follow these steps:

1. Open the GitHub [Power BI Desktop samples](https://github.com/microsoft/PowerBI-Developer-Samples) folder.

2. Select **Code** and then select **Download zip**.

    :::image type="content" source="media/embed-sample-for-customers/download-sample-report.png" alt-text="A screenshot showing the ZIP download option in the Power B I desktop samples GitHub":::

3. Extract the downloaded zip and navigate to the **Samples Reports** folder.

4. Select a report to embed, and [publish](/powerbi-docs/fundamentals/desktop-getting-started#share-your-work) it to your workspace.

## Step 5 - Get values needed for embedding

To embed your content you'll need to obtain certain values. The table blow shows the required values, and indicates if they're applicable to the *service principal* authentication method, the *master user* authentication method, or both.

Before you embed your content, make sure you have all the values listed below. Some of the values will differ, depending on the authentication method you're using.

|Parameter   |Service principal   |Master user  |
|-------------------|---|---|
|[Client ID](#client-id) |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Workspace ID](#workspace-id)     |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Report ID](#report-id)           |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Client secret](#client-secret) |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Tenant ID](#tenant-id)                 |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Power BI username](#power-bi-username-and-password)   |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |
|[Power BI password](#power-bi-username-and-password)   |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |

### Client ID 

>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

To get the client ID GUID (also know as *application ID*), follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

3. Select the Azure AD app your using for embedding your Power BI content.

4. From the **Overview** blade, copy the **Application (clent) ID** GUID.

### Workspace ID

>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

To get the workspace ID GUID, follow these steps:

1. Sign in to Power BI service.

2. Open the report you want to embed.

3. Copy the GUID from the URL. The GUID is the number between **/groups/** and **/reports/**.

    :::image type="content" source="media/embed-sample-for-customers/workspace-id.png" alt-text="A screenshot showing workspace ID GUID in the Power B I service U R L":::

### Report ID

>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

1. Sign in to Power BI service.

2. Open the report you want to embed.

3. Copy the GUID from the URL. The GUID is the number between **/reports/** and **/ReportSection**.

    :::image type="content" source="media/embed-sample-for-customers/report-id.png" alt-text="A screenshot showing report ID GUID in the Power B I service U R L":::

### Client secret

>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Does not apply to.](../../media/no.png)Master user

To get the client secret, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

3. Select the Azure AD app your using for embedding your Power BI content.

4. Under **Mange**, select **Certificates & secrets**.

5. Under **Client secrets**, select **New client secret**.

6. In the **Add a client secret** pop-up window, provide a description for your application secret, select when the application secret expires, and select **Add**.

7. From the **Client secrets** section, copy the string in the **Value** column of the newly created application secret. The client secret value is your *client ID*.

### Tenant ID

>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Does not apply to.](../../media/no.png)Master user

To get the tenant ID GUID, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

3. Select the Azure AD app your using for embedding your Power BI content.

4. From the **Overview** blade, copy the **Directory (tenant) ID** GUID.

### Power BI username and password

>**Applies to:** ![Does not apply to.](../../media/no.png)Service principal ![Applies to.](../../media/yes.png)Master user

Obtain the *user name* and *password* of the Power BI user you're using as your **master user**. This is the same user you used to create a workspace and upload a report to, in Power BI service.

## Step 6 - Enable workspace access

To enable your Azure AD app access artifacts such as reports, dashboards and datasets in the Power BI service, add the *service principal* or *master user*, as a *member* or *admin* to your workspace.

1. Sign in to Power BI service.

2. Scroll to the workspace you want to enable access for, and from the **More** menu, select **Workspace access**.

    :::image type="content" source="media/embed-service-principal/workspace-access.png" alt-text="Screenshot showing the workspace access button in the more menu of a Power BI workspace.":::

3. In the **Access** pane, depending on which authentication method you're using, copy the *service principal* or *master user* to the **Enter email address** text box.

    >[!NOTE]
    >If you're using a *service principal*, follow these steps to get it's name:
    >1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).
    >2. Search for **App registrations** and click the **App registrations** link.
    >3. Select the Azure AD app your using for embedding your Power BI content.
    >4. From the **Overview** blade, copy the **Display name**. This is the name of your *service principal*.

4. From the dropdown menu, select **Admin** or **Member**.

5. Select **Add**.

#### Service principal API access

For an Azure AD app to be able to access the Power BI content and APIs, a Power BI admin needs to enable service principal access in the Power BI admin portal. If you're not the admin of your tenant, get the tenant's admin to enable the *Tenant settings* for you.
        
1. In *Power BI service*, select **Settings** > **Settings** > **Admin portal**.
        
    :::image type="content" source="media/embed-sample-for-customers/admin-settings.png" alt-text="A screenshot showing the admin settings menu option in the Power B I service settings menu":::
        
2. Select **Tenant settings** and then scroll down to the **Developer settings** section.
        
3. Expand **Allow service principals to use Power BI APIs**, and enable this option.
        
    :::image type="content" source="media/embed-sample-for-customers/developer-settings.png" alt-text="A screenshot showing how to enable the developer settings option, in the tenant settings menu option, in Power B I service":::
        
>[!NOTE]
>When using a *service principal*, it's recommended to limit its access to the tenant settings using a *security group*. To learn more about this feature, see these sections in the [service principal](embed-service-principal.md) article:
> * [Create an Azure AD security group](embed-service-principal.md#step-2---create-an-azure-ad-security-group)
>* [Enable the Power BI service admin settings](embed-service-principal.md#step-3---enable-the-power-bi-service-admin-settings)

## Step 7 - Embed your content

The Power BI embedded sample application allows you to create an *embed for your customers* Power BI app.

Follow these steps to modify the a sample *embed for your customers* application, to embed your Power BI report.  

1. Open the [Power BI developer samples](https://github.com/microsoft/PowerBI-Developer-Samples) folder.

2. Select **Code** and then select **Download zip**.

    :::image type="content" source="media/embed-sample-for-customers/developer-samples.png" alt-text="A screenshot showing the ZIP download option in the Power B I developer samples GitHub":::

3. Extract the downloaded zip and navigate to the **PowerBI-Developer-Samples-master** folder.

4. Depending on the language you want your application to use, open one of these folders:

* .NET Framework
* .NET Core
* Java
* Node JS
* Python
    >[!NOTE]
    >The *embed for your customers* sample applications only support the languages listed above. The *React TS* sample application only supports the *[embed for your organization](embed-sample-for-your-organization.md)* solution.

5. Open the **Embed for your customers** folder.

# [.NET Framework](#tab/net-framework)

6. Open the *embed for your customers sample app* using one of these methods:

    * If you're using [Visual Studio](https://visualstudio.microsoft.com/), open the **AppOwnsData.sln** file.

    * If you're using [Visual Studio Code](https://code.visualstudio.com/), open the **App Owns Data** folder.

7. Open **Web.config**.

8. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`authenticationType` |ServicePrincipal         |MasterUser         |
    |`applicationId`           |Your Azure AD app [client ID](#client-id)         |Your Azure AD app [client ID](#client-id)         |
    |`workspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`reportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`applicationSecret`       |Your Azure AD [client secret](#client-secret)         |N/A         |
    |`tenant`           |Your Azure AD [tenant ID](#tenant-id)         |N/A         |

# [.NET Core](#tab/net-core)

6. Open the *embed for your customers sample app* using one of these methods:

    * If you're using [Visual Studio](https://visualstudio.microsoft.com/), open the **AppOwnsData.sln** file.

    * If you're using [Visual Studio Code](https://code.visualstudio.com/), open the **App Owns Data** folder.

7. Open **appsettings.json**.

8. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`AuthenticationMode` |ServicePrincipal         |MasterUser         |
    |`ClientId`           |Your Azure AD app [client ID](#client-id)         |Your Azure AD app [client ID](#client-id)         |
    |`TenantId`           |Your Azure AD [tenant ID](#tenant-id)         |N/A         |
    |`PbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`PbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`ClientSecret`       |Your Azure AD [client secret](#client-secret)         |N/A         |
    |`WorkspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`ReportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |

# [Python](#tab/python)

6. Open **PowerShell** or **Command Prompt**.

7. Verify that you're in the **Python** > **Embed for your customers** folder, and that the file **requirements.txt** is in the folder, and run `pip3 install -r requirements.txt`.

8. Open the **App Owns Data** folder using your preferred IDE. We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

9. Open **config.py**.

10. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`AUTHENTICATION_MODE` |ServicePrincipal         |MasterUser         |
    |`WORKSPACE_ID`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`REPORT_ID`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`TENANT_ID`           |Your Azure AD [tenant ID](#tenant-id)         |N/A         |
    |`CLIENT_ID`           |Your Azure AD app [client ID](#client-id)         |Your Azure AD app [client ID](#client-id)         |
    |`CLIENT_SECRET`       |Your Azure AD [client secret](#client-secret)         |N/A         |
    |`POWER_BI_USER`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`POWER_BI_PASS`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |

11. Save the file.

12. Run the project by doing the following:

    a. In **PowerShell** or **Command Prompt**, navigate to the **Python** > **Embed for your customers** > **AppOwnesData** folder, and execute `flask run`.

    b. Open a new tab in your browser and navigate to [http://localhost:5300](http://localhost:5300).

# [Java](#tab/java)

6. Open **Eclipse** and follow the instructions described below.

    >[!NOTE]
    >The instructions for the Java *embed for your customers sample app*, refer to [Eclipse IDE for Java EE Developers](https://www.eclipse.org/downloads/packages/) (enterprise edition). If you're using a different application, you'll have to set it up yourself.

7. Add the Tomcat server to Eclipse

    a. Select **Window** > **Show View** > **Servers**.

    b. In the servers tab, select **No servers are available. Click this link to create new server**.

    c. In the **Define a New Server** window, expand **Apache** and select the Tomcat server you're running on your machine. For example, *Tomcat v9.0 Server*.

    d. Select **Next**.

    e. In the **Tomcat Server** window, select **Browse** and navigate to the folder that contains the Tomcat server.

    f. In the **Tomcat Server** window, select **Installed JREs**.

    g. In the **Installed JREs** window, select the available *jre*, and select **Apply and Close**.

    h. In the **Tomcat Server** window, select **Finish**. You'll be able to see the Tomcat server in the *Servers* tab.

8. Open the project in Eclipse

    a. Select **File** and then select **Open Projects from File System**.

    b. In the **Import Projects form File System or Archive** window, select **Directory** and open the **AppOwnsData** folder.

    c. Select **Finish**.

9. Add the Tomcat server to the project

    a. In the **Package Explorer** pane, right-click **AppOwnsData**, and select **Properties**.

    b. In the **Properties for AppOwnesData** window, select **Targeted Runtimes** and then select **Apache Tomcat**. This selection will include the version of *Apache Tomcat* you're using, for example *Apache Tomact v9.0*.

    c. Select  **Apply and Close**.

10. Fill in the required parameters

    a. In the **Package explorer**, expand the **AppOwnsData** project.

    b. Expand **Java Resources**.

    c. Expand **src**.

    d. Expand **com.embedsample.appoensdata.config**.

    e. Open **Config.java**.

    f. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`authenticationType` |ServicePrincipal         |MasterUser         |
    |`workspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`reportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         | 
    |`clientId`           |Your Azure AD app [client ID](#client-id)         |Your Azure AD app [client ID](#client-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`tenantId`           |Your Azure AD [tenant ID](#tenant-id)         |N/A         |
    |`appSecret`       |Your Azure AD [client secret](#client-secret)         |N/A         |

11. Run the project

    a. In the **Package Explorer**, right-click **AppOwnesData**.

    b. Select **Run As**  > **Run on Server**.

    c. In the **Run on Server** window, select **Choose an existing server** and select the *Tomcat* server.

    d. Select **Finish**.

# [Node JS](#tab/node-js)

6. Open the **App Owns Data** folder using your preferred IDE. We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

7. Open a terminal and install required dependencies by executing: `npm install`.

8. Expand the **Config** folder and open **config.json**.

9. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`authenticationMode` |ServicePrincipal         |MasterUser         |
    |`clientId`           |Your Azure AD app [client ID](#client-id)         |Your Azure AD app [client ID](#client-id)         |
    |`workspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`reportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`clientSecret`       |Your Azure AD [client secret](#client-secret)         |N/A         |
    |`tenantId`           |Your Azure AD [tenant ID](#tenant-id)         |N/A         |

10. Run the project by doing the following:

    a. In the IDE terminal, execute `npm start`.

    b. Open a new tab in your browser and navigate to [http://localhost:5300](http://localhost:5300).

---

## Next steps

> [!div class="nextstepaction"]
>[Move to production](move-to-production.md)

>[!div class="nextstepaction"]
>[Embed for your organization](embed-sample-for-your-organization.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your customers](embed-paginated-reports-customers.md)

> [!div class="nextstepaction"]
>[Embed paginated reports for your organization](embed-paginated-reports-organization.md)

>[!div class="nextstepaction"]
>[Ask the Power BI Community](https://community.powerbi.com/)