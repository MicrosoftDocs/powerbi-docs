---
title: Build a funnel plot from R script to R visual
description: This article describes how to build a funnel plot from R script to R Power BI visual.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: tutorial
ms.date: 04/02/2020
---

# Tutorial: Build a funnel plot from R script to R visual
This article describes how to build a funnel plot using R script in R visual step by step.

The funnel plot an easy way to consume, interpret, and show the amount of expected variation. The "funnel" is formed with confidence limits and outliers are represented by the dots outside the funnel.

![funnel plot image](./media/funnel-plot/fp.jpg)

This example is based on the [inspiring story](https://www.theguardian.com/commentisfree/2011/oct/28/bad-science-diy-data-analysis) about how using the wrong visualization tools can lead to the wrong conclusion. The hero of this story is the funnel plot, which is used to compare and analyze institutional performance and medical data.  

For more information, see [this blog ](https://onlinejournalismblog.com/2011/10/31/power-tools-for-aspiring-data-journalists-funnel-plots-in-r/) to further demonstrate an implementation of a "funnel plot" in R.

In this article, you learn how to create:

> [!div class="checklist"]
>
> * an R-script for RStudio
> * an R-visual in Power BI
> * a *PNG-based* R-powered Visual in Power BI
> * a *HTML-based* R-powered Visual in Power BI

## Build an R script with dataset

1. Start with a [minimal R script](./samples/funnel-plot/chapter1_R/script_R_v1_00.r) and its accompanying data table, [dataset.csv](./samples/funnel-plot/chapter1_R/dataset.csv).

1. Next, edit the script to look like [this script](./samples/funnel-plot/chapter1_R/script_R_v1_01.r). This step adds input error handling and user parameters to control the plot's appearance.

## Build a report

Edit the script to look like [this script](./samples/funnel-plot/chapter2_R/script_R_v2_00.r). This step loads *dataset.csv* instead of *read.csv* into the Power BI desktop workspace and creates the **Cancer Mortality** table. This results with the following [PBIX file](./samples/funnel-plot/chapter2_R/funnelPlot_Rvisual.pbix).

> [!NOTE]
> The `dataset` is a hard-coded name for the input `data.frame` of any R-visual. 

## Create an R-powered visual and package in R code

1. Before you begin this step, be sure to [install PBIVIZ tools](./custom-visual-develop-tutorial.md#installing-packages).

1. Run the following command to create a new R-powered visual:

   ```bash
   pbiviz new funnelRvisual -t rvisual
   cd funnelRvisual
   npm install 
   pbiviz package
   ```

   This command creates the folder *funnelRvisual* with initial template visual (`-t` stands for **template**). The PBIVIZ is in the *dist* folder and the R-code is inside *script.r* file. Try to import it into Power BI and see what it does.

1. Open the *script.r* file and replace its contents with your script.

1. Open *capabilities.json* and replace the string `Values` with `dataset`. This replaces the name of "Role" in the template to be like in R-code.

   ![before vs. after](./samples/funnel-plot/chapter3_R/funnelRvisual_v01/capabilities_changes.PNG)

1. *(optional)* Open *dependencies.json* and add a section for each R package required by your R script. This tells Power BI to automatically import these packages when the visual is loaded for the first time.

   ![before vs. after](./samples/funnel-plot/chapter3_R/funnelRvisual_v01/dependencies_changes.PNG)

1. Re-package the visual using the command `pbiviz package`, then try to import it into Power BI and see what it does.

To download the above files, see [PBIX](./samples/funnel-plot/chapter3_R/funnelPlot_RCustomVisual.pbix) and the entire [Visual Project](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v01/).

## Make R-based visual improvements

The visual is not yet user-friendly because the user has to know the order of columns in the input table.

1. Divide the input field `dataset` into 3 fields (roles): `Population`, `Number` and `Tooltips`

   ![CV01to02](./media/funnel-plot/Capture01TO02.PNG)

1. Edit *capabilities.json* by replacing the `dataset` role with the three new roles. You'll need to update sections: `dataRoles` and `dataViewMappings`, these sections define names, types, tooltips and maximum columns for each input field. 
   
   Download the resulting [capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v02/capabilities.json) and see [capabilities](./capabilities.md) for more information.

1. Edit *script.r* to support `Population`, `Number` and `Tooltips` as input dataframes instead of `dataset`, or download the resulting [script.r](./samples/funnel-plot/chapter3_R/funnelRvisual_v02/script.r).

   > [!NOTE]
   > To follow the changes in R-script, search for the commented blocks: 
   > 
   > ```r
   > #RVIZ_IN_PBI_GUIDE:BEGIN: Added to enable visual fields
   > ...
   > #RVIZ_IN_PBI_GUIDE:END: Added to enable visual fields
   > 
   > #RVIZ_IN_PBI_GUIDE:BEGIN: Removed to enable visual fields 
   > ...
   > #RVIZ_IN_PBI_GUIDE:BEGIN: Removed to enable visual fields
   > ```

1. Re-package the visual using the command `pbiviz package`, then try to import it into Power BI and see what it does.

To download the above files, see [PBIX](./samples/funnel-plot/chapter3_R/funnelPlot_RCustomVisual.pbix) and the entire [Visual Project](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v02).

## Add user parameters

1. Add capability for the user to control colors and sizes of visual elements including internal parameters from the UI.

   ![CV02to03](./media/funnel-plot/Capture02TO03.PNG)

1. Edit *capabilities.json* and change the `objects` section. This is the place to define names, tooltips and types of each parameter. We also decide on the partition of parameters into groups (three groups in this case).

   Download the resulting [capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/capabilities.json) and see [object properties](./objects-properties.md) for more information.

   ![](./samples/funnel-plot/chapter3_R/funnelRvisual_v03/capabilities_before_after.PNG)

1. Edit *src/settings.ts* to match [this settings.ts](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/src/settings.ts). This file is written in TypeScript.  

   > [!NOTE]
   > You will find two blocks of the code added to:
   > 1. Declare new interface to hold the property value;
   > 1. Define a member property and default values

   ![](./samples/funnel-plot/chapter3_R/funnelRvisual_v03/settings_ts_before_after.PNG)

1. Edit *script.r* to match [this script.r](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/script.r). This adds support for the parameters in the UI by adding `if.exists` calls per user-parameter.

   > [!NOTE]
   > To follow the changes in R-script, search for the commented blocks:
   >
   > ```r
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Added to enable user parameters
   >  ...
   > #RVIZ_IN_PBI_GUIDE:END:Added to enable user parameters
   >
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Removed to enable user parameters 
   >  ...
   > #RVIZ_IN_PBI_GUIDE:END:Removed to enable user parameters
   > ```

   ![](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/script_r_before_after_1.png)

   Note that you may decide not to expose some of the parameters to UI, like we did.  

1. Re-package the visual using the command `pbiviz package`, then try to import it into Power BI and see what it does.

To download the above files, see [PBIX](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelPlot_RCustomVisual.pbix) and the entire [source code](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter3_RCustomVisual/funnelRvisual_v03/).

> [!NOTE]
> In this tutorial we add parameters of several types (boolean, numeric, string, and color) at once. If this is too complicated to follow, please see [this example](https://github.com/Microsoft/PowerBI-visuals/blob/master/RVisualTutorial/PropertiesPane.md) on how to add a single parameter. 

## Convert visual to RHTML-based visual

Since the resulting visual is PNG-based, it isn't responsive to mouse hover, can't be zoomed in, etc., so we'll show how it can be converted to HTML-based visual. We will create an empty R-powered HTML-based Visual template and then copy some scripts from the PNG-based visual project.

1. Run the command:

   ```bash
   pbiviz new funnelRHTMLvisual -t rhtml
   cd funnelRHTMLvisual
   npm install 
   pbiviz package
   ```

1. Open *capabilities.json* and note the `"scriptOutputType":"html"` line.

1. Open *dependencies.json* and note the names of the listed R-packages.

1. Open *script.r* and note the structure. You may open and run it in RStudio. It does not use external input. 

   You will find that it creates and saves *out.html* file. The file will have to be self-contained (without external dependencies) and defines graphics inside HTML widget. 

   For `htmlWidgets` users, R-utilities are provided in the _"r_files"_ [folder](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/r_files) to help with conversion of `plotly` or `widget` object into self-content HTML. 
   Note that this version of R-powered visual supports `source` command (unlike previous types of visuals) to make your code more readable.   
 
1. Replace *capabilities.json* with the *capabilities.json* from the previous step, but be sure to keep:

   `"scriptOutputType": "html"`  

   Download the resulting [capabilities.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/capabilities.json).

1. Merge the latest version of the *sript.r* with *script.r* from the template.

   The new script uses the `plotly` package to convert **ggplot** object into a **plotly** object, then the `htmlWidgets` package to save it to an HTML file. 

   We also move most of the utility functions to [_"r_files/utils.r"_](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/r_files/utils.r) and add `generateNiceTooltips` function for cosmetics of **plotly** object.

   Download the resulting [script.r](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/script.r)

   ![1](./samples/funnel-plot/chapter4_R/RHTML_v01/script_befor_after_1.PNG)
   
   ![2](./samples/funnel-plot/chapter4_R/RHTML_v01/script_befor_after_2.PNG)

   > [!NOTE]
   > To follow the changes in R-script, search for the commented blocks:
   > 
   > ```r
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Added to create HTML-based 
   >  ...
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Added to create HTML-based
   >
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Removed to create HTML-based  
   > ...
   > #RVIZ_IN_PBI_GUIDE:BEGIN:Removed to create HTML-based
   > ```

1. Merge the latest version of the *dependencies.json* file with *dependencies.json* from the template to include new R-package dependencies.

   Download the resulting [dependencies.json](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/dependencies.json)

1. Edit *src/settings.ts* in exactly the way from the previous set of steps.

1. Re-package the visual using the command `pbiviz package`, then try to import it into Power BI and see what it does.

To download the above PBIX and source code files, see [here](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01).

## Build additional examples

1. Run the following command to create an empty project: 

   ```bash
   pbiviz new smallRHTML -t rhtml
   cd smallRHTML
   npm install 
   pbiviz package
   ```

1. Take code from this [showcase](http://www.htmlwidgets.org/showcase_networkD3.html) and the following changes:

   ![Highlighted changes](./media/funnel-plot/CaptureNetworkD3.PNG)

1. Use this instead of your template's *script.r* and run `pbiviz package` again. Now you get this cool visual in your Power BI report!

## Tips and tricks

* We recommend developers edit *pbiviz.json* to contain correct metadata, such as **version**, **email**, **name**, **license type**, etc.

   > [!IMPORTANT]
   > The **guid** field is the unique identifier for a visual. You should create a new project for each different visual, so the GUID will be also be different. It will only be the same if using an old project to create a new visual, which you should not do.

* Edit [*assets/icon.png*](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/funnelRHTMLvisual_v01/assets/icon.png) to create unique icons for your visual. 

* To debug your R-code in RStudio using the same data as you have in a Power BI report, add the following to the beginning of the R-script (edit the `fileRda` variable):

   ```r
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

   This code saves the environment from a Power BI report and loads it into RStudio. 

* You don't need to develop R-powered Visuals from scratch when code is available on [Github](https://github.com/Microsoft?utf8=%E2%9C%93&q=PowerBI&type=&language=R). Just select the visual you'd like to use as a template and copy the code into a new project. For example, try using the [spline custom visual](https://github.com/Microsoft/PowerBI-visuals-spline).

* Each R Visual applies the `unique` operator to its input table. To avoid identical rows being removed, consider adding an extra input field with a unique ID and ignore it in the R code.   

* If you have Power BI account, use the Power BI service to develop your [visual on-the-fly](/PowerBI-visuals/docs/step-by-step-lab/creating-a-custom-visual/#testing-the-custom-visual) instead of re-packaging them with the `pbiviz package` command.

### HTML widgets gallery
Explore visuals in the [widgets gallery](http://gallery.htmlwidgets.org/) to use in your next visual. To make things easier, we've created a [visuals project repo](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML) with over 20 interactive HTML visuals to choose from.

> [!NOTE]
> To switch between html widgets use **Format** > **Settings** > **Type**.
>
> Try it out using [this PBIX file](https://github.com/Microsoft/PowerBI-visuals/tree/master/RVisualTutorial/TutorialFunnelPlot/chapter4_RHTMLCustomVisual/multipleRHTML/assets/sample.pbix). 

#### To use a sample for your visual

1. Download the entire folder.
1. Edit *script.r* and *dependencies.json* to keep only one widget.
1. Edit *capabilities.json* and *settings.ts* to remove the `Type` selector.
1. For better performance, change `const updateHTMLHead: boolean = true;` to `false` in *visual.ts*. 
1. Change the metadata in *pbiviz.json*, most importantly the `guid` field.
1. Re-package and continue customizing the visual as desired. 

![CV02to03](./media/funnel-plot/CaptureSample.PNG)

![CV02to03](./media/funnel-plot/CaptureSampleService.PNG)

> [!NOTE]
> Not all widgets in this project are supported by the service.

## Next steps

To learn more, see additional tutorials on [PowerBI visuals](./custom-visual-develop-tutorial.md) and [R visuals](/power-bi/visuals/service-r-visuals).

For more examples, visit the [R-script showcase](https://community.powerbi.com/t5/R-Script-Showcase/bd-p/RVisuals) and learn how to [develop and submit visuals](https://powerbi.microsoft.com/en-us/documentation/powerbi-developer-office-store/) to the [Office Store (gallery)](https://store.office.com/en-us/appshome.aspx?ui=en-US&rs=en-US&ad=US&clickedfilter=OfficeProductFilter%3aPowerBI&productgroup=PowerBI).
