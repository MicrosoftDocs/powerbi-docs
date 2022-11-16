---
title: Power BI operated by 21Vianet in China
description: Provides information about the Power BI service operated by 21Vianet in China, including feature parity details
author: davidiseminger
ms.author: davidi
ms.service: powerbi
ms.subservice: powerbi-admin
ms.topic: conceptual 
ms.date: 11/25/2022
ms.custom: 
---

# Power BI - operated by 21Vianet in China

Microsoft Power BI service operated by 21Vianet is designed to comply with regulatory requirements in China. The services are a physically separated environment of cloud services operated and transacted currently by a local operator, Shanghai Blue Cloud Technology Co., Ltd (“21Vianet”). This operator is a wholly owned subsidiary of Beijing 21Vianet Broadband Data Center Co., Ltd. located in mainland China.


## Power BI feature availability

To accommodate the requirements of regional cloud customers, Power BI operated by 21Vianet plans differ from commercial plans in some respects. We attempt to make features available within 30 days of general availability. However in some cases, underlying dependencies prevent a feature from being available.

The following table lists features of Power BI that aren't yet available in the Power BI operated by 21Vianet environment or that are available with limited functionality. 

|Product area | Feature or scenario | Commercial cloud status | 21Vianet availability | More information |
|----|----|----|----|----|
|Power BI | Cross-cloud B2B collaboration | Public preview | Public preview | General availability expected in the first half of 2023. Read more about this functionality in [Cross-tenant access overview](/azure/active-directory/external-identities/cross-tenant-access-overview#microsoft-cloud-settings). |
|Power BI | Data protection - Microsoft Cloud App Security (MCAS) integration |Generally available | Not available | MCAS is dependent on E5 licensing. Read more about data protection for Power BI in [Using Microsoft Defender for Cloud Apps controls in Power BI](service-security-using-defender-for-cloud-apps-controls.md) |
|Power BI | Using Azure ExpressRoute to integrate an on-premises gateway | Generally available | Not available | [Azure ExpressRoute for Office 365](/microsoft-365/enterprise/azure-expressroute) isn't supported for 21Vianet.) |
|Power BI | Template app marketplace | Generally available | Not available | AppSource isn't available in China. |
| Power BI | Data source support | Generally available | Generally available |  |
| Power BI | Datamart | Public preview | Not available | Roadmap for China to be announced after feature becomes generally available. |
| Power BI and Office | Teams - embed interactive Power BI report | Generally available | Not available | Roadmap for 21Vianet is pending.|
| Power BI and Office | Excel - embed interactive Power BI report | Generally available | Generally available | |
|Power BI and Office | PowerPoint - embed live data | Public preview | Not available | Feature availability is dependent on Office add-in readiness in China. |
|Power BI and Office | SharePoint - embed interactive report | Generally available | Generally available | |
|Power BI and Office | Visio - include Visio diagrams in Power BI reports using the Visio visual for Power BI | Generally available | General availability | |
|Power BI and Office | Microsoft Purview Information Protection | Generally available | Generally available | Learn more about this feature in [Sensitivity label overview](service-security-sensitivity-label-overview.md) |
|Power BI and Power Platform | Power Apps - enable Power BI visualization embedding | Generally available | Generally available | |
|Power BI and Power Platform | Power Automate visual for Power BI | Public preview | Public preview | |
|Power BI and gateways | Manage gateway user interface | Public preview | Public preview |  |
|Power BI and gateways | Manage user permission for gateway | Public preview | Public preview |  |


## Next steps

To learn more about Power BI operated by 21Vianet in China, see the following resources:

- [Azure China 21Vianet](/azure/china/china-welcome)
- [Support site for 21Vianet (in Chinese)](https://www.21vbluecloud.com/Dynamics365/)
- [Power BI for US government customers](service-govus-overview.md)