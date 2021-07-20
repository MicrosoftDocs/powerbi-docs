---
title: Create a dataset
description: Walkthrough - Push data into a dataset - Create a dataset in Power BI.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: madia
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 02/05/2019
---

# Step 3: Create a dataset in Power BI
This article is part of a step-by-step walkthrough to [push data into a dataset](walkthrough-push-data.md).

In **step 2** of Push data into a dataset, [Get an authentication access token](walkthrough-push-data-get-token.md), you got a token to authenticate to **Azure AD**. In this step, you use the token to call the [PostDataset](/rest/api/power-bi/pushdatasets) operation.

To make a call to a REST resource, you use a url that locates the resource, and you send a JavaScript Object Notation (JSON) string, which describes the dataset, to the Power BI service resource. A REST resource identifies the part of the Power BI service you want to work with. To push data into the dataset, the target resource is a **Dataset**. The URL that identifies a dataset is `https://api.PowerBI.com/v1.0/myorg/datasets`. If you are pushing data within a group, the url is `https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets`.

To authenticate a Power BI REST operation, you add the token you got in [Get an authentication access token](walkthrough-push-data-get-token.md) to a request header:

When you call the [PostDataset](/rest/api/power-bi/pushdatasets) operation, a new dataset is created. 

![create dataset](media/walkthrough-push-data-create-dataset/powerbi-developer-create-dataset.png)

Here's how to create a dataset in Power BI.

## Create a dataset in Power BI
> [!NOTE]
> Before you get started, make sure you have followed the previous steps in the [push data into a dataset](walkthrough-push-data.md) walkthrough.
> 
> 

1. In the Console Application project you created in [Step 2 - Get an authentication access token](walkthrough-push-data-get-token.md), add **using System.Net;**, and **using System.IO;** to Program.cs.
2. In Program.cs, add the code below.
3. Run the Console App, and login to your Power BI account. You should see **Dataset Created** in the Console Window. Also, you can login to Power BI to see the new dataset.

**Sample push data into a dataset**

Add this code into Program.cs.

* In static void Main(string[] args):
  
    ```csharp
    static void Main(string[] args)
    {
        //Get an authentication access token
        token = GetToken();
  
        //Create a dataset in Power BI
        CreateDataset();
    }
    ```
* Add a CreateDataset() method:
  
    ```csharp
    #region Create a dataset in Power BI
    private static void CreateDataset()
    {
        //TODO: Add using System.Net and using System.IO
  
        string powerBIDatasetsApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";
        //POST web request to create a dataset.
        //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
        HttpWebRequest request = System.Net.WebRequest.Create(powerBIDatasetsApiUrl) as System.Net.HttpWebRequest;
        request.KeepAlive = true;
        request.Method = "POST";
        request.ContentLength = 0;
        request.ContentType = "application/json";
  
        //Add token to the request header
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
    ```

The next step shows you how to [get a dataset to add rows into a Power BI table](walkthrough-push-data-get-datasets.md).

Below is the [complete code listing](#code).

<a name="code"></a>

## Complete code listing

```csharp
using System;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using System.Net;
using System.IO;

namespace walkthrough_push_data
{
    class Program
    {
        private static string token = string.Empty;

        static void Main(string[] args)
        {

            //Get an authentication access token
            token = GetToken();

            //Create a dataset in Power BI
            CreateDataset();

        }

        #region Get an authentication access token
        private static string GetToken()
        {
            // TODO: Install-Package Microsoft.IdentityModel.Clients.ActiveDirectory -Version 2.21.301221612
            // and add using Microsoft.IdentityModel.Clients.ActiveDirectory

            //The client id that Azure AD created when you registered your client app.
            string clientID = "{Client_ID}";

            //RedirectUri you used when you register your app.
            //For a client app, a redirect uri gives Azure AD more details on the application that it will authenticate.
            // You can use this redirect uri for your client app
            string redirectUri = "https://login.live.com/oauth20_desktop.srf";

            //Resource Uri for Power BI API
            string resourceUri = "https://analysis.windows.net/powerbi/api";

            //OAuth2 authority Uri
            string authorityUri = "https://login.microsoftonline.com/common/";

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


        #region Create a dataset in Power BI
        private static void CreateDataset()
        {
            //TODO: Add using System.Net and using System.IO

            string powerBIDatasetsApiUrl = "https://api.powerbi.com/v1.0/myorg/datasets";
            //POST web request to create a dataset.
            //To create a Dataset in a group, use the Groups uri: https://api.PowerBI.com/v1.0/myorg/groups/{group_id}/datasets
            HttpWebRequest request = System.Net.WebRequest.Create(powerBIDatasetsApiUrl) as System.Net.HttpWebRequest;
            request.KeepAlive = true;
            request.Method = "POST";
            request.ContentLength = 0;
            request.ContentType = "application/json";

            //Add token to the request header
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
    }
}
```

[Next Step >](walkthrough-push-data-get-datasets.md)

## Next steps
* [Get a dataset to add rows into a Power BI table](walkthrough-push-data-get-datasets.md)  
* [Get an authentication access token](walkthrough-push-data-get-token.md)  
* [PostDataset](/rest/api/power-bi/pushdatasets/datasets_postdataset)  
[PostDatasetInGroup](/rest/api/power-bi/pushdatasets/datasets_postdatasetingroup)  
* [Push data into a Power BI Dashboard](walkthrough-push-data.md)  
* [Overview of Power BI REST API](overview-of-power-bi-rest-api.md)  
* [Power BI REST API reference](/rest/api/power-bi/)  

More questions? [Try the Power BI Community](https://community.powerbi.com/)
