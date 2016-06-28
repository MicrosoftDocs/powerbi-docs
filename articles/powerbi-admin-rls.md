<properties
pageTitle="Row-level security with Power BI"
description="How to configure row-level security for imported datasets, and DirectQuery, within the Power BI service."
services="powerbi"
documentationCenter=""
authors="guyinacube"
manager="mblythe"
backup=""
editor=""
tags=""
qualityFocus="no"
qualityDate=""/>

<tags
ms.service="powerbi"
ms.devlang="NA"
ms.topic="article"
ms.tgt_pltfrm="na"
ms.workload="powerbi"
ms.date="05/11/2016"
ms.author="asaxton"/>
# Row-level security

Row-level security (RLS) can be used to restrict data access for given users. This is accomplished by using filters at the row level. Filters are implemented through roles.

You can now configure RLS for data models that have been imported into Power BI. These are referred to as cloud models. You can also configure RLS on datasets that are using DirectQuery, such as SQL Server. Previously, you were only able to implement RLS via live connections to Analysis Services on-premises. Row-level security for Analysis Services is still handled at the on-premises server. The security option will not show up for Live connection datasets.

> **Note**: The preview is intended to let users to start trying out the feature. It will also allow us to collect feedback for improvements. It is not intended for operational usage. Rules defined during the preview may not be available when the feature is generally available.

<iframe width="560" height="315" src="https://www.youtube.com/embed/qrlq9sZyjug" frameborder="0" allowfullscreen></iframe>

## Manage security on your model

To manage security on your data model, you will want to do the following.

1.	Select the **ellipse (…)** for a dataset.
2.	Select **Security**.

    ![](media/powerbi-admin-rls/rls-security.png)
 
This will take you to the RLS page for you to create roles and add rules with filters. Only the owners of the dataset will see Security available. If the dataset is in a Group, only Administrators of the group will see the security option. There are changes coming for how RLS works within a group.

## Working with roles

To create a new role, simply select **Create New Role**.

![](media/powerbi-admin-rls/rls-first-time.png)
 
> **Note**: The first time you create a role, you will get a notice indicating that republish is not supported with RLS. Republishing, or overwriting, the dataset will cause you to have to re-create the RLS settings.

![](media/powerbi-admin-rls/rls-not-supported.png)
 
> **Note**: OneDrive refresh is not supported with RLS. If you turn that on, then you will lose all RLS configuration you have defined. Scheduled refresh is supported for imported datasets.

You can provide a name for the role when you initially create it. You can rename, or delete, the role by select the **ellipse (…)** for that role and selecting either **Rename** or **Delete**.

![](media/powerbi-admin-rls/rls-rename-delete-role.png)

## Working with members

### Add members

You can add a member to the role by typing in the email address, or name, of the user, security group or distribution list you want to add. This member has to be within your organization. You cannot add Groups created within Power BI.

![](media/powerbi-admin-rls/rls-add-member.png)
 
You can also see how many members are part of the role by the number in parenthesis next to the role name, or next to Members.

![](media/powerbi-admin-rls/rls-member-count.png)
 
### Remove members

You can remove members by selecting the X next to their name. 
 
![](media/powerbi-admin-rls/rls-remove-member.png)

## Defining a rule for a role

The way you define what the members will see is via a filter on a table within the data model. Rules are defined by using DAX expressions. In a future release, you will have a more intuitive UI to make it easier for you to define the rule. You can define the filter by doing the following.

1.	Select the role you want to add a rule to.
2.	Select **Rules**.

    ![](media/powerbi-admin-rls/rls-rules.png)

3.	Select the table you want to add the filter to.
4.	Enter your DAX formula, for the selected table, in the **DAX Input** text box.

    ![](media/powerbi-admin-rls/rls-rule-definition.png)

5.	Select **Save**.

> **Note**: There is no validation on the DAX expression that is supplied. The rule will still save if the DAX expression is invalid.

When the members, that are defined in the Role, interact with the dataset, report, or dashboard, they will only see data that is allowed based on the rules. If you are assigned to more than one role, you will have access to the data allowed by all roles you belong to.

## Test the role

You can validate that the role you defined is working correctly by testing the role. 

1. Select the **ellipse (...)** next to the role.
2. Select **Test data as role**

![](media/powerbi-admin-rls/rls-test-role.png)

You will then see reports that are available for this role. Dashboards are not presented in this view. In the blue bar above, you will see what is being applied.

![](media/powerbi-admin-rls/rls-test-role2.png)

You can test other roles, or combination of roles, by selecting **Now viewing as**.

![](media/powerbi-admin-rls/rls-test-role3.png)

You can choose to view data as a specific person, or you can select a combination of available roles to validate they are working. 

To return to normal viewing, select **Back to Row-Level Security**.

## Using the username() DAX function

You can take advantage of the DAX function *username()* within your dataset. You can use it within expressions in Power BI Desktop. When you publish your model, it will be used within the Power BI service.

> **Note**: Username() will not return the UPN of the user until you configure RLS on the dataset.

When you first publish the model, the value returned from the function will be a GUID. It will return the user's User Principal Name (UPN) after you have configured RLS on the dataset.

## Limitations

Here is a list of the current limitations for row-level security on cloud models.

- You can define RLS only on the datasets created using Power BI Desktop client. If you want to enable RLS for datasets created with Excel, you will need to convert your files into PBIX files first. [Learn more](powerbi-desktop-import-excel-workbooks.md)
- Only ETL, and DirectQuery connections are supported. Live connections to Analysis Services are handled in the on-premises model.
- If you make a change to your PBIX file, and republish to the service, you will need to re-create RLS.
- Q&A and Cortana is not supported with RLS. You will not see the Q&A input box for dashboards if all models have RLS configured.
