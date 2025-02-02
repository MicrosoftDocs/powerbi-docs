---
title: Embed content in your Power BI embedded analytics application
description: Learn how to embed, a report, dashboard, or tile into a Power BI embedded analytics sample.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
ms.topic: tutorial
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 01/06/2025
#customer intent: As a developer, I want to learn how to embed Power BI content into my application, so that I can provide my users with interactive reports, dashboards, and tiles.
---

# Tutorial: Embed Power BI content using a sample *embed for your customers* application

[!INCLUDE[Customers yes Org no](../../includes/applies-embedded-app-yes-user-no.md)]

**Embedded analytics** and **Power BI Embedded** (the Azure offer) allow you to embed Power BI content such as reports, dashboards, and tiles, into your application.

In this tutorial, you learn how to:

>[!div class="checklist"]
>
>* Set up your embedded environment.
>* Configure an *embed for your customers* (also known as *app owns data*) sample application.

To use your application, your users don't need to sign in to Power BI or have a Power BI license.

We recommend using the *embed for your customers* method to embed your Power BI content, if you're an independent software vendor (ISV) or a developer, who wants to create applications for third parties.

> [!IMPORTANT]
> If you are embedding content for a national/regional cloud, the first few steps of this tutorial are different. See [Embed content for national/regional clouds](embed-sample-for-customers-national-clouds.md) for details.

## Code sample specifications

This tutorial includes instructions for configuring an *embed for your customers* sample application in one of the following frameworks:

* .NET Framework
* .NET Core
* Java
* Node JS
* Python

The code samples support the following browsers:

* Microsoft Edge
* Google Chrome
* Mozilla Firefox

## Prerequisites

Before you start this tutorial, verify that you have the following the Power BI and code dependencies:

* **Power BI dependencies**

  * Your own [Microsoft Entra tenant](create-an-azure-active-directory-tenant.md).

  * To authenticate your app against Power BI, you need one of the following:

    * [Service principal](embed-service-principal.md) - a Microsoft Entra [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) that allows Microsoft Entra ID to authenticate your app.

    * [Power BI Pro](../../enterprise/service-admin-purchasing-power-bi-pro.md) license - This is your **master user** and your app uses it to authenticate to Power BI.

    * A Power BI [Premium Per User (PPU)](../../enterprise/service-premium-per-user-faq.yml) license - This is your **master user** and your app uses it to authenticate to Power BI.

    >[!NOTE]
    >To [move to production](move-to-production.md) you'll need a [capacity](embedded-capacity.md).

* **Code dependencies**

### [.NET Core](#tab/net-core)

* [.NET Core 3.1 SDK](https://dotnet.microsoft.com/download/dotnet-core) (or higher)

* An integrated development environment (IDE). We recommend using one of the following environments:

  * [Visual Studio](https://visualstudio.microsoft.com/)

  * [Visual Studio Code](https://code.visualstudio.com/)

### [.NET Framework](#tab/net-framework)

* [.NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/)

* [Visual Studio](https://visualstudio.microsoft.com/)

### [Java](#tab/java)

* [JDK (or JRE)](https://www.oracle.com/java/technologies/)

* [Eclipse IDE](https://www.eclipse.org/downloads/packages/) - Verify that you have the *Eclipse for Java EE Developers* (enterprise edition)

* [Apache Tomcat Binary Distributions](https://tomcat.apache.org/)

### [Node JS](#tab/node-js)

* [Node.js](https://nodejs.org/en/download/)

* An integrated development environment (IDE). We recommend using one of the following environments:

  * [Visual Studio](https://visualstudio.microsoft.com/)

  * [Visual Studio Code](https://code.visualstudio.com/)

### [Python](#tab/python)

* [Python 3](https://www.python.org/downloads/) (or higher)

    >[!NOTE]
    >
    >* If you're installing *Python* for the first time, select the **Add Python to PATH** option, to add the installation to the `PATH` variable.
    >* If you already have *Python* installed, verify that the `PATH` variable includes its installation path. For more information, see the [Excursus: Setting environment variables](https://docs.python.org/3/using/windows.html#excursus-setting-environment-variables) Python documentation (this link refers to Python 3).

* An integrated development environment (IDE). We recommend using one of the following environments:

  * [Visual Studio](https://visualstudio.microsoft.com/)

  * [Visual Studio Code](https://code.visualstudio.com/)

---

## Method

To create an *embed for your customers* sample app, follow these steps:

1. [Select your authentication method](#step-1---select-your-authentication-method).

2. [Register a Microsoft Entra application](#step-2---register-an-azure-ad-application).

3. [Create a Power BI workspace](#step-3---create-a-power-bi-workspace).

4. [Create and publish a Power BI report](#step-4---create-and-publish-a-power-bi-report).

5. [Get the embedding parameter values](#step-5---get-the-embedding-parameter-values).

6. [Service principal API access](#step-6---service-principal-api-access)

7. [Enable workspace access](#step-7---enable-workspace-access).

8. [Embed your content](#step-8---embed-your-content).

## Step 1 - Select your authentication method

Your embedded solution varies depending on the authentication method you select. Therefore, it's important to understand the differences between the authentication methods, and decide which one best suits your solution.

The following table describes a few key differences between the [service principal](embed-service-principal.md) and **master user** authentication methods.

|Consideration  |Service principal  |Master user  |
|---------|---------|---------|
|Mechanism     |Your Microsoft Entra app's [service principal object](/azure/active-directory/develop/app-objects-and-service-principals#service-principal-object) allows Microsoft Entra ID to authenticate your embedded solution app against Power BI.        |Your Microsoft Entra app uses the credentials (username and password) of a Power BI user, to authenticate against Power BI.         |
|Security     |*Service principal* is the Microsoft Entra ID recommended authorization method. If you're using a service principal, you can authenticate using either an *application secret* or a *certificate*.</br></br>This tutorial only describes using *service principal* with an *application secret*. To embed using a *service principal* and a *certificate*, refer to the [service principal with a certificate](embed-service-principal-certificate.md) article.         |This authentication method isn't as secure as  a *service principal*. You have to be vigilant with the *master user* credentials (username and password). For example, don't expose them in your embedding application, and change the password frequently.         |
|Microsoft Entra ID delegated permissions |Not required. |Your *master user* or an administrator has to grant consent for your app to access Power BI REST API [permissions](/azure/active-directory/develop/v2-permissions-and-consent) (also known as scopes). For example, *Report.ReadWrite.All*. |
|Power BI service access |You can't access Power BI service with a *service principal*.|You can access Power BI service with your *master user* credentials.|
|License     |Doesn't require a Pro license. You can use content from any workspace that you're a member or an admin of.         |Requires a [Power BI Pro](../../enterprise/service-admin-purchasing-power-bi-pro.md) or Premium Per User (PPU) license.         |

<a name='step-2---register-an-azure-ad-application'></a>

## Step 2 - Register a Microsoft Entra application

Registering your application with Microsoft Entra ID allows you to:
> [!div class="checklist"]
>
>* Establish an identity for your app
>* Let your app access the [Power BI REST APIs](/rest/api/power-bi/)
>* If you're using a *master user* - Specify your app's [Power BI REST permissions](/azure/active-directory/develop/v2-permissions-and-consent)

[!INCLUDE[Register Azure AD app](../../includes/embed-tutorial-register-app.md)]

>[!NOTE]
>Before registering your application, you'll need to decide which authentication method to use, *service principal* or *master user*.

## Step 3 - Create a Power BI workspace

[!INCLUDE[Create a Power BI workspace](../../includes/embed-tutorial-create-workspace.md)]

## Step 4 - Create and publish a Power BI report

[!INCLUDE[Create a Power BI report](../../includes/embed-tutorial-create-report.md)]

> [!NOTE]
> If your report uses a Direct Lake semantic model, make sure review these [limitations](#considerations-and-limitations).

## Step 5 - Get the embedding parameter values

To embed your content, you need to obtain certain parameter values. The following table shows the required values, and indicates if they're applicable to the *service principal* authentication method, the *master user* authentication method, or both.

Before you embed your content, make sure you have all the values listed below. Some of the values might differ, depending on the authentication method you're using.

|Parameter   |Service principal   |Master user  |
|-------------------|---|---|
|[Client ID](#client-id) |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Workspace ID](#workspace-id)     |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Report ID](#report-id)           |![Applies to.](../../media/yes.png) |![Applies to.](../../media/yes.png) |
|[Client secret](#client-secret) |![Applies to.](../../media/yes.png) |![Does not apply to.](../../media/no.png) |
|[Tenant ID](#tenant-id)                 |![Applies to.](../../media/yes.png) | required only for Node JS |
|[Power BI username](#power-bi-username-and-password)   |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |
|[Power BI password](#power-bi-username-and-password)   |![Does not apply to.](../../media/no.png) |![Applies to.](../../media/yes.png) |

### Client ID

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

[!INCLUDE[Get the client ID](../../includes/embed-tutorial-client-id.md)]

### Workspace ID

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

[!INCLUDE[Get the workspace ID](../../includes/embed-tutorial-workspace-id.md)]

Alternatively, you can find the workspace ID in the **Admin portal** settings by selecting **Details** next to the workspace name.

  :::image type="content" source="media/embed-sample-for-customers/workspace-details.png" alt-text="A screenshot showing how to find the workspace ID from the admin settings.":::

### Report ID

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Applies to.](../../media/yes.png)Master user

[!INCLUDE[Get the report ID](../../includes/embed-tutorial-report-id.md)]

### Client secret

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Does not apply to.](../../media/no.png)Master user

[!INCLUDE[Get the client secret](../../includes/embed-tutorial-client-secret.md)]

### Tenant ID

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Does not apply to.](../../media/no.png)Master user

To get the tenant ID GUID, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and select the **App registrations** link.

3. Select the Microsoft Entra app you're using for embedding your Power BI content.

4. From the **Overview** section, copy the **Directory (tenant) ID** GUID.

### Power BI username and password

>[!TIP]
>**Applies to:** ![Does not apply to.](../../media/no.png)Service principal ![Applies to.](../../media/yes.png)Master user

Obtain the *username* and *password* of the Power BI user you're using as your **master user**. This is the same user you used to create a workspace and upload a report to, in Power BI service.

## Step 6 - Service principal API access

>[!TIP]
>**Applies to:** ![Applies to.](../../media/yes.png)Service principal ![Does not apply to.](../../media/no.png)Master user
>
>This step is only relevant if you're using the *service principal* authentication method. If you're using a *master user*, skip this step and continue with [Step 7 - Enable workspace access](#step-7---enable-workspace-access).

For a Microsoft Entra app to be able to access the Power BI content and APIs, a Power BI admin needs to enable service principal access in the Power BI admin portal. If you're not the admin of your tenant, get the tenant's admin to enable the *Tenant settings* for you.

1. In *Power BI service*, select **Settings** > **Settings** > **Admin portal**.

    :::image type="content" source="media/embed-sample-for-customers/admin-settings.png" alt-text="A screenshot showing the admin settings menu option in the Power B I service settings menu.":::

2. Select **Tenant settings** and then scroll down to the **Developer settings** section.

3. Expand **Service principals can use Fabric APIs**, and enable this option.

    :::image type="content" source="media/embed-sample-for-customers/developer-settings.png" alt-text="A screenshot showing how to enable the developer settings option, in the tenant settings menu option, in Power B I service.":::

>[!NOTE]
>When using a *service principal*, it's recommended to limit its access to the tenant settings using a *security group*. To learn more about this feature, see these sections in the [service principal](embed-service-principal.md) article:
>
> * [Create a Microsoft Entra security group](embed-service-principal.md#step-2---create-an-azure-ad-security-group)
> * [Enable the Power BI service admin settings](embed-service-principal.md#step-3---enable-the-power-bi-service-admin-settings)

## Step 7 - Enable workspace access

To enable your Microsoft Entra app access objects such as reports, dashboards and semantic models in the Power BI service, add the *service principal* or *master user*, as a *member* or *admin* to your workspace.

1. Sign in to Fabric.

2. Scroll to the workspace you want to enable access for, and select **Manage access**.

    :::image type="content" source="media/embed-service-principal/workspace-access.png" alt-text="Screenshot showing the workspace access button in the more menu of a Power B I workspace.":::

3. In the **Access** pane, depending on which authentication method you're using, copy the *service principal* or *master user* to the **Enter email address** text box.

    >[!NOTE]
    >If you're using a *service principal*, its name is the name you gave your Microsoft Entra app.

4. Select **Add**.

## Step 8 - Embed your content

The Power BI embedded sample application allows you to create an *embed for your customers* Power BI app.

Follow these steps to modify the *embed for your customers* sample application, to embed your Power BI report.  

[!INCLUDE[Embedding steps](../../includes/embed-tutorial-embedding-steps.md)]

4. Depending on the language you want your app to use, open one of these folders:

    * .NET Core
    * .NET Framework
    * Java
    * Node JS
    * Python

    >[!NOTE]
    >The *embed for your customers* sample applications only support the frameworks listed above. The *React* sample application only supports the *[embed for your organization](embed-sample-for-your-organization.md)* solution.

5. Open the **Embed for your customers** folder.

### [.NET Core](#tab/net-core)

6. Open the *embed for your customers sample app* using one of these methods:

    * If you're using [Visual Studio](https://visualstudio.microsoft.com/), open the **AppOwnsData.sln** file.

    * If you're using [Visual Studio Code](https://code.visualstudio.com/), open the **AppOwnsData** folder.

7. Open **appsettings.json**.

8. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`AuthenticationMode` |ServicePrincipal         |MasterUser         |
    |`ClientId`           |Your Microsoft Entra app [client ID](#client-id)         |Your Microsoft Entra app [client ID](#client-id)         |
    |`TenantId`           |Your Microsoft Entra [tenant ID](#tenant-id)         |N/A         |
    |`PbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`PbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`ClientSecret`       |Your Microsoft Entra ID [client secret](#client-secret)         |N/A         |
    |`WorkspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`ReportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |

9. Run the project by selecting the appropriate option:

    * If you're using **Visual Studio**, select **IIS Express** (play).

    * If you're using **Visual Studio Code**, select **Run > Start Debugging**.

### [.NET Framework](#tab/net-framework)

6. Using [Visual Studio](https://visualstudio.microsoft.com/), open the **AppOwnsData.sln** file.

7. Open **Web.config**.

8. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`authenticationType` |ServicePrincipal         |MasterUser         |
    |`applicationId`           |Your Microsoft Entra app [client ID](#client-id)         |Your Microsoft Entra app [client ID](#client-id)         |
    |`workspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`reportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`applicationSecret`       |Your Microsoft Entra ID [client secret](#client-secret)         |N/A         |
    |`tenant`           |Your Microsoft Entra [tenant ID](#tenant-id)         |N/A         |

9. Run the project by selecting **IIS Express** (play).

### [Java](#tab/java)

6. Open **Eclipse** and follow the instructions described below.

    >[!NOTE]
    >The instructions for the Java *embed for your customers sample app*, refer to [Eclipse IDE for Java EE Developers](https://www.eclipse.org/downloads/packages/) (enterprise edition). If you're using a different application, you'll have to set it up yourself.

7. Add the Tomcat server to Eclipse:

    a. Select **Window** > **Show View** > **Servers**.

    b. In the servers tab, select **No servers are available. Click this link to create new server**.

    c. In the **Define a New Server** window, expand **Apache** and select the Tomcat server you're running on your machine. For example, *Tomcat v9.0 Server*.

    d. Select **Next**.

    e. In the **Tomcat Server** window, select **Browse** and navigate to the folder that contains the Tomcat server.

    f. In the **Tomcat Server** window, select **Installed JREs**.

    g. In the **Installed JREs** window, select the available *jre*, and select **Apply and Close**.

    h. In the **Tomcat Server** window, select **Finish**. You can see the Tomcat server in the *Servers* tab.

8. Open the project in Eclipse:

    >[!IMPORTANT]
    >Eclipse may run into trouble if your path name is too long. To avoid this issue, verify that your sample app's folder is not nested too deeply in your machine's folder structure.

    a. Select **File** and then select **Open Projects from File System**.

    b. In the **Import Projects from File System or Archive** window, select **Directory** and open the **AppOwnsData** folder.

    c. Select **Finish**.

9. Add the Tomcat server to the project:

    a. In the **Package Explorer** pane, right-click **AppOwnsData**, and select **Properties**.

    b. In the **Properties for AppOwnsData** window, select **Targeted Runtimes** and then select **Apache Tomcat**. This selection includes the version of *Apache Tomcat* you're using, for example *Apache Tomcat v9.0*.

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
    |`clientId`           |Your Microsoft Entra app [client ID](#client-id)         |Your Microsoft Entra app [client ID](#client-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`tenantId`           |Your Microsoft Entra [tenant ID](#tenant-id)         |N/A         |
    |`appSecret`       |Your Microsoft Entra ID [client secret](#client-secret)         |N/A         |

11. Run the project

    a. In the **Package Explorer**, right-click **AppOwnesData**.

    b. Select **Run As**  > **Run on Server**.

    c. In the **Run on Server** window, select **Choose an existing server** and select the *Tomcat* server.

    d. Select **Finish**.

### [Node JS](#tab/node-js)

6. Open the **App Owns Data** folder using your preferred IDE. We recommend using one of the following:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

7. Open a terminal and install the required dependencies by executing: `npm install`.

8. Expand the **Config** folder and open **config.json**.

9. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`authenticationMode` |ServicePrincipal         |MasterUser         |
    |`clientId`           |Your Microsoft Entra app [client ID](#client-id)         |Your Microsoft Entra app [client ID](#client-id)         |
    |`workspaceId`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`reportId`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`pbiUsername`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`pbiPassword`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |
    |`clientSecret`       |Your Microsoft Entra ID [client secret](#client-secret)         |N/A         |
    |`tenantId`           |Your Microsoft Entra [tenant ID](#tenant-id)         |Your Microsoft Entra [tenant ID](#tenant-id)         |

10. Run the project by doing the following:

    a. In the IDE terminal, execute `npm start`.

    b. Open a new tab in your browser and navigate to `http://localhost:5300`.

### [Python](#tab/python)

6. Open **PowerShell** or **Command Prompt**.

7. Verify that you're in the **Python** > **Embed for your customers** folder, and that the file **requirements.txt** is in the folder, and run `pip3 install -r requirements.txt`.

8. Open the **App Owns Data** folder using your preferred IDE. We recommend using one of the following environments:

    * [Visual Studio](https://visualstudio.microsoft.com/)

    * [Visual Studio Code](https://code.visualstudio.com/)

9. Open **config.py**.

10. Depending on your authentication method, fill in the following parameter values:

    |Parameter            |Service principal  |Master user  |
    |---------------------|---------|---------|
    |`AUTHENTICATION_MODE` |ServicePrincipal         |MasterUser         |
    |`WORKSPACE_ID`        |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)          |The ID of the workspace with your embedded report, see [Workspace ID](#workspace-id)         |
    |`REPORT_ID`           |The ID of the report you're embedding, see [Report ID](#report-id)            |The ID of the report you're embedding, see [Report ID](#report-id)         |
    |`TENANT_ID`           |Your Microsoft Entra [tenant ID](#tenant-id)         |N/A         |
    |`CLIENT_ID`           |Your Microsoft Entra app [client ID](#client-id)         |Your Microsoft Entra app [client ID](#client-id)         |
    |`CLIENT_SECRET`       |Your Microsoft Entra ID [client secret](#client-secret)         |N/A         |
    |`POWER_BI_USER`        |N/A         |Your *master user* username, see [Power BI username and password](#power-bi-username-and-password)         |
    |`POWER_BI_PASS`        |N/A         |Your *master user* password, see [Power BI username and password](#power-bi-username-and-password)         |

11. Save the file.

12. Run the project by doing the following steps:

    a. In **PowerShell** or **Command Prompt**, navigate to the **Python** > **Embed for your customers** > **AppOwnesData** folder, and execute `flask run`.

    b. Open a new tab in your browser and navigate to `http://localhost:5000`.

---

## Developing your application

After configuring and running the *embed for your customers* sample application, you can start developing your own application.

Try out the [Power BI embedded analytics playground](./power-bi-playground.md) to get started developing and to keep up with all the new Power BI Embedded features and updates.

[!INCLUDE[Move to production](../../includes/embed-tutorial-production.md)]

> [!IMPORTANT]
> If you used free embed trial tokens for development, you must buy a capacity for production. Until a capacity is purchased, the *Free trial version* banner will continue to appear at the top of the embedded report.

## Considerations and limitations

The following limitations apply for Direct Lake mode:

* Requires a [V2 embed token](./generate-embed-token.md).
* If you're using a service principal, you need a [Fixed Identity](/fabric/get-started/direct-lake-fixed-identity) connection (No-SSO).
* Currently, setting a [service principal](./embed-service-principal.md) as the authentication method on a [Fixed Identity](/fabric/get-started/direct-lake-fixed-identity) connection is the only option supported through automation. Other methods are supported manually through the portal.

## Related content

* [Move to production](move-to-production.md)
* [Embed for your organization](embed-sample-for-your-organization.md)
* [Embed paginated reports](embed-paginated-reports.md)

More questions? [Ask the Power BI Community](https://community.powerbi.com/).
