---
title: In-app Purchase Visuals Guidelines
description: Learn how you can publish your custom visual to AppSource for others to discover and use it via a purchase.
author: markingmyname
ms.author: maghan
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.component: powerbi-service
ms.topic: conceptual
ms.date: 11/13/2018
---

# In-app purchase visuals guidelines

## Visuals with in-app purchase

Until recently the Marketplace (AppSource) accepted only free Power Bl visuals. This policy is changing so that visuals with in-app purchases (IAP) may also be submitted to AppSource. 
Developers may also submit these visuals for certification after they're approved by the AppSource team, and of course, after making sure they comply with certification requirements, as described in our documentation. Note that in order for the visual to be certified, it must not access external services or resources.

### What's changing in the submittion process?

Developers upload their IAP visuals to AppSource via the Seller Dashboard, as they've been doing for free visuals. To indicate that the submited visual has IAP features, developers should write in the seller dashboard notes: "Visual with in-app purchase." In addition, developers need to provide a license key or token so that the validation team is able to validate the IAP features. Once the visual is validated and approved, the AppSource listing for the IAP visual will state 'Additional purchase may be required' under the pricing options.

### What is a visual with IAP features?

An IAP visuals is free visual and offers free features, but also has additional features for which extra charges may be applied in order to operate them. Developers must clearly notify users in the visual's description regarding which features require additional purcahses to operate. Currently, Microsoft does not provide native application programming interfaces (APIs) to support purchase in apps and add-ins. 
Developers may use any third-party payment system for those purchases. Please refer to pur store policy.
