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

# Power BI Lockbox

Lockbox is a service that provides customers with the capability to control how Microsoft engineers access their data. Operations such as support and troubleshooting, performed by Microsoft personnel, do not require access to customer data. However, in rare circumstances where such access is required, Customer Lockbox for Power BI provides an interface for customers to review and approve or reject customer data access requests. Use lockbox when you need a Microsoft engineer to access customer data, whether in response to a customer initiated support ticket or a problem identified by Microsoft.

This article covers how to enable Customer Lockbox and how Lockbox requests are initiated, tracked, and stored for later reviews and audits.

Important 

Customer Lockbox for Power BI is available for all Power BI tenants with no additional cost. support is included for power BI pro customers. 

Customer Lockbox requests are initiated by a Microsoft engineer if this action is needed to progress a support case. 

Customer Lockbox for Power BI is in General Available today.  

 

Enable Customer Lockbox 

Power BI tenant admin can login to Azure portal using Azure AD account and enable Customer Lockbox from the Administration module in the Customer Lockbox blade. 

Please note no Azure subscription is required here. If customers do have Azure subscription, the Customer Lockbox configuration will apply to both Power BI and Azure resources supported by Customer Lockbox.  

Workflow 

The following steps outline a typical workflow for a Customer Lockbox request. 

Your organization has an issue with Microsoft Power BI service and opens a support request with Microsoft Support. Alternatively, Microsoft proactively identifies a problem (for example, a proactive notification is triggered), and a Microsoft-initiated event is opened to investigate and mitigate or fix the root cause. 

A Microsoft Engineer reviews the service request and determines the next steps to resolve the issue. 

If the Microsoft engineer can't troubleshoot the issue by using standard tools and service generated data, the next step is to request elevated permissions by using a Just-In-Time (JIT) access service. This request can be from the original support engineer or from a different engineer because the problem is escalated internally. 

After the access request is submitted by the Microsoft Engineer, Just-In-Time service evaluates the request considering factors such as: 

The scope of the resource 

Whether the requester is an isolated identity or using multi-factor authentication 

Permissions levels 

Based on the JIT rule, this request may also include an approval from Internal Microsoft Approvers. For example, the approver might be the Customer support lead or the DevOps Manager. 

When the request requires direct access to customer data, a Customer Lockbox request is initiated. For example, remote desktop access to a customer's virtual machine. 

The request is now in a Customer Notified state, waiting for the customer's approval before granting access. 

At the customer organization, Power BI tenant admin receives an email from Microsoft, to notify them about the pending access request. For Customer Lockbox requests, this person is the designated approver. 

Example email: 

ShapeTable

Description automatically generated 

The email notification provides a link to the Customer Lockbox blade in the Administration module. Using this link, the designated approver signs in to the Azure portal to view any pending requests that their organization has for Customer Lockbox. 

The request remains in the customer queue for four days. After this time, the access request automatically expires and no access is granted to Microsoft engineers. 

ShapeTo get the details of the pending request, the designated approver can select the lockbox request from Pending Requests: 

Graphical user interface, text, application, email

Description automatically generated 

After reviewing the request, the designated approver enters the justification and selects Approve or Deny: 

Graphical user interface, application

Description automatically generated 

As a result of the selection: 

Approve: Access is granted to the Microsoft engineer. The access is granted for a default period of eight hours. 

Deny: The elevated access request by the Microsoft engineer is rejected and no further action is taken. 

For auditing purposes, the actions taken in this workflow are logged in Customer Lockbox request logs. 

Auditing logs 

Customer Lockbox logs are stored in activity logs. In the Azure portal, select Activity Logs to view auditing information related to Customer Lockbox requests. You can filter for specific actions, such as: 

Deny Lockbox Request 

Create Lockbox Request 

Approve Lockbox Request 

Lockbox Request Expiry 

As an example: 

Azure Customer Lockbox - activity logs 

Customer Lockbox integration with Azure Security Benchmark 

We've introduced a new baseline control (3.13) in Azure Security Benchmark that covers Customer Lockbox applicability. Customers can now leverage the benchmark to review Customer Lockbox applicability for a service. 

Exclusions 

Customer Lockbox requests are not triggered in the following engineering support scenarios: 

Emergency scenarios that fall outside of standard operating procedures. For example, a major service outage requires immediate attention to recover or restore services in an unexpected or unpredictable scenario. These “break glass” events are rare and, in most instances, do not require any access to customer data to resolve. 

A Microsoft engineer accesses the Azure platform as part of troubleshooting and is inadvertently exposed to customer data. For example, the Azure Network Team performs troubleshooting that results in a packet capture on a network device. It is rare that such scenarios would result in access to meaningful quantities of customer data. Customers can further protect their data through use of in transit and at rest encryption. 

Customer Lockbox requests are also not triggered by external legal demands for data. For details, see the discussion of government requests for data on the Microsoft Trust Center. 

 ## Next steps
