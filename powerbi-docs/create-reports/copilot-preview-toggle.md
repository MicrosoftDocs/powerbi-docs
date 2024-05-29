---
title: Use Copilot preview features in Power BI
description: Fabric Copilot in Power BI has preview features that can be enabled with the flip of a switch.
author: lafaberMSFT
ms.author: lauren.faber
ms.reviewer: maggies
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 06/03/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
#customer intent: As a Power BI user, I want to learn how to enable the preview features in Fabric Copilot for Power BI.
---

# Use Copilot preview features in Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Copilot for Microsoft Fabric is generally available starting with features in Power BI. This article provides an overview of the capabilities in public preview for the Power BI Copilot chat pane.

## Before you start

Read about all the ways Copilot can help you in the [overview of Copilot for Power BI](copilot-introduction.md) for more guidance before you start.

[!INCLUDE [copilot-notes](../includes/copilot-notes.md)]

## What's available in the Copilot public preview experience?

When using the preview toggle to switch into the Copilot public preview experience all generally available (GA) features are available with additional public preview features. 

**You can use the following public preview features in the preview experience:**
- Ask Copilot for data from your semantic model

You can also use all generally available features in the preview experience including:
- [Create reports in the Power BI service with Copilot](copilot-create-report-service) (GA)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages) (GA) 
- [Summarize a report page in the Copilot pane](copilot-pane-summarize-content) (GA)

## What is the preview toggle?

When using the Copilot pane in the Power BI service, you'll see a toggle with the word **Preview** next to it. The preview toggle allows you the opportunity to move into an experience that includes both generally available and public preview capabilities. By default, the toggle is off, giving you the generally available Copilot pane experience to start. Moving into the preview experience allows you the opportunity to try the newest Copilot capabilities.

If you do not want users in your organization to have access to the preview toggle, you will need to [disable Fabric Copilot](/fabric/admin/service-admin-portal-copilot) in your organization or for specific security groups.

## How to use the preview toggle

To access Copilot features in public preview, select the preview toggle to activate the public preview experience.

:::image type="content" source="media/copilot-enable-power-bi/copilot-preview-toggle.png" alt-text="Screenshot of the preview toggle in the on position in the Copilot chat pane.":::

When the preview toggle is green, you now have access to the public preview experience. The welcome card notifies you that you are now in the preview version of Copilot. At any point in time, you can click on the toggle to turn off the preview experience and return to use only features that are generally available. 

## Considerations and limitations

Considerations for using the preview experience:

- By having Fabric Copilot enabled in your organization, users will have access to the Copilot preview pane toggle by default. To disable the toggle for users you will need to [disable Fabric Copilot](/fabric/admin/service-admin-portal-copilot) in your organization or for specific security groups.
- Experiences in the preview toggle are still in a **preview** state, and therefore will not meet all the requirements of a generally available Microsoft feature. 

Limitations of the preview experience:

- Chat history is not saved when switching between the GA state and the preview state. 
- The preview toggle is not available in Power BI Desktop. The Copilot chat pane in Power BI Desktop is not yet generally available making **all Copilot Desktop experiences in a preview state.**
- The state of the preview toggle **persists across sessions and tabs within the same browser**. For example, if you enable the preview experience in Microsoft Edge and then open the Copilot experience in a new report in Microsoft Edge, Copilot will remain in the preview state. 
- The state of the preview toggle **does not persist across different browser types**. For example, if you enable the preview experience in Microsoft Edge and then open the Copilot experience within Google Chrome, Copilot will default to the GA experience. 

