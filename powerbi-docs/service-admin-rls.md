---
title: Row-level security (RLS) with Power BI
description: How to configure row-level security for imported datasets, and DirectQuery, within the Power BI service.
author: mgblythe
manager: kfile
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.author: mblythe
ms.date: 01/02/2018
ms.custom: seodec18
LocalizationGroup: Administration
---

# Row-level security (RLS) with Power BI

Row-level security (RLS) with Power BI can be used to restrict data access for given users. Filters restrict data access at the row level, and you can define filters within roles. Be aware that in the Power BI service, members of a workspace have access to datasets in the workspace. RLS doesn't restrict this data access.

You can configure RLS for data models imported into Power BI with Power BI Desktop. You can also configure RLS on datasets that are using DirectQuery, such as SQL Server. Previously, you were only able to implement RLS within on-premises Analysis Services models outside of Power BI. For Analysis Services live connections, you configure Row-level security on the on-premises model. The security option will not show up for live connection datasets.

[!INCLUDE [include-short-name](./includes/rls-desktop-define-roles.md)]

By default, row-level security filtering uses single-directional filters, regardless of whether the relationships are set to single direction or bi-directional. You can manually enable bi-directional cross-filter with row-level security by selecting the relationship and checking the **Apply security filter in both directions** checkbox. You should check this box when implementing [dynamic row-level security](https://docs.microsoft.com/sql/analysis-services/supplemental-lesson-implement-dynamic-security-by-using-row-filters), wherein you provide row-level security based on user name or login ID.

For more information, see [Bidirectional cross-filtering using DirectQuery in Power BI Desktop](desktop-bidirectional-filtering.md) and the [Securing the Tabular BI Semantic Model](http://download.microsoft.com/download/D/2/0/D20E1C5F-72EA-4505-9F26-FEF9550EFD44/Securing%20the%20Tabular%20BI%20Semantic%20Model.docx) technical article.

![Apply Security Filter](media/service-admin-rls/rls-apply-security-filter.png)


[!INCLUDE [include-short-name](./includes/rls-desktop-view-as-roles.md)]

## Manage security on your model

To manage security on your data model, you will want to do the following.

1. Select the **ellipse (…)** for a dataset.
2. Select **Security**.
   
   ![Apply security filter in both directions](media/service-admin-rls/rls-security.png)

This will take you to the RLS page for you to add members to a role you created in Power BI Desktop. Only the owners of the dataset will see Security available. If the dataset is in a Group, only Administrators of the group will see the security option. 

You can only create or modify roles within Power BI Desktop.

## Working with members

### Add members

You can add a member to the role by typing in the email address, or name, of the user, security group or distribution list you want to add. You cannot add Groups created within Power BI. You can add members [external to your organization](whitepaper-azure-b2b-power-bi.md#data-security-for-external-partners).

![Add a member](media/service-admin-rls/rls-add-member.png)

You can also see how many members are part of the role by the number in parenthesis next to the role name, or next to Members.

![Members in role](media/service-admin-rls/rls-member-count.png)

### Remove members

You can remove members by selecting the X next to their name. 

![Remove member](media/service-admin-rls/rls-remove-member.png)

## Validating the role within the Power BI service

You can validate that the role you defined is working correctly by testing the role. 

1. Select the **ellipsis (...)** next to the role.
2. Select **Test data as role**

![Test as role](media/service-admin-rls/rls-test-role.png)

You will then see reports that are available for this role. Dashboards are not presented in this view. In the blue bar above, you will see what is being applied.

![Now viewing as <role>](media/service-admin-rls/rls-test-role2.png)

You can test other roles, or combination of roles, by selecting **Now viewing as**.

![Test other roles](media/service-admin-rls/rls-test-role3.png)

You can choose to view data as a specific person, or you can select a combination of available roles to validate they are working. 

To return to normal viewing, select **Back to Row-Level Security**.

[!INCLUDE [include-short-name](./includes/rls-usernames.md)]

## Using RLS with app workspaces in Power BI

If you publish your Power BI Desktop report to an app workspace within the Power BI service, the roles will be applied to read-only members. You will need to indicate that members can only view Power BI content within the app workspace settings.

> [!WARNING]
> If you have configured the app workspace so that members have edit permissions, the RLS roles will not be applied to them. Users will be able to see all of the data.

![Group settings](media/service-admin-rls/rls-group-settings.png)

[!INCLUDE [include-short-name](./includes/rls-limitations.md)]

[!INCLUDE [include-short-name](./includes/rls-faq.md)]

## Next steps
[Row-level security (RLS) with Power BI Desktop](desktop-rls.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)