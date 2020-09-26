---
title: Certify datasets - Power BI
description: Learn how to guide enterprise users to reliable, high-quality datasets.
author: maggiesMSFT
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 09/24/2020
ms.author: maggies

LocalizationGroup: Share your work
---
# Certify datasets - Power BI

Your organization can *certify* datasets that are the authoritative source for critical information. These datasets are featured prominently when report designers start creating a report and looking for reliable data. Certification is a highly selective process, with only the most valuable datasets getting certified. Power BI admins have a new setting, so they tightly control who can certify datasets. Admins ensure that the certification process results in reliable and authoritative datasets that are designed for use across the organization.

As a dataset owner, you can request certification of a promoted dataset. A select group of users defined in the **Certification** tenant setting decides which datasets to certify. The name of the person who certified a dataset is displayed in a tooltip during the dataset discovery experience. Hover over the **Certified** label and you see it. See [Set up dataset and dataflow certification](../admin/service-admin-setup-certification.md) for details.

Power BI provides two ways to *endorse* datasets. Besides certification, the other way is *Promotion*. As a dataset owner or member of a workspace, you can promote your datasets when they're ready for wide-spread usage. See [Promote your dataset](service-datasets-promote.md) for details. 

## Certify a dataset

Your Power BI admin can provide a URL for the **Learn more** link on the **Endorsement** setting page.  They can link to documentation about your certification process. If they don't provide a destination for the **Learn more** link, by default it points to this article.

![Dataset certification Learn more](media/service-datasets-certify-promote/power-bi-dataset-learn-more-certification.png)

Being named someone who can certify datasets is clearly a big responsibility. If a dataset creator contacts you about certifying a dataset, that's the beginning of your vetting process. When you're satisfied that a dataset merits certification, here are your last steps.

1. The dataset owner needs to give you member permissions for the workspace where the dataset is located.
1. If your admin has named you as someone who can certify datasets, the **Certified** option in the **Endorsement** section of **Settings** for the dataset is available. Select **Certified**.
1. Select **Apply**.

Read more about how admins [control the use of datasets across workspaces](service-datasets-admin-across-workspaces.md).

## Next steps

* [Set up dataset and dataflow certification](../admin/service-admin-setup-certification.md)
* [Using datasets across workspaces](service-datasets-across-workspaces.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
