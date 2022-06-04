---
title: "Power BI implementation planning: Workspace auditing"
description: "TODO PBIIP workspaces - auditing"
author: peter-myers
ms.author: v-petermyers
ms.reviewer: maroche
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 06/30/2022
---

# Power BI implementation planning: Workspace auditing

[!INCLUDE [powerbi-implementation-planning-context](includes/powerbi-implementation-planning-context.md)]

It's necessary to understand how workspaces are really being used in your organization. Auditing can be used for a wide variety of purposes:

- Tracking usage patterns, activities, and adoption
- Supporting governance and security requirements
- Finding noncompliance with specific requirements
- Documenting the architecture and settings
- Detecting user education and training opportunities

> [!NOTE]
> See the [auditing and monitoring](http://todo-newpbiiparticle/) article for more information about deciding how to approach auditing Power BI activities. It includes activities and actions related to setting up auditing in general.

When considering workspace auditing, the key decisions and actions include:

> [!div class="checklist"]
> - **Decide what's most important to audit for workspaces:** Consider which workspace auditing processes are most important from an auditing perspective. Prioritize areas of risk, major inefficiencies, or noncompliance with the most important workspace governance requirements. When a situation comes up that could be improved, educate users on a better way to do things.
> - **Ensure auditing processes are implemented:** Verify that sufficient processes are put in place to extract, integrate, model, and create reports so that workspace auditing can be done.
> - **Take appropriate action:** Using the information gleaned from the auditing processes, make sure that someone has the authority and time available to take the appropriate actions. Depending on the situation, it may involve republishing content elsewhere or adjusting permissions. Other situations might involve additional user education or training.

The remainder of this article includes suggestions for useful workspace auditing processes you might choose to implement.

## Workspace activities

The Power BI activity log contains an abundance of information that's useful for many auditing purposes.

- **What to look for:** You can determine when a new workspace was created, updated, or deleted, and by whom. You can detect other things as well, such as if a workspace was added or removed from a Premium capacity, if dataflows storage was assigned to a workspace, if the workspace was assigned to a deployment pipeline, or if workspace access was updated.
- **Actions to take:** Ensure the activity log data is being extracted regularly. Determine how to classify activities to support your auditing needs. Some activities might justify review by an administrator (if a workspace was deleted, for example); other activities might justify being included in regular audit reviews (if workspace access was updated, for instance).
- **Where to find this data:** In the [Power BI activity log](../admin/service-admin-auditing.md).

## Workspace inventory snapshot

Having an inventory of artifacts that are stored in a workspace is useful for several auditing purposes. The inventory snapshot is a list of the workspace metadata at a point in time.

- **What to look for:** You can verify things like if your workspace naming convention is being followed, or if useful workspace descriptions are being added. You may also be able to detect if artifacts are being stored in a workspace that was originally intended for a different purpose.
- **Actions to take:** Consider building a workspace inventory on a regular schedule (such as weekly or monthly). The workspace inventory is a great complement to the data from the Power BI activity log.
- **Where to find this data:** The [metadata scanning](../enterprise/service-admin-metadata-scanning.md) REST APIs.

## Workspace security snapshot

Having a snapshot of workspace security is useful for several auditing purposes. The security snapshot includes the workspace roles at a point in time.

- **What to look for:** This data is particularly useful for security audits. You can also use it to help assess workspace access vs. user responsibilities and job roles.
- **Actions to take:** Consider building a workspace security snapshot on a regular schedule (such as weekly or monthly). The workspace security snapshot can be used to complement data from the Power BI activity log, which is particularly helpful for doing security audits.
- **Where to find this data:** The [metadata scanning](../enterprise/service-admin-metadata-scanning.md) REST APIs.

## Finding issues

Sometimes you may want to look for certain issues proactively. The remainder of this section includes potential ideas.

### Sensitive data published to an improper workspace

Sometimes users might use an existing workspace for a purpose that wasn't originally intended. It becomes more of an issue when sensitive data is involved. For example, customer demographics data (that contains personally identifiable information) should usually reside in its own workspace rather than be combined with more general sales analytics.

- **What to look for:** Find artifacts that have a name and description which don't line up well with the workspace name and description. Also look for certain artifacts that have a higher sensitivity label assigned. You might also look for individual columns and measures in the dataset.
- **Actions to take:** Sensitive content should be in a workspace that's intended for that specific purpose.
- **Where to find this data:** The [metadata scanning](../enterprise/service-admin-metadata-scanning.md) REST APIs.

### Overuse of personal workspaces

Storing critical content in a personal workspace represents risk to the organization.

- **What to look for:** Find reports that have been shared from a personal workspace and have a high number of report views.
- **Actions to take:** Critical content should be relocated to a standard workspace. Users should be educated on the best usage of a personal workspace.
- **Where to find this data:** In the [Power BI activity log](../admin/service-admin-auditing.md).

## Next steps

For additional considerations, actions, decision-making criteria, and recommendations to help you with Power BI implementation decisions, see the [Power BI implementation planning overview](powerbi-implementation-planning-introduction.md).
