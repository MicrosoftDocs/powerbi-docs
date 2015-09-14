<properties
   pageTitle="Configure a Power BI Analysis Services Connector"
   description="Configure a Power BI Analysis Services Connector"
   services="powerbi"
   documentationCenter=""
   authors="v-anpasi"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/16/2015"
   ms.author="v-anpasi"/>

# Configure a Power BI Analysis Services Connector

[← Big data and more](https://support.powerbi.com/media/knowledgebase/topics/88773-big-data-and-more)

##[**Download the Analysis Services Connector Preview now**](http://www.microsoft.com/en-us/download/details.aspx?id=45333)  

This is a test edit again

Before users can connect to a SQL Server Analysis Services tabular model, a Power BI Analysis Services connector needs to be configured for the server.  If you have more than one Analysis Services server, you'll need to configure one connector per server. This is done by a server administrator. For more detailed information about how the connector works, be sure to see [Power BI Analysis Services Connector in-depth](http://support.powerbi.com/media/knowledgebase/articles/546004-power-bi-analysis-services-connector-in-depth).

Once the connector is configured, tabular model databases on the Analysis Services server instance will appear in the SQL Server Analysis Services page in Power BI. Creating the connection requires a Windows account and password with Server Administrator permissions for the server instance you are connecting to. Once configured, users will need to have at least Read permissions for any tabular model databases they’re connecting to.

The connector can run on any domain computer. It doesn't have to be your local computer or the Analysis Services server, as it's just acting as a proxy between Analysis Services and Power BI. The connector makes the connection to Analysis Services and passes the credentials of the user accessing Power BI along to it. The computer where it is installed has to remain turned on, connected to the network, and able to access the Analysis Services server at all times.

![](media/powerbi-analysis-services-connector/importantIcon.png) **Important:**

-   Only SQL Server Analysis Services Tabular models are supported for Power BI
-   The connector has to continue running and the computer where it is installed has to remain on.

**Prerequisites**  

-   .NET Framework 4.5.1 or later must be installed on the computer.
-   Installing the Power BI Analysis Services Connector and the Data Management Gateway on the same computer is not supported. If you already have the Data Management Gateway installed, uninstall it before installing the Power BI Analysis Services Connector, or install the Connector on different computer.
-   The Analysis Services server is domain joined.
-   The Analysis Services connector & Analysis Services server are installed on computers in the same domain.
-   If you use a .onmicrosoft.com email address, you'll need to sync your Active Directory to Azure Active Directory using Azure Active Directory Sync (DirSync). To learn more. see [Power BI Analysis Services Connector in-depth](http://support.powerbi.com/media/knowledgebase/articles/546004-power-bi-analysis-services-connector-in-depth).

## To install and configure a Power BI Analysis Services Connector

1.  In Power BI, click on the Settings icon ![](media/powerbi-analysis-services-connector/settingsIcon.png)  \> **Analysis Services Connector Preview**.

    ![](media/powerbi-analysis-services-connector/ASConnector_Download.png)  
     **Note**: You can also [download the Analysis Services Connector Preview from the Microsoft Download Center](http://www.microsoft.com/en-us/download/details.aspx?id=45333).
2.  Click **Run**.

    ![](media/powerbi-analysis-services-connector/ASConnector_Run.png)

3.  Review the terms, then click **Install**. You can click **Options** to change the default location where the connector will be installed.

    ![](media/powerbi-analysis-services-connector/ASConnector_Terms.png)  
    **Note**: To uninstall a Power BI Analysis Services Connector, use Uninstall in Control Panel.
4.  After installing, click **Launch** to open the Power BI Analysis Services Connector Wizard. The Wizard will guide you through configuring a connector to your server instance.

    ![](media/powerbi-analysis-services-connector/ASConnector_Launch.png)

5.  In the Wizard, click **Next**.

     ![](media/powerbi-analysis-services-connector/ASConnector_Next.png)

6.  Sign into your Power BI account.

     ![](media/powerbi-analysis-services-connector/ASConnector_SignIn.png)

7.  On the Connect to SQL Server Analysis Server page, enter the ServerName\\Instance, Windows username, and password.  

    **Note**: The Windows account you enter must have Server Administrator permissions for the instance you are connecting to. The account should also have a password that doesn’t expire, otherwise users could get a connection error.

    ![](media/powerbi-analysis-services-connector/ASConnector_Connect.png)
8.  Type a friendly name, description, and friendly error message for the connection. Power BI users will identify the connection by this name and description.

    ![](media/powerbi-analysis-services-connector/ASConnector_FriendlyName.png) 
9.  Verify your connector's settings. If all is good, click **Close**.

    ![](media/powerbi-analysis-services-connector/ASConnector_SuccessClose.png)  

When the Wizards completes, the tabular model databases for the server instance you configured will appear when users select **Get data**\> **SQL Server Analysis Services** \> **Connect**.

![](media/powerbi-analysis-services-connector/ConnectToAS_Server.png)

When a user selects the new connection, all of the Tabular models available on the SQL Server Analysis Server instance appear as data sources.

![](media/powerbi-analysis-services-connector/ConnectToAS_Models.png)
 
## To remove a connector from the Get Data list

Uninstall the connector by using Remove Programs in Control Panel.

## Troubleshooting

Be sure to see [Troubleshooting Analysis Services Connector](http://support.powerbi.com/media/knowledgebase/articles/505324-troubleshooting-analysis-service-connector)for tips on troubleshooting problems you might have.
