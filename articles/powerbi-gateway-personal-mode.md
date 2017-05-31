<properties
   pageTitle="On-premises data gateway (personal mode)"
   description="Data gateway for Power BI that individuals can use for connecting to on-premises data"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2017"
   ms.author="davidi"/>

# On-premises data gateway (personal mode)

You can use on-premises data sources, and create Power BI reports and dashboards, using a gateway. A **gateway** is software that facilitates access to data that is stored on a private, on-premises network, then enables you to use that data in online services like the **Power BI service**. The **On-premises data gateway (personal mode)** is a recently released update to the Power BI gateway that allows individuals to install a gateway on their own computer, and gain access to on-premises data.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_01.png)

> Note: The **On-premises data gateway (personal mode)** replaces the previously supported version of the personal gateway, which is called **Power BI Gateway - Personal**. The previous personal gateway will continue working only until July 31, 2017. See the sections below for information on how to update to the new version.


## Features of the On-premises data gateway (personal mode)

With the release of the **On-premises data gateway (personal mode)**, a collection of improvements and features are now available. In the previous version of the personal gateway (which is called **Power BI Gateway - Personal**), its implementation imposed some limitations. As with many Power BI products, we listened to customer needs, requests, and how they used the product. As a result, the **On-premises data gateway (personal mode)** has been redesigned from the ground up, and includes the following features and improvements:

-   **Improved reliability** - the new version of the personal gateway has improved reliability over the previous version, due to code and structural software improvements.
-   **Enhanced extensibility** - as part of the structural software improvements, additional features can be added as they become available. The previous version of the personal gateway was limited in its ability to offer new features. This includes the ability to do in-place updates, rather than having to uninstall/reinstall the gateway.


## Installing On-premises data gateway (personal mode)

To install the  **On-premises data gateway (personal mode)** without having the previous version of the gateway installed, select the gear icon in the **Power BI service** and select **Data Gateway**.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_02.png)

You can follow the installation steps, and since the installation process allows you to install either version of the gateway (the standard gateway, which can be shared with others, or personal mode), make sure you select **On-premises data gateway (personal mode)** when prompted for which version of the gateway you want to install.

### Updating from the previous personal gateway

If you already have the **Power BI Gateway - personal** gateway installed, you'll be prompted to install the new and enhanced version of the personal gateway when you view **Datasets** under **Settings** in the **Power BI service**.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_03.png)

When you select a dataset, and then select **Gateway connection** you're notified that the new and enhanced version of the personal gateway is available. When you do, select **Install now**.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_04.png)

> **Note:** If you're running the previous version of **Power BI Gateway - personal** as an elevated process, make sure you start the new gateway installation process elevated as well, so your dataset credentials can be automatically updated. Otherwise, you'll have to update dataset credentials manually.

You'll be taken through the update process, after which you'll see that the installation was successful. Don't close things out yet, there's one last step.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_05.png)

Here's the last step. Once the new personal gateway is installed (and the last installation screen still visible), sign in to the **Power BI service**, and wait until you see that the gateway is online, as shown in the following image.

![](media/powerbi-gateway-personal-mode/gateway-personal-mode_06.png)

If you've updated the personal gateway on the same machine as the previous gateway is installed, your credentials will update automatically, and all refresh activities will go through the new gateway. If the previous gateway was installed on a different machine, you'll be asked to update your credentials on certain datasets.

That's it - almost. With the new gateway installed, you no longer need to previous version installed on your machine, so you should uninstall it. You can do this by searching for **Power BI Gateway - personal** on your machine, and uninstalling it.

## Using Fast Combine with the personal gateway

If you were using **Fast Combine** with the previous gateway, you'll need to take the following steps to re-enable **Fast Combine** to work with the **On-premises data gateway (personal mode)**:

1.  Using File Explorer, open the following file:
        %localappdata%\Microsoft\Personal Gateway\Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config

2.  At the bottom of the file, add the following text:
            <setting name="EnableFastCombine" serializeAs="String">
            <value>true</value>​
            </setting>

3.  Once complete, the setting will take effect in approximately one minute. To check that it's working properly, try an on-demand refresh in the **Power BI service** to confirm that **Fast Combine** is working.

## Limitations and considerations

There are a few things to consider when using the **On-premises data gateway (personal mode)**, as described in the following list.

-   OLEDB and ODBC connections based on Windows authentication are currently not supported using the **On-premises data gateway (personal mode)**.
-   If you're using **Windows Hello** to sign in to Windows, you might runinto the following error: 
    -   *The user account you selected does not match the requirements of the application. Please use a different account.*
    -   To remedy that error, select *Use a different account* and sign in again. 

The following data sources are currently supported for the **On-premises data gateway (personal mode)**:

-   Active Directory
-   ADO.NET 
-   CurrentWorkbook
-   FTP
-   HDFS
-   SAP BusinessObjects         

Support for Spark and R script is planned, and currently under development.

## Frequently Asked Questions (FAQ)

-   Can I run the **On-premises data gateway (personal mode)** side by side with the **On-premises data gateway** (previously known as the Enterprise version of the gateway)?
    -   **Answer**: Yes, with the new version, both can run simultaneously.

-   Can I run the **On-premises data gateway (personal mode)** as a service?
    -   **Answer**: No. the **On-premises data gateway (personal mode)** can only run as an application. If you need to run the gateway as a service, you'll need to consider the **On-premises data gateway​** (previously known as the Enterprise gateway).

-   Will the gateway run as a Windows service?
    -   **Answer**: No, the **On-premises data gateway (personal mode)** runs as an application on your machine. To use a gateway in an admin mode, make sure to check out the [**On-premises data gateway** article.](powerbi-gateway-onprem.md)

-   How often is the **On-premises data gateway (personal mode)** updated?
    -   **Answer**: We plan to update the personal gateway monthly.

-   Why am I asked to update my credentials?
    -   **Answer**: Many situations can trigger a request for credentials. The most common is that you've re-installed the **On-premises data gateway (personal mode)** on a different machine than your **Power BI - personal** gateway. It could also be an issue in the data source, and Power BI failed to perform a test connection, or a timeout or a system error occurred. You can update your credentials in the **Power BI service** by going to the **gear icon** and selecting **Settings** then **Datasets**, and finding the dataset in question and clicking on *update credentials*.

-   How much time will my previous personal gateway be offline during the upgrade?
    -   **Answer**: Upgrading the personal gateway to the new version should only take few minutes. 

-   What happens if I don't migrate to the new personal gateway by July 31st, 2017?
    -   **Answer**: If you’re refreshing your reports with the current gateway, your refreshes will stop. The only way to set up a new refresh schedule will be by installing and configuring the new gateway.

-   I'm using R script. Is that supported?
    -   **Answer**: We anticipating adding support for R scripts soon.​

-   Why am I not seeing the message to update my gateway in the **Power BI service**?
    -   **Answer**: Most likely, this is because you have one or more datasets that include a data source that is still currently not supported.


## See also

[Troubleshooting Power BI Gateway - Personal](powerbi-admin-troubleshooting-power-bi-personal-gateway.md)  
[Configuring proxy settings for the Power BI Gateways](powerbi-gateway-proxy.md)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)
