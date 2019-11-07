---
title: Update, delete, and extract a Power BI template app
description: How to update, delete and extract template app.
author: teddybercovitz
manager: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 09/23/2019
ms.author: tebercov
---

# Update, delete, and extract template app

Now that your app is in production, you can start over in the test phase, without disrupting the app in production.
## Update your app

If you made the changes in Power BI Desktop, start at step (1). If you did not make the changes in Power BI Desktop, start at step (4).

1. Upload the updated dataset and overwrite the existing dataset. **Make sure to use the exact same dataset name**. Using a different name will create a new dataset for users that are updating the app.
![overwrite dataset](media/service-template-apps-update-extract-delete/power-bi-template-app-upload-dataset.png)
1. Import the pbix file from your computer.
![overwrite dataset](media/service-template-apps-update-extract-delete/power-bi-template-app-upload-dataset2.png)
1. Confirm the overwrite.
![overwrite dataset](media/service-template-apps-update-extract-delete/power-bi-template-app-upload-dataset3.png)

1. In the **Release management** pane, select **Create app**.
1. Go back through the app creation process.
1. After you've set **Branding**, **Content**, **Control**, and **Access**, select **Create app** again.
1. Select **Close** and go back to **Release management**.

   You see you have two versions now: The version in production, plus a new version in testing.

    ![Two versions of a template app](media/service-template-apps-update-extract-delete/power-bi-template-app-update.png)

5. When you're ready to promote your app to pre-production for further testing outside your tenant, go back to the Release Management pane and select **Promote app** next to **Testing**.
6. Your link is now live. Submit it again to the Cloud Partner Portal (CPP) by following the steps at [Power BI App offer update](https://docs.microsoft.com/azure/marketplace/cloud-partner-portal/power-bi/cpp-update-existing-offer).
7. In Cloud Partner Portal, you must **publish** your offer again and have it validated again as well.

   >[!NOTE]
   >Promote your app to production stage only after your app is approved by Cloud Partner Portal and you publish it.

### Update behavior

1. Updating the app will allow the installer of the template app to [Update a template app](service-template-apps-install-distribute.md#update-a-template-app) in the already installed workspace without losing the connection configuration.
1. See installer [overwrite behavior](service-template-apps-install-distribute.md#overwrite-behavior) to learn how changes in the dataset affect the installed template app.
1. When updating (overwriting) a template app, it first reverts back to sample data and will automatically reconnect with user's configuration (parameters & authentication). Until refresh is complete, the reports, dashboards, and org app will present the sample data banner.
1. If you added a new query parameter to the updated dataset that requires users input - you must check the *required* check box. This will prompt the installer with the connection string after updating the app.
 ![required parameters](media/service-template-apps-update-extract-delete/power-bi-template-app-upload-dataset4.png)

## Extract workspace
Rolling back to the previous version of a template app is now easier than ever with the extract capability. The following steps will extract a specific app version from various release stages into a new workspace:

1. In the release management pane, press more **(...)** and then **Extract**.

    ![extract template app version](media/service-template-apps-update-extract-delete/power-bi-template-app-extract.png)
    ![extract template app version](media/service-template-apps-update-extract-delete/power-bi-template-app-extract-dialog.png)
2. In dialog box, enter the name for extracted workspace. a new workspace will be added.

Your new workspace versioning resets and you can continue to develop and distribute the template app from the newly extracted workspace.

## Delete template app version
A template workspace is the source of an active distributed template app. To protect the template app users, it's not possible to delete a workspace without first removing all the created app versions in the workspace.
Deleting an app version also deletes the app url that will no longer work.

1. In the release management pane, press select the ellipsis **(...)** and then **Delete**.
 ![Delete template app version](media/service-template-apps-update-extract-delete/power-bi-template-app-delete.png)
 ![Delete template app version](media/service-template-apps-update-extract-delete/power-bi-template-app-delete-dialog.png)

>[!NOTE]
>Make sure not to delete app version which are being used by customers or **AppSource** or they will no longer work.

## Next steps

See how your customers interact with your template app in [Install, customize, and distribute template apps in your organization](service-template-apps-install-distribute.md).

See the [Power BI Application offer](https://docs.microsoft.com/azure/marketplace/cloud-partner-portal/power-bi/cpp-power-bi-offer) for details on distributing your app.
