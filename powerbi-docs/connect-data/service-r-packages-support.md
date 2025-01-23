---
title: Learn which R packages are supported
description: You can use the powerful R programming language to create visuals in the Power BI service. Learn about which R packages are supported.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: powerbi-ai
ms.topic: how-to
ms.date: 1/16/2025
LocalizationGroup: Connect to data
---

# Create visuals by using R packages in the Power BI service

You can use the powerful [R programming language](https://www.r-project.org/) to create visuals in the Power BI service. The Power BI service supports almost thousand packages.  

The following sections provide an alphabetical table of which R packages are supported in Power BI, and which aren't. For more information about R in Power BI, see the [R visuals](../visuals/service-r-visuals.md) article.

## Requirements and limitations of R packages

* The Power BI service supports R packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* The Power BI service supports packages published in the Comprehensive R Archive Network (CRAN). The service doesn't support private or custom R packages. Users are encouraged to make their private packages available on CRAN prior to requesting the package be available in the Power BI service.
* The Power BI Desktop has two variations for R packages:
  * For R visuals, you can install any package, including custom R packages
  * For Custom R visuals, only public CRAN packages are supported for autoinstallation of the packages
* For security and privacy reasons, R packages that provide client-server queries over the web, such as *RgoogleMaps*, in the service, aren't supported. Networking is blocked for such attempts. See the following section for a list of supported and unsupported R packages.
* The approval process for including a new R package has a tree of dependencies. Some dependencies required to be installed in the service can't be supported.

### For reports in Premium/Fabric backed workspaces
* Current R runtime: R 4.3.3

## R packages that are supported in Power BI (Premium/Fabric backed workspaces)

The following packages are supported.[Download] (https://cran.r-project.org/): 

| Package               | Version     |
|-----------------------|-------------|
| abc                   | 2.2.1       |
| abc.data              | 1.1         |
| abind                 | 1.4-5       |
| acepack               | 1.4.2       |
| actuar                | 3.3-4       |
| ade4                  | 1.7-22      |
| adegenet              | 2.1.10      |
| AdMit                 | 2.1.9       |
| AER                   | 1.2-13      |
| agricolae             | 1.3-7       |
| AlgDesign             | 1.2.1       |
| alluvial              | 0.1-2       |
| andrews               | 1.1.2       |
| anomalize             | 0.3.0       |
| anytime               | 0.3.9       |
| aod                   | 1.3.3       |
| apcluster             | 1.4.13      |
| ape                   | 5.8         |
| aplpack               | 1.3.5       |
| approximator          | 1.2-8       |
| arm                   | 1.14-4      |
| arsenal               | 3.6.3       |
| arules                | 1.7-8       |
| arulesViz             | 1.5.3       |
| ash                   | 1.0-15      |
| askpass               | 1.2.0       |
| assertthat            | 0.2.1       |
| audio                 | 0.1-11      |
| autocogs              | 0.1.4       |
| automap               | 1.1-12      |
| aweek                 | 1.0.3       |
| BACCO                 | 2.1-0       |
| backports             | 1.5.0       |
| BaM                   | 1.0.3       |
| BAS                   | 1.7.1       |
| base64                | 2.0.1       |
| base64enc             | 0.1-3       |
| BayesDA               | 2012.04-1   |
| BayesFactor           | 0.9.12-4.7  |
| bayesGARCH            | 2.1.10      |
| bayesm                | 3.1-6       |
| bayesmix              | 0.7-6       |
| bayesplot             | 1.11.1      |
| bayesQR               | 2.4         |
| bayesSurv             | 3.7         |
| bayestestR            | 0.14.0      |
| BayesTree             | 0.3-1.5     |
| BayesX                | 0.3-3       |
| BCBCSF                | 1.0-1       |
| BDgraph               | 2.73        |
| beanplot              | 1.3.1       |
| beepr                 | 2           |
| beeswarm              | 0.4.0       |
| benford.analysis      | 0.1.5       |
| BenfordTests          | 1.2.0       |
| bfp                   | 0.0-48      |
| BH                    | 1.84.0-0    |
| bibtex                | 0.5.1       |
| biglm                 | 0.9-3       |
| bindr                 | 0.1.1       |
| bindrcpp              | 0.2.3       |
| binom                 | 1.1-1.1     |
| BiocManager           | 1.30.25     |
| bit                   | 4.0.5       |
| bit64                 | 4.0.5       |
| bitops                | 1.0-8       |
| bizdays               | 1.0.16      |
| blandr                | 0.6.0       |
| blme                  | 1.0-5       |
| blob                  | 1.2.4       |
| BLR                   | 1.6         |
| BMA                   | 3.18.17     |
| bmp                   | 0.3         |
| BMS                   | 0.3.5       |
| bnlearn               | 4.8.3       |
| boa                   | 1.1.8-2     |
| BoolNet               | 2.1.9       |
| Boom                  | 0.9.15      |
| BoomSpikeSlab         | 1.2.6       |
| boot                  | 1.3-31      |
| bootstrap             | 2019.6      |
| Boruta                | 8.0.0       |
| bqtl                  | 1.0-36      |
| BradleyTerry2         | 1.1-2       |
| brew                  | 1.0-10      |
| brglm                 | 0.7.2       |
| brio                  | 1.1.5       |
| broom                 | 1.0.6       |
| broom.helpers         | 1.17.0      |
| broom.mixed           | 0.2.9.5     |
| bslib                 | 0.8.0       |
| bspec                 | 1.6         |
| bspmma                | 0.1-2       |
| bsts                  | 0.9.10      |
| bupaR                 | 0.5.4       |
| C50                   | 0.1.8       |
| ca                    | 0.71.1      |
| cachem                | 1.1.0       |
| Cairo                 | 1.6-2       |
| cairoDevice           | 2.28.2.2    |
| calibrate             | 1.7.7       |
| calibrator            | 1.2-8       |
| callr                 | 3.7.6       |
| car                   | 3.1-2       |
| carData               | 3.0-5       |
| cards                 | 0.2.2       |
| caret                 | 6.0-94      |
| catnet                | 1.16.1      |
| caTools               | 1.18.3      |
| cclust                | 0.6-26      |
| cellranger            | 1.1.0       |
| ChainLadder           | 0.2.19      |
| changepoint           | 2.2.4       |
| checkmate             | 2.3.2       |
| checkpoint            | 1.0.2       |
| chk                   | 0.9.2       |
| choroplethrMaps       | 1.0.1       |
| chron                 | 2.3-61      |
| circlize              | 0.4.16      |
| Ckmeans.1d.dp         | 4.3.5       |
| class                 | 7.3-22      |
| classInt              | 0.4-10      |
| cli                   | 3.6.3       |
| ClickClust            | 1.1.6       |
| clickstream           | 1.3.3       |
| clipr                 | 0.8.0       |
| clock                 | 0.7.1       |
| clue                  | 0.3-65      |
| cluster               | 2.1.6       |
| clv                   | 0.3-2.4     |
| cmprsk                | 2.2-12      |
| coda                  | 0.19-4.1    |
| codetools             | 0.2-20      |
| coefplot              | 1.2.8       |
| coin                  | 1.4-3       |
| collapsibleTree       | 0.1.8       |
| colorRamps            | 2.3.4       |
| colorspace            | 2.1-1       |
| colourpicker          | 1.3.0       |
| colourvalues          | 0.3.9       |
| combinat              | 0.0-8       |
| commonmark            | 1.9.1       |
| compositions          | 2.0-8       |
| CompQuadForm          | 1.4.3       |
| confintr              | 1.0.2       |
| conflicted            | 1.2.0       |
| conquer               | 1.3.3       |
| contfrac              | 1.1-12      |
| CORElearn             | 1.57.3      |
| corpcor               | 1.6.10      |
| corrgram              | 1.14        |
| corrplot              | 0.94        |
| covr                  | 3.6.4       |
| cowplot               | 1.1.3       |
| cplm                  | 0.7-12      |
| cpp11                 | 0.5.0       |
| crayon                | 1.5.2       |
| credentials           | 2.0.1       |
| crosstalk             | 1.2.1       |
| crul                  | 1.5.0       |
| ctv                   | 0.9-5       |
| cubature              | 2.0.4.6     |
| Cubist                | 0.4.4       |
| curl                  | 5.2.1       |
| cvar                  | 0.5         |
| CVST                  | 0.2-3       |
| cvTools               | 0.3.3       |
| d3heatmap             | 0.6.1.2     |
| d3Network             | 0.5.2.1     |
| d3r                   | 1.1.0       |
| data.table            | 1.15.4      |
| data.tree             | 1.1.0       |
| datasauRus            | 0.1.8       |
| datawizard            | 0.12.3      |
| date                  | 1.2-42      |
| DBI                   | 1.2.3       |
| dbplyr                | 2.5.0       |
| dbscan                | 1.2-0       |
| dclone                | 2.3-2       |
| dcurver               | 0.9.2       |
| ddalpha               | 1.3.15      |
| deal                  | 1.2-42      |
| debugme               | 1.2.0       |
| decido                | 0.3.0       |
| deepnet               | 0.2.1       |
| deldir                | 2.0-4       |
| dendextend            | 1.17.1      |
| DEoptimR              | 1.1-3       |
| Deriv                 | 4.1.3       |
| desc                  | 1.4.3       |
| descr                 | 1.1.8       |
| deSolve               | 1.4         |
| devtools              | 2.4.5       |
| diagram               | 1.6.5       |
| DiagrammeR            | 1.0.11      |
| DiagrammeRsvg         | 0.1         |
| dials                 | 1.3.0       |
| DiceDesign            | 1.1         |
| dichromat             | 2.0-0.1     |
| diffobj               | 0.3.5       |
| digest                | 0.6.33      |
| dimRed                | 0.2.6       |
| diptest               | 0.77-1      |
| distcrete             | 1.0.3       |
| distributional        | 0.4.0       |
| DistributionUtils     | 0.6-1       |
| distrom               | 1.0.1       |
| dlm                   | 1.1-6       |
| DMwR                  | 0.4.1       |
| doBy                  | 4.6.22      |
| doFuture              | 1.0.1       |
| doParallel            | 1.0.17      |
| doSNOW                | 1.0.20      |
| dotCall64             | 1.1-1       |
| downlit               | 0.4.4       |
| downloader            | 0.4         |
| dplyr                 | 1.1.4       |
| DRR                   | 0.0.4       |
| dse                   | 2020.2-1    |
| DT                    | 0.33        |
| dtplyr                | 1.3.1       |
| dtt                   | 0.1-2       |
| dtw                   | 1.23-1      |
| dygraphs              | 1.1.1.6     |
| dynlm                 | 0.3-6       |
| e1071                 | 1.7-14      |
| earth                 | 5.3.3       |
| EbayesThresh          | 1.4-12      |
| ebdbNet               | 1.2.8       |
| ecm                   | 7.2.0       |
| edeaR                 | 0.9.4       |
| effects               | 4.2-2       |
| effectsize            | 0.8.9       |
| egg                   | 0.4.5       |
| ellipse               | 0.5.0       |
| ellipsis              | 0.3.2       |
| elliptic              | 1.4-0       |
| emmeans               | 1.10.4      |
| emulator              | 1.2-24      |
| energy                | 1.7-12      |
| english               | 1.2-6       |
| ensembleBMA           | 5.1.8       |
| entropy               | 1.3.1       |
| epitools              | 0.5-10.1    |
| epitrix               | 0.4.0       |
| estimability          | 1.5         |
| eulerr                | 7.0.2       |
| evaluate              | 0.22        |
| evd                   | 2.3-7       |
| evdbayes              | 1.1-3       |
| eventdataR            | 0.3.1       |
| exactRankTests        | 0.8-35      |
| expint                | 0.1-8       |
| expm                  | 1.0-0       |
| extraDistr            | 1.10.0      |
| extrafont             | 0.19        |
| extrafontdb           | 1           |
| extremevalues         | 2.3.4       |
| ez                    | 4.4-0       |
| factoextra            | 1.0.7       |
| FactoMineR            | 2.11        |
| fansi                 | 1.0.5       |
| faoutlier             | 0.7.6       |
| farver                | 2.1.2       |
| fastICA               | 1.2-5.1     |
| fastmap               | 1.2.0       |
| fastmatch             | 1.1-4       |
| fBasics               | 4041.97     |
| fda                   | 6.1.8       |
| fdrtool               | 1.2.18      |
| fds                   | 1.8         |
| fGarch                | 4033.92     |
| fields                | 16.2        |
| filehash              | 2.4-6       |
| filelock              | 1.0.3       |
| FinCal                | 0.6.3       |
| fitdistrplus          | 1.2-1       |
| flashClust            | 1.01-2      |
| flexclust             | 1.4-2       |
| flexmix               | 2.3-19      |
| float                 | 0.3-2       |
| FME                   | 1.3.6.3     |
| fmsb                  | 0.7.6       |
| FNN                   | 1.1.4       |
| fontawesome           | 0.5.2       |
| fontBitstreamVera     | 0.1.1       |
| fontLiberation        | 0.1.0       |
| fontquiver            | 0.2.1       |
| forcats               | 1.0.0       |
| foreach               | 1.5.2       |
| forecast              | 8.23.0      |
| forecastHybrid        | 5.0.19      |
| foreign               | 0.8-87      |
| formatR               | 1.14        |
| formattable           | 0.2.1       |
| Formula               | 1.2-5       |
| fpc                   | 2.2-12      |
| fracdiff              | 1.5-3       |
| fs                    | 1.6.4       |
| fTrading              | 3042.79     |
| fUnitRoots            | 4040.81     |
| furrr                 | 0.3.1       |
| futile.logger         | 1.4.3       |
| futile.options        | 1.0.1       |
| future                | 1.34.0      |
| future.apply          | 1.11.2      |
| gam                   | 1.22-4      |
| gamlr                 | 1.13-8      |
| gamlss                | 5.4-22      |
| gamlss.data           | 6.0-6       |
| gamlss.dist           | 6.1-1       |
| gargle                | 1.5.2       |
| gbm                   | 2.2.2       |
| gbRd                  | 0.4.12      |
| gbutils               | 0.5         |
| gclus                 | 1.3.2       |
| gdalUtils             | 2.0.3.2     |
| gdata                 | 3.0.0       |
| gdtools               | 0.4.0       |
| gee                   | 4.13-27     |
| genalg                | 0.2.1       |
| generics              | 0.1.3       |
| genetics              | 1.3.8.1.3   |
| GenSA                 | 1.1.14      |
| geojson               | 0.3.5       |
| geojsonio             | 0.11.3      |
| geojsonlint           | 0.4.0       |
| geojsonsf             | 2.0.3       |
| geometries            | 0.2.4       |
| geometry              | 0.4.7       |
| geoR                  | 1.9-4       |
| geosphere             | 1.5-18      |
| gert                  | 2.1.1       |
| gfonts                | 0.2.0       |
| GGally                | 2.2.1       |
| ggalt                 | 0.4.0       |
| gganimate             | 1.0.9       |
| ggcorrplot            | 0.1.4.1     |
| ggdendro              | 0.2.0       |
| ggeffects             | 1.7.1       |
| ggExtra               | 0.10.1      |
| ggfittext             | 0.10.2      |
| ggforce               | 0.4.2       |
| ggformula             | 0.12.0      |
| ggfortify             | 0.4.17      |
| ggfun                 | 0.1.6       |
| gghighlight           | 0.4.1       |
| ggimage               | 0.3.3       |
| ggiraph               | 0.8.10      |
| ggjoy                 | 0.4.1       |
| ggm                   | 2.3         |
| ggmap                 | 4.0.0       |
| ggmcmc                | 1.5.1.1     |
| ggplot2               | 3.5.1       |
| ggplot2movies         | 0.0.1       |
| ggplotify             | 0.1.2       |
| ggpmisc               | 0.6.0       |
| ggpp                  | 0.5.8-1     |
| ggpubr                | 0.6.0       |
| ggQC                  | 0.0.31      |
| ggRandomForests       | 2.2.1       |
| ggraph                | 2.2.1       |
| ggrepel               | 0.9.5       |
| ggridges              | 0.5.6       |
| ggsci                 | 3.2.0       |
| ggsignif              | 0.6.4       |
| ggsoccer              | 0.1.7       |
| ggstance              | 0.3.7       |
| ggstats               | 0.6.0       |
| ggtern                | 3.5.0       |
| ggtext                | 0.1.2       |
| ggthemes              | 5.1.0       |
| gh                    | 1.4.1       |
| gistr                 | 0.9.0       |
| git2r                 | 0.33.0      |
| gitcreds              | 0.1.2       |
| glasso                | 1.11        |
| glmmTMB               | 1.1.9       |
| glmnet                | 4.1-8       |
| GlobalOptions         | 0.1.2       |
| globals               | 0.16.3      |
| glue                  | 1.6.2       |
| gmodels               | 2.19.1      |
| gmp                   | 0.7-5       |
| gnm                   | 1.1-5       |
| goftest               | 1.2-3       |
| googledrive           | 2.1.1       |
| googlePolylines       | 0.8.4       |
| googlesheets4         | 1.1.1       |
| googleVis             | 0.7.3       |
| gower                 | 1.0.1       |
| GPArotation           | 2024.3-1    |
| GPfit                 | 1.0-8       |
| gplots                | 3.1.3.1     |
| graphlayouts          | 1.1.1       |
| greybox               | 2.0.2       |
| grid                  | 4.3.3       |
| gridBase              | 0.4-7       |
| gridExtra             | 2.3         |
| gridGraphics          | 0.5-1       |
| gridSVG               | 1.7-5       |
| gridtext              | 0.1.5       |
| grImport              | 0.9-7       |
| grImport2             | 0.3-3       |
| grpreg                | 3.5.0       |
| gsl                   | 2.1-8       |
| gss                   | 2.2-7       |
| gstat                 | 2.1-2       |
| gsubfn                | 0.7         |
| gtable                | 0.3.5       |
| gtools                | 3.9.5       |
| gtrendsR              | 1.5.1       |
| gWidgets              | 0.0-54.2    |
| gWidgets2             | 1.0-9       |
| gWidgets2tcltk        | 1.0-8       |
| gWidgetsRGtk2         | 0.0-86.1    |
| gWidgetstcltk         | 0.0-55.1    |
| haplo.stats           | 1.9.5.1     |
| hardhat               | 1.4.0       |
| hash                  | 2.2.6.3     |
| haven                 | 2.5.4       |
| hbsae                 | 1.2         |
| HDInterval            | 0.2.4       |
| hdrcde                | 3.4         |
| heatmaply             | 1.5.0       |
| here                  | 1.0.1       |
| hexbin                | 1.28.4      |
| hflights              | 0.1         |
| HH                    | 3.1-52      |
| highcharter           | 0.9.4       |
| highr                 | 0.11        |
| HistData              | 0.9-1       |
| Hmisc                 | 5.1-3       |
| hms                   | 1.1.3       |
| hoardr                | 0.5.4       |
| hrbrthemes            | 0.8.7       |
| HSAUR                 | 1.3-10      |
| htmlTable             | 2.4.3       |
| htmltools             | 0.5.8.1     |
| htmlwidgets           | 1.6.4       |
| hts                   | 6.0.3       |
| httpcode              | 0.3.0       |
| httpuv                | 1.6.15      |
| httr                  | 1.4.7       |
| httr2                 | 1.0.3       |
| huge                  | 1.3.5       |
| hunspell              | 3.0.4       |
| hydroTSM              | 0.7-0       |
| hypergeo              | 1.2-13      |
| IBrokers              | 0.10-2      |
| ids                   | 1.0.1       |
| ifultools             | 2.0-26      |
| igraph                | 2.0.3       |
| imager                | 1.0.2       |
| imputeTS              | 3.3         |
| incidence             | 1.7.5       |
| infer                 | 1.0.7       |
| influenceR            | 0.1.5       |
| ini                   | 0.3.1       |
| inline                | 0.3.19      |
| insight               | 0.20.4      |
| interp                | 1.1-6       |
| intervals             | 0.15.5      |
| inum                  | 1.0-5       |
| investr               | 1.4.2       |
| ipred                 | 0.9-15      |
| IRdisplay             | 1.1         |
| IRkernel              | 1.3.2       |
| irlba                 | 2.3.5.1     |
| irr                   | 0.84.1      |
| isoband               | 0.2.7       |
| ISOcodes              | 2024.02.12  |
| iterators             | 1.0.14      |
| janeaustenr           | 1.0.0       |
| janitor               | 2.2.0       |
| jmvcore               | 2.4.7       |
| jomo                  | 2.7-6       |
| jpeg                  | 0.1-10      |
| jqr                   | 1.3.4       |
| jquerylib             | 0.1.4       |
| jsonify               | 1.2.2       |
| jsonlite              | 1.8.7       |
| jsonvalidate          | 1.3.2       |
| jtools                | 2.3.0       |
| kableExtra            | 1.4.0       |
| Kendall               | 2.2.1       |
| kernlab               | 0.9-33      |
| KernSmooth            | 2.23-24     |
| kinship2              | 1.9.6.1     |
| kknn                  | 1.3.1       |
| klaR                  | 1.7-3       |
| km.ci                 | 0.5-6       |
| KMsurv                | 0.1-5       |
| knitr                 | 1.48        |
| ks                    | 1.14.2      |
| labeling              | 0.4.3       |
| labelled              | 2.13.0      |
| laeken                | 0.5.3       |
| Lahman                | 11.0-0      |
| lambda.r              | 1.2.4       |
| lars                  | 1.3         |
| later                 | 1.3.2       |
| latex2exp             | 0.9.6       |
| lattice               | 0.22-6      |
| latticeExtra          | 0.6-30      |
| lava                  | 1.8.0       |
| lavaan                | 0.6-18      |
| lazyeval              | 0.2.2       |
| lda                   | 1.5.2       |
| leafem                | 0.2.3       |
| leaflet               | 2.2.2       |
| leaflet.esri          | 1.0.0       |
| leaflet.extras        | 2.0.1       |
| leaflet.providers     | 2.0.0       |
| leafpop               | 0.1.0       |
| leafsync              | 0.1.0       |
| leaps                 | 3.2         |
| LearnBayes            | 2.15.1      |
| lexicon               | 1.2.1       |
| lgr                   | 0.4.4       |
| lhs                   | 1.2.0       |
| libcoin               | 1.0-10      |
| LiblineaR             | 2.10-23     |
| LICORS                | 0.2.0       |
| lifecycle             | 1.0.3       |
| likert                | 1.3.5       |
| limSolve              | 1.5.7.1     |
| linelist              | 1.1.4       |
| linprog               | 0.9-4       |
| listenv               | 0.9.1       |
| lm.beta               | 1.7-2       |
| lme4                  | 1.1-35.5    |
| lmm                   | 1.4         |
| lmodel2               | 1.7-3       |
| lmtest                | 0.9-40      |
| lobstr                | 1.1.2       |
| locfit                | 1.5-9.9     |
| locpol                | 0.8.0       |
| LogicReg              | 1.6.6       |
| loo                   | 2.8.0       |
| lpSolve               | 5.6.20      |
| lsa                   | 0.73.3      |
| lsmeans               | 2.30-0      |
| lubridate             | 1.9.3       |
| lwgeom                | 0.2-14      |
| magic                 | 1.6-1       |
| magick                | 2.8.4       |
| magrittr              | 2.0.3       |
| manipulateWidget      | 0.11.1      |
| MAPA                  | 2.0.7       |
| mapdata               | 2.3.1       |
| mapdeck               | 0.3.5       |
| mapproj               | 1.2.11      |
| maps                  | 3.4.2       |
| maptools              | 1.1-8       |
| maptree               | 1.4-8       |
| mapview               | 2.11.2      |
| marima                | 2.2         |
| markdown              | 1.13        |
| MASS                  | 7.3-60.0.1  |
| Matching              | 4.10-14     |
| MatchIt               | 4.5.5       |
| matchmaker            | 0.1.1       |
| mathjaxr              | 1.6-0       |
| Matrix                | 1.6-5       |
| matrixcalc            | 1.0-6       |
| MatrixExtra           | 0.1.15      |
| MatrixModels          | 0.5-3       |
| matrixStats           | 1.4.0       |
| maxLik                | 1.5-2.1     |
| maxstat               | 0.7-25      |
| mboost                | 2.9-11      |
| mclust                | 6.1.1       |
| mcmc                  | 0.9-8       |
| MCMCglmm              | 2.36        |
| MCMCpack              | 1.7-1       |
| mda                   | 0.5-4       |
| memoise               | 2.0.1       |
| merTools              | 0.6.2       |
| meta                  | 7.0-0       |
| metadat               | 1.2-0       |
| metafor               | 4.6-0       |
| mgcv                  | 1.9-1       |
| mgsub                 | 1.7.3       |
| mi                    | 1.1         |
| mice                  | 3.16.0      |
| microbenchmark        | 1.5.0       |
| mime                  | 0.12        |
| miniCRAN              | 0.3.0       |
| miniUI                | 0.1.1.1     |
| minpack.lm            | 1.2-4       |
| minqa                 | 1.2.8       |
| mirt                  | 1.41        |
| misc3d                | 0.9-1       |
| miscTools             | 0.6-28      |
| mitml                 | 0.4-5       |
| mitools               | 2.4         |
| mixtools              | 2.0.0       |
| mlapi                 | 0.1.1       |
| mlbench               | 2.1-5       |
| mlogitBMA             | 0.1-7       |
| mnormt                | 2.1.1       |
| MNP                   | 3.1-5       |
| modeldata             | 1.4.0       |
| modelenv              | 0.1.1       |
| ModelMetrics          | 1.2.2.2     |
| modelr                | 0.1.11      |
| modeltools            | 0.2-23      |
| mombf                 | 3.5.4       |
| moments               | 0.14.1      |
| monomvn               | 1.9-20      |
| monreg                | 0.1.4.1     |
| mosaic                | 1.9.1       |
| mosaicCore            | 0.9.4.0     |
| mosaicData            | 0.20.4      |
| msir                  | 1.3.3       |
| msm                   | 1.7.1       |
| multcomp              | 1.4-26      |
| multcompView          | 0.1-10      |
| multicool             | 1.0.1       |
| munsell               | 0.5.1       |
| mvoutlier             | 2.1.1       |
| mvtnorm               | 1.3-1       |
| NADA                  | 1.6-1.1     |
| nanoparquet           | 0.3.1       |
| NbClust               | 3.0.1       |
| ncvreg                | 3.14.3      |
| network               | 1.18.2      |
| networkD3             | 0.4         |
| neuralnet             | 1.44.2      |
| ngram                 | 3.2.3       |
| nlme                  | 3.1-165     |
| nloptr                | 2.1.1       |
| NLP                   | 0.3-0       |
| nls.multstart         | 1.3.0       |
| NMF                   | 0.21.0      |
| nnet                  | 7.3-19      |
| nnls                  | 1.5         |
| nortest               | 1.0-4       |
| numbers               | 0.8-5       |
| numDeriv              | 2016.8-1.1  |
| numform               | 0.7.0       |
| OceanView             | 1.0.7       |
| openair               | 2.18-2      |
| openssl               | 2.2.1       |
| ordinal               | 2023.12-4.1 |
| osmar                 | 1.1-7       |
| outbreaks             | 1.9.0       |
| outliers              | 0.15        |
| packcircles           | 0.3.6       |
| padr                  | 0.6.2       |
| pan                   | 1.9         |
| pander                | 0.6.5       |
| parallelly            | 1.38.0      |
| parameters            | 0.22.2      |
| parsnip               | 1.2.1       |
| partitions            | 1.10-7      |
| party                 | 1.3-17      |
| partykit              | 1.2-22      |
| patchwork             | 1.2.0       |
| pbapply               | 1.7-2       |
| pbdZMQ                | 0.3-10      |
| pbivnorm              | 0.6.0       |
| pbkrtest              | 0.5.3       |
| PCAmixdata            | 3.1         |
| pcaPP                 | 2.0-5       |
| pdc                   | 1.0.3       |
| pegas                 | 1.3         |
| performance           | 0.12.3      |
| PerformanceAnalytics  | 2.0.4       |
| permute               | 0.9-7       |
| perry                 | 0.3.1       |
| petrinetR             | 0.3.0       |
| pheatmap              | 1.0.12      |
| pillar                | 1.9.0       |
| pixmap                | 0.4-13      |
| pkgbuild              | 1.4.4       |
| pkgcache              | 2.2.2       |
| pkgconfig             | 2.0.3       |
| pkgdepends            | 0.7.2       |
| pkgdown               | 2.1.0       |
| pkgload               | 1.4.0       |
| pkgmaker              | 0.32.10     |
| platetools            | 0.1.7       |
| plogr                 | 0.2.0       |
| plot3D                | 1.4.1       |
| plot3Drgl             | 1.0.4       |
| plotly                | 4.10.4      |
| plotmo                | 3.6.4       |
| plotrix               | 3.8-4       |
| pls                   | 2.8-4       |
| plyr                  | 1.8.9       |
| png                   | 0.1-8       |
| polspline             | 1.1.25      |
| polyclip              | 1.10-7      |
| polylabelr            | 0.2.0       |
| polynom               | 1.4-1       |
| posterior             | 1.6.0       |
| ppcor                 | 1.1         |
| prabclus              | 2.3-3       |
| pracma                | 2.4.4       |
| praise                | 1.0.0       |
| precrec               | 0.14.4      |
| prediction            | 0.3.18      |
| PresenceAbsence       | 1.1.11      |
| prettyunits           | 1.2.0       |
| pROC                  | 1.18.5      |
| processmapR           | 0.5.5       |
| processmonitR         | 0.1.0       |
| processx              | 3.8.4       |
| prodlim               | 2024.06.25  |
| profileModel          | 0.6.1       |
| profvis               | 0.3.8       |
| progress              | 1.2.3       |
| progressr             | 0.14.0      |
| proj4                 | 1.0-14      |
| promises              | 1.3.0       |
| prophet               | 1           |
| proto                 | 1.0.0       |
| protolite             | 2.3.0       |
| proxy                 | 0.4-27      |
| pryr                  | 0.1.6       |
| ps                    | 1.7.7       |
| pscl                  | 1.5.9       |
| psych                 | 2.4.3       |
| purrr                 | 1.0.2       |
| pwr                   | 1.3-0       |
| qap                   | 0.1-2       |
| qcc                   | 2.7         |
| qdapDictionaries      | 1.0.7       |
| qdapRegex             | 0.7.8       |
| qdapTools             | 1.3.7       |
| qgraph                | 1.9.8       |
| qicharts              | 0.5.8       |
| qicharts2             | 0.7.5       |
| quadprog              | 1.5-8       |
| quanteda              | 3.3.1       |
| quantmod              | 0.4.26      |
| quantreg              | 5.98        |
| questionr             | 0.7.8       |
| QuickJSR              | 1.3.1       |
| qvcalc                | 1.0.3       |
| R.cache               | 0.16.0      |
| R.matlab              | 3.7.0       |
| R.methodsS3           | 1.8.2       |
| R.oo                  | 1.26.0      |
| R.utils               | 2.12.3      |
| r2d3                  | 0.2.6       |
| R2HTML                | 2.3.4       |
| R2jags                | 0.8-5       |
| R2OpenBUGS            | 3.2-3.2.1   |
| R2WinBUGS             | 2.1-22.1    |
| R6                    | 2.5.1       |
| ragg                  | 1.3.2       |
| rainbow               | 3.8         |
| ramps                 | 0.6.18      |
| RandomFields          | 3.3.14      |
| RandomFieldsUtils     | 1.2.5       |
| randomForest          | 4.7-1.1     |
| randomForestSRC       | 3.3.1       |
| ranger                | 0.16.0      |
| RApiDatetime          | 0.0.9       |
| rapidjsonr            | 1.2.0       |
| rappdirs              | 0.3.3       |
| raster                | 3.6-26      |
| rattle                | 5.5.1       |
| rayimage              | 0.10.0      |
| rayshader             | 0.24.10     |
| rayvertex             | 0.11.4      |
| rbenchmark            | 1.0.0       |
| rbibutils             | 2.2.16      |
| Rblpapi               | 0.3.14      |
| rbokeh                | 0.5.2       |
| rcmdcheck             | 1.4.0       |
| RColorBrewer          | 1.1-3       |
| Rcpp                  | 1.0.13      |
| RcppArmadillo         | 14.0.0-1    |
| RcppDE                | 0.1.7       |
| RcppEigen             | 0.3.4.0.2   |
| RcppExamples          | 0.1.9       |
| RcppParallel          | 5.1.9       |
| RcppProgress          | 0.4.2       |
| RcppRoll              | 0.3.1       |
| RcppThread            | 2.1.7       |
| RcppTOML              | 0.2.2       |
| RCurl                 | 1.98-1.16   |
| Rdpack                | 2.6.1       |
| readbitmap            | 0.1.5       |
| readr                 | 2.1.5       |
| readxl                | 1.4.3       |
| recipes               | 1.1.0       |
| Redmonder             | 0.2.0       |
| registry              | 0.5-1       |
| relaimpo              | 2.2-7       |
| relimp                | 1.0-5       |
| rematch               | 2.0.0       |
| rematch2              | 2.1.2       |
| remotes               | 2.5.0       |
| Renext                | 3.1-4       |
| repr                  | 1.1.6       |
| reprex                | 2.1.1       |
| reshape               | 0.8.9       |
| reshape2              | 1.4.4       |
| reticulate            | 1.39.0      |
| rex                   | 1.2.1       |
| rFerns                | 5.0.0       |
| rfm                   | 0.3.0       |
| rgdal                 | 1.6-7       |
| rgeos                 | 0.6-4       |
| rgexf                 | 0.16.3      |
| rgl                   | 1.3.1       |
| RgoogleMaps           | 1.5.1       |
| RGraphics             | 3.0-2       |
| RGtk2                 | 2.20.36.3   |
| RhpcBLASctl           | 0.23-42     |
| RInside               | 0.2.18      |
| rio                   | 1.2.2       |
| rjags                 | 16-Apr      |
| rjson                 | 0.2.21      |
| RJSONIO               | 1.3-1.9     |
| rlang                 | 1.1.4       |
| rlecuyer              | 0.3-8       |
| rlist                 | 0.4.6.2     |
| rmapshaper            | 0.5.0       |
| rmarkdown             | 2.28        |
| Rmisc                 | 1.5.1       |
| Rmpfr                 | 0.9-5       |
| rms                   | 6.8-1       |
| RMySQL                | 0.10.28     |
| rngtools              | 1.5.2       |
| robCompositions       | 2.4.1       |
| robfilter             | 4.1.5       |
| robustbase            | 0.99-4      |
| robustHD              | 0.8.1       |
| ROCR                  | 1.0-11      |
| RODBC                 | 1.3-23      |
| Rook                  | 1.2         |
| rootSolve             | 1.8.2.4     |
| roxygen2              | 7.3.2       |
| rpart                 | 4.1.23      |
| rpart.plot            | 3.1.2       |
| rpivotTable           | 0.3.0       |
| rprojroot             | 2.0.4       |
| RPushbullet           | 0.3.4       |
| rrcov                 | 1.7-6       |
| rsample               | 1.2.1       |
| rsdmx                 | 0.6-3       |
| RSGHB                 | 1.2.2       |
| RSNNS                 | 0.4-17      |
| Rsolnp                | 1.16        |
| rsparse               | 0.5.2       |
| RSpectra              | 0.16-2      |
| RSQLite               | 2.3.7       |
| rstan                 | 2.32.6      |
| rstantools            | 2.4.0       |
| rstatix               | 0.7.2       |
| rstudioapi            | 0.16.0      |
| rsvg                  | 2.6.0       |
| RTextTools            | 1.4.3       |
| Rttf2pt1              | 1.3.12      |
| RUnit                 | 0.4.33      |
| runjags               | 2.2.2-4     |
| Runuran               | 0.38        |
| rvcheck               | 0.2.1       |
| rversions             | 2.1.2       |
| rvest                 | 1.0.4       |
| rworldmap             | 1.3-8       |
| rworldxtra            | 1.01        |
| s2                    | 1.1.7       |
| SampleSizeMeans       | 1.2.3       |
| SampleSizeProportions | 1.1.3       |
| sandwich              | 3.1-0       |
| sas7bdat              | 0.8         |
| sass                  | 0.4.9       |
| satellite             | 1.0.5       |
| sbgcop                | 0.98        |
| scales                | 1.3.0       |
| scatterplot3d         | 0.3-44      |
| sciplot               | 1.2-0       |
| segmented             | 2.1-2       |
| selectr               | 0.4-2       |
| sem                   | 3.1-16      |
| sentimentr            | 2.9.0       |
| seqinr                | 4.2-36      |
| seriation             | 1.5.6       |
| servr                 | 0.31        |
| sessioninfo           | 1.2.2       |
| setRNG                | 2024.2-1    |
| sets                  | 1.0-25      |
| sf                    | 1.0-16      |
| sfd                   | 0.1.0       |
| sfheaders             | 0.4.4       |
| sfsmisc               | 1.1-19      |
| sftime                | 0.2-0       |
| sgeostat              | 1.0-27      |
| shades                | 1.4.0       |
| shape                 | 1.4.6.1     |
| shapefiles            | 0.7.2       |
| shiny                 | 1.9.1       |
| shinyBS               | 0.61.1      |
| shinycssloaders       | 1.1.0       |
| shinyjs               | 2.1.0       |
| shinyTime             | 1.0.3       |
| showtext              | 0.9-7       |
| showtextdb            | 3           |
| SimDesign             | 2.17.1      |
| SIS                   | 0.8-8       |
| SixSigma              | 0.11.1      |
| sjlabelled            | 1.2.0       |
| sjmisc                | 2.8.10      |
| sjPlot                | 2.8.16      |
| sjstats               | 0.19.0      |
| skmeans               | 0.2-17      |
| slam                  | 0.1-53      |
| slider                | 0.3.1       |
| sm                    | 2.2-6.0     |
| smooth                | 4.0.2       |
| smoothSurv            | 2.6         |
| sna                   | 2.7-2       |
| snakecase             | 0.11.1      |
| snow                  | 0.4-4       |
| SnowballC             | 0.7.1       |
| snowFT                | 1.6-1       |
| sodium                | 1.3.1       |
| sourcetools           | 0.1.7-1     |
| sp                    | 2.1-4       |
| spacefillr            | 0.3.3       |
| spacetime             | 1.3-2       |
| spacyr                | 1.3.0       |
| spam                  | 2.10-0      |
| SparseM               | 1.84-2      |
| sparsepp              | 1.22        |
| spatial               | 7.3-17      |
| spatstat              | 3.0-7       |
| spatstat.data         | 3.1-2       |
| spatstat.explore      | 3.2-6       |
| spatstat.geom         | 3.2-9       |
| spatstat.linnet       | 3.1-4       |
| spatstat.model        | 3.2-10      |
| spatstat.random       | 3.2-3       |
| spatstat.sparse       | 3.1-0       |
| spatstat.univar       | 3.0-1       |
| spatstat.utils        | 3.1-0       |
| spBayes               | 0.4-7       |
| spData                | 2.3.3       |
| spdep                 | 1.3-5       |
| spikeslab             | 1.1.6       |
| splancs               | 2.01-45     |
| splines               | 4.3.3       |
| spls                  | 2.2-3       |
| splus2R               | 1.3-5       |
| spTimer               | 3.3.2       |
| sqldf                 | 0.4-11      |
| SQUAREM               | 2021.1      |
| sROC                  | 0.1-2       |
| stabledist            | 0.7-2       |
| stabs                 | 0.6-4       |
| StanHeaders           | 2.32.10     |
| stars                 | 0.6-6       |
| statmod               | 1.5.0       |
| statnet.common        | 4.9.0       |
| stepPlr               | 0.93        |
| stinepack             | 1.5         |
| stochvol              | 3.2.4       |
| stopwords             | 2.3         |
| stringdist            | 0.9.12      |
| stringi               | 1.8.4       |
| stringr               | 1.5.1       |
| strucchange           | 1.5-4       |
| styler                | 1.10.3      |
| sugrrants             | 0.2.9       |
| sunburstR             | 2.1.8       |
| SuppDists             | 1.1-9.8     |
| survey                | 4.4-2       |
| survival              | 3.7-0       |
| survminer             | 0.4.9       |
| survMisc              | 0.5.6       |
| svglite               | 2.1.3       |
| svmpath               | 0.97        |
| svUnit                | 1.0.6       |
| sweep                 | 0.2.5       |
| sys                   | 3.4.2       |
| sysfonts              | 0.8.9       |
| systemfit             | 1.1-30      |
| systemfonts           | 1.1.0       |
| syuzhet               | 1.0.7       |
| tau                   | 0.0-25      |
| tcltk                 | 4.3.3       |
| tcltk2                | 1.2-11      |
| TeachingDemos         | 2.13        |
| tensor                | 1.5         |
| tensorA               | 0.36.2.1    |
| terra                 | 1.7-78      |
| terrainmeshr          | 0.1.0       |
| testthat              | 3.2.1.1     |
| texreg                | 1.39.4      |
| text2vec              | 0.6.4       |
| textcat               | 1.0-8       |
| textclean             | 0.9.3       |
| textir                | 2.0-5       |
| textmineR             | 3.0.5       |
| textshape             | 1.7.5       |
| textshaping           | 0.4.0       |
| tfplot                | 2021.6-1    |
| tframe                | 2015.12-1.1 |
| tgp                   | 2.4-23      |
| TH.data               | 1.1-2       |
| thief                 | 0.3         |
| threejs               | 0.3.3       |
| tibble                | 3.2.1       |
| tibbletime            | 0.1.8       |
| tidycensus            | 1.6.5       |
| tidygraph             | 1.3.0       |
| tidymodels            | 1.2.0       |
| tidyquant             | 1.0.9       |
| tidyr                 | 1.3.1       |
| tidyselect            | 1.2.1       |
| tidytext              | 0.4.2       |
| tidyverse             | 2.0.0       |
| tiff                  | 0.1-12      |
| tigris                | 2.1         |
| timechange            | 0.3.0       |
| timeDate              | 4032.109    |
| timelineS             | 0.1.1       |
| timeSeries            | 4032.109    |
| timetk                | 2.9.0       |
| timevis               | 2.1.0       |
| tinytex               | 0.52        |
| tm                    | 0.7-14      |
| tmap                  | 3.3-4       |
| tmaptools             | 3.1-1       |
| TMB                   | 1.9.14      |
| tmvnsim               | 1.0-2       |
| tokenizers            | 0.3.0       |
| topicmodels           | 0.2-16      |
| TraMineR              | 2.2-10      |
| transformr            | 0.1.5       |
| tree                  | 1.0-43      |
| treemap               | 2.4-4       |
| treemapify            | 2.5.6       |
| trelliscopejs         | 0.2.6       |
| triebeard             | 0.4.1       |
| trimcluster           | 0.1-5       |
| truncnorm             | 1.0-9       |
| TSA                   | 1.3.1       |
| tseries               | 0.10-57     |
| tsfeatures            | 1.1.1       |
| tsibble               | 1.1.5       |
| tsintermittent        | 1.1         |
| tsoutliers            | 0.6-10      |
| TSP                   | 1.2-4       |
| TSstudio              | 0.1.7       |
| TTR                   | 0.24.4      |
| tune                  | 1.2.1       |
| tweedie               | 2.3.5       |
| tweenr                | 2.0.3       |
| twitteR               | 1.1.9       |
| tzdb                  | 0.4.0       |
| ucminf                | 1.2.2       |
| udpipe                | 0.8.11      |
| udunits2              | 0.13.2.1    |
| units                 | 0.8-5       |
| UpSetR                | 1.4.0       |
| urca                  | 1.3-4       |
| urlchecker            | 1.0.1       |
| urltools              | 1.7.3       |
| useful                | 1.2.6.1     |
| usethis               | 3.0.0       |
| UsingR                | 2.0-7       |
| usmap                 | 0.7.1       |
| usmapdata             | 0.3.0       |
| utf8                  | 1.2.4       |
| uuid                  | 1.1-1       |
| V8                    | 5.0.0       |
| vars                  | 1.6-1       |
| vcd                   | 1.4-12      |
| vctrs                 | 0.6.4       |
| vdiffr                | 1.0.7       |
| vegan                 | 2.6-8       |
| VennDiagram           | 1.7.3       |
| VGAM                  | 1.1-11      |
| VIM                   | 6.2.2       |
| vioplot               | 0.5.0       |
| viridis               | 0.6.5       |
| viridisLite           | 0.4.2       |
| visNetwork            | 2.1.2       |
| vistime               | 1.2.4       |
| vroom                 | 1.6.5       |
| waldo                 | 0.5.3       |
| warp                  | 0.2.1       |
| waterfalls            | 1.0.0       |
| wavethresh            | 4.7.3       |
| webshot               | 0.5.5       |
| webutils              | 1.2.1       |
| WeibullR              | 1.2.1       |
| weights               | 1.0.4       |
| whisker               | 0.4.1       |
| widgetframe           | 0.3.1       |
| withr                 | 3.0.1       |
| wk                    | 0.9.2       |
| wmtsa                 | 2.0-3       |
| wordcloud             | 2.6         |
| wordcloud2            | 0.2.1       |
| workflows             | 1.1.4       |
| workflowsets          | 1.1.0       |
| writexl               | 1.5.0       |
| xesreadR              | 0.2.3       |
| xfun                  | 0.47        |
| xgboost               | 2.1.1.1     |
| XML                   | 3.99-0.17   |
| xml2                  | 1.3.6       |
| xopen                 | 1.0.1       |
| xplorerr              | 0.1.2       |
| xtable                | 1.8-4       |
| xts                   | 0.14.0      |
| yaml                  | 2.3.10      |
| yardstick             | 1.3.1       |
| yarrr                 | 0.1.5       |
| YieldCurve            | 5.1         |
| yulab.utils           | 0.1.7       |
| zCompositions         | 1.5.0-4     |
| zeallot               | 0.1.0       |
| zic                   | 0.9.1       |
| zip                   | 2.3.1       |
| zipfR                 | 0.6-70      |
| zoo                   | 1.8-12      |
| base (Built-in)       | 4.3.3       |
| compiler (Built-in)   | 4.3.3       |
| datasets (Built-in)   | 4.3.3       |
| graphics (Built-in)   | 4.3.3       |
| grDevices (Built-in)  | 4.3.3       |
| MatrixGenerics        | 1.14.0      |
| methods (Built-in)    | 4.3.3       |
| parallel (Built-in)   | 4.3.3       |
| sparseMatrixStats     | 1.14.0      |
| stats (Built-in)      | 4.3.3       |
| stats4 (Built-in)     | 4.3.3       |
| tools (Built-in)      | 4.3.3       |
| utils (Built-in)      | 4.3.3       |

## R packages that are supported in Power BI (non-Premium and non-Fabric backed workspaces) and Sov. Clouds

The following table shows which packages are supported in the Power BI service.

|        Package        |   Version   |                                   Link                                   |
|-----------------------|-------------|--------------------------------------------------------------------------|
|abc|2.1|[https://cran.r-project.org/web/packages/abc/index.html](https://cran.r-project.org/web/packages/abc/index.html)|
|abc.data|1.0|[https://cran.r-project.org/web/packages/abc.data/index.html](https://cran.r-project.org/web/packages/abc.data/index.html)|
|abind|1.4-5|[https://cran.r-project.org/web/packages/abind/index.html](https://cran.r-project.org/web/packages/abind/index.html)|
|acepack|1.4.1|[https://cran.r-project.org/web/packages/acepack/index.html](https://cran.r-project.org/web/packages/acepack/index.html)|
|actuar|2.3-1|[https://cran.r-project.org/web/packages/actuar/index.html](https://cran.r-project.org/web/packages/actuar/index.html)|
|ade4|1.7-10|[https://cran.r-project.org/web/packages/ade4/index.html](https://cran.r-project.org/web/packages/ade4/index.html)|
|adegenet|2.1.2|[https://cran.r-project.org/web/packages/adegenet/index.html](https://cran.r-project.org/web/packages/adegenet/index.html)|
|AdMit|2.1.3|[https://cran.r-project.org/web/packages/AdMit/index.html](https://cran.r-project.org/web/packages/AdMit/index.html)|
|AER|1.2-5|[https://cran.r-project.org/web/packages/AER/index.html](https://cran.r-project.org/web/packages/AER/index.html)|
|agricolae|1.3-1|[https://cran.r-project.org/web/packages/agricolae/index.html](https://cran.r-project.org/web/packages/agricolae/index.html)|
|AlgDesign|1.1-7.3|[https://cran.r-project.org/web/packages/AlgDesign/index.html](https://cran.r-project.org/web/packages/AlgDesign/index.html)|
|alluvial|0.1-2|[https://cran.r-project.org/web/packages/alluvial/index.html](https://cran.r-project.org/web/packages/alluvial/index.html)|
|andrews|1.0|[https://cran.r-project.org/web/packages/andrews/index.html](https://cran.r-project.org/web/packages/andrews/index.html)|
|anomalize|0.1.1|[https://cran.r-project.org/web/packages/anomalize/index.html](https://cran.r-project.org/web/packages/anomalize/index.html)|
|anytime|0.3.3|[https://cran.r-project.org/web/packages/anytime/index.html](https://cran.r-project.org/web/packages/anytime/index.html)|
|aod|1.3|[https://cran.r-project.org/web/packages/aod/index.html](https://cran.r-project.org/web/packages/aod/index.html)|
|apcluster|1.4.5|[https://cran.r-project.org/web/packages/apcluster/index.html](https://cran.r-project.org/web/packages/apcluster/index.html)|
|ape|5.0|[https://cran.r-project.org/web/packages/ape/index.html](https://cran.r-project.org/web/packages/ape/index.html)|
|aplpack|1.3.0|[https://cran.r-project.org/web/packages/aplpack/index.html](https://cran.r-project.org/web/packages/aplpack/index.html)|
|approximator|1.2-6|[https://cran.r-project.org/web/packages/approximator/index.html](https://cran.r-project.org/web/packages/approximator/index.html)|
|arm|1.9-3|[https://cran.r-project.org/web/packages/arm/index.html](https://cran.r-project.org/web/packages/arm/index.html)|
|arules|1.6-0|[https://cran.r-project.org/web/packages/arules/index.html](https://cran.r-project.org/web/packages/arules/index.html)|
|arulesViz|1.3-0|[https://cran.r-project.org/web/packages/arulesViz/index.html](https://cran.r-project.org/web/packages/arulesViz/index.html)|
|ash|1.0-15|[https://cran.r-project.org/web/packages/ash/index.html](https://cran.r-project.org/web/packages/ash/index.html)|
|assertthat|0.2.0|[https://cran.r-project.org/web/packages/assertthat/index.html](https://cran.r-project.org/web/packages/assertthat/index.html)|
|autocogs|0.1.2|[https://cran.r-project.org/web/packages/autocogs/index.html](https://cran.r-project.org/web/packages/autocogs/index.html)|
|automap|1.0-14|[https://cran.r-project.org/web/packages/automap/index.html](https://cran.r-project.org/web/packages/automap/index.html)|
|aweek|1.0.1|[https://cran.r-project.org/web/packages/aweek/index.html](https://cran.r-project.org/web/packages/aweek/index.html)|
|AzureML|0.2.14|[https://cran.r-project.org/web/packages/AzureML/index.html](https://cran.r-project.org/web/packages/AzureML/index.html)|
|BaBooN|0.2-0|[https://cran.r-project.org/web/packages/BaBooN/index.html](https://cran.r-project.org/web/packages/BaBooN/index.html)|
|BACCO|2.0-9|[https://cran.r-project.org/web/packages/BACCO/index.html](https://cran.r-project.org/web/packages/BACCO/index.html)|
|backports|1.1.2|[https://cran.r-project.org/web/packages/backports/index.html](https://cran.r-project.org/web/packages/backports/index.html)|
|BaM|1.0.1|[https://cran.r-project.org/web/packages/BaM/index.html](https://cran.r-project.org/web/packages/BaM/index.html)|
|BAS|1.4.9|[https://cran.r-project.org/web/packages/BAS/index.html](https://cran.r-project.org/web/packages/BAS/index.html)|
|base|3.4.4|NA|
|base2grob|0.0.2|[https://cran.r-project.org/web/packages/base2grob/index.html](https://cran.r-project.org/web/packages/base2grob/index.html)|
|base64|2.0|[https://cran.r-project.org/web/packages/base64/index.html](https://cran.r-project.org/web/packages/base64/index.html)|
|base64enc|0.1-3|[https://cran.r-project.org/web/packages/base64enc/index.html](https://cran.r-project.org/web/packages/base64enc/index.html)|
|BayesDA|2012.04-1|[https://cran.r-project.org/web/packages/BayesDA/index.html](https://cran.r-project.org/web/packages/BayesDA/index.html)|
|BayesFactor|0.9.12-2|[https://cran.r-project.org/web/packages/BayesFactor/index.html](https://cran.r-project.org/web/packages/BayesFactor/index.html)|
|bayesGARCH|2.1.3|[https://cran.r-project.org/web/packages/bayesGARCH/index.html](https://cran.r-project.org/web/packages/bayesGARCH/index.html)|
|bayesm|3.1-0.1|[https://cran.r-project.org/web/packages/bayesm/index.html](https://cran.r-project.org/web/packages/bayesm/index.html)|
|bayesmix|0.7-4|[https://cran.r-project.org/web/packages/bayesmix/index.html](https://cran.r-project.org/web/packages/bayesmix/index.html)|
|bayesplot|1.5.0|[https://cran.r-project.org/web/packages/bayesplot/index.html](https://cran.r-project.org/web/packages/bayesplot/index.html)|
|bayesQR|2.3|[https://cran.r-project.org/web/packages/bayesQR/index.html](https://cran.r-project.org/web/packages/bayesQR/index.html)|
|bayesSurv|3.2|[https://cran.r-project.org/web/packages/bayesSurv/index.html](https://cran.r-project.org/web/packages/bayesSurv/index.html)|
|Bayesthresh|2.0.1|[https://cran.r-project.org/web/packages/Bayesthresh/index.html](https://cran.r-project.org/web/packages/Bayesthresh/index.html)|
|BayesTree|0.3-1.4|[https://cran.r-project.org/web/packages/BayesTree/index.html](https://cran.r-project.org/web/packages/BayesTree/index.html)|
|BayesValidate|0.0|[https://cran.r-project.org/web/packages/BayesValidate/index.html](https://cran.r-project.org/web/packages/BayesValidate/index.html)|
|BayesX|0.2-9|[https://cran.r-project.org/web/packages/BayesX/index.html](https://cran.r-project.org/web/packages/BayesX/index.html)|
|BayHaz|0.1-3|[https://cran.r-project.org/web/packages/BayHaz/index.html](https://cran.r-project.org/web/packages/BayHaz/index.html)|
|bbemkr|2.0|[https://cran.r-project.org/web/packages/bbemkr/index.html](https://cran.r-project.org/web/packages/bbemkr/index.html)|
|BCBCSF|1.0-1|[https://cran.r-project.org/web/packages/BCBCSF/index.html](https://cran.r-project.org/web/packages/BCBCSF/index.html)|
|BCE|2.1|[https://cran.r-project.org/web/packages/BCE/index.html](https://cran.r-project.org/web/packages/BCE/index.html)|
|bclust|1.5|[https://cran.r-project.org/web/packages/bclust/index.html](https://cran.r-project.org/web/packages/bclust/index.html)|
|bcp|4.0.0|[https://cran.r-project.org/web/packages/bcp/index.html](https://cran.r-project.org/web/packages/bcp/index.html)|
|BDgraph|2.45|[https://cran.r-project.org/web/packages/BDgraph/index.html](https://cran.r-project.org/web/packages/BDgraph/index.html)|
|beanplot|1.2|[https://cran.r-project.org/web/packages/beanplot/index.html](https://cran.r-project.org/web/packages/beanplot/index.html)|
|beeswarm|0.2.3|[https://cran.r-project.org/web/packages/beeswarm/index.html](https://cran.r-project.org/web/packages/beeswarm/index.html)|
|benford.analysis|0.1.4.1|[https://cran.r-project.org/web/packages/benford.analysis/index.html](https://cran.r-project.org/web/packages/benford.analysis/index.html)|
|BenfordTests|1.2.0|[https://cran.r-project.org/web/packages/BenfordTests/index.html](https://cran.r-project.org/web/packages/BenfordTests/index.html)|
|bfp|0.0-38|[https://cran.r-project.org/web/packages/bfp/index.html](https://cran.r-project.org/web/packages/bfp/index.html)|
|BH|1.66.0-1|[https://cran.r-project.org/web/packages/BH/index.html](https://cran.r-project.org/web/packages/BH/index.html)|
|biglm|0.9-1|[https://cran.r-project.org/web/packages/biglm/index.html](https://cran.r-project.org/web/packages/biglm/index.html)|
|bindr|0.1.1|[https://cran.r-project.org/web/packages/bindr/index.html](https://cran.r-project.org/web/packages/bindr/index.html)|
|bindrcpp|0.2.2|[https://cran.r-project.org/web/packages/bindrcpp/index.html](https://cran.r-project.org/web/packages/bindrcpp/index.html)|
|binom|1.1-1|[https://cran.r-project.org/web/packages/binom/index.html](https://cran.r-project.org/web/packages/binom/index.html)|
|bisoreg|1.4|[https://cran.r-project.org/web/packages/bisoreg/index.html](https://cran.r-project.org/web/packages/bisoreg/index.html)|
|bit|1.1-12|[https://cran.r-project.org/web/packages/bit/index.html](https://cran.r-project.org/web/packages/bit/index.html)|
|bit64|0.9-7|[https://cran.r-project.org/web/packages/bit64/index.html](https://cran.r-project.org/web/packages/bit64/index.html)|
|bitops|1.0-6|[https://cran.r-project.org/web/packages/bitops/index.html](https://cran.r-project.org/web/packages/bitops/index.html)|
|bizdays|1.0.6|[https://cran.r-project.org/web/packages/bizdays/index.html](https://cran.r-project.org/web/packages/bizdays/index.html)|
|blandr|0.5.1|[https://cran.r-project.org/web/packages/blandr/index.html](https://cran.r-project.org/web/packages/blandr/index.html)|
|blme|1.0-4|[https://cran.r-project.org/web/packages/blme/index.html](https://cran.r-project.org/web/packages/blme/index.html)|
|blob|1.1.1|[https://cran.r-project.org/web/packages/blob/index.html](https://cran.r-project.org/web/packages/blob/index.html)|
|BLR|1.4|[https://cran.r-project.org/web/packages/BLR/index.html](https://cran.r-project.org/web/packages/BLR/index.html)|
|BMA|3.18.8|[https://cran.r-project.org/web/packages/BMA/index.html](https://cran.r-project.org/web/packages/BMA/index.html)|
|Bmix|0.6|[https://cran.r-project.org/web/packages/Bmix/index.html](https://cran.r-project.org/web/packages/Bmix/index.html)|
|bmp|0.3|[https://cran.r-project.org/web/packages/bmp/index.html](https://cran.r-project.org/web/packages/bmp/index.html)|
|BMS|0.3.4|[https://cran.r-project.org/web/packages/BMS/index.html](https://cran.r-project.org/web/packages/BMS/index.html)|
|bnlearn|4.3|[https://cran.r-project.org/web/packages/bnlearn/index.html](https://cran.r-project.org/web/packages/bnlearn/index.html)|
|boa|1.1.8-2|[https://cran.r-project.org/web/packages/boa/index.html](https://cran.r-project.org/web/packages/boa/index.html)|
|bomrang|0.1.4|[https://cran.r-project.org/web/packages/bomrang/index.html](https://cran.r-project.org/web/packages/bomrang/index.html)|
|BoolNet|2.1.5|[https://cran.r-project.org/web/packages/BoolNet/index.html](https://cran.r-project.org/web/packages/BoolNet/index.html)|
|Boom|0.7|[https://cran.r-project.org/web/packages/Boom/index.html](https://cran.r-project.org/web/packages/Boom/index.html)|
|BoomSpikeSlab|0.9.0|[https://cran.r-project.org/web/packages/BoomSpikeSlab/index.html](https://cran.r-project.org/web/packages/BoomSpikeSlab/index.html)|
|boot|1.3-20|[https://cran.r-project.org/web/packages/boot/index.html](https://cran.r-project.org/web/packages/boot/index.html)|
|bootstrap|2017.2|[https://cran.r-project.org/web/packages/bootstrap/index.html](https://cran.r-project.org/web/packages/bootstrap/index.html)|
|Boruta|5.3.0|[https://cran.r-project.org/web/packages/Boruta/index.html](https://cran.r-project.org/web/packages/Boruta/index.html)|
|bqtl|1.0-32|[https://cran.r-project.org/web/packages/bqtl/index.html](https://cran.r-project.org/web/packages/bqtl/index.html)|
|BradleyTerry2|1.0-8|[https://cran.r-project.org/web/packages/BradleyTerry2/index.html](https://cran.r-project.org/web/packages/BradleyTerry2/index.html)|
|brew|1.0-6|[https://cran.r-project.org/web/packages/brew/index.html](https://cran.r-project.org/web/packages/brew/index.html)|
|brglm|0.6.1|[https://cran.r-project.org/web/packages/brglm/index.html](https://cran.r-project.org/web/packages/brglm/index.html)|
|broom|0.4.4|[https://cran.r-project.org/web/packages/broom/index.html](https://cran.r-project.org/web/packages/broom/index.html)|
|bspec|1.5|[https://cran.r-project.org/web/packages/bspec/index.html](https://cran.r-project.org/web/packages/bspec/index.html)|
|bspmma|0.1-1|[https://cran.r-project.org/web/packages/bspmma/index.html](https://cran.r-project.org/web/packages/bspmma/index.html)|
|bsts|0.7.1|[https://cran.r-project.org/web/packages/bsts/index.html](https://cran.r-project.org/web/packages/bsts/index.html)|
|bupaR|0.4.4|[https://cran.r-project.org/web/packages/bupaR/index.html](https://cran.r-project.org/web/packages/bupaR/index.html)|
|BVS|4.12.1|[https://cran.r-project.org/web/packages/BVS/index.html](https://cran.r-project.org/web/packages/BVS/index.html)|
|C50|0.1.1|[https://cran.r-project.org/web/packages/C50/index.html](https://cran.r-project.org/web/packages/C50/index.html)|
|Cairo|1.5-9|[https://cran.r-project.org/web/packages/Cairo/index.html](https://cran.r-project.org/web/packages/Cairo/index.html)|
|cairoDevice|2.24|[https://cran.r-project.org/web/packages/cairoDevice/index.html](https://cran.r-project.org/web/packages/cairoDevice/index.html)|
|calibrate|1.7.2|[https://cran.r-project.org/web/packages/calibrate/index.html](https://cran.r-project.org/web/packages/calibrate/index.html)|
|calibrator|1.2-6|[https://cran.r-project.org/web/packages/calibrator/index.html](https://cran.r-project.org/web/packages/calibrator/index.html)|
|callr|2.0.2|[https://cran.r-project.org/web/packages/callr/index.html](https://cran.r-project.org/web/packages/callr/index.html)|
|car|2.1-6|[https://cran.r-project.org/web/packages/car/index.html](https://cran.r-project.org/web/packages/car/index.html)|
|carData|3.0-1|[https://cran.r-project.org/web/packages/carData/index.html](https://cran.r-project.org/web/packages/carData/index.html)|
|caret|6.0-78|[https://cran.r-project.org/web/packages/caret/index.html](https://cran.r-project.org/web/packages/caret/index.html)|
|catnet|1.15.3|[https://cran.r-project.org/web/packages/catnet/index.html](https://cran.r-project.org/web/packages/catnet/index.html)|
|caTools|1.17.1|[https://cran.r-project.org/web/packages/caTools/index.html](https://cran.r-project.org/web/packages/caTools/index.html)|
|cclust|0.6-21|[https://cran.r-project.org/web/packages/cclust/index.html](https://cran.r-project.org/web/packages/cclust/index.html)|
|cellranger|1.1.0|[https://cran.r-project.org/web/packages/cellranger/index.html](https://cran.r-project.org/web/packages/cellranger/index.html)|
|ChainLadder|0.2.5|[https://cran.r-project.org/web/packages/ChainLadder/index.html](https://cran.r-project.org/web/packages/ChainLadder/index.html)|
|changepoint|2.2.2|[https://cran.r-project.org/web/packages/changepoint/index.html](https://cran.r-project.org/web/packages/changepoint/index.html)|
|checkmate|1.8.5|[https://cran.r-project.org/web/packages/checkmate/index.html](https://cran.r-project.org/web/packages/checkmate/index.html)|
|checkpoint|0.4.3|[https://cran.r-project.org/web/packages/checkpoint/index.html](https://cran.r-project.org/web/packages/checkpoint/index.html)|
|choroplethrMaps|1.0.1|[https://cran.r-project.org/web/packages/choroplethrMaps/index.html](https://cran.r-project.org/web/packages/choroplethrMaps/index.html)|
|chron|2.3-52|[https://cran.r-project.org/web/packages/chron/index.html](https://cran.r-project.org/web/packages/chron/index.html)|
|circlize|0.4.3|[https://cran.r-project.org/web/packages/circlize/index.html](https://cran.r-project.org/web/packages/circlize/index.html)|
|Ckmeans.1d.dp|4.2.1|[https://cran.r-project.org/web/packages/Ckmeans.1d.dp/index.html](https://cran.r-project.org/web/packages/Ckmeans.1d.dp/index.html)|
|class|7.3-14|[https://cran.r-project.org/web/packages/class/index.html](https://cran.r-project.org/web/packages/class/index.html)|
|classInt|0.3-3|[https://cran.r-project.org/web/packages/classInt/index.html](https://cran.r-project.org/web/packages/classInt/index.html)|
|CLI|1.0.0|[https://cran.r-project.org/web/packages/cli/index.html](https://cran.r-project.org/web/packages/cli/index.html)|
|ClickClust|1.1.5|[https://cran.r-project.org/web/packages/ClickClust/index.html](https://cran.r-project.org/web/packages/ClickClust/index.html)|
|clickstream|1.3.0|[https://cran.r-project.org/web/packages/clickstream/index.html](https://cran.r-project.org/web/packages/clickstream/index.html)|
|clue|0.3-54|[https://cran.r-project.org/web/packages/clue/index.html](https://cran.r-project.org/web/packages/clue/index.html)|
|cluster|2.0.6|[https://cran.r-project.org/web/packages/cluster/index.html](https://cran.r-project.org/web/packages/cluster/index.html)|
|clv|0.3-2.1|[https://cran.r-project.org/web/packages/clv/index.html](https://cran.r-project.org/web/packages/clv/index.html)|
|cmprsk|2.2-7|[https://cran.r-project.org/web/packages/cmprsk/index.html](https://cran.r-project.org/web/packages/cmprsk/index.html)|
|coda|0.19-1|[https://cran.r-project.org/web/packages/coda/index.html](https://cran.r-project.org/web/packages/coda/index.html)|
|codetools|0.2-15|[https://cran.r-project.org/web/packages/codetools/index.html](https://cran.r-project.org/web/packages/codetools/index.html)|
|coefplot|1.2.6|[https://cran.r-project.org/web/packages/coefplot/index.html](https://cran.r-project.org/web/packages/coefplot/index.html)|
|coin|1.2-2|[https://cran.r-project.org/web/packages/coin/index.html](https://cran.r-project.org/web/packages/coin/index.html)|
|collapsibleTree|0.1.6|[https://cran.r-project.org/web/packages/collapsibleTree/index.html](https://cran.r-project.org/web/packages/collapsibleTree/index.html)|
|colorRamps|2.3|[https://cran.r-project.org/web/packages/colorRamps/index.html](https://cran.r-project.org/web/packages/colorRamps/index.html)|
|colorspace|1.3-2|[https://cran.r-project.org/web/packages/colorspace/index.html](https://cran.r-project.org/web/packages/colorspace/index.html)|
|colourpicker|1.0|[https://cran.r-project.org/web/packages/colourpicker/index.html](https://cran.r-project.org/web/packages/colourpicker/index.html)|
|combinat|0.0-8|[https://cran.r-project.org/web/packages/combinat/index.html](https://cran.r-project.org/web/packages/combinat/index.html)|
|commonmark|1.4|[https://cran.r-project.org/web/packages/commonmark/index.html](https://cran.r-project.org/web/packages/commonmark/index.html)|
|compiler|3.4.4|NA|
|compositions|1.40-1|[https://cran.r-project.org/web/packages/compositions/index.html](https://cran.r-project.org/web/packages/compositions/index.html)|
|CORElearn|1.52.0|[https://cran.r-project.org/web/packages/CORElearn/index.html](https://cran.r-project.org/web/packages/CORElearn/index.html)|
|corpcor|1.6.9|[https://cran.r-project.org/web/packages/corpcor/index.html](https://cran.r-project.org/web/packages/corpcor/index.html)|
|corrgram|1.12|[https://cran.r-project.org/web/packages/corrgram/index.html](https://cran.r-project.org/web/packages/corrgram/index.html)|
|corrplot|0.84|[https://cran.r-project.org/web/packages/corrplot/index.html](https://cran.r-project.org/web/packages/corrplot/index.html)|
|covr|3.0.1|[https://cran.r-project.org/web/packages/covr/index.html](https://cran.r-project.org/web/packages/covr/index.html)|
|cowplot|0.9.2|[https://cran.r-project.org/web/packages/cowplot/index.html](https://cran.r-project.org/web/packages/cowplot/index.html)|
|cplm|0.7-5|[https://cran.r-project.org/web/packages/cplm/index.html](https://cran.r-project.org/web/packages/cplm/index.html)|
|cpp11|0.4.2|[https://cran.r-project.org/web/packages/cpp11/index.html](https://cran.r-project.org/web/packages/cpp11/index.html)|
|crayon|1.3.4|[https://cran.r-project.org/web/packages/crayon/index.html](https://cran.r-project.org/web/packages/crayon/index.html)|
|crosstalk|1.0.0|[https://cran.r-project.org/web/packages/crosstalk/index.html](https://cran.r-project.org/web/packages/crosstalk/index.html)|
|cslogistic|0.1-3|[https://cran.r-project.org/web/packages/cslogistic/index.html](https://cran.r-project.org/web/packages/cslogistic/index.html)|
|cts|1.0-21|[https://cran.r-project.org/web/packages/cts/index.html](https://cran.r-project.org/web/packages/cts/index.html)|
|ctv|0.8-4|[https://cran.r-project.org/web/packages/ctv/index.html](https://cran.r-project.org/web/packages/ctv/index.html)|
|cubature|1.3-11|[https://cran.r-project.org/web/packages/cubature/index.html](https://cran.r-project.org/web/packages/cubature/index.html)|
|Cubist|0.2.1|[https://cran.r-project.org/web/packages/Cubist/index.html](https://cran.r-project.org/web/packages/Cubist/index.html)|
|curl|3.2|[https://cran.r-project.org/web/packages/curl/index.html](https://cran.r-project.org/web/packages/curl/index.html)|
|CVST|0.2-1|[https://cran.r-project.org/web/packages/CVST/index.html](https://cran.r-project.org/web/packages/CVST/index.html)|
|cvTools|0.3.2|[https://cran.r-project.org/web/packages/cvTools/index.html](https://cran.r-project.org/web/packages/cvTools/index.html)|
|d3heatmap|0.6.1.2|[https://cran.r-project.org/web/packages/d3heatmap/index.html](https://cran.r-project.org/web/packages/d3heatmap/index.html)|
|d3Network|0.5.2.1|[https://cran.r-project.org/web/packages/d3Network/index.html](https://cran.r-project.org/web/packages/d3Network/index.html)|
|d3r|0.8.0|[https://cran.r-project.org/web/packages/d3r/index.html](https://cran.r-project.org/web/packages/d3r/index.html)|
|data.table|1.12.6|[https://cran.r-project.org/web/packages/data.table/index.html](https://cran.r-project.org/web/packages/data.table/index.html)|
|data.tree|0.7.5|[https://cran.r-project.org/web/packages/data.tree/index.html](https://cran.r-project.org/web/packages/data.tree/index.html)|
|datasauRus|0.1.4|[https://cran.r-project.org/web/packages/datasauRus/index.html](https://cran.r-project.org/web/packages/datasauRus/index.html)|
|semantic models|3.4.4|NA|
|date|1.2-38|[https://cran.r-project.org/web/packages/date/index.html](https://cran.r-project.org/web/packages/date/index.html)|
|DBI|0.8|[https://cran.r-project.org/web/packages/DBI/index.html](https://cran.r-project.org/web/packages/DBI/index.html)|
|dbplyr|1.2.1|[https://cran.r-project.org/web/packages/dbplyr/index.html](https://cran.r-project.org/web/packages/dbplyr/index.html)|
|dbscan|1.1-1|[https://cran.r-project.org/web/packages/dbscan/index.html](https://cran.r-project.org/web/packages/dbscan/index.html)|
|dclone|2.2-0|[https://cran.r-project.org/web/packages/dclone/index.html](https://cran.r-project.org/web/packages/dclone/index.html)|
|ddalpha|1.3.1.1|[https://cran.r-project.org/web/packages/ddalpha/index.html](https://cran.r-project.org/web/packages/ddalpha/index.html)|
|deal|1.2-37|[https://cran.r-project.org/web/packages/deal/index.html](https://cran.r-project.org/web/packages/deal/index.html)|
|debugme|1.1.0|[https://cran.r-project.org/web/packages/debugme/index.html](https://cran.r-project.org/web/packages/debugme/index.html)|
|deepnet|0.2|[https://cran.r-project.org/web/packages/deepnet/index.html](https://cran.r-project.org/web/packages/deepnet/index.html)|
|deldir|0.1-14|[https://cran.r-project.org/web/packages/deldir/index.html](https://cran.r-project.org/web/packages/deldir/index.html)|
|dendextend|1.12.0|[https://cran.r-project.org/web/packages/dendextend/index.html](https://cran.r-project.org/web/packages/dendextend/index.html)|
|DEoptimR|1.0-8|[https://cran.r-project.org/web/packages/DEoptimR/index.html](https://cran.r-project.org/web/packages/DEoptimR/index.html)|
|deployrRserve|9.0.0|NA|
|Deriv|3.8.4|[https://cran.r-project.org/web/packages/Deriv/index.html](https://cran.r-project.org/web/packages/Deriv/index.html)|
|desc|1.1.1|[https://cran.r-project.org/web/packages/desc/index.html](https://cran.r-project.org/web/packages/desc/index.html)|
|descr|1.1.4|[https://cran.r-project.org/web/packages/descr/index.html](https://cran.r-project.org/web/packages/descr/index.html)|
|deSolve|1.20|[https://cran.r-project.org/web/packages/deSolve/index.html](https://cran.r-project.org/web/packages/deSolve/index.html)|
|devtools|1.13.5|[https://cran.r-project.org/web/packages/devtools/index.html](https://cran.r-project.org/web/packages/devtools/index.html)|
|DiagrammeR|1.0.0|[https://cran.r-project.org/web/packages/DiagrammeR/index.html](https://cran.r-project.org/web/packages/DiagrammeR/index.html)|
|DiagrammeRsvg|0.1|[https://cran.r-project.org/web/packages/DiagrammeRsvg/index.html](https://cran.r-project.org/web/packages/DiagrammeRsvg/index.html)|
|dichromat|2.0-0|[https://cran.r-project.org/web/packages/dichromat/index.html](https://cran.r-project.org/web/packages/dichromat/index.html)|
|digest|0.6.15|[https://cran.r-project.org/web/packages/digest/index.html](https://cran.r-project.org/web/packages/digest/index.html)|
|dimRed|0.1.0|[https://cran.r-project.org/web/packages/dimRed/index.html](https://cran.r-project.org/web/packages/dimRed/index.html)|
|diptest|0.75-7|[https://cran.r-project.org/web/packages/diptest/index.html](https://cran.r-project.org/web/packages/diptest/index.html)|
|distcrete|1.0.3|[https://cran.r-project.org/web/packages/distcrete/index.html](https://cran.r-project.org/web/packages/distcrete/index.html)|
|DistributionUtils|0.6-0|[https://cran.r-project.org/web/packages/DistributionUtils/index.html](https://cran.r-project.org/web/packages/DistributionUtils/index.html)|
|distrom|1.0|[https://cran.r-project.org/web/packages/distrom/index.html](https://cran.r-project.org/web/packages/distrom/index.html)|
|dlm|1.1-4|[https://cran.r-project.org/web/packages/dlm/index.html](https://cran.r-project.org/web/packages/dlm/index.html)|
|DMwR|0.4.1|[https://cran.r-project.org/web/packages/DMwR/index.html](https://cran.r-project.org/web/packages/DMwR/index.html)|
|doBy|4.6-1|[https://cran.r-project.org/web/packages/doBy/index.html](https://cran.r-project.org/web/packages/doBy/index.html)|
|doParallel|1.0.12|[https://cran.r-project.org/web/packages/doParallel/index.html](https://cran.r-project.org/web/packages/doParallel/index.html)|
|doSNOW|1.0.16|[https://cran.r-project.org/web/packages/doSNOW/index.html](https://cran.r-project.org/web/packages/doSNOW/index.html)|
|dotCall64|0.9-5.2|[https://cran.r-project.org/web/packages/dotCall64/index.html](https://cran.r-project.org/web/packages/dotCall64/index.html)|
|downloader|0.4|[https://cran.r-project.org/web/packages/downloader/index.html](https://cran.r-project.org/web/packages/downloader/index.html)|
|dplyr|0.8.3|[https://cran.r-project.org/web/packages/dplyr/index.html](https://cran.r-project.org/web/packages/dplyr/index.html)|
|DPpackage|1.1-7.4|[https://cran.r-project.org/web/packages/DPpackage/index.html](https://cran.r-project.org/web/packages/DPpackage/index.html)|
|DRR|0.0.3|[https://cran.r-project.org/web/packages/DRR/index.html](https://cran.r-project.org/web/packages/DRR/index.html)|
|dse|2015.12-1|[https://cran.r-project.org/web/packages/dse/index.html](https://cran.r-project.org/web/packages/dse/index.html)|
|DT|0.4|[https://cran.r-project.org/web/packages/DT/index.html](https://cran.r-project.org/web/packages/DT/index.html)|
|dtt|0.1-2|[https://cran.r-project.org/web/packages/dtt/index.html](https://cran.r-project.org/web/packages/dtt/index.html)|
|dtw|1.18-1|[https://cran.r-project.org/web/packages/dtw/index.html](https://cran.r-project.org/web/packages/dtw/index.html)|
|dygraphs|1.1.1.4|[https://cran.r-project.org/web/packages/dygraphs/index.html](https://cran.r-project.org/web/packages/dygraphs/index.html)|
|dynlm|0.3-5|[https://cran.r-project.org/web/packages/dynlm/index.html](https://cran.r-project.org/web/packages/dynlm/index.html)|
|e1071|1.6-8|[https://cran.r-project.org/web/packages/e1071/index.html](https://cran.r-project.org/web/packages/e1071/index.html)|
|earth|4.6.2|[https://cran.r-project.org/web/packages/earth/index.html](https://cran.r-project.org/web/packages/earth/index.html)|
|EbayesThresh|1.4-12|[https://cran.r-project.org/web/packages/EbayesThresh/index.html](https://cran.r-project.org/web/packages/EbayesThresh/index.html)|
|ebdbNet|1.2.5|[https://cran.r-project.org/web/packages/ebdbNet/index.html](https://cran.r-project.org/web/packages/ebdbNet/index.html)|
|ecm|4.4.0|[https://cran.r-project.org/web/packages/ecm/index.html](https://cran.r-project.org/web/packages/ecm/index.html)|
|edeaR|0.8.0|[https://cran.r-project.org/web/packages/edeaR/index.html](https://cran.r-project.org/web/packages/edeaR/index.html)|
|effects|4.0-1|[https://cran.r-project.org/web/packages/effects/index.html](https://cran.r-project.org/web/packages/effects/index.html)|
|ellipse|0.4.1|[https://cran.r-project.org/web/packages/ellipse/index.html](https://cran.r-project.org/web/packages/ellipse/index.html)|
|ellipsis|0.3.0|[https://cran.r-project.org/web/packages/ellipsis/index.html](https://cran.r-project.org/web/packages/ellipsis/index.html)|
|emmeans|1.1.2|[https://cran.r-project.org/web/packages/emmeans/index.html](https://cran.r-project.org/web/packages/emmeans/index.html)|
|emulator|1.2-15|[https://cran.r-project.org/web/packages/emulator/index.html](https://cran.r-project.org/web/packages/emulator/index.html)|
|energy|1.7-2|[https://cran.r-project.org/web/packages/energy/index.html](https://cran.r-project.org/web/packages/energy/index.html)|
|english|1.2-3|[https://cran.r-project.org/web/packages/english/index.html](https://cran.r-project.org/web/packages/english/index.html)|
|ensembleBMA|5.1.5|[https://cran.r-project.org/web/packages/ensembleBMA/index.html](https://cran.r-project.org/web/packages/ensembleBMA/index.html)|
|entropy|1.2.1|[https://cran.r-project.org/web/packages/entropy/index.html](https://cran.r-project.org/web/packages/entropy/index.html)|
|epitools|0.5-10.1|[https://cran.r-project.org/web/packages/epitools/index.html](https://cran.r-project.org/web/packages/epitools/index.html)|
|epitrix|0.2.2|[https://cran.r-project.org/web/packages/epitrix/index.html](https://cran.r-project.org/web/packages/epitrix/index.html)|
|estimability|1.3|[https://cran.r-project.org/web/packages/estimability/index.html](https://cran.r-project.org/web/packages/estimability/index.html)|
|eulerr|5.1.0|[https://cran.r-project.org/web/packages/eulerr/index.html](https://cran.r-project.org/web/packages/eulerr/index.html)|
|EvalEst|2015.4-2|[https://cran.r-project.org/web/packages/EvalEst/index.html](https://cran.r-project.org/web/packages/EvalEst/index.html)|
|evaluate|0.10.1|[https://cran.r-project.org/web/packages/evaluate/index.html](https://cran.r-project.org/web/packages/evaluate/index.html)|
|evd|2.3-2|[https://cran.r-project.org/web/packages/evd/index.html](https://cran.r-project.org/web/packages/evd/index.html)|
|evdbayes|1.1-1|[https://cran.r-project.org/web/packages/evdbayes/index.html](https://cran.r-project.org/web/packages/evdbayes/index.html)|
|eventdataR|0.2.0|[https://cran.r-project.org/web/packages/eventdataR/index.html](https://cran.r-project.org/web/packages/eventdataR/index.html)|
|exactLoglinTest|1.4.2|[https://cran.r-project.org/web/packages/exactLoglinTest/index.html](https://cran.r-project.org/web/packages/exactLoglinTest/index.html)|
|exactRankTests|0.8-29|[https://cran.r-project.org/web/packages/exactRankTests/index.html](https://cran.r-project.org/web/packages/exactRankTests/index.html)|
|expint|0.1-4|[https://cran.r-project.org/web/packages/expint/index.html](https://cran.r-project.org/web/packages/expint/index.html)|
|expm|0.999-2|[https://cran.r-project.org/web/packages/expm/index.html](https://cran.r-project.org/web/packages/expm/index.html)|
|extraDistr|1.8.8|[https://cran.r-project.org/web/packages/extraDistr/index.html](https://cran.r-project.org/web/packages/extraDistr/index.html)|
|extrafont|0.17|[https://cran.r-project.org/web/packages/extrafont/index.html](https://cran.r-project.org/web/packages/extrafont/index.html)|
|extrafontdb|1.0|[https://cran.r-project.org/web/packages/extrafontdb/index.html](https://cran.r-project.org/web/packages/extrafontdb/index.html)|
|extremevalues|2.3.2|[https://cran.r-project.org/web/packages/extremevalues/index.html](https://cran.r-project.org/web/packages/extremevalues/index.html)|
|ez|4.4-0|[https://cran.r-project.org/web/packages/ez/index.html](https://cran.r-project.org/web/packages/ez/index.html)|
|factoextra|1.0.5|[https://cran.r-project.org/web/packages/factoextra/index.html](https://cran.r-project.org/web/packages/factoextra/index.html)|
|FactoMineR|1.40|[https://cran.r-project.org/web/packages/FactoMineR/index.html](https://cran.r-project.org/web/packages/FactoMineR/index.html)|
|factorQR|0.1-4|[https://cran.r-project.org/web/packages/factorQR/index.html](https://cran.r-project.org/web/packages/factorQR/index.html)|
|fansi|0.4.0|[https://cran.r-project.org/web/packages/fansi/index.html](https://cran.r-project.org/web/packages/fansi/index.html)|
|faoutlier|0.7.2|[https://cran.r-project.org/web/packages/faoutlier/index.html](https://cran.r-project.org/web/packages/faoutlier/index.html)|
|farver|1.1.0|[https://cran.r-project.org/web/packages/farver/index.html](https://cran.r-project.org/web/packages/farver/index.html)|
|fastICA|1.2-1|[https://cran.r-project.org/web/packages/fastICA/index.html](https://cran.r-project.org/web/packages/fastICA/index.html)|
|fastmatch|1.1-0|[https://cran.r-project.org/web/packages/fastmatch/index.html](https://cran.r-project.org/web/packages/fastmatch/index.html)|
|fBasics|3042.89|[https://cran.r-project.org/web/packages/fBasics/index.html](https://cran.r-project.org/web/packages/fBasics/index.html)|
|fdrtool|1.2.15|[https://cran.r-project.org/web/packages/fdrtool/index.html](https://cran.r-project.org/web/packages/fdrtool/index.html)|
|fGarch|3042.83.1|[https://cran.r-project.org/web/packages/fGarch/index.html](https://cran.r-project.org/web/packages/fGarch/index.html)|
|fields|9.6|[https://cran.r-project.org/web/packages/fields/index.html](https://cran.r-project.org/web/packages/fields/index.html)|
|filehash|2.4-1|[https://cran.r-project.org/web/packages/filehash/index.html](https://cran.r-project.org/web/packages/filehash/index.html)|
|FinCal|0.6.3|[https://cran.r-project.org/web/packages/FinCal/index.html](https://cran.r-project.org/web/packages/FinCal/index.html)|
|fitdistrplus|1.0-9|[https://cran.r-project.org/web/packages/fitdistrplus/index.html](https://cran.r-project.org/web/packages/fitdistrplus/index.html)|
|flashClust|1.01-2|[https://cran.r-project.org/web/packages/flashClust/index.html](https://cran.r-project.org/web/packages/flashClust/index.html)|
|flexclust|1.3-5|[https://cran.r-project.org/web/packages/flexclust/index.html](https://cran.r-project.org/web/packages/flexclust/index.html)|
|flexmix|2.3-14|[https://cran.r-project.org/web/packages/flexmix/index.html](https://cran.r-project.org/web/packages/flexmix/index.html)|
|FME|1.3.5|[https://cran.r-project.org/web/packages/FME/index.html](https://cran.r-project.org/web/packages/FME/index.html)|
|fmsb|0.6.1|[https://cran.r-project.org/web/packages/fmsb/index.html](https://cran.r-project.org/web/packages/fmsb/index.html)|
|FNN|1.1|[https://cran.r-project.org/web/packages/FNN/index.html](https://cran.r-project.org/web/packages/FNN/index.html)|
|fontBitstreamVera|0.1.1|[https://cran.r-project.org/web/packages/fontBitstreamVera/index.html](https://cran.r-project.org/web/packages/fontBitstreamVera/index.html)|
|fontLiberation|0.1.0|[https://cran.r-project.org/web/packages/fontLiberation/index.html](https://cran.r-project.org/web/packages/fontLiberation/index.html)|
|fontquiver|0.2.1|[https://cran.r-project.org/web/packages/fontquiver/index.html](https://cran.r-project.org/web/packages/fontquiver/index.html)|
|forcats|0.3.0|[https://cran.r-project.org/web/packages/forcats/index.html](https://cran.r-project.org/web/packages/forcats/index.html)|
|foreach|1.4.4|[https://cran.r-project.org/web/packages/foreach/index.html](https://cran.r-project.org/web/packages/foreach/index.html)|
|forecast|8.7|[https://cran.r-project.org/web/packages/forecast/index.html](https://cran.r-project.org/web/packages/forecast/index.html)|
|forecastHybrid|2.1.11|[https://cran.r-project.org/web/packages/forecastHybrid/index.html](https://cran.r-project.org/web/packages/forecastHybrid/index.html)|
|foreign|0.8-69|[https://cran.r-project.org/web/packages/foreign/index.html](https://cran.r-project.org/web/packages/foreign/index.html)|
|formatR|1.5|[https://cran.r-project.org/web/packages/formatR/index.html](https://cran.r-project.org/web/packages/formatR/index.html)|
|formattable|0.2.0.1|[https://cran.r-project.org/web/packages/formattable/index.html](https://cran.r-project.org/web/packages/formattable/index.html)|
|Formula|1.2-2|[https://cran.r-project.org/web/packages/Formula/index.html](https://cran.r-project.org/web/packages/Formula/index.html)|
|fpc|2.1-11|[https://cran.r-project.org/web/packages/fpc/index.html](https://cran.r-project.org/web/packages/fpc/index.html)|
|fracdiff|1.4-2|[https://cran.r-project.org/web/packages/fracdiff/index.html](https://cran.r-project.org/web/packages/fracdiff/index.html)|
|fTrading|3042.79|[https://cran.r-project.org/web/packages/fTrading/index.html](https://cran.r-project.org/web/packages/fTrading/index.html)|
|fUnitRoots|3042.79|[https://cran.r-project.org/web/packages/fUnitRoots/index.html](https://cran.r-project.org/web/packages/fUnitRoots/index.html)|
|futile.logger|1.4.3|[https://cran.r-project.org/web/packages/futile.logger/index.html](https://cran.r-project.org/web/packages/futile.logger/index.html)|
|futile.options|1.0.0|[https://cran.r-project.org/web/packages/futile.options/index.html](https://cran.r-project.org/web/packages/futile.options/index.html)|
|future|1.15.0|[https://cran.r-project.org/web/packages/future/index.html](https://cran.r-project.org/web/packages/future/index.html)|
|future.apply|1.3.0|[https://cran.r-project.org/web/packages/future.apply/index.html](https://cran.r-project.org/web/packages/future.apply/index.html)|
|gam|1.15|[https://cran.r-project.org/web/packages/gam/index.html](https://cran.r-project.org/web/packages/gam/index.html)|
|gamlr|1.13-4|[https://cran.r-project.org/web/packages/gamlr/index.html](https://cran.r-project.org/web/packages/gamlr/index.html)|
|gamlss|5.0-6|[https://cran.r-project.org/web/packages/gamlss/index.html](https://cran.r-project.org/web/packages/gamlss/index.html)|
|gamlss.data|5.0-0|[https://cran.r-project.org/web/packages/gamlss.data/index.html](https://cran.r-project.org/web/packages/gamlss.data/index.html)|
|gamlss.dist|5.0-4|[https://cran.r-project.org/web/packages/gamlss.dist/index.html](https://cran.r-project.org/web/packages/gamlss.dist/index.html)|
|gbm|2.1.3|[https://cran.r-project.org/web/packages/gbm/index.html](https://cran.r-project.org/web/packages/gbm/index.html)|
|gclus|1.3.1|[https://cran.r-project.org/web/packages/gclus/index.html](https://cran.r-project.org/web/packages/gclus/index.html)|
|gdalUtils|2.0.1.7|[https://cran.r-project.org/web/packages/gdalUtils/index.html](https://cran.r-project.org/web/packages/gdalUtils/index.html)|
|gdata|2.18.0|[https://cran.r-project.org/web/packages/gdata/index.html](https://cran.r-project.org/web/packages/gdata/index.html)|
|gdtools|0.1.7|[https://cran.r-project.org/web/packages/gdtools/index.html](https://cran.r-project.org/web/packages/gdtools/index.html)|
|gee|4.13-19|[https://cran.r-project.org/web/packages/gee/index.html](https://cran.r-project.org/web/packages/gee/index.html)|
|genalg|0.2.0|[https://cran.r-project.org/web/packages/genalg/index.html](https://cran.r-project.org/web/packages/genalg/index.html)|
|generics|0.1.2|[https://cran.r-project.org/web/packages/generics/index.html](https://cran.r-project.org/web/packages/generics/index.html)|
|genetics|1.3.8.1|[https://cran.r-project.org/web/packages/genetics/index.html](https://cran.r-project.org/web/packages/genetics/index.html)|
|GenSA|1.1.7|[https://cran.r-project.org/web/packages/GenSA/index.html](https://cran.r-project.org/web/packages/GenSA/index.html)|
|geojson|0.2.0|[https://cran.r-project.org/web/packages/geojson/index.html](https://cran.r-project.org/web/packages/geojson/index.html)|
|geojsonio|0.6.0|[https://cran.r-project.org/web/packages/geojsonio/index.html](https://cran.r-project.org/web/packages/geojsonio/index.html)|
|geojsonlint|0.2.0|[https://cran.r-project.org/web/packages/geojsonlint/index.html](https://cran.r-project.org/web/packages/geojsonlint/index.html)|
|geoR|1.7-5.2|[https://cran.r-project.org/web/packages/geoR/index.html](https://cran.r-project.org/web/packages/geoR/index.html)|
|geoRglm|0.9-11|[https://cran.r-project.org/web/packages/geoRglm/index.html](https://cran.r-project.org/web/packages/geoRglm/index.html)|
|geosphere|1.5-7|[https://cran.r-project.org/web/packages/geosphere/index.html](https://cran.r-project.org/web/packages/geosphere/index.html)|
|GGally|2.0.0|[https://cran.r-project.org/web/packages/GGally/index.html](https://cran.r-project.org/web/packages/GGally/index.html)|
|ggalt|0.4.0|[https://cran.r-project.org/web/packages/ggalt/index.html](https://cran.r-project.org/web/packages/ggalt/index.html)|
|gganimate|1.0.3|[https://cran.r-project.org/web/packages/gganimate/index.html](https://cran.r-project.org/web/packages/gganimate/index.html)|
|ggcorrplot|0.1.1|[https://cran.r-project.org/web/packages/ggcorrplot/index.html](https://cran.r-project.org/web/packages/ggcorrplot/index.html)|
|ggdendro|0.1-20|[https://cran.r-project.org/web/packages/ggdendro/index.html](https://cran.r-project.org/web/packages/ggdendro/index.html)|
|ggeffects|0.3.2|[https://cran.r-project.org/web/packages/ggeffects/index.html](https://cran.r-project.org/web/packages/ggeffects/index.html)|
|ggExtra|0.9|[https://cran.r-project.org/web/packages/ggExtra/index.html](https://cran.r-project.org/web/packages/ggExtra/index.html)|
|ggforce|0.1.1|[https://cran.r-project.org/web/packages/ggforce/index.html](https://cran.r-project.org/web/packages/ggforce/index.html)|
|ggformula|0.6.2|[https://cran.r-project.org/web/packages/ggformula/index.html](https://cran.r-project.org/web/packages/ggformula/index.html)|
|ggfortify|0.4.3|[https://cran.r-project.org/web/packages/ggfortify/index.html](https://cran.r-project.org/web/packages/ggfortify/index.html)|
|gghighlight|0.3.0|[https://cran.r-project.org/web/packages/gghighlight/index.html](https://cran.r-project.org/web/packages/gghighlight/index.html)|
|ggimage|0.1.2|[https://cran.r-project.org/web/packages/ggimage/index.html](https://cran.r-project.org/web/packages/ggimage/index.html)|
|ggiraph|0.6.1|[https://cran.r-project.org/web/packages/ggiraph/index.html](https://cran.r-project.org/web/packages/ggiraph/index.html)|
|ggjoy|0.4.0|[https://cran.r-project.org/web/packages/ggjoy/index.html](https://cran.r-project.org/web/packages/ggjoy/index.html)|
|ggm|2.3|[https://cran.r-project.org/web/packages/ggm/index.html](https://cran.r-project.org/web/packages/ggm/index.html)|
|ggmap|3.0.0|[https://cran.r-project.org/web/packages/ggmap/index.html](https://cran.r-project.org/web/packages/ggmap/index.html)|
|ggmcmc|1.1|[https://cran.r-project.org/web/packages/ggmcmc/index.html](https://cran.r-project.org/web/packages/ggmcmc/index.html)|
|ggplot2|3.3.3|[https://cran.r-project.org/web/packages/ggplot2/index.html](https://cran.r-project.org/web/packages/ggplot2/index.html)|
|ggplot2movies|0.0.1|[https://cran.r-project.org/web/packages/ggplot2movies/index.html](https://cran.r-project.org/web/packages/ggplot2movies/index.html)|
|ggpmisc|0.2.16|[https://cran.r-project.org/web/packages/ggpmisc/index.html](https://cran.r-project.org/web/packages/ggpmisc/index.html)|
|ggpubr|0.2.3|[https://cran.r-project.org/web/packages/ggpubr/index.html](https://cran.r-project.org/web/packages/ggpubr/index.html)|
|ggQC|0.0.31|[https://cran.r-project.org/web/packages/ggQC/index.html](https://cran.r-project.org/web/packages/ggQC/index.html)|
|ggRandomForests|2.0.1|[https://cran.r-project.org/web/packages/ggRandomForests/index.html](https://cran.r-project.org/web/packages/ggRandomForests/index.html)|
|ggraph|1.0.1|[https://cran.r-project.org/web/packages/ggraph/index.html](https://cran.r-project.org/web/packages/ggraph/index.html)|
|ggrepel|0.8.0|[https://cran.r-project.org/web/packages/ggrepel/index.html](https://cran.r-project.org/web/packages/ggrepel/index.html)|
|ggridges|0.4.1|[https://cran.r-project.org/web/packages/ggridges/index.html](https://cran.r-project.org/web/packages/ggridges/index.html)|
|ggsci|2.8|[https://cran.r-project.org/web/packages/ggsci/index.html](https://cran.r-project.org/web/packages/ggsci/index.html)|
|ggsignif|0.4.0|[https://cran.r-project.org/web/packages/ggsignif/index.html](https://cran.r-project.org/web/packages/ggsignif/index.html)|
|ggsoccer|0.1.4|[https://cran.r-project.org/web/packages/ggsoccer/index.html](https://cran.r-project.org/web/packages/ggsoccer/index.html)|
|ggstance|0.3|[https://cran.r-project.org/web/packages/ggstance/index.html](https://cran.r-project.org/web/packages/ggstance/index.html)|
|ggtern|2.2.1|[https://cran.r-project.org/web/packages/ggtern/index.html](https://cran.r-project.org/web/packages/ggtern/index.html)|
|ggthemes|3.4.0|[https://cran.r-project.org/web/packages/ggthemes/index.html](https://cran.r-project.org/web/packages/ggthemes/index.html)|
|gistr|0.4.0|[https://cran.r-project.org/web/packages/gistr/index.html](https://cran.r-project.org/web/packages/gistr/index.html)|
|git2r|0.21.0|[https://cran.r-project.org/web/packages/git2r/index.html](https://cran.r-project.org/web/packages/git2r/index.html)|
|glasso|1.8|[https://cran.r-project.org/web/packages/glasso/index.html](https://cran.r-project.org/web/packages/glasso/index.html)|
|glmmBUGS|2.4.0|[https://cran.r-project.org/web/packages/glmmBUGS/index.html](https://cran.r-project.org/web/packages/glmmBUGS/index.html)|
|glmmTMB|0.2.0|[https://cran.r-project.org/web/packages/glmmTMB/index.html](https://cran.r-project.org/web/packages/glmmTMB/index.html)|
|glmnet|2.0-13|[https://cran.r-project.org/web/packages/glmnet/index.html](https://cran.r-project.org/web/packages/glmnet/index.html)|
|GlobalOptions|0.0.13|[https://cran.r-project.org/web/packages/GlobalOptions/index.html](https://cran.r-project.org/web/packages/GlobalOptions/index.html)|
|globals|0.12.4|[https://cran.r-project.org/web/packages/globals/index.html](https://cran.r-project.org/web/packages/globals/index.html)|
|glue|1.3.1|[https://cran.r-project.org/web/packages/glue/index.html](https://cran.r-project.org/web/packages/glue/index.html)|
|gmodels|2.16.2|[https://cran.r-project.org/web/packages/gmodels/index.html](https://cran.r-project.org/web/packages/gmodels/index.html)|
|gmp|0.5-13.1|[https://cran.r-project.org/web/packages/gmp/index.html](https://cran.r-project.org/web/packages/gmp/index.html)|
|gnm|1.0-8|[https://cran.r-project.org/web/packages/gnm/index.html](https://cran.r-project.org/web/packages/gnm/index.html)|
|goftest|1.1-1|[https://cran.r-project.org/web/packages/goftest/index.html](https://cran.r-project.org/web/packages/goftest/index.html)|
|googleVis|0.6.2|[https://cran.r-project.org/web/packages/googleVis/index.html](https://cran.r-project.org/web/packages/googleVis/index.html)|
|gower|0.1.2|[https://cran.r-project.org/web/packages/gower/index.html](https://cran.r-project.org/web/packages/gower/index.html)|
|GPArotation|2014.11-1|[https://cran.r-project.org/web/packages/GPArotation/index.html](https://cran.r-project.org/web/packages/GPArotation/index.html)|
|gplots|3.0.1|[https://cran.r-project.org/web/packages/gplots/index.html](https://cran.r-project.org/web/packages/gplots/index.html)|
|graphics|3.4.4|NA|
|grDevices|3.4.4|NA|
|grid|3.4.4|NA|
|gridBase|0.4-7|[https://cran.r-project.org/web/packages/gridBase/index.html](https://cran.r-project.org/web/packages/gridBase/index.html)|
|gridExtra|2.3|[https://cran.r-project.org/web/packages/gridExtra/index.html](https://cran.r-project.org/web/packages/gridExtra/index.html)|
|gridGraphics|0.2-1|[https://cran.r-project.org/web/packages/gridGraphics/index.html](https://cran.r-project.org/web/packages/gridGraphics/index.html)|
|growcurves|0.2.4.1|[https://cran.r-project.org/web/packages/growcurves/index.html](https://cran.r-project.org/web/packages/growcurves/index.html)|
|grpreg|3.1-2|[https://cran.r-project.org/web/packages/grpreg/index.html](https://cran.r-project.org/web/packages/grpreg/index.html)|
|gss|2.1-7|[https://cran.r-project.org/web/packages/gss/index.html](https://cran.r-project.org/web/packages/gss/index.html)|
|gstat|1.1-5|[https://cran.r-project.org/web/packages/gstat/index.html](https://cran.r-project.org/web/packages/gstat/index.html)|
|gsubfn|0.7|[https://cran.r-project.org/web/packages/gsubfn/index.html](https://cran.r-project.org/web/packages/gsubfn/index.html)|
|gtable|0.2.0|[https://cran.r-project.org/web/packages/gtable/index.html](https://cran.r-project.org/web/packages/gtable/index.html)|
|gtools|3.5.0|[https://cran.r-project.org/web/packages/gtools/index.html](https://cran.r-project.org/web/packages/gtools/index.html)|
|gtrendsR|1.4.3|[https://cran.r-project.org/web/packages/gtrendsR/index.html](https://cran.r-project.org/web/packages/gtrendsR/index.html)|
|gWidgets|0.0-54|[https://cran.r-project.org/web/packages/gWidgets/index.html](https://cran.r-project.org/web/packages/gWidgets/index.html)|
|gWidgetsRGtk2|0.0-86|[https://cran.r-project.org/web/packages/gWidgetsRGtk2/index.html](https://cran.r-project.org/web/packages/gWidgetsRGtk2/index.html)|
|gWidgetstcltk|0.0-55|[https://cran.r-project.org/web/packages/gWidgetstcltk/index.html](https://cran.r-project.org/web/packages/gWidgetstcltk/index.html)|
|haplo.stats|1.7.7|[https://cran.r-project.org/web/packages/haplo.stats/index.html](https://cran.r-project.org/web/packages/haplo.stats/index.html)|
|hash|2.2.6|[https://cran.r-project.org/web/packages/hash/index.html](https://cran.r-project.org/web/packages/hash/index.html)|
|haven|1.1.1|[https://cran.r-project.org/web/packages/haven/index.html](https://cran.r-project.org/web/packages/haven/index.html)|
|hbsae|1.0|[https://cran.r-project.org/web/packages/hbsae/index.html](https://cran.r-project.org/web/packages/hbsae/index.html)|
|HDInterval|0.2.0|[https://cran.r-project.org/web/packages/HDInterval/index.html](https://cran.r-project.org/web/packages/HDInterval/index.html)|
|hdrcde|3.2|[https://cran.r-project.org/web/packages/hdrcde/index.html](https://cran.r-project.org/web/packages/hdrcde/index.html)|
|heatmaply|0.16.0|[https://cran.r-project.org/web/packages/heatmaply/index.html](https://cran.r-project.org/web/packages/heatmaply/index.html)|
|heavy|0.38.19|[https://cran.r-project.org/web/packages/heavy/index.html](https://cran.r-project.org/web/packages/heavy/index.html)|
|hexbin|1.27.2|[https://cran.r-project.org/web/packages/hexbin/index.html](https://cran.r-project.org/web/packages/hexbin/index.html)|
|hflights|0.1|[https://cran.r-project.org/web/packages/hflights/index.html](https://cran.r-project.org/web/packages/hflights/index.html)|
|HH|3.1-34|[https://cran.r-project.org/web/packages/HH/index.html](https://cran.r-project.org/web/packages/HH/index.html)|
|HI|0.4|[https://cran.r-project.org/web/packages/HI/index.html](https://cran.r-project.org/web/packages/HI/index.html)|
|highcharter|0.5.0|[https://cran.r-project.org/web/packages/highcharter/index.html](https://cran.r-project.org/web/packages/highcharter/index.html)|
|highr|0.6|[https://cran.r-project.org/web/packages/highr/index.html](https://cran.r-project.org/web/packages/highr/index.html)|
|HistData|0.8-2|[https://cran.r-project.org/web/packages/HistData/index.html](https://cran.r-project.org/web/packages/HistData/index.html)|
|Hmisc|4.1-1|[https://cran.r-project.org/web/packages/Hmisc/index.html](https://cran.r-project.org/web/packages/Hmisc/index.html)|
|hms|0.4.2|[https://cran.r-project.org/web/packages/hms/index.html](https://cran.r-project.org/web/packages/hms/index.html)|
|hoardr|0.2.0|[https://cran.r-project.org/web/packages/hoardr/index.html](https://cran.r-project.org/web/packages/hoardr/index.html)|
|hrbrthemes|0.6.0|[https://cran.r-project.org/web/packages/hrbrthemes/index.html](https://cran.r-project.org/web/packages/hrbrthemes/index.html)|
|HSAUR|1.3-9|[https://cran.r-project.org/web/packages/HSAUR/index.html](https://cran.r-project.org/web/packages/HSAUR/index.html)|
|htmlTable|1.11.2|[https://cran.r-project.org/web/packages/htmlTable/index.html](https://cran.r-project.org/web/packages/htmlTable/index.html)|
|htmltools|0.3.6|[https://cran.r-project.org/web/packages/htmltools/index.html](https://cran.r-project.org/web/packages/htmltools/index.html)|
|htmlwidgets|1.3|[https://cran.r-project.org/web/packages/htmlwidgets/index.html](https://cran.r-project.org/web/packages/htmlwidgets/index.html)|
|hts|5.1.5|[https://cran.r-project.org/web/packages/hts/index.html](https://cran.r-project.org/web/packages/hts/index.html)|
|httpuv|1.3.6.2|[https://cran.r-project.org/web/packages/httpuv/index.html](https://cran.r-project.org/web/packages/httpuv/index.html)|
|httr|1.3.1|[https://cran.r-project.org/web/packages/httr/index.html](https://cran.r-project.org/web/packages/httr/index.html)|
|huge|1.2.7|[https://cran.r-project.org/web/packages/huge/index.html](https://cran.r-project.org/web/packages/huge/index.html)|
|hunspell|2.9|[https://cran.r-project.org/web/packages/hunspell/index.html](https://cran.r-project.org/web/packages/hunspell/index.html)|
|hydroTSM|0.5-1|[https://cran.r-project.org/web/packages/hydroTSM/index.html](https://cran.r-project.org/web/packages/hydroTSM/index.html)|
|IBrokers|0.9-12|[https://cran.r-project.org/web/packages/IBrokers/index.html](https://cran.r-project.org/web/packages/IBrokers/index.html)|
|ifultools|2.0-4|[https://cran.r-project.org/web/packages/ifultools/index.html](https://cran.r-project.org/web/packages/ifultools/index.html)|
|igraph|1.2.1|[https://cran.r-project.org/web/packages/igraph/index.html](https://cran.r-project.org/web/packages/igraph/index.html)|
|imager|0.40.2|[https://cran.r-project.org/web/packages/imager/index.html](https://cran.r-project.org/web/packages/imager/index.html)|
|imputeTS|2.7|[https://cran.r-project.org/web/packages/imputeTS/index.html](https://cran.r-project.org/web/packages/imputeTS/index.html)|
|incidence|1.7.2|[https://cran.r-project.org/web/packages/incidence/index.html](https://cran.r-project.org/web/packages/incidence/index.html)|
|influenceR|0.1.0|[https://cran.r-project.org/web/packages/influenceR/index.html](https://cran.r-project.org/web/packages/influenceR/index.html)|
|InformationValue|1.2.3|[https://cran.r-project.org/web/packages/InformationValue/index.html](https://cran.r-project.org/web/packages/InformationValue/index.html)|
|inline|0.3.14|[https://cran.r-project.org/web/packages/inline/index.html](https://cran.r-project.org/web/packages/inline/index.html)|
|intervals|0.15.1|[https://cran.r-project.org/web/packages/intervals/index.html](https://cran.r-project.org/web/packages/intervals/index.html)|
|inum|1.0-0|[https://cran.r-project.org/web/packages/inum/index.html](https://cran.r-project.org/web/packages/inum/index.html)|
|investr|1.4.2|[https://cran.r-project.org/web/packages/investr/index.html](https://cran.r-project.org/web/packages/investr/index.html)|
|ipred|0.9-6|[https://cran.r-project.org/web/packages/ipred/index.html](https://cran.r-project.org/web/packages/ipred/index.html)|
|irlba|2.3.2|[https://cran.r-project.org/web/packages/irlba/index.html](https://cran.r-project.org/web/packages/irlba/index.html)|
|irr|0.84|[https://cran.r-project.org/web/packages/irr/index.html](https://cran.r-project.org/web/packages/irr/index.html)|
|isoband|0.2.0|[https://cran.r-project.org/web/packages/isoband/index.html](https://cran.r-project.org/web/packages/isoband/index.html)|
|ISOcodes|2017.09.27|[https://cran.r-project.org/web/packages/ISOcodes/index.html](https://cran.r-project.org/web/packages/ISOcodes/index.html)|
|iterators|1.0.9|[https://cran.r-project.org/web/packages/iterators/index.html](https://cran.r-project.org/web/packages/iterators/index.html)|
|janeaustenr|0.1.5|[https://cran.r-project.org/web/packages/janeaustenr/index.html](https://cran.r-project.org/web/packages/janeaustenr/index.html)|
|janitor|1.0.0|[https://cran.r-project.org/web/packages/janitor/index.html](https://cran.r-project.org/web/packages/janitor/index.html)|
|jmvcore|1.0.8|[https://cran.r-project.org/web/packages/jmvcore/index.html](https://cran.r-project.org/web/packages/jmvcore/index.html)|
|jpeg|0.1-8|[https://cran.r-project.org/web/packages/jpeg/index.html](https://cran.r-project.org/web/packages/jpeg/index.html)|
|jqr|1.0.0|[https://cran.r-project.org/web/packages/jqr/index.html](https://cran.r-project.org/web/packages/jqr/index.html)|
|jsonlite|1.6|[https://cran.r-project.org/web/packages/jsonlite/index.html](https://cran.r-project.org/web/packages/jsonlite/index.html)|
|jsonvalidate|1.0.0|[https://cran.r-project.org/web/packages/jsonvalidate/index.html](https://cran.r-project.org/web/packages/jsonvalidate/index.html)|
|jtools|0.9.4|[https://cran.r-project.org/web/packages/jtools/index.html](https://cran.r-project.org/web/packages/jtools/index.html)|
|kableExtra|0.7.0|[https://cran.r-project.org/web/packages/kableExtra/index.html](https://cran.r-project.org/web/packages/kableExtra/index.html)|
|Kendall|2.2|[https://cran.r-project.org/web/packages/Kendall/index.html](https://cran.r-project.org/web/packages/Kendall/index.html)|
|kernlab|0.9-25|[https://cran.r-project.org/web/packages/kernlab/index.html](https://cran.r-project.org/web/packages/kernlab/index.html)|
|KernSmooth|2.23-15|[https://cran.r-project.org/web/packages/KernSmooth/index.html](https://cran.r-project.org/web/packages/KernSmooth/index.html)|
|KFKSDS|1.6|[https://cran.r-project.org/web/packages/KFKSDS/index.html](https://cran.r-project.org/web/packages/KFKSDS/index.html)|
|kinship2|1.6.4|[https://cran.r-project.org/web/packages/kinship2/index.html](https://cran.r-project.org/web/packages/kinship2/index.html)|
|kknn|1.3.1|[https://cran.r-project.org/web/packages/kknn/index.html](https://cran.r-project.org/web/packages/kknn/index.html)|
|klaR|0.6-14|[https://cran.r-project.org/web/packages/klaR/index.html](https://cran.r-project.org/web/packages/klaR/index.html)|
|km.ci|0.5-2|[https://cran.r-project.org/web/packages/km.ci/index.html](https://cran.r-project.org/web/packages/km.ci/index.html)|
|KMsurv|0.1-5|[https://cran.r-project.org/web/packages/KMsurv/index.html](https://cran.r-project.org/web/packages/KMsurv/index.html)|
|knitr|1.20|[https://cran.r-project.org/web/packages/knitr/index.html](https://cran.r-project.org/web/packages/knitr/index.html)|
|ks|1.11.0|[https://cran.r-project.org/web/packages/ks/index.html](https://cran.r-project.org/web/packages/ks/index.html)|
|labeling|0.3|[https://cran.r-project.org/web/packages/labeling/index.html](https://cran.r-project.org/web/packages/labeling/index.html)|
|labelled|1.0.1|[https://cran.r-project.org/web/packages/labelled/index.html](https://cran.r-project.org/web/packages/labelled/index.html)|
|laeken|0.4.6|[https://cran.r-project.org/web/packages/laeken/index.html](https://cran.r-project.org/web/packages/laeken/index.html)|
|Lahman|6.0-0|[https://cran.r-project.org/web/packages/Lahman/index.html](https://cran.r-project.org/web/packages/Lahman/index.html)|
|lambda.r|1.2|[https://cran.r-project.org/web/packages/lambda.r/index.html](https://cran.r-project.org/web/packages/lambda.r/index.html)|
|lars|1.2|[https://cran.r-project.org/web/packages/lars/index.html](https://cran.r-project.org/web/packages/lars/index.html)|
|later|1.0.0|[https://cran.r-project.org/web/packages/later/index.html](https://cran.r-project.org/web/packages/later/index.html)|
|latex2exp|0.4.0|[https://cran.r-project.org/web/packages/latex2exp/index.html](https://cran.r-project.org/web/packages/latex2exp/index.html)|
|lattice|0.20-35|[https://cran.r-project.org/web/packages/lattice/index.html](https://cran.r-project.org/web/packages/lattice/index.html)|
|latticeExtra|0.6-28|[https://cran.r-project.org/web/packages/latticeExtra/index.html](https://cran.r-project.org/web/packages/latticeExtra/index.html)|
|lava|1.6.1|[https://cran.r-project.org/web/packages/lava/index.html](https://cran.r-project.org/web/packages/lava/index.html)|
|lavaan|0.5-23.1097|[https://cran.r-project.org/web/packages/lavaan/index.html](https://cran.r-project.org/web/packages/lavaan/index.html)|
|lazyeval|0.2.1|[https://cran.r-project.org/web/packages/lazyeval/index.html](https://cran.r-project.org/web/packages/lazyeval/index.html)|
|lda|1.4.2|[https://cran.r-project.org/web/packages/lda/index.html](https://cran.r-project.org/web/packages/lda/index.html)|
|leaflet|2.0.2|[https://cran.r-project.org/web/packages/leaflet/index.html](https://cran.r-project.org/web/packages/leaflet/index.html)|
|leaflet.esri|0.2|[https://cran.r-project.org/web/packages/leaflet.esri/index.html](https://cran.r-project.org/web/packages/leaflet.esri/index.html)|
|leaflet.extras|0.2|[https://cran.r-project.org/web/packages/leaflet.extras/index.html](https://cran.r-project.org/web/packages/leaflet.extras/index.html)|
|leaps|3.0|[https://cran.r-project.org/web/packages/leaps/index.html](https://cran.r-project.org/web/packages/leaps/index.html)|
|LearnBayes|2.15.1|[https://cran.r-project.org/web/packages/LearnBayes/index.html](https://cran.r-project.org/web/packages/LearnBayes/index.html)|
|lexicon|1.2.1|[https://cran.r-project.org/web/packages/lexicon/index.html](https://cran.r-project.org/web/packages/lexicon/index.html)|
|libcoin|1.0-1|[https://cran.r-project.org/web/packages/libcoin/index.html](https://cran.r-project.org/web/packages/libcoin/index.html)|
|LiblineaR|2.10-8|[https://cran.r-project.org/web/packages/LiblineaR/index.html](https://cran.r-project.org/web/packages/LiblineaR/index.html)|
|LICORS|0.2.0|[https://cran.r-project.org/web/packages/LICORS/index.html](https://cran.r-project.org/web/packages/LICORS/index.html)|
|lifecycle|0.1.0|[https://cran.r-project.org/web/packages/lifecycle/index.html](https://cran.r-project.org/web/packages/lifecycle/index.html)|
|likert|1.3.5|[https://cran.r-project.org/web/packages/likert/index.html](https://cran.r-project.org/web/packages/likert/index.html)|
|limSolve|1.5.5.3|[https://cran.r-project.org/web/packages/limSolve/index.html](https://cran.r-project.org/web/packages/limSolve/index.html)|
|linelist|0.0.40.9000|[https://cran.r-project.org/web/packages/linelist/index.html](https://cran.r-project.org/web/packages/linelist/index.html)|
|linprog|0.9-2|[https://cran.r-project.org/web/packages/linprog/index.html](https://cran.r-project.org/web/packages/linprog/index.html)|
|listenv|0.7.0|[https://cran.r-project.org/web/packages/listenv/index.html](https://cran.r-project.org/web/packages/listenv/index.html)|
|lm.beta|1.5-1|[https://cran.r-project.org/web/packages/lm.beta/index.html](https://cran.r-project.org/web/packages/lm.beta/index.html)|
|lme4|1.1-16|[https://cran.r-project.org/web/packages/lme4/index.html](https://cran.r-project.org/web/packages/lme4/index.html)|
|lmm|1.0|[https://cran.r-project.org/web/packages/lmm/index.html](https://cran.r-project.org/web/packages/lmm/index.html)|
|lmtest|0.9-35|[https://cran.r-project.org/web/packages/lmtest/index.html](https://cran.r-project.org/web/packages/lmtest/index.html)|
|locfit|1.5-9.1|[https://cran.r-project.org/web/packages/locfit/index.html](https://cran.r-project.org/web/packages/locfit/index.html)|
|locpol|0.6-0|[https://cran.r-project.org/web/packages/locpol/index.html](https://cran.r-project.org/web/packages/locpol/index.html)|
|LogicReg|1.5.9|[https://cran.r-project.org/web/packages/LogicReg/index.html](https://cran.r-project.org/web/packages/LogicReg/index.html)|
|lpSolve|5.6.13|[https://cran.r-project.org/web/packages/lpSolve/index.html](https://cran.r-project.org/web/packages/lpSolve/index.html)|
|lsa|0.73.1|[https://cran.r-project.org/web/packages/lsa/index.html](https://cran.r-project.org/web/packages/lsa/index.html)|
|lsmeans|2.27-61|[https://cran.r-project.org/web/packages/lsmeans/index.html](https://cran.r-project.org/web/packages/lsmeans/index.html)|
|lubridate|1.7.2|[https://cran.r-project.org/web/packages/lubridate/index.html](https://cran.r-project.org/web/packages/lubridate/index.html)|
|magic|1.5-8|[https://cran.r-project.org/web/packages/magic/index.html](https://cran.r-project.org/web/packages/magic/index.html)|
|magick|1.8|[https://cran.r-project.org/web/packages/magick/index.html](https://cran.r-project.org/web/packages/magick/index.html)|
|magrittr|1.5|[https://cran.r-project.org/web/packages/magrittr/index.html](https://cran.r-project.org/web/packages/magrittr/index.html)|
|manipulateWidget|0.9.0|[https://cran.r-project.org/web/packages/manipulateWidget/index.html](https://cran.r-project.org/web/packages/manipulateWidget/index.html)|
|MAPA|2.0.4|[https://cran.r-project.org/web/packages/MAPA/index.html](https://cran.r-project.org/web/packages/MAPA/index.html)|
|mapdata|2.3.0|[https://cran.r-project.org/web/packages/mapdata/index.html](https://cran.r-project.org/web/packages/mapdata/index.html)|
|mapproj|1.2.6|[https://cran.r-project.org/web/packages/mapproj/index.html](https://cran.r-project.org/web/packages/mapproj/index.html)|
|maps|3.2.0|[https://cran.r-project.org/web/packages/maps/index.html](https://cran.r-project.org/web/packages/maps/index.html)|
|maptools|0.9-2|[https://cran.r-project.org/web/packages/maptools/index.html](https://cran.r-project.org/web/packages/maptools/index.html)|
|maptree|1.4-7|[https://cran.r-project.org/web/packages/maptree/index.html](https://cran.r-project.org/web/packages/maptree/index.html)|
|mapview|2.3.0|[https://cran.r-project.org/web/packages/mapview/index.html](https://cran.r-project.org/web/packages/mapview/index.html)|
|marima|2.2|[https://cran.r-project.org/web/packages/marima/index.html](https://cran.r-project.org/web/packages/marima/index.html)|
|markdown|0.8|[https://cran.r-project.org/web/packages/markdown/index.html](https://cran.r-project.org/web/packages/markdown/index.html)|
|MASS|7.3-49|[https://cran.r-project.org/web/packages/MASS/index.html](https://cran.r-project.org/web/packages/MASS/index.html)|
|MasterBayes|2.55|[https://cran.r-project.org/web/packages/MasterBayes/index.html](https://cran.r-project.org/web/packages/MasterBayes/index.html)|
|Matching|4.9-5|[https://cran.r-project.org/web/packages/Matching/index.html](https://cran.r-project.org/web/packages/Matching/index.html)|
|MatchIt|3.0.2|[https://cran.r-project.org/web/packages/MatchIt/index.html](https://cran.r-project.org/web/packages/MatchIt/index.html)|
|matchmaker|0.1.1|[https://cran.r-project.org/web/packages/matchmaker/index.html](https://cran.r-project.org/web/packages/matchmaker/index.html)|
|Matrix|1.2-12|[https://cran.r-project.org/web/packages/Matrix/index.html](https://cran.r-project.org/web/packages/Matrix/index.html)|
|matrixcalc|1.0-3|[https://cran.r-project.org/web/packages/matrixcalc/index.html](https://cran.r-project.org/web/packages/matrixcalc/index.html)|
|MatrixModels|0.4-1|[https://cran.r-project.org/web/packages/MatrixModels/index.html](https://cran.r-project.org/web/packages/MatrixModels/index.html)|
|matrixStats|0.54.0|[https://cran.r-project.org/web/packages/matrixStats/index.html](https://cran.r-project.org/web/packages/matrixStats/index.html)|
|maxent|1.3.3.1|[https://cran.r-project.org/web/packages/maxent/index.html](https://cran.r-project.org/web/packages/maxent/index.html)|
|maxLik|1.3-4|[https://cran.r-project.org/web/packages/maxLik/index.html](https://cran.r-project.org/web/packages/maxLik/index.html)|
|maxstat|0.7-25|[https://cran.r-project.org/web/packages/maxstat/index.html](https://cran.r-project.org/web/packages/maxstat/index.html)|
|mboost|2.8-1|[https://cran.r-project.org/web/packages/mboost/index.html](https://cran.r-project.org/web/packages/mboost/index.html)|
|mclust|5.4|[https://cran.r-project.org/web/packages/mclust/index.html](https://cran.r-project.org/web/packages/mclust/index.html)|
|mcmc|0.9-5|[https://cran.r-project.org/web/packages/mcmc/index.html](https://cran.r-project.org/web/packages/mcmc/index.html)|
|MCMCglmm|2.25|[https://cran.r-project.org/web/packages/MCMCglmm/index.html](https://cran.r-project.org/web/packages/MCMCglmm/index.html)|
|mda|0.4-10|[https://cran.r-project.org/web/packages/mda/index.html](https://cran.r-project.org/web/packages/mda/index.html)|
|memoise|1.1.0|[https://cran.r-project.org/web/packages/memoise/index.html](https://cran.r-project.org/web/packages/memoise/index.html)|
|merTools|0.3.0|[https://cran.r-project.org/web/packages/merTools/index.html](https://cran.r-project.org/web/packages/merTools/index.html)|
|meta|4.9-1|[https://cran.r-project.org/web/packages/meta/index.html](https://cran.r-project.org/web/packages/meta/index.html)|
|metafor|2.0-0|[https://cran.r-project.org/web/packages/metafor/index.html](https://cran.r-project.org/web/packages/metafor/index.html)|
|methods|3.4.4|NA|
|metricsgraphics|0.9.0|[https://cran.r-project.org/web/packages/metricsgraphics/index.html](https://cran.r-project.org/web/packages/metricsgraphics/index.html)|
|mgcv|1.8-23|[https://cran.r-project.org/web/packages/mgcv/index.html](https://cran.r-project.org/web/packages/mgcv/index.html)|
|mgsub|1.7.1|[https://cran.r-project.org/web/packages/mgsub/index.html](https://cran.r-project.org/web/packages/mgsub/index.html)|
|mi|1.0|[https://cran.r-project.org/web/packages/mi/index.html](https://cran.r-project.org/web/packages/mi/index.html)|
|mice|2.46.0|[https://cran.r-project.org/web/packages/mice/index.html](https://cran.r-project.org/web/packages/mice/index.html)|
|microbenchmark|1.4-4|[https://cran.r-project.org/web/packages/microbenchmark/index.html](https://cran.r-project.org/web/packages/microbenchmark/index.html)|
|MicrosoftR|3.4.4.0105|NA|
|mime|0.5|[https://cran.r-project.org/web/packages/mime/index.html](https://cran.r-project.org/web/packages/mime/index.html)|
|miniCRAN|0.2.11|[https://cran.r-project.org/web/packages/miniCRAN/index.html](https://cran.r-project.org/web/packages/miniCRAN/index.html)|
|miniUI|0.1.1|[https://cran.r-project.org/web/packages/miniUI/index.html](https://cran.r-project.org/web/packages/miniUI/index.html)|
|minpack.lm|1.2-1|[https://cran.r-project.org/web/packages/minpack.lm/index.html](https://cran.r-project.org/web/packages/minpack.lm/index.html)|
|minqa|1.2.4|[https://cran.r-project.org/web/packages/minqa/index.html](https://cran.r-project.org/web/packages/minqa/index.html)|
|mirt|1.27.1|[https://cran.r-project.org/web/packages/mirt/index.html](https://cran.r-project.org/web/packages/mirt/index.html)|
|misc3d|0.8-4|[https://cran.r-project.org/web/packages/misc3d/index.html](https://cran.r-project.org/web/packages/misc3d/index.html)|
|miscTools|0.6-22|[https://cran.r-project.org/web/packages/miscTools/index.html](https://cran.r-project.org/web/packages/miscTools/index.html)|
|mitools|2.3|[https://cran.r-project.org/web/packages/mitools/index.html](https://cran.r-project.org/web/packages/mitools/index.html)|
|mixtools|1.1.0|[https://cran.r-project.org/web/packages/mixtools/index.html](https://cran.r-project.org/web/packages/mixtools/index.html)|
|mlapi|0.1.0|[https://cran.r-project.org/web/packages/mlapi/index.html](https://cran.r-project.org/web/packages/mlapi/index.html)|
|mlbench|2.1-1|[https://cran.r-project.org/web/packages/mlbench/index.html](https://cran.r-project.org/web/packages/mlbench/index.html)|
|mlogitBMA|0.1-6|[https://cran.r-project.org/web/packages/mlogitBMA/index.html](https://cran.r-project.org/web/packages/mlogitBMA/index.html)|
|mnormt|1.5-5|[https://cran.r-project.org/web/packages/mnormt/index.html](https://cran.r-project.org/web/packages/mnormt/index.html)|
|MNP|3.1-0|[https://cran.r-project.org/web/packages/MNP/index.html](https://cran.r-project.org/web/packages/MNP/index.html)|
|ModelMetrics|1.1.0|[https://cran.r-project.org/web/packages/ModelMetrics/index.html](https://cran.r-project.org/web/packages/ModelMetrics/index.html)|
|modelr|0.1.1|[https://cran.r-project.org/web/packages/modelr/index.html](https://cran.r-project.org/web/packages/modelr/index.html)|
|modeltools|0.2-21|[https://cran.r-project.org/web/packages/modeltools/index.html](https://cran.r-project.org/web/packages/modeltools/index.html)|
|mombf|1.9.6|[https://cran.r-project.org/web/packages/mombf/index.html](https://cran.r-project.org/web/packages/mombf/index.html)|
|moments|0.14|[https://cran.r-project.org/web/packages/moments/index.html](https://cran.r-project.org/web/packages/moments/index.html)|
|monomvn|1.9-7|[https://cran.r-project.org/web/packages/monomvn/index.html](https://cran.r-project.org/web/packages/monomvn/index.html)|
|monreg|0.1.3|[https://cran.r-project.org/web/packages/monreg/index.html](https://cran.r-project.org/web/packages/monreg/index.html)|
|mosaic|1.1.1|[https://cran.r-project.org/web/packages/mosaic/index.html](https://cran.r-project.org/web/packages/mosaic/index.html)|
|mosaicCore|0.4.2|[https://cran.r-project.org/web/packages/mosaicCore/index.html](https://cran.r-project.org/web/packages/mosaicCore/index.html)|
|mosaicData|0.16.0|[https://cran.r-project.org/web/packages/mosaicData/index.html](https://cran.r-project.org/web/packages/mosaicData/index.html)|
|MSBVAR|0.9-3|[https://cran.r-project.org/web/packages/MSBVAR/index.html](https://cran.r-project.org/web/packages/MSBVAR/index.html)|
|msir|1.3.2|[https://cran.r-project.org/web/packages/msir/index.html](https://cran.r-project.org/web/packages/msir/index.html)|
|msm|1.6.6|[https://cran.r-project.org/web/packages/msm/index.html](https://cran.r-project.org/web/packages/msm/index.html)|
|multcomp|1.4-8|[https://cran.r-project.org/web/packages/multcomp/index.html](https://cran.r-project.org/web/packages/multcomp/index.html)|
|multicool|0.1-10|[https://cran.r-project.org/web/packages/multicool/index.html](https://cran.r-project.org/web/packages/multicool/index.html)|
|munsell|0.5.0|[https://cran.r-project.org/web/packages/munsell/index.html](https://cran.r-project.org/web/packages/munsell/index.html)|
|mvoutlier|2.0.9|[https://cran.r-project.org/web/packages/mvoutlier/index.html](https://cran.r-project.org/web/packages/mvoutlier/index.html)|
|mvtnorm|1.0-7|[https://cran.r-project.org/web/packages/mvtnorm/index.html](https://cran.r-project.org/web/packages/mvtnorm/index.html)|
|NbClust|3.0|[https://cran.r-project.org/web/packages/NbClust/index.html](https://cran.r-project.org/web/packages/NbClust/index.html)|
|ncvreg|3.9-1|[https://cran.r-project.org/web/packages/ncvreg/index.html](https://cran.r-project.org/web/packages/ncvreg/index.html)|
|network|1.13.0|[https://cran.r-project.org/web/packages/network/index.html](https://cran.r-project.org/web/packages/network/index.html)|
|networkD3|0.4|[https://cran.r-project.org/web/packages/networkD3/index.html](https://cran.r-project.org/web/packages/networkD3/index.html)|
|neuralnet|1.33|[https://cran.r-project.org/web/packages/neuralnet/index.html](https://cran.r-project.org/web/packages/neuralnet/index.html)|
|ngram|3.0.4|[https://cran.r-project.org/web/packages/ngram/index.html](https://cran.r-project.org/web/packages/ngram/index.html)|
|nlme|3.1-131.1|[https://cran.r-project.org/web/packages/nlme/index.html](https://cran.r-project.org/web/packages/nlme/index.html)|
|nloptr|1.0.4|[https://cran.r-project.org/web/packages/nloptr/index.html](https://cran.r-project.org/web/packages/nloptr/index.html)|
|NLP|0.1-11|[https://cran.r-project.org/web/packages/NLP/index.html](https://cran.r-project.org/web/packages/NLP/index.html)|
|nls.multstart|1.2.0|[https://cran.r-project.org/web/packages/nls.multstart/index.html](https://cran.r-project.org/web/packages/nls.multstart/index.html)|
|NMF|0.21.0|[https://cran.r-project.org/web/packages/NMF/index.html](https://cran.r-project.org/web/packages/NMF/index.html)|
|nnet|7.3-12|[https://cran.r-project.org/web/packages/nnet/index.html](https://cran.r-project.org/web/packages/nnet/index.html)|
|nnls|1.4|[https://cran.r-project.org/web/packages/nnls/index.html](https://cran.r-project.org/web/packages/nnls/index.html)|
|nortest|1.0-4|[https://cran.r-project.org/web/packages/nortest/index.html](https://cran.r-project.org/web/packages/nortest/index.html)|
|numbers|0.6-6|[https://cran.r-project.org/web/packages/numbers/index.html](https://cran.r-project.org/web/packages/numbers/index.html)|
|numDeriv|2016.8-1|[https://cran.r-project.org/web/packages/numDeriv/index.html](https://cran.r-project.org/web/packages/numDeriv/index.html)|
|numform|0.4.0|[https://cran.r-project.org/web/packages/numform/index.html](https://cran.r-project.org/web/packages/numform/index.html)|
|OceanView|1.0.4|[https://cran.r-project.org/web/packages/OceanView/index.html](https://cran.r-project.org/web/packages/OceanView/index.html)|
|openair|2.3-0|[https://cran.r-project.org/web/packages/openair/index.html](https://cran.r-project.org/web/packages/openair/index.html)|
|openssl|1.0.1|[https://cran.r-project.org/web/packages/openssl/index.html](https://cran.r-project.org/web/packages/openssl/index.html)|
|osmar|1.1-7|[https://cran.r-project.org/web/packages/osmar/index.html](https://cran.r-project.org/web/packages/osmar/index.html)|
|outbreaks|1.5.0|[https://cran.r-project.org/web/packages/outbreaks/index.html](https://cran.r-project.org/web/packages/outbreaks/index.html)|
|OutlierDC|0.3-0|[https://cran.r-project.org/web/packages/OutlierDC/index.html](https://cran.r-project.org/web/packages/OutlierDC/index.html)|
|OutlierDM|1.1.1|[https://cran.r-project.org/web/packages/OutlierDM/index.html](https://cran.r-project.org/web/packages/OutlierDM/index.html)|
|outliers|0.14|[https://cran.r-project.org/web/packages/outliers/index.html](https://cran.r-project.org/web/packages/outliers/index.html)|
|pacbpred|0.92.2|[https://cran.r-project.org/web/packages/pacbpred/index.html](https://cran.r-project.org/web/packages/pacbpred/index.html)|
|packcircles|0.3.3|[https://cran.r-project.org/web/packages/packcircles/index.html](https://cran.r-project.org/web/packages/packcircles/index.html)|
|padr|0.4.0|[https://cran.r-project.org/web/packages/padr/index.html](https://cran.r-project.org/web/packages/padr/index.html)|
|parallel|3.4.4|NA|
|partitions|1.9-19|[https://cran.r-project.org/web/packages/partitions/index.html](https://cran.r-project.org/web/packages/partitions/index.html)|
|party|1.2-4|[https://cran.r-project.org/web/packages/party/index.html](https://cran.r-project.org/web/packages/party/index.html)|
|partykit|1.2-0|[https://cran.r-project.org/web/packages/partykit/index.html](https://cran.r-project.org/web/packages/partykit/index.html)|
|PAWL|0.5|[https://cran.r-project.org/web/packages/PAWL/index.html](https://cran.r-project.org/web/packages/PAWL/index.html)|
|pbapply|1.3-4|[https://cran.r-project.org/web/packages/pbapply/index.html](https://cran.r-project.org/web/packages/pbapply/index.html)|
|pbivnorm|0.6.0|[https://cran.r-project.org/web/packages/pbivnorm/index.html](https://cran.r-project.org/web/packages/pbivnorm/index.html)|
|pbkrtest|0.4-7|[https://cran.r-project.org/web/packages/pbkrtest/index.html](https://cran.r-project.org/web/packages/pbkrtest/index.html)|
|PCAmixdata|3.1|[https://cran.r-project.org/web/packages/PCAmixdata/index.html](https://cran.r-project.org/web/packages/PCAmixdata/index.html)|
|pcaPP|1.9-73|[https://cran.r-project.org/web/packages/pcaPP/index.html](https://cran.r-project.org/web/packages/pcaPP/index.html)|
|pdc|1.0.3|[https://cran.r-project.org/web/packages/pdc/index.html](https://cran.r-project.org/web/packages/pdc/index.html)|
|pegas|0.12|[https://cran.r-project.org/web/packages/pegas/index.html](https://cran.r-project.org/web/packages/pegas/index.html)|
|PerformanceAnalytics|1.5.2|[https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html](https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html)|
|permute|0.9-4|[https://cran.r-project.org/web/packages/permute/index.html](https://cran.r-project.org/web/packages/permute/index.html)|
|perry|0.2.0|[https://cran.r-project.org/web/packages/perry/index.html](https://cran.r-project.org/web/packages/perry/index.html)|
|petrinetR|0.1.0|[https://cran.r-project.org/web/packages/petrinetR/index.html](https://cran.r-project.org/web/packages/petrinetR/index.html)|
|pheatmap|1.0.8|[https://cran.r-project.org/web/packages/pheatmap/index.html](https://cran.r-project.org/web/packages/pheatmap/index.html)|
|pillar|1.4.2|[https://cran.r-project.org/web/packages/pillar/index.html](https://cran.r-project.org/web/packages/pillar/index.html)|
|pixmap|0.4-11|[https://cran.r-project.org/web/packages/pixmap/index.html](https://cran.r-project.org/web/packages/pixmap/index.html)|
|pkgconfig|2.0.2|[https://cran.r-project.org/web/packages/pkgconfig/index.html](https://cran.r-project.org/web/packages/pkgconfig/index.html)|
|pkgmaker|0.22|[https://cran.r-project.org/web/packages/pkgmaker/index.html](https://cran.r-project.org/web/packages/pkgmaker/index.html)|
|platetools|0.1.0|[https://cran.r-project.org/web/packages/platetools/index.html](https://cran.r-project.org/web/packages/platetools/index.html)|
|plogr|0.2.0|[https://cran.r-project.org/web/packages/plogr/index.html](https://cran.r-project.org/web/packages/plogr/index.html)|
|plot3D|1.1.1|[https://cran.r-project.org/web/packages/plot3D/index.html](https://cran.r-project.org/web/packages/plot3D/index.html)|
|plot3Drgl|1.0.1|[https://cran.r-project.org/web/packages/plot3Drgl/index.html](https://cran.r-project.org/web/packages/plot3Drgl/index.html)|
|plotly|4.9.2.2|[https://cran.r-project.org/web/packages/plotly/index.html](https://cran.r-project.org/web/packages/plotly/index.html)|
|plotmo|3.3.6|[https://cran.r-project.org/web/packages/plotmo/index.html](https://cran.r-project.org/web/packages/plotmo/index.html)|
|plotrix|3.7|[https://cran.r-project.org/web/packages/plotrix/index.html](https://cran.r-project.org/web/packages/plotrix/index.html)|
|pls|2.6-0|[https://cran.r-project.org/web/packages/pls/index.html](https://cran.r-project.org/web/packages/pls/index.html)|
|plyr|1.8.4|[https://cran.r-project.org/web/packages/plyr/index.html](https://cran.r-project.org/web/packages/plyr/index.html)|
|png|0.1-7|[https://cran.r-project.org/web/packages/png/index.html](https://cran.r-project.org/web/packages/png/index.html)|
|polspline|1.1.12|[https://cran.r-project.org/web/packages/polspline/index.html](https://cran.r-project.org/web/packages/polspline/index.html)|
|polyclip|1.6-1|[https://cran.r-project.org/web/packages/polyclip/index.html](https://cran.r-project.org/web/packages/polyclip/index.html)|
|polylabelr|0.1.0|[https://cran.r-project.org/web/packages/polylabelr/index.html](https://cran.r-project.org/web/packages/polylabelr/index.html)|
|polynom|1.3-9|[https://cran.r-project.org/web/packages/polynom/index.html](https://cran.r-project.org/web/packages/polynom/index.html)|
|ppcor|1.1|[https://cran.r-project.org/web/packages/ppcor/index.html](https://cran.r-project.org/web/packages/ppcor/index.html)|
|prabclus|2.2-6|[https://cran.r-project.org/web/packages/prabclus/index.html](https://cran.r-project.org/web/packages/prabclus/index.html)|
|pracma|2.1.4|[https://cran.r-project.org/web/packages/pracma/index.html](https://cran.r-project.org/web/packages/pracma/index.html)|
|praise|1.0.0|[https://cran.r-project.org/web/packages/praise/index.html](https://cran.r-project.org/web/packages/praise/index.html)|
|precrec|0.10.1|[https://cran.r-project.org/web/packages/precrec/index.html](https://cran.r-project.org/web/packages/precrec/index.html)|
|prediction|0.2.0|[https://cran.r-project.org/web/packages/prediction/index.html](https://cran.r-project.org/web/packages/prediction/index.html)|
|predmixcor|1.1-1|[https://cran.r-project.org/web/packages/predmixcor/index.html](https://cran.r-project.org/web/packages/predmixcor/index.html)|
|PresenceAbsence|1.1.9|[https://cran.r-project.org/web/packages/PresenceAbsence/index.html](https://cran.r-project.org/web/packages/PresenceAbsence/index.html)|
|prettyunits|1.0.2|[https://cran.r-project.org/web/packages/prettyunits/index.html](https://cran.r-project.org/web/packages/prettyunits/index.html)|
|pROC|1.11.0|[https://cran.r-project.org/web/packages/pROC/index.html](https://cran.r-project.org/web/packages/pROC/index.html)|
|processmapR|0.3.3|[https://cran.r-project.org/web/packages/processmapR/index.html](https://cran.r-project.org/web/packages/processmapR/index.html)|
|processmonitR|0.1.0|[https://cran.r-project.org/web/packages/processmonitR/index.html](https://cran.r-project.org/web/packages/processmonitR/index.html)|
|processx|2.0.0.1|[https://cran.r-project.org/web/packages/processx/index.html](https://cran.r-project.org/web/packages/processx/index.html)|
|prodlim|1.6.1|[https://cran.r-project.org/web/packages/prodlim/index.html](https://cran.r-project.org/web/packages/prodlim/index.html)|
|profdpm|3.3|[https://cran.r-project.org/web/packages/profdpm/index.html](https://cran.r-project.org/web/packages/profdpm/index.html)|
|profileModel|0.5-9|[https://cran.r-project.org/web/packages/profileModel/index.html](https://cran.r-project.org/web/packages/profileModel/index.html)|
|progress|1.1.2|[https://cran.r-project.org/web/packages/progress/index.html](https://cran.r-project.org/web/packages/progress/index.html)|
|proj4|1.0-8|[https://cran.r-project.org/web/packages/proj4/index.html](https://cran.r-project.org/web/packages/proj4/index.html)|
|promises|1.1.0|[https://cran.r-project.org/web/packages/promises/index.html](https://cran.r-project.org/web/packages/promises/index.html)|
|prophet|0.2.1|[https://cran.r-project.org/web/packages/prophet/index.html](https://cran.r-project.org/web/packages/prophet/index.html)|
|proto|1.0.0|[https://cran.r-project.org/web/packages/proto/index.html](https://cran.r-project.org/web/packages/proto/index.html)|
|protolite|1.7|[https://cran.r-project.org/web/packages/protolite/index.html](https://cran.r-project.org/web/packages/protolite/index.html)|
|proxy|0.4-21|[https://cran.r-project.org/web/packages/proxy/index.html](https://cran.r-project.org/web/packages/proxy/index.html)|
|pryr|0.1.4|[https://cran.r-project.org/web/packages/pryr/index.html](https://cran.r-project.org/web/packages/pryr/index.html)|
|pscl|1.5.2|[https://cran.r-project.org/web/packages/pscl/index.html](https://cran.r-project.org/web/packages/pscl/index.html)|
|psych|1.8.3.3|[https://cran.r-project.org/web/packages/psych/index.html](https://cran.r-project.org/web/packages/psych/index.html)|
|purrr|0.3.3|[https://cran.r-project.org/web/packages/purrr/index.html](https://cran.r-project.org/web/packages/purrr/index.html)|
|pwr|1.2-2|[https://cran.r-project.org/web/packages/pwr/index.html](https://cran.r-project.org/web/packages/pwr/index.html)|
|qap|0.1-1|[https://cran.r-project.org/web/packages/qap/index.html](https://cran.r-project.org/web/packages/qap/index.html)|
|qcc|2.7|[https://cran.r-project.org/web/packages/qcc/index.html](https://cran.r-project.org/web/packages/qcc/index.html)|
|qdapDictionaries|1.0.7|[https://cran.r-project.org/web/packages/qdapDictionaries/index.html](https://cran.r-project.org/web/packages/qdapDictionaries/index.html)|
|qdapRegex|0.7.2|[https://cran.r-project.org/web/packages/qdapRegex/index.html](https://cran.r-project.org/web/packages/qdapRegex/index.html)|
|qdapTools|1.3.3|[https://cran.r-project.org/web/packages/qdapTools/index.html](https://cran.r-project.org/web/packages/qdapTools/index.html)|
|qgraph|1.4.4|[https://cran.r-project.org/web/packages/qgraph/index.html](https://cran.r-project.org/web/packages/qgraph/index.html)|
|qicharts|0.5.5|[https://cran.r-project.org/web/packages/qicharts/index.html](https://cran.r-project.org/web/packages/qicharts/index.html)|
|qicharts2|0.6.0|[https://cran.r-project.org/web/packages/qicharts2/index.html](https://cran.r-project.org/web/packages/qicharts2/index.html)|
|quadprog|1.5-5|[https://cran.r-project.org/web/packages/quadprog/index.html](https://cran.r-project.org/web/packages/quadprog/index.html)|
|qualityTools|1.55|[https://cran.r-project.org/web/packages/qualityTools/index.html](https://cran.r-project.org/web/packages/qualityTools/index.html)|
|quanteda|1.1.1|[https://cran.r-project.org/web/packages/quanteda/index.html](https://cran.r-project.org/web/packages/quanteda/index.html)|
|quantmod|0.4-12|[https://cran.r-project.org/web/packages/quantmod/index.html](https://cran.r-project.org/web/packages/quantmod/index.html)|
|quantreg|5.35|[https://cran.r-project.org/web/packages/quantreg/index.html](https://cran.r-project.org/web/packages/quantreg/index.html)|
|questionr|0.6.2|[https://cran.r-project.org/web/packages/questionr/index.html](https://cran.r-project.org/web/packages/questionr/index.html)|
|qvcalc|0.9-1|[https://cran.r-project.org/web/packages/qvcalc/index.html](https://cran.r-project.org/web/packages/qvcalc/index.html)|
|R.matlab|3.6.1|[https://cran.r-project.org/web/packages/R.matlab/index.html](https://cran.r-project.org/web/packages/R.matlab/index.html)|
|R.methodsS3|1.7.1|[https://cran.r-project.org/web/packages/R.methodsS3/index.html](https://cran.r-project.org/web/packages/R.methodsS3/index.html)|
|R.oo|1.21.0|[https://cran.r-project.org/web/packages/R.oo/index.html](https://cran.r-project.org/web/packages/R.oo/index.html)|
|R.utils|2.6.0|[https://cran.r-project.org/web/packages/R.utils/index.html](https://cran.r-project.org/web/packages/R.utils/index.html)|
|r2d3|0.2.3|[https://cran.r-project.org/web/packages/r2d3/index.html](https://cran.r-project.org/web/packages/r2d3/index.html)|
|R2HTML|2.3.2|[https://cran.r-project.org/web/packages/R2HTML/index.html](https://cran.r-project.org/web/packages/R2HTML/index.html)|
|R2jags|0.5-7|[https://cran.r-project.org/web/packages/R2jags/index.html](https://cran.r-project.org/web/packages/R2jags/index.html)|
|R2OpenBUGS|3.2-3.2|[https://cran.r-project.org/web/packages/R2OpenBUGS/index.html](https://cran.r-project.org/web/packages/R2OpenBUGS/index.html)|
|R2WinBUGS|2.1-21|[https://cran.r-project.org/web/packages/R2WinBUGS/index.html](https://cran.r-project.org/web/packages/R2WinBUGS/index.html)|
|R6|2.2.2|[https://cran.r-project.org/web/packages/R6/index.html](https://cran.r-project.org/web/packages/R6/index.html)|
|ramps|0.6-15|[https://cran.r-project.org/web/packages/ramps/index.html](https://cran.r-project.org/web/packages/ramps/index.html)|
|RandomFields|3.1.50|[https://cran.r-project.org/web/packages/RandomFields/index.html](https://cran.r-project.org/web/packages/RandomFields/index.html)|
|RandomFieldsUtils|0.3.25|[https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html](https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html)|
|randomForest|4.6-14|[https://cran.r-project.org/web/packages/randomForest/index.html](https://cran.r-project.org/web/packages/randomForest/index.html)|
|ranger|0.9.0|[https://cran.r-project.org/web/packages/ranger/index.html](https://cran.r-project.org/web/packages/ranger/index.html)|
|RApiDatetime|0.0.4|[https://cran.r-project.org/web/packages/RApiDatetime/index.html](https://cran.r-project.org/web/packages/RApiDatetime/index.html)|
|rappdirs|0.3.1|[https://cran.r-project.org/web/packages/rappdirs/index.html](https://cran.r-project.org/web/packages/rappdirs/index.html)|
|RArcInfo|0.4-12|[https://cran.r-project.org/web/packages/RArcInfo/index.html](https://cran.r-project.org/web/packages/RArcInfo/index.html)|
|raster|2.6-7|[https://cran.r-project.org/web/packages/raster/index.html](https://cran.r-project.org/web/packages/raster/index.html)|
|rattle|5.1.0|[https://cran.r-project.org/web/packages/rattle/index.html](https://cran.r-project.org/web/packages/rattle/index.html)|
|rayshader|0.10.1|[https://cran.r-project.org/web/packages/rayshader/index.html](https://cran.r-project.org/web/packages/rayshader/index.html)|
|rbenchmark|1.0.0|[https://cran.r-project.org/web/packages/rbenchmark/index.html](https://cran.r-project.org/web/packages/rbenchmark/index.html)|
|Rblpapi|0.3.8|[https://cran.r-project.org/web/packages/Rblpapi/index.html](https://cran.r-project.org/web/packages/Rblpapi/index.html)|
|rbokeh|0.5.0|[https://cran.r-project.org/web/packages/rbokeh/index.html](https://cran.r-project.org/web/packages/rbokeh/index.html)|
|rbugs|0.5-9|[https://cran.r-project.org/web/packages/rbugs/index.html](https://cran.r-project.org/web/packages/rbugs/index.html)|
|RColorBrewer|1.1-2|[https://cran.r-project.org/web/packages/RColorBrewer/index.html](https://cran.r-project.org/web/packages/RColorBrewer/index.html)|
|Rcpp|1.0.1|[https://cran.r-project.org/web/packages/Rcpp/index.html](https://cran.r-project.org/web/packages/Rcpp/index.html)|
|RcppArmadillo|0.8.400.0.0|[https://cran.r-project.org/web/packages/RcppArmadillo/index.html](https://cran.r-project.org/web/packages/RcppArmadillo/index.html)|
|rcppbugs|0.1.4.2|[https://cran.r-project.org/web/packages/rcppbugs/index.html](https://cran.r-project.org/web/packages/rcppbugs/index.html)|
|RcppDE|0.1.5|[https://cran.r-project.org/web/packages/RcppDE/index.html](https://cran.r-project.org/web/packages/RcppDE/index.html)|
|RcppEigen|0.3.3.4.0|[https://cran.r-project.org/web/packages/RcppEigen/index.html](https://cran.r-project.org/web/packages/RcppEigen/index.html)|
|RcppExamples|0.1.8|[https://cran.r-project.org/web/packages/RcppExamples/index.html](https://cran.r-project.org/web/packages/RcppExamples/index.html)|
|RcppParallel|4.4.0|[https://cran.r-project.org/web/packages/RcppParallel/index.html](https://cran.r-project.org/web/packages/RcppParallel/index.html)|
|RcppProgress|0.4|[https://cran.r-project.org/web/packages/RcppProgress/index.html](https://cran.r-project.org/web/packages/RcppProgress/index.html)|
|RcppRoll|0.2.2|[https://cran.r-project.org/web/packages/RcppRoll/index.html](https://cran.r-project.org/web/packages/RcppRoll/index.html)|
|RCurl|1.95-4.10|[https://cran.r-project.org/web/packages/RCurl/index.html](https://cran.r-project.org/web/packages/RCurl/index.html)|
|readbitmap|0.1-4|[https://cran.r-project.org/web/packages/readbitmap/index.html](https://cran.r-project.org/web/packages/readbitmap/index.html)|
|readr|1.1.1|[https://cran.r-project.org/web/packages/readr/index.html](https://cran.r-project.org/web/packages/readr/index.html)|
|readxl|1.0.0|[https://cran.r-project.org/web/packages/readxl/index.html](https://cran.r-project.org/web/packages/readxl/index.html)|
|recipes|0.1.2|[https://cran.r-project.org/web/packages/recipes/index.html](https://cran.r-project.org/web/packages/recipes/index.html)|
|Redmonder|0.2.0|[https://cran.r-project.org/web/packages/Redmonder/index.html](https://cran.r-project.org/web/packages/Redmonder/index.html)|
|registry|0.5|[https://cran.r-project.org/web/packages/registry/index.html](https://cran.r-project.org/web/packages/registry/index.html)|
|relaimpo|2.2-3|[https://cran.r-project.org/web/packages/relaimpo/index.html](https://cran.r-project.org/web/packages/relaimpo/index.html)|
|relimp|1.0-5|[https://cran.r-project.org/web/packages/relimp/index.html](https://cran.r-project.org/web/packages/relimp/index.html)|
|rematch|1.0.1|[https://cran.r-project.org/web/packages/rematch/index.html](https://cran.r-project.org/web/packages/rematch/index.html)|
|Renext|3.1-0|[https://cran.r-project.org/web/packages/Renext/index.html](https://cran.r-project.org/web/packages/Renext/index.html)|
|reports|0.1.4|[https://cran.r-project.org/web/packages/reports/index.html](https://cran.r-project.org/web/packages/reports/index.html)|
|reprex|0.1.2|[https://cran.r-project.org/web/packages/reprex/index.html](https://cran.r-project.org/web/packages/reprex/index.html)|
|reshape|0.8.7|[https://cran.r-project.org/web/packages/reshape/index.html](https://cran.r-project.org/web/packages/reshape/index.html)|
|reshape2|1.4.3|[https://cran.r-project.org/web/packages/reshape2/index.html](https://cran.r-project.org/web/packages/reshape2/index.html)|
|reticulate|1.6|[https://cran.r-project.org/web/packages/reticulate/index.html](https://cran.r-project.org/web/packages/reticulate/index.html)|
|RevoIOQ|8.0.10|NA|
|RevoMods|11.0.0|NA|
|RevoUtils|10.0.9|NA|
|RevoUtilsMath|10.0.1|NA|
|rex|1.1.2|[https://cran.r-project.org/web/packages/rex/index.html](https://cran.r-project.org/web/packages/rex/index.html)|
|rFerns|2.0.3|[https://cran.r-project.org/web/packages/rFerns/index.html](https://cran.r-project.org/web/packages/rFerns/index.html)|
|rfm|0.2.0|[https://cran.r-project.org/web/packages/rfm/index.html](https://cran.r-project.org/web/packages/rfm/index.html)|
|RGA|0.4.2|[https://cran.r-project.org/web/packages/RGA/index.html](https://cran.r-project.org/web/packages/RGA/index.html)|
|rgdal|1.2-18|[https://cran.r-project.org/web/packages/rgdal/index.html](https://cran.r-project.org/web/packages/rgdal/index.html)|
|rgeos|0.3-26|[https://cran.r-project.org/web/packages/rgeos/index.html](https://cran.r-project.org/web/packages/rgeos/index.html)|
|rgexf|0.15.3|[https://cran.r-project.org/web/packages/rgexf/index.html](https://cran.r-project.org/web/packages/rgexf/index.html)|
|rgl|0.99.16|[https://cran.r-project.org/web/packages/rgl/index.html](https://cran.r-project.org/web/packages/rgl/index.html)|
|RgoogleMaps|1.4.1|[https://cran.r-project.org/web/packages/RgoogleMaps/index.html](https://cran.r-project.org/web/packages/RgoogleMaps/index.html)|
|RGraphics|2.0-14|[https://cran.r-project.org/web/packages/RGraphics/index.html](https://cran.r-project.org/web/packages/RGraphics/index.html)|
|RGtk2|2.20.34|[https://cran.r-project.org/web/packages/RGtk2/index.html](https://cran.r-project.org/web/packages/RGtk2/index.html)|
|RInside|0.2.14|[https://cran.r-project.org/web/packages/RInside/index.html](https://cran.r-project.org/web/packages/RInside/index.html)|
|RJaCGH|2.0.4|[https://cran.r-project.org/web/packages/RJaCGH/index.html](https://cran.r-project.org/web/packages/RJaCGH/index.html)|
|rjags|4-6|[https://cran.r-project.org/web/packages/rjags/index.html](https://cran.r-project.org/web/packages/rjags/index.html)|
|rjson|0.2.15|[https://cran.r-project.org/web/packages/rjson/index.html](https://cran.r-project.org/web/packages/rjson/index.html)|
|RJSONIO|1.3-0|[https://cran.r-project.org/web/packages/RJSONIO/index.html](https://cran.r-project.org/web/packages/RJSONIO/index.html)|
|rlang|0.4.1|[https://cran.r-project.org/web/packages/rlang/index.html](https://cran.r-project.org/web/packages/rlang/index.html)|
|rlecuyer|0.3-4|[https://cran.r-project.org/web/packages/rlecuyer/index.html](https://cran.r-project.org/web/packages/rlecuyer/index.html)|
|rlist|0.4.6.1|[https://cran.r-project.org/web/packages/rlist/index.html](https://cran.r-project.org/web/packages/rlist/index.html)|
|rmapshaper|0.3.0|[https://cran.r-project.org/web/packages/rmapshaper/index.html](https://cran.r-project.org/web/packages/rmapshaper/index.html)|
|rmarkdown|1.9|[https://cran.r-project.org/web/packages/rmarkdown/index.html](https://cran.r-project.org/web/packages/rmarkdown/index.html)|
|Rmisc|1.5|[https://cran.r-project.org/web/packages/Rmisc/index.html](https://cran.r-project.org/web/packages/Rmisc/index.html)|
|Rmpfr|0.7-0|[https://cran.r-project.org/web/packages/Rmpfr/index.html](https://cran.r-project.org/web/packages/Rmpfr/index.html)|
|rms|5.1-2|[https://cran.r-project.org/web/packages/rms/index.html](https://cran.r-project.org/web/packages/rms/index.html)|
|RMySQL|0.10.14|[https://cran.r-project.org/web/packages/RMySQL/index.html](https://cran.r-project.org/web/packages/RMySQL/index.html)|
|rngtools|1.2.4|[https://cran.r-project.org/web/packages/rngtools/index.html](https://cran.r-project.org/web/packages/rngtools/index.html)|
|robCompositions|2.0.6|[https://cran.r-project.org/web/packages/robCompositions/index.html](https://cran.r-project.org/web/packages/robCompositions/index.html)|
|robfilter|4.1|[https://cran.r-project.org/web/packages/robfilter/index.html](https://cran.r-project.org/web/packages/robfilter/index.html)|
|robustbase|0.92-8|[https://cran.r-project.org/web/packages/robustbase/index.html](https://cran.r-project.org/web/packages/robustbase/index.html)|
|robustHD|0.5.1|[https://cran.r-project.org/web/packages/robustHD/index.html](https://cran.r-project.org/web/packages/robustHD/index.html)|
|ROCR|1.0-7|[https://cran.r-project.org/web/packages/ROCR/index.html](https://cran.r-project.org/web/packages/ROCR/index.html)|
|RODBC|1.3-15|[https://cran.r-project.org/web/packages/RODBC/index.html](https://cran.r-project.org/web/packages/RODBC/index.html)|
|Rook|1.1-1|[https://cran.r-project.org/web/packages/Rook/index.html](https://cran.r-project.org/web/packages/Rook/index.html)|
|rootSolve|1.7|[https://cran.r-project.org/web/packages/rootSolve/index.html](https://cran.r-project.org/web/packages/rootSolve/index.html)|
|roxygen2|6.0.1|[https://cran.r-project.org/web/packages/roxygen2/index.html](https://cran.r-project.org/web/packages/roxygen2/index.html)|
|rpart|4.1-13|[https://cran.r-project.org/web/packages/rpart/index.html](https://cran.r-project.org/web/packages/rpart/index.html)|
|rpart.plot|2.1.2|[https://cran.r-project.org/web/packages/rpart.plot/index.html](https://cran.r-project.org/web/packages/rpart.plot/index.html)|
|rpivotTable|0.3.0|[https://cran.r-project.org/web/packages/rpivotTable/index.html](https://cran.r-project.org/web/packages/rpivotTable/index.html)|
|rprojroot|1.3-2|[https://cran.r-project.org/web/packages/rprojroot/index.html](https://cran.r-project.org/web/packages/rprojroot/index.html)|
|rrcov|1.4-3|[https://cran.r-project.org/web/packages/rrcov/index.html](https://cran.r-project.org/web/packages/rrcov/index.html)|
|rscproxy|2.0-5|[https://cran.r-project.org/web/packages/rscproxy/index.html](https://cran.r-project.org/web/packages/rscproxy/index.html)|
|rsdmx|0.5-11|[https://cran.r-project.org/web/packages/rsdmx/index.html](https://cran.r-project.org/web/packages/rsdmx/index.html)|
|RSGHB|1.1.2|[https://cran.r-project.org/web/packages/RSGHB/index.html](https://cran.r-project.org/web/packages/RSGHB/index.html)|
|RSiteCatalyst|1.4.14|[https://cran.r-project.org/web/packages/RSiteCatalyst/index.html](https://cran.r-project.org/web/packages/RSiteCatalyst/index.html)|
|RSNNS|0.4-10|[https://cran.r-project.org/web/packages/RSNNS/index.html](https://cran.r-project.org/web/packages/RSNNS/index.html)|
|Rsolnp|1.16|[https://cran.r-project.org/web/packages/Rsolnp/index.html](https://cran.r-project.org/web/packages/Rsolnp/index.html)|
|RSpectra|0.12-0|[https://cran.r-project.org/web/packages/RSpectra/index.html](https://cran.r-project.org/web/packages/RSpectra/index.html)|
|RSQLite|2.1.0|[https://cran.r-project.org/web/packages/RSQLite/index.html](https://cran.r-project.org/web/packages/RSQLite/index.html)|
|rstan|2.17.3|[https://cran.r-project.org/web/packages/rstan/index.html](https://cran.r-project.org/web/packages/rstan/index.html)|
|rstudioapi|0.7|[https://cran.r-project.org/web/packages/rstudioapi/index.html](https://cran.r-project.org/web/packages/rstudioapi/index.html)|
|rsvg|1.1|[https://cran.r-project.org/web/packages/rsvg/index.html](https://cran.r-project.org/web/packages/rsvg/index.html)|
|RTextTools|1.4.2|[https://cran.r-project.org/web/packages/RTextTools/index.html](https://cran.r-project.org/web/packages/RTextTools/index.html)|
|Rttf2pt1|1.3.6|[https://cran.r-project.org/web/packages/Rttf2pt1/index.html](https://cran.r-project.org/web/packages/Rttf2pt1/index.html)|
|RUnit|0.4.31|[https://cran.r-project.org/web/packages/RUnit/index.html](https://cran.r-project.org/web/packages/RUnit/index.html)|
|runjags|2.0.4-2|[https://cran.r-project.org/web/packages/runjags/index.html](https://cran.r-project.org/web/packages/runjags/index.html)|
|Runuran|0.24|[https://cran.r-project.org/web/packages/Runuran/index.html](https://cran.r-project.org/web/packages/Runuran/index.html)|
|rvcheck|0.0.9|[https://cran.r-project.org/web/packages/rvcheck/index.html](https://cran.r-project.org/web/packages/rvcheck/index.html)|
|rvest|0.3.2|[https://cran.r-project.org/web/packages/rvest/index.html](https://cran.r-project.org/web/packages/rvest/index.html)|
|rworldmap|1.3-6|[https://cran.r-project.org/web/packages/rworldmap/index.html](https://cran.r-project.org/web/packages/rworldmap/index.html)|
|rworldxtra|1.01|[https://cran.r-project.org/web/packages/rworldxtra/index.html](https://cran.r-project.org/web/packages/rworldxtra/index.html)|
|SampleSizeMeans|1.1|[https://cran.r-project.org/web/packages/SampleSizeMeans/index.html](https://cran.r-project.org/web/packages/SampleSizeMeans/index.html)|
|SampleSizeProportions|1.0|[https://cran.r-project.org/web/packages/SampleSizeProportions/index.html](https://cran.r-project.org/web/packages/SampleSizeProportions/index.html)|
|sandwich|2.4-0|[https://cran.r-project.org/web/packages/sandwich/index.html](https://cran.r-project.org/web/packages/sandwich/index.html)|
|sas7bdat|0.5|[https://cran.r-project.org/web/packages/sas7bdat/index.html](https://cran.r-project.org/web/packages/sas7bdat/index.html)|
|satellite|1.0.1|[https://cran.r-project.org/web/packages/satellite/index.html](https://cran.r-project.org/web/packages/satellite/index.html)|
|sbgcop|0.975|[https://cran.r-project.org/web/packages/sbgcop/index.html](https://cran.r-project.org/web/packages/sbgcop/index.html)|
|scales|1.0.0|[https://cran.r-project.org/web/packages/scales/index.html](https://cran.r-project.org/web/packages/scales/index.html)|
|scatterplot3d|0.3-41|[https://cran.r-project.org/web/packages/scatterplot3d/index.html](https://cran.r-project.org/web/packages/scatterplot3d/index.html)|
|sciplot|1.1-1|[https://cran.r-project.org/web/packages/sciplot/index.html](https://cran.r-project.org/web/packages/sciplot/index.html)|
|segmented|0.5-3.0|[https://cran.r-project.org/web/packages/segmented/index.html](https://cran.r-project.org/web/packages/segmented/index.html)|
|selectr|0.4-0|[https://cran.r-project.org/web/packages/selectr/index.html](https://cran.r-project.org/web/packages/selectr/index.html)|
|sem|3.1-9|[https://cran.r-project.org/web/packages/sem/index.html](https://cran.r-project.org/web/packages/sem/index.html)|
|sentimentr|2.7.1|[https://cran.r-project.org/web/packages/sentimentr/index.html](https://cran.r-project.org/web/packages/sentimentr/index.html)|
|seqinr|3.6-1|[https://cran.r-project.org/web/packages/seqinr/index.html](https://cran.r-project.org/web/packages/seqinr/index.html)|
|seriation|1.2-3|[https://cran.r-project.org/web/packages/seriation/index.html](https://cran.r-project.org/web/packages/seriation/index.html)|
|setRNG|2013.9-1|[https://cran.r-project.org/web/packages/setRNG/index.html](https://cran.r-project.org/web/packages/setRNG/index.html)|
|sf|0.7-4|[https://cran.r-project.org/web/packages/sf/index.html](https://cran.r-project.org/web/packages/sf/index.html)|
|sfsmisc|1.1-2|[https://cran.r-project.org/web/packages/sfsmisc/index.html](https://cran.r-project.org/web/packages/sfsmisc/index.html)|
|sgeostat|1.0-27|[https://cran.r-project.org/web/packages/sgeostat/index.html](https://cran.r-project.org/web/packages/sgeostat/index.html)|
|shape|1.4.4|[https://cran.r-project.org/web/packages/shape/index.html](https://cran.r-project.org/web/packages/shape/index.html)|
|shapefiles|0.7|[https://cran.r-project.org/web/packages/shapefiles/index.html](https://cran.r-project.org/web/packages/shapefiles/index.html)|
|shiny|1.0.5|[https://cran.r-project.org/web/packages/shiny/index.html](https://cran.r-project.org/web/packages/shiny/index.html)|
|shinyBS|0.61|[https://cran.r-project.org/web/packages/shinyBS/index.html](https://cran.r-project.org/web/packages/shinyBS/index.html)|
|shinycssloaders|0.2.0|[https://cran.r-project.org/web/packages/shinycssloaders/index.html](https://cran.r-project.org/web/packages/shinycssloaders/index.html)|
|shinyjs|1.0|[https://cran.r-project.org/web/packages/shinyjs/index.html](https://cran.r-project.org/web/packages/shinyjs/index.html)|
|shinyTime|0.2.1|[https://cran.r-project.org/web/packages/shinyTime/index.html](https://cran.r-project.org/web/packages/shinyTime/index.html)|
|showtext|0.5-1|[https://cran.r-project.org/web/packages/showtext/index.html](https://cran.r-project.org/web/packages/showtext/index.html)|
|showtextdb|2.0|[https://cran.r-project.org/web/packages/showtextdb/index.html](https://cran.r-project.org/web/packages/showtextdb/index.html)|
|SIS|0.8-6|[https://cran.r-project.org/web/packages/SIS/index.html](https://cran.r-project.org/web/packages/SIS/index.html)|
|SixSigma|0.9-51|[https://cran.r-project.org/web/packages/SixSigma/index.html](https://cran.r-project.org/web/packages/SixSigma/index.html)|
|sjlabelled|1.0.8|[https://cran.r-project.org/web/packages/sjlabelled/index.html](https://cran.r-project.org/web/packages/sjlabelled/index.html)|
|sjmisc|2.7.1|[https://cran.r-project.org/web/packages/sjmisc/index.html](https://cran.r-project.org/web/packages/sjmisc/index.html)|
|sjPlot|2.4.1|[https://cran.r-project.org/web/packages/sjPlot/index.html](https://cran.r-project.org/web/packages/sjPlot/index.html)|
|sjstats|0.14.2-3|[https://cran.r-project.org/web/packages/sjstats/index.html](https://cran.r-project.org/web/packages/sjstats/index.html)|
|skmeans|0.2-11|[https://cran.r-project.org/web/packages/skmeans/index.html](https://cran.r-project.org/web/packages/skmeans/index.html)|
|slam|0.1-42|[https://cran.r-project.org/web/packages/slam/index.html](https://cran.r-project.org/web/packages/slam/index.html)|
|sm|2.2-5.4|[https://cran.r-project.org/web/packages/sm/index.html](https://cran.r-project.org/web/packages/sm/index.html)|
|smooth|2.4.1|[https://cran.r-project.org/web/packages/smooth/index.html](https://cran.r-project.org/web/packages/smooth/index.html)|
|smoothSurv|2.0|[https://cran.r-project.org/web/packages/smoothSurv/index.html](https://cran.r-project.org/web/packages/smoothSurv/index.html)|
|sna|2.4|[https://cran.r-project.org/web/packages/sna/index.html](https://cran.r-project.org/web/packages/sna/index.html)|
|snakecase|0.9.1|[https://cran.r-project.org/web/packages/snakecase/index.html](https://cran.r-project.org/web/packages/snakecase/index.html)|
|snow|0.4-2|[https://cran.r-project.org/web/packages/snow/index.html](https://cran.r-project.org/web/packages/snow/index.html)|
|SnowballC|0.5.1|[https://cran.r-project.org/web/packages/SnowballC/index.html](https://cran.r-project.org/web/packages/SnowballC/index.html)|
|snowFT|1.6-0|[https://cran.r-project.org/web/packages/snowFT/index.html](https://cran.r-project.org/web/packages/snowFT/index.html)|
|sodium|1.1|[https://cran.r-project.org/web/packages/sodium/index.html](https://cran.r-project.org/web/packages/sodium/index.html)|
|sourcetools|0.1.6|[https://cran.r-project.org/web/packages/sourcetools/index.html](https://cran.r-project.org/web/packages/sourcetools/index.html)|
|sp|1.2-7|[https://cran.r-project.org/web/packages/sp/index.html](https://cran.r-project.org/web/packages/sp/index.html)|
|spacetime|1.2-1|[https://cran.r-project.org/web/packages/spacetime/index.html](https://cran.r-project.org/web/packages/spacetime/index.html)|
|spacyr|0.9.6|[https://cran.r-project.org/web/packages/spacyr/index.html](https://cran.r-project.org/web/packages/spacyr/index.html)|
|spam|2.1-3|[https://cran.r-project.org/web/packages/spam/index.html](https://cran.r-project.org/web/packages/spam/index.html)|
|SparseM|1.77|[https://cran.r-project.org/web/packages/SparseM/index.html](https://cran.r-project.org/web/packages/SparseM/index.html)|
|sparsepp|0.2.0|[https://cran.r-project.org/web/packages/sparsepp/index.html](https://cran.r-project.org/web/packages/sparsepp/index.html)|
|spatial|7.3-11|[https://cran.r-project.org/web/packages/spatial/index.html](https://cran.r-project.org/web/packages/spatial/index.html)|
|spatstat|1.55-0|[https://cran.r-project.org/web/packages/spatstat/index.html](https://cran.r-project.org/web/packages/spatstat/index.html)|
|spatstat.data|1.2-0|[https://cran.r-project.org/web/packages/spatstat.data/index.html](https://cran.r-project.org/web/packages/spatstat.data/index.html)|
|spatstat.utils|1.8-0|[https://cran.r-project.org/web/packages/spatstat.utils/index.html](https://cran.r-project.org/web/packages/spatstat.utils/index.html)|
|spBayes|0.4-1|[https://cran.r-project.org/web/packages/spBayes/index.html](https://cran.r-project.org/web/packages/spBayes/index.html)|
|spData|0.2.8.3|[https://cran.r-project.org/web/packages/spData/index.html](https://cran.r-project.org/web/packages/spData/index.html)|
|spdep|0.7-4|[https://cran.r-project.org/web/packages/spdep/index.html](https://cran.r-project.org/web/packages/spdep/index.html)|
|spikeslab|1.1.5|[https://cran.r-project.org/web/packages/spikeslab/index.html](https://cran.r-project.org/web/packages/spikeslab/index.html)|
|splancs|2.01-40|[https://cran.r-project.org/web/packages/splancs/index.html](https://cran.r-project.org/web/packages/splancs/index.html)|
|splines|3.4.4|[https://cran.r-project.org/web/packages/splines/index.html](https://cran.r-project.org/web/packages/splines/index.html)|
|spls|2.2-2|[https://cran.r-project.org/web/packages/spls/index.html](https://cran.r-project.org/web/packages/spls/index.html)|
|splus2R|1.2-2|[https://cran.r-project.org/web/packages/splus2R/index.html](https://cran.r-project.org/web/packages/splus2R/index.html)|
|spTimer|3.0-1|[https://cran.r-project.org/web/packages/spTimer/index.html](https://cran.r-project.org/web/packages/spTimer/index.html)|
|sqldf|0.4-11|[https://cran.r-project.org/web/packages/sqldf/index.html](https://cran.r-project.org/web/packages/sqldf/index.html)|
|SQUAREM|2017.10-1|[https://cran.r-project.org/web/packages/SQUAREM/index.html](https://cran.r-project.org/web/packages/SQUAREM/index.html)|
|sROC|0.1-2|[https://cran.r-project.org/web/packages/sROC/index.html](https://cran.r-project.org/web/packages/sROC/index.html)|
|stabledist|0.7-1|[https://cran.r-project.org/web/packages/stabledist/index.html](https://cran.r-project.org/web/packages/stabledist/index.html)|
|stabs|0.6-3|[https://cran.r-project.org/web/packages/stabs/index.html](https://cran.r-project.org/web/packages/stabs/index.html)|
|StanHeaders|2.17.2|[https://cran.r-project.org/web/packages/StanHeaders/index.html](https://cran.r-project.org/web/packages/StanHeaders/index.html)|
|statmod|1.4.30|[https://cran.r-project.org/web/packages/statmod/index.html](https://cran.r-project.org/web/packages/statmod/index.html)|
|statnet.common|4.0.0|[https://cran.r-project.org/web/packages/statnet.common/index.html](https://cran.r-project.org/web/packages/statnet.common/index.html)|
|stats|3.4.4|NA|
|stats4|3.4.4|NA|
|stepPlr|0.93|[https://cran.r-project.org/web/packages/stepPlr/index.html](https://cran.r-project.org/web/packages/stepPlr/index.html)|
|stinepack|1.4|[https://cran.r-project.org/web/packages/stinepack/index.html](https://cran.r-project.org/web/packages/stinepack/index.html)|
|stochvol|1.3.3|[https://cran.r-project.org/web/packages/stochvol/index.html](https://cran.r-project.org/web/packages/stochvol/index.html)|
|stopwords|0.9.0|[https://cran.r-project.org/web/packages/stopwords/index.html](https://cran.r-project.org/web/packages/stopwords/index.html)|
|stringdist|0.9.4.7|[https://cran.r-project.org/web/packages/stringdist/index.html](https://cran.r-project.org/web/packages/stringdist/index.html)|
|stringi|1.1.7|[https://cran.r-project.org/web/packages/stringi/index.html](https://cran.r-project.org/web/packages/stringi/index.html)|
|stringr|1.3.0|[https://cran.r-project.org/web/packages/stringr/index.html](https://cran.r-project.org/web/packages/stringr/index.html)|
|strucchange|1.5-1|[https://cran.r-project.org/web/packages/strucchange/index.html](https://cran.r-project.org/web/packages/strucchange/index.html)|
|stsm|1.9|[https://cran.r-project.org/web/packages/stsm/index.html](https://cran.r-project.org/web/packages/stsm/index.html)|
|stsm.class|1.3|[https://cran.r-project.org/web/packages/stsm.class/index.html](https://cran.r-project.org/web/packages/stsm.class/index.html)|
|sugrrants|0.2.4|[https://cran.r-project.org/web/packages/sugrrants/index.html](https://cran.r-project.org/web/packages/sugrrants/index.html)|
|sunburstR|2.0.0|[https://cran.r-project.org/web/packages/sunburstR/index.html](https://cran.r-project.org/web/packages/sunburstR/index.html)|
|SuppDists|1.1-9.4|[https://cran.r-project.org/web/packages/SuppDists/index.html](https://cran.r-project.org/web/packages/SuppDists/index.html)|
|survey|3.33-2|[https://cran.r-project.org/web/packages/survey/index.html](https://cran.r-project.org/web/packages/survey/index.html)|
|survival|2.41-3|[https://cran.r-project.org/web/packages/survival/index.html](https://cran.r-project.org/web/packages/survival/index.html)|
|survminer|0.4.6|[https://cran.r-project.org/web/packages/survminer/index.html](https://cran.r-project.org/web/packages/survminer/index.html)|
|survMisc|0.5.4|[https://cran.r-project.org/web/packages/survMisc/index.html](https://cran.r-project.org/web/packages/survMisc/index.html)|
|svglite|1.2.1|[https://cran.r-project.org/web/packages/svglite/index.html](https://cran.r-project.org/web/packages/svglite/index.html)|
|svmpath|0.955|[https://cran.r-project.org/web/packages/svmpath/index.html](https://cran.r-project.org/web/packages/svmpath/index.html)|
|svUnit|0.7-12|[https://cran.r-project.org/web/packages/svUnit/index.html](https://cran.r-project.org/web/packages/svUnit/index.html)|
|sweep|0.2.1|[https://cran.r-project.org/web/packages/sweep/index.html](https://cran.r-project.org/web/packages/sweep/index.html)|
|sysfonts|0.7.2|[https://cran.r-project.org/web/packages/sysfonts/index.html](https://cran.r-project.org/web/packages/sysfonts/index.html)|
|systemfit|1.1-20|[https://cran.r-project.org/web/packages/systemfit/index.html](https://cran.r-project.org/web/packages/systemfit/index.html)|
|syuzhet|1.0.4|[https://cran.r-project.org/web/packages/syuzhet/index.html](https://cran.r-project.org/web/packages/syuzhet/index.html)|
|tau|0.0-20|[https://cran.r-project.org/web/packages/tau/index.html](https://cran.r-project.org/web/packages/tau/index.html)|
|tcltk|3.4.4|[https://cran.r-project.org/web/packages/tcltk/index.html](https://cran.r-project.org/web/packages/tcltk/index.html)|
|tcltk2|1.2-11|[https://cran.r-project.org/web/packages/tcltk2/index.html](https://cran.r-project.org/web/packages/tcltk2/index.html)|
|TeachingDemos|2.10|[https://cran.r-project.org/web/packages/TeachingDemos/index.html](https://cran.r-project.org/web/packages/TeachingDemos/index.html)|
|tensor|1.5|[https://cran.r-project.org/web/packages/tensor/index.html](https://cran.r-project.org/web/packages/tensor/index.html)|
|tensorA|0.36|[https://cran.r-project.org/web/packages/tensorA/index.html](https://cran.r-project.org/web/packages/tensorA/index.html)|
|testthat|2.0.0|[https://cran.r-project.org/web/packages/testthat/index.html](https://cran.r-project.org/web/packages/testthat/index.html)|
|text2vec|0.5.1|[https://cran.r-project.org/web/packages/text2vec/index.html](https://cran.r-project.org/web/packages/text2vec/index.html)|
|textcat|1.0-5|[https://cran.r-project.org/web/packages/textcat/index.html](https://cran.r-project.org/web/packages/textcat/index.html)|
|textclean|0.9.3|[https://cran.r-project.org/web/packages/textclean/index.html](https://cran.r-project.org/web/packages/textclean/index.html)|
|textir|2.0-5|[https://cran.r-project.org/web/packages/textir/index.html](https://cran.r-project.org/web/packages/textir/index.html)|
|textmineR|2.1.1|[https://cran.r-project.org/web/packages/textmineR/index.html](https://cran.r-project.org/web/packages/textmineR/index.html)|
|textshape|1.6.0|[https://cran.r-project.org/web/packages/textshape/index.html](https://cran.r-project.org/web/packages/textshape/index.html)|
|tfplot|2015.12-1|[https://cran.r-project.org/web/packages/tfplot/index.html](https://cran.r-project.org/web/packages/tfplot/index.html)|
|tframe|2015.12-1|[https://cran.r-project.org/web/packages/tframe/index.html](https://cran.r-project.org/web/packages/tframe/index.html)|
|tgp|2.4-14|[https://cran.r-project.org/web/packages/tgp/index.html](https://cran.r-project.org/web/packages/tgp/index.html)|
|TH.data|1.0-8|[https://cran.r-project.org/web/packages/TH.data/index.html](https://cran.r-project.org/web/packages/TH.data/index.html)|
|threejs|0.3.1|[https://cran.r-project.org/web/packages/threejs/index.html](https://cran.r-project.org/web/packages/threejs/index.html)|
|tibble|2.1.1|[https://cran.r-project.org/web/packages/tibble/index.html](https://cran.r-project.org/web/packages/tibble/index.html)|
|tibbletime|0.1.1|[https://cran.r-project.org/web/packages/tibbletime/index.html](https://cran.r-project.org/web/packages/tibbletime/index.html)|
|tidycensus|0.4.1|[https://cran.r-project.org/web/packages/tidycensus/index.html](https://cran.r-project.org/web/packages/tidycensus/index.html)|
|tidyr|1.0.0|[https://cran.r-project.org/web/packages/tidyr/index.html](https://cran.r-project.org/web/packages/tidyr/index.html)|
|tidyselect|0.2.5|[https://cran.r-project.org/web/packages/tidyselect/index.html](https://cran.r-project.org/web/packages/tidyselect/index.html)|
|tidytext|0.1.8|[https://cran.r-project.org/web/packages/tidytext/index.html](https://cran.r-project.org/web/packages/tidytext/index.html)|
|tidyverse|1.2.1|[https://cran.r-project.org/web/packages/tidyverse/index.html](https://cran.r-project.org/web/packages/tidyverse/index.html)|
|tiff|0.1-5|[https://cran.r-project.org/web/packages/tiff/index.html](https://cran.r-project.org/web/packages/tiff/index.html)|
|tigris|0.6.2|[https://cran.r-project.org/web/packages/tigris/index.html](https://cran.r-project.org/web/packages/tigris/index.html)|
|timeDate|3043.102|[https://cran.r-project.org/web/packages/timeDate/index.html](https://cran.r-project.org/web/packages/timeDate/index.html)|
|timelineS|0.1.1|[https://cran.r-project.org/web/packages/timelineS/index.html](https://cran.r-project.org/web/packages/timelineS/index.html)|
|timeSeries|3042.102|[https://cran.r-project.org/web/packages/timeSeries/index.html](https://cran.r-project.org/web/packages/timeSeries/index.html)|
|timetk|0.1.0|[https://cran.r-project.org/web/packages/timetk/index.html](https://cran.r-project.org/web/packages/timetk/index.html)|
|timevis|0.5|[https://cran.r-project.org/web/packages/timevis/index.html](https://cran.r-project.org/web/packages/timevis/index.html)|
|tm|0.7-3|[https://cran.r-project.org/web/packages/tm/index.html](https://cran.r-project.org/web/packages/tm/index.html)|
|tmap|1.11-1|[https://cran.r-project.org/web/packages/tmap/index.html](https://cran.r-project.org/web/packages/tmap/index.html)|
|tmaptools|1.2-3|[https://cran.r-project.org/web/packages/tmaptools/index.html](https://cran.r-project.org/web/packages/tmaptools/index.html)|
|TMB|1.7.13|[https://cran.r-project.org/web/packages/TMB/index.html](https://cran.r-project.org/web/packages/TMB/index.html)|
|tokenizers|0.2.1|[https://cran.r-project.org/web/packages/tokenizers/index.html](https://cran.r-project.org/web/packages/tokenizers/index.html)|
|tools|3.4.4|NA|
|topicmodels|0.2-7|[https://cran.r-project.org/web/packages/topicmodels/index.html](https://cran.r-project.org/web/packages/topicmodels/index.html)|
|TraMineR|2.0-8|[https://cran.r-project.org/web/packages/TraMineR/index.html](https://cran.r-project.org/web/packages/TraMineR/index.html)|
|translations|3.4.4|NA|
|tree|1.0-39|[https://cran.r-project.org/web/packages/tree/index.html](https://cran.r-project.org/web/packages/tree/index.html)|
|treemap|2.4-2|[https://cran.r-project.org/web/packages/treemap/index.html](https://cran.r-project.org/web/packages/treemap/index.html)|
|trelliscopejs|0.1.18|[https://cran.r-project.org/web/packages/trelliscopejs/index.html](https://cran.r-project.org/web/packages/trelliscopejs/index.html)|
|trimcluster|0.1-2|[https://cran.r-project.org/web/packages/trimcluster/index.html](https://cran.r-project.org/web/packages/trimcluster/index.html)|
|truncnorm|1.0-8|[https://cran.r-project.org/web/packages/truncnorm/index.html](https://cran.r-project.org/web/packages/truncnorm/index.html)|
|TSA|1.01|[https://cran.r-project.org/web/packages/TSA/index.html](https://cran.r-project.org/web/packages/TSA/index.html)|
|tseries|0.10-43|[https://cran.r-project.org/web/packages/tseries/index.html](https://cran.r-project.org/web/packages/tseries/index.html)|
|tsfa|2014.10-1|[https://cran.r-project.org/web/packages/tsfa/index.html](https://cran.r-project.org/web/packages/tsfa/index.html)|
|tsibble|0.8.5|[https://cran.r-project.org/web/packages/tsibble/index.html](https://cran.r-project.org/web/packages/tsibble/index.html)|
|tsintermittent|1.9|[https://cran.r-project.org/web/packages/tsintermittent/index.html](https://cran.r-project.org/web/packages/tsintermittent/index.html)|
|tsoutliers|0.6-6|[https://cran.r-project.org/web/packages/tsoutliers/index.html](https://cran.r-project.org/web/packages/tsoutliers/index.html)|
|TSP|1.1-5|[https://cran.r-project.org/web/packages/TSP/index.html](https://cran.r-project.org/web/packages/TSP/index.html)|
|TSstudio|0.1.5|[https://cran.r-project.org/web/packages/TSstudio/index.html](https://cran.r-project.org/web/packages/TSstudio/index.html)|
|TTR|0.23-3|[https://cran.r-project.org/web/packages/TTR/index.html](https://cran.r-project.org/web/packages/TTR/index.html)|
|tweedie|2.3.2|[https://cran.r-project.org/web/packages/tweedie/index.html](https://cran.r-project.org/web/packages/tweedie/index.html)|
|tweenr|1.0.1|[https://cran.r-project.org/web/packages/tweenr/index.html](https://cran.r-project.org/web/packages/tweenr/index.html)|
|twitteR|1.1.9|[https://cran.r-project.org/web/packages/twitteR/index.html](https://cran.r-project.org/web/packages/twitteR/index.html)|
|udpipe|0.5|[https://cran.r-project.org/web/packages/udpipe/index.html](https://cran.r-project.org/web/packages/udpipe/index.html)|
|udunits2|0.13|[https://cran.r-project.org/web/packages/udunits2/index.html](https://cran.r-project.org/web/packages/udunits2/index.html)|
|units|0.6-2|[https://cran.r-project.org/web/packages/units/index.html](https://cran.r-project.org/web/packages/units/index.html)|
|UpSetR|1.3.3|[https://cran.r-project.org/web/packages/UpSetR/index.html](https://cran.r-project.org/web/packages/UpSetR/index.html)|
|urca|1.3-0|[https://cran.r-project.org/web/packages/urca/index.html](https://cran.r-project.org/web/packages/urca/index.html)|
|useful|1.2.3|[https://cran.r-project.org/web/packages/useful/index.html](https://cran.r-project.org/web/packages/useful/index.html)|
|UsingR|2.0-5|[https://cran.r-project.org/web/packages/UsingR/index.html](https://cran.r-project.org/web/packages/UsingR/index.html)|
|usmap|0.2.1|[https://cran.r-project.org/web/packages/usmap/index.html](https://cran.r-project.org/web/packages/usmap/index.html)|
|utf8|1.1.3|[https://cran.r-project.org/web/packages/utf8/index.html](https://cran.r-project.org/web/packages/utf8/index.html)|
|utils|3.4.4|NA|
|uuid|0.1-2|[https://cran.r-project.org/web/packages/uuid/index.html](https://cran.r-project.org/web/packages/uuid/index.html)|
|V8|2.2|[https://cran.r-project.org/web/packages/V8/index.html](https://cran.r-project.org/web/packages/V8/index.html)|
|vars|1.5-2|[https://cran.r-project.org/web/packages/vars/index.html](https://cran.r-project.org/web/packages/vars/index.html)|
|vcd|1.4-4|[https://cran.r-project.org/web/packages/vcd/index.html](https://cran.r-project.org/web/packages/vcd/index.html)|
|vctrs|0.2.0|[https://cran.r-project.org/web/packages/vctrs/index.html](https://cran.r-project.org/web/packages/vctrs/index.html)|
|vdiffr|0.2.2|[https://cran.r-project.org/web/packages/vdiffr/index.html](https://cran.r-project.org/web/packages/vdiffr/index.html)|
|vegan|2.4-6|[https://cran.r-project.org/web/packages/vegan/index.html](https://cran.r-project.org/web/packages/vegan/index.html)|
|VennDiagram|1.6.20|[https://cran.r-project.org/web/packages/VennDiagram/index.html](https://cran.r-project.org/web/packages/VennDiagram/index.html)|
|VGAM|1.0-5|[https://cran.r-project.org/web/packages/VGAM/index.html](https://cran.r-project.org/web/packages/VGAM/index.html)|
|VIF|1.0|[https://cran.r-project.org/web/packages/VIF/index.html](https://cran.r-project.org/web/packages/VIF/index.html)|
|VIM|4.7.0|[https://cran.r-project.org/web/packages/VIM/index.html](https://cran.r-project.org/web/packages/VIM/index.html)|
|vioplot|0.2|[https://cran.r-project.org/web/packages/vioplot/index.html](https://cran.r-project.org/web/packages/vioplot/index.html)|
|viridis|0.5.1|[https://cran.r-project.org/web/packages/viridis/index.html](https://cran.r-project.org/web/packages/viridis/index.html)|
|viridisLite|0.3.0|[https://cran.r-project.org/web/packages/viridisLite/index.html](https://cran.r-project.org/web/packages/viridisLite/index.html)|
|visNetwork|2.0.3|[https://cran.r-project.org/web/packages/visNetwork/index.html](https://cran.r-project.org/web/packages/visNetwork/index.html)|
|vistime|0.4.0|[https://cran.r-project.org/web/packages/vistime/index.html](https://cran.r-project.org/web/packages/vistime/index.html)|
|waterfalls|0.1.2|[https://cran.r-project.org/web/packages/waterfalls/index.html](https://cran.r-project.org/web/packages/waterfalls/index.html)|
|wavethresh|4.6.8|[https://cran.r-project.org/web/packages/wavethresh/index.html](https://cran.r-project.org/web/packages/wavethresh/index.html)|
|webshot|0.5.0|[https://cran.r-project.org/web/packages/webshot/index.html](https://cran.r-project.org/web/packages/webshot/index.html)|
|webutils|0.6|[https://cran.r-project.org/web/packages/webutils/index.html](https://cran.r-project.org/web/packages/webutils/index.html)|
|weco|1.1|[https://cran.r-project.org/web/packages/weco/index.html](https://cran.r-project.org/web/packages/weco/index.html)|
|WeibullR|1.0.10|[https://cran.r-project.org/web/packages/WeibullR/index.html](https://cran.r-project.org/web/packages/WeibullR/index.html)|
|weights|0.85|[https://cran.r-project.org/web/packages/weights/index.html](https://cran.r-project.org/web/packages/weights/index.html)|
|whisker|0.3-2|[https://cran.r-project.org/web/packages/whisker/index.html](https://cran.r-project.org/web/packages/whisker/index.html)|
|withr|2.1.2|[https://cran.r-project.org/web/packages/withr/index.html](https://cran.r-project.org/web/packages/withr/index.html)|
|wmtsa|2.0-3|[https://cran.r-project.org/web/packages/wmtsa/index.html](https://cran.r-project.org/web/packages/wmtsa/index.html)|
|wordcloud|2.5|[https://cran.r-project.org/web/packages/wordcloud/index.html](https://cran.r-project.org/web/packages/wordcloud/index.html)|
|wordcloud2|0.2.1|[https://cran.r-project.org/web/packages/wordcloud2/index.html](https://cran.r-project.org/web/packages/wordcloud2/index.html)|
|xesreadR|0.2.2|[https://cran.r-project.org/web/packages/xesreadR/index.html](https://cran.r-project.org/web/packages/xesreadR/index.html)|
|xgboost|0.6.4.1|[https://cran.r-project.org/web/packages/xgboost/index.html](https://cran.r-project.org/web/packages/xgboost/index.html)|
|XML|3.98-1.10|[https://cran.r-project.org/web/packages/XML/index.html](https://cran.r-project.org/web/packages/XML/index.html)|
|xml2|1.2.0|[https://cran.r-project.org/web/packages/xml2/index.html](https://cran.r-project.org/web/packages/xml2/index.html)|
|xplorerr|0.1.1|[https://cran.r-project.org/web/packages/xplorerr/index.html](https://cran.r-project.org/web/packages/xplorerr/index.html)|
|xtable|1.8-2|[https://cran.r-project.org/web/packages/xtable/index.html](https://cran.r-project.org/web/packages/xtable/index.html)|
|xts|0.10-2|[https://cran.r-project.org/web/packages/xts/index.html](https://cran.r-project.org/web/packages/xts/index.html)|
|yaml|2.1.18|[https://cran.r-project.org/web/packages/yaml/index.html](https://cran.r-project.org/web/packages/yaml/index.html)|
|yarrr|0.1.5|[https://cran.r-project.org/web/packages/yarrr/index.html](https://cran.r-project.org/web/packages/yarrr/index.html)|
|YieldCurve|4.1|[https://cran.r-project.org/web/packages/YieldCurve/index.html](https://cran.r-project.org/web/packages/YieldCurve/index.html)|
|zeallot|0.1.0|[https://cran.r-project.org/web/packages/zeallot/index.html](https://cran.r-project.org/web/packages/zeallot/index.html)|
|zic|0.9.1|[https://cran.r-project.org/web/packages/zic/index.html](https://cran.r-project.org/web/packages/zic/index.html)|
|zipfR|0.6-10|[https://cran.r-project.org/web/packages/zipfR/index.html](https://cran.r-project.org/web/packages/zipfR/index.html)|
|zoo|1.8-1|[https://cran.r-project.org/web/packages/zoo/index.html](https://cran.r-project.org/web/packages/zoo/index.html)|


## R scripts that aren't supported in Power BI

The following table shows which packages aren't supported in the Power BI service.

| Package | Request Date | Reason |
| --- | --- | --- |
| RgoogleMaps |10/05/2016 |Networking is blocked |
| mailR |10/03/2016 |Networking is blocked |
| RevoScaleR |8/30/2016 |Ships only with Microsoft R Server |


## Considerations and limitations

- R visuals aren't supported with Service Principal Profiles for App Owns Data.
- The R visuals rendered from the Power BI service (for Premium/ F SKUs) will support payloads of < 30Mb.
- R visuals with HTML and XML packages fail to render due to Out Of Memory (OOM). Migrate the visual with the [PbiViz tool] (../developer/visuals/develop-power-bi-visuals#power-bi-visual-packages). The visual must render. 
 


## Related content

For more information about R in Power BI, take a look at the following articles:

* [Creating R visuals in the Power BI service](../visuals/service-r-visuals.md)
* [Create Power BI visuals using R](../create-reports/desktop-r-visuals.md)
* [Running R scripts in Power BI Desktop](desktop-r-scripts.md)
* [Using R in Power Query Editor](desktop-r-in-query-editor.md)
