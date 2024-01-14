---
title: Embedded analytics tutorial for getting the client secret
description: Get the client secret for the embedded analytics tutorials.
services: powerbi
author: KesemSharabi
ms.author: kesharab
ms.topic: include
ms.date: 12/09/2020
ms.custom: include file
---

To get the client secret, follow these steps:

1. Log into [Microsoft Azure](https://ms.portal.azure.com/#allservices).

2. Search for **App registrations** and select the **App registrations** link.

3. Select the Microsoft Entra app you're using for embedding your Power BI content.

4. Under **Manage**, select **Certificates & secrets**.

5. Under **Client secrets**, select **New client secret**.

6. In the **Add a client secret** pop-up window, provide a description for your application secret, select when the application secret expires, and select **Add**.

7. From the **Client secrets** section, copy the string in the **Value** column of the newly created application secret. The client secret value is your *client ID*.

>[!NOTE]
>Make sure you copy the client secret value when it first appears. After navigating away from this page, the client secret will be hidden and you'll not be able to retrieve its value.
