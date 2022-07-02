---
title: 'Data in space overview'
description: This article provides an overview of the Power BI mobile app's Data in space feature.
author: paulinbar
ms.author: painbar
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-mobile
ms.topic: how-to
ms.date: 07/02/2022
ms.custom: mode-portal
#customer intent: I want to learn about the Power BI mobile app's Data in space feature.
---
# Data in space overview

Applies to:

| ![iPhone](./media/mobile-apps-metrics/ios-logo-40-px.png) | ![iPads](./media/mobile-apps-metrics/ios-logo-40-px.png) | ![Android phone](././media/mobile-apps-metrics/android-logo-40-px.png) | ![Android tablet](././media/mobile-apps-metrics/android-logo-40-px.png) |
|:--- |:--- |:--- |:--- |
|iPhones |iPads |Android phones |Android tablets |

With Data in Space you can  connect your digital business data to your real-world places in facility management, manufacturing, retail, and many more use cases. You can put real-time data at the fingertips of employees where they need it, enabling them to make better, faster, and more informed decisions.

For example, let's say an elevator maintenance company wants the data for each elevator they service to be easily available to their service personnel when they're out in the field. Using the Power BI mobile app's Data in space feature, someone in the company can pin the relevant reports in augmented reality right next to the elevators that the company is responsible for servicing. Then, when a service technician needs to check the service details of a bank of elevators, they can get to the relevant reports merely by scanning the space around the elevators with their Power BI mobile app's camera. The reports will appear in the camera screen in three-dimensional augmented reality in front of the elevators they refer to. They can then access the report just by tapping card.

![Screenshot of a bank of elevators with Power BI reports in augmented reality in front of each elevator.](./media/mobile-apps-data-in-space-overview/power-bi-mobile-app-data-in-space-final-result.png)

Data in Space is powered by Azure Spatial Anchors service and requires that Power BI admin will connect Power BI with that service. For more information, see [Set up Data in space for your organization](./mobile-apps-data-in-space-set-up.md).

As a Power BI Mobile user, in order to use the Data in space feature, you need to have, in addition to your Power BI subscription, an assigned role in the Azure Spatial Anchors service. This role determines your Data in space role in the Power BI mobile app, and what operations you'll be able to do in Power BI Data in space.

There are two Data in space roles:

* **Writer**: Data in space Writers can pin reports, change the position, size, and rotation of pinned reports, and delete pins.
* **Viewer**: Data in space Viewers can find pinned reports, open reports they have access to, and request access to reports they don't have access to.

To see what Data in space role you have, tap your profile picture, choose **Settings**, and scroll down to **Data in space (preview)**.

![Screenshot of data in space settings.](./media/mobile-apps-data-in-space-overview/data-in-space-settings.png)

IF you see **None**, this means that your administrator has not given you a Data in space role, and you won't be able to pin reports or access pinned reports. Contact your administrator to request a Data in space role.

If you do not see a Data in space section in your settings, it means that Data in space has not been set-up in your organization.

## Next steps

* [Pin Power BI reports to locations in the real world](mobile-apps-data-in-space-pin-reports.md)
* [Find and access Power BI reports pinned to locations in the real world](mobile-apps-data-in-space-find-pinned-reports.md)
* [Admin: Set up Data in space in your organization](mobile-apps-data-in-space-set-up.md)