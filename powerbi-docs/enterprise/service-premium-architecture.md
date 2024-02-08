---
title: Power BI Premium architecture
description: Understand the Power BI Premium architecture.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: conceptual
ms.date: 11/29/2022
LocalizationGroup: Premium
---
# Power BI Premium architecture

Architectural changes in Premium, especially around how CPU resources are allocated and used, enables more versatility in offerings, and more flexibility in licensing models. For example, the new architecture enables offering Premium on a per-user basis, offered as [Premium Per User](service-premium-per-user-faq.yml). The architecture also provides customers with better performance, and better governance and control over their Power BI expenses.

The most significant update in the architecture of Premium is the way capacities' v-cores are implemented:

In the original version of Power BI Premium, v-cores were reserved physical computing nodes in the cloud, with differences in the number of v-cores and the amount of onboard memory according to the customer's licensing SKU. Customer administrators were required to keep track of how busy these nodes were, using the *Premium metrics app*. They had to use the app and other tools to determine how much capacity their users required to meet their computing needs.

In Premium, v-cores are implemented on regional clusters of physical nodes in the cloud, which are shared by all tenants using Premium capacities in that Power BI region. The regional cluster is further divided into specialized groups of nodes, where each group handles a different Power BI workload (semantic models, dataflows, or paginated reports). These specialized groups of nodes help avoid resource contention between fundamentally different workloads running on the same node.

>[!NOTE]
>Power BI Premium provides logical segregation of data between different customers, and is compliant with ISO 27017. For more details see [ISO/IEC 27017:2015](/azure/compliance/offerings/offering-iso-27017).

Administrators have the ability to [tweak and configure workload settings](service-admin-premium-workloads.md) for their capacity. This can be used to reduce resource contention between workloads (semantic models, dataflows, paginated reports, and AI), and adjust other settings such as memory limits and timeouts based on the capacity usage patterns.

The contents of workspaces assigned to a Premium capacity is stored on your organizations capacity's storage layer, which is implemented on top of capacity-specific Azure storage blob containers, similar to the original version of Premium. This approach enables features like BYOK to be used for your data.

When the content needs to be viewed or refreshed, it is read from the storage layer and placed on a Premium node for computing. Power BI uses a placement mechanism that assures the optimal node is chosen within the proper group of computing nodes. The mechanism typically places new content on the node with the most available memory at the time the content is loaded, so that the view or refresh operation can gain access to the most resources and can perform optimally.

As your capacity renders and refreshes more content, it uses more computation nodes, each with enough resources to complete operations fast and successfully. This means your capacity may use multiple computational nodes and in some cases, content might even move between nodes due to the Power BI service performing internal load-balancing across nodes or resources. When such load balancing occurs, Power BI makes sure content movement doesn't impact end-user experiences.

There are several positive outcomes from distributing the processing of content (semantic models, dataflows, paginated reports and other workloads) across multiple nodes.

* The shared nodes are at least as large as an original Premium P3 node, which means there are more v-cores to perform any operations, which can increase performance by up to 16x when comparing to an original Premium P1.

* Whatever node your processing lands on, the placement mechanism makes sure memory remains available for your operation to complete, within the applicable memory constraints of your capacity. (see limitations section of this doc for full detail of memory constraints)

* Cross-workloads resource contention is prevented by separating the shared nodes into specialized workload groups. As a result of this separation, there are no controls for paginated report workloads.

* The limitations on different capacity SKUs are not based on the physical constraints as they were in the original version of Premium; rather, they are based on an expected and clear set of rules that the Power BI Premium service enforces:

    * Total capacity CPU throughput is at or below the throughput possible with the v-cores your purchased capacity has.

    * Memory consumption required for viewing and refresh operations remains within the memory limits of your purchased capacity.

* Because of this new architecture, customer admins do not need to monitor their capacities for signs of approaching the limits of their resources, and instead are provided with clear indication when such limits are met. This significantly reduces the effort and overhead required of capacity administrators to maintain optimal capacity performance.

## Related content

>[!div class="nextstepaction"]
>[What is Power BI Premium?](service-premium-what-is.md)

>[!div class="nextstepaction"]
>[Premium capacity load evaluation](service-premium-concepts.md)

>[!div class="nextstepaction"]
>[Using Autoscale with Power BI Premium](service-premium-auto-scale.md)

>[!div class="nextstepaction"]
>[Power BI Premium FAQ](service-premium-faq.yml)

>[!div class="nextstepaction"]
>[Power BI Premium Per User FAQ](service-premium-per-user-faq.yml)

>[!div class="nextstepaction"]
>[Add or change Azure subscription administrators](/azure/cost-management-billing/manage/add-change-subscription-administrator)

More questions? [Try asking the Power BI Community](https://community.powerbi.com/).
