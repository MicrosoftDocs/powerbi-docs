---
title: Publish Power BI visuals to Partner Center
description: Learn how you can publish your custom visual to Partner Center for others to discover and use
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.topic: conceptual
ms.subservice: powerbi-custom-visuals
ms.date: 12/02/2019
---

# Publish Power BI visuals to Partner Center

Once you have created your Power BI visual, you may want to publish it to the AppSource for others to discover and use. For more information about creating a Power BI visual, see [Developing a Power BI visual](visuals/custom-visual-develop-tutorial.md).

## What is AppSource?

[AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) is the place to find SaaS apps and add-ins for your Microsoft products and services.

![Office store](media/office-store/appsource-01.png)

## Preparing to submit your Power BI visual

Before submitting a Power BI visual to AppSource, make sure you've read the [Power BI visuals guidelines](guidelines-powerbi-visuals.md) and [tested your custom visual](https://github.com/Microsoft/PowerBI-visuals/blob/master/Tutorial/SubmissionTesting.md).

When you are ready to submit your Power BI visual, verify that your visual meets all the requirements listed below.

| Item | Required | Description |
| --- | --- | --- |
| Pbiviz package |Yes |Pack your Power BI visual into a Pbiviz package containing all the required metadata.<br>Visual name<br>Display name<br>GUID<br>Version<br>Description<br>Author name and email |
| Sample .pbix report file |Yes |To showcase your visual, you should help users to get familiar with the visual. Highlight the value that the visual brings to the user and give examples of usage and formatting options. You can also add a *"hints"* page at the end with some tips and tricks and things to avoid.<br>The sample .pbix report file must work offline, without any external connections. |
| Icon |Yes |You should include the custom visual logo that will appear in the store front. The format can be .png, .jpg, .jpeg or .gif. It must be exactly 300 px (width) x 300 px (height).<BR>**Important!** Please review the [AppSource store images guide](https://docs.microsoft.com/office/dev/store/craft-effective-appsource-store-images) carefully, before submitting the icon. |
| Screenshots |Yes |Provide at least one screenshot. The format can be .png, .jpg, .jpeg or .gif. The dimensions must be exactly 1366 px (width) by 768 px (height). The size of the file can't be larger than 1024 kb.<br>For greater usage, add text bubbles to articulate the value proposition of key features shown in each screenshot. |
| Support download link |Yes |Provide a support URL for your customers. This link is entered as part of your Seller Dashboard listing, and is visible to users when they access your visual’s listing on AppSource. The format of your URL should include https:// or https://. |
| Privacy document link |Yes |Provide a link to the visual's privacy policy. This link is entered as part of your Seller Dashboard listing, and is visible to users when they access your visual’s listing on AppSource. The format of your link should include https:// or https://. |
| End-user license agreement (EULA) |Yes |You have to upload a EULA file. This can be either your own EULA or use the default EULA within the Office store for Power BI visuals. To use the default EULA, paste the following URL in the seller dashboard's "End-User License Agreement" file upload dialog. [https://visuals.azureedge.net/app-store/Power BI - Default Custom Visual EULA.pdf](https://visuals.azureedge.net/app-store/Power%20BI%20-%20Default%20Custom%20Visual%20EULA.pdf). |
| Video link |No |To increase the interest of users for your custom visual, provide a link to a video about your visual. The format of your URL should include https:// or https://. |
| GitHub repository |No |Share a public link to a [GitHub](https://www.github.com) repository with sources of your Power BI visual and sample data. This allows other developers an opportunity to provide feedback and propose improvements to your code. |

## Getting an app package XML

To submit a Power BI visual you need an app package XML from the Power BI team. To get the app package XML, send an email to the Power BI visuals submission team ([pbivizsubmit@microsoft.com](mailto:pbivizsubmit@microsoft.com)).

Before you create the **pbiviz** package, you must fill the following fields in the **pbiviz.json** file:
* description
* supportUrl
* author
* name
* email

Attach the **pbiviz file** and the **sample report pbix file** to your email. The Power BI team will reply back with instructions and an app package XML file to upload. This XML app package is required in order to submit your visual through the Office developer center.

> [!NOTE]
> To improve quality and assure that existing reports are not breaking, updates to existing visuals will take an additional two weeks to reach production environment after approval in the store.

## Submitting to AppSource

To submit your Power BI visual to AppSource, you need to get an app package from the Power BI team, and then submit it to Partner Center. 

### Getting the app package

You must send an email with the **pbiviz** file and the **pbix** file to the Power BI team before submitting to AppSource. This allows the Power BI team to upload the files to the public share server. Otherwise, the store will not be able to retrieve the files. 

The Power BI team has to check files for new Power BI visual submissions, updates to existing Power BI visuals, and fixes to rejected submissions.

### Submitting to Partner Center

To submit your Power BI visual to Partner Center, you have to be registered with Partner Center. If you're not yet registered, [Open a developer account in Partner Center](https://docs.microsoft.com/office/dev/store/open-a-developer-account).

Follow the steps below to submit your Power BI visual to Partner Center. For more information about the submission process, see [Submit your Office solution to AppSource via Partner Center](https://docs.microsoft.com/office/dev/store/use-partner-center-to-submit-to-appsource).

>[!NOTE]
> If you are in the middle of a Power BI visual submission process, and have to use [Seller Dashboard](https://docs.microsoft.com/office/dev/store/use-the-seller-dashboard-to-submit-to-the-office-store) (the old management tool), review the instructions in [Submit a Power BI visual to AppSource using Seller Dashboard](seller-dashboard.md).

1. Log into **Partner Center**.

2. On the left pane, select **OFFICE STORE**.

3. Select **Overview**.

4. Select **Create a new** and from the drop-down menu, select **Power BI visual**.

    ![Office store](media/office-store/power-bi-visual.png)

5. In the **Create a new Power BI visual** window, enter a name for your Power BI visual and select **Create**.

6. Select **Packages** and upload your Power BI visual XML app package.

7. Select **Properties** and provide the required information.

8. If your product requires additional purchase, select **Product setup** and check the **Associated service purchase** check box.

9. (Optional) If you want to [certify](power-bi-custom-visuals-certified.md) your visual, select **Product setup** and check the **Power BI certification** check box.
    >[!TIP]
    >The Power BI certification process might take time. If you're creating a new Power BI visual, we recommend that you publish your Power BI visual via the Partner Center before you request Power BI certification. This ensures that the publishing of your visual is not delayed.

10. Select **Product setup** and click **Review and publish**.

## Tracking submission status and usage

You can review the [validation policies](https://dev.office.com/officestore/docs/validation-policies#13-power-bi-custom-visuals).

After submission, you will be able to view the submission status in the [app dashboard](https://sellerdashboard.microsoft.com/Application/Summary/).

## Certify your visual

Once your visual is created, if you want you can get your visual [certified](../developer/power-bi-custom-visuals-certified.md).

## Next steps

[Developing a Power BI custom visual](visuals/custom-visual-develop-tutorial.md)  
[Visualizations in Power BI](../visuals/power-bi-report-visualizations.md)  
[Custom Visualizations in Power BI](../developer/power-bi-custom-visuals.md)  
[Getting a Power BI visual certified](../developer/power-bi-custom-visuals-certified.md)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/)
