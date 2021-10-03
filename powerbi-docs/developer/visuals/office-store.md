---
title: Publish Power BI visuals to Partner Center
description: Learn how you can publish your custom visual to Partner Center for others to discover and use.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 09/25/2021
---

# Publish Power BI visuals to Partner Center

Once you have created your Power BI visual, you may want to publish it to AppSource for others to discover and use. For more information about creating a Power BI visual, see [Plan a Power BI visual offer](/azure/marketplace/marketplace-power-bi-visual.md).

## What is AppSource?

[AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals) is the place to find SaaS apps and add-ins for your Microsoft products and services.

![Screenshot of Power B I visuals in AppSource.](media/office-store/appsource-01.png)

## Preparing to submit your Power BI visual

Before submitting a Power BI visual to AppSource, ensure that it complies with the [Power BI visuals guidelines](guidelines-powerbi-visuals.md).

>[!IMPORTANT]
>If you're resubmitting or updating a visual, **do not change its GUID**. Follow these instructions to [test a new version of a visual](submission-testing.md#testing-a-new-version-of-a-published-visual).

When you are ready to submit your Power BI visual, verify that your visual meets all the requirements listed below.

| Item | Required | Description |
| --- | --- | --- |
| Pbiviz package |Yes |Pack your Power BI visual into a Pbiviz package. Ensure the *pbiviz.json* file contains all the required metadata: <br>- Visual name<br>- Display name<br> - GUID<br> - Version<br> - Description<br> - Support URL<br> - Author name and email |
| Sample .pbix report file |Yes |To help users become familiar with the visual, highlight the value that the visual brings to the user and give examples of usage and formatting. You can also add a *"hints"* page at the end with some tips and tricks and things to avoid.<br>The sample .pbix report file must work offline, without any external connections. |
| Logo |Yes |Include the custom visual logo that will appear in the Marketplace listing. It should be in PNG format and exactly 300 x 300 px.<BR>**Important!** Review the [AppSource store images guide](/office/dev/store/craft-effective-appsource-store-images) carefully, before submitting the logo. |
| Screenshots |Yes |Provide at least one screenshot, and up to five, in PNG format. The dimensions must be exactly 1366 px (width) by 768 px (height). The size of the file can't be larger than 1024 kb.<br>For greater usage, add text bubbles to articulate the value proposition of key features shown in each screenshot. |
| Support download link |Yes |Provide a support URL for your customers. This link is entered as part of your Partner Center listing, and is visible to users when they access your visual's listing on AppSource. The URL should start with https://. |
| Privacy document link |Yes |Provide a link to the visual's privacy policy. This link is entered as part of your Partner Center listing, and is visible to users when they access your visual's listing on AppSource. The URL should start with https://. |
| End-user license agreement (EULA) |Yes |You must provide an EULA file for your Power BI visual. You can use the [standard contract](https://go.microsoft.com/fwlink/?linkid=2041178), [Power BI visuals contract](https://visuals.azureedge.net/app-store/Power%20BI%20-%20Default%20Custom%20Visual%20EULA.pdf), or your own EULA. |
| Video link |No |To increase the interest of users for your custom visual, provide a link to a video about your visual. The URL should start with https://. |

## Submitting to AppSource

To submit a Power BI visual to AppSource, upload a **pbiviz** package and **pbix** file to Partner Center.

Before you create the **pbiviz** package, complete the following fields in the **pbiviz.json** file:

* description
* supportUrl
* author
* name
* email

To submit your Power BI visual, you must be enrolled with Partner Center. If you're not yet enrolled, [Open a developer account in Partner Center](/azure/marketplace/create-account).

>[!NOTE]
>**Individual publishers** can use one of these methods to submit a Power BI visual:
>
>* If you have an old Seller Dashboard account, you can continue using this account's credentials to sign into Partner Center.
>* If you don't have an old Seller Dashboard account, and are not registered to Partner Center, you'll need to [Open a developer account in Partner Center](/office/dev/store/open-a-developer-account) using your work email.

> [!IMPORTANT]
> Before you submit your visual, make sure it passes all the [requirements](submission-testing.md). A visual that doesn't pass the requirements will be rejected.

Follow the steps below to submit your Power BI visual to Partner Center. For more information about the submission process, see the [Azure Marketplace listing guidelines](/azure/marketplace/marketplace-criteria-content-validation).

1. Log into **Partner Center**.

2. On the left pane, select **Commercial Marketplace**.

3. Select **Overview**.

4. Select **New Offer** and from the drop-down menu, select **Power BI visual**.

    ![Screenshot of creating a new Power B I visual in the office store tab in Partner Center.](media/office-store/power-bi-visual.png)

5. In the **Create a new Power BI visual** window, enter an *offer ID* and *offer alias* for your Power BI visual and select **Create**.

    :::image type="content" source="media/office-store/offer-id-visual.png" alt-text="Screenshot of pop up window for PBI visual name.":::

6. In **Offer setup**, check the appropriate boxes if your product requires additional purchase, and if you want to [certify](power-bi-custom-visuals-certified.md) your visual. Provide details for [customer leads](https://aka.ms/PBIvisualconfiguringcustomerleads).
    >[!TIP]
    >The Power BI certification process takes time. If you're creating a new Power BI visual, we recommend that you publish your Power BI visual via the Partner Center before you request Power BI certification. This ensures that the publishing of your visual is not delayed.

    Select **Save draft**.

7. In **Properties**, Check the relevant categories and industries, supply links for your EULA, privacy policy, and support documents.

    Select **Save draft**.

8. In **Offer listing**, select the languages you want the offer to be available in, and provide all the [marketplace details](/azure/marketplace/gtm-offer-listing-best-practices#online-store-offer-details) and media information in each language. When you select a name for the offer, you can also select *Reserve more names* to reserve other names for future use. For tips on making your offer listing as effective as possible, see [best practices for marketplace offer listings](/azure/marketplace/gtm-offer-listing-best-practices).
    Select **Save draft**.

9. In **Markets**, select the markets where you want the offer to be available.
    Select **Save draft**.

10. In **Technical configuration**, upload your Power BI visual **PBIVIZ** file and the **PBIX** file.
    Select **Review and Publish** to publish your offer.

## Tracking submission status and usage

You can review the [validation policies](/legal/marketplace/certification-policies#1180-power-bi-visuals).

* After submission, you will be able to view the submission status in the [app dashboard](https://sellerdashboard.microsoft.com/Application/Summary/).

* To understand when your Power BI visual will be available to download from AppSource, review the Power BI visuals [publication timeline](power-bi-custom-visuals-certified.md#publication-timeline).

## Certify your visual

Certified Power BI visuals are visuals in the Marketplace that meet certain specified code [requirements](power-bi-custom-visuals-certified.md#certification-requirements) that the Microsoft Power BI team has tested and approved. To request certification, select the Request Power BI certification check box.
We recommend that you submit and publish your Power BI visual before you request certification, because the certification process can take time. When you request certification, be sure to provide all required certification information in the Notes for certification box on the Review and publish page.
All certified visuals must passes all the [certification requirements](power-bi-custom-visuals-certified.md#certification-requirements).

## Next steps

>[!div class="nextstepaction"]
>[Learn how to create a Power BI visual](develop-circle-card.md)

>[!div class="nextstepaction"]
>[Guidelines for publishing Power BI visuals](guidelines-powerbi-visuals.md)

>[!div class="nextstepaction"]
>[Test your Power BI visual before submitting for certification](submission-testing.md)  

>[!div class="nextstepaction"]
>[Getting a Power BI visual certified](power-bi-custom-visuals-certified.md)

**More questions?** [Try asking the Power BI Community](https://community.powerbi.com/)
