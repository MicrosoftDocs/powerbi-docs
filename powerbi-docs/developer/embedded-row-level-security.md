---
title: Use row-level security with Power BI embedded content
description: Learn about the steps you need to take to embed Power BI content within your application.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: nishalit
ms.service: powerbi
ms.component: powerbi-developer
ms.topic: conceptual
ms.date: 12/20/2018
---

# Use row-level security with Power BI embedded content

**Row-level security (RLS)** can be used to restrict user access to data within dashboards, tiles, reports, and datasets. Different users can work with those same artifacts all while seeing different data. Embedding supports RLS.

If you're embedding for non-Power BI users (app owns data), which is typically an ISV scenario, then this article is for you! Configure the embed token to account for the user and role.

If you're embedding to Power BI users (user owns data), within your organization, RLS works the same as it does within the Power BI service directly. There's nothing more you need to do in your application. For more information, see [Row-Level security (RLS) with Power BI](../service-admin-rls.md).

![Items involved with Row-Level Security.](media/embedded-row-level-security/powerbi-embedded-rls-components.png)

To take advantage of RLS, it’s important you understand three main concepts; Users, Roles, and Rules. Let’s take a closer look at each:

**Users** – End users viewing the artifact (dashboard, tile, report, or dataset). In Power BI Embedded, users are identified by the username property in an embed token.

**Roles** – Users belong to roles. A role is a container for rules and can be named something like *Sales Manager* or *Sales Rep*. You create roles within Power BI Desktop. For more information, see [Row-level security (RLS) with Power BI Desktop](../desktop-rls.md).

**Rules** – Roles have rules, and those rules are the actual filters that are going to be applied to the data. The rules could be as simple as “Country = USA” or something much more dynamic.
For the rest of this article, there's an example of authoring RLS, and then consuming that within an embedded application. Our example uses the [Retail Analysis Sample](http://go.microsoft.com/fwlink/?LinkID=780547) PBIX file.

![Report example](media/embedded-row-level-security/powerbi-embedded-report-example.png)

## Adding roles with Power BI Desktop

Our **Retail Analysis sample** shows sales for all the stores in a retail chain. Without RLS, no matter which district manager signs in and views the report, they all see the same data. Senior management has determined each district manager should only see the sales for the stores they manage. Using RLS allows Senior management to restrict data based on a district manager.

RLS is authored in Power BI Desktop. When the dataset and report are opened, we can switch to diagram view to see the schema:

![Diagram view within Power BI Desktop](media/embedded-row-level-security/powerbi-embedded-schema.png)

Here are a few things to notice with this schema:

* All measures, like **Total Sales**, are stored in the **Sales** fact table.
* There are four additional related dimension tables: **Item**, **Time**, **Store**, and **District**.
* The arrows on the relationship lines indicate which way filters can flow from one table to another. For example, if a filter is placed on **Time[Date]**, in the current schema it would only filter down values in the **Sales** table. No other tables are affected by this filter since all the arrows on the relationship lines point to the sales table and not away.
* The **District** table indicates who the manager is for each district:
  
    ![Rows within District table](media/embedded-row-level-security/powerbi-embedded-district-table.png)

Based on this schema, if we apply a filter to the **District Manager** column in the **District** table, and if that filter matches the user viewing the report, that filter down the **Store** and **Sales** tables to show data for that district manager.

Here's how:

1. On the **Modeling** tab, select **Manage Roles**.

    ![Modeling tab within Power BI Desktop](media/embedded-row-level-security/powerbi-embedded-manage-roles.png)
2. Create a new role called **Manager**.

    ![Create new role](media/embedded-row-level-security/powerbi-embedded-new-role.png)
3. In the **District** table, enter this DAX expression: **[District Manager] = USERNAME()**.

    ![DAX statement for RLS rule](media/embedded-row-level-security/powerbi-embedded-new-role-dax.png)
4. To make sure the rules are working, on the **Modeling** tab, select **View as Roles**, and then select both the **Manager** role you created, along with **Other users**. Enter **AndrewMa** for the user.

    ![View as role dialog](media/embedded-row-level-security/powerbi-embedded-new-role-view.png)

    The reports show data as if you're signed in as **AndrewMa**.

Applying the filter, the way we did here, filters down all records in the **District**, **Store**, and **Sales** tables. However, because of the filter direction on the relationships between **Sales** and **Time**, **Sales** and **Item**, and **Item** and **Time** tables aren't filtered down. To learn more about bidirectional cross-filtering, download the [Bidirectional cross-filtering in SQL Server Analysis Services 2016 and Power BI Desktop](http://download.microsoft.com/download/2/7/8/2782DF95-3E0D-40CD-BFC8-749A2882E109/Bidirectional%20cross-filtering%20in%20Analysis%20Services%202016%20and%20Power%20BI.docx) whitepaper.

## Applying user and role to an embed token

Now that you have your Power BI Desktop roles configured, there's some work needed in your application to take advantage of the roles.

Users are authenticated and authorized by your application and embed tokens are used to grant that user access to a specific Power BI Embedded report. Power BI Embedded doesn’t have any specific information on who your user is. For RLS to work, you need to pass some additional context as part of your embed token in the form of identities. You can pass the identities by using the [Embed Token](https://docs.microsoft.com/rest/api/power-bi/embedtoken) API.

The API accepts a list of identities with indication of the relevant datasets. For RLS to work, you need to pass the below pieces as part of the identity.

* **username (mandatory)** – A string that can be used to help identify the user when applying RLS rules. Only a single user can be listed. Your username can be created with *ASCII* characters.
* **roles (mandatory)** – A string containing the roles to select when applying Row Level Security rules. If passing more than one role, they should be passed as a string array.
* **dataset (mandatory)** – The dataset that is applicable for the artifact you're embedding.

You can create the embed token by using the **GenerateTokenInGroup** method on **PowerBIClient.Reports**.

For example, you could change the [PowerBIEmbedded_AppOwnsData](https://github.com/Microsoft/PowerBI-Developer-Samples/tree/master/App%20Owns%20Data) sample. *Home\HomeController.cs line 76 and 77* could be updated from:

```csharp
// Generate Embed Token.
var generateTokenRequestParameters = new GenerateTokenRequest(accessLevel: "view");

var tokenResponse = await client.Reports.GenerateTokenInGroupAsync(GroupId, report.Id, generateTokenRequestParameters);
```

to

```csharp
var generateTokenRequestParameters = new GenerateTokenRequest("View", null, identities: new List<EffectiveIdentity> { new EffectiveIdentity(username: "username", roles: new List<string> { "roleA", "roleB" }, datasets: new List<string> { "datasetId" }) });

var tokenResponse = await client.Reports.GenerateTokenInGroupAsync("groupId", "reportId", generateTokenRequestParameters);
```

If you're calling the REST API, the updated API now accepts an additional JSON array, named **identities**, containing a username, list of string roles and list of string datasets. 

Use the following code below as an example:

```json
{
    "accessLevel": "View",
    "identities": [
        {
            "username": "EffectiveIdentity",
            "roles": [ "Role1", "Role2" ],
            "datasets": [ "fe0a1aeb-f6a4-4b27-a2d3-b5df3bb28bdc" ]
        }
    ]
}
```

Now, with all the pieces together, when someone logs into your application to view this artifact, they’ll only see the data that they're allowed to see, as defined by our row-level security.

## Working with Analysis Services live connections

Row-level security can be used with Analysis Services live connections for on-premises servers. There are a few specific concepts that you should understand when using this type of connection.

The effective identity that is provided for the username property must be a Windows user with permissions on the Analysis Services server.

### On-premises data gateway configuration

An [On-premises data gateway](../service-gateway-onprem.md) is used when working with Analysis Services live connections. When generating an embed token, with an identity listed, the master account needs to be listed as an admin of the gateway. If the master account isn't listed, the row-level security isn't applied to the property of the data. A non-admin of the gateway can provide roles, but must specify its own username for the effective identity.

### Use of roles

Roles can be provided with the identity in an embed token. If no role is provided, the username that was provided can be used to resolve the associated roles.

### Using the CustomData feature

The CustomData feature only works for models that lie in **Azure Analysis Services**, and it only works in **Connect live** mode. Unlike users and roles, the Custom data feature can't be set inside a .pbix file. When generating a token with the Custom data feature, you need to have a username.

The CustomData feature allows you to add a Row filter when viewing Power BI data in your application when using **Azure Analysis Services** as your data source (viewing Power BI data connected to Azure Analysis Services in your application).

The CustomData feature allows passing free text (string) using the CustomData connection string property. Analysis Services use this value via the *CUSTOMDATA()* function.

The only way to have dynamic RLS (which uses dynamic values for filter evaluation) in **Azure Analysis Services**, is using the *CUSTOMDATA()* function.

You can use it inside the role DAX query, and you can use it without any role in a measure DAX query.
CustomData feature is part of our token generation functionality for the following artifacts: dashboard, report, and tile. Dashboards can have multiple CustomData identities (one per tile/model).

#### CustomData SDK Additions

The CustomData string property was added to our effective identity in the token generation scenario.

```json
[JsonProperty(PropertyName = "customData")]
public string CustomData { get; set; }
```

The identity can be created with custom data using the following call:

```csharp
public EffectiveIdentity(string username, IList<string> datasets, IList<string> roles = null, string customData = null);
```

#### CustomData SDK Usage

If you're calling the REST API, you can add custom data inside each identity, for example:

```json
{
    "accessLevel": "View",
    "identities": [
        {
            "username": "EffectiveIdentity",
            "roles": [ "Role1", "Role2" ],
            "customData": "MyCustomData",
            "datasets": [ "fe0a1aeb-f6a4-4b27-a2d3-b5df3bb28bdc" ]
        }
    ]
}
```

Here are the steps to begin setting up the CustomData() feature with your Power BI Embedded application.

1. Create your Azure Analysis Services database. Then sign in to your Azure Analysis Services server via [SQL Server Management Studio](https://docs.microsoft.com/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-2017).

    ![Create an Azure Analysis Services database](media/embedded-row-level-security/azure-analysis-services-database-create.png)

    ![Analysis Services database](media/embedded-row-level-security/azure-analysis-services-database.png)

2. Create a Role in the Analysis Services server.

    ![Create Role](media/embedded-row-level-security/azure-analysis-services-database-create-role.png)

3. Set your **General** settings.  Here you give the **Role Name** and set the database permissions to **Read** only.

    ![Create Role - Set General Settings](media/embedded-row-level-security/azure-analysis-services-database-create-role-general-settings.png)

4. Set the **Membership** settings. Here you add te users that are affected by this role.

    ![Create Role - Set Membership Settings](media/embedded-row-level-security/azure-analysis-services-database-create-role-membership.png)

5. Set your **Row filters** DAX query using the *CUSTOMDATA()* function.

    ![Create Role - Set Row Filters](media/embedded-row-level-security/azure-analysis-services-database-create-role-row-filters.png)

6. Build a PBI report and publish it to a workspace with dedicated capacity.

    ![PBI report sample](media/embedded-row-level-security/rls-sample-pbi-report.png)

7. Use the Power BI APIs to use the CustomData feature in your application.  When generating a token with the Custom data feature, you need to have a username. The username must be equal to the UPN of the master user. The master user must be a member of the role(s) you created. If no role(s) are specified, then all the roles the master user is a member of are used for RLS evaluation.

    > [!Note]
    > When you're ready to deploy your application to production, the master user account field or option should not be visible to the end user.

    View the [code](#customdata-sdk-additions) to add the CustomData feature.

8. Now you can view the report in your application before applying the Custom data value(s) to see all the data your report holds.

    ![Before Custom Data is applied](media/embedded-row-level-security/customdata-before.png)

    Then apply the Custom data value(s) to see how the report displays a different set of data.
    ![After CustomData is applied](media/embedded-row-level-security/customdata-after.png)

## Using RLS vs. JavaScript filters

When deciding on filtering your data in a report, you can use **row-level security (RLS)** or **JavaScript filters**.

[Row-level security](../service-admin-rls.md) is a feature that filters data at the data model level. Your backend data source controls your RLS settings. Based on your data model, the embed token generation sets the username and the roles for the session. It cannot be overridden, removed, or controlled by the client-side code and that’s why it’s considered secure. We recommend using RLS for filtering data securely. You can filter data with RLS by using one of the options below.

* [Configuring roles in a Power BI report](../desktop-rls.md).
* Configuring roles at the data source level (Analysis Services live connection only).
* Programmatically with an [Embed Token](https://docs.microsoft.com/rest/api/power-bi/embedtoken/datasets_generatetokeningroup) using `EffectiveIdentity`. When using an embed token, the actual filter passes through the embed token for a specific session.

[JavaScript filters](https://github.com/Microsoft/PowerBI-JavaScript/wiki/Filters#page-level-and-visual-level-filters) are used to allow the user to consume reduced, scoped, or a filtered view of the data. However, the user still has access to the model schema tables, columns, and measures and potentially can access any data there. Restricted access to the data can only be applied with RLS and not through client-side filtering APIs.

## Token-based Identity with Azure SQL Database (Preview)

The **token-based identity** allows you to specify the effective identity for an embed token using **Azure Active Directory (AAD)** access token for an **Azure SQL Database**.

Customers that hold their data in **Azure SQL Database** can now enjoy a new capability to manage users and their access to data in Azure SQL when integrating with **Power BI Embedded**.

When you're generating the embed token, you can specify the effective identity of a user in Azure SQL. You can specify the effective identity of a user by passing the AAD access token to the server. The access token is used to pull only the relevant data for that user from Azure SQL, for that specific session.

It can be used to manage each user’s view in Azure SQL or to sign in to Azure SQL as a specific customer in a multi-tenant DB. It can also be used to apply row-level security on that session in Azure SQL and retrieve only the relevant data for that session, removing the need to manage RLS in Power BI.

Such effective identity issues apply to RLS rules directly on the Azure SQL Server. Power BI Embedded uses the provided access token when querying data from the Azure SQL Server. The UPN of the user (for which the access token was provided) is accessible as a result of the USER_NAME() SQL function.

The token-based identity only works for DirectQuery models on dedicated capacity - connected to an Azure SQL Database, which is configured to allow AAD authentication ([learn more about AAD authentication for Azure SQL Database](https://docs.microsoft.com/azure/sql-database/sql-database-manage-logins)). The dataset’s data source must be configured to use end users’ OAuth2 credentials, to use a token-based identity.

   ![Configure Azure SQL server](media/embedded-row-level-security/token-based-configure-azure-sql-db.png)

### Token-based Identity SDK additions

The identity blob property was added to our effective identity in the token generation scenario.

```JSON
[JsonProperty(PropertyName = "identityBlob")]
public IdentityBlob IdentityBlob { get; set; }
```

The IdentityBlob type is a simple JSON structure holding a value string property

```JSON
[JsonProperty(PropertyName = "value")]
public string value { get; set; }
```

The EffectiveIdentity can be created with identity blob using the following call:

```C#
public EffectiveIdentity(string username, IList<string> datasets, IList<string> roles = null, string customData = null, IdentityBlob identityBlob = null);
```

Identity blob can be created using the following call.

```C#
public IdentityBlob(string value);
```

### Token-based Identity REST API Usage

If you're calling the [REST API](https://docs.microsoft.com/rest/api/power-bi/embedtoken/reports_generatetoken#definitions), you can add identity blob inside each identity.

```JSON
{
    "accessLevel": "View",
    "identities": [
        {
            "datasets": ["fe0a1aeb-f6a4-4b27-a2d3-b5df3bb28bdc"],
        “identityBlob”: {
            “value”: “eyJ0eXAiOiJKV1QiLCJh….”
         }
        }
    ]
}
```

The value provided in the identity blob should be a valid access token to Azure SQL Server (with a resource URL of (<https://database.windows.net/>).

   > [!Note]
   > To be able to create an access token for Azure SQL, the application must have **Access Azure SQL DB and Data Warehouse** delegated permission to **Azure SQL Database** API on AAD app registration configuration in the Azure portal.

   ![App registration](media/embedded-row-level-security/token-based-app-reg-azure-portal.png)

## Considerations and limitations

* Assignment of users to roles within the Power BI service doesn't affect RLS when using an embed token.
* While the Power BI service doesn't apply RLS setting to admins or members with edit permissions, when you supply an identity with an embed token, it applies to the data.
* Analysis Services live connections are supported for on-premises servers.
* Azure Analysis Services live connections support filtering by roles. Dynamic filtering can be done using CustomData.
* If the underlying dataset doesn’t require RLS, the GenerateToken request must **not** contain an effective identity.
* If the underlying dataset is a cloud model (cached model or DirectQuery), the effective identity must include at least one role,  otherwise role assignment doesn't occur.
* A list of identities enables multiple identity tokens for dashboard embedding. For all others artifacts, the list contains a single identity.

### Token-based Identity limitations (Preview)

* This capability restricts use with Power BI Premium only.
* This capability doesn’t work with SQL Server on-premises.
* This capability doesn't work with multi-geo.

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)