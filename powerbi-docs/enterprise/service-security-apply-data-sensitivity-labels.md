---
title: How to apply sensitivity labels in Power BI
description: Learn how to apply sensitivity labels on your Power BI reports, dashboards, semantic models, dataflows, and .pbix files.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.custom: video-RE4M5Gj
ms.topic: how-to
ms.date: 11/16/2023
LocalizationGroup: Data from files
---

# How to apply sensitivity labels in Power BI

Sensitivity labels from Microsoft Purview Information Protection on your reports, dashboards, semantic models, dataflows, and **.pbix** files can guard your sensitive content against unauthorized data access and leakage. Labeling your data correctly with sensitivity labels ensures that only authorized people can access your data. This article shows you how to apply sensitivity labels in the Power BI service and in Power BI Desktop.

For more information, see [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md).

#### Give us your feedback

The product team would love to get your **[feedback](https://forms.office.com/pages/responsepage.aspx?id=v4j5cvGGr0GRqy180BHbR-PPBJBIRPlBpEYIBVrF5lRUREtUREJJRzJZSzcyM1pZWU9LOUdSVkFKWC4u)** about the Power BI information protection capabilities and its integration with Microsoft Purview Information Protection. Help us meet your information protection needs! Thanks!

## Apply sensitivity labels in the Power BI service

In the Power BI service, you can apply sensitivity labels to reports, dashboards, semantic models, and dataflows.

Here are the requirements to apply sensitivity labels in the Power BI service:

- You must have a [Power BI Pro or Premium Per User (PPU) license](./service-admin-purchasing-power-bi-pro.md) and edit permissions on the content you want to label. Note: If you have a Free license, you can only apply sensitivity labels to items in your *My workspace* (provided that the other requirements listed here have been met); you won't be able to apply them to items in any other workspace.
- Sensitivity labels must be enabled for your organization. Contact your Power BI admin for information about your configuration.
- You must belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).
- All [licensing and other requirements](./service-security-enable-data-sensitivity-labels.md#licensing-and-requirements) must be met.

### View sensitivity labels

When data protection is enabled on your tenant, sensitivity labels appear in the **Sensitivity** column in the list view of dashboards, reports, semantic models, and dataflows.

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/sensitivity-labels.png" alt-text="Screenshot of a workspace with the sensitivity column highlighted." lightbox="media/service-security-apply-data-sensitivity-labels/sensitivity-labels.png" border="false":::

### Set the sensitivity label on a report or dashboard

You can apply or change the sensitivity label on a report or dashboard by following these steps:

1. On the **More options...** menu for a report or dashboard, select **Settings**.
1. In the **Settings** side pane, go to the **Sensitivity label** section.
1. Select the appropriate sensitivity label in the drop-down list.
1. Select **Save** to apply the modified settings.

The following image shows how to set the sensitivity label for a dashboard to _Highly Confidential\Any User  (No Protection)_:

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dashboard.png" alt-text="Screenshot that shows how to set the sensitivity label for a dashboard." lightbox="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dashboard.png" border="false":::

> [!NOTE]
> If the **Sensitivity label** setting isn't available, you might not have the correct [usage rights](service-security-sensitivity-label-change-enforcement.md) to change the setting. If you're not able to change a sensitivity label, consider asking the person who originally applied the label to make the change. You can also contact the Microsoft 365/Office security administrator and request the necessary usage rights for the label.

### Set the sensitivity label on a semantic model or dataflow

You can apply or change the sensitivity label on a semantic model or dataflow by following similar steps:

1. On the **More options...** menu for a semantic model or dataflow, select **Settings**.
1. In the **Settings** view, select the **Semantic models** or **Dataflows** tab, depending on your configuration.
1. Expand the **Sensitivity label** section.
1. Select the appropriate sensitivity label in the drop-down list.
1. Select **Apply** to save the modified settings.

The following images show how to set the sensitivity label for a semantic model to _General_:

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dataset.png" alt-text="Screenshot that shows how to open the settings for a semantic model." lightbox="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dataset.png" border="false":::

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dataset-settings.png" alt-text="Screenshot that shows how to set the sensitivity label for a semantic model." lightbox="media/service-security-apply-data-sensitivity-labels/set-sensitivity-label-dataset-settings.png" border="false":::

> [!NOTE]
> If the **Sensitivity label** setting isn't available, you might not have the correct [usage rights](service-security-sensitivity-label-change-enforcement.md) to change the setting. If you're not able to change a sensitivity label, consider asking the person who originally applied the label to make the change. You can also contact the Microsoft 365/Office security administrator and request the necessary usage rights for the label.

## Apply sensitivity labels in Power BI Desktop

Here are the requirements to apply sensitivity labels in Power BI Desktop:

- You must have a [Power BI Pro or Premium Per User (PPU) license](./service-admin-purchasing-power-bi-pro.md).
- Sensitivity labels must be enabled for your organization. Contact your Power BI admin for information about your configuration.
- You must belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).
- All [licensing and other requirements](./service-security-enable-data-sensitivity-labels.md#licensing-and-requirements) must be met.
- You must be signed in.

Watch the following short video on how to apply sensitivity labels and then try it out yourself.

> [!NOTE]
> This video might show earlier versions of Power BI Desktop or the Power BI service.

> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4M5Gj]

### Set the sensitivity label on a file

To apply a sensitivity label on a file you're working on, select the **Sensitivity** option on the toolbar. Select the appropriate sensitivity label in the drop-down list.

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/sensitivity-label-desktop.png" alt-text="Screenshot that shows how to set the sensitivity label for a file in Power BI Desktop." border="false":::

> [!NOTE]
> If the **Sensitivity** option isn't available, you might not have an appropriate license, or you might not belong to a security group that has permissions to apply sensitivity labels, as described in [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md).
>
> If a specific sensitivity label isn't available, you might not have the correct [usage rights](service-security-sensitivity-label-change-enforcement.md) to change the setting. If you're not able to change a sensitivity label, consider asking the person who originally applied the label to make the change. You can also contact the Microsoft 365/Office security administrator and request the necessary usage rights for the label.

After you apply the sensitivity label, it's visible in the status bar.

:::image type="content" source="media/service-security-apply-data-sensitivity-labels/sensitivity-label-desktop-status-bar.png" alt-text="Screenshot that shows a sensitivity label highlighted in the Power BI Desktop status bar." border="false":::

### Work with sensitivity labels on uploaded or downloaded files

When you publish a .pbix file to the Power BI service from Power BI Desktop, or when you upload a .pbix file to the Power BI service directly via the **OneLake data hub**, the .pbix file's label is applied to both the report and the semantic model that are created in the service.

If the .pbix file you're publishing or uploading replaces existing assets (that is, the file has the same name as the .pbix file), you see a dialog prompt. At the prompt, choose whether to keep the labels on the assets or have the .pbix file's label overwrite those labels. If the .pbix file is unlabeled, the labels in the service are retained.

When you download a .pbix file from the Power BI service by using the **Download this file** option, if both the report and semantic model to download have labels and the two labels are different, the label applied to the .pbix file is the more restrictive of the two.

## Remove sensitivity labels

You can remove sensitivity labels only in Power BI Desktop.

To remove a sensitivity label from a .pbix file, select the **Sensitivity** option on the toolbar. Select the current sensitivity label setting in the drop-down list. The sensitivity label is removed from the file.

## Considerations and limitations

For more information, see [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md#considerations-and-limitations).

## Related content

This article described how to apply sensitivity labels in Power BI. The following articles provide more details about data protection in Power BI.

- [Overview of sensitivity labels in Power BI](./service-security-sensitivity-label-overview.md)
- [Enable sensitivity labels in Power BI](./service-security-enable-data-sensitivity-labels.md)
- [Using Microsoft Defender for Cloud Apps controls in Power BI](/fabric/governance/service-security-using-defender-for-cloud-apps-controls)
