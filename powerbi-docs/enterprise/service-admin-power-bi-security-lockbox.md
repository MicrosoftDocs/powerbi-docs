---
title: Lockbox for Power BI
description: Power BI lockbox is a service that allows customers to control how Microsoft engineers access their data.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual
ms.date: 09/29/2022
LocalizationGroup: Administration
---

# Customer Lockbox for Power BI

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

Use [Customer Lockbox for Microsoft Azure](/azure/security/fundamentals/customer-lockbox-overview) to control how Microsoft engineers access your data. In this article you'll learn how to enable Customer Lockbox, and how Customer Lockbox requests are initiated, tracked, and stored for later reviews and audits.

Typically, Customer Lockbox is used when you open a support request for Power BI service. Customer Lockbox can also be used when Microsoft identifies a problem, and a Microsoft-initiated event is opened to investigate the issue.

## Requirements

To enable Customer Lockbox, you need to be a Power BI tenant admin. An Azure subscription isn't needed.

* Customer Lockbox for Power BI is available for all Power BI tenants free of charge.

* Support is included for Power BI Premium and Pro customers.

* To progress a support case, Microsoft engineers may initiate a Customer Lockbox request.

## Microsoft access request

In cases where the Microsoft engineer can't troubleshoot your issue by using standard tools, elevated permissions are requested using the [Just-In-Time (JIT)](/azure/azure-resource-manager/managed-applications/request-just-in-time-access) access service. The request can be from the original support engineer or from a different engineer as the problem may be escalated internally.

After the access request is submitted, the JIT service evaluates the request, considering factors such as:

* The scope of the resource

* Whether the requester is an isolated identity or using multi-factor authentication

* Permissions levels

Based on the JIT rule, the request may also include an approval from internal Microsoft approvers. For example, the approver might be the customer support lead or the DevOps Manager. When the request requires direct access to customer data, a Customer Lockbox request is initiated. For example, in cases where remote desktop access to a customer's virtual machine is needed. Once the request is made, it awaits customer's approval before access is granted.

These steps describe a Microsoft initiated Customer Lockbox for Power BI request.

1. The Power BI tenant admin receives a pending access request notification email from Microsoft. The admin who received the email, becomes the designated approver.

    <--- Screenshot of email --->

2. The email provides a link to Customer Lockbox in the Administration module. Using the link, the designated approver signs in to the Azure portal to view any pending Customer Lockbox requests. The request remains in the customer queue for four days. After that, the access request automatically expires and no access is granted to Microsoft engineers.

3. To get the details of the pending request, the designated approver can select the Customer Lockbox request from the **Pending Requests** menu option.

    <--- Screenshot of pending requests menu option --->

4. After reviewing the request, the designated approver enters a justification and selects one of the options below. For auditing purposes, the actions are logged in the Customer Lockbox [auditing logs](#auditing-logs).

    * **Approve** - Access is granted to the Microsoft engineer for a default period of eight hours.

    * **Deny** - The access request by the Microsoft engineer is rejected and no further action is taken.

    <--- Screenshot of approve/deny --->

## Auditing logs

Customer Lockbox logs are stored in the [Azure Monitor activity log](/azure/azure-monitor/essentials/activity-log?tabs=powershell). In the Azure portal, select **Activity Logs** to view auditing information related to Customer Lockbox requests. You can filter the results for specific actions.

<--- Screenshot of activity logs --->

## Customer Lockbox integration with Azure Security Benchmark

In [Azure Security Benchmark](/security/benchmark/azure/overview), we've introduced [baseline control 3.13](/security/benchmark/azure/security-control-identity-access-control#313-provide-microsoft-with-access-to-relevant-customer-data-during-support-scenarios) that covers Customer Lockbox applicability. Customers can use the benchmark to review Customer Lockbox applicability for their service.

## Exclusions

Customer Lockbox requests aren't triggered in the following engineering support scenarios:

* Emergency scenarios that fall outside of standard operating procedures. For example, a major service outage requires immediate attention to recover or restore services in an unexpected scenario. These events are rare and usually don't require access to customer data.

* A Microsoft engineer accesses the Azure platform as part of troubleshooting, and is accidentally exposed to customer data. For example, during troubleshooting the Azure Network Team captures a packet on a network device. Such scenarios don't usually result in access to meaningful customer data. Customers can further protect their data using in transit and at rest encryption.

* External legal demands for data. For details, see [government requests for data](https://www.microsoft.com/trust-center/?rtc=1) on the Microsoft Trust Center.

## Next steps

>[!div class="nextstepaction"]
>[Microsoft Purview Customer Lockbox](/compliance/customer-lockbox-requests?view=o365-worldwide)

>[!div class="nextstepaction"]
>[Microsoft 365 guidance for security & compliance](/office365/servicedescriptions/microsoft-365-service-descriptions/microsoft-365-tenantlevel-services-licensing-guidance/microsoft-365-security-compliance-licensing-guidance#microsoft-purview-customer-lockbox)

>[!div class="nextstepaction"]
>[Power BI Security](service-admin-power-bi-security.md)
