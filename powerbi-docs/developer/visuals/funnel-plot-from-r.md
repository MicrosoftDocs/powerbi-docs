---
title: Building funnel plot from R script to R Visual
description: This article describes how to build a funnel plot from R script to R Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: tutorial
ms.date: 04/02/2020
---

# Funnel Plot from R script to R Visual
This article describes how to build a funnel plot using R script in R visual step by step.

We are going to use the code from the article in order to incrementally create:
1.	R-script for RStudio
2.	R-visual in Power BI
3.	R-powered Visual in Power BI (PNG-based)
4.	R-powered HTML-based Visual in Power BI


## Story about the "Funnel Plot"
This [article from The Gaurdian](https://www.theguardian.com/commentisfree/2011/oct/28/bad-science-diy-data-analysis) tells us the inspiring story about how using the wrong visualization tools can 
lead to the wrong conclusion. The real hero of this story is the funnel plot, which can be used for comparing institutional performance and medical data analysis.  

![funnel plot image](./media/funnel-plot/fp.jpg)

The funnel plot is easy to consume and interpret. The "funnel" is formed by confidence limits and shows the amount of expected variations.
The dots outside the funnel are outliers.

In [this blog ](https://onlinejournalismblog.com/2011/10/31/power-tools-for-aspiring-data-journalists-funnel-plots-in-r/) the author demonstrates the implementation of "funnel plot" in R, and we will use it as a starting point.  



Main chapters list:
* [Building R script](#building-r-script)
* [Building Power BI report from R script and dataset](#building-power-bi-report-from-r-script-and-dataset)
* [R code packaging in R-powered Visual](#r-code-packaging-in-r-powered-visual)
* [RHTML-based visual](#rhtml-based-visual)
* [Tips and Tricks](#tips-and-tricks)
* [Useful links](#useful-links)

## Building R script

The minimal R script and the accompanying data table:

[dataset.csv](./samples/funnel-plot/chapter1_R/dataset.csv)

[chapter1_R/vscript_R_v1_00.r](./samples/funnel-plot/chapter1_R/script_R_v1_00.r)

The next version of R script is essentially the same, but implements input error handling and user parameters to control the appearance of the plot: 

[chapter1_R/vscript_R_v1_01.r](./samples/funnel-plot/chapter1_R/script_R_v1_01.r)


## Building Power BI report from R script and dataset

Let us load the "dataset.csv" into Power BI desktop workspace as "Cancer Mortality" table. 
The code in ["script_R_v1_01.r"](./samples/funnel-plot/chapter1_R/script_R_v1_01.r) is almost ready to be used within R-visual. 
We only need to comment out the `read.csv` call.

The resulting R-code is: 

[chapter2_R/script_R_v2_00.r](./samples/funnel-plot/chapter2_R/script_R_v2_00.r)

See the result in: 

[Chapter2 resulting PBIX](./samples/funnel-plot/chapter2_R/funnelPlot_Rvisual.pbix)


__Remark:__ The `dataset` is hard-coded name for the input `data.frame` of any R-visual. 


## R code packaging in R-powered Visual

We are about to package R code in R-powered Visual.
Before you can get started you'll need to install the PBIVIZ tools. 
Follow the [instructions here](./custom-visual-develop-tutorial.md#installing-packages)

### Create new R-powered visual

Now we will use any command line shell (like "Command Prompt") to create new R-powered visual:

```bash
> pbiviz new funnelRvisual -t rvisual
> cd funnelRvisual
> npm install 
> pbiviz package
```

It will create funnelRvisual folder with initial template visual (`-t` stands for _template_). 
The PBIVIZ is in _"dist"_ folder. Try to import it into Power BI and see what it does. The R-code is inside _"script.r"_ file. 

* Open _"script.r"_ file for editing and replace its contents with  ["script_R_v2_00.r"](./samples/funnel-plot/chapter2_R/script_R_v2_00.r)  just as is!
* Open _"capabilities.json"_ in any editor and Find/Replace the `Values` string by `dataset` string. It replaces the name of "Role" in template to be like in R-code.  See ![before vs. after](./samples/funnel-plot/chapter3_R/funnelRvisual_v01/capabilities_changes.PNG)
* Optionally: open _"dependencies.json"_ in any editor and add one section for each R package required in your R script. This will tell Power BI to automatically import those packages when the visual is loaded for the first time. See ![before vs. after](./samples/funnel-plot/chapter3_R/funnelRvisual_v01/dependencies_changes.PNG)

Now re-package the visual again: 

`> pbiviz package`

Try to import it into Power BI again and see what it does.  
The resulting PBIX and the whole Visual Project from this section may be found in:

[Chapter 3 resulting PBIX ](./samples/funnel-plot/chapter3_R/funnelPlot_RCustomVisual.pbix)

[Chapter 3 whole R visual code](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v01/)


### R-based visual improvement

The Visual in the previous section is good to go, but it is not really user-friendly.
Because the user has to know the order of columns in the input table. 
Let us divide the input field `dataset` into 3 fields (roles): `Population`, `Number` and `Tooltips`. 

![CV01to02](./media/funnel-plot/Capture01TO02.PNG)

* Edit _"capabilities.json"_ by replacing `dataset` role by three new roles. You will need to update 2 sections: `dataRoles` and `dataViewMappings`

These sections define names, types, tooltips and maximum columns  for each input field. 
See more information [here](./capabilities.md).

The resulting file is 

[Chapter 3 resulting capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v02/capabilities.json). 

See before vs. after![before vs. after](./samples/funnel-plot/chapter3_R/funnelRvisual_v02/capabilities_before_vs_after.PNG)

* Edit _"script.r"_ to support _Population_, _Number_ and _Tooltips_ as input dataframes instead of _dataset_

The resulting file is 
[Chapter 3 resulting script.r](./samples/funnel-plot/chapter3_R/funnelRvisual_v02/script.r ).

See before vs. after ![](./samples/funnel-plot/chapter3_R/funnelRvisual_v02/script_r_before_vs_after.PNG)

To follow the changes in R-script, search for the commented blocks: 

```
#RVIZ_IN_PBI_GUIDE:BEGIN: Added to enable visual fields
...
#RVIZ_IN_PBI_GUIDE:END: Added to enable visual fields
```
 
and 

```
#RVIZ_IN_PBI_GUIDE:BEGIN: Removed to enable visual fields 
...
#RVIZ_IN_PBI_GUIDE:BEGIN: Removed to enable visual fields
```

Now re-package the visual again: 

`> pbiviz package`

Try to import it into Power BI again and see what it does.  
The resulting PBIX and the whole Visual Project may be found in:

[Chapter 3 resulting PBIX](./samples/funnel-plot/chapter3_R/funnelPlot_RCustomVisual.pbix)

[Chapter 3 whole project](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v02)


### Adding user parameters

The Visual in the previous section is almost perfect, but something is still missing. What is it?
Of course, it is user parameters. 

![CV02to03](./media/funnel-plot/Capture02TO03.PNG)


The user obviously wants to control colors and sizes of visual elements as well as some internal parameters of algorithm from the UI. 
Let's add this capability: 

* We need to edit _"capabilities.json"_ again, this time the _objects_ section. Read more about _objects_ section [here](./objects-properties.md). 

This is the place to define names, tooltips and types of each parameter. We also decide on the partition of parameters into groups (three groups in this case). 


The resulting file is

[Chapter 3 capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/capabilities.json)

See before vs. after ![](./samples/funnel-plot/chapter3_R/funnelRvisual_v03/capabilities_before_after.PNG)

* Now edit the _"src/settings.ts"_ file. 

This file is written in TypeScript.  Don't worry, it is easy to use this example as a template.  

To follow the changes in TypeScript, search for the commented blocks: 

```
//RVIZ_IN_PBI_GUIDE:BEGIN:Added to enable user parameters 
...
//RVIZ_IN_PBI_GUIDE:END:Added to enable user parameters 
```

The resulting file is 
[Chapter 3 settings.ts](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/src/settings.ts)
 

You will find two blocks of the code added. 
1. Declare new interface to hold the property value; 
1. Define a member property and default values; 

See before vs. after ![](./samples/funnel-plot/chapter3_R/funnelRvisual_v03/settings_ts_before_after.PNG)

* Now edit _"script.r"_ to support the parameters in UI, it is quite easy just by adding `if.exists` calls per user-parameter

The resulting  file is:

[Chapter 3 script.r](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/script.r)

To follow the changes in the R script, search for the commented code blocks: 

```
#RVIZ_IN_PBI_GUIDE:BEGIN:Added to enable user parameters
 ...
#RVIZ_IN_PBI_GUIDE:END:Added to enable user parameters 
 ```
 
and 

```
#RVIZ_IN_PBI_GUIDE:BEGIN:Removed to enable user parameters 
 ...
#RVIZ_IN_PBI_GUIDE:END:Removed to enable user parameters
```
See before vs. after ![](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/script_r_before_after_1.png)


Note that you may decide not to expose some of the parameters to UI, like we did.  
 

Now re-package the visual again: 

`> pbiviz package`

Try to import it into Power BI again and see what it does.  
The resulting PBIX and the whole Custom Visual project in this section may be found in:  


[Chapter 3 visual PBIX](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelPlot_RCustomVisual.pbix)

[Сhapter 3 full source code ](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/)


__Remark:__ In this tutorial we add parameters of several types (boolean, numeric, string, and color) at once. 
If you find it too complicated to follow, please have a look at [this example](https://github.com/Microsoft/PowerBI-visuals/blob/master/RVisualTutorial/PropertiesPane.md), which shows how to add a single parameter. 



## RHTML-based visual

### Convertion to RHTML visual

The resulting visual is PNG-based, and therefore not responsive to mouse hover, can not be zoomed in, and etc. 
At the last step, we will show how it can be converted to HTML-based visual.
We will create an empty R-powered HTML-based Visual template and then copy some scripts from the PNG-based visual project.

Use command line:

```bash
> pbiviz new funnelRHTMLvisual -t rhtml
> cd funnelRHTMLvisual
> npm install 
> pbiviz package
```

Explore _"capabilities.json"_ and pay attention to `"scriptOutputType": "html"`  line.

Explore _"dependencies.json"_ and pay attention to names of R-packages listed there.

Explore _"script.r"_ and pay attention to its structure. You may open and run it in RStudio. It does not use external input. 
You will find that it creates and saves _"out.html"_ file. The file will have to be self-contained (without external dependencies) and defines graphics inside HTML widget. 

To help `htmlWidgets` users we also provide R-utilities in _"r_files"_ [folder](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/r_files) to help with conversion of `plotly` or `widget` object into self-content HTML. 
Note that this version of R-powered visual supports `source` command (unlike previous types of visuals) and we will use it to make code more readable.   
 
* Replace template _"capabilities.json"_ by _"capabilities.json"_ from the previous step, but obviously keep:

`"scriptOutputType": "html"`  

The resulting file is:
[Chapter 4 funnelRHTMLvisual capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/capabilities.json)

* Merge the latest version of the _"sript.r"_ file from [Chapter 3](#r-code-packaging-in-r-powered-visual) with _"script.r"_ from the template.

What are the changes? We use _plotly_ package to convert _ggplot_ object to _plotly_ object. Next we use _htmlWidgets_ package to save it to HTML-file. 

We also move most of utility functions to [_"r_files/utils.r"_](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/r_files/utils.r) and add `generateNiceTooltips` function for cosmetics of _plotly_ object

The resulting file is
[Сhapter 4  funnelRHTMLvisual v01 script.r](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/script.r)

See before vs. after ![1](./samples/funnel-plot/chapter4_R/RHTML_v01/script_befor_after_1.PNG), ![2](./samples/funnel-plot/chapter4_R/RHTML_v01/script_befor_after_2.PNG)

To follow the changes in R-script, search for the blocks: 

```
#RVIZ_IN_PBI_GUIDE:BEGIN:Added to create HTML-based 
 ...
#RVIZ_IN_PBI_GUIDE:BEGIN:Added to create HTML-based
```

and 

```
#RVIZ_IN_PBI_GUIDE:BEGIN:Removed to create HTML-based  
...
#RVIZ_IN_PBI_GUIDE:BEGIN:Removed to create HTML-based
```


* Merge the latest version of the _"dependencies.json"_ file from [Chapter 3](#r-code-packaging-in-r-powered-visual) with _"dependencies.json"_ from the template to include new R-package dependencies.

The resulting file is 
[Chapter 4 funnelRHTMLvisual_v01 dependencies.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/dependencies.json)

* Change the script _"src/settings.ts"_ in exactly the same way as you did in [Chapter 3.3](#adding-user-parameters)

* Now re-package the visual again: 

`> pbiviz package`

Try to import it into Power BI again and see what it does.  
The resulting PBIX and the whole Visual Project may be found in:  

[Chapter 4 funnelRHTMLvisual_v01](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01)


### Bonus example

The resulting project in the previous section is bloated relative to the initial template. This is due to the incremental changes we've made during the tutorial. If we start from an empty project, it will be much less bloated. Create an empty project: 

```bash
> pbiviz new smallRHTML -t rhtml
> cd smallRHTML
> npm install 
> pbiviz package
```


Take code from this [showcase](http://www.htmlwidgets.org/showcase_networkD3.html) and make changes to it. 

The changes for the HTML-based visual are highlighted

![Highlighted changes](./media/funnel-plot/CaptureNetworkD3.PNG)

Just copy it instead of your template `script.r` and run `pbiviz package`  again.  Now you get this cool visual in your Power BI report!


### HTML widgets gallery
Dozens of visuals from this stunning [gallery](http://gallery.htmlwidgets.org/) of HTML widgets are ready to become your next visual. To make it easier, we created this single visual project: 

[chapter4_RCustomVisual/multipleRHTML](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML)

It contains __more than 20 interactive HTML visuals !!!__   

Sample of htmlWidgets1:  
<img src="https://raw.githubusercontent.com/Microsoft/PowerBI-visuals/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML/assets/CaptureSample.PNG" width="600">  

Sample of htmlWidgets2:  
<img src="https://raw.githubusercontent.com/Microsoft/PowerBI-visuals/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML/assets/CaptureSampleService.PNG"  width="600">  

Try it out in [PBIX file](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML/assets/sample.pbix). You can switch between html widgets via `Format > Settings > Type`. 

If you decide to use it as a starting point for your visual: 
1. Download the whole folder
2. Edit _script.r_ and _dependencies.json_ to keep only one widget 
3. Edit _capabilities.json_ and _settings.ts_ to remove `Type` selector
4. Change `const updateHTMLHead: boolean = true;` to `false` in _visual.ts_  (performance) 
5. Change metadata in _pbiviz.json_, particularly `"guid"` field
6. Re-package and continue the development of Visual as explained in the previous chapter. 

* Remark: Not all of the widgets in this project are supported in the service yet.

## Tips and Tricks

* We recommend that developers edit	_"pbiviz.json"_ to contain correct metadata (such as _version_, _email_, _name_, _license type_  etc.)

__IMPORTANT:__ the `"guid"` field is the unique identifier for a visual. You should create a new project for every different visual, so the GUID will be different for each visual. It will only be the same if you are copying an old project when you create a new visual, which you should not do.

* Edit [_"assets/icon.png"_](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/assets/icon.png) to create a cool, unique icon for your visual. 

* In order to be able to debug your R-code in RStudio with exactly the same data as you have in Power BI report, add the following code at the beginning of the R-script (edit `fileRda` variable):

```
#DEBUG in RStudio
fileRda = "C:/Users/yourUserName/Temp/tempData.Rda"
if(file.exists(dirname(fileRda)))
{
  if(Sys.getenv("RSTUDIO")!="")
    load(file= fileRda)
  else
    save(list = ls(all.names = TRUE), file=fileRda)
}
```

This code saves the environment from Power BI report and loads it in RStudio. 

* You do not need to develop R-powered Visuals from scratch. All the code is available in [_github_](https://github.com/Microsoft?utf8=%E2%9C%93&q=PowerBI&type=&language=R). Select the visual which is the most similar to the one you want to develop. Again, you should not copy the entire project. If you want to reuse the functionality across visuals, copy the core code across into a new project. For example, you can start from the [spline custom visual](https://github.com/Microsoft/PowerBI-visuals-spline).

* Keep in mind, that each R visual and R Visual applies the `unique` operator to the input table. To avoid the identical rows being removed, consider adding an extra input field with a unique ID and just ignore it in R code.   

* If you have Power BI account, you can use Power BI service to develop your [visual on-the-fly](/PowerBI-visuals/docs/step-by-step-lab/creating-a-custom-visual/#testing-the-custom-visual) instead of re-packaging it with `pbiviz package` command. 

*  __And finally we recommend developers to submit their R-powered visuals to the store. It's a great way to increase your brand recognition and get your work out into the public sphere.__


## Useful links

R-script showcase:
[https://community.powerbi.com/t5/R-Script-Showcase/bd-p/RVisuals](https://community.powerbi.com/t5/R-Script-Showcase/bd-p/RVisuals)

Office Store (gallery):
[https://store.office.com/en-us/appshome.aspx?ui=en-US&rs=en-US&ad=US&clickedfilter=OfficeProductFilter%3aPowerBI&productgroup=PowerBI](https://store.office.com/en-us/appshome.aspx?ui=en-US&rs=en-US&ad=US&clickedfilter=OfficeProductFilter%3aPowerBI&productgroup=PowerBI)

Visuals Documentation:
[PowerBI visuals tutorial](./custom-visual-develop-tutorial.md)

Basic tutorial on R-powered visuals:
[R visuals tutorial](/power-bi/visuals/service-r-visuals)

Develop and submit visuals to the store:
[https://powerbi.microsoft.com/en-us/documentation/powerbi-developer-office-store/](https://powerbi.microsoft.com/en-us/documentation/powerbi-developer-office-store/)