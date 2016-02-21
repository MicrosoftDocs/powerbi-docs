<properties
   pageTitle="Walkthrough to push data into a Power BI dashboard"
   description="Walkthrough to push data into a Power BI dashboard"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/16/2016"
   ms.author="derrickv"/>

# Walkthrough to push data into a Power BI dashboard
With the Power BI REST API, you can push data into a Power BI dashboard. For example, you want to extend an existing business workflow to push key data into your dashboard. In this case, you want to push a Sales Marketing dataset which has a Product table.

Before you get started, make sure to [setup your app environment in Azure Active Directory (Azure AD)](data-catalog-what-you-need-to-create-an-app). Power BI apps are integrated with **Azure AD** to provide secure sign in and authorization for your app. After you register an app in **Azure AD**, the application outsources authentication to Azure AD, and grants your app access to the Power BI REST API.

Here's how to use the Power BI API to push data into a dashboard. In this example, you push a Sales Marketing dataset with a Product table into your dashboard.

<a name="push_step1"/>
## Step 1 – Register the app with Azure AD

The first step is to register your app in Azure AD. You need to do this first so that you have a **Client ID** that identifies your app in Azure AD. Without a **Client ID**, Azure AD can not authenticate your app. Here are the steps:

1. Go to dev.powerbi.com/apps.
2. Click **Sign in with your existing account**, and sign into your Power BI account.
3. Enter an **App Name** such as "Sample push data client app".
4. For **App Type**, choose **Native app**.
5. Enter a **Redirect URL**. For a **Native client app**, a redirect uri gives **Azure AD** more details on the specific application that it will authenticate. Any valid Uri will work such as https://login.live.com/oauth20_desktop.srf.
6. For **Choose APIs to access**, choose **Read All Datasets**. For all Power BI app permissions, see [App permissions](powerbi-developer-app-permissions.md).
7. Click **Register app**, and save the **Client ID** that was generated. A **Client ID** identifies the app in Azure AD.

The [next step] shows you how to get an authentication access token.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Register a client app]

<a name="push_step2"/>
## Step 2 - Get an authentication access token

In Visual Studio, create a **Console Application** project, and follow these steps:

1. Add the code below into class Program {...}.
2. Replace "{ClientID}", with the **Client ID** you got when you registered the app. See [Step 1 – Register a Native client app](#register_1).
3. Install the [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/). To get an authentication security token in a .NET app, you use this package. Here's how to install the package:

  a. In Visual Studio 2015, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.

  b. In **Package Manager Console**, enter Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612.

4. After the package is installed, add **using Microsoft.IdentityModel.Clients.ActiveDirectory** to Program.cs.
5. Run the Console App, and login to your Power BI account. You should see a token string in the Console Window.

**Sample get authentication security token**

Add this code to Program {...}.

- Token variable to call operations:

      private static string token = string.Empty;

- In static void Main(string[] args):

      {
        //Get an authentication access token
        token = GetToken();
      }

- Add a GetToken() method:

      #region Get an authentication access token
      private static string GetToken()
      {
          // TODO: Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612
          // and add using Microsoft.IdentityModel.Clients.ActiveDirectory

          //TODO: Remove
          //The client id that Azure AD creates when you register your client app.
          string clientID = "{Client_ID}";

          //RedirectUri you used when you register your app.
          //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
          // You can use this redirect uri for your client app
          string redirectUri = "https://login.live.com/oauth20_desktop.srf";

          //Resource Uri for Power BI API
          string resourceUri = "https://analysis.windows.net/powerbi/api";

          //OAuth2 authority Uri
          string authorityUri = "https://login.windows.net/common/oauth2/authorize";

          //Get access token:
          // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
          // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
          // To install the Active Directory Authentication Library NuGet package in Visual Studio,
          //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

          // AcquireToken will acquire an Azure access token
          // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
          AuthenticationContext authContext = new AuthenticationContext(authorityUri);
          string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

          Console.WriteLine(token);
          Console.ReadLine();

          return token;
      }

      #endregion

After you get an authentication token, you can call any Power BI operation. The next step shows you how to call the [Create Dataset] operation to push data into a dashboard.

The [next step] shows you how to create a dataset in a Power BI dashboard.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/)


<a name="push_step3"/>
## Step 3 - Create a dataset in a Power BI dashboard

To push data into a Power BI dashboard, you call the [Create Dataset] operation and the [Add Rows] operation.

To make a call to a REST resource, you use a url that locates the resource, and you send a JavaScript Object Notation (JSON) string, which describes the dataset, to the Power BI service resource. A REST resource identifies the part of the Power BI service you want to work with. To push data into the dashboard, the target resource is a **Dashboard Dataset**.

The URL that identifies a dataset is https://api.PowerBI.com/v1.0/myorg/datasets. If you are pushing data within a group, the url is https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets

When you call the [Create Dataset] operation, you create a new dataset in your dashboard.

![](media/powerbi-developer-walkthrough-to-push-data/powerbi-developer-create-dataset.png)

Here's how to push data into a dashboard using the Power BI API:

1. In the Console Application project you created in [Step 2 - Get an authentication access token], add **using System.Net**, and **using System.IO** to Program.cs.
2. In Program.cs, add the code below.
3. Run the Console App, and login to your Power BI account. You should see **Dataset Created** in the Console Window.

** Sample push data into a dashboard **

Add this code into Program.cs.

- In static void Main(string[] args):

      {
        ...
        //Create a dataset in a Power BI dashboard
        CreateDataset();
      }

- Add a CreateDataset() method:

      #region Create a dataset in a Power BI dashboard
      private static void CreateDataset()
      {
          //TODO: Add using System.Net and using System.IO

          //Push data into a Power BI dashboard

          string powerBIDatasetsApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";
          //POST web request to create a dataset.
          //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
          HttpWebRequest request = System.Net.WebRequest.Create(powerBIDatasetsApiUrl) as System.Net.HttpWebRequest;
          request.KeepAlive = true;
          request.Method = "POST";
          request.ContentLength = 0;
          request.ContentType = "application/json";
          request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

          //Create dataset JSON for POST request
          string datasetJson = "{\"name\": \"SalesMarketing\", \"tables\": " +
              "[{\"name\": \"Product\", \"columns\": " +
              "[{ \"name\": \"ProductID\", \"dataType\": \"Int64\"}, " +
              "{ \"name\": \"Name\", \"dataType\": \"string\"}, " +
              "{ \"name\": \"Category\", \"dataType\": \"string\"}," +
              "{ \"name\": \"IsCompete\", \"dataType\": \"bool\"}," +
              "{ \"name\": \"ManufacturedOn\", \"dataType\": \"DateTime\"}" +
              "]}]}";

          //POST web request
          byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(datasetJson);
          request.ContentLength = byteArray.Length;

          //Write JSON byte[] into a Stream
          using (Stream writer = request.GetRequestStream())
          {
              writer.Write(byteArray, 0, byteArray.Length);

              var response = (HttpWebResponse)request.GetResponse();

              Console.WriteLine(string.Format("Dataset {0}", response.StatusCode.ToString()));

              Console.ReadLine();
          }
      }
      #endregion

The [next step] shows you how to get a dataset to add rows into a Power BI table.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/)
- [Create Dataset]


## Step 3 - Get a dataset to add rows into a Power BI table

To push data into a Power BI dashboard, you need to reference the table in the dataset. To reference a table in a dataset, you first need to get a **Dataset ID**. You get a **Dataset ID** using the [Get Dataset] operation. The **Get Dataset** operation returns a JSON string containing a list of all datasets in a Power BI dashboard. The recommended way to deserialize a JSON string in with [Newtonsoft.Json].

Here's how you get a dataset.

**Get a Power BI dataset**

1. In the Console Application project you created in [Step 2 - Get an authentication access token], install the Newtonsoft.Json NuGet package.

  a. In Visual Studio 2015, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.

  b. In **Package Manager Console**, enter Install-Package Newtonsoft.Json.

2. After the package is installed, add **using Newtonsoft.Json** to Program.cs.

3.  In Program.cs, add the code below to get a **Dataset ID**.

** Sample get a dataset **

Add this code into Program.cs.

- In static void Main(string[] args):

      {
        ...
        //Get a dataset to add rows into a Power BI table
        string datasetId = GetDataset();
      }

- Add a GetDatset() method:

      #region Get a dataset to add rows into a Power BI table

      //Change request method to "GET"
      request.Method = "GET";

      //Add access token to Request header
      request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

      string datasetId = string.Empty;
      //Get HttpWebResponse from GET request
      using (HttpWebResponse httpResponse = request.GetResponse() as System.Net.HttpWebResponse)
      {
          //Get StreamReader that holds the response stream
          using (StreamReader reader = new System.IO.StreamReader(httpResponse.GetResponseStream()))
          {
              string responseContent = reader.ReadToEnd();

              //TODO: Install NuGet Newtonsoft.Json package: Install-Package Newtonsoft.Json
              //and add using Newtonsoft.Json
              var results = JsonConvert.DeserializeObject<dynamic>(responseContent);

              datasetId = results["id"].Value;
          }
      }

      #endregion

The [next step] shows you how to add rows to a Power BI table.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Azure AD Authentication Library for .NET NuGet package](https://www.nuget.org/packages/Microsoft.IdentityModel.Clients.ActiveDirectory/)
- [Get Dataset]


## Step 4 - Add rows to a Power BI table

After you get a **Dataset ID**, you use the [Add Rows] operation to add rows to a Power BI dataset.

When you call the [Add Rows] operation, you add rows to a dataset in your dashboard.

![](media/powerbi-developer-walkthrough-to-push-data/powerbi-developer-add-rows.png)

Here's how to add rows to a dataset using the Power BI API:

1. In Program.cs, add the code below.
2. Run the Console App, and login to your Power BI account. You should see **Rows Added** in the Console Window.

** Sample push data into a dashboard **

Add this code into Program.cs.

- In static void Main(string[] args):

      {
        ...
        //Add rows to a Power BI table
        AddRows(datasetId, "Product");
      }

- Add an AddRows() method:

      #region Add rows to a Power BI table
      private static void AddRows(string datasetId, string tableName)
      {
          string powerBIApiAddRowsUrl = String.Format("https://api.powerbi.com/v1.0/myorg/datasets/{0}/tables/{1}/rows", datasetId, tableName);

          //POST web request to add rows.
          //To add rows to a dataset in a group, use the Groups uri: https://api.powerbi.com/v1.0/myorg/groups/{group_id}/datasets/{dataset_id}/tables/{table_name}/rows
          //Change request method to "POST"
          HttpWebRequest request = System.Net.WebRequest.Create(powerBIApiAddRowsUrl) as System.Net.HttpWebRequest;
          request.KeepAlive = true;
          request.Method = "POST";
          request.ContentLength = 0;
          request.ContentType = "application/json";
          request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

          //JSON content for product row
          string rowsJson = "{\"rows\":" +
              "[{\"ProductID\":1,\"Name\":\"Adjustable Race\",\"Category\":\"Components\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}," +
              "{\"ProductID\":2,\"Name\":\"LL Crankarm\",\"Category\":\"Components\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}," +
              "{\"ProductID\":3,\"Name\":\"HL Mountain Frame - Silver\",\"Category\":\"Bikes\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}]}";

          //POST web request
          byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(rowsJson);
          request.ContentLength = byteArray.Length;

          //Write JSON byte[] into a Stream
          using (Stream writer = request.GetRequestStream())
          {
              writer.Write(byteArray, 0, byteArray.Length);

              var response = (HttpWebResponse)request.GetResponse();

              Console.WriteLine("Rows Added");

              Console.ReadLine();
          }
      }

      #endregion


To learn other things you can do with the Power BI API, go to

-	[Authenticate a Power BI web app](powerbi-developer-create-your-first-web-app.md)
-	[Integrate a Power BI tile into an app](powerbi-developer-integrate-a-power-bi-tile.md)
-	[Integrate a Power BI report into an app](powerbi-developer-integrate-a-power-bi-report.md)

The [next step] shows you how to add rows to a Power BI table.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Add Rows]

## Push data into a Power BI dashboard - Complete code listing

After you follow Steps 2 to 4 in the [Walkthrough to push data into a Power BI dashboard], your complete code should look like the following. You can also download all the code for this walkthrough on GitHub. See [Walkthrough to push data into a Power BI dashboard on GitHub

      using System;
      using System.IO;
      using System.Net;

      //Get an authentication access token
      using Microsoft.IdentityModel.Clients.ActiveDirectory;

      //Get a dataset
      using Newtonsoft.Json;

      namespace ConsoleApplication1
      {
      class Program
      {
          private static string token = string.Empty;

          static void Main(string[] args)
          {
              //Get an authentication access token
              token = GetToken();

              //Create a dataset in a Power BI dashboard
              CreateDataset();

              //Get a dataset to add rows into a Power BI table
              string datasetId = GetDataset();

              //Add rows to a Power BI table
              AddRows(datasetId, "Product");
          }

          #region Get an authentication access token
          private static string GetToken()
          {
              // TODO: Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612
              // and add using Microsoft.IdentityModel.Clients.ActiveDirectory

              //TODO: Remove
              //The client id that Azure AD creates when you register your client app.
              string clientID = "746f8074-c71a-4622-8442-a927d397a791";

              //RedirectUri you used when you register your app.
              //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
              // You can use this redirect uri for your client app
              string redirectUri = "https://login.live.com/oauth20_desktop.srf";

              //Resource Uri for Power BI API
              string resourceUri = "https://analysis.windows.net/powerbi/api";

              //OAuth2 authority Uri
              string authorityUri = "https://login.windows.net/common/oauth2/authorize";

              //Get access token:
              // To call a Power BI REST operation, create an instance of AuthenticationContext and call AcquireToken
              // AuthenticationContext is part of the Active Directory Authentication Library NuGet package
              // To install the Active Directory Authentication Library NuGet package in Visual Studio,
              //  run "Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory" from the nuget Package Manager Console.

              // AcquireToken will acquire an Azure access token
              // Call AcquireToken to get an Azure token from Azure Active Directory token issuance endpoint
              AuthenticationContext authContext = new AuthenticationContext(authorityUri);
              string token = authContext.AcquireToken(resourceUri, clientID, new Uri(redirectUri)).AccessToken;

              Console.WriteLine(token);
              Console.ReadLine();

              return token;
          }

          #endregion


          #region Create a dataset in a Power BI dashboard
          private static void CreateDataset()
          {
              //TODO: Add using System.Net and using System.IO

              //Push data into a Power BI dashboard

              string powerBIDatasetsApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";
              //POST web request to create a dataset.
              //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
              HttpWebRequest request = System.Net.WebRequest.Create(powerBIDatasetsApiUrl) as System.Net.HttpWebRequest;
              request.KeepAlive = true;
              request.Method = "POST";
              request.ContentLength = 0;
              request.ContentType = "application/json";
              request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

              //Create dataset JSON for POST request
              string datasetJson = "{\"name\": \"SalesMarketing\", \"tables\": " +
                  "[{\"name\": \"Product\", \"columns\": " +
                  "[{ \"name\": \"ProductID\", \"dataType\": \"Int64\"}, " +
                  "{ \"name\": \"Name\", \"dataType\": \"string\"}, " +
                  "{ \"name\": \"Category\", \"dataType\": \"string\"}," +
                  "{ \"name\": \"IsCompete\", \"dataType\": \"bool\"}," +
                  "{ \"name\": \"ManufacturedOn\", \"dataType\": \"DateTime\"}" +
                  "]}]}";

              //POST web request
              byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(datasetJson);
              request.ContentLength = byteArray.Length;

              //Write JSON byte[] into a Stream
              using (Stream writer = request.GetRequestStream())
              {
                  writer.Write(byteArray, 0, byteArray.Length);

                  var response = (HttpWebResponse)request.GetResponse();

                  Console.WriteLine(string.Format("Dataset {0}", response.StatusCode.ToString()));

                  Console.ReadLine();
              }
          }
          #endregion


          #region Get a dataset to add rows into a Power BI table
          private static string GetDataset()
          {
              string powerBIDatasetsApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";
              //POST web request to create a dataset.
              //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
              HttpWebRequest request = System.Net.WebRequest.Create(powerBIDatasetsApiUrl) as System.Net.HttpWebRequest;
              request.KeepAlive = true;
              request.Method = "GET";
              request.ContentLength = 0;
              request.ContentType = "application/json";
              request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

              string datasetId = string.Empty;
              //Get HttpWebResponse from GET request
              using (HttpWebResponse httpResponse = request.GetResponse() as System.Net.HttpWebResponse)
              {
                  //Get StreamReader that holds the response stream
                  using (StreamReader reader = new System.IO.StreamReader(httpResponse.GetResponseStream()))
                  {
                      string responseContent = reader.ReadToEnd();

                      //TODO: Install NuGet Newtonsoft.Json package: Install-Package Newtonsoft.Json
                      //and add using Newtonsoft.Json
                      var results = JsonConvert.DeserializeObject<dynamic>(responseContent);

                      //Get the first id
                      datasetId = results["value"][0]["id"];

                      Console.WriteLine(String.Format("Dataset ID: {0}", datasetId));
                      Console.ReadLine();

                      return datasetId;
                  }
              }
          }
          #endregion


          #region Add rows to a Power BI table
          private static void AddRows(string datasetId, string tableName)
          {
              string powerBIApiAddRowsUrl = String.Format("https://api.powerbi.com/v1.0/myorg/datasets/{0}/tables/{1}/rows", datasetId, tableName);

              //POST web request to add rows.
              //To add rows to a dataset in a group, use the Groups uri: https://api.powerbi.com/v1.0/myorg/groups/{group_id}/datasets/{dataset_id}/tables/{table_name}/rows
              //Change request method to "POST"
              HttpWebRequest request = System.Net.WebRequest.Create(powerBIApiAddRowsUrl) as System.Net.HttpWebRequest;
              request.KeepAlive = true;
              request.Method = "POST";
              request.ContentLength = 0;
              request.ContentType = "application/json";
              request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

              //JSON content for product row
              string rowsJson = "{\"rows\":" +
                  "[{\"ProductID\":1,\"Name\":\"Adjustable Race\",\"Category\":\"Components\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}," +
                  "{\"ProductID\":2,\"Name\":\"LL Crankarm\",\"Category\":\"Components\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}," +
                  "{\"ProductID\":3,\"Name\":\"HL Mountain Frame - Silver\",\"Category\":\"Bikes\",\"IsCompete\":true,\"ManufacturedOn\":\"07/30/2014\"}]}";

              //POST web request
              byte[] byteArray = System.Text.Encoding.UTF8.GetBytes(rowsJson);
              request.ContentLength = byteArray.Length;

              //Write JSON byte[] into a Stream
              using (Stream writer = request.GetRequestStream())
              {
                  writer.Write(byteArray, 0, byteArray.Length);

                  var response = (HttpWebResponse)request.GetResponse();

                  Console.WriteLine("Rows Added");

                  Console.ReadLine();
              }
          }

          #endregion
      }
      }


## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Push data into a Power BI dashboard](powerbi-developer-push-data-into-a-dashboard.md)
- [NuGet - Azure AD]
- [Create Dataset](https://msdn.microsoft.com/library/mt203562.aspx)
- [Get datasets]()
- [Nuget - JSON.net]
- [Add Rows](https://msdn.microsoft.com/library/mt203561.aspx)
