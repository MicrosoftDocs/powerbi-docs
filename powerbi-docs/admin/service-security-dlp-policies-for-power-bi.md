---
title: Data loss prevention policies for Power BI (preview)
description: Learn how to configure data loss prevention policies for Power BI.
author: paulinbar
ms.author: painbar
manager: kfolis
ms.service: powerbi
ms.subservice: powerbi-eim
ms.topic: conceptual
ms.custom:
ms.date: 12/13/2021
LocalizationGroup: Data from files
---

# Data loss prevention policies for Power BI (preview)

To help organizations detect and protect their sensitive data, Power BI supports [Microsoft 365 data loss prevention (DLP) polices](/microsoft-365/compliance/dlp-learn-about-dlp). When a DLP policy for Power BI detects a sensitive dataset, a policy tip can be attached to the dataset in the Power BI service that explains the nature of the sensitive content, and an alert can be registered in the data loss prevention **Alerts** tab in the Microsoft compliance portal for monitoring and management by administrators. In addition, email alerts can be sent to administrators and specified users.

## Considerations and limitations

* DLP policies for Power BI are defined in the Microsoft 365 compliance portal.
* DLP policies apply to workspaces. Only workspaces hosted in Premium Gen2 capacities with [autoscaling](service-premium-auto-scale.md) enabled are supported.
* DLP evaluation consumes capacity. Metering for DLP capacity consumption is not yet in place. 
* Both classic and new experience workspaces are supported, provided that they are hosted in Premium Gen2 capacities with [autoscaling](service-premium-auto-scale.md) enabled.
* DLP policy templates are not yet supported for Power BI DLP policies. When creating a DLP policy for Power BI, choose the "custom policy" option.
* Currently, "sensitivity label" is the only supported condition type for Power BI DLP policy rules. 
* DLP policies for Power BI are not supported for sample datasets, [streaming datasets](../connect-data/service-real-time-streaming.md), or datasets that connect to their data source via [DirectQuery](../connect-data/desktop-use-directquery.md) or [live connection](../connect-data/desktop-directquery-about.md#live-connections). 

## How do DLP policies for Power BI work

You define a DLP policy in the data loss prevention section of the compliance portal. In the policy, you specify sensitivity label(s) you want to detect. You also specify the action(s) that will happen when the policy detects a dataset that has a specified sensitivity label applied. DLP policies for Power BI support two actions:

* User notification via policy tips.
* Alerts. Alerts can be sent by email to administrators and users. Additionally, administrators can monitor and manage alerts on the **Alerts** tab in the compliance center. 

When a dataset is evaluated by DLP policies, if it matches the conditions specified in a DLP policy, the actions specified in the policy occur. A dataset is evaluated against DLP policies whenever one of the following events occurs:

* Publish
* Republish
* On-demand refresh
* Scheduled refresh

>[!NOTE]
> DLP evaluation of the dataset does not occur in either of the following cases:
> * The initiator of the event is a service principal.
> * The dataset owner is either a service principal or a B2B user.

## What happens when a dataset is flagged by a Power BI DLP policy

When a DLP policy detects an issue with a dataset:
* If "user notification" is enabled in the policy, the dataset will be marked in the Power BI service with a shield that indicates that a DLP policy has detected an issue with the dataset.

    ![Screenshot of policy tip badge on dataset in lists.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-policy-tip-on-dataset.png)

    Open the dataset details page to see a policy tip that explains the policy violation and how the detected type of sensitive information should be handled.

    ![Screenshot of policy tip on dataset details page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-policy-tip-in-dataset-details.png)

    >[!NOTE]
    > If you hide the policy tip, it doesn’t get deleted. It will appear the next time you visit the page.

* If alerts are enabled in the policy, an alert will be recorded on the data loss prevention **Alerts** tab in the compliance center, and (if configured) an email will be sent to administrators and/or specified users. The following image shows the Alerts tab in the data loss prevention section of the compliance center.

    ![Screenshot of Alerts tab in the compliance center.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-alerts-tab.png)

## Configure a DLP policy for Power BI

1. Log into the Microsoft 365 compliance portal.

1. Choose the Data loss prevention solution in the navigation pane, select the **Policies** tab, choose **Create policy**.

    ![Screenshot of D L P create policy page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-create.png)

1. Choose the **Custom** category and then the **Custom policy** template.
    
    >[!NOTE]
    >No other categories or templates are currently supported.

    ![Screenshot of D L P choose custom policy page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-choose-custom.png)
 
    When done, click **Next**.

1. Name the policy and provide a meaningful description.

    ![Screenshot of D L P policy name description section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-name-description.png)
 
    When done, click **Next**.

1. Enable Power BI as a location for the DLP policy. Disable all other locations. Currently, DLP policies for Power BI must specify Power BI as the sole location.

    ![Screenshot of D L P choose location page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-choose-location.png)

    By default the policy will apply to all workspaces. Alternatively, you can specify particular workspaces to include in the policy as well as workspaces to exclude from the policy.
    >[!NOTE]
    > DLP actions are supported only for workspaces hosted in Premium Gen2 capacities with autoscaling enabled.

    If you select **Choose workspaces** or **Exclude workspaces**, a dialog will allow you to create a list of included (or excluded) workspaces. You must specify workspaces by workspace object ID. Click the info icon for information about how to find workspace object IDs.

    ![Screenshot of D L P choose workspaces dialog.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-choose-workspaces.png)
 
    After enabling Power BI as a DLP location for the policy and choosing which workspaces the policy will apply to, click **Next**.

1. The **Define policy settings** page appears. Choose **Create or customize advanced DLP rules** to begin defining your policy.

    ![Screenshot of D L P create advanced rule page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-create-advanced-rule.png)
 
    When done, click **Next**.

1. On the **Customize advanced DLP rules** page, you can either start creating a new rule or choose an existing rule to edit. Click **Create rule**.

    ![Screenshot of D L P create rule page.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-create-rule.png)


1. The **Create rule** page appears. On the create rule page, provide a name and description for the rule, and then configure the other sections, which are described following the image below.

    ![Screenshot of D L P create rule form.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-create-rule-form.png)
 
    ### Conditions

In the condition section, you define the conditions under which the policy will apply to a dataset. Conditions are created in groups. Groups make it possible to construct complex conditions.

1. Open the conditions section, choose **Add condition** and then **Content contains**.

    ![Screenshot of D L P add conditions content contains section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-add-conditions-content-contains.png)
 
    This opens the first group (named Default – you can change this).

1. Choose **Add**, and then **Sensitivity labels**.
        
    >[!NOTE]
    > Sensitive info types are currently not supported.
    
    ![Screenshot of D L P add conditions section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-add-conditions.png)
 
    When you choose **Sensitivity label**, you will be able to choose a particular sensitivity label from a list that will appear.

    You can add additional sensitivity labels to the group. To the right of the group name, you can specify **Any of these** or **All of these**. This determines whether matches on all or any of the labels is required for the condition to hold. Make sure Any of these is selected, since datasets can’t have more than one label applied.

    The image below shows a group (Default) that contains two sensitivity label conditions. The logic Any of these means that a match on any one of the sensitivity labels in the group constitutes “true” for that group.

    ![Screenshot of D L P conditions group section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-condition-group.png) 
 
    You can create more than one group, and you can control the logic between the groups with **AND** or **OR** logic. 

    The image below shows a rule containing two groups, joined by **OR** logic.

    ![Screenshot of rule with two groups.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-content-contains.png) 
 
### Exceptions

If dataset content or the sensitivity label of the dataset matches any of the defined exceptions, the rule won’t be applied to the dataset. 

Exceptions are configured in the same way as conditions, described above.
    
![Screenshot of D L P exceptions section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-exceptions-section.png)
 
### Actions

Protection actions are currently unavailable for Power BI DLP policies.

![Screenshot of D L P policy actions section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-actions-section.png)


### User notifications

The user notifications section is where you configure your policy tip. Turn on the toggle, select the **Notify users in Office 365 service with a policy tip** and **Policy tips** checkboxes, and write your policy tip in the text box.

![Screenshot of D L P user notification section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-user-notification.png)
 
### User overrides
 
User overrides are currently unavailable for Power BI DLP policies.

![Screenshot of D L P user overrides section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-user-overrides-section.png) 
 
### Incident reports

Assign a severity level that will be shown in alerts generated from this policy. Enable (default) or disable email notification to admins, specify users or groups for email notification, and configure the details about when notification will occur.

![Screenshot of D L P incident report section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-incidence-report.png)
   
### Additional options

![Screenshot of D L P additional options section.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-additional-options.png)
 
## Monitor and manage policy alerts

Log into the Microsoft 365 compliance portal and navigate to **Data loss prevention > Alerts**.

![Screenshot of D L P Alerts tab.](media/service-security-dlp-policies-for-power-bi/power-bi-dlp-alerts-tab.png)

Click on an alert to start drilling down to its details and to see management options.

## Next steps

* [Learn about data loss prevention](/microsoft-365/compliance/dlp-learn-about-dlp)
* [Sensitivity labels in Power BI](service-security-sensitivity-label-overview.md)
* [Data protection metrics report](service-security-data-protection-metrics-report.md)
* [Audit schema for sensitivity labels in Power BI](service-security-sensitivity-label-audit-schema.md)