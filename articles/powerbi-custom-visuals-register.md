<properties
   pageTitle="Register a custom visualization"
   description="Description and process for approving and registering a custom visualization"
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
   ms.date="04/25/2017"
   ms.author="mihart"/>
# Approving and registering a custom visualization

## What is meant by *registered*?
A *registered custom visual* is one that has met a set of code requirements and has passed strict security tests.  Once a custom visual has been approved, it can be run on the server side. Registered custom visuals are supported for exporting to PowerPoint, exporting to PDF, and will display in the emails received when a user subscribes to report pages. 

##  API and code requirements
-    written in Versioned API 1.2 or higher
-    iframed
- code repository available for review (e.g., Visual Code available to us through GitHub)
- uses only public reviewable OSS components    
- Arbitrary js packages downloading & execution
-    Data exfiltration prevention
- Does not access external resources 
- Pass SDL for TSLINT scan
- Network access
-    User-input validation
-    Static analysis tools – deployed to GitHug
-    TsLint - MS SDL recommended rules + custom: 
 
-    recommend that you use EsLint – default security ruleset -- when writing your code (or do we run our own customized eslint rules against their code?)

##    Process for submitting a custom visual for approval
To submit a custom visual for approval:
1. Send an email to Power BI Custom Visuals Support (pbicvsupport@microsoft.com).  In the email, include the following information.
    a. x
    b. y
    c. z
2. -    [GitHub repository](https://github.com/Microsoft/tslint-microsoft-contrib)
3. Adhere to the requirements (see above)
4. Pass the review
5. Sign some papers
Depending on volume of submissions, the entire review process should take approximately xxxxxx weeks. 

## Custom visual code review process
The Power BI Custom Visual team will review the submission and then run customized [tslint](https://www.npmjs.com/package/tslint) to check the code. The Visual Code must pass a security review. 

If the custom visual is approved, xyz.  If the custom visual does not meet the requirements, it xyz.  The Custom Visuals team at Microsoft will notify you when your custom visual is approved and added to the registry list (below).

##    List of custom visuals that are registered

|Name  |
|---------|
|[Chiclet slicer ](https://store.office.com/chiclet-slicer-WA104380756.aspx?assetid=WA104380756&sourcecorrid=83cc564f-4d8f-40f7-85bc-5488c1309a58&searchapppos=0)    |
|Cards with states     | 
|[Timeline slicer](https://store.office.com/timeline-slicer-WA104380786.aspx?assetid=WA104380786&sourcecorrid=a21a11dd-be97-4758-879c-0d6dc56d5657&searchapppos=0)    | 
|[Dual KPI](https://store.office.com/dual-kpi-WA104380774.aspx?assetid=WA104380774&sourcecorrid=b76ac0d1-a367-46f3-bc56-677102c9b784&searchapppos=0)     | 




## Next steps

[Download and use custom visuals from the Office store](powerbi-custom-visuals-office-store.md)  
[Getting started with custom visuals developer tools (Preview)](powerbi-custom-visuals-getting-started-with-developer-tools.md)      
[Microsoft's custom visual playlist on YouTube](https://www.youtube.com/playlist?list=PL1N57mwBHtN1vIjfvuBIzZllrmKo-Vz6x)  
[Visualizations in Power BI](powerbi-service-visualizations-for-reports.md)  
[Custom Visualizations in Power BI](powerbi-custom-visuals.md)  
[Use custom visualizations in Power BI Desktop](powerbi-custom-visuals-use.md)  
[Publish custom visuals to the Office store](powerbi-developer-office-store.md)  
[Video: Creating custom visualizations for Power BI with Sachin Patney and Nico Cristache](https://www.youtube.com/watch?v=kULc2VbwjCc)  
More questions? [Try the Power BI Community](http://community.powerbi.com/)
