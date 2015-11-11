<properties
   pageTitle="Introduction to creating a Power BI app"
   description="Introduction to creating a Power BI app"
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
   ms.date="11/6/2015"
   ms.author="derrickv"/>

# Introduction to creating a Power BI app

With the Power BI REST API, you can create your own business solution to push data into a Power BI dashboard in real-time.  Your dashboards will be updated in real-time when the data changes. You can use your choice of technology, including .NET, JQuery or Ruby, to write your app. The Power BI REST API uses industry standards such as OAuth2, and has REST operations to push data into a Power BI dashboard in real time.

### Here is what you need to create a Power BI app

|What you need | Description |
|-|-|
| [Azure Active Directory tenant](Create+an+Azure+Active+Directory+tenant.md) | Power BI apps are integrated with  Azure Active Directory (Azure AD) to provide secure sign in and authorization for your app.|
|[Register your client app](Register+a+client+app.md) or [Register your web app](Register+a+web+app.md) | To allow your application access to the Power BI REST API, you need to register your application with Azure Active Directory.|
|[Authenticate your app](Authenticate+to+Power+BI+service.md)  | Power BI client apps use Active Directory (AAD) to authenticate users and protect applications. Learn how to [Authenticate a client app](Authenticate+a+client+app.md) or [Authenticate a web app](Authenticate+a+web+app.md).|
|[Call Power BI REST operations](Power+BI+REST+API+reference.md)  | With the Power BI REST API, you can: Create and get datasets, get and update table schemas, and add and delete rows. <br/><br/> **Note** You can call any Power BI REST operation on a [Group](Get+Groups.md).|

<a name="QuickStarts"/>
### Quick starts to call each Power BI REST operation

|Quick start example | Description |
|-|-|
|[Create Dataset Example](Create+Dataset.md#example) | Shows how to create a dataset.  |
|[Get Datasets Example](Get+Datasets.md#example)  | Shows how to get a dataset including how to **Deserialize** the JSON response using the **JavaScriptSerializer** class.|
|[Get Tables Example](Get+Tables.md#example)  | Shows how to get dataset tables. It also shows how to get a Dataset id using a LINQ query, and **Deserialize** the JSON response using the **JavaScriptSerializer** class. |
|[Update Table Schema Example](Update+Table+Schema.md#example) | Shows how to update a table schema. It also shows how to get a Dataset id using a LINQ query.|
|[Add Rows Example](Add+Rows.md#example) | Shows how to add rows to a dataset.  It also shows how to get a Dataset id using a LINQ query.|
|[Delete Rows Example](Delete+Rows.md#example) | Shows how to delete rows from a dataset.  It also shows how to get a Dataset id using a LINQ query. |
|[Get Groups Example](Get+Groups.md#example) | Shows you how to get groups that the signed in user is a member of. It also shows how to **Deserialize** the JSON response using the **JavaScriptSerializer** class.|

### Power BI samples
|Power BI sample| Description |
|-|-|
|[Client app sample](Power+BI+client+app+sample.md) | Shows how to get an access token for a client app and execute all Power BI REST operations.|
|[ASP.NET web app sample](Power+BI+web+app+sample.md) | Shows how to get an access token for a web app and execute a Power BI REST operation.|
