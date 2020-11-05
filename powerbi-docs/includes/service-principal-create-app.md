---
title: Service principal create app
description: Service principal create app
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 05/20/2020
ms.custom: include file
---

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and click the **App registrations** link.

    ![azure app registration](media/embedded-service-principal/azure-app-registration.png)

3. Click **New registration**.

    ![new registration](media/embedded-service-principal/new-registration.png)

4. Fill in the required information:
    * **Name** - Enter a name for your application
    * **Supported account types** - Select supported account types
    * (Optional) **Redirect URI** - Enter a URI if needed

5. Click **Register**.

6. After registering, the *Application ID* is available from the **Overview** tab. Copy and save the *Application ID* for later use.

    ![Screenshot shows where to obtain an Application I D in the Overview tab.](media/embedded-service-principal/application-id.png)