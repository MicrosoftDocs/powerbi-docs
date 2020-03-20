---
title: Promote dataflows (preview)
description: Learn how to promote your dataflows.
author: paulinbar
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 03/17/2020
ms.author: painbar

LocalizationGroup: Share your work
---
# Dataflow endorsement (preview)

Power BI provides two ways you can increase the visibility of your valuable, high-quality dataflows: **promotion** and **certification**.

* **Promotion**: Promotion enables users to highlight dataflows that they think are valuable and worthwhile for others to use. In this way it encourages the collaborative spread of dataflows within an organization. Any dataflow owner, or any member with write permissions on the workspace where a dataflow is located, can simply promote the dataflow when they think it's good enough for sharing.

* **Certification**: Certification means that a dataflow has been checked by an authorized reviewer and is truly a reliable, authoritative data source that is ready for use across the organization. A select group of reviewers defined by the Power BI tenant admin determines which dataflows to certify. A user who thinks a particular dataflow should be certified, but is not authorized to certify it, should contact their tenant administrator.

  Dataflow certification is possible only if it has been [enabled by the Power BI tenant administrator](../admin/service-admin-setup-certification.md).

Promoting or certifying a dataflow is called *endorsement*. Power BI report creators often have many different dataflows to choose from, and endorsement helps guide them to the dataflows that are reliable, trust-worthy, and authoritative.

Endorsed dataflows are clearly labeled in many places in Power BI, making it easy for report creators to find them when they are looking for reliable data, and for administrators and report creators to track how they are being used throughout the organization.

This article describes
* Promoting a dataflow (dataflow owner or any user with member permissions on the workspace where the dataflow is located)
* Certifying a dataflow (authorized dataflow certifier, as determined by the Tenant admin)

For information about setting up dataflow certification (tenant admin), see [Set up dataset and dataflow certification](../admin/service-admin-setup-certification.md)


## Promote a dataflow

To promote a dataflow, you must have write permissions the workspace where the dataflow you want to promote is located.

1. Go to the list of dataflows in the workspace.
 
1. Select **More options** (...) on the dataflow you want to promote, then select **Settings**.

    ![Select the ellipsis on the dataflow](media/service-dataflows-promote/power-bi-dataflow-settings.png)

1. Expand the endorsement section and select **Promoted**.

    ![Select Promoted and Apply](media/service-dataflows-promote/power-bi-dataflow-promoted-endorsement.png)

1. Select **Apply**.

When you promote a dataflow, it gets labeled at many places it appears in Power BI, and is easily visible.

![Promotion and Certification labels](media/service-dataflows-promote/power-bi-dataflow-labels.png)

## Certify a dataflow

This section is intended for users who have been authorized by their Tenant administrator to certify dataflows. Certifying dataflows is a big responsibility. This section explains the certification process you go through.

1. Get write permissions on the workspace where the dataflow you want to certify resides. This could be from dataflow owner or from anyone with admin permissions on the workspace. 

1. Carefully review the dataflow and determine whether it merits certification.

1. If you decide to certify the dataflow, go to the workspace where it resides.
 
1. Find the dataflow you are looking for, click **More options** (...), then select **Settings**.

    ![Select the ellipsis on the dataset or dataflow](media/service-dataflows-certify/service-dataflow-settings.png)

1. Expand the endorsement section and click **Certified**. 

    ![Click the Learn more link](media/service-dataflows-certify/service-certify-datasets-dataflows.png)

2. Click **Apply**.

## Next steps

* [Overview of dataset and dataflow endorsement in Power BI](../connect-data/service-dataset-dataflow-endorsement-overview.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)