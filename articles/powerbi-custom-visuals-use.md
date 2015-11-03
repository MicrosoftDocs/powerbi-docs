<properties
   pageTitle="Use a custom visual"
   description="Use a custom visual"
   services="powerbi"
   documentationCenter=""
   authors="jastru"
   manager="mblythe"
   editor=""
   tags=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="10/27/2015"
   ms.author="v-jastru"/>

# Use a custom visual  
[← Knowledge Base](https://support.powerbi.com/knowledgebase)

Power BI supports new custom visualization types which help you see data in new, delightful ways. A custom visual can be added to the **Visualization** pane alongside other Power BI visuals.

>**Warning**  
If the custom visual is created by someone else, you will need to review the custom visual for security and privacy. See [Review custom visuals for security and privacy](https://support.powerbi.com/knowledgebase/articles/750219).

It's easy to use a custom visual in a Power BI report: you import a .pbiviz file into the **Visualization** pane.

You can get a pbiviz file by downloading a custom visual from the Power BI visuals gallery, or exporting a custom visual.

-   Download a custom visuals, see [Download a custom visual from the gallery](https://support.powerbi.com/knowledgebase/articles/752736).
-   Export a custom visual, see  [Export a custom visual](https://support.powerbi.com/knowledgebase/articles/722121#export) in Get started with **Developer Tools** ﻿if you are interested in authoring custom visuals.

Once you have a .pbiviz custom visual, here's how to use a custom visual:  
-   [Power BI Desktop](https://support.powerbi.com/knowledgebase/articles/750216#desktop)
-   [Power BI Service](https://support.powerbi.com/knowledgebase/articles/750216#service)

## Power BI Desktop  
1.  Create a new report or edit an existing report.
2.  There are two options to import a custom visual: from File menu or from Visualization pane.

**From Desktop File menu**  
1.  On the report **File** menu, choose **Import** &gt; **Power BI Custom Visual**. You must be in the editing view.  
![](media/powerbi-custom-visuals-use/InsertFile.png)

**From Visualization pane**  
1.  In the **Visualizations** pane, choose **Insert (…)**.  
![](media/powerbi-custom-visuals-use/InsertPane.png)  

>**Note:**  
>A custom visual is added to a specific report when imported. If you'd like to use the visual in another report, you need to import it into that report. When a report with a custom visual is saved using the **Save As** option, a copy of the custom visual is saved with the new report.

**Review the warning**. A custom visual has access to the data in the report you use in the custom visual, and can perform actions on your behalf. If you share the report with others, when they view the report the custom visual can do the same, but for your co-workers. Take care to review the custom visual to ensure it comes from a trustworthy source. Microsoft recommends you work with your IT department if you're not sure whether to use a specific Custom Visual you obtained from the Power BI visuals gallery, through email, or from some other source.  
![](media/powerbi-custom-visuals-use/caution.png)

3. Select a .pbiviz file in the **File Open** dialog.

4. You will see the custom visual added to the visualizations available for your use.  
![](media/powerbi-custom-visuals-use/VisualUse.png)

## See also:

[Visualizations in Power BI](powerbi-service-visualizations-for-reports.md)

[Custom Visualizations in Power BI](powerbi-custom-visuals.md)

[The Power BI custom visuals gallery](https://app.powerbi.com/visuals)
