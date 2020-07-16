---
title: Enable sensitivity labels in Power BI
description: Learn how to enable sensitivity labels in Power BI
author: paulinbar

ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 07/06/2020
ms.author: painbar

LocalizationGroup: Data from files
---
# Enable sensitivity labels in Power BI

In order for [Microsoft Information Protection sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels) to be used in Power BI, they must be enabled on the tenant. This article shows Power BI tenant administrators how to do this. For an overview about sensitivity labels in Power BI, see [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md). For information about applying sensitivity labels in Power BI, see [Applying sensitivity labels](./service-security-apply-data-sensitivity-labels.md) 

When sensitivity labels are enabled:

* Specified users and security groups in the organization can classify and [apply sensitivity labels](./service-security-apply-data-sensitivity-labels.md) to their Power BI reports, dashboards, datasets, and dataflows.
* All members of the organization can see those labels.

Enabling sensitivity labels requires an Azure Information Protection license. See [Licensing](service-security-sensitivity-label-overview.md#licensing) for detail.

## Enable sensitivity labels

Go to the Power BI **Admin portal**, open the **Tenant settings** pane, and find the **Information protection** section.

![Find the Information Protection section](media/service-security-enable-data-sensitivity-labels/enable-data-sensitivity-labels-01.png)

In the **Information Protection** section, perform the following steps:
1. Open **Allow users to apply sensitivity labels for Power BI content**.
1. Enable the toggle.
1. Define who can apply and change sensitivity labels in Power BI assets. By default, everyone in your organization will be able to apply sensitivity labels. However, you can choose to enable setting sensitivity labels only for specific users or security groups. With either the entire organization or specific security groups selected, you can exclude specific subsets of users or security groups.
   
   * When sensitivity labels are enabled for the entire organization, exceptions are typically security groups.
   * When sensitivity labels are enabled only for specific users or security groups, exceptions are typically specific users.  
    This approach makes it possible to prevent certain users from applying sensitivity labels in Power BI, even if they belong to a group that has permissions to do so.

1. Press **Apply**.

![Enable sensitivity labels](media/service-security-enable-data-sensitivity-labels/enable-data-sensitivity-labels-02.png)

> [!IMPORTANT]
> Only Power BI Pro users who have *create* and *edit* permissions on the asset, and who are part of the relevant security group that was set in this section, will be able to set and edit the sensitivity labels. Users who are not part of this group won’t be able to set or edit the label.  

## Troubleshooting

Power BI uses Microsoft Information Protection sensitivity labels. Thus if you encounter an error message when trying to enable sensitivity labels, it might be due to one of the following:

* You do not have an Azure Information Protection [license](service-security-sensitivity-label-overview.md#licensing).
* Sensitivity labels have not been migrated to the Microsoft Information Protection version supported by Power BI. Learn more about [migrating sensitivity labels](https://docs.microsoft.com/azure/information-protection/configure-policy-migrate-labels).
* No Microsoft Information Protection sensitivity labels have been defined in the organization. Note that to be usable, a label must be part of a published policy. [Learn more about sensitivity labels](https://docs.microsoft.com/Office365/SecurityCompliance/sensitivity-labels), or visit the [Microsoft security and compliance center](https://sip.protection.office.com/sensitivity?flight=EnableMIPLabels) to read about how to define labels and publish policies for your organization.

## Considerations and limitations

See [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md#limitations) for the list of sensitivity label limitations in Power BI.

## Next steps

This article described how to enable sensitivity labels in Power BI. The following articles provide more details about data protection in Power BI. 

* [Overview of sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [How to apply sensitivity labels in Power BI](../collaborate-share/service-security-apply-data-sensitivity-labels.md)
* [Using Microsoft Cloud App Security controls in Power BI](service-security-using-microsoft-cloud-app-security-controls.md)
* [Protection metrics report](service-security-data-protection-metrics-report.md)