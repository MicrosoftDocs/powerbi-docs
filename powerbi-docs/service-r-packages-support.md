---
title: Learn which R packages are supported
description: R packages that are supported and unsupported in Power BI
author: davidiseminger
manager: kfile
ms.reviewer: ''

ms.custom: seodec18
ms.service: powerbi
ms.subservice: powerbi-desktop
ms.topic: conceptual
ms.date: 12/06/2018
ms.author: davidi

LocalizationGroup: Connect to data
---
# R packages in the Power BI service
You can use the powerful [R programming language](https://www.r-project.org/) to create visuals in the Power BI service. Many R packages are supported in the Power BI service (and more are being supported all the time), and some packages are not.

The following sections provide an alphabetical table of which R packages are supported in Power BI, and which are not. For more information about R in Power BI, see the [R visuals](visuals/service-r-visuals.md) article.

## Request support for a new R package
Supported R packages for the **Power BI service** are found in the following section, titled **Supported Packages**. If you would like to request support of an R package not found in that list, you can send an email with your request to the [R in Power BI Feedback Team](mailto:rinpbifb@microsoft.com).

## Requirements and Limitations of R packages
There are a handful of requirements and limitations for R packages:

* The Power BI service, for the most part, supports R packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* The Power BI service supports packages published in CRAN. The service does not support private or custom R packages. Users are encouraged to make their private packages available on CRAN prior to requesting the package be available in the Power BI service.
* The **Power BI Desktop** has two variations for R packages:

  * For R visuals, you can install any package, including custom R packages
  * For Custom R visuals, only public CRAN packages are supported for auto-installation of the packages
* For security and privacy reasons, R packages that provide client-server queries over the World-Wide Web (such as RgoogleMaps) in the service, are not supported. Networking is blocked for such attempts. See the following section for a list of supported and unsupported R packages.
* The approval process for including a new R package has a tree of dependencies; some dependencies required to be installed in the service cannot be supported.

## R packages that are supported in Power BI
The following table shows which packages **are supported** in the Power BI service.


|        Package        |   Version   |                                   Link                                   |
|-----------------------|-------------|--------------------------------------------------------------------------|
|abc|2.1| https://cran.r-project.org/web/packages/abc/index.html |
|abc.data|1| https://cran.r-project.org/web/packages/abc.data/index.html |
|abind| 1.4-5| https://cran.r-project.org/web/packages/abind/index.html |
|abind| tensor| polyclip (>= 1.5-0)|
|acepack| 1.4.1| https://cran.r-project.org/web/packages/acepack/index.html |
|actuar| 2.1-1| https://cran.r-project.org/web/packages/actuar/index.html |
|ade4| 1.7-6| https://cran.r-project.org/web/packages/ade4/index.html |
|AdMit| 2.1.3| https://cran.r-project.org/web/packages/AdMit/index.html |
|AER| 1.2-5| https://cran.r-project.org/web/packages/AER/index.html |
|alluvial| 0.1-2| https://cran.r-project.org/web/packages/alluvial/index.html |
|andrews|1| https://cran.r-project.org/web/packages/andrews/index.html |
|aod|1.3| https://cran.r-project.org/web/packages/aod/index.html |
|apcluster| 1.4.4| https://cran.r-project.org/web/packages/apcluster/index.html |
|ape|4.1| https://cran.r-project.org/web/packages/ape/index.html |
|aplpack| 1.3.0| https://cran.r-project.org/web/packages/aplpack/index.html |
|approximator| 1.2-6| https://cran.r-project.org/web/packages/approximator/index.html |
|arm| 1.9-3| https://cran.r-project.org/web/packages/arm/index.html |
|arules| 1.5-2| https://cran.r-project.org/web/packages/arules/index.html |
|arulesViz| 1.2-1| https://cran.r-project.org/web/packages/arulesViz/index.html |
|ash| 1.0-15| https://cran.r-project.org/web/packages/ash/index.html |
|assertthat| 0.2.0| https://cran.r-project.org/web/packages/assertthat/index.html |
|AzureML| 0.2.14| https://cran.r-project.org/web/packages/AzureML/index.html |
|BaBooN| 0.2-0| https://cran.r-project.org/web/packages/BaBooN/index.html |
|BACCO| 2.0-9| https://cran.r-project.org/web/packages/BACCO/index.html |
|backports| 1.1.0| https://cran.r-project.org/web/packages/backports/index.html |
|BaM| 1.0.1| https://cran.r-project.org/web/packages/BaM/index.html |
|BAS| 1.4.6| https://cran.r-project.org/web/packages/BAS/index.html |
|base| 3.4.1| NA|
|base64|2| https://cran.r-project.org/web/packages/base64/index.html |
|base64enc| miniCRAN| uuid|
|base64enc| 0.1-3| https://cran.r-project.org/web/packages/base64enc/index.html |
|base64enc| htmltools| htmlwidgets (>= 0.9)|
|BayesDA| 2012.04-1| https://cran.r-project.org/web/packages/BayesDA/index.html |
|BayesFactor| 0.9.12-2| https://cran.r-project.org/web/packages/BayesFactor/index.html |
|bayesGARCH| 2.1.3| https://cran.r-project.org/web/packages/bayesGARCH/index.html |
|bayesm| 3.1-0.1| https://cran.r-project.org/web/packages/bayesm/index.html |
|bayesmix| 0.7-4| https://cran.r-project.org/web/packages/bayesmix/index.html |
|bayesQR|2.3| https://cran.r-project.org/web/packages/bayesQR/index.html |
|bayesSurv|3| https://cran.r-project.org/web/packages/bayesSurv/index.html |
|Bayesthresh| 2.0.1| https://cran.r-project.org/web/packages/Bayesthresh/index.html |
|BayesTree| 0.3-1.4| https://cran.r-project.org/web/packages/BayesTree/index.html |
|BayesValidate|0| https://cran.r-project.org/web/packages/BayesValidate/index.html |
|BayesX| 0.2-9| https://cran.r-project.org/web/packages/BayesX/index.html |
|BayHaz| 0.1-3| https://cran.r-project.org/web/packages/BayHaz/index.html |
|bbemkr|2| https://cran.r-project.org/web/packages/bbemkr/index.html |
|BCBCSF| 1.0-1| https://cran.r-project.org/web/packages/BCBCSF/index.html |
|BCE|2.1| https://cran.r-project.org/web/packages/BCE/index.html |
|bclust|1.5| https://cran.r-project.org/web/packages/bclust/index.html |
|bcp| 4.0.0| https://cran.r-project.org/web/packages/bcp/index.html |
|beanplot|1.2| https://cran.r-project.org/web/packages/beanplot/index.html |
|beeswarm| 0.2.3| https://cran.r-project.org/web/packages/beeswarm/index.html |
|benford.analysis| 0.1.4.1| https://cran.r-project.org/web/packages/benford.analysis/index.html |
|BenfordTests| 1.2.0| https://cran.r-project.org/web/packages/BenfordTests/index.html |
|bfp| 0.0-35| https://cran.r-project.org/web/packages/bfp/index.html |
|BH| 1.62.0-1| https://cran.r-project.org/web/packages/BH/index.html |
|bindr|0.1| https://cran.r-project.org/web/packages/bindr/index.html |
|bindrcpp|0.2| https://cran.r-project.org/web/packages/bindrcpp/index.html |
|binom| 1.1-1| https://cran.r-project.org/web/packages/binom/index.html |
|bisoreg|1.4| https://cran.r-project.org/web/packages/bisoreg/index.html |
|bit| 1.1-12| https://cran.r-project.org/web/packages/bit/index.html |
|bit64| 0.9-7| https://cran.r-project.org/web/packages/bit64/index.html |
|bitops| 1.0-6| https://cran.r-project.org/web/packages/bitops/index.html |
|blob| 1.1.0| https://cran.r-project.org/web/packages/blob/index.html |
|BLR|1.4| https://cran.r-project.org/web/packages/BLR/index.html |
|BMA| 3.18.7| https://cran.r-project.org/web/packages/BMA/index.html |
|Bmix|0.6| https://cran.r-project.org/web/packages/Bmix/index.html |
|BMS| 0.3.4| https://cran.r-project.org/web/packages/BMS/index.html |
|bnlearn|4.2| https://cran.r-project.org/web/packages/bnlearn/index.html |
|boa| 1.1.8-2| https://cran.r-project.org/web/packages/boa/index.html |
|boot| 1.3-19| https://cran.r-project.org/web/packages/boot/index.html |
|boot| 1.3-20| https://cran.r-project.org/web/packages/boot/index.html |
|bootstrap|2017.2| https://cran.r-project.org/web/packages/bootstrap/index.html |
|Boruta| 5.2.0| https://cran.r-project.org/web/packages/Boruta/index.html |
|bqtl| 1.0-32| https://cran.r-project.org/web/packages/bqtl/index.html |
|BradleyTerry2| 1.0-6| https://cran.r-project.org/web/packages/BradleyTerry2/index.html |
|brew| 1.0-6| https://cran.r-project.org/web/packages/brew/index.html |
|brglm| 0.6.1| https://cran.r-project.org/web/packages/brglm/index.html |
|broom| 0.4.2| https://cran.r-project.org/web/packages/broom/index.html |
|broom| dplyr| tidyr (>= 0.6.0)|
|bspec|1.5| https://cran.r-project.org/web/packages/bspec/index.html |
|bspmma| 0.1-1| https://cran.r-project.org/web/packages/bspmma/index.html |
|bupaR| 0.3.0| https://cran.r-project.org/web/packages/bupaR/index.html |
|BVS| 4.12.1| https://cran.r-project.org/web/packages/BVS/index.html |
|C50| 0.1.0-24| https://cran.r-project.org/web/packages/C50/index.html |
|Cairo| 1.5-9| https://cran.r-project.org/web/packages/Cairo/index.html |
|cairoDevice|2.24| https://cran.r-project.org/web/packages/cairoDevice/index.html |
|cairoDevice| NA| CRAN|
|calibrate| 1.7.2| https://cran.r-project.org/web/packages/calibrate/index.html |
|calibrator| 1.2-6| https://cran.r-project.org/web/packages/calibrator/index.html |
|car| 2.1-5| https://cran.r-project.org/web/packages/car/index.html |
|caret| 6.0-76| https://cran.r-project.org/web/packages/caret/index.html |
|catnet| 1.15.0| https://cran.r-project.org/web/packages/catnet/index.html |
|caTools| 1.17.1| https://cran.r-project.org/web/packages/caTools/index.html |
|cclust| 0.6-21| https://cran.r-project.org/web/packages/cclust/index.html |
|cellranger| 1.1.0| https://cran.r-project.org/web/packages/cellranger/index.html |
|checkmate| 1.8.3| https://cran.r-project.org/web/packages/checkmate/index.html |
|checkmate| htmlwidgets| CRAN|
|checkpoint| 0.4.0|346|
|choroplethrMaps| 1.0.1| https://cran.r-project.org/web/packages/choroplethrMaps/index.html |
|chron| 2.3-50| https://cran.r-project.org/web/packages/chron/index.html |
|circlize| 0.4.1| https://cran.r-project.org/web/packages/circlize/index.html |
|Ckmeans.1d.dp| 4.2.1| https://cran.r-project.org/web/packages/Ckmeans.1d.dp/index.html |
|class| 7.3-14| https://cran.r-project.org/web/packages/class/index.html |
|class| 7.3-14| https://cran.r-project.org/web/packages/class/index.html |
|classInt| 0.1-24| https://cran.r-project.org/web/packages/classInt/index.html |
|ClickClust| 1.1.5| https://cran.r-project.org/web/packages/ClickClust/index.html |
|clickstream| 1.2.1| https://cran.r-project.org/web/packages/clickstream/index.html |
|clue| 0.3-53| https://cran.r-project.org/web/packages/clue/index.html |
|cluster| 2.0.6| https://cran.r-project.org/web/packages/cluster/index.html |
|cluster| 2.0.6| https://cran.r-project.org/web/packages/cluster/index.html |
|cluster| CRAN| NA|
|clv| 0.3-2.1| https://cran.r-project.org/web/packages/clv/index.html |
|cmprsk| 2.2-7| https://cran.r-project.org/web/packages/cmprsk/index.html |
|coda| 0.19-1| https://cran.r-project.org/web/packages/coda/index.html |
|codetools| 0.2-15| https://cran.r-project.org/web/packages/codetools/index.html |
|codetools| 0.2-15| https://cran.r-project.org/web/packages/codetools/index.html |
|coefplot| 1.2.4| https://cran.r-project.org/web/packages/coefplot/index.html |
|coin| 1.2-1| https://cran.r-project.org/web/packages/coin/index.html |
|colorRamps|2.3| https://cran.r-project.org/web/packages/colorRamps/index.html |
|colorspace| methods| grid|
|colorspace| 1.3-2| https://cran.r-project.org/web/packages/colorspace/index.html |
|colorspace| parallel| ggplot2 (>= 2.0.0)|
|combinat| 0.0-8| https://cran.r-project.org/web/packages/combinat/index.html |
|compiler| 3.4.1| NA|
|compositions| 1.40-1| https://cran.r-project.org/web/packages/compositions/index.html |
|CORElearn| 1.50.3| https://cran.r-project.org/web/packages/CORElearn/index.html |
|corpcor| 1.6.9| https://cran.r-project.org/web/packages/corpcor/index.html |
|corrgram|1.12| https://cran.r-project.org/web/packages/corrgram/index.html |
|corrplot|0.77| https://cran.r-project.org/web/packages/corrplot/index.html |
|covr| 3.0.0| https://cran.r-project.org/web/packages/covr/index.html |
|cowplot| 0.8.0| https://cran.r-project.org/web/packages/cowplot/index.html |
|crayon| 1.3.2| https://cran.r-project.org/web/packages/crayon/index.html |
|crosstalk| 1.0.0| https://cran.r-project.org/web/packages/crosstalk/index.html |
|cslogistic| 0.1-3| https://cran.r-project.org/web/packages/cslogistic/index.html |
|cts| 1.0-21| https://cran.r-project.org/web/packages/cts/index.html |
|ctv| 0.8-2| https://cran.r-project.org/web/packages/ctv/index.html |
|cubature| 1.3-11| https://cran.r-project.org/web/packages/cubature/index.html |
|curl|2.6| https://cran.r-project.org/web/packages/curl/index.html |
|curl|3| https://cran.r-project.org/web/packages/curl/index.html |
|cvTools| 0.3.2| https://cran.r-project.org/web/packages/cvTools/index.html |
|d3heatmap| 0.6.1.1| https://cran.r-project.org/web/packages/d3heatmap/index.html |
|d3Network| 0.5.2.1| https://cran.r-project.org/web/packages/d3Network/index.html |
|data.table| plyr| Rsolnp|
|data.table| 1.10.4| https://cran.r-project.org/web/packages/data.table/index.html |
|data.table| zoo| grid|
|data.tree| 0.7.0| https://cran.r-project.org/web/packages/data.tree/index.html |
|datasets| 3.4.1| NA|
|date| 1.2-37| https://cran.r-project.org/web/packages/date/index.html |
|DBI|0.7| https://cran.r-project.org/web/packages/DBI/index.html |
|dbscan| 1.1-1| https://cran.r-project.org/web/packages/dbscan/index.html |
|dclone| 2.1-2| https://cran.r-project.org/web/packages/dclone/index.html |
|deal| 1.2-37| https://cran.r-project.org/web/packages/deal/index.html |
|deepnet|0.2| https://cran.r-project.org/web/packages/deepnet/index.html |
|deldir| 0.1-14| https://cran.r-project.org/web/packages/deldir/index.html |
|dendextend| 1.5.2| https://cran.r-project.org/web/packages/dendextend/index.html |
|DEoptimR| 1.0-8| https://cran.r-project.org/web/packages/DEoptimR/index.html |
|deployrRserve| 9.0.0|209|
|descr| 1.1.3| https://cran.r-project.org/web/packages/descr/index.html |
|deSolve|1.2| https://cran.r-project.org/web/packages/deSolve/index.html |
|devtools| 1.13.3| https://cran.r-project.org/web/packages/devtools/index.html |
|DiagrammeR| 0.9.0| https://cran.r-project.org/web/packages/DiagrammeR/index.html |
|dichromat| 2.0-0| https://cran.r-project.org/web/packages/dichromat/index.html |
|digest| 0.6.12| https://cran.r-project.org/web/packages/digest/index.html |
|digest| NA| CRAN|
|diptest| 0.75-7| https://cran.r-project.org/web/packages/diptest/index.html |
|distrom| 0.3-3| https://cran.r-project.org/web/packages/distrom/index.html |
|dlm| 1.1-4| https://cran.r-project.org/web/packages/dlm/index.html |
|DMwR| 0.4.1| https://cran.r-project.org/web/packages/DMwR/index.html |
|doParallel| 1.0.10| https://cran.r-project.org/web/packages/doParallel/index.html |
|doSNOW| 1.0.14| https://cran.r-project.org/web/packages/doSNOW/index.html |
|dotCall64| 0.9-04| https://cran.r-project.org/web/packages/dotCall64/index.html |
|downloader|0.4| https://cran.r-project.org/web/packages/downloader/index.html |
|dplyr| 0.7.2| https://cran.r-project.org/web/packages/dplyr/index.html |
|DPpackage| 1.1-6| https://cran.r-project.org/web/packages/DPpackage/index.html |
|dse| 2015.12-1| https://cran.r-project.org/web/packages/dse/index.html |
|DT|0.2| https://cran.r-project.org/web/packages/DT/index.html |
|dtw| 1.18-1| https://cran.r-project.org/web/packages/dtw/index.html |
|dygraphs| 1.1.1.4| https://cran.r-project.org/web/packages/dygraphs/index.html |
|dynlm| 0.3-5| https://cran.r-project.org/web/packages/dynlm/index.html |
|e1071| 1.6-8| https://cran.r-project.org/web/packages/e1071/index.html |
|earth| 4.5.1| https://cran.r-project.org/web/packages/earth/index.html |
|EbayesThresh| 1.3.2| https://cran.r-project.org/web/packages/EbayesThresh/index.html |
|ebdbNet| 1.2.5| https://cran.r-project.org/web/packages/ebdbNet/index.html |
|effects| 3.1-2| https://cran.r-project.org/web/packages/effects/index.html |
|ellipse| 0.3-8| https://cran.r-project.org/web/packages/ellipse/index.html |
|emulator| 1.2-15| https://cran.r-project.org/web/packages/emulator/index.html |
|energy| 1.7-0| https://cran.r-project.org/web/packages/energy/index.html |
|ensembleBMA| 5.1.4| https://cran.r-project.org/web/packages/ensembleBMA/index.html |
|entropy| 1.2.1| https://cran.r-project.org/web/packages/entropy/index.html |
|estimability|1.2| https://cran.r-project.org/web/packages/estimability/index.html |
|eulerr| 2.0.0| https://cran.r-project.org/web/packages/eulerr/index.html |
|EvalEst| 2015.4-2| https://cran.r-project.org/web/packages/EvalEst/index.html |
|EvalEst (>= 2006.1-1)| setRNG (>= 2004.4-1)| tframe (>= 2011.3-1)|
|evaluate| 0.10.1| https://cran.r-project.org/web/packages/evaluate/index.html |
|evd| 2.3-2| https://cran.r-project.org/web/packages/evd/index.html |
|evdbayes| 1.1-1| https://cran.r-project.org/web/packages/evdbayes/index.html |
|exactLoglinTest| 1.4.2| https://cran.r-project.org/web/packages/exactLoglinTest/index.html |
|exactRankTests| 0.8-29| https://cran.r-project.org/web/packages/exactRankTests/index.html |
|expint| 0.1-4| https://cran.r-project.org/web/packages/expint/index.html |
|expm| 0.999-2| https://cran.r-project.org/web/packages/expm/index.html |
|extraDistr| 1.8.7| https://cran.r-project.org/web/packages/extraDistr/index.html |
|extremevalues| 2.3.2| https://cran.r-project.org/web/packages/extremevalues/index.html |
|FactoMineR|1.36| https://cran.r-project.org/web/packages/FactoMineR/index.html |
|factorQR| 0.1-4| https://cran.r-project.org/web/packages/factorQR/index.html |
|faoutlier| 0.7.2| https://cran.r-project.org/web/packages/faoutlier/index.html |
|fastmatch| 1.1-0| https://cran.r-project.org/web/packages/fastmatch/index.html |
|fBasics|3011.87| https://cran.r-project.org/web/packages/fBasics/index.html |
|fdrtool| 1.2.15| https://cran.r-project.org/web/packages/fdrtool/index.html |
|fields|9| https://cran.r-project.org/web/packages/fields/index.html |
|filehash| 2.4-1| https://cran.r-project.org/web/packages/filehash/index.html |
|fitdistrplus| 1.0-9| https://cran.r-project.org/web/packages/fitdistrplus/index.html |
|flashClust| 1.01-2| https://cran.r-project.org/web/packages/flashClust/index.html |
|flexclust| 1.3-4| https://cran.r-project.org/web/packages/flexclust/index.html |
|flexmix| 2.3-14| https://cran.r-project.org/web/packages/flexmix/index.html |
|FME| 1.3.5| https://cran.r-project.org/web/packages/FME/index.html |
|fmsb| 0.6.1| https://cran.r-project.org/web/packages/fmsb/index.html |
|FNN|1.1| https://cran.r-project.org/web/packages/FNN/index.html |
|fontBitstreamVera| 0.1.1| https://cran.r-project.org/web/packages/fontBitstreamVera/index.html |
|fontLiberation| 0.1.0| https://cran.r-project.org/web/packages/fontLiberation/index.html |
|fontquiver| 0.2.1| https://cran.r-project.org/web/packages/fontquiver/index.html |
|forcats| 0.2.0| https://cran.r-project.org/web/packages/forcats/index.html |
|foreach| 1.4.4| NA|
|foreach| 1.4.3| https://cran.r-project.org/web/packages/foreach/index.html |
|foreach (>= 1.4.3)| ggplot2 (>= 2.2.0)| reshape2 (>= 1.4.2)|
|forecast|8.1| https://cran.r-project.org/web/packages/forecast/index.html |
|forecastHybrid| 1.0.8| https://cran.r-project.org/web/packages/forecastHybrid/index.html |
|foreign| 0.8-67| https://cran.r-project.org/web/packages/foreign/index.html |
|foreign| 0.8-69| https://cran.r-project.org/web/packages/foreign/index.html |
|formatR|1.5| https://cran.r-project.org/web/packages/formatR/index.html |
|formattable| 0.2.0.1| https://cran.r-project.org/web/packages/formattable/index.html |
|Formula| 1.2-2| https://cran.r-project.org/web/packages/Formula/index.html |
|fpc| 2.1-10| https://cran.r-project.org/web/packages/fpc/index.html |
|fracdiff| 1.4-2| https://cran.r-project.org/web/packages/fracdiff/index.html |
|fTrading|3010.78| https://cran.r-project.org/web/packages/fTrading/index.html |
|futile.logger| 1.4.3| https://cran.r-project.org/web/packages/futile.logger/index.html |
|futile.options| 1.0.0| https://cran.r-project.org/web/packages/futile.options/index.html |
|gam| 1.14-4| https://cran.r-project.org/web/packages/gam/index.html |
|gamlr| 1.13-3| https://cran.r-project.org/web/packages/gamlr/index.html |
|gamlss| 5.0-4| https://cran.r-project.org/web/packages/gamlss/index.html |
|gamlss.data| 5.0-0| https://cran.r-project.org/web/packages/gamlss.data/index.html |
|gamlss.data (>= 5.0-0)| gamlss.dist (>= 4.3.1)| nlme|
|gamlss.dist| 5.0-3| https://cran.r-project.org/web/packages/gamlss.dist/index.html |
|gbm| 2.1.3| https://cran.r-project.org/web/packages/gbm/index.html |
|gclus| 1.3.1| https://cran.r-project.org/web/packages/gclus/index.html |
|gdata| 2.18.0| https://cran.r-project.org/web/packages/gdata/index.html |
|gdtools| 0.1.4| https://cran.r-project.org/web/packages/gdtools/index.html |
|gee| 4.13-19| https://cran.r-project.org/web/packages/gee/index.html |
|genalg| 0.2.0| https://cran.r-project.org/web/packages/genalg/index.html |
|genetics| 1.3.8.1| https://cran.r-project.org/web/packages/genetics/index.html |
|geoR| 1.7-5.2| https://cran.r-project.org/web/packages/geoR/index.html |
|geoRglm| 0.9-8| https://cran.r-project.org/web/packages/geoRglm/index.html |
|geosphere| 1.5-5| https://cran.r-project.org/web/packages/geosphere/index.html |
|geosphere| digest| scales|
|GGally| 1.3.2| https://cran.r-project.org/web/packages/GGally/index.html |
|ggdendro| 0.1-20| https://cran.r-project.org/web/packages/ggdendro/index.html |
|ggeffects (>= 0.2.0)| ggplot2 (>= 2.2.1)| knitr|
|ggforce| 0.1.1| https://cran.r-project.org/web/packages/ggforce/index.html |
|ggfortify| 0.4.1| https://cran.r-project.org/web/packages/ggfortify/index.html |
|ggjoy| 0.4.0| https://cran.r-project.org/web/packages/ggjoy/index.html |
|ggm|2.3| https://cran.r-project.org/web/packages/ggm/index.html |
|ggmap| 2.6.1| https://cran.r-project.org/web/packages/ggmap/index.html |
|ggmcmc|1.1| https://cran.r-project.org/web/packages/ggmcmc/index.html |
|ggplot2| CRAN| NA|
|ggplot2| 2.2.1| https://cran.r-project.org/web/packages/ggplot2/index.html |
|ggplot2| reshape2| CRAN|
|ggplot2| glasso| huge|
|ggplot2 (>= 2.0.0)|| CRAN|
|ggplot2 (>= 2.2.0)| XML| yaml|
|ggplot2movies| 0.0.1| https://cran.r-project.org/web/packages/ggplot2movies/index.html |
|ggpmisc| 0.2.16| https://cran.r-project.org/web/packages/ggpmisc/index.html |
|ggpubr| 0.1.5| https://cran.r-project.org/web/packages/ggpubr/index.html |
|ggrepel| 0.6.5| https://cran.r-project.org/web/packages/ggrepel/index.html |
|ggridges| 0.4.1| https://cran.r-project.org/web/packages/ggridges/index.html |
|ggsci|2.8| https://cran.r-project.org/web/packages/ggsci/index.html |
|ggsignif| 0.4.0| https://cran.r-project.org/web/packages/ggsignif/index.html |
|ggtern| 2.2.1| https://cran.r-project.org/web/packages/ggtern/index.html |
|ggthemes| 3.4.0| https://cran.r-project.org/web/packages/ggthemes/index.html |
|gistr| 0.4.0| https://cran.r-project.org/web/packages/gistr/index.html |
|git2r| 0.19.0| https://cran.r-project.org/web/packages/git2r/index.html |
|glasso|1.8| https://cran.r-project.org/web/packages/glasso/index.html |
|glmmBUGS| 2.4.0| https://cran.r-project.org/web/packages/glmmBUGS/index.html |
|glmnet| 2.0-10| https://cran.r-project.org/web/packages/glmnet/index.html |
|GlobalOptions| 0.0.12| https://cran.r-project.org/web/packages/GlobalOptions/index.html |
|glue| 1.1.1| https://cran.r-project.org/web/packages/glue/index.html |
|gmodels| 2.16.2| https://cran.r-project.org/web/packages/gmodels/index.html |
|gmp| 0.5-13.1| https://cran.r-project.org/web/packages/gmp/index.html |
|gnm| 1.0-8| https://cran.r-project.org/web/packages/gnm/index.html |
|goftest| 1.1-1| https://cran.r-project.org/web/packages/goftest/index.html |
|googleVis| 0.6.2| https://cran.r-project.org/web/packages/googleVis/index.html |
|GPArotation| 2014.11-1| https://cran.r-project.org/web/packages/GPArotation/index.html |
|gplots| 3.0.1| https://cran.r-project.org/web/packages/gplots/index.html |
|gplots| registry| methods|
|graphics| 3.4.1| NA|
|graphics| grDevices| party (>= 1.1-0)|
|graphics| CRAN| NA|
|grDevices| 3.4.1| NA|
|grDevices| methods| utils|
|grDevices| CRAN| NA|
|grDevices| htmlwidgets (>= 0.6)| purrr (>= 0.2.0)|
|grDevices| stats| CRAN|
|grid| 3.4.1| NA|
|grid| lattice| ggplot2|
|gridBase| 0.4-7| https://cran.r-project.org/web/packages/gridBase/index.html |
|gridBase| colorspace| RColorBrewer|
|gridExtra| 2.2.1| https://cran.r-project.org/web/packages/gridExtra/index.html |
|gridExtra| Matrix| glue|
|gridExtra (>= 2.0.0)| graphics| reshape2|
|growcurves| 0.2.4.1| https://cran.r-project.org/web/packages/growcurves/index.html |
|grpreg| 3.1-2| https://cran.r-project.org/web/packages/grpreg/index.html |
|gss| 2.1-7| https://cran.r-project.org/web/packages/gss/index.html |
|gstat| 1.1-5| https://cran.r-project.org/web/packages/gstat/index.html |
|gsubfn| 0.6-6| https://cran.r-project.org/web/packages/gsubfn/index.html |
|gtable| 0.2.0| https://cran.r-project.org/web/packages/gtable/index.html |
|gtable| grid| gridExtra|
|gtools| 3.5.0| https://cran.r-project.org/web/packages/gtools/index.html |
|gWidgets| 0.0-54| https://cran.r-project.org/web/packages/gWidgets/index.html |
|gWidgetsRGtk2| 0.0-84| https://cran.r-project.org/web/packages/gWidgetsRGtk2/index.html |
|gWidgetstcltk| 0.0-55| https://cran.r-project.org/web/packages/gWidgetstcltk/index.html |
|haplo.stats| 1.7.7| https://cran.r-project.org/web/packages/haplo.stats/index.html |
|hash| 2.2.6| https://cran.r-project.org/web/packages/hash/index.html |
|haven| 1.1.0| https://cran.r-project.org/web/packages/haven/index.html |
|hbsae|1| https://cran.r-project.org/web/packages/hbsae/index.html |
|hdrcde|3.1| https://cran.r-project.org/web/packages/hdrcde/index.html |
|heavy| 0.38.1| https://cran.r-project.org/web/packages/heavy/index.html |
|hexbin| 1.27.1| https://cran.r-project.org/web/packages/hexbin/index.html |
|hexbin| Rcpp| grDevices|
|hflights|0.1| https://cran.r-project.org/web/packages/hflights/index.html |
|HH| 3.1-34| https://cran.r-project.org/web/packages/HH/index.html |
|HI|0.4| https://cran.r-project.org/web/packages/HI/index.html |
|highcharter| 0.5.0| https://cran.r-project.org/web/packages/highcharter/index.html |
|highr|0.6| https://cran.r-project.org/web/packages/highr/index.html |
|HistData| 0.8-1| https://cran.r-project.org/web/packages/HistData/index.html |
|Hmisc| 4.0-3| https://cran.r-project.org/web/packages/Hmisc/index.html |
|hms|0.3| https://cran.r-project.org/web/packages/hms/index.html |
|HSAUR| 1.3-8| https://cran.r-project.org/web/packages/HSAUR/index.html |
|htmlTable|1.9| https://cran.r-project.org/web/packages/htmlTable/index.html |
|htmltools| jsonlite| igraph|
|htmltools| base64enc| CRAN|
|htmltools| 0.3.6| https://cran.r-project.org/web/packages/htmltools/index.html |
|htmlwidgets|0.9| https://cran.r-project.org/web/packages/htmlwidgets/index.html |
|httpuv| 1.3.5| https://cran.r-project.org/web/packages/httpuv/index.html |
|httr| 1.2.1| https://cran.r-project.org/web/packages/httr/index.html |
|huge| 1.2.7| https://cran.r-project.org/web/packages/huge/index.html |
|hunspell|2.7| https://cran.r-project.org/web/packages/hunspell/index.html |
|IBrokers| 0.9-12| https://cran.r-project.org/web/packages/IBrokers/index.html |
|ifultools| 2.0-4| https://cran.r-project.org/web/packages/ifultools/index.html |
|igraph| 1.1.2| https://cran.r-project.org/web/packages/igraph/index.html |
|igraph| CRAN| NA|
|igraph| jpeg| png|
|igraph| methods| RColorBrewer|
|influenceR| 0.1.0| https://cran.r-project.org/web/packages/influenceR/index.html |
|influenceR (>= 0.1.0)| magrittr (>= 1.5)| RColorBrewer (>=|
|inline| 0.3.14| https://cran.r-project.org/web/packages/inline/index.html |
|intervals| 0.15.1| https://cran.r-project.org/web/packages/intervals/index.html |
|ipred| 0.9-6| https://cran.r-project.org/web/packages/ipred/index.html |
|irlba| 2.2.1| https://cran.r-project.org/web/packages/irlba/index.html |
|irr|0.84| https://cran.r-project.org/web/packages/irr/index.html |
|iterators| 1.0.8| https://cran.r-project.org/web/packages/iterators/index.html |
|iterators| 1.0.8| https://cran.r-project.org/web/packages/iterators/index.html |
|janeaustenr| 0.1.5| https://cran.r-project.org/web/packages/janeaustenr/index.html |
|janeaustenr| purrr (>= 0.1.1)| methods|
|janitor| 0.3.0| https://cran.r-project.org/web/packages/janitor/index.html |
|jpeg| 0.1-8| https://cran.r-project.org/web/packages/jpeg/index.html |
|jsonlite|1.4| https://cran.r-project.org/web/packages/jsonlite/index.html |
|jsonlite|1.5| https://cran.r-project.org/web/packages/jsonlite/index.html |
|jsonlite| CRAN| NA|
|kernlab| 0.9-25| https://cran.r-project.org/web/packages/kernlab/index.html |
|KernSmooth| 2.23-15| https://cran.r-project.org/web/packages/KernSmooth/index.html |
|KernSmooth| 2.23-15| https://cran.r-project.org/web/packages/KernSmooth/index.html |
|KFKSDS|1.6| https://cran.r-project.org/web/packages/KFKSDS/index.html |
|kinship2| 1.6.4| https://cran.r-project.org/web/packages/kinship2/index.html |
|kknn| 1.3.1| https://cran.r-project.org/web/packages/kknn/index.html |
|klaR| 0.6-12| https://cran.r-project.org/web/packages/klaR/index.html |
|km.ci| 0.5-2| https://cran.r-project.org/web/packages/km.ci/index.html |
|KMsurv| 0.1-5| https://cran.r-project.org/web/packages/KMsurv/index.html |
|knitr| rmarkdown| dplyr|
|knitr|1.16| https://cran.r-project.org/web/packages/knitr/index.html |
|knitr| jsonlite (>= 0.9.20)| shiny|
|labeling|0.3| https://cran.r-project.org/web/packages/labeling/index.html |
|laeken| 0.4.6| https://cran.r-project.org/web/packages/laeken/index.html |
|Lahman| 5.0-0| https://cran.r-project.org/web/packages/Lahman/index.html |
|lambda.r| 1.1.9| https://cran.r-project.org/web/packages/lambda.r/index.html |
|lars|1.2| https://cran.r-project.org/web/packages/lars/index.html |
|latex2exp| 0.4.0| https://cran.r-project.org/web/packages/latex2exp/index.html |
|lattice| 0.20-35| https://cran.r-project.org/web/packages/lattice/index.html |
|lattice| 0.20-35| https://cran.r-project.org/web/packages/lattice/index.html |
|latticeExtra| 0.6-28| https://cran.r-project.org/web/packages/latticeExtra/index.html |
|latticeExtra| lubridate| cluster|
|lava|1.5| https://cran.r-project.org/web/packages/lava/index.html |
|lavaan| 0.5-23.1097| https://cran.r-project.org/web/packages/lavaan/index.html |
|lazyeval| 0.2.0| https://cran.r-project.org/web/packages/lazyeval/index.html |
|lazyeval| pryr| magrittr|
|leaflet| 1.1.0| https://cran.r-project.org/web/packages/leaflet/index.html |
|leaflet.esri|0.2| https://cran.r-project.org/web/packages/leaflet.esri/index.html |
|leaflet.extras|0.2| https://cran.r-project.org/web/packages/leaflet.extras/index.html |
|leaps|3| https://cran.r-project.org/web/packages/leaps/index.html |
|LearnBayes|2.15| https://cran.r-project.org/web/packages/LearnBayes/index.html |
|LiblineaR| 2.10-8| https://cran.r-project.org/web/packages/LiblineaR/index.html |
|LICORS| 0.2.0| https://cran.r-project.org/web/packages/LICORS/index.html |
|limSolve| 1.5.5.2| https://cran.r-project.org/web/packages/limSolve/index.html |
|linprog| 0.9-2| https://cran.r-project.org/web/packages/linprog/index.html |
|lme4| 1.1-13| https://cran.r-project.org/web/packages/lme4/index.html |
|lmm|1| https://cran.r-project.org/web/packages/lmm/index.html |
|lmtest| 0.9-35| https://cran.r-project.org/web/packages/lmtest/index.html |
|locfit| 1.5-9.1| https://cran.r-project.org/web/packages/locfit/index.html |
|locpol| 0.6-0| https://cran.r-project.org/web/packages/locpol/index.html |
|LogicReg| 1.5.9| https://cran.r-project.org/web/packages/LogicReg/index.html |
|lpSolve| 5.6.13| https://cran.r-project.org/web/packages/lpSolve/index.html |
|lsa| 0.73.1| https://cran.r-project.org/web/packages/lsa/index.html |
|lsmeans| 2.26-3| https://cran.r-project.org/web/packages/lsmeans/index.html |
|lubridate| 1.6.0| https://cran.r-project.org/web/packages/lubridate/index.html |
|lubridate| magrittr| modelr|
|magic| 1.5-6| https://cran.r-project.org/web/packages/magic/index.html |
|magick|1.5| https://cran.r-project.org/web/packages/magick/index.html |
|magrittr|1.5| https://cran.r-project.org/web/packages/magrittr/index.html |
|magrittr| psych| purrr|
|magrittr| methods| rmarkdown|
|MAPA| 2.0.2| https://cran.r-project.org/web/packages/MAPA/index.html |
|mapdata| 2.2-6| https://cran.r-project.org/web/packages/mapdata/index.html |
|mapproj| 1.2-5| https://cran.r-project.org/web/packages/mapproj/index.html |
|maps| 3.2.0| https://cran.r-project.org/web/packages/maps/index.html |
|maptools| 0.9-2| https://cran.r-project.org/web/packages/maptools/index.html |
|maptools| httr| uuid|
|maptree| 1.4-7| https://cran.r-project.org/web/packages/maptree/index.html |
|marima|2.2| https://cran.r-project.org/web/packages/marima/index.html |
|markdown| methods| png|
|markdown|0.8| https://cran.r-project.org/web/packages/markdown/index.html |
|MASS| 7.3-47| https://cran.r-project.org/web/packages/MASS/index.html |
|MASS| 7.3-47| https://cran.r-project.org/web/packages/MASS/index.html |
|MASS| stats| gmodels|
|MasterBayes|2.55| https://cran.r-project.org/web/packages/MasterBayes/index.html |
|Matrix| 1.2-10| https://cran.r-project.org/web/packages/Matrix/index.html |
|Matrix| 1.2-10| https://cran.r-project.org/web/packages/Matrix/index.html |
|matrixcalc| coda| NA|
|matrixcalc| 1.0-3| https://cran.r-project.org/web/packages/matrixcalc/index.html |
|MatrixModels| Rcpp (>= 0.11.2)| methods|
|MatrixModels| 0.4-1| https://cran.r-project.org/web/packages/MatrixModels/index.html |
|maxent| 1.3.3.1| https://cran.r-project.org/web/packages/maxent/index.html |
|maxent| glmnet| tau|
|maxLik| 1.3-4| https://cran.r-project.org/web/packages/maxLik/index.html |
|maxstat| 0.7-25| https://cran.r-project.org/web/packages/maxstat/index.html |
|mboost| 2.8-1| https://cran.r-project.org/web/packages/mboost/index.html |
|mclust|5.3| https://cran.r-project.org/web/packages/mclust/index.html |
|mclust| Rcpp| sROC|
|mcmc| 0.9-5| https://cran.r-project.org/web/packages/mcmc/index.html |
|MCMCglmm|2.24| https://cran.r-project.org/web/packages/MCMCglmm/index.html |
|mda| 0.4-9| https://cran.r-project.org/web/packages/mda/index.html |
|memoise| 1.1.0| https://cran.r-project.org/web/packages/memoise/index.html |
|methods| 3.4.1| NA|
|methods| utils| grDevices|
|methods| pkgconfig| rlang (>= 0.1)|
|methods| stats| utils|
|methods| scales| CRAN|
|methods| Rcpp| CRAN|
|methods| CRAN| NA|
|metricsgraphics| 0.9.0| https://cran.r-project.org/web/packages/metricsgraphics/index.html |
|mgcv| 1.8-17| https://cran.r-project.org/web/packages/mgcv/index.html |
|mgcv| 1.8-18| https://cran.r-project.org/web/packages/mgcv/index.html |
|mi|1| https://cran.r-project.org/web/packages/mi/index.html |
|mice|2.3| https://cran.r-project.org/web/packages/mice/index.html |
|microbenchmark| 1.4-2.1| https://cran.r-project.org/web/packages/microbenchmark/index.html |
|MicrosoftR| 3.4.1.0081| NA|
|mime|0.5| https://cran.r-project.org/web/packages/mime/index.html |
|miniCRAN| 0.2.10| https://cran.r-project.org/web/packages/miniCRAN/index.html |
|miniUI| 0.1.1| https://cran.r-project.org/web/packages/miniUI/index.html |
|minpack.lm| 1.2-1| https://cran.r-project.org/web/packages/minpack.lm/index.html |
|minqa| 1.2.4| https://cran.r-project.org/web/packages/minqa/index.html |
|mirt|1.25| https://cran.r-project.org/web/packages/mirt/index.html |
|misc3d| 0.8-4| https://cran.r-project.org/web/packages/misc3d/index.html |
|miscTools| 0.6-22| https://cran.r-project.org/web/packages/miscTools/index.html |
|mitools|2.3| https://cran.r-project.org/web/packages/mitools/index.html |
|mixtools| 1.1.0| https://cran.r-project.org/web/packages/mixtools/index.html |
|mlbench| 2.1-1| https://cran.r-project.org/web/packages/mlbench/index.html |
|mlogitBMA| 0.1-6| https://cran.r-project.org/web/packages/mlogitBMA/index.html |
|mnormt| 1.5-5| https://cran.r-project.org/web/packages/mnormt/index.html |
|MNP| 3.0-2| https://cran.r-project.org/web/packages/MNP/index.html |
|ModelMetrics| 1.1.0| https://cran.r-project.org/web/packages/ModelMetrics/index.html |
|modelr| 0.1.1| https://cran.r-project.org/web/packages/modelr/index.html |
|modeltools| 0.2-21| https://cran.r-project.org/web/packages/modeltools/index.html |
|modeltools (>= 0.2-21)| strucchange| survival (>= 2.37-7)|
|mombf| 1.9.5| https://cran.r-project.org/web/packages/mombf/index.html |
|monomvn| 1.9-7| https://cran.r-project.org/web/packages/monomvn/index.html |
|monreg| 0.1.3| https://cran.r-project.org/web/packages/monreg/index.html |
|mosaic| 1.0.0| https://cran.r-project.org/web/packages/mosaic/index.html |
|mosaicData| mosaicCore| ggplot2|
|mosaicData| 0.14.0| https://cran.r-project.org/web/packages/mosaicData/index.html |
|MSBVAR| 0.9-3| https://cran.r-project.org/web/packages/MSBVAR/index.html |
|msm| 1.6.4| https://cran.r-project.org/web/packages/msm/index.html |
|multcomp| 1.4-6| https://cran.r-project.org/web/packages/multcomp/index.html |
|multcomp| htmlTable| htmltools|
|multicool| 0.1-10| https://cran.r-project.org/web/packages/multicool/index.html |
|munsell| 0.4.3| https://cran.r-project.org/web/packages/munsell/index.html |
|mvoutlier| 2.0.8| https://cran.r-project.org/web/packages/mvoutlier/index.html |
|mvtnorm| robustbase| kernlab|
|mvtnorm| xtable (>= 1.8-2)| CRAN|
|mvtnorm| 1.0-6| https://cran.r-project.org/web/packages/mvtnorm/index.html |
|NbClust|3| https://cran.r-project.org/web/packages/NbClust/index.html |
|ncvreg| 3.9-1| https://cran.r-project.org/web/packages/ncvreg/index.html |
|network| 1.13.0| https://cran.r-project.org/web/packages/network/index.html |
|networkD3|0.4| https://cran.r-project.org/web/packages/networkD3/index.html |
|neuralnet|1.33| https://cran.r-project.org/web/packages/neuralnet/index.html |
|nlme| 3.1-131| https://cran.r-project.org/web/packages/nlme/index.html |
|nlme| 3.1-131| https://cran.r-project.org/web/packages/nlme/index.html |
|nlme| rpart| spatstat.utils (>= 1.6-0)|
|nloptr| 1.0.4| https://cran.r-project.org/web/packages/nloptr/index.html |
|NLP| 0.1-10| https://cran.r-project.org/web/packages/NLP/index.html |
|NMF| 0.20.6| https://cran.r-project.org/web/packages/NMF/index.html |
|nnet| 7.3-12| https://cran.r-project.org/web/packages/nnet/index.html |
|nnet| stats| stats4|
|nnet| 7.3-12| https://cran.r-project.org/web/packages/nnet/index.html |
|nnls|1.4| https://cran.r-project.org/web/packages/nnls/index.html |
|nortest| 1.0-4| https://cran.r-project.org/web/packages/nortest/index.html |
|nortest| e1071| scales|
|numbers| 0.6-6| https://cran.r-project.org/web/packages/numbers/index.html |
|numDeriv| 2016.8-1| https://cran.r-project.org/web/packages/numDeriv/index.html |
|openair| 2.1-5| https://cran.r-project.org/web/packages/openair/index.html |
|openssl| 0.9.6| https://cran.r-project.org/web/packages/openssl/index.html |
|OutlierDC| 0.3-0| https://cran.r-project.org/web/packages/OutlierDC/index.html |
|OutlierDM| 1.1.1| https://cran.r-project.org/web/packages/OutlierDM/index.html |
|outliers|0.14| https://cran.r-project.org/web/packages/outliers/index.html |
|pacbpred| 0.92.2| https://cran.r-project.org/web/packages/pacbpred/index.html |
|parallel| utils| NA|
|parallel| 3.4.1| NA|
|parallel| CRAN| NA|
|partitions| 1.9-19| https://cran.r-project.org/web/packages/partitions/index.html |
|party| 1.2-3| https://cran.r-project.org/web/packages/party/index.html |
|partykit| 1.1-1| https://cran.r-project.org/web/packages/partykit/index.html |
|PAWL|0.5| https://cran.r-project.org/web/packages/PAWL/index.html |
|pbapply| 1.3-3| https://cran.r-project.org/web/packages/pbapply/index.html |
|pbivnorm| quadprog| numDeriv|
|pbivnorm| 0.6.0| https://cran.r-project.org/web/packages/pbivnorm/index.html |
|pbkrtest| 0.4-7| https://cran.r-project.org/web/packages/pbkrtest/index.html |
|PCAmixdata|3.1| https://cran.r-project.org/web/packages/PCAmixdata/index.html |
|pcaPP| 1.9-72| https://cran.r-project.org/web/packages/pcaPP/index.html |
|pdc| 1.0.3| https://cran.r-project.org/web/packages/pdc/index.html |
|PerformanceAnalytics| 1.4.3541| https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html |
|permute| 0.9-4| https://cran.r-project.org/web/packages/permute/index.html |
|pheatmap| 1.0.8| https://cran.r-project.org/web/packages/pheatmap/index.html |
|pixmap| 0.4-11| https://cran.r-project.org/web/packages/pixmap/index.html |
|pkgconfig| 2.0.1| https://cran.r-project.org/web/packages/pkgconfig/index.html |
|pkgconfig| Rcpp (>= 0.12.7)| CRAN|
|pkgmaker|0.22| https://cran.r-project.org/web/packages/pkgmaker/index.html |
|platetools| 0.0.2| https://cran.r-project.org/web/packages/platetools/index.html |
|plot3D|1.1| https://cran.r-project.org/web/packages/plot3D/index.html |
|plotly| 4.7.1| https://cran.r-project.org/web/packages/plotly/index.html |
|plotmo| 3.3.4| https://cran.r-project.org/web/packages/plotmo/index.html |
|plotrix| 3.6-5| https://cran.r-project.org/web/packages/plotrix/index.html |
|pls| 2.6-0| https://cran.r-project.org/web/packages/pls/index.html |
|plyr| 1.8.4| https://cran.r-project.org/web/packages/plyr/index.html |
|png| 0.1-7| https://cran.r-project.org/web/packages/png/index.html |
|png| 0.1-7| https://cran.r-project.org/web/packages/png/index.html |
|polspline| 1.1.12| https://cran.r-project.org/web/packages/polspline/index.html |
|polyclip| 1.6-1| https://cran.r-project.org/web/packages/polyclip/index.html |
|polynom| 1.3-9| https://cran.r-project.org/web/packages/polynom/index.html |
|ppcor|1.1| https://cran.r-project.org/web/packages/ppcor/index.html |
|prabclus| 2.2-6| https://cran.r-project.org/web/packages/prabclus/index.html |
|pracma| 2.0.7| https://cran.r-project.org/web/packages/pracma/index.html |
|praise| 1.0.0| https://cran.r-project.org/web/packages/praise/index.html |
|predmixcor| 1.1-1| https://cran.r-project.org/web/packages/predmixcor/index.html |
|PresenceAbsence| 1.1.9| https://cran.r-project.org/web/packages/PresenceAbsence/index.html |
|pROC| 1.10.0| https://cran.r-project.org/web/packages/pROC/index.html |
|prodlim| 1.6.1| https://cran.r-project.org/web/packages/prodlim/index.html |
|profdpm|3.3| https://cran.r-project.org/web/packages/profdpm/index.html |
|profileModel| 0.5-9| https://cran.r-project.org/web/packages/profileModel/index.html |
|prophet|0.2| https://cran.r-project.org/web/packages/prophet/index.html |
|proto| utils| lattice|
|proto| 1.0.0| https://cran.r-project.org/web/packages/proto/index.html |
|proxy| 0.4-17| https://cran.r-project.org/web/packages/proxy/index.html |
|pryr| 0.1.2| https://cran.r-project.org/web/packages/pryr/index.html |
|pscl| 1.4.9| https://cran.r-project.org/web/packages/pscl/index.html |
|psych| 1.7.5| https://cran.r-project.org/web/packages/psych/index.html |
|purrr| data.table| CRAN|
|purrr| 0.2.3| https://cran.r-project.org/web/packages/purrr/index.html |
|pwr| rlang| sandwich (>= 2.3-4)|
|qap| 0.1-1| https://cran.r-project.org/web/packages/qap/index.html |
|qcc|2.7| https://cran.r-project.org/web/packages/qcc/index.html |
|qdapDictionaries| 1.0.6| https://cran.r-project.org/web/packages/qdapDictionaries/index.html |
|qdapRegex| 0.7.2| https://cran.r-project.org/web/packages/qdapRegex/index.html |
|qdapTools| 1.3.3| https://cran.r-project.org/web/packages/qdapTools/index.html |
|qgraph| 1.4.3| https://cran.r-project.org/web/packages/qgraph/index.html |
|qicharts| 0.5.5| https://cran.r-project.org/web/packages/qicharts/index.html |
|quadprog| 1.5-5| https://cran.r-project.org/web/packages/quadprog/index.html |
|qualityTools|1.55| https://cran.r-project.org/web/packages/qualityTools/index.html |
|quanteda| 1.0.0| https://cran.r-project.org/web/packages/quanteda/index.html |
|quantmod| 0.4-10| https://cran.r-project.org/web/packages/quantmod/index.html |
|quantreg|5.33| https://cran.r-project.org/web/packages/quantreg/index.html |
|qvcalc| 0.9-0| https://cran.r-project.org/web/packages/qvcalc/index.html |
|R(>= 3.0.0)| ||
|R.matlab| 3.6.1| https://cran.r-project.org/web/packages/R.matlab/index.html |
|R.methodsS3| 1.7.1| https://cran.r-project.org/web/packages/R.methodsS3/index.html |
|R.oo| 1.21.0| https://cran.r-project.org/web/packages/R.oo/index.html |
|R.utils| 2.5.0| https://cran.r-project.org/web/packages/R.utils/index.html |
|R.utils (>= 2.3.0)| CRAN| NA|
|R2HTML| 2.3.2| https://cran.r-project.org/web/packages/R2HTML/index.html |
|R2jags| 0.5-7| https://cran.r-project.org/web/packages/R2jags/index.html |
|R2OpenBUGS| 3.2-3.2| https://cran.r-project.org/web/packages/R2OpenBUGS/index.html |
|R2WinBUGS| parallel| stats|
|R2WinBUGS| 2.1-21| https://cran.r-project.org/web/packages/R2WinBUGS/index.html |
|R6| 2.2.0| https://cran.r-project.org/web/packages/R6/index.html |
|R6| 2.2.2| https://cran.r-project.org/web/packages/R6/index.html |
|ramps| 0.6-14| https://cran.r-project.org/web/packages/ramps/index.html |
|RandomFields| 3.1.50| https://cran.r-project.org/web/packages/RandomFields/index.html |
|RandomFieldsUtils| 0.3.25| https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html |
|randomForest| 4.6-12| https://cran.r-project.org/web/packages/randomForest/index.html |
|ranger| 0.8.0| https://cran.r-project.org/web/packages/ranger/index.html |
|rappdirs| 0.3.1| https://cran.r-project.org/web/packages/rappdirs/index.html |
|RArcInfo| 0.4-12| https://cran.r-project.org/web/packages/RArcInfo/index.html |
|raster| 2.5-8| https://cran.r-project.org/web/packages/raster/index.html |
|rattle| 4.1.0| https://cran.r-project.org/web/packages/rattle/index.html |
|rbenchmark| 1.0.0| https://cran.r-project.org/web/packages/rbenchmark/index.html |
|Rblpapi| 0.3.6| https://cran.r-project.org/web/packages/Rblpapi/index.html |
|rbokeh| 0.5.0| https://cran.r-project.org/web/packages/rbokeh/index.html |
|rbugs| 0.5-9| https://cran.r-project.org/web/packages/rbugs/index.html |
|RColorBrewer| dplyr| tibble|
|RColorBrewer| 1.1-2| https://cran.r-project.org/web/packages/RColorBrewer/index.html |
|Rcpp| CRAN| NA|
|Rcpp| 0.12.12| https://cran.r-project.org/web/packages/Rcpp/index.html |
|Rcpp| shiny| svglite (>= 1.2.0)|
|RcppArmadillo| 0.7.900.2.0| https://cran.r-project.org/web/packages/RcppArmadillo/index.html |
|rcppbugs| 0.1.4.2| https://cran.r-project.org/web/packages/rcppbugs/index.html |
|RcppEigen| 0.3.3.3.0| https://cran.r-project.org/web/packages/RcppEigen/index.html |
|RcppExamples| 0.1.8| https://cran.r-project.org/web/packages/RcppExamples/index.html |
|RcppParallel| 4.3.20| https://cran.r-project.org/web/packages/RcppParallel/index.html |
|RCurl| 1.95-4.8| https://cran.r-project.org/web/packages/RCurl/index.html |
|readr| methods| utils|
|readr| 1.1.1| https://cran.r-project.org/web/packages/readr/index.html |
|readxl| 1.0.0| https://cran.r-project.org/web/packages/readxl/index.html |
|Redmonder| 0.2.0| https://cran.r-project.org/web/packages/Redmonder/index.html |
|registry|0.3| https://cran.r-project.org/web/packages/registry/index.html |
|relaimpo| 2.2-2| https://cran.r-project.org/web/packages/relaimpo/index.html |
|relimp| 1.0-5| https://cran.r-project.org/web/packages/relimp/index.html |
|rematch| 1.0.1| https://cran.r-project.org/web/packages/rematch/index.html |
|Renext| 3.1-0| https://cran.r-project.org/web/packages/Renext/index.html |
|reports| 0.1.4| https://cran.r-project.org/web/packages/reports/index.html |
|reshape| 0.8.6| https://cran.r-project.org/web/packages/reshape/index.html |
|reshape2| stats| stats4|
|reshape2| scales (>= 0.4.1)| stats|
|reshape2| 1.4.2| https://cran.r-project.org/web/packages/reshape2/index.html |
|RevoIOQ| 8.0.8| NA|
|RevoMods| 11.0.0| NA|
|RevoUtils| 10.0.6| NA|
|RevoUtilsMath| 10.0.1| NA|
|rex| 1.1.1| https://cran.r-project.org/web/packages/rex/index.html |
|rFerns| 2.0.2| https://cran.r-project.org/web/packages/rFerns/index.html |
|rgdal| 1.2-15| https://cran.r-project.org/web/packages/rgdal/index.html |
|rgeos| 0.3-23| https://cran.r-project.org/web/packages/rgeos/index.html |
|rgexf| 0.15.3| https://cran.r-project.org/web/packages/rgexf/index.html |
|rgl| 0.98.1| https://cran.r-project.org/web/packages/rgl/index.html |
|RgoogleMaps| 1.4.1| https://cran.r-project.org/web/packages/RgoogleMaps/index.html |
|RGraphics| 2.0-14| https://cran.r-project.org/web/packages/RGraphics/index.html |
|RGtk2| 2.20.33| https://cran.r-project.org/web/packages/RGtk2/index.html |
|RInside| 0.2.14| https://cran.r-project.org/web/packages/RInside/index.html |
|RJaCGH| 2.0.4| https://cran.r-project.org/web/packages/RJaCGH/index.html |
|rjags| 4-6| https://cran.r-project.org/web/packages/rjags/index.html |
|rjson| 0.2.15| https://cran.r-project.org/web/packages/rjson/index.html |
|RJSONIO| 1.3-0| https://cran.r-project.org/web/packages/RJSONIO/index.html |
|rlang| 0.1.2| https://cran.r-project.org/web/packages/rlang/index.html |
|rlang| scales| sjlabelled (>= 1.0.1)|
|rlecuyer| 0.3-4| https://cran.r-project.org/web/packages/rlecuyer/index.html |
|rlist| 0.4.6.1| https://cran.r-project.org/web/packages/rlist/index.html |
|rmarkdown|1.6| https://cran.r-project.org/web/packages/rmarkdown/index.html |
|Rmpfr| 0.6-1| https://cran.r-project.org/web/packages/Rmpfr/index.html |
|rms| 5.1-1| https://cran.r-project.org/web/packages/rms/index.html |
|RMySQL| 0.10.12| https://cran.r-project.org/web/packages/RMySQL/index.html |
|rngtools| 1.2.4| https://cran.r-project.org/web/packages/rngtools/index.html |
|rngtools (>= 1.2.3)| cluster| graphics|
|robCompositions| 2.0.5| https://cran.r-project.org/web/packages/robCompositions/index.html |
|robustbase| 0.92-7| https://cran.r-project.org/web/packages/robustbase/index.html |
|ROCR| 1.0-7| https://cran.r-project.org/web/packages/ROCR/index.html |
|RODBC| 1.3-15| https://cran.r-project.org/web/packages/RODBC/index.html |
|RODBC| 1.3-15| https://cran.r-project.org/web/packages/RODBC/index.html |
|Rook| 1.1-1| https://cran.r-project.org/web/packages/Rook/index.html |
|rootSolve|1.7| https://cran.r-project.org/web/packages/rootSolve/index.html |
|roxygen2| 6.0.1| https://cran.r-project.org/web/packages/roxygen2/index.html |
|rpart| 4.1-11| https://cran.r-project.org/web/packages/rpart/index.html |
|rpart.plot| 2.1.2| https://cran.r-project.org/web/packages/rpart.plot/index.html |
|rpivotTable| 0.2.0| https://cran.r-project.org/web/packages/rpivotTable/index.html |
|rprojroot| methods| stringr (>= 1.2.0)|
|rprojroot|1.2| https://cran.r-project.org/web/packages/rprojroot/index.html |
|rrcov| 1.4-3| https://cran.r-project.org/web/packages/rrcov/index.html |
|rscproxy| 2.0-5| https://cran.r-project.org/web/packages/rscproxy/index.html |
|rsdmx| 0.5-9| https://cran.r-project.org/web/packages/rsdmx/index.html |
|RSGHB| 1.1.2| https://cran.r-project.org/web/packages/RSGHB/index.html |
|RSiteCatalyst| 1.4.13| https://cran.r-project.org/web/packages/RSiteCatalyst/index.html |
|RSNNS| 0.4-9| https://cran.r-project.org/web/packages/RSNNS/index.html |
|Rsolnp|1.16| https://cran.r-project.org/web/packages/Rsolnp/index.html |
|RSQLite|2| https://cran.r-project.org/web/packages/RSQLite/index.html |
|rstan| 2.16.2| https://cran.r-project.org/web/packages/rstan/index.html |
|rstudioapi|0.6| https://cran.r-project.org/web/packages/rstudioapi/index.html |
|RTextTools| 1.4.2| https://cran.r-project.org/web/packages/RTextTools/index.html |
|RUnit| 0.4.26| https://cran.r-project.org/web/packages/RUnit/index.html |
|RUnit| 0.4.31| https://cran.r-project.org/web/packages/RUnit/index.html |
|runjags| 2.0.4-2| https://cran.r-project.org/web/packages/runjags/index.html |
|Runuran| 0.23.0| https://cran.r-project.org/web/packages/Runuran/index.html |
|rvest| 0.3.2| https://cran.r-project.org/web/packages/rvest/index.html |
|rworldmap| 1.3-6| https://cran.r-project.org/web/packages/rworldmap/index.html |
|rworldxtra|1.01| https://cran.r-project.org/web/packages/rworldxtra/index.html |
|SampleSizeMeans|1.1| https://cran.r-project.org/web/packages/SampleSizeMeans/index.html |
|SampleSizeProportions|1| https://cran.r-project.org/web/packages/SampleSizeProportions/index.html |
|sandwich| 2.4-0| https://cran.r-project.org/web/packages/sandwich/index.html |
|sas7bdat|0.5| https://cran.r-project.org/web/packages/sas7bdat/index.html |
|sbgcop|0.975| https://cran.r-project.org/web/packages/sbgcop/index.html |
|scales| 0.4.1| https://cran.r-project.org/web/packages/scales/index.html |
|scales| CRAN| NA|
|scales| utils| Matrix|
|scatterplot3d| 0.3-40| https://cran.r-project.org/web/packages/scatterplot3d/index.html |
|sciplot| 1.1-1| https://cran.r-project.org/web/packages/sciplot/index.html |
|segmented| 0.5-2.1| https://cran.r-project.org/web/packages/segmented/index.html |
|selectr| 0.3-1| https://cran.r-project.org/web/packages/selectr/index.html |
|sem| 3.1-9| https://cran.r-project.org/web/packages/sem/index.html |
|seriation| 1.2-2| https://cran.r-project.org/web/packages/seriation/index.html |
|setRNG| 2013.9-1| https://cran.r-project.org/web/packages/setRNG/index.html |
|setRNG (>= 2004.4-1)| CRAN| NA|
|sf| 0.5-5| https://cran.r-project.org/web/packages/sf/index.html |
|sfsmisc| 1.1-1| https://cran.r-project.org/web/packages/sfsmisc/index.html |
|sgeostat| 1.0-27| https://cran.r-project.org/web/packages/sgeostat/index.html |
|shape| 1.4.2| https://cran.r-project.org/web/packages/shape/index.html |
|shapefiles|0.7| https://cran.r-project.org/web/packages/shapefiles/index.html |
|shiny| 1.0.3| https://cran.r-project.org/web/packages/shiny/index.html |
|showtext| 0.4-6| https://cran.r-project.org/web/packages/showtext/index.html |
|showtextdb|1| https://cran.r-project.org/web/packages/showtextdb/index.html |
|SIS| 0.8-4| https://cran.r-project.org/web/packages/SIS/index.html |
|SixSigma| 0.9-4| https://cran.r-project.org/web/packages/SixSigma/index.html |
|sjmisc| 2.6.0| https://cran.r-project.org/web/packages/sjmisc/index.html |
|sjPlot| 2.3.2| https://cran.r-project.org/web/packages/sjPlot/index.html |
|sjstats| 0.10.3| https://cran.r-project.org/web/packages/sjstats/index.html |
|sjstats (>= 0.10.3)| tibble (>= 1.3.3)| tidyr (>= 0.6.1)|
|skmeans| 0.2-10| https://cran.r-project.org/web/packages/skmeans/index.html |
|slam| 0.1-40| https://cran.r-project.org/web/packages/slam/index.html |
|sm| 2.2-5.4| https://cran.r-project.org/web/packages/sm/index.html |
|smoothSurv|1.6| https://cran.r-project.org/web/packages/smoothSurv/index.html |
|sna|2.4| https://cran.r-project.org/web/packages/sna/index.html |
|snow| 0.4-2| https://cran.r-project.org/web/packages/snow/index.html |
|SnowballC| 0.5.1| https://cran.r-project.org/web/packages/SnowballC/index.html |
|snowFT| 1.6-0| https://cran.r-project.org/web/packages/snowFT/index.html |
|sp| 1.2-5| https://cran.r-project.org/web/packages/sp/index.html |
|spacetime| 1.2-0| https://cran.r-project.org/web/packages/spacetime/index.html |
|spacetime (>= 1.0-0)| FNN| CRAN|
|spacyr| 0.9.3| https://cran.r-project.org/web/packages/spacyr/index.html |
|spam| 2.1-1| https://cran.r-project.org/web/packages/spam/index.html |
|SparseM|1.77| https://cran.r-project.org/web/packages/SparseM/index.html |
|spatial| 7.3-11| https://cran.r-project.org/web/packages/spatial/index.html |
|spatial| 7.3-11| https://cran.r-project.org/web/packages/spatial/index.html |
|spatstat| 1.51-0| https://cran.r-project.org/web/packages/spatstat/index.html |
|spBayes| 0.4-1| https://cran.r-project.org/web/packages/spBayes/index.html |
|spdep| 0.6-13| https://cran.r-project.org/web/packages/spdep/index.html |
|spikeslab| 1.1.5| https://cran.r-project.org/web/packages/spikeslab/index.html |
|splancs| 2.01-40| https://cran.r-project.org/web/packages/splancs/index.html |
|splines| 3.4.1| NA|
|spls| 2.2-1| https://cran.r-project.org/web/packages/spls/index.html |
|splus2R| 1.2-2| https://cran.r-project.org/web/packages/splus2R/index.html |
|spTimer| 2.0-1| https://cran.r-project.org/web/packages/spTimer/index.html |
|sqldf| 0.4-11| https://cran.r-project.org/web/packages/sqldf/index.html |
|sROC| 0.1-2| https://cran.r-project.org/web/packages/sROC/index.html |
|stabledist| 0.7-1| https://cran.r-project.org/web/packages/stabledist/index.html |
|stabs| 0.6-3| https://cran.r-project.org/web/packages/stabs/index.html |
|StanHeaders| 2.16.0-1| https://cran.r-project.org/web/packages/StanHeaders/index.html |
|statmod| 1.4.30| https://cran.r-project.org/web/packages/statmod/index.html |
|statnet.common| 4.0.0| https://cran.r-project.org/web/packages/statnet.common/index.html |
|stats| 3.4.1| NA|
|stats| utils| CRAN|
|stats| survival| utils|
|stats4| 3.4.1| NA|
|stepPlr|0.92| https://cran.r-project.org/web/packages/stepPlr/index.html |
|stochvol| 1.3.2| https://cran.r-project.org/web/packages/stochvol/index.html |
|stopwords| CRAN| NA|
|stopwords| 0.9.0| https://cran.r-project.org/web/packages/stopwords/index.html |
|stringdist| 0.9.4.6| https://cran.r-project.org/web/packages/stringdist/index.html |
|stringdist (>= 0.9.4)| stringr (>= 1.2.0)| tibble (>= 1.3.3)|
|stringi| CRAN| NA|
|stringi| 1.1.5| https://cran.r-project.org/web/packages/stringi/index.html |
|stringr| CRAN| NA|
|stringr| 1.2.0| https://cran.r-project.org/web/packages/stringr/index.html |
|strucchange| 1.5-1| https://cran.r-project.org/web/packages/strucchange/index.html |
|stsm|1.9| https://cran.r-project.org/web/packages/stsm/index.html |
|stsm.class|1.3| https://cran.r-project.org/web/packages/stsm.class/index.html |
|SuppDists| 1.1-9.4| https://cran.r-project.org/web/packages/SuppDists/index.html |
|survey| 3.32-1| https://cran.r-project.org/web/packages/survey/index.html |
|survival| 2.41-3| https://cran.r-project.org/web/packages/survival/index.html |
|survival| 2.41-3| https://cran.r-project.org/web/packages/survival/index.html |
|survival| stats| broom|
|survminer| 0.4.0| https://cran.r-project.org/web/packages/survminer/index.html |
|survMisc| 0.5.4| https://cran.r-project.org/web/packages/survMisc/index.html |
|svglite| 1.2.1| https://cran.r-project.org/web/packages/svglite/index.html |
|svmpath|0.955| https://cran.r-project.org/web/packages/svmpath/index.html |
|svUnit| 0.7-12| https://cran.r-project.org/web/packages/svUnit/index.html |
|sysfonts|0.6| https://cran.r-project.org/web/packages/sysfonts/index.html |
|tau| 0.0-19| https://cran.r-project.org/web/packages/tau/index.html |
|tcltk| 3.4.1| NA|
|tcltk2| 1.2-11| https://cran.r-project.org/web/packages/tcltk2/index.html |
|TeachingDemos|2.1| https://cran.r-project.org/web/packages/TeachingDemos/index.html |
|tensor|1.5| https://cran.r-project.org/web/packages/tensor/index.html |
|tensorA|0.36| https://cran.r-project.org/web/packages/tensorA/index.html |
|testthat| 1.0.2| https://cran.r-project.org/web/packages/testthat/index.html |
|textcat| 1.0-5| https://cran.r-project.org/web/packages/textcat/index.html |
|textir| 2.0-4| https://cran.r-project.org/web/packages/textir/index.html |
|tfplot| 2015.12-1| https://cran.r-project.org/web/packages/tfplot/index.html |
|tframe| 2015.12-1| https://cran.r-project.org/web/packages/tframe/index.html |
|tgp| 2.4-14| https://cran.r-project.org/web/packages/tgp/index.html |
|TH.data| 1.0-8| https://cran.r-project.org/web/packages/TH.data/index.html |
|TH.data (>= 1.0-2)| sandwich (>= 2.3-0)| codetools|
|threejs| 0.2.2| https://cran.r-project.org/web/packages/threejs/index.html |
|tibble| CRAN| NA|
|tibble| 1.3.3| https://cran.r-project.org/web/packages/tibble/index.html |
|tibble| rvest| tidyr|
|tibble (>= 1.1)| stringr| broom|
|tibble (>= 1.3.1)| utils| CRAN|
|tidycensus| 0.3.1| https://cran.r-project.org/web/packages/tidycensus/index.html |
|tidyr| rappdirs| readr|
|tidyr| 0.6.3| https://cran.r-project.org/web/packages/tidyr/index.html |
|tidyr (>= 0.6.2)| CRAN| NA|
|tidytext| 0.1.4| https://cran.r-project.org/web/packages/tidytext/index.html |
|tidyverse| 1.1.1| https://cran.r-project.org/web/packages/tidyverse/index.html |
|tiff| 0.1-5| https://cran.r-project.org/web/packages/tiff/index.html |
|tigris| 0.5.3| https://cran.r-project.org/web/packages/tigris/index.html |
|timeDate|3012.1| https://cran.r-project.org/web/packages/timeDate/index.html |
|timeDate (>= 2150.95)| NA| CRAN|
|timeSeries| 3022.101.2| https://cran.r-project.org/web/packages/timeSeries/index.html |
|timevis|0.4| https://cran.r-project.org/web/packages/timevis/index.html |
|tm| 0.7-1| https://cran.r-project.org/web/packages/tm/index.html |
|tokenizers| 0.1.4| https://cran.r-project.org/web/packages/tokenizers/index.html |
|tools| 3.4.1| NA|
|topicmodels| 0.2-6| https://cran.r-project.org/web/packages/topicmodels/index.html |
|TraMineR| 2.0-7| https://cran.r-project.org/web/packages/TraMineR/index.html |
|translations| 3.4.1| NA|
|tree| 1.0-37| https://cran.r-project.org/web/packages/tree/index.html |
|treemap| 2.4-2| https://cran.r-project.org/web/packages/treemap/index.html |
|trimcluster| 0.1-2| https://cran.r-project.org/web/packages/trimcluster/index.html |
|truncnorm| 1.0-7| https://cran.r-project.org/web/packages/truncnorm/index.html |
|TSA|1.01| https://cran.r-project.org/web/packages/TSA/index.html |
|tseries| 0.10-42| https://cran.r-project.org/web/packages/tseries/index.html |
|tsfa| 2014.10-1| https://cran.r-project.org/web/packages/tsfa/index.html |
|tsintermittent|1.9| https://cran.r-project.org/web/packages/tsintermittent/index.html |
|tsoutliers| 0.6-6| https://cran.r-project.org/web/packages/tsoutliers/index.html |
|TSP| 1.1-5| https://cran.r-project.org/web/packages/TSP/index.html |
|TTR| 0.23-2| https://cran.r-project.org/web/packages/TTR/index.html |
|tweenr| 0.1.5| https://cran.r-project.org/web/packages/tweenr/index.html |
|twitteR| 1.1.9| https://cran.r-project.org/web/packages/twitteR/index.html |
|udunits2|0.13| https://cran.r-project.org/web/packages/udunits2/index.html |
|units| 0.4-6| https://cran.r-project.org/web/packages/units/index.html |
|UpSetR| 1.3.3| https://cran.r-project.org/web/packages/UpSetR/index.html |
|urca| 1.3-0| https://cran.r-project.org/web/packages/urca/index.html |
|useful| 1.2.3| https://cran.r-project.org/web/packages/useful/index.html |
|UsingR| 2.0-5| https://cran.r-project.org/web/packages/UsingR/index.html |
|utils| NA| NA|
|utils| 3.4.1| NA|
|utils| stats| graphics|
|uuid| 0.1-2| https://cran.r-project.org/web/packages/uuid/index.html |
|vars| 1.5-2| https://cran.r-project.org/web/packages/vars/index.html |
|vcd| 1.4-3| https://cran.r-project.org/web/packages/vcd/index.html |
|vcd|MASS|nnet|
|vdiffr| 0.2.1| https://cran.r-project.org/web/packages/vdiffr/index.html |
|vegan| 2.4-3| https://cran.r-project.org/web/packages/vegan/index.html |
|VennDiagram| 1.6.17| https://cran.r-project.org/web/packages/VennDiagram/index.html |
|VGAM| 1.0-4| https://cran.r-project.org/web/packages/VGAM/index.html |
|VIF|1| https://cran.r-project.org/web/packages/VIF/index.html |
|VIM| 4.7.0| https://cran.r-project.org/web/packages/VIM/index.html |
|vioplot|0.2|153|
|viridis| 0.4.0| https://cran.r-project.org/web/packages/viridis/index.html |
|viridisLite| 0.2.0| https://cran.r-project.org/web/packages/viridisLite/index.html |
|visNetwork| 2.0.1| https://cran.r-project.org/web/packages/visNetwork/index.html |
|webutils|0.6| https://cran.r-project.org/web/packages/webutils/index.html |
|weights|0.85| https://cran.r-project.org/web/packages/weights/index.html |
|whisker| viridis| CRAN|
|whisker| digest| rstudioapi (>= 0.2.0)|
|whisker| 0.3-2| https://cran.r-project.org/web/packages/whisker/index.html |
|withr| 2.0.0| https://cran.r-project.org/web/packages/withr/index.html |
|wmtsa| 2.0-2| https://cran.r-project.org/web/packages/wmtsa/index.html |
|wordcloud|2.5| https://cran.r-project.org/web/packages/wordcloud/index.html |
|wordcloud2| 0.2.0| https://cran.r-project.org/web/packages/wordcloud2/index.html |
|xgboost| 0.6-4| https://cran.r-project.org/web/packages/xgboost/index.html |
|XML| 3.98-1.9| https://cran.r-project.org/web/packages/XML/index.html |
|xml2| 1.1.1| https://cran.r-project.org/web/packages/xml2/index.html |
|xtable| digest| htmltools (>= 0.3.5)|
|xtable| 1.8-2| https://cran.r-project.org/web/packages/xtable/index.html |
|xts| 0.10-0| https://cran.r-project.org/web/packages/xts/index.html |
|xts (>= 0.10-0)| zoo (>= 1.8-0)| broom (>= 0.4.2)|
|yaml| methods| tools|
|yaml| 2.1.14| https://cran.r-project.org/web/packages/yaml/index.html |
|yarrr| 0.1.5| https://cran.r-project.org/web/packages/yarrr/index.html |
|zic|0.9| https://cran.r-project.org/web/packages/zic/index.html |
|zipfR| 0.6-6| https://cran.r-project.org/web/packages/zipfR/index.html |
|zoo| timeDate| CRAN|
|zoo| 1.8-0| https://cran.r-project.org/web/packages/zoo/index.html |

## R scripts that are not supported in Power BI
The following table shows which packages are **not supported** in the Power BI service.

| Package | Request Date | Reason |
| --- | --- | --- |
| RgoogleMaps |10/05/2016 |Networking is blocked |
| mailR |10/03/2016 |Networking is blocked |
| RevoScaleR |8/30/2016 |ships only with Microsoft R Server |

## Next steps
For more information about R in Power BI, take a look at the following articles:

* [Creating R visuals in the Power BI service](visuals/service-r-visuals.md)
* [Create Power BI visuals using R](desktop-r-visuals.md)
* [Running R scripts in Power BI Desktop](desktop-r-scripts.md)
* [Using R in Query Editor](desktop-r-in-query-editor.md)

