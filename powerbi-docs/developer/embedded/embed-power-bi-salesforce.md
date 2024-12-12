---
title: Embed Power BI content in Salesforce
description: Learn how to embed Power BI content in Salesforce by using embedded analytics developer samples that use different solutions.
author: mberdugo
ms.author: monaberdugo
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: how-to
ms.date: 06/03/2024
#customer intent: As a developer, I want to embed Power BI content in Salesforce so that I can provide integrated analytics solutions.
---

# Embed Power BI content in Salesforce

[Salesforce](https://www.salesforce.com/) is a world-renowned customer relationship management (CRM) solution. Power BI embedded analytics lets you embed Power BI content, such as reports and dashboards, in Salesforce.

This article links to two samples that show how to develop by using Power BI embedded analytics in a Salesforce environment. The two developer samples demonstrate two different solutions that enable embedding Power BI content in Salesforce: the *embed for your customers* solution and the *embed for your organization* solution.

## Prerequisites

You must be familiar with both Power BI and Salesforce. It's helpful to have experience developing with Power BI embedded analytics and be familiar with the Salesforce environment, preferably with the Salesforce Developer Experience (SFDX).

## How to embed Power BI content in Salesforce

### [Embed for your customers solution](#tab/embed-for-your-customerslution)

In the embed for your customers solution, you create an embedded application by using your own Power BI account. The embed for your customers solution is also known as an *app owns data* solution. Your customers don't need to use Power BI credentials to view and interact with the embedded content.

#### Apex class

The Salesforce *embed for your customers* solution uses a [service principal](embed-service-principal.md) and is built on top of an Apex class named `PowerBiEmbedManager`.

Here are some advantages of the `PowerBiEmbedManager` Apex class:

* The `PowerBiEmbedManager` Apex class is programmed to interact with both Microsoft Entra ID and the [Power BI REST APIs](/rest/api/power-bi/).

* The `PowerBiEmbedManager` Apex class implements [Client Credentials Flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow) when it interacts with Microsoft Entra ID to acquire an app-only access token. App-only access tokens are important because they allow you to call the Power BI REST APIs under the identity of a service principal, instead of calling under the identity of a user.

#### Lightning Aura

The Salesforce embed for your customers solution contains a Lightning Aura component named `powerBiReportAura`. When you add an instance of the `powerBiReportAura` component to a Lightning application page, you must configure it with a specific Power BI *Workspace ID* and *Report ID*. This design makes it possible to add multiple instances of the `powerBiReportAura` component, and configure each instance to embed a different Power BI report.

#### Embed for your customers solution Salesforce developer sample

To embed Power BI content by using the embed for your customers Salesforce solution, follow the instructions in the [SalesforceAppOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceAppOwnsDataEmbedding) GitHub repository.

### [Embed for your organization solution](#tab/embed-for-your-organization)

In the embed for your organization solution, you create an embedded application that requires your customers to sign in with their own Power BI credentials. The embed for your organization solution is also known as a *user owns data* solution. Signed in customers can view and interact with the embedded content according to their Power BI permissions.

#### Single page application

The Salesforce embed for your organization Salesforce solution uses a simple single page application (SPA) that implements Power BI reports. The solution is built by using three essential files:

* *index.html*
* *app.css*
* *app.js*

#### Client-side libraries

In the Salesforce embed for your organization Salesforce solution, `powerbi.js` is used to access the [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/).

#### Embed for your organization solution Salesforce developer sample

To embed Power BI content that uses the embed for your organization solution, follow the instructions in the [SalesforceUserOwnsDataEmbedding](https://github.com/PowerBiDevCamp/SalesforceUserOwnsDataEmbedding) GitHub repository.

---

## Pass parameters to Power BI reports

To pass parameters to Power BI reports, use the [Power BI JavaScript APIs](/javascript/api/overview/powerbi/). Use the [Control report filters API](/javascript/api/overview/powerbi/control-report-filters) to filter the Salesforce data and pass the results to the Power BI report.

## Related content

* [Embed Power BI content into an application for your customers](embed-sample-for-customers.md)

* [Embed Power BI content into an application for your organization](embed-sample-for-your-organization.md)

* [Power BI embedded analytics Client APIs](/javascript/api/overview/powerbi/)

More questions? Try asking the [Power BI Community](https://community.powerbi.com/)
