---
title: Set up dataset and dataflow certification (preview)
description: Learn how to set up the dataset and dataflow certification process in your org.
author: paulinbar
ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: how-to
ms.date: 03/17/2020
ms.author: painbar

LocalizationGroup: Share your work
---
# Set up dataset and dataflow certification (preview)

Your organization can certify datasets and dataflows that are the authoritative sources for critical information.

As a Power BI tenant admin, you are responsible for setting up the certification process for your organization. This means:
* Enabling certification on your tenant.
* Defining a list of groups and users who are authorized to certify datasets and dataflows.

See [Dataset and dataflow endorsement](../connect-data/service-dataset-dataflow-endorsement-overview.md) for more information about certification.


## Set up certification

1. In the Admin portal, go to Tenant settings.
1. Under the Export and sharing settings section, expand the Certification section.

   ![Set up dataset and dataflow certification](media/service-admin-setup-certification/service-admin-certification-setup-dialog.png)

1. Set the toggle to **Enabled**.
1. Specify the users or groups who are authorized to certify datasets and dataflows. These authorized certifiers will able to use the Certification button in the Endorsement section of the [dataset](../service-datasets-certify.md) or [dataflow](../transform-model/service-dataflows-certify.md) settings page.
1. Click **Apply**.

## Next steps
* [Dataset and dataflow endorsement overview](../connect-data/service-dataset-dataflow-endorsement-overview.md)
* [Promote datasets](../service-datasets-promote.md)
* [Certify datasets](../service-datasets-certify.md)
* [Promote dataflows](../transform-model/service-dataflows-promote.md)
* [Certify dataflows](../transform-model/service-dataflows-certify.md)
* Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
