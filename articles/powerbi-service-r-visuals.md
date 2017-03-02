<properties
   pageTitle="Create advanced analytics and visualizations using R scripts in Power BI"
   description="Use R scripts in Power BI to create advanced analytics and advanced visualizations"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="03/02/2017"
   ms.author="davidi"/>

# Creating R visuals in the Power BI service

The Power BI service supports viewing and interacting with visuals created with R scripts. Visuals created with R scripts, commonly called *R visuals*, can present advanced data shaping and analytics such as forecasting, using the rich analytics and visualization power of R.

> **Note:** The [R programming language](https://www.r-project.org/) is among the most widely used programming languages by statisticians, data scientists, and business analysts. The R language has an open source community that offers over 7,000 add-on packages, as well as widely used [R User Groups](http://msdsug.microsoft.com/). The version of R deployed in the Power BI service is *Revolution R Open 3.2.2.*

The following image shows a Power BI dashboard with a collection of R visuals used for advanced analytics.

![](media/powerbi-service-r-visuals/r-visuals-service_1.png)

R visuals are created in a [Power BI Desktop report](powerbi-desktop-get-the-desktop.md), like the report shown in the following image.

![](media/powerbi-service-r-visuals/r-visuals-service_2a.png)

Once the report is created in **Power BI Desktop**, you can publish the report containing one or more R visuals to the Power BI service. R visuals currently can only be created in **Power BI Desktop**, and then published to the Power BI service. For more information on creating R visuals, see [Create Power BI visuals using R (Power BI Desktop)](powerbi-desktop-r-visuals.md).

Note that in the service not all of the R packages are supported. See supported packages at the end of this article for the list of packages currently supported in the Power BI service.

You can download this [sample Power BI Desktop file](http://download.microsoft.com/download/D/9/A/D9A65269-D1FC-49F8-8EC3-1217E3A4390F/RVisual_correlation_plot_sample SL.pbix) (.pbix file) that contains a few R visuals to see how this works, and to experiment.

R visuals that are created in **Power BI Desktop**, and then published to the Power BI service, for the most part behave like any other visual in the Power BI service; you can interact, filter, slice, and pin them to a dashboard, or share them with others. For more information about sharing dashboards and visuals, see [share a dashboard with colleagues and others](powerbi-service-share-unshare-dashboard.md). One difference from other visuals is that R visuals cannot show tool tips and cannot be used to filter other visuals.

As you can see in the following image, R visuals in the Power BI service, either in dashboards or reports, largely appear and behave like any other visual, and users don't need to be aware of the underlying R script that created the visual.

![](media/powerbi-service-r-visuals/r-visuals-service_3a.png)

## R scripts security

R visuals are created from R scripts, which could potentially contain code with security or privacy risks.

These risks mainly exist in the authoring phase when the script author run the script on their own computer.

The Power BI service applies a *sandbox* technology to protect users and the service from security risks.

This *sandbox* approach imposes some restrictions on the R scripts running in the Power BI service, such as accessing the Internet, or accessing to other resources that are not required to create the R visual.


## R scripts error experience

When an R script encounters an error, the R visual is not plotted and an error message is displayed. For details on the error, select **See details** from the R visual error on the canvas, as shown in the following image.

![](media/powerbi-service-r-visuals/r-visuals-service_4.png)

As another example, the following image shows the error message that appears when an R script failed to run properly due to a missing R package in Azure.

![](media/powerbi-service-r-visuals/r-visuals-service_5.png)

## Licensing

R visuals require a [Power BI Pro](powerbi-free-trial-for-power-bi-pro.md) license to render in reports, refresh, filter and cross-filter. For more information about Power BI Pro licenses, and how they differ from free licenses, see [Power BI Pro content - what is it?](powerbi-powerbi-pro-content-what-is-it.md)

Free users of Power BI can only consume tiles shared with them. See [purchasing Power BI Pro](powerbi-admin-purchasing-power-bi-pro.md) for more information.

The following table describes R visuals capabilities based on licensing.

![](media/powerbi-service-r-visuals/r-visuals-service_6a.png)


## Known Limitations

R visuals in the Power BI service have a few limitations:

-   R visuals support is limited to the packages identified on the following page <make this a link to the supported packages page per my excel>. There currently is no support for custom packages.

-   Data size limitations – data used by the R visual for plotting is limited to 150,000 rows. If more than 150,000 rows are selected, only the top 150,000 rows are used and a message is displayed on the image.

-   Calculation time limitation – if an R visual calculation exceeds 60 seconds the script times out, resulting in an error.

-   R visuals are refreshed upon data updates, filtering, and highlighting. However, the image itself is not interactive and does not support tool tips.

-   R visuals respond to highlighting other visuals, but you cannot click on elements in the R visual in order to cross filter other elements.

-   R visuals are currently not supported for the *Time* data type. Please use Date/Time instead.

-   R Visuals do not display when using **Publish to web**.

-   R visuals currently do not print with dashboard and reports printing

-   R visuals are currently not supported in the DirectQuery mode of Analysis Services

## Supported packages

### Overview of R packages
R packages are collections of R functions, data, and compiled code that are combined in a well-defined format. When R is installed, it comes with a standard set of packages, and other packages are available for download and installation. Once installed, an R packages must be loaded into the session to be used. The primary source of free R packages is CRAN, the [Comprehensive R Archive Network](https://cran.r-project.org/web/packages/available_packages_by_name.html).

**Power BI Desktop** can use any type of R packages without limitation. You can install R packages for use in **Power BI Desktop** on your own (using the [RStudio IDE](https://www.rstudio.com/), for example).

R visuals in the **Power BI service** are supported by the packages found in the **Supported Packages** section found later in this article. If you don't find a package you're interested in among the supported packages list, you can request the support of the package.

### Request support for a new R package

Supported R packages for the **Power BI service** are found in the following section, titled **Supported Packages**. If you would like to request support of an R package not found in that list, you can send an email with your request to the [R in Power BI Feedback Team](mailto:rinpbifb@microsoft.com).

### Requirements and Limitations of R packages

There are a handful of requirements and limitations for R packages:

-   The Power BI service, for the most part, supports R packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
-   The Power BI service supports packages published in CRAN. The service does not support private or custom R packages. We encourage users to make their private packages available on CRAN prior to requesting the package be available in the Power BI service.

-   For **Power BI Desktop** has two variations for R packages:
    -   For R visuals, you can install any package, including custom R packages
    -   For Custom R visuals, only public CRAN packages are supported for auto-installation of the packages
-   For security and privacy reasons, we currently don't support R packages that provide client-server queries over the World-Wide Web (such as RgoogleMaps) in the service. Networking is blocked for such attempts. The following R packages cannot be supported in the Power BI service:
    -   RgoogleMaps (networking is blocked)
    -   mailR (networking is blocked)
    -   RevoScaleR (ships only with Microsoft R Server)
-   The approval process for including a new R package has a tree of dependencies; some dependencies required to be installed in the service cannot be supported.


### Supported Packages:

|Package|Version|Link|
|---|---|---|
|abc|2.1|[ https://cran.r-project.org/web/packages/abc/index.html]( https://cran.r-project.org/web/packages/abc/index.html)|
|abc.data|1|[ https://cran.r-project.org/web/packages/abc.data/index.html]( https://cran.r-project.org/web/packages/abc.data/index.html)|
|acepack| 1.3-3.3|[ https://cran.r-project.org/web/packages/acepack/index.html]( https://cran.r-project.org/web/packages/acepack/index.html)|
|actuar| 1.2-0|[ https://cran.r-project.org/web/packages/actuar/index.html]( https://cran.r-project.org/web/packages/actuar/index.html)|
|ade4| 1.7-4|[ https://cran.r-project.org/web/packages/ade4/index.html]( https://cran.r-project.org/web/packages/ade4/index.html)|
|AdMit| 2.0.1|[ https://cran.r-project.org/web/packages/AdMit/index.html]( https://cran.r-project.org/web/packages/AdMit/index.html)|
|andrews|1|[ https://cran.r-project.org/web/packages/andrews/index.html]( https://cran.r-project.org/web/packages/andrews/index.html)|
|aod|1.3|[ https://cran.r-project.org/web/packages/aod/index.html]( https://cran.r-project.org/web/packages/aod/index.html)|
|apcluster| 1.4.3|[ https://cran.r-project.org/web/packages/apcluster/index.html]( https://cran.r-project.org/web/packages/apcluster/index.html)|
|ape|3.4|[ https://cran.r-project.org/web/packages/ape/index.html]( https://cran.r-project.org/web/packages/ape/index.html)|
|aplpack| 1.3.0|[ https://cran.r-project.org/web/packages/aplpack/index.html]( https://cran.r-project.org/web/packages/aplpack/index.html)|
|approximator| 1.2-6|[ https://cran.r-project.org/web/packages/approximator/index.html]( https://cran.r-project.org/web/packages/approximator/index.html)|
|arm| 1.8-6|[ https://cran.r-project.org/web/packages/arm/index.html]( https://cran.r-project.org/web/packages/arm/index.html)|
|arules| 1.4-0|[ https://cran.r-project.org/web/packages/arules/index.html]( https://cran.r-project.org/web/packages/arules/index.html)|
|arulesViz| 1.1-0|[ https://cran.r-project.org/web/packages/arulesViz/index.html]( https://cran.r-project.org/web/packages/arulesViz/index.html)|
|assertthat|0.1|[ https://cran.r-project.org/web/packages/assertthat/index.html]( https://cran.r-project.org/web/packages/assertthat/index.html)|
|BACCO| 2.0-9|[ https://cran.r-project.org/web/packages/BACCO/index.html]( https://cran.r-project.org/web/packages/BACCO/index.html)|
|BaM|0.99|[ https://cran.r-project.org/web/packages/BaM/index.html]( https://cran.r-project.org/web/packages/BaM/index.html)|
|BAS| 1.1.0|[ https://cran.r-project.org/web/packages/BAS/index.html]( https://cran.r-project.org/web/packages/BAS/index.html)|
|base64enc| 0.1-3|[ https://cran.r-project.org/web/packages/base64enc/index.html]( https://cran.r-project.org/web/packages/base64enc/index.html)|
|bayesm| 3.0-2|[ https://cran.r-project.org/web/packages/bayesm/index.html]( https://cran.r-project.org/web/packages/bayesm/index.html)|
|bayesQR|2.2|[ https://cran.r-project.org/web/packages/bayesQR/index.html]( https://cran.r-project.org/web/packages/bayesQR/index.html)|
|bayesSurv|2.6|[ https://cran.r-project.org/web/packages/bayesSurv/index.html]( https://cran.r-project.org/web/packages/bayesSurv/index.html)|
|BayesTree| 0.3-1.3|[ https://cran.r-project.org/web/packages/BayesTree/index.html]( https://cran.r-project.org/web/packages/BayesTree/index.html)|
|BayHaz| 0.1-3|[ https://cran.r-project.org/web/packages/BayHaz/index.html]( https://cran.r-project.org/web/packages/BayHaz/index.html)|
|bbemkr|2|[ https://cran.r-project.org/web/packages/bbemkr/index.html]( https://cran.r-project.org/web/packages/bbemkr/index.html)|
|BCBCSF| 1.0-1|[ https://cran.r-project.org/web/packages/BCBCSF/index.html]( https://cran.r-project.org/web/packages/BCBCSF/index.html)|
|BCE|2.1|[ https://cran.r-project.org/web/packages/BCE/index.html]( https://cran.r-project.org/web/packages/BCE/index.html)|
|bclust|1.5|[ https://cran.r-project.org/web/packages/bclust/index.html]( https://cran.r-project.org/web/packages/bclust/index.html)|
|BenfordTests| 1.2.0|[ https://cran.r-project.org/web/packages/BenfordTests/index.html]( https://cran.r-project.org/web/packages/BenfordTests/index.html)|
|bisoreg|1.4|[ https://cran.r-project.org/web/packages/bisoreg/index.html]( https://cran.r-project.org/web/packages/bisoreg/index.html)|
|bit| 1.1-12|[ https://cran.r-project.org/web/packages/bit/index.html]( https://cran.r-project.org/web/packages/bit/index.html)|
|bit64| 0.9-5|[ https://cran.r-project.org/web/packages/bit64/index.html]( https://cran.r-project.org/web/packages/bit64/index.html)|
|bitops| 1.0-6|[ https://cran.r-project.org/web/packages/bitops/index.html]( https://cran.r-project.org/web/packages/bitops/index.html)|
|BMA| 3.18.6|[ https://cran.r-project.org/web/packages/BMA/index.html]( https://cran.r-project.org/web/packages/BMA/index.html)|
|Bmix|0.6|[ https://cran.r-project.org/web/packages/Bmix/index.html]( https://cran.r-project.org/web/packages/Bmix/index.html)|
|bnlearn|3.9|[ https://cran.r-project.org/web/packages/bnlearn/index.html]( https://cran.r-project.org/web/packages/bnlearn/index.html)|
|boa| 1.1.8-1|[ https://cran.r-project.org/web/packages/boa/index.html]( https://cran.r-project.org/web/packages/boa/index.html)|
|boot| 1.3-18|[ https://cran.r-project.org/web/packages/boot/index.html]( https://cran.r-project.org/web/packages/boot/index.html)|
|bootstrap|2015.2|[ https://cran.r-project.org/web/packages/bootstrap/index.html]( https://cran.r-project.org/web/packages/bootstrap/index.html)|
|bqtl| 1.0-32|[ https://cran.r-project.org/web/packages/bqtl/index.html]( https://cran.r-project.org/web/packages/bqtl/index.html)|
|BradleyTerry2| 1.0-6|[ https://cran.r-project.org/web/packages/BradleyTerry2/index.html]( https://cran.r-project.org/web/packages/BradleyTerry2/index.html)|
|brew| 1.0-6|[ https://cran.r-project.org/web/packages/brew/index.html]( https://cran.r-project.org/web/packages/brew/index.html)|
|brglm| 0.5-9|[ https://cran.r-project.org/web/packages/brglm/index.html]( https://cran.r-project.org/web/packages/brglm/index.html)|
|bspec|1.5|[ https://cran.r-project.org/web/packages/bspec/index.html]( https://cran.r-project.org/web/packages/bspec/index.html)|
|bspmma| 0.1-1|[ https://cran.r-project.org/web/packages/bspmma/index.html]( https://cran.r-project.org/web/packages/bspmma/index.html)|
|BVS| 4.12.1|[ https://cran.r-project.org/web/packages/BVS/index.html]( https://cran.r-project.org/web/packages/BVS/index.html)|
|C50| 0.1.0-24|[ https://cran.r-project.org/web/packages/C50/index.html]( https://cran.r-project.org/web/packages/C50/index.html)|
|calibrator| 1.2-6|[ https://cran.r-project.org/web/packages/calibrator/index.html]( https://cran.r-project.org/web/packages/calibrator/index.html)|
|car| 2.1-2|[ https://cran.r-project.org/web/packages/car/index.html]( https://cran.r-project.org/web/packages/car/index.html)|
|caret| 6.0-64|[ https://cran.r-project.org/web/packages/caret/index.html]( https://cran.r-project.org/web/packages/caret/index.html)|
|catnet| 1.14.8|[ https://cran.r-project.org/web/packages/catnet/index.html]( https://cran.r-project.org/web/packages/catnet/index.html)|
|caTools| 1.17.1|[ https://cran.r-project.org/web/packages/caTools/index.html]( https://cran.r-project.org/web/packages/caTools/index.html)|
|cclust| 0.6-20|[ https://cran.r-project.org/web/packages/cclust/index.html]( https://cran.r-project.org/web/packages/cclust/index.html)|
|class| 7.3-14|[ https://cran.r-project.org/web/packages/class/index.html]( https://cran.r-project.org/web/packages/class/index.html)|
|clue| 0.3-51|[ https://cran.r-project.org/web/packages/clue/index.html]( https://cran.r-project.org/web/packages/clue/index.html)|
|cluster| 2.0.3|[ https://cran.r-project.org/web/packages/cluster/index.html]( https://cran.r-project.org/web/packages/cluster/index.html)|
|coda| 0.18-1|[ https://cran.r-project.org/web/packages/coda/index.html]( https://cran.r-project.org/web/packages/coda/index.html)|
|coin| 1.1-2|[ https://cran.r-project.org/web/packages/coin/index.html]( https://cran.r-project.org/web/packages/coin/index.html)|
|CORElearn| 1.47.1|[ https://cran.r-project.org/web/packages/CORElearn/index.html]( https://cran.r-project.org/web/packages/CORElearn/index.html)|
|corpcor| 1.6.8|[ https://cran.r-project.org/web/packages/corpcor/index.html]( https://cran.r-project.org/web/packages/corpcor/index.html)|
|corrplot|0.73|[ https://cran.r-project.org/web/packages/corrplot/index.html]( https://cran.r-project.org/web/packages/corrplot/index.html)|
|crayon| 1.3.1|[ https://cran.r-project.org/web/packages/crayon/index.html]( https://cran.r-project.org/web/packages/crayon/index.html)|
|cslogistic| 0.1-3|[ https://cran.r-project.org/web/packages/cslogistic/index.html]( https://cran.r-project.org/web/packages/cslogistic/index.html)|
|cubature| 1.1-2|[ https://cran.r-project.org/web/packages/cubature/index.html]( https://cran.r-project.org/web/packages/cubature/index.html)|
|cvTools| 0.3.2|[ https://cran.r-project.org/web/packages/cvTools/index.html]( https://cran.r-project.org/web/packages/cvTools/index.html)|
|data.table| 1.9.6|[ https://cran.r-project.org/web/packages/data.table/index.html]( https://cran.r-project.org/web/packages/data.table/index.html)|
|Data.tree|0.7.0|[https://cran.r-project.org/web/packages/data.tree/index.html](https://cran.r-project.org/web/packages/data.tree/index.html)|
|date| 1.2-34|[ https://cran.r-project.org/web/packages/date/index.html]( https://cran.r-project.org/web/packages/date/index.html)|
|dbscan| 0.9-7|[ https://cran.r-project.org/web/packages/dbscan/index.html]( https://cran.r-project.org/web/packages/dbscan/index.html)|
|deal| 1.2-37|[ https://cran.r-project.org/web/packages/deal/index.html]( https://cran.r-project.org/web/packages/deal/index.html)|
|deepnet|0.2|[ https://cran.r-project.org/web/packages/deepnet/index.html]( https://cran.r-project.org/web/packages/deepnet/index.html)|
|deldir| 0.1-12|[ https://cran.r-project.org/web/packages/deldir/index.html]( https://cran.r-project.org/web/packages/deldir/index.html)|
|dendextend| 1.1.8|[ https://cran.r-project.org/web/packages/dendextend/index.html]( https://cran.r-project.org/web/packages/dendextend/index.html)|
|DEoptimR| 1.0-4|[ https://cran.r-project.org/web/packages/DEoptimR/index.html]( https://cran.r-project.org/web/packages/DEoptimR/index.html)|
|deSolve|1.13|[ https://cran.r-project.org/web/packages/deSolve/index.html]( https://cran.r-project.org/web/packages/deSolve/index.html)|
|DiagrammeR| 0.8.2|[ https://cran.r-project.org/web/packages/DiagrammeR/index.html]( https://cran.r-project.org/web/packages/DiagrammeR/index.html)|
|dichromat| 2.0-0|[ https://cran.r-project.org/web/packages/dichromat/index.html]( https://cran.r-project.org/web/packages/dichromat/index.html)|
|digest| 0.6.9|[ https://cran.r-project.org/web/packages/digest/index.html]( https://cran.r-project.org/web/packages/digest/index.html)|
|dlm| 1.1-4|[ https://cran.r-project.org/web/packages/dlm/index.html]( https://cran.r-project.org/web/packages/dlm/index.html)|
|DMwR| 0.4.1|[ https://cran.r-project.org/web/packages/DMwR/index.html]( https://cran.r-project.org/web/packages/DMwR/index.html)|
|dplyr| 0.4.3|[ https://cran.r-project.org/web/packages/dplyr/index.html]( https://cran.r-project.org/web/packages/dplyr/index.html)|
|DPpackage| 1.1-6|[ https://cran.r-project.org/web/packages/DPpackage/index.html]( https://cran.r-project.org/web/packages/DPpackage/index.html)|
|dse| 2015.12-1|[ https://cran.r-project.org/web/packages/dse/index.html]( https://cran.r-project.org/web/packages/dse/index.html)|
|DT|0.2|[https://cran.r-project.org/web/packages/DT/index.html](https://cran.r-project.org/web/packages/DT/index.html)|
|dtw| 1.18-1|[ https://cran.r-project.org/web/packages/dtw/index.html]( https://cran.r-project.org/web/packages/dtw/index.html)|
|e1071| 1.6-7|[ https://cran.r-project.org/web/packages/e1071/index.html]( https://cran.r-project.org/web/packages/e1071/index.html)|
|earth| 4.4.4|[ https://cran.r-project.org/web/packages/earth/index.html]( https://cran.r-project.org/web/packages/earth/index.html)|
|EbayesThresh| 1.3.2|[ https://cran.r-project.org/web/packages/EbayesThresh/index.html]( https://cran.r-project.org/web/packages/EbayesThresh/index.html)|
|ebdbNet| 1.2.3|[ https://cran.r-project.org/web/packages/ebdbNet/index.html]( https://cran.r-project.org/web/packages/ebdbNet/index.html)|
|ellipse| 0.3-8|[ https://cran.r-project.org/web/packages/ellipse/index.html]( https://cran.r-project.org/web/packages/ellipse/index.html)|
|emulator| 1.2-15|[ https://cran.r-project.org/web/packages/emulator/index.html]( https://cran.r-project.org/web/packages/emulator/index.html)|
|ensembleBMA| 5.1.2|[ https://cran.r-project.org/web/packages/ensembleBMA/index.html]( https://cran.r-project.org/web/packages/ensembleBMA/index.html)|
|entropy| 1.2.1|[ https://cran.r-project.org/web/packages/entropy/index.html]( https://cran.r-project.org/web/packages/entropy/index.html)|
|EvalEst| 2015.4-2|[ https://cran.r-project.org/web/packages/EvalEst/index.html]( https://cran.r-project.org/web/packages/EvalEst/index.html)|
|evaluate| 0.8.3|[ https://cran.r-project.org/web/packages/evaluate/index.html]( https://cran.r-project.org/web/packages/evaluate/index.html)|
|evdbayes| 1.1-1|[ https://cran.r-project.org/web/packages/evdbayes/index.html]( https://cran.r-project.org/web/packages/evdbayes/index.html)|
|exactLoglinTest| 1.4.2|[ https://cran.r-project.org/web/packages/exactLoglinTest/index.html]( https://cran.r-project.org/web/packages/exactLoglinTest/index.html)|
|expm| 0.999-0|[ https://cran.r-project.org/web/packages/expm/index.html]( https://cran.r-project.org/web/packages/expm/index.html)|
|extremevalues| 2.3.2|[ https://cran.r-project.org/web/packages/extremevalues/index.html]( https://cran.r-project.org/web/packages/extremevalues/index.html)|
|FactoMineR|1.32|[ https://cran.r-project.org/web/packages/FactoMineR/index.html]( https://cran.r-project.org/web/packages/FactoMineR/index.html)|
|factorQR| 0.1-4|[ https://cran.r-project.org/web/packages/factorQR/index.html]( https://cran.r-project.org/web/packages/factorQR/index.html)|
|faoutlier| 0.6.1|[ https://cran.r-project.org/web/packages/faoutlier/index.html]( https://cran.r-project.org/web/packages/faoutlier/index.html)|
|fBasics|3011.87|[ https://cran.r-project.org/web/packages/fBasics/index.html]( https://cran.r-project.org/web/packages/fBasics/index.html)|
|fields| 8.3-6|[ https://cran.r-project.org/web/packages/fields/index.html]( https://cran.r-project.org/web/packages/fields/index.html)|
|filehash|2.3|[ https://cran.r-project.org/web/packages/filehash/index.html]( https://cran.r-project.org/web/packages/filehash/index.html)|
|fitdistrplus| 1.0-6|[ https://cran.r-project.org/web/packages/fitdistrplus/index.html]( https://cran.r-project.org/web/packages/fitdistrplus/index.html)|
|flashClust| 1.01-2|[ https://cran.r-project.org/web/packages/flashClust/index.html]( https://cran.r-project.org/web/packages/flashClust/index.html)|
|FME| 1.3.2|[ https://cran.r-project.org/web/packages/FME/index.html]( https://cran.r-project.org/web/packages/FME/index.html)|
|fmsb| 0.5.2|[ https://cran.r-project.org/web/packages/fmsb/index.html]( https://cran.r-project.org/web/packages/fmsb/index.html)|
|foreach| 1.4.3|[ https://cran.r-project.org/web/packages/foreach/index.html]( https://cran.r-project.org/web/packages/foreach/index.html)|
|forecast|7|[ https://cran.r-project.org/web/packages/forecast/index.html]( https://cran.r-project.org/web/packages/forecast/index.html)|
|Formula| 1.2-1|[ https://cran.r-project.org/web/packages/Formula/index.html]( https://cran.r-project.org/web/packages/Formula/index.html)|
|fracdiff| 1.4-2|[ https://cran.r-project.org/web/packages/fracdiff/index.html]( https://cran.r-project.org/web/packages/fracdiff/index.html)|
|fTrading|3010.78|[ https://cran.r-project.org/web/packages/fTrading/index.html]( https://cran.r-project.org/web/packages/fTrading/index.html)|
|futile.logger| 1.4.3|[ https://cran.r-project.org/web/packages/futile.logger/index.html]( https://cran.r-project.org/web/packages/futile.logger/index.html)|
|gam|1.12|[ https://cran.r-project.org/web/packages/gam/index.html]( https://cran.r-project.org/web/packages/gam/index.html)|
|gamlr| 1.13-3|[ https://cran.r-project.org/web/packages/gamlr/index.html]( https://cran.r-project.org/web/packages/gamlr/index.html)|
|gclus| 1.3.1|[ https://cran.r-project.org/web/packages/gclus/index.html]( https://cran.r-project.org/web/packages/gclus/index.html)|
|gdata| 2.17.0|[ https://cran.r-project.org/web/packages/gdata/index.html]( https://cran.r-project.org/web/packages/gdata/index.html)|
|gee| 4.13-19|[ https://cran.r-project.org/web/packages/gee/index.html]( https://cran.r-project.org/web/packages/gee/index.html)|
|genetics| 1.3.8.1|[ https://cran.r-project.org/web/packages/genetics/index.html]( https://cran.r-project.org/web/packages/genetics/index.html)|
|geoRglm| 0.9-8|[ https://cran.r-project.org/web/packages/geoRglm/index.html]( https://cran.r-project.org/web/packages/geoRglm/index.html)|
|geosphere| 1.5-1|[ https://cran.r-project.org/web/packages/geosphere/index.html]( https://cran.r-project.org/web/packages/geosphere/index.html)|
|ggdendro| 0.1-18|[ https://cran.r-project.org/web/packages/ggdendro/index.html]( https://cran.r-project.org/web/packages/ggdendro/index.html)|
|ggmap|2.6.1|[https://cran.r-project.org/web/packages/ggmap/index.html](https://cran.r-project.org/web/packages/ggmap/index.html)|
|ggmcmc|0.8|[ https://cran.r-project.org/web/packages/ggmcmc/index.html]( https://cran.r-project.org/web/packages/ggmcmc/index.html)|
|ggplot2| 2.1.0|[ https://cran.r-project.org/web/packages/ggplot2/index.html]( https://cran.r-project.org/web/packages/ggplot2/index.html)|
|ggrepel|0.5|[https://cran.r-project.org/web/packages/ggrepel/index.html](https://cran.r-project.org/web/packages/ggrepel/index.html)|
|ggthemes| 3.0.2|[ https://cran.r-project.org/web/packages/ggthemes/index.html]( https://cran.r-project.org/web/packages/ggthemes/index.html)|
|glmmBUGS|2.3|[ https://cran.r-project.org/web/packages/glmmBUGS/index.html]( https://cran.r-project.org/web/packages/glmmBUGS/index.html)|
|glmnet| 2.0-5|[ https://cran.r-project.org/web/packages/glmnet/index.html]( https://cran.r-project.org/web/packages/glmnet/index.html)|
|gmodels| 2.16.2|[ https://cran.r-project.org/web/packages/gmodels/index.html]( https://cran.r-project.org/web/packages/gmodels/index.html)|
|gmp| 0.5-12|[ https://cran.r-project.org/web/packages/gmp/index.html]( https://cran.r-project.org/web/packages/gmp/index.html)|
|gnm| 1.0-8|[ https://cran.r-project.org/web/packages/gnm/index.html]( https://cran.r-project.org/web/packages/gnm/index.html)|
|GPArotation| 2014.11-1|[ https://cran.r-project.org/web/packages/GPArotation/index.html]( https://cran.r-project.org/web/packages/GPArotation/index.html)|
|gridBase| 0.4-7|[ https://cran.r-project.org/web/packages/gridBase/index.html]( https://cran.r-project.org/web/packages/gridBase/index.html)|
|gridExtra| 2.2.1|[ https://cran.r-project.org/web/packages/gridExtra/index.html]( https://cran.r-project.org/web/packages/gridExtra/index.html)|
|growcurves| 0.2.4.0|[ https://cran.r-project.org/web/packages/growcurves/index.html]( https://cran.r-project.org/web/packages/growcurves/index.html)|
|grpreg| 2.8-1|[ https://cran.r-project.org/web/packages/grpreg/index.html]( https://cran.r-project.org/web/packages/grpreg/index.html)|
|gss| 2.1-5|[ https://cran.r-project.org/web/packages/gss/index.html]( https://cran.r-project.org/web/packages/gss/index.html)|
|gsubfn| 0.6-6|[ https://cran.r-project.org/web/packages/gsubfn/index.html]( https://cran.r-project.org/web/packages/gsubfn/index.html)|
|gtable| 0.2.0|[ https://cran.r-project.org/web/packages/gtable/index.html]( https://cran.r-project.org/web/packages/gtable/index.html)|
|ggtern|2.2.0|[https://cran.r-project.org/web/packages/ggtern/index.html](https://cran.r-project.org/web/packages/ggtern/index.html)|
|gtools| 3.5.0|[ https://cran.r-project.org/web/packages/gtools/index.html]( https://cran.r-project.org/web/packages/gtools/index.html)|
|haplo.stats| 1.7.6|[ https://cran.r-project.org/web/packages/haplo.stats/index.html]( https://cran.r-project.org/web/packages/haplo.stats/index.html)|
|hash| 2.2.6|[ https://cran.r-project.org/web/packages/hash/index.html]( https://cran.r-project.org/web/packages/hash/index.html)|
|hbsae|1|[ https://cran.r-project.org/web/packages/hbsae/index.html]( https://cran.r-project.org/web/packages/hbsae/index.html)|
|hdrcde|3.1|[ https://cran.r-project.org/web/packages/hdrcde/index.html]( https://cran.r-project.org/web/packages/hdrcde/index.html)|
|heavy|0.3|[ https://cran.r-project.org/web/packages/heavy/index.html]( https://cran.r-project.org/web/packages/heavy/index.html)|
|HH| 3.1-25|[ https://cran.r-project.org/web/packages/HH/index.html]( https://cran.r-project.org/web/packages/HH/index.html)|
|HI|0.4|[ https://cran.r-project.org/web/packages/HI/index.html]( https://cran.r-project.org/web/packages/HI/index.html)|
|Highcharter|0.5.0|[https://cran.r-project.org/web/packages/highcharter/index.html](https://cran.r-project.org/web/packages/highcharter/index.html)|
|Hmisc| 3.17-3|[ https://cran.r-project.org/web/packages/Hmisc/index.html]( https://cran.r-project.org/web/packages/Hmisc/index.html)|
|HSAUR| 1.3-7|[ https://cran.r-project.org/web/packages/HSAUR/index.html]( https://cran.r-project.org/web/packages/HSAUR/index.html)|
|ifultools| 2.0-1|[ https://cran.r-project.org/web/packages/ifultools/index.html]( https://cran.r-project.org/web/packages/ifultools/index.html)|
|intervals| 0.15.1|[ https://cran.r-project.org/web/packages/intervals/index.html]( https://cran.r-project.org/web/packages/intervals/index.html)|
|ipred| 0.9-5|[ https://cran.r-project.org/web/packages/ipred/index.html]( https://cran.r-project.org/web/packages/ipred/index.html)|
|irlba| 2.0.0|[ https://cran.r-project.org/web/packages/irlba/index.html]( https://cran.r-project.org/web/packages/irlba/index.html)|
|irr|0.84|[ https://cran.r-project.org/web/packages/irr/index.html]( https://cran.r-project.org/web/packages/irr/index.html)|
|iterators| 1.0.8|[ https://cran.r-project.org/web/packages/iterators/index.html]( https://cran.r-project.org/web/packages/iterators/index.html)|
|jpeg| 0.1-8|[ https://cran.r-project.org/web/packages/jpeg/index.html]( https://cran.r-project.org/web/packages/jpeg/index.html)|
|kernlab| 0.9-24|[ https://cran.r-project.org/web/packages/kernlab/index.html]( https://cran.r-project.org/web/packages/kernlab/index.html)|
|KernSmooth| 2.23-15|[ https://cran.r-project.org/web/packages/KernSmooth/index.html]( https://cran.r-project.org/web/packages/KernSmooth/index.html)|
|KFKSDS|1.6|[ https://cran.r-project.org/web/packages/KFKSDS/index.html]( https://cran.r-project.org/web/packages/KFKSDS/index.html)|
|kinship2| 1.6.4|[ https://cran.r-project.org/web/packages/kinship2/index.html]( https://cran.r-project.org/web/packages/kinship2/index.html)|
|kknn| 1.3.1|[ https://cran.r-project.org/web/packages/kknn/index.html]( https://cran.r-project.org/web/packages/kknn/index.html)|
|klaR| 0.6-12|[ https://cran.r-project.org/web/packages/klaR/index.html]( https://cran.r-project.org/web/packages/klaR/index.html)|
|knitr| 1.12.3|[ https://cran.r-project.org/web/packages/knitr/index.html]( https://cran.r-project.org/web/packages/knitr/index.html)|
|labeling|0.3|[ https://cran.r-project.org/web/packages/labeling/index.html]( https://cran.r-project.org/web/packages/labeling/index.html)|
|lars|1.2|[ https://cran.r-project.org/web/packages/lars/index.html]( https://cran.r-project.org/web/packages/lars/index.html)|
|lattice| 0.20-33|[ https://cran.r-project.org/web/packages/lattice/index.html]( https://cran.r-project.org/web/packages/lattice/index.html)|
|latticeExtra| 0.6-28|[ https://cran.r-project.org/web/packages/latticeExtra/index.html]( https://cran.r-project.org/web/packages/latticeExtra/index.html)|
|lava| 1.4.1|[ https://cran.r-project.org/web/packages/lava/index.html]( https://cran.r-project.org/web/packages/lava/index.html)|
|lavaan| 0.5-20|[ https://cran.r-project.org/web/packages/lavaan/index.html]( https://cran.r-project.org/web/packages/lavaan/index.html)|
|lazyeval| 0.1.10|[ https://cran.r-project.org/web/packages/lazyeval/index.html]( https://cran.r-project.org/web/packages/lazyeval/index.html)|
|leaps|2.9|[ https://cran.r-project.org/web/packages/leaps/index.html]( https://cran.r-project.org/web/packages/leaps/index.html)|
|LearnBayes|2.15|[ https://cran.r-project.org/web/packages/LearnBayes/index.html]( https://cran.r-project.org/web/packages/LearnBayes/index.html)|
|LiblineaR| 1.94-2|[ https://cran.r-project.org/web/packages/LiblineaR/index.html]( https://cran.r-project.org/web/packages/LiblineaR/index.html)|
|LICORS| 0.2.0|[ https://cran.r-project.org/web/packages/LICORS/index.html]( https://cran.r-project.org/web/packages/LICORS/index.html)|
|limSolve| 1.5.5.1|[ https://cran.r-project.org/web/packages/limSolve/index.html]( https://cran.r-project.org/web/packages/limSolve/index.html)|
|lme4| 1.1-11|[ https://cran.r-project.org/web/packages/lme4/index.html]( https://cran.r-project.org/web/packages/lme4/index.html)|
|lmm|1|[ https://cran.r-project.org/web/packages/lmm/index.html]( https://cran.r-project.org/web/packages/lmm/index.html)|
|lmtest| 0.9-34|[ https://cran.r-project.org/web/packages/lmtest/index.html]( https://cran.r-project.org/web/packages/lmtest/index.html)|
|locfit| 1.5-9.1|[ https://cran.r-project.org/web/packages/locfit/index.html]( https://cran.r-project.org/web/packages/locfit/index.html)|
|locpol| 0.6-0|[ https://cran.r-project.org/web/packages/locpol/index.html]( https://cran.r-project.org/web/packages/locpol/index.html)|
|LogicReg| 1.5.8|[ https://cran.r-project.org/web/packages/LogicReg/index.html]( https://cran.r-project.org/web/packages/LogicReg/index.html)|
|lsa| 0.73.1|[ https://cran.r-project.org/web/packages/lsa/index.html]( https://cran.r-project.org/web/packages/lsa/index.html)|
|lubridate| 1.5.0|[ https://cran.r-project.org/web/packages/lubridate/index.html]( https://cran.r-project.org/web/packages/lubridate/index.html)|
|magic| 1.5-6|[ https://cran.r-project.org/web/packages/magic/index.html]( https://cran.r-project.org/web/packages/magic/index.html)|
|magrittr|1.5|[ https://cran.r-project.org/web/packages/magrittr/index.html]( https://cran.r-project.org/web/packages/magrittr/index.html)|
|mapdata| 2.2-6|[ https://cran.r-project.org/web/packages/mapdata/index.html]( https://cran.r-project.org/web/packages/mapdata/index.html)|
|mapproj| 1.2-4|[ https://cran.r-project.org/web/packages/mapproj/index.html]( https://cran.r-project.org/web/packages/mapproj/index.html)|
|maps| 3.1.0|[ https://cran.r-project.org/web/packages/maps/index.html]( https://cran.r-project.org/web/packages/maps/index.html)|
|maptree| 1.4-7|[ https://cran.r-project.org/web/packages/maptree/index.html]( https://cran.r-project.org/web/packages/maptree/index.html)|
|MASS| 7.3-45|[ https://cran.r-project.org/web/packages/MASS/index.html]( https://cran.r-project.org/web/packages/MASS/index.html)|
|MasterBayes|2.52|[ https://cran.r-project.org/web/packages/MasterBayes/index.html]( https://cran.r-project.org/web/packages/MasterBayes/index.html)|
|Matrix| 1.2-4|[ https://cran.r-project.org/web/packages/Matrix/index.html]( https://cran.r-project.org/web/packages/Matrix/index.html)|
|matrixcalc| 1.0-3|[ https://cran.r-project.org/web/packages/matrixcalc/index.html]( https://cran.r-project.org/web/packages/matrixcalc/index.html)|
|MatrixModels| 0.4-1|[ https://cran.r-project.org/web/packages/MatrixModels/index.html]( https://cran.r-project.org/web/packages/MatrixModels/index.html)|
|maxent| 1.3.3.1|[ https://cran.r-project.org/web/packages/maxent/index.html]( https://cran.r-project.org/web/packages/maxent/index.html)|
|maxLik| 1.3-4|[ https://cran.r-project.org/web/packages/maxLik/index.html]( https://cran.r-project.org/web/packages/maxLik/index.html)|
|mboost| 2.6-0|[ https://cran.r-project.org/web/packages/mboost/index.html]( https://cran.r-project.org/web/packages/mboost/index.html)|
|mda| 0.4-8|[ https://cran.r-project.org/web/packages/mda/index.html]( https://cran.r-project.org/web/packages/mda/index.html)|
|memoise| 1.0.0|[ https://cran.r-project.org/web/packages/memoise/index.html]( https://cran.r-project.org/web/packages/memoise/index.html)|
|mi|1|[ https://cran.r-project.org/web/packages/mi/index.html]( https://cran.r-project.org/web/packages/mi/index.html)|
|mice|2.25|[ https://cran.r-project.org/web/packages/mice/index.html]( https://cran.r-project.org/web/packages/mice/index.html)|
|microbenchmark| 1.4-2.1|[ https://cran.r-project.org/web/packages/microbenchmark/index.html]( https://cran.r-project.org/web/packages/microbenchmark/index.html)|
|mime|0.4|[ https://cran.r-project.org/web/packages/mime/index.html]( https://cran.r-project.org/web/packages/mime/index.html)|
|misc3d| 0.8-4|[ https://cran.r-project.org/web/packages/misc3d/index.html]( https://cran.r-project.org/web/packages/misc3d/index.html)|
|miscTools| 0.6-16|[ https://cran.r-project.org/web/packages/miscTools/index.html]( https://cran.r-project.org/web/packages/miscTools/index.html)|
|mitools|2.3|[ https://cran.r-project.org/web/packages/mitools/index.html]( https://cran.r-project.org/web/packages/mitools/index.html)|
|mixtools| 1.0.4|[ https://cran.r-project.org/web/packages/mixtools/index.html]( https://cran.r-project.org/web/packages/mixtools/index.html)|
|mlbench| 2.1-1|[ https://cran.r-project.org/web/packages/mlbench/index.html]( https://cran.r-project.org/web/packages/mlbench/index.html)|
|mnormt| 1.5-4|[ https://cran.r-project.org/web/packages/mnormt/index.html]( https://cran.r-project.org/web/packages/mnormt/index.html)|
|MNP| 2.6-4|[ https://cran.r-project.org/web/packages/MNP/index.html]( https://cran.r-project.org/web/packages/MNP/index.html)|
|modeltools| 0.2-21|[ https://cran.r-project.org/web/packages/modeltools/index.html]( https://cran.r-project.org/web/packages/modeltools/index.html)|
|mombf| 1.6.1|[ https://cran.r-project.org/web/packages/mombf/index.html]( https://cran.r-project.org/web/packages/mombf/index.html)|
|monomvn| 1.9-6|[ https://cran.r-project.org/web/packages/monomvn/index.html]( https://cran.r-project.org/web/packages/monomvn/index.html)|
|MSBVAR| 0.9-2|[ https://cran.r-project.org/web/packages/MSBVAR/index.html]( https://cran.r-project.org/web/packages/MSBVAR/index.html)|
|msm| 1.6.1|[ https://cran.r-project.org/web/packages/msm/index.html]( https://cran.r-project.org/web/packages/msm/index.html)|
|multcomp| 1.4-4|[ https://cran.r-project.org/web/packages/multcomp/index.html]( https://cran.r-project.org/web/packages/multcomp/index.html)|
|munsell| 0.4.3|[ https://cran.r-project.org/web/packages/munsell/index.html]( https://cran.r-project.org/web/packages/munsell/index.html)|
|mvtnorm| 1.0-5|[ https://cran.r-project.org/web/packages/mvtnorm/index.html]( https://cran.r-project.org/web/packages/mvtnorm/index.html)|
|NbClust|3|[ https://cran.r-project.org/web/packages/NbClust/index.html]( https://cran.r-project.org/web/packages/NbClust/index.html)|
|ncvreg| 3.5-1|[ https://cran.r-project.org/web/packages/ncvreg/index.html]( https://cran.r-project.org/web/packages/ncvreg/index.html)|
|networkD3|0.2.13|[https://cran.r-project.org/web/packages/networkD3/index.html](https://cran.r-project.org/web/packages/networkD3/index.html)|
|neuralnet|1.33|[https://cran.r-project.org/web/packages/neuralnet/index.html](https://cran.r-project.org/web/packages/neuralnet/index.html)|
|nlme| 3.1-126|[ https://cran.r-project.org/web/packages/nlme/index.html]( https://cran.r-project.org/web/packages/nlme/index.html)|
|nloptr| 1.0.4|[ https://cran.r-project.org/web/packages/nloptr/index.html]( https://cran.r-project.org/web/packages/nloptr/index.html)|
|NLP| 0.1-9|[ https://cran.r-project.org/web/packages/NLP/index.html]( https://cran.r-project.org/web/packages/NLP/index.html)|
|NMF| 0.20.6|[ https://cran.r-project.org/web/packages/NMF/index.html]( https://cran.r-project.org/web/packages/NMF/index.html)|
|nnet| 7.3-12|[ https://cran.r-project.org/web/packages/nnet/index.html]( https://cran.r-project.org/web/packages/nnet/index.html)|
|nnls|1.4|[ https://cran.r-project.org/web/packages/nnls/index.html]( https://cran.r-project.org/web/packages/nnls/index.html)|
|nortest| 1.0-4|[ https://cran.r-project.org/web/packages/nortest/index.html]( https://cran.r-project.org/web/packages/nortest/index.html)|
|numbers| 0.6-1|[ https://cran.r-project.org/web/packages/numbers/index.html]( https://cran.r-project.org/web/packages/numbers/index.html)|
|numDeriv| 2014.2-1|[ https://cran.r-project.org/web/packages/numDeriv/index.html]( https://cran.r-project.org/web/packages/numDeriv/index.html)|
|OutlierDC| 0.3-0|[ https://cran.r-project.org/web/packages/OutlierDC/index.html]( https://cran.r-project.org/web/packages/OutlierDC/index.html)|
|pacbpred| 0.92.2|[ https://cran.r-project.org/web/packages/pacbpred/index.html]( https://cran.r-project.org/web/packages/pacbpred/index.html)|
|party| 1.0-25|[ https://cran.r-project.org/web/packages/party/index.html]( https://cran.r-project.org/web/packages/party/index.html)|
|partykit| 1.0-5|[ https://cran.r-project.org/web/packages/partykit/index.html]( https://cran.r-project.org/web/packages/partykit/index.html)|
|PAWL|0.5|[ https://cran.r-project.org/web/packages/PAWL/index.html]( https://cran.r-project.org/web/packages/PAWL/index.html)|
|pbivnorm| 0.6.0|[ https://cran.r-project.org/web/packages/pbivnorm/index.html]( https://cran.r-project.org/web/packages/pbivnorm/index.html)|
|pcaPP| 1.9-60|[ https://cran.r-project.org/web/packages/pcaPP/index.html]( https://cran.r-project.org/web/packages/pcaPP/index.html)|
|pdc| 1.0.3|[ https://cran.r-project.org/web/packages/pdc/index.html]( https://cran.r-project.org/web/packages/pdc/index.html)|
|PerformanceAnalytics| 1.4.3541|[ https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html]( https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html)|
|Plotly|4.5.6|[https://cran.r-project.org/web/packages/plotly/index.html](https://cran.r-project.org/web/packages/plotly/index.html)|
|plotmo| 3.1.4|[ https://cran.r-project.org/web/packages/plotmo/index.html]( https://cran.r-project.org/web/packages/plotmo/index.html)|
|plotrix| 3.6-1|[ https://cran.r-project.org/web/packages/plotrix/index.html]( https://cran.r-project.org/web/packages/plotrix/index.html)|
|pls| 2.5-0|[ https://cran.r-project.org/web/packages/pls/index.html]( https://cran.r-project.org/web/packages/pls/index.html)|
|plyr| 1.8.3|[ https://cran.r-project.org/web/packages/plyr/index.html]( https://cran.r-project.org/web/packages/plyr/index.html)|
|png| 0.1-7|[ https://cran.r-project.org/web/packages/png/index.html]( https://cran.r-project.org/web/packages/png/index.html)|
|polynom| 1.3-8|[ https://cran.r-project.org/web/packages/polynom/index.html]( https://cran.r-project.org/web/packages/polynom/index.html)|
|predmixcor| 1.1-1|[ https://cran.r-project.org/web/packages/predmixcor/index.html]( https://cran.r-project.org/web/packages/predmixcor/index.html)|
|PresenceAbsence| 1.1.9|[ https://cran.r-project.org/web/packages/PresenceAbsence/index.html]( https://cran.r-project.org/web/packages/PresenceAbsence/index.html)|
|profdpm|3.3|[ https://cran.r-project.org/web/packages/profdpm/index.html]( https://cran.r-project.org/web/packages/profdpm/index.html)|
|proto| 0.3-10|[ https://cran.r-project.org/web/packages/proto/index.html]( https://cran.r-project.org/web/packages/proto/index.html)|
|proxy| 0.4-15|[ https://cran.r-project.org/web/packages/proxy/index.html]( https://cran.r-project.org/web/packages/proxy/index.html)|
|pryr| 0.1.2|[ https://cran.r-project.org/web/packages/pryr/index.html]( https://cran.r-project.org/web/packages/pryr/index.html)|
|pscl| 1.4.9|[ https://cran.r-project.org/web/packages/pscl/index.html]( https://cran.r-project.org/web/packages/pscl/index.html)|
|psych| 1.5.8|[ https://cran.r-project.org/web/packages/psych/index.html]( https://cran.r-project.org/web/packages/psych/index.html)|
|qap| 0.1-0|[ https://cran.r-project.org/web/packages/qap/index.html]( https://cran.r-project.org/web/packages/qap/index.html)|
|qdapRegex| 0.6.0|[ https://cran.r-project.org/web/packages/qdapRegex/index.html]( https://cran.r-project.org/web/packages/qdapRegex/index.html)|
|qcc|2.6|[https://cran.r-project.org/web/packages/qcc/index.html](https://cran.r-project.org/web/packages/qcc/index.html)|
|quadprog| 1.5-5|[ https://cran.r-project.org/web/packages/quadprog/index.html]( https://cran.r-project.org/web/packages/quadprog/index.html)|
|quantreg|5.21|[ https://cran.r-project.org/web/packages/quantreg/index.html]( https://cran.r-project.org/web/packages/quantreg/index.html)|
|qvcalc| 0.9-0|[ https://cran.r-project.org/web/packages/qvcalc/index.html]( https://cran.r-project.org/web/packages/qvcalc/index.html)|
|R.oo| 1.20.0|[ https://cran.r-project.org/web/packages/R.oo/index.html]( https://cran.r-project.org/web/packages/R.oo/index.html)|
|ramps| 0.6-13|[ https://cran.r-project.org/web/packages/ramps/index.html]( https://cran.r-project.org/web/packages/ramps/index.html)|
|RandomFieldsUtils| 0.0.14|[ https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html]( https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html)|
|Rblpapi|0.3.5|[https://cran.r-project.org/web/packages/Rblpapi/index.html](https://cran.r-project.org/web/packages/Rblpapi/index.html)|
|RColorBrewer| 1.1-2|[ https://cran.r-project.org/web/packages/RColorBrewer/index.html]( https://cran.r-project.org/web/packages/RColorBrewer/index.html)|
|Rcpp| 0.12.3|[ https://cran.r-project.org/web/packages/Rcpp/index.html]( https://cran.r-project.org/web/packages/Rcpp/index.html)|
|RcppArmadillo| 0.6.600.4.0|[ https://cran.r-project.org/web/packages/RcppArmadillo/index.html]( https://cran.r-project.org/web/packages/RcppArmadillo/index.html)|
|RcppEigen| 0.3.2.8.1|[ https://cran.r-project.org/web/packages/RcppEigen/index.html]( https://cran.r-project.org/web/packages/RcppEigen/index.html)|
|redmonder|0.2.0|[https://cran.r-project.org/web/packages/Redmonder/index.html](https://cran.r-project.org/web/packages/Redmonder/index.html)|
|registry|0.3|[ https://cran.r-project.org/web/packages/registry/index.html]( https://cran.r-project.org/web/packages/registry/index.html)|
|relimp| 1.0-5|[ https://cran.r-project.org/web/packages/relimp/index.html]( https://cran.r-project.org/web/packages/relimp/index.html)|
|reshape| 0.8.5|[ https://cran.r-project.org/web/packages/reshape/index.html]( https://cran.r-project.org/web/packages/reshape/index.html)|
|reshape2| 1.4.1|[ https://cran.r-project.org/web/packages/reshape2/index.html]( https://cran.r-project.org/web/packages/reshape2/index.html)|
|RGraphics| 2.0-14|[ https://cran.r-project.org/web/packages/RGraphics/index.html]( https://cran.r-project.org/web/packages/RGraphics/index.html)|
|rjson| 0.2.15|[ https://cran.r-project.org/web/packages/rjson/index.html]( https://cran.r-project.org/web/packages/rjson/index.html)|
|RJSONIO| 1.3-0|[ https://cran.r-project.org/web/packages/RJSONIO/index.html]( https://cran.r-project.org/web/packages/RJSONIO/index.html)|
|Rmpfr| 0.6-0|[ https://cran.r-project.org/web/packages/Rmpfr/index.html]( https://cran.r-project.org/web/packages/Rmpfr/index.html)|
|rms| 4.4-2|[ https://cran.r-project.org/web/packages/rms/index.html]( https://cran.r-project.org/web/packages/rms/index.html)|
|robustbase| 0.92-5|[ https://cran.r-project.org/web/packages/robustbase/index.html]( https://cran.r-project.org/web/packages/robustbase/index.html)|
|ROCR| 1.0-7|[ https://cran.r-project.org/web/packages/ROCR/index.html]( https://cran.r-project.org/web/packages/ROCR/index.html)|
|rpart.plot| 1.5.3|[ https://cran.r-project.org/web/packages/rpart.plot/index.html]( https://cran.r-project.org/web/packages/rpart.plot/index.html)|
|rrcov| 1.3-11|[ https://cran.r-project.org/web/packages/rrcov/index.html]( https://cran.r-project.org/web/packages/rrcov/index.html)|
|rscproxy| 2.0-5|[ https://cran.r-project.org/web/packages/rscproxy/index.html]( https://cran.r-project.org/web/packages/rscproxy/index.html)|
|RSGHB| 1.1.2|[ https://cran.r-project.org/web/packages/RSGHB/index.html]( https://cran.r-project.org/web/packages/RSGHB/index.html)|
|RTextTools| 1.4.2|[ https://cran.r-project.org/web/packages/RTextTools/index.html]( https://cran.r-project.org/web/packages/RTextTools/index.html)|
|rworldmap| 1.3-6|[ https://cran.r-project.org/web/packages/rworldmap/index.html]( https://cran.r-project.org/web/packages/rworldmap/index.html)|
|SampleSizeMeans|1.1|[ https://cran.r-project.org/web/packages/SampleSizeMeans/index.html]( https://cran.r-project.org/web/packages/SampleSizeMeans/index.html)|
|SampleSizeProportions|1|[ https://cran.r-project.org/web/packages/SampleSizeProportions/index.html]( https://cran.r-project.org/web/packages/SampleSizeProportions/index.html)|
|sbgcop|0.975|[ https://cran.r-project.org/web/packages/sbgcop/index.html]( https://cran.r-project.org/web/packages/sbgcop/index.html)|
|scales| 0.4.0|[ https://cran.r-project.org/web/packages/scales/index.html]( https://cran.r-project.org/web/packages/scales/index.html)|
|scatterplot3d| 0.3-36|[ https://cran.r-project.org/web/packages/scatterplot3d/index.html]( https://cran.r-project.org/web/packages/scatterplot3d/index.html)|
|sciplot| 1.1-0|[ https://cran.r-project.org/web/packages/sciplot/index.html]( https://cran.r-project.org/web/packages/sciplot/index.html)|
|segmented| 0.5-1.4|[ https://cran.r-project.org/web/packages/segmented/index.html]( https://cran.r-project.org/web/packages/segmented/index.html)|
|seriation| 1.2-0|[ https://cran.r-project.org/web/packages/seriation/index.html]( https://cran.r-project.org/web/packages/seriation/index.html)|
|setRNG| 2013.9-1|[ https://cran.r-project.org/web/packages/setRNG/index.html]( https://cran.r-project.org/web/packages/setRNG/index.html)|
|sfsmisc| 1.1-0|[ https://cran.r-project.org/web/packages/sfsmisc/index.html]( https://cran.r-project.org/web/packages/sfsmisc/index.html)|
|SIS| 0.7-6|[ https://cran.r-project.org/web/packages/SIS/index.html]( https://cran.r-project.org/web/packages/SIS/index.html)|
|SixSigma| 0.9-3|[ https://cran.r-project.org/web/packages/SixSigma/index.html]( https://cran.r-project.org/web/packages/SixSigma/index.html)|
|skmeans| 0.2-8|[ https://cran.r-project.org/web/packages/skmeans/index.html]( https://cran.r-project.org/web/packages/skmeans/index.html)|
|slam| 0.1-32|[ https://cran.r-project.org/web/packages/slam/index.html]( https://cran.r-project.org/web/packages/slam/index.html)|
|smoothSurv|1.6|[ https://cran.r-project.org/web/packages/smoothSurv/index.html]( https://cran.r-project.org/web/packages/smoothSurv/index.html)|
|sna| 2.3-2|[ https://cran.r-project.org/web/packages/sna/index.html]( https://cran.r-project.org/web/packages/sna/index.html)|
|snow| 0.4-1|[ https://cran.r-project.org/web/packages/snow/index.html]( https://cran.r-project.org/web/packages/snow/index.html)|
|SnowballC| 0.5.1|[ https://cran.r-project.org/web/packages/SnowballC/index.html]( https://cran.r-project.org/web/packages/SnowballC/index.html)|
|snowFT| 1.4-0|[ https://cran.r-project.org/web/packages/snowFT/index.html]( https://cran.r-project.org/web/packages/snowFT/index.html)|
|sp| 1.2-2|[ https://cran.r-project.org/web/packages/sp/index.html]( https://cran.r-project.org/web/packages/sp/index.html)|
|spacetime| 1.1-5|[ https://cran.r-project.org/web/packages/spacetime/index.html]( https://cran.r-project.org/web/packages/spacetime/index.html)|
|spam| 1.3-0|[ https://cran.r-project.org/web/packages/spam/index.html]( https://cran.r-project.org/web/packages/spam/index.html)|
|SparseM|1.7|[ https://cran.r-project.org/web/packages/SparseM/index.html]( https://cran.r-project.org/web/packages/SparseM/index.html)|
|spatial| 7.3-11|[ https://cran.r-project.org/web/packages/spatial/index.html]( https://cran.r-project.org/web/packages/spatial/index.html)|
|spBayes| 0.3-9|[ https://cran.r-project.org/web/packages/spBayes/index.html]( https://cran.r-project.org/web/packages/spBayes/index.html)|
|spikeslab| 1.1.5|[ https://cran.r-project.org/web/packages/spikeslab/index.html]( https://cran.r-project.org/web/packages/spikeslab/index.html)|
|splancs| 2.01-38|[ https://cran.r-project.org/web/packages/splancs/index.html]( https://cran.r-project.org/web/packages/splancs/index.html)|
|spls| 2.2-1|[ https://cran.r-project.org/web/packages/spls/index.html]( https://cran.r-project.org/web/packages/spls/index.html)|
|spTimer| 2.0-1|[ https://cran.r-project.org/web/packages/spTimer/index.html]( https://cran.r-project.org/web/packages/spTimer/index.html)|
|sqldf| 0.4-10|[ https://cran.r-project.org/web/packages/sqldf/index.html]( https://cran.r-project.org/web/packages/sqldf/index.html)|
|sROC| 0.1-2|[ https://cran.r-project.org/web/packages/sROC/index.html]( https://cran.r-project.org/web/packages/sROC/index.html)|
|stabledist| 0.7-0|[ https://cran.r-project.org/web/packages/stabledist/index.html]( https://cran.r-project.org/web/packages/stabledist/index.html)|
|stabs| 0.5-1|[ https://cran.r-project.org/web/packages/stabs/index.html]( https://cran.r-project.org/web/packages/stabs/index.html)|
|stepPlr|0.92|[ https://cran.r-project.org/web/packages/stepPlr/index.html]( https://cran.r-project.org/web/packages/stepPlr/index.html)|
|stringdist| 0.9.4.1|[ https://cran.r-project.org/web/packages/stringdist/index.html]( https://cran.r-project.org/web/packages/stringdist/index.html)|
|stringr| 1.0.0|[ https://cran.r-project.org/web/packages/stringr/index.html]( https://cran.r-project.org/web/packages/stringr/index.html)|
|stsm|1.7|[ https://cran.r-project.org/web/packages/stsm/index.html]( https://cran.r-project.org/web/packages/stsm/index.html)|
|stsm.class|1.3|[ https://cran.r-project.org/web/packages/stsm.class/index.html]( https://cran.r-project.org/web/packages/stsm.class/index.html)|
|survival| 2.38-3|[ https://cran.r-project.org/web/packages/survival/index.html]( https://cran.r-project.org/web/packages/survival/index.html)|
|tau| 0.0-18|[ https://cran.r-project.org/web/packages/tau/index.html]( https://cran.r-project.org/web/packages/tau/index.html)|
|tcltk2| 1.2-11|[ https://cran.r-project.org/web/packages/tcltk2/index.html]( https://cran.r-project.org/web/packages/tcltk2/index.html)|
|tensorA|0.36|[ https://cran.r-project.org/web/packages/tensorA/index.html]( https://cran.r-project.org/web/packages/tensorA/index.html)|
|textcat| 1.0-4|[ https://cran.r-project.org/web/packages/textcat/index.html]( https://cran.r-project.org/web/packages/textcat/index.html)|
|textir| 2.0-4|[ https://cran.r-project.org/web/packages/textir/index.html]( https://cran.r-project.org/web/packages/textir/index.html)|
|tfplot| 2015.12-1|[ https://cran.r-project.org/web/packages/tfplot/index.html]( https://cran.r-project.org/web/packages/tfplot/index.html)|
|TH.data| 1.0-7|[ https://cran.r-project.org/web/packages/TH.data/index.html]( https://cran.r-project.org/web/packages/TH.data/index.html)|
|tidyr| 0.4.1|[ https://cran.r-project.org/web/packages/tidyr/index.html]( https://cran.r-project.org/web/packages/tidyr/index.html)|
|timeDate|3012.1|[ https://cran.r-project.org/web/packages/timeDate/index.html]( https://cran.r-project.org/web/packages/timeDate/index.html)|
|timeSeries| 3022.101.2|[ https://cran.r-project.org/web/packages/timeSeries/index.html]( https://cran.r-project.org/web/packages/timeSeries/index.html)|
|tm| 0.6-2|[ https://cran.r-project.org/web/packages/tm/index.html]( https://cran.r-project.org/web/packages/tm/index.html)|
|topicmodels| 0.2-3|[ https://cran.r-project.org/web/packages/topicmodels/index.html]( https://cran.r-project.org/web/packages/topicmodels/index.html)|
|tree| 1.0-37|[ https://cran.r-project.org/web/packages/tree/index.html]( https://cran.r-project.org/web/packages/tree/index.html)|
|Treemap|2.4-2|[https://cran.r-project.org/web/packages/treemap/index.html](https://cran.r-project.org/web/packages/treemap/index.html)|
|tseries| 0.10-34|[ https://cran.r-project.org/web/packages/tseries/index.html]( https://cran.r-project.org/web/packages/tseries/index.html)|
|tsfa| 2014.10-1|[ https://cran.r-project.org/web/packages/tsfa/index.html]( https://cran.r-project.org/web/packages/tsfa/index.html)|
|tsoutliers|0.6|[ https://cran.r-project.org/web/packages/tsoutliers/index.html]( https://cran.r-project.org/web/packages/tsoutliers/index.html)|
|TSP| 1.1-4|[ https://cran.r-project.org/web/packages/TSP/index.html]( https://cran.r-project.org/web/packages/TSP/index.html)|
|vcd| 1.4-1|[ https://cran.r-project.org/web/packages/vcd/index.html]( https://cran.r-project.org/web/packages/vcd/index.html)|
|VennDiagram| 1.6.17|[ https://cran.r-project.org/web/packages/VennDiagram/index.html]( https://cran.r-project.org/web/packages/VennDiagram/index.html)|
|VGAM| 1.0-1|[ https://cran.r-project.org/web/packages/VGAM/index.html]( https://cran.r-project.org/web/packages/VGAM/index.html)|
|VIM| 4.4.1|[ https://cran.r-project.org/web/packages/VIM/index.html]( https://cran.r-project.org/web/packages/VIM/index.html)|
|whisker| 0.3-2|[ https://cran.r-project.org/web/packages/whisker/index.html]( https://cran.r-project.org/web/packages/whisker/index.html)|
|wordcloud|2.5|[ https://cran.r-project.org/web/packages/wordcloud/index.html]( https://cran.r-project.org/web/packages/wordcloud/index.html)|
|xgboost| 0.4-3|[ https://cran.r-project.org/web/packages/xgboost/index.html]( https://cran.r-project.org/web/packages/xgboost/index.html)|
|XML| 3.98-1.4|[ https://cran.r-project.org/web/packages/XML/index.html]( https://cran.r-project.org/web/packages/XML/index.html)|
|xts| 0.9-7|[ https://cran.r-project.org/web/packages/xts/index.html]( https://cran.r-project.org/web/packages/xts/index.html)|
|yaml| 2.1.13|[ https://cran.r-project.org/web/packages/yaml/index.html]( https://cran.r-project.org/web/packages/yaml/index.html)|
|zipfR| 0.6-6|[ https://cran.r-project.org/web/packages/zipfR/index.html]( https://cran.r-project.org/web/packages/zipfR/index.html)|
|zoo| 1.7-12|[ https://cran.r-project.org/web/packages/zoo/index.html]( https://cran.r-project.org/web/packages/zoo/index.html)|
