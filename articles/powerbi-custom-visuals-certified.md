<properties
   pageTitle="Certify a custom visualization"
   description="Description and process for approving and certifying a custom visualization"
   services="powerbi"
   documentationCenter=""
   authors="mihart"
   manager="erikre"
   backup=""
   editor=""
   tags=""
  featuredVideoId=""
  qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="05/23/2017"
   ms.author="mihart"/>

# Getting a custom visual *certified*

## What is meant by *certified*?

A *certified custom visual* is one that has met a set of code requirements and has passed strict security tests.  Once a custom visual has been certified, it can be run inside the Power BI service. Certified custom visuals are supported for [exporting to PowerPoint](powerbi-service-publish-to-powerpoint.md) and will display in the emails received when a user [subscribes to report pages](powerbi-service-subscribe-to-report.md).

- Are you a Web developer and interested in creating your own visualizations and adding them to the Gallery? See [Get started with Developer Tools](powerbi-custom-visuals-getting-started-with-developer-tools.md) and visit the [Office store](powerbi-custom-visuals-office-store.md) to learn how.

- Is there an Office store visual that you use regularly? Ask the visual developer to certify the visual with Microsoft.  The developer’s contact information is on the visual’s **Learn more** page and listed as **Provider**.

## Certification requirements

- Office Store approved    
- Custom visual is written with Versioned API 1.2 or higher    
- Code repository available for review (e.g., Visual Code available to us through GitHub)    
- Uses only public reviewable OSS components    
- Does not access external services or resources    

>**TIP**: We recommend that you use EsLint with default security ruleset, to pre-validate your code before submission.

## Process for submitting a custom visual for Certification

To submit a custom visual for certification:

1. Send an email to Power BI Custom Visuals Support (pbicvsupport@microsoft.com). In the email, include the following information:    
  - Title: Visual Certification Request    
  - Link to GitHub repository where the visual source code is hosted    
  - Adhere to the requirements (see above)    
  - Pass the code and security review    

The Custom Visuals team at Microsoft will notify you when your custom visual is certified and added to the Certified list (below), or rejected with a report of the issues that need to be fixed. It is the developer’s responsibility to maintain an open line of communication with Microsoft and to update their Certified visuals as needed.

## Removal of Power BI Certified custom visuals

Microsoft, at its discretion, may remove a visual from the Certified list.

## List of custom visuals that have been certified

|Name  |
|---------|
|[Bullet Chart](https://store.office.com/en-us/app.aspx?assetid=WA104380755&sourcecorrid=48334e83-53cf-4bc0-a022-1da4d06618b9&searchapppos=0)   |
|Card with States by OKViz - coming soon |
|[Chiclet slicer ](https://store.office.com/chiclet-slicer-WA104380756.aspx?assetid=WA104380756&sourcecorrid=83cc564f-4d8f-40f7-85bc-5488c1309a58&searchapppos=0)    |
|[Dual KPI](https://store.office.com/dual-kpi-WA104380774.aspx?assetid=WA104380774&sourcecorrid=b76ac0d1-a367-46f3-bc56-677102c9b784&searchapppos=0)     |
|KPI Status With History / KPI Indicator - coming soon   |
|Tachometer-coming soon   |
|[Timeline slicer](https://store.office.com/timeline-slicer-WA104380786.aspx?assetid=WA104380786&sourcecorrid=a21a11dd-be97-4758-879c-0d6dc56d5657&searchapppos=0)    |

## Next steps

[Download and use custom visuals from the Office store](powerbi-custom-visuals-office-store.md)  
[Getting started with custom visuals developer tools (Preview)](powerbi-custom-visuals-getting-started-with-developer-tools.md)      
[Microsoft's custom visual playlist on YouTube](https://www.youtube.com/playlist?list=PL1N57mwBHtN1vIjfvuBIzZllrmKo-Vz6x)  
[Visualizations in Power BI](powerbi-service-visualizations-for-reports.md)  
[Custom Visualizations in Power BI](powerbi-custom-visuals.md)  
[Use custom visualizations in Power BI Desktop](powerbi-custom-visuals-use.md)  
[Publish custom visuals to the Office store](powerbi-developer-office-store.md)  

More questions? [Try asking the Power BI Community](http://community.powerbi.com/)
