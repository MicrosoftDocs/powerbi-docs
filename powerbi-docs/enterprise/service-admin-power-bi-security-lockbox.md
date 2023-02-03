---
title: Lockbox for Power BI
description: Customer Lockbox for Power BI is a service that allows customers to control how Microsoft engineers access their data.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 01/29/2023
LocalizationGroup: Administration
---

# Customer Lockbox for Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Use [Customer Lockbox for Microsoft Azure](/azure/security/fundamentals/customer-lockbox-overview) to control how Microsoft engineers access your data. In this article you'll learn how Customer Lockbox requests are initiated, tracked, and stored for later reviews and audits.

Typically, Customer Lockbox is used to help Microsoft engineers troubleshoot a Power BI service support request. Customer Lockbox can also be used when Microsoft identifies a problem, and a Microsoft-initiated event is opened to investigate the issue.

## Enable Customer Lockbox for Power BI

To enable Customer Lockbox for Power BI, you must be an Azure AD Global Administrator. To assign roles in Azure AD, see [Assign Azure AD roles to users](/azure/active-directory/roles/manage-roles-portal).

1. Open the Azure portal.

2. Go to **Customer Lockbox for Microsoft Azure**.

3. In the **Administration** tab, select **Enabled**.

    :::image type="content" source="media/service-admin-power-bi-security-lockbox/enable-lockbox.png" alt-text="Screenshot of enabling Customer Lockbox for Microsoft Azure in the Customer Lockbox for Microsoft Azure administration tab." lightbox="media/service-admin-power-bi-security-lockbox/enable-lockbox.png":::

## Microsoft access request

In cases where the Microsoft engineer can't troubleshoot your issue by using standard tools, elevated permissions are requested using the [Just-In-Time](/azure/azure-resource-manager/managed-applications/request-just-in-time-access) (JIT) access service. The request can come from the original support engineer, or from a different engineer.

After the access request is submitted, the JIT service evaluates the request, considering factors such as:

* The scope of the resource

* Whether the requester is an isolated identity or using multi-factor authentication

* Permissions levels

Based on the JIT role, the request may also include an approval from internal Microsoft approvers. For example, the approver might be the customer support lead or the DevOps Manager.

When the request requires direct access to customer data, a Customer Lockbox request is initiated. For example, in cases where remote desktop access to a customer's virtual machine is needed. Once the Customer Lockbox request is made, it awaits customer's approval before access is granted.

These steps describe a Microsoft initiated Customer Lockbox request, for Power BI service.

1. The Azure AD Global Administrator receives a pending access request notification email from Microsoft. The admin who received the email, becomes the designated approver.

    :::image type="content" source="media/service-admin-power-bi-security-lockbox/email-example.png" alt-text="Screenshot of pending access request notification email from Microsoft." lightbox="media/service-admin-power-bi-security-lockbox/email-example.png":::

2. The email provides a link to Customer Lockbox in the Azure Administration module. Using the link, the designated approver signs in to the Azure portal to view any pending Customer Lockbox requests. The request remains in the customer queue for four days. After that, the access request automatically expires and no access is granted to Microsoft engineers.

3. To get the details of the pending request, the designated approver can select the Customer Lockbox request from the **Pending Requests** menu option.

4. After reviewing the request, the designated approver enters a justification and selects one of the options below. For auditing purposes, the actions are logged in the Customer Lockbox [logs](#logs).

    * **Approve** - Access is granted to the Microsoft engineer for a default period of eight hours.

    * **Deny** - The access request by the Microsoft engineer is rejected and no further action is taken.

    :::image type="content" source="media/service-admin-power-bi-security-lockbox/customer-lockbox-approve.png" alt-text="Screenshot of the approve and deny buttons of a pending Customer Lockbox for Microsoft Azure request." lightbox="media/service-admin-power-bi-security-lockbox/customer-lockbox-approval.png":::

## Logs

Customer Lockbox has two type of logs:

* **Activity logs** - Available from the [Azure Monitor activity log](/azure/azure-monitor/essentials/activity-log?tabs=powershell).

    The following activity logs are available for Customer Lockbox:
    * Deny Lockbox Request
    * Create Lockbox Request
    * Approve Lockbox Request
    * Lockbox Request Expiry

    To access the activity logs, in the Azure portal, select *Activity Log*. You can filter the results for specific actions.

    :::image type="content" source="media/service-admin-power-bi-security-lockbox/customer-lockbox-activity-logs-thumbnail.png" alt-text="Screenshot of the activity logs in Customer Lockbox for Microsoft Azure." lightbox="media/service-admin-power-bi-security-lockbox/customer-lockbox-activity-logs.png":::

* **Audit logs** - Available from the Microsoft Purview compliance portal. You can see the audit logs in the Power BI [admin portal](../admin/service-admin-portal-audit-logs.md).

    Customer Lockbox for Power BI has four [Power BI audit logs](./../admin/service-admin-auditing.md):

    |Audit log                             |Friendly name                               |
    |--------------------------------------|--------------------------------------------|
    |GetRefreshHistoryViaLockbox           |Get refresh history via lockbox             |
    |DeleteAdminUsageDashboardsViaLockbox  |Delete admin usage dashboards via lockbox   |
    |DeleteUsageMetricsv2PackageViaLockbox |Delete usage metrics v2 package via lockbox |
    |DeleteAdminMonitoringFolderViaLockbox |Delete admin monitoring folder via lockbox  |

## Exclusions

Customer Lockbox requests aren't triggered in the following engineering support scenarios:

* Emergency scenarios that fall outside of standard operating procedures. For example, a major service outage requires immediate attention to recover or restore services in an unexpected scenario. These events are rare and usually don't require access to customer data.

* A Microsoft engineer accesses the Azure platform as part of troubleshooting, and is accidentally exposed to customer data. For example, during troubleshooting the Azure Network Team captures a packet on a network device. Such scenarios don't usually result in access to meaningful customer data.

* External legal demands for data. For details, see [government requests for data](https://www.microsoft.com/trust-center/?rtc=1) on the Microsoft Trust Center.

## Next steps

>[!div class="nextstepaction"]
>[Microsoft Purview Customer Lockbox](/microsoft-365/compliance/customer-lockbox-requests)

>[!div class="nextstepaction"]
>[Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-purview-customer-lockbox)

>[!div class="nextstepaction"]
>[Power BI Security](service-admin-power-bi-security.md)
