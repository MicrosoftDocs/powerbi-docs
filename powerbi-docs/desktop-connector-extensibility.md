---
title: Connector Extensibility in Power BI
description: Connector extensibility capabilities, features, security settings, and certified connectors
author: cpopell
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 01/02/2020
ms.author: gepopell

LocalizationGroup: Connect to data
---

# Connector extensibility in Power BI

In Power BI, you can connect to data by using existing connectors and generic data sources, like ODBC, OData, OLE DB, Web, CSV, XML, and JSON. Or, developers can extend data sources with custom data extensions called *custom connectors*. Some custom connectors are certified and distributed by Microsoft as *certified connectors*.

If you plan to use non-certified custom connectors that you or a third party have developed, you must adjust the Power BI Desktop security settings to allow extensions to load without validation or warning. Because this code can handle credentials, including sending them over HTTP, and ignore privacy levels, you should only use this security setting if you absolutely trust your custom connectors.

## Custom connectors

Non-certified custom connectors can range from small business-critical APIs to large industry-specific services that Microsoft hasn't released a connector for. Many connectors are distributed by vendors. If you need a specific data connector, contact the vendor. 

To use a non-certified custom connector, put the connector *.pq* file in the *\[Documents]\\Power BI Desktop\\Custom Connectors* folder. If the folder doesn't exist, create it.

In Power BI Desktop, adjust the data extension security settings as follows:

Select **File** > **Options and settings** > **Options** > **Security**.

Under **Data Extensions**, select **(Not Recommended) Allow any extension to load without validation or warning**. Then restart Power BI Desktop. 

![Allow non-certified custom connectors in Data Extension Security options](media/desktop-connector-extensibility/data-extension-security-1.png)

The default Power BI Desktop data extension security setting is **(Recommended) Only allow Microsoft certified and other trusted third-party extensions to load**. With this setting, if there are non-certified custom connectors on your system, the **Uncertified Connectors** dialog box appears at Power BI Desktop startup, listing the connectors that can't securely load.

![Uncertified Connectors dialog box](media/desktop-connector-extensibility/data-extension-security-2.png)

To resolve the error, you can either change the security setting, or remove the uncertified connectors from your *Custom Connectors* folder.

## Certified connectors

A limited subset of data extensions is considered *certified*. While Microsoft distributes the connectors, it's not responsible for their performance or continued function. The third-party developer who created the connector is responsible for its maintenance and support. 

In Power BI Desktop, certified third-party connectors appear in the list in the **Get Data** dialog box, along with all other connectors. You don't need to adjust security settings to use certified connectors.

If you would like a custom connector to be certified, ask your vendor to contact dataconnectors@microsoft.com.
