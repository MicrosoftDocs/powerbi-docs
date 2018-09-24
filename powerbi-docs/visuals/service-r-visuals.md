---
title: Create advanced analytics and visualizations using R scripts in Power BI
description: Use R scripts in Power BI to create advanced analytics and advanced visualizations
author: mihart
manager: kvivek
ms.reviewer: ''

ms.service: powerbi
ms.component: powerbi-desktop
ms.topic: conceptual
ms.date: 07/24/2018
ms.author: mihart

LocalizationGroup: Visualizations
---
# Creating R visuals in the Power BI service
The Power BI service supports viewing and interacting with visuals created with R scripts. Visuals created with R scripts, commonly called *R visuals*, can present advanced data shaping and analytics such as forecasting, using the rich analytics and visualization power of R.

> [!NOTE]
> The [R programming language](https://www.r-project.org/) is among the most widely used programming languages by statisticians, data scientists, and business analysts. The R language has an open source community that offers over 7,000 add-on packages, as well as widely used [R User Groups](http://msdsug.microsoft.com/). The version of R deployed in the Power BI service is *Revolution R Open 3.2.2.*
> 
> 

The following image shows a Power BI dashboard with a collection of R visuals used for advanced analytics.

![](media/service-r-visuals/r-visuals-service_1.png)

R visuals are created in a [Power BI Desktop report](../desktop-get-the-desktop.md), like the report shown in the following image.

![](media/service-r-visuals/r-visuals-service_2a.png)

Once the report is created in **Power BI Desktop**, you can publish the report containing one or more R visuals to the Power BI service. R visuals currently can only be created in **Power BI Desktop**, and then published to the Power BI service. For more information on creating R visuals, see [Create Power BI visuals using R (Power BI Desktop)](../desktop-r-visuals.md).

Note that in the service not all of the R packages are supported. See supported packages at the end of this article for the list of packages currently supported in the Power BI service.

You can download this [sample Power BI Desktop file](http://download.microsoft.com/download/D/9/A/D9A65269-D1FC-49F8-8EC3-1217E3A4390F/RVisual_correlation_plot_sample%20SL.pbix) (.pbix file) that contains a few R visuals to see how this works, and to experiment.

R visuals that are created in **Power BI Desktop**, and then published to the Power BI service, for the most part behave like any other visual in the Power BI service; you can interact, filter, slice, and pin them to a dashboard, or share them with others. For more information about sharing dashboards and visuals, see [share a dashboard with colleagues and others](../service-share-dashboards.md). One difference from other visuals is that R visuals cannot show tool tips and cannot be used to filter other visuals.

As you can see in the following image, R visuals in the Power BI service, either in dashboards or reports, largely appear and behave like any other visual, and users don't need to be aware of the underlying R script that created the visual.

![](media/service-r-visuals/r-visuals-service_3a.png)

## R scripts security
R visuals are created from R scripts, which could potentially contain code with security or privacy risks.

These risks mainly exist in the authoring phase when the script author run the script on their own computer.

The Power BI service applies a *sandbox* technology to protect users and the service from security risks.

This *sandbox* approach imposes some restrictions on the R scripts running in the Power BI service, such as accessing the Internet, or accessing to other resources that are not required to create the R visual.

## R scripts error experience
When an R script encounters an error, the R visual is not plotted and an error message is displayed. For details on the error, select **See details** from the R visual error on the canvas, as shown in the following image.

![](media/service-r-visuals/r-visuals-service_4.png)

As another example, the following image shows the error message that appears when an R script failed to run properly due to a missing R package in Azure.

![](media/service-r-visuals/r-visuals-service_5.png)

## Licensing
R visuals require a [Power BI Pro](../service-self-service-signup-for-power-bi.md) license to render in reports, refresh, filter and cross-filter. For more information about Power BI Pro licenses, and how they differ from free licenses, see [Power BI Pro content - what is it?](../service-premium.md)

Free users of Power BI can only consume tiles shared with them. See [purchasing Power BI Pro](../service-admin-purchasing-power-bi-pro.md) for more information.

The following table describes R visuals capabilities based on licensing.

![](media/service-r-visuals/r-visuals-service_6a.png)

## Known Limitations
R visuals in the Power BI service have a few limitations:

* R visuals support is limited to the packages identified on the following page <make this a link to the supported packages page per my excel>. There currently is no support for custom packages.
* Data size limitations – data used by the R visual for plotting is limited to 150,000 rows. If more than 150,000 rows are selected, only the top 150,000 rows are used and a message is displayed on the image.
* Calculation time limitation – if an R visual calculation exceeds 60 seconds the script times out, resulting in an error.
* R visuals are refreshed upon data updates, filtering, and highlighting. However, the image itself is not interactive and does not support tool tips.
* R visuals respond to highlighting other visuals, but you cannot click on elements in the R visual in order to cross filter other elements.
* R visuals are currently not supported for the *Time* data type. Please use Date/Time instead.
* R Visuals do not display when using **Publish to web**.
* R visuals currently do not print with dashboard and reports printing
* R visuals are currently not supported in the DirectQuery mode of Analysis Services
* Chinese, Japanese and Korean fonts require all of the additional following steps to work properly in the Power BI service:
  
  * First, install the R package *showtext* and all of its dependencies. You can do this by running the following script:
    
        *install.packages("showtext")*
  * Next, add the following line at the beginning of the R script:
    
        powerbi_rEnableShowTextForCJKLanguages =  1

## Overview of R packages
R packages are collections of R functions, data, and compiled code that are combined in a well-defined format. When R is installed, it comes with a standard set of packages, and other packages are available for download and installation. Once installed, an R packages must be loaded into the session to be used. The primary source of free R packages is CRAN, the [Comprehensive R Archive Network](https://cran.r-project.org/web/packages/available_packages_by_name.html).

**Power BI Desktop** can use any type of R packages without limitation. You can install R packages for use in **Power BI Desktop** on your own (using the [RStudio IDE](https://www.rstudio.com/), for example).

R visuals in the **Power BI service** are supported by the packages found in the **Supported Packages** section found in [this article](../service-r-packages-support.md). If you don't find a package you're interested in among the supported packages list, you can request the support of the package. See [R packages in the Power BI service](../service-r-packages-support.md) for information on how to request support.

### Requirements and Limitations of R packages
There are a handful of requirements and limitations for R packages:

* The Power BI service, for the most part, supports R packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* The Power BI service supports packages published in CRAN. The service does not support private or custom R packages. We encourage users to make their private packages available on CRAN prior to requesting the package be available in the Power BI service.
* For **Power BI Desktop** has two variations for R packages:
  
  * For R visuals, you can install any package, including custom R packages
  * For Custom R visuals, only public CRAN packages are supported for auto-installation of the packages
* For security and privacy reasons, we currently don't support R packages that provide client-server queries over the World-Wide Web (such as RgoogleMaps) in the service. Networking is blocked for such attempts. See [R packages in the Power BI service](../service-r-packages-support.md) for a list of supported and unsupported R packages.
* The approval process for including a new R package has a tree of dependencies; some dependencies required to be installed in the service cannot be supported.

### Supported Packages:
For a long list of supported R packages (and the short list of unsupported packages) please see the following article:

* [R packages in the Power BI service](../service-r-packages-support.md)

