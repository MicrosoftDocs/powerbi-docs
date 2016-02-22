<properties
   pageTitle="Walkthrough to push data - Get a dataset to add rows into a Power BI table"
   description="Walkthrough to push data - Get a dataset to add rows into a Power BI table"
   services="powerbi"
   documentationCenter=""
   authors="dvana"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="get-started-article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="02/21/2016"
   ms.author="derrickv"/>

# Step 4: [Walkthrough to push data](powerbi-developer-walkthrough-push-data.md) > Get a dataset to add rows into a Power BI table

In **step 3** of Walkthrough to push data, [Create a dataset in a Power BI dashboard](powerbi-developer-walkthrough-push-data-create-dataset.md), you called the [Create Dataset](https://msdn.microsoft.com/library/mt203562.aspx) operation to create a dataset in a dashboard. In the step, you use the [Get Datasets](https://msdn.microsoft.com/library/mt203567.aspx) operation and Newtonsoft.Json to get a dataset id. You use the dataset id in step 4 to add rows to a dataset.

To push data into a Power BI dashboard, you need to reference the table in the dataset. To reference a table in a dataset, you first need to get a **Dataset ID**. You get a **Dataset ID** using the [Get Dataset](https://msdn.microsoft.com/library/mt203567.aspx) operation. The **Get Dataset** operation returns a JSON string containing a list of all datasets in a Power BI dashboard. The recommended way to deserialize a JSON string in with [Newtonsoft.Json](http://www.newtonsoft.com/json).

>**NOTE**: To authenticate a Power BI REST operation, you add the token you got in [Get an authentication access token](powerbi-developer-walkthrough-push-data-get-token.md) to a request header:

    //Add token to the request header
    request.Headers.Add("Authorization", String.Format("Bearer {0}", token));

Here's how you get a dataset.

**NOTE**
Before you get started, make sure to [setup your app environment in Azure Active Directory (Azure AD)](powerbi-developer-what-you-need-to-create-an-app.md).

**Get a Power BI dataset**

1. In the Console Application project you created in Step 2: Walkthrough to push data, [Get an authentication access token](powerbi-developer-walkthrough-push-data-get-token.md), install the Newtonsoft.Json NuGet package.

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

          //Add token to the request header
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

The [next step](powerbi-developer-walkthrough-push-data-add-rows.md) shows you how to add rows to a Power BI table.

## See also
- [What you need to create an app](powerbi-developer-what-you-need-to-create-an-app.md)
- [Newtonsoft.Json](http://www.newtonsoft.com/json)
- [Get Datasets](https://msdn.microsoft.com/library/mt203567.aspx)
- [Power BI REST API reference](https://msdn.microsoft.com/library/mt147898.aspx)
- [Overview of Power BI REST API](powerbi-developer-overview-of-power-bi-rest-api.md)
