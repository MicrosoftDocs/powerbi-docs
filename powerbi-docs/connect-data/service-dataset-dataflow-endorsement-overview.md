---
title: Dataset and dataflow endorsement  (preview)
description: Learn how datasets and dataflows can be promoted, certified, and labeled as reliable, trusted sources of data in your organization.
author: paulinbar
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/17/2020
ms.author: painbar

LocalizationGroup: Share your work
---
# Dataset and dataflow endorsement (preview)

Power BI provides two ways you can increase the visibility of your valuable, high-quality datasets and dataflows: **[promotion](#promotion)** and **[certification](#certification)**. Promoting and certifying datasets and dataflows is called *endorsement*.

Power BI report creators often have many different datasets and dataflows to choose from. With endorsement, enterprises can help guide them to the datasets and dataflows that are reliable, trust-worthy, and authoritative.

Endorsed datasets and dataflows are clearly labeled in many places in Power BI, making it easy for report creators to find them when they are looking for reliable data, and for administrators and report creators to track how they are being used throughout the organization.

To be endorsed, a dataset or dataflow must be in a [new workspace experience](../service-new-workspaces.md).

## Promotion

Any dataset or dataflow owner, or any member of a workspace where a dataset or dataflow is located,  can simply promote the dataset or dataflow when they think it's good enough for sharing. Promotion encourages the collaborative spread of datasets and dataflows within an organization. See [Promote datasets](service-endorse-datasets-dataflows.md#promote-a-dataset-or-dataflow) for details.

## Certification

Certification means that a dataset or dataflow has been checked by an authorized reviewer and is truly a reliable, authoritative data source that is ready for use across the organization. A select group of reviewers defined by the Power BI tenant admin determines which datasets and dataflows to certify.

The activities involved in dataset and dataflow certification are described below:

* The Power BI tenant admin sets up the certification process. This means
   * Enabling certification on the tenant
   * Defining a list of groups or users who are authorized to certify datasets and dataflows
   
   See [Set up dataset and dataflow certification](../admin/service-admin-setup-certification.md) for details.

* Users who have been specified by the tenant admin as an authorized dataset and dataflow reviewers decide whether a particular dataset or dataflow should be certified. If they decide it should be certified, they go to the settings of the dataset or dataflow and certify it. See [Certify a dataset or dataflow](service-certify-datasets-dataflows.md) for details.

A user who thinks a dataset or dataflow should be certified, but is not authorized to certify it, should contact their tenant administrator.

## Next steps
* Power BI tenant admins: [Set up dataset and dataflow certification](../admin/service-admin-setup-certification.md)
* Dataset and dataflow owners: [Endorse your datasets and dataflows](service-endorse-datasets-dataflows.md#request-dataset-or-dataflow-certification)
* Authorized dataset and dataflow reviewers: [Certify a dataset or dataflow](service-certify-datasets-dataflows.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
