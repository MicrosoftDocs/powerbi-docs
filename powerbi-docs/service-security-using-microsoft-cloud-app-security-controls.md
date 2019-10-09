---
title: Using Microsoft cloud app security controls in Power BI
description: Learn how to apply data sensitivity labels in Power BI
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 10/24/2019
ms.author: davidi

LocalizationGroup: Data from files
---
# Using Microsoft cloud app security controls in Power BI (preview)

Using Microsoft Cloud App Security with Power BI, you can help protect your Power BI reports, data, and services from unintended leaks or breaches. With Cloud App Security, you set real-time conditional access controls and conditions to data in your organization, using settings in Azure Active Directory (Azure AD), that help to ensure your Power BI analytics are secure. Once set, administrators can monitor user access and activity, perform real-time risk analysis, and set label-specific controls. 

![Using Microsoft cloud app security controls pane](media/service-security-using-microsoft-cloud-app-security-controls/cloud-app-security-controls-01.png)

You can configure Microsoft Cloud App Security for all sorts of apps and services, not only Power BI. Cloud App Security is a Microsoft service that protects apps and devices, and is managed through its own dashboard. You’ll need to configure Cloud App Security to work with Power BI to benefit from Cloud App Security protections for your Power BI data and analytics. For more information about Cloud App Security, including an overview of how it works, the dashboard, and app risk scores, see [Microsoft Cloud App Security](https://docs.microsoft.com/cloud-app-security/) documentation.

## Requirements for using Microsoft Cloud App Security with Power BI

To use Microsoft Cloud App Security with Power BI, you must use and configure relevant Microsoft security services, some of which are set outside Power BI. The following list describes the necessary steps:

1.	Your organization must be using Microsoft Information Protection (MIP) sensitivity labels for the Power BI tenant.
2.	Set conditional access app control for your featured apps.
3.	Set policies for Power BI in your AAD configuration
4.	Set relevant detections in Microsoft Cloud App Security to monitor Power BI activities

The following sections describe each of the necessary steps in order.


### Use MIP sensitivity labels

Sensitivity labels enable you to classify and help protect sensitive content, so that people in your organization can collaborate with partners outside your organization, yet still be careful and aware of sensitive content and data. 

You can read the article on [Sensitivity Labels in Power BI](service-security-enable-data-sensitivity-labels.md), which goes into detail about the process of using sensitivity labels for Power BI.

### Set conditional access app controls
The steps necessary to set session controls are completed in the Azure AD and Microsoft Cloud App Security portals. In the Azure AD portal, you create a conditional access policy for Power BI, and route sessions used in Power BI through the Microsoft Cloud App Security service. 

Microsoft Cloud App Security operates using a reverse-proxy architecture, and is integrated with Azure AD conditional access to monitor Power BI user activity in real-time. The following steps are provided here to help you understand the process, and detailed step-by-step instructions are provided in the linked content in each of the following steps. You can also read this [Cloud App Security article](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad) that describes the process in whole.

1.	[Create an Azure AD conditional access test policy](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad#add-azure-ad)
2.	[Sign into each app using a user scoped to the policy](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad#sign-in-scoped)
3.	[Configure advanced controls for the Power BI app in the Cloud App Security portal](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad#step-3-configure-advanced-controls-and-any-apps-in-the-cloud-app-security-portal)
4.	[Test the deployment](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad#step-4-test-the-deployment)

### Set session policies for Power BI in Azure Active Directory

The next step is to set session policies for Power BI in the Microsoft Cloud App Security portal. With session policies, you allow users to access and use Power BI, yet protect your organization by setting granular control over certain session activities. Examples include allowing access from unmanaged devices, or from specific locations, and so on. 

The process for setting session policies is described in detail in the [Session policies](https://docs.microsoft.com/cloud-app-security/session-policy-aad) article. 

### Set detections to monitor Power BI activities
The last step in configuring the requirements to use Microsoft Cloud App Security in Power BI is to set the detections you want to monitor, which is configured in the Azure AD portal. The next section describes supported Cloud App Security detections for Power BI.

## Supported Microsoft Cloud App Security detections for Power BI

Microsoft Cloud App Security detections enable administrators to monitor specific activities of a monitored app. For Power BI, there are currently two dedicated Cloud App Security detections. 

* **Suspicious share** – detects when a user shares a sensitive report with an unfamiliar (external to the organization) email. A sensitive report is a report that has a sensitivity label that’s set to [internal only] or higher. 

* **Mass share of reports** – detects when a user shares many different reports in a single session.
Settings for these detections are configured in the Cloud App Security portal. 


## Considerations and Limitations 
Using Cloud App Security with Power BI is designed to help secure your organization’s content and data, with detections that monitor user sessions and their activities. When using Cloud App Security with Power BI, there are a few limitations you should keep in mind:

* Microsoft Cloud App Security can only operate on Excel, PowerPoint, and PDF files.

* The *content inspection* policy on Microsoft Cloud App Security is currently not available in Power BI when applying an Excel file policy, so please don’t set this policy for Power BI. This is expected to operate properly when Cloud App Security for Power BI is generally available.


## Next Steps
This article described how Microsoft Cloud App Security can provide data and content protections for Power BI. You might also be interested in the following articles, which describe Data Protection for Power BI, and supporting content for the Azure services that enable it.

* [Overview of data protection in Power BI](service-security-data-protection-overview.md)
* [Enable data sensitivity labels in Power BI](service-security-enable-data-sensitivity-labels.md)
* [Apply data sensitivity labels in Power BI](service-security-apply-data-sensitivity-labels.md)

You might also be interested in the following Azure and security articles:

* [Protect apps with Microsoft Cloud App Security Conditional Access App Control](https://docs.microsoft.com/cloud-app-security/proxy-intro-aad)
* [Deploy Conditional Access App Control for featured apps](https://docs.microsoft.com/cloud-app-security/proxy-deployment-aad)
* [Session policies](https://docs.microsoft.com/cloud-app-security/session-policy-aad)
* [Overview of sensitivity labels](https://docs.microsoft.com/microsoft-365/compliance/sensitivity-labels)
