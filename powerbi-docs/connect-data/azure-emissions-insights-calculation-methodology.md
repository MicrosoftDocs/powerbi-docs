---
title: Azure Emissions Calculation Methodology
description: "Learn how Microsoft calculates scope 1, 2, and 3 carbon emissions for Azure cloud services. Understand the Greenhouse Gas Protocol methodology and emission sources."
author: julcsc
ms.author: juliacawthra
ms.reviewer: lsuresh, mamaza
ms.service: powerbi
ms.subservice: powerbi-template-apps
ms.topic: how-to
ms.date: 10/24/2025
ai-usage: ai-assisted
---

# Azure emissions calculation methodology

Microsoft's Azure emissions calculation methodology determines the carbon emissions from Azure and Microsoft 365 cloud computing resources. This methodology covers scope 1, 2, and 3 carbon emissions calculated from the manufacture, packaging, transportation, use, and end-of-life phases of data center hardware in all Microsoft-owned and leased data centers. The emissions and usage measured by this methodology are for Microsoft's Azure and Microsoft 365 cloud only. The Microsoft 365 methodology is limited to emissions associated with using the following products:

- Microsoft Exchange Online
- Microsoft SharePoint
- Microsoft OneDrive
- Microsoft Teams
- Microsoft Word
- Microsoft Excel
- Microsoft PowerPoint
- Microsoft Outlook 

> [!NOTE]
> Carbon accounting practices are evolving rapidly. We're committed to evolving, revising, and refining our methodologies over time to incorporate science-based, validated approaches as they become available and relevant to assessing the carbon emissions associated with the Azure cloud.  

The following image shows examples of scope 1, 2, and 3 carbon emission types in the Microsoft cloud value chain.

:::image type="content" source="./media/azure-emissions-calculation-methodology/api-scope-valuechain.png" alt-text="Screenshot of carbon emission types in Microsoft cloud value chain.":::

## Standards used for calculation

At Microsoft, we segment our greenhouse gas (GHG) emissions into three categories consistent with the [Greenhouse Gas Protocol](https://ghgprotocol.org/), which is a globally recognized standard for the calculation methodology and reporting of Greenhouse Gas (GHG) emissions:

- **Scope 1**: Direct emissions – Emissions from stationary and mobile combustion, as well as process and fugitive emissions.
- **Scope 2**: Indirect emissions - Emissions from the consumption of electricity, heat, or steam.
- **Scope 3**: Other indirect emissions – Manufacturing phase and end-of-life emissions (supply chain related). The scope of this tool is scope 3 categories 1, 2, 4, 5, 9, and 12.

The API calculations are the result of a life cycle evaluation. This evaluation assessed energy use for cloud computing operations and carbon emissions related to the following activities for Azure and Microsoft 365:

- Manufacturing phase raw materials extraction
- Component aggregation
- End of management of materials

The following image shows carbon accounting scopes by stakeholder:

:::image type="content" source="./media/azure-emissions-calculation-methodology/api-stakeholder-scope.png" alt-text="Screenshot of carbon scopes by stakeholder.":::

## Included emission sources

GHG emissions are classified into scope 1, 2, and 3 emissions based on the level of control that an organization has over the sources of those emissions.

### Scope 1

GHG emissions include emissions from the combustion of diesel fuel and fugitive emissions from the use of refrigerants for cooling of our data centers. Our scope 1 emissions are small compared to our scope 2 emissions, so we combine them for reporting purposes.  

### Scope 2

GHG emissions include emissions from direct power consumption used to power global data centers that Microsoft leases and owns. We invest in renewable energy power purchase agreements (PPAs) globally. We plan to be powered by 100% renewable energy and eliminate fossil fuels from backup power by 2025.

### Scope 3

GHG emissions include emissions from the following activities for hardware devices. The devices include servers and network equipment used in our leased and owned data centers.

- Raw material extraction
- Select component aggregation
- End-of-life management (for example, recycling, landfill, or composting)

This tool includes the emissions from the raw material extraction of the different parts and components that make up the hardware devices and their packaging. It uses material composition and emissions resulting from product life cycle stages.

By their nature, scope 1, 2, and 3 emissions are all relative to the reporting entity; one company's scope 1 emissions are another's scope 3 emissions. This tool reflects Microsoft's combined scope 1, 2, and 3 emissions associated with the delivery of Azure and Microsoft 365 core cloud services. These emissions reflect a customer's scope 3 emissions from the customer's use of Microsoft cloud services.

## Calculation methodology

As previously stated, Microsoft bases its calculation methodology on principles from the Greenhouse Gas Protocol.  

### Calculation methodology for scope 1 and 2

Power usage for scope 1 and 2 Azure emissions categories includes storage, compute, or network. Usage time in these categories helps us attribute scope 1 and 2 emissions.

The full methodology for scopes 1 and 2 is based on a life cycle evaluation conducted for a 2018 Microsoft study, [The carbon benefits of cloud computing: A study on the Microsoft Cloud in partnership with WSP](https://download.microsoft.com/download/7/3/9/739BC4AD-A855-436E-961D-9C95EB51DAF9/Microsoft_Cloud_Carbon_Study_2018.pdf).

The scope 2 methodology calculates the energy and carbon impacts for each data center over time. It takes into consideration the following factors:

- Data center and server efficiency
- Grid emission factors
- Renewable energy purchases
- Infrastructure power usage

### Calculation methodology for scope 3

The following image summarizes calculation of scope 3 emissions. It shows the scope 3 emissions allocation methodology.

:::image type="content" source="./media/azure-emissions-calculation-methodology/api-lifecycle.png" alt-text="Screenshot of scope 3 emissions allocation methodology showing lifecycle evaluation process.":::

We start with the life cycle evaluation of materials used in our data center infrastructure and calculate carbon emissions by data center. We then segment this sum based on customer usage of each data center.

This methodology for scope 3 emissions calculates the energy and carbon impacts for each data center over time, using the following items:

- Most common materials used to manufacture the IT infrastructure in our data centers
- Most common parts that make up cloud infrastructure (hard disks, FPGA, steel racks)
- Complete inventory of all the assets (as categorized by Microsoft bill of materials) in our data centers by region
- Carbon factors for cloud infrastructure across life stages (raw material extraction, component aggregation, usage, and end-of-life disposal)

### Calculation variables

- The equipment lifetime defaults to six years.
- The methodology doesn't currently include critical infrastructure, such as the data center facility, but might add it as data becomes available.
- The Microsoft 365 methodology uses proxy usage measures instead of true server-side compute and storage usage to apportion total carbon emissions. It might replace these measures as data becomes available.

The white paper [A new approach for Scope 3 emissions transparency](https://go.microsoft.com/fwlink/p/?linkid=2161861) includes validation of our methodology.

### Customer attributions and calculations for carbon emissions

For Azure customers, the methodology allocates emissions based on their relative Azure usage in a given datacenter region. An algorithm calculates a usage factor that provides emissions per unit of customer usage in a specific Azure data center region. The algorithm then uses this factor to directly calculate emissions. The scope 3 emissions allocation methodology image earlier in this article shows this process of attribution graphically.

This step computes emissions for Microsoft 365 commercial applications in each data center region. The methodology apportions these emissions values across customers based on proxies for server-side resource consumption, including active usage and data storage in the included Microsoft 365 applications. It computes a *regional usage factor* for each customer in each data center region that represents their usage relative to other customers. The methodology then uses this factor to directly calculate emissions. The methodology uses proxy usage measures instead of true server-side compute and storage, and might replace these measures as data becomes available.

This methodology of segmentation by customer usage is consistent across scope 1, 2, and 3 carbon calculation.

### Excluded regions

The methodology doesn't include some regions in the emissions calculations, including data centers that Microsoft doesn't own. The following table shows the excluded regions.

| Geography | Datacenter region |
| --- | --- |
| Azure Government | US DoD Central </br> US DoD East </br> US Gov Arizona </br> US Gov Texas </br> US Gov Virginia </br> US Sec East </br> US Sec West </br> US Sec West Central </br> |
| China | China East </br> China East 2 </br> China East 3 </br> China North </br> China North 2 </br> China North 3 |
| Germany | Germany Central (Sovereign) </br> Germany Northeast (Sovereign) |

## FAQ

### How does Microsoft calculate usage?

Microsoft calculates usage by adding up your company's compute, storage, and data transfer in the Microsoft cloud. Usage for emissions calculations might not match your Microsoft usage for billing purposes.

### What unit does Microsoft use to measure carbon emissions?

Microsoft uses metric tons of carbon dioxide equivalent (MTCO<sub>2</sub>E).
