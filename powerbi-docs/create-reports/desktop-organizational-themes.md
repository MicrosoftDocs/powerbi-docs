---
title: Organizational themes (Preview)
description: Learn about creating and managing organizational themes in Power BI to ensure consistent branding across all reports in an organization.
author: blairjsarmstrong
ms.author: juliacawthra
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 10/14/2025
LocalizationGroup: Create reports
#customer intent: As a Power BI administrator, I want to learn how to create and manage organizational themes so I can enforce consistent branding across all reports in my organization.
---
# Organizational themes (Preview)

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

## Overview

Organizational themes allow Power BI administrators to centrally manage and distribute custom report themes across the organization. Maintaining a consistent visual identity across Power BI reports is now simpler and more scalable, thanks to Organizational themes. Whether reports are built manually or generated with Copilot, this feature ensures that styling and branding stay aligned with your organization’s identity and design standards.

The Organizational themes feature is available exclusively to **Power BI tenant administrators** through the **Admin portal**. While report creators will benefit from the themes and styling options defined through this feature, they cannot configure them directly. Instead, administrators can upload custom JSON theme files, validate them, add descriptions, rename them for clarity, and control their visibility across the organization. Once published, these themes appear in the theme gallery, making them easily accessible to report creators in both Power BI Desktop and Power BI Service.

> [!IMPORTANT]
> The Organizational themes feature is currently in preview. The information in this article relates to a prerelease product that may be substantially modified before it's released. Microsoft makes no warranties, expressed or implied, with respect to the information provided here.

## Organizational themes in the Admin portal

Adding a new Organizational Theme in Power BI is a streamlined process designed for admin control and governance. First, navigate to the Power BI **Admin portal**, where a dedicated section for **Organizational themes (preview)** is available. This is the central hub for managing all theme-related assets.

   :::image type="content" source="media/organizational-themes/org-themes-01-admin-portal.png" lightbox="media/organizational-themes/org-themes-01-admin-portal.png"  alt-text="Screenshot of Organizational themes Admin portal with Organizational theme (preview) menu section selected and highlighted.":::

## Upload a theme file

Admininstrators can upload a custom theme using a .JSON file. This file defines the visual styling—colors, fonts, and layout preferences—that will be applied to reports. To upload a theme, admins fist have to click on the ‘**+ Add theme**’ button, this will open the ‘**Theme settings**’ pane that requires to upload a .JSON file, assign a name, and it’s optional to add a description.

   :::image type="content" source="media/organizational-themes/org-themes-02-add-theme.png" lightbox="media/organizational-themes/org-themes-02-add-theme.png"  alt-text="Screenshot of Organizational themes Admin portal with the '+ Add theme' button highlighted, and 'Theme settings' dialog open and highlighted.":::

After selecting and uploading a custom theme .JSON file, the system automatically validates the file format and structure. If the file is unsupported or incorrectly formatted, a clear error message is displayed.

   :::image type="content" source="media/organizational-themes/org-themes-03-add-theme-error.png" lightbox="media/organizational-themes/org-themes-03-add-theme-error.png"  alt-text="Screenshot of Organizational themes Admin portal with the 'Organizational Theme Error' dialog open.":::

Keep in mind that each theme must have a unique name. The Power BI Admin portal includes a real-time name-checking mechanism to prevent duplicates, ensuring clarity and consistency across the organization.

## Managing uploaded themes

When a Power BI administrator uploads a theme to the Organizational themes section of the Admin Portal, four key management options automatically appear. In the following sections, we’ll walk through each option to explain what they do, when to use them, and how they impact report creators and Copilot-generated reports.

- **[Export](#export)** – Download the theme’s JSON file for backup or reuse.
- **[Details](#details)** – View and edit the theme’s name and description.
- **[Delete](#delete)** – Permanently remove the theme from the organizational gallery.
- **[Enable/Disable for Theme Gallery](#enabledisable-for-theme-gallery)** – Control whether the theme is visible to report creators.

   :::image type="content" source="media/organizational-themes/org-themes-04-theme-actions.png" lightbox="media/organizational-themes/org-themes-04-theme-actions.png"  alt-text="Screenshot of Organizational themes Admin portal with the menu bar highlighted showing the 'Export', 'Details', 'Delete', and 'Enable/Disable for theme gallery' options.":::

Alternatively, the **Details**, **Delete**, and **Enable/Disable for theme gallery options** can also be accessed via the **ellipsis button** (three-dot menu) next to the theme’s name in the Admin Portal. This provides a quick way for admins to manage individual themes directly from the list view.

   :::image type="content" source="media/organizational-themes/org-themes-05-theme-ellipsis-actions.png" lightbox="media/organizational-themes/org-themes-05-theme-ellipsis-actions.png"  alt-text="Screenshot of  Admin portal with Organizational theme displayed. An organizational theme is selected, with 'ellipsis' button highlighted and expanded, showing 'Details', 'Delete', and 'Enable/Disable for theme gallery' options.":::

### Export

The **Export** option allows administrators to download the theme’s JSON file directly from the Admin Portal. This is useful for:

- Backing up the theme configuration for safekeeping.
- Sharing the theme with other admins or teams.
- Editing the theme offline before re-uploading a revised version.

Exporting ensures you always have access to the original theme file, even if changes are made later.

### Details

The **Details** option opens the **Theme settings** panel where you can view and edit the theme’s metadata:

- Replace the existing JSON file with a new version.
- Rename the theme to make it more descriptive or easier to identify.
- Add or update the theme description to clarify its purpose, usage, or intended audience, and provide context for report creators.

This helps maintain clarity, especially when multiple themes are available in the gallery, and ensures users understand which theme to apply.

### Delete

The **Delete** option permanently removes the theme from the Admin portal and the Organizational theme list. Use the Delete option when:

- A theme is outdated or no longer aligns with your organization’s branding.
- You want to clean up unused or test themes.
- You’re replacing it with an updated version.

> [!IMPORTANT]
> The Delete action cannot be undone, so use it with caution.
> Deleting a theme does not affect reports that already have the theme applied. Those reports will retain the styling unless manually changed.

### Enable/Disable for theme gallery

The **Enable/Disable for theme gallery** toggle controls whether the theme is visible to report creators in the theme gallery within Power BI Desktop and Service.

- **Enable**:  By default, newly uploaded themes are hidden from the theme gallery in Power BI Desktop and Service. Selecting this option makes the theme visible to report creators, allowing them to apply it directly from Organizational themes in the Theme gallery.
- **Disable**: This option gives administrators flexibility to test or reserve themes without exposing them to all users. If a theme is already enabled, the Disable option will appear instead. Selecting the Disable option will hide the theme from the gallery, though it will remain available in the Admin portal for future use, editing, or reactivation. The theme can still be used by Copilot if it’s set as the default.

## Theme gallery

Organizational themes that have been *enabled* for the **Theme gallery**, instantly become accessible to report creators within Power BI Desktop. These themes appear under the **Organizational themes** section of the gallery, making it easy for users to apply approved, branded styles to their reports with just a few clicks. This streamlined access helps reinforce consistent visual standards across reports, regardless of who creates them.

   :::image type="content" source="media/organizational-themes/org-themes-06-theme-gallery.png" lightbox="media/organizational-themes/org-themes-06-theme-gallery.png"  alt-text="Screenshot of Power BI Desktop with 'View' tab highlighted, selected, and expanded, and the 'Organizational themes' section highlighted":::

Previously, the **Theme gallery** was only available in **Power BI Desktop**. However, with the introduction of **Organizational themes**, it is now also accessible in **Power BI service**. This enhancement allows report creators to apply consistent branding and styling, regardless of whether they’re building reports in Power BI Desktop or directly in Power BI service.

To access the theme gallery in Power BI service, go to the **View** tab in the ribbon and select **Theme** from the menu.

   :::image type="content" source="media/organizational-themes/org-themes-07-theme-gallery-service.png" lightbox="media/organizational-themes/org-themes-07-theme-gallery-service.png"  alt-text="Screenshot of Power BI service with 'View' tab highlighted, selected, and expanded, and the 'Theme' control highlighted.":::

## Copilot + Organizational themes

When uploading or editing an Organizational theme in the Power BI Admin portal, administrators have the option to enable the **Copilot** toggle. This setting determines whether the selected theme should be used by Copilot when it generates the first page of a new report.

- If enabled: Copilot will apply this theme by default when creating a report from scratch, ensuring that the output aligns with your organization’s visual identity and styling preferences.
- If disabled: Copilot will fall back to its own default theme, which may not reflect your organization’s branding.

The **Copilot** toggle gives administrators control over how AI-generated content adheres to governance and design standards, making it easier to maintain consistency across both manually authored and Copilot-assisted reports.

   :::image type="content" source="media/organizational-themes/org-themes-08-theme-copilot.png" lightbox="media/organizational-themes/org-themes-08-theme-copilot.png"  alt-text="Screenshot of Organizational theme section in the Admin portal with Copilot toggle highlighted and enabled.":::

Only one theme can be enabled as the default theme for Copilot. Enabling a new default theme will replace the previous default theme and will be applied when the initial page is generated by Copilot.

## Copilot theme now available in the theme gallery

As an added bonus to the Organizational themes (preview) rollout, the Copilot theme has surfaced in the Power BI theme gallery. The Copilot theme, which was originally applied only when Copilot generated a report, can now be selected and applied by any report creator, regardless of whether Copilot was used.

You’ll find the Copilot theme at the end of the Theme gallery list in both Power BI Desktop and in Power BI Service. This gives users the flexibility to apply the same clean, professional styling that Copilot uses by default, even when building reports manually.

   :::image type="content" source="media/organizational-themes/org-themes-09-theme-copilot-gallery.png" lightbox="media/organizational-themes/org-themes-09-theme-copilot-gallery.png"  alt-text="Screenshot of the Power BI Theme gallery with the Copilot theme highlighted.":::

## Related content

- [Use report themes in Power BI Desktop](desktop-report-themes.md)
  