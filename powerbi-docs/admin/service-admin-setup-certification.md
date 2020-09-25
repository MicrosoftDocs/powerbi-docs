---
title: Set up dataset and dataflow certification (preview)
description: Learn how to set up the dataset and dataflow certification process in your org.
author: paulinbar
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: how-to
ms.date: 05/15/2020
ms.author: painbar

LocalizationGroup: Share your work
---
# Set up dataset and dataflow certification (preview)

Your organization can certify datasets and dataflows that are the authoritative sources for critical information.

As a Power BI admin, you are responsible for setting up the certification process for your organization. This means:
* Enabling certification on your tenant.
* Defining a list of groups and users who are authorized to certify datasets and dataflows.
* For datasets, providing the URL of the organization's dataset certification policy, if such exists.

Dataset and dataflow certification are part of dataset and dataflow *endorsement*. See [dataset endorsement](../connect-data/service-datasets-promote.md) and [dataflow endorsement](../transform-model/service-dataflows-promote-certify.md) for more information.


## Set up certification

1. In the Admin portal, go to Tenant settings.
1. Under the Export and sharing settings section, expand the Certification section.

   ![Set up dataset and dataflow certification](media/service-admin-setup-certification/service-admin-certification-setup-dialog.png)

1. Set the toggle to **Enabled**.
1. For dataset certification, if your organization has a published certification policy, you can provide its URL here. This will become the **Learn more** link in the certification section of the [dataflow endorsement settings dialog](../connect-data/service-datasets-promote.md#request-dataset-certification) 
1. Specify the users or groups who are authorized to certify datasets and dataflows. These authorized certifiers will able to use the Certification button in the certification section of the [dataset](../connect-data/service-datasets-promote.md#request-dataset-certification) or [dataflow](../transform-model/service-dataflows-promote-certify.md#certify-a-dataflow) endorsement settings dialog.
1. Click **Apply**.

## Next steps
* [Promote datasets](../connect-data/service-datasets-promote.md)
* [Certify datasets](../connect-data/service-datasets-certify.md)
* [Promote dataflows](../transform-model/service-dataflows-promote-certify.md#promote-a-dataflow)
* [Certify dataflows](../transform-model/service-dataflows-promote-certify.md#certify-a-dataflow)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
