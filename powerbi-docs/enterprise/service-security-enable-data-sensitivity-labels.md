---
title: Enable sensitivity labels in Fabric
description: Learn how Fabric administrators can enable sensitivity labels in Fabric.
author: paulinbar
ms.author: painbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 11/16/2023
---
# Enable sensitivity labels in Fabric

In order for [sensitivity labels from Microsoft Purview Information Protection](/microsoft-365/compliance/sensitivity-labels) to be used in Fabric and Power BI (including Power BI Desktop), they must be enabled on the tenant. This article shows Fabric admins how to do this. For an overview about sensitivity labels in Fabric, see [Sensitivity labels in Fabric](service-security-sensitivity-label-overview.md). For information about applying sensitivity labels in Fabric, see [Apply sensitivity labels to Fabric items](/fabric/get-started/apply-sensitivity-labels)

When sensitivity labels are enabled:

* Specified users and security groups in the organization can [apply sensitivity labels](/fabric/get-started/apply-sensitivity-labels) to their Fabric content. In the Fabric service, this means any Fabric item. In Power BI Desktop, it means their *.pbix* files.
* In the service, all members of the organization can see those labels. In Desktop, only members of the organization who have the labels published to them can see the labels.

Enabling sensitivity labels requires an Azure Information Protection license. See [Licensing and requirements](#licensing-and-requirements) for detail.

#### Give us your feedback

The product team would love to get your **[feedback](https://forms.office.com/pages/responsepage.aspx?id=v4j5cvGGr0GRqy180BHbR-PPBJBIRPlBpEYIBVrF5lRUREtUREJJRzJZSzcyM1pZWU9LOUdSVkFKWC4u)** about Fabric's information protection capabilities and its integration with Microsoft Purview Information Protection. Help us meet your information protection needs! Thanks!

## Licensing and requirements

* An Azure Information Protection Premium P1 or Premium P2 license is required to apply or view sensitivity labels from Purview Information Protection. Azure Information Protection can be purchased either standalone or through one of the Microsoft licensing suites. See [Azure Information Protection pricing](https://azure.microsoft.com/services/information-protection/) for detail.

    > [!NOTE]
    > If your organization uses Azure Information Protection sensitivity labels, they need to be migrated to the Purview Information Protection Unified Labeling platform in order for the them to be used in Fabric. [Learn more about migrating sensitivity labels](/azure/information-protection/configure-policy-migrate-labels).

* To be able to apply labels to Power BI Fabric items, a user must have a Power BI Pro or Premium Per User (PPU) license in addition to one of the Azure Information Protection licenses mentioned above.

* Office apps have their own [licensing requirements for viewing and applying sensitivity labels](/microsoft-365/compliance/get-started-with-sensitivity-labels#subscription-and-licensing-requirements-for-sensitivity-labels).

* Before enabling sensitivity labels on your tenant, make sure that sensitivity labels have been defined and published for relevant users and groups. See [Create and configure sensitivity labels and their policies](/microsoft-365/compliance/create-sensitivity-labels) for detail.

* Customers in China must enable rights management for the tenant and add the Microsoft Purview Information Protection Sync Service service principle, as described in steps 1 and 2 under [Configure Azure Information Protection for customers in China](/microsoft-365/admin/services-in-china/parity-between-azure-information-protection?view=o365-21vianet&preserve-view=true#configure-aip-for-customers-in-china).

* Using sensitivity labels in Desktop requires the Desktop December 2020 release or later.

    > [!NOTE]
    > If you try to open a protected .pbix file with a Desktop version earlier than December 2020, it will fail, and you'll be prompted to upgrade your Desktop version.

## Enable sensitivity labels

Sensitivity labels must be enabled in your tenant before they can be used in both in the Fabric service and in Power BI Desktop. This section describes how to enable them in the Fabric tenant settings.

To enable sensitivity labels on your tenant:

1. Go to the [Fabric admin portal](/fabric/admin/admin-center#how-to-get-to-the-admin-portal).

1. Choose **Tenant settings** on the navigation pane.

1. Find the **Information protection** section and expand **Allow users to apply sensitivity labels for content**.

1. Turn on the toggle switch.

1. Define who can apply and change sensitivity labels on Fabric items:

    * Select **The entire organization** if you want everyone in the organization to be able to apply and change labels on items. This is the default setting.

    * Select **Specific security groups** if you want to allow this capability for only certain users. Make sure that the security group(s) you specify contain only users who you want to be able to apply and change sensitivity labels on items.

1. If you want certain users not to be able to apply and change sensitivity labels on items, mark the **Except specify security groups** checkbox and specify a security group(s) that contains just those users.

1. When done, press **Apply**.

> [!IMPORTANT]
> Users who this setting allows to apply and change sensitivity labels must also have *create* and *edit* permissions on any item they wish to apply or change a label on.

## Troubleshooting

Fabric uses sensitivity labels from Microsoft Purview Information Protection. Thus if you encounter an error message when trying to enable sensitivity labels, it might be due to one of the following reasons:

* Sensitivity labels haven't been [migrated](#enable-sensitivity-labels) to the Microsoft Purview Information Protection version supported by Fabric.
* No sensitivity labels from Microsoft Purview Information Protection have been [defined in the organization](#enable-sensitivity-labels).

## Considerations and limitations

For a list of sensitivity label limitations in Fabric and Power BI, see [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md#considerations-and-limitations).

## Related content

This article described how to enable sensitivity labels in Fabric. The following articles provide more details about data protection in Fabric.

* [Overview of sensitivity labels](service-security-sensitivity-label-overview.md)
* [Apply sensitivity labels to Fabric items](/fabric/get-started/apply-sensitivity-labels)
* [Using Microsoft Defender for Cloud Apps controls in Power BI](/fabric/governance/service-security-using-defender-for-cloud-apps-controls)
