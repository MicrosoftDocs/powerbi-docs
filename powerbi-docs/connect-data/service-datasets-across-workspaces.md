---
title: Introduction to semantic models across workspaces
description: Learn about semantic model sharing and discovery for workspaces. Users across the organization can build reports based on your semantic model in their own workspaces.
author: paulinbar
ms.author: painbar
ms.reviewer: kayu
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: how-to
ms.date: 12/29/2022
LocalizationGroup: Share your work
---
# Introduction to semantic models across workspaces

Business intelligence is a collaborative activity. It's important to establish standardized semantic models that can be the *one source of truth*. Then discovering and reusing those standardized semantic models is key. When expert data modelers in your organization create and share optimized semantic models, report creators can start with those semantic models to build accurate reports. Then your organization has consistent data for making decisions, and a healthy data culture.

:::image type="content" source="media/service-datasets-across-workspaces/power-bi-select-shared-dataset.png" alt-text="Screenshot shows semantic models where you can select a shared semantic model." lightbox="media/service-datasets-across-workspaces/power-bi-select-shared-dataset.png":::

In Power BI, semantic model creators can control who has access to their data by using the [Build permission](service-datasets-build-permissions.md). Semantic model creators can also *certify* or *promote* semantic models so others can discover them. That way, report authors know which semantic models are high quality and official, and they can use those semantic models wherever they author in Power BI. Administrators have a new tenant setting to [govern the use of semantic models across workspaces](service-datasets-admin-across-workspaces.md).

## Semantic model sharing and workspaces

Building reports based on semantic models in different workspaces, and copying reports to different workspaces, are tightly coupled with the [workspace](../collaborate-share/service-create-the-new-workspaces.md):

- In the Power BI service, when you open the semantic model catalog from a workspace, the semantic model catalog shows semantic models in your **My workspace** and in other workspaces.
- In Power BI Desktop, you can publish Live Connect reports to different workspaces.

## Discover semantic models

When you build a report on top of an existing semantic model, the first step is to connect to the semantic model, either in the Power BI service or Power BI Desktop. Read about [discovering semantic models from different workspaces](service-datasets-discover-across-workspaces.md)

## Copy a report

When you find a report you like, in a workspace or an app, you can make a copy of it, and then modify it to fit your needs. You don't have to worry about creating the data model. The data model is already created for you. And it's much easier to modify an existing report than it is to start from scratch. Read more about [copying reports](service-datasets-copy-reports.md).

## Build permission for semantic models

With **Build** permission type, if you're a semantic model creator, you can determine who in your organization can build new content on your semantic models. People with **Build** permission can also build new content on the semantic model outside Power BI, such as Excel sheets via Analyze in Excel, XMLA, and export. Read more about the [Build permission](service-datasets-build-permissions.md).

## Promotion and certification

If you create semantic models, when you create one that others can benefit from, you can make it easier for them to discover it by [promoting your semantic model](../collaborate-share/service-endorse-content.md#promote-content). You can also request that experts in your organization [certify your semantic model](../collaborate-share/service-endorse-content.md#request-content-certification).

## Licensing

The specific features and experiences built on shared semantic model capabilities are licensed according to their existing scenarios. For example:

- In general, discovering and connecting to shared semantic models is available to anyone. It isn't a feature restricted to Premium.
- Users without a Pro or Premium Per User (PPU) license can only use semantic models across workspaces for report authoring if those semantic models reside in the users' personal **My workspace** or in a Premium-backed workspace. The same licensing restriction applies whether they author reports in Power BI Desktop or in the Power BI service.
- Copying reports between workspaces requires a Pro or Premium Per User license.
- Copying reports from an app requires a Pro or Premium Per User license.
- Promoting and certifying semantic models requires a Pro or Premium Per User license.

## Considerations and limitations

- As an app publisher, you have to make sure that your audience has access to semantic models outside of the workspace. Otherwise, users will encounter issues when interacting with your app: reports won't open without semantic model access and dashboard tiles will show as locked. Also, users won't able to open the app if the first item in its navigation is a report without access to the semantic model.
- By design, *Publish to web* doesn't work for a report based on a shared semantic model.
- If two people are members of a workspace that is accessing a shared semantic model, it's possible that only one of them can see the related semantic model in the workspace. Only people with at least **Read** access to the semantic model can see the shared semantic model.

## Related content

- [Promote semantic models](../collaborate-share/service-endorse-content.md#promote-content)
- [Certify semantic models](../collaborate-share/service-endorse-content.md#certify-content)
- [Request semantic model certification](../collaborate-share/service-endorse-content.md#request-content-certification)
- [Govern the use of semantic models across workspaces](service-datasets-admin-across-workspaces.md)
- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
