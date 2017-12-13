---
title: Learn which R packages are supported for using and creating R scripts in Power BI
description: R packages that are supported and unsupported in Power BI
services: powerbi
documentationcenter: ''
author: davidiseminger
manager: kfile
backup: ''
editor: ''
tags: ''
qualityfocus: no
qualitydate: ''

ms.service: powerbi
ms.devlang: NA
ms.topic: article
ms.tgt_pltfrm: NA
ms.workload: powerbi
ms.date: 12/06/2017
ms.author: davidi

---
# R packages in the Power BI service
You can use the powerful [R programming language](https://www.r-project.org/) to create visuals in the Power BI service. Many R packages are supported in the Power BI service (and more are being supported all the time), and some packages are not.

The following sections provide an alphabetical table of which R packages are supported in Power BI, and which are not. For more information about R in Power BI, see the [R visuals](service-r-visuals.md) article.

## Request support for a new R package
Supported R packages for the **Power BI service** are found in the following section, titled **Supported Packages**. If you would like to request support of an R package not found in that list, you can send an email with your request to the [R in Power BI Feedback Team](mailto:rinpbifb@microsoft.com).

## Requirements and Limitations of R packages
There are a handful of requirements and limitations for R packages:

* The Power BI service, for the most part, supports R packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* The Power BI service supports packages published in CRAN. The service does not support private or custom R packages. We encourage users to make their private packages available on CRAN prior to requesting the package be available in the Power BI service.
* For **Power BI Desktop** has two variations for R packages:
  
  * For R visuals, you can install any package, including custom R packages
  * For Custom R visuals, only public CRAN packages are supported for auto-installation of the packages
* For security and privacy reasons, we currently don't support R packages that provide client-server queries over the World-Wide Web (such as RgoogleMaps) in the service. Networking is blocked for such attempts. See the following section for a list of supported and unsupported R packages.
* The approval process for including a new R package has a tree of dependencies; some dependencies required to be installed in the service cannot be supported.

## R packages that are supported in Power BI
The following table shows which packages **are supported** in the Power BI service.

| Package | Version | Link |
| --- | --- | --- |
| abc |2.1 |https://cran.r-project.org/web/packages/abc/index.html |
| abc.data |1 |https://cran.r-project.org/web/packages/abc.data/index.html |
| acepack |1.3-3.3 |https://cran.r-project.org/web/packages/acepack/index.html |
| actuar |1.2-0 |https://cran.r-project.org/web/packages/actuar/index.html |
| ade4 |1.7-4 |https://cran.r-project.org/web/packages/ade4/index.html |
| AdMit |2.0.1 |https://cran.r-project.org/web/packages/AdMit/index.html |
| andrews |1 |https://cran.r-project.org/web/packages/andrews/index.html |
| aod |1.3 |https://cran.r-project.org/web/packages/aod/index.html |
| apcluster |1.4.3 |https://cran.r-project.org/web/packages/apcluster/index.html |
| ape |3.4 |https://cran.r-project.org/web/packages/ape/index.html |
| aplpack |1.3.0 |https://cran.r-project.org/web/packages/aplpack/index.html |
| approximator |1.2-6 |https://cran.r-project.org/web/packages/approximator/index.html |
| arm |1.8-6 |https://cran.r-project.org/web/packages/arm/index.html |
| arules |1.4-0 |https://cran.r-project.org/web/packages/arules/index.html |
| arulesViz |1.1-0 |https://cran.r-project.org/web/packages/arulesViz/index.html |
| assertthat |0.1 |https://cran.r-project.org/web/packages/assertthat/index.html |
| BACCO |2.0-9 |https://cran.r-project.org/web/packages/BACCO/index.html |
| BaM |0.99 |https://cran.r-project.org/web/packages/BaM/index.html |
| BAS |1.1.0 |https://cran.r-project.org/web/packages/BAS/index.html |
| base64enc |0.1-3 |https://cran.r-project.org/web/packages/base64enc/index.html |
| bayesm |3.0-2 |https://cran.r-project.org/web/packages/bayesm/index.html |
| bayesQR |2.2 |https://cran.r-project.org/web/packages/bayesQR/index.html |
| bayesSurv |2.6 |https://cran.r-project.org/web/packages/bayesSurv/index.html |
| BayesTree |0.3-1.3 |https://cran.r-project.org/web/packages/BayesTree/index.html |
| BayHaz |0.1-3 |https://cran.r-project.org/web/packages/BayHaz/index.html |
| bbemkr |2 |https://cran.r-project.org/web/packages/bbemkr/index.html |
| BCBCSF |1.0-1 |https://cran.r-project.org/web/packages/BCBCSF/index.html |
| BCE |2.1 |https://cran.r-project.org/web/packages/BCE/index.html |
| bclust |1.5 |https://cran.r-project.org/web/packages/bclust/index.html |
| BenfordTests |1.2.0 |https://cran.r-project.org/web/packages/BenfordTests/index.html |
| bisoreg |1.4 |https://cran.r-project.org/web/packages/bisoreg/index.html |
| bit |1.1-12 |https://cran.r-project.org/web/packages/bit/index.html |
| bit64 |0.9-5 |https://cran.r-project.org/web/packages/bit64/index.html |
| bitops |1.0-6 |https://cran.r-project.org/web/packages/bitops/index.html |
| BMA |3.18.6 |https://cran.r-project.org/web/packages/BMA/index.html |
| Bmix |0.6 |https://cran.r-project.org/web/packages/Bmix/index.html |
| bnlearn |3.9 |https://cran.r-project.org/web/packages/bnlearn/index.html |
| boa |1.1.8-1 |https://cran.r-project.org/web/packages/boa/index.html |
| boot |1.3-18 |https://cran.r-project.org/web/packages/boot/index.html |
| bootstrap |2015.2 |https://cran.r-project.org/web/packages/bootstrap/index.html |
| bqtl |1.0-32 |https://cran.r-project.org/web/packages/bqtl/index.html |
| BradleyTerry2 |1.0-6 |https://cran.r-project.org/web/packages/BradleyTerry2/index.html |
| brew |1.0-6 |https://cran.r-project.org/web/packages/brew/index.html |
| brglm |0.5-9 |https://cran.r-project.org/web/packages/brglm/index.html |
| bspec |1.5 |https://cran.r-project.org/web/packages/bspec/index.html |
| bspmma |0.1-1 |https://cran.r-project.org/web/packages/bspmma/index.html |
| BVS |4.12.1 |https://cran.r-project.org/web/packages/BVS/index.html |
| C50 |0.1.0-24 |https://cran.r-project.org/web/packages/C50/index.html |
| calibrator |1.2-6 |https://cran.r-project.org/web/packages/calibrator/index.html |
| car |2.1-2 |https://cran.r-project.org/web/packages/car/index.html |
| caret |6.0-64 |https://cran.r-project.org/web/packages/caret/index.html |
| catnet |1.14.8 |https://cran.r-project.org/web/packages/catnet/index.html |
| caTools |1.17.1 |https://cran.r-project.org/web/packages/caTools/index.html |
| cclust |0.6-20 |https://cran.r-project.org/web/packages/cclust/index.html |
| class |7.3-14 |https://cran.r-project.org/web/packages/class/index.html |
| clue |0.3-51 |https://cran.r-project.org/web/packages/clue/index.html |
| cluster |2.0.3 |https://cran.r-project.org/web/packages/cluster/index.html |
| coda |0.18-1 |https://cran.r-project.org/web/packages/coda/index.html |
| coin |1.1-2 |https://cran.r-project.org/web/packages/coin/index.html |
| CORElearn |1.47.1 |https://cran.r-project.org/web/packages/CORElearn/index.html |
| corpcor |1.6.8 |https://cran.r-project.org/web/packages/corpcor/index.html |
| corrplot |0.73 |https://cran.r-project.org/web/packages/corrplot/index.html |
| crayon |1.3.1 |https://cran.r-project.org/web/packages/crayon/index.html |
| cslogistic |0.1-3 |https://cran.r-project.org/web/packages/cslogistic/index.html |
| cubature |1.1-2 |https://cran.r-project.org/web/packages/cubature/index.html |
| cvTools |0.3.2 |https://cran.r-project.org/web/packages/cvTools/index.html |
| data.table |1.9.6 |https://cran.r-project.org/web/packages/data.table/index.html |
| Data.tree |0.7.0 |https://cran.r-project.org/web/packages/data.tree/index.html |
| date |1.2-34 |https://cran.r-project.org/web/packages/date/index.html |
| dbscan |0.9-7 |https://cran.r-project.org/web/packages/dbscan/index.html |
| deal |1.2-37 |https://cran.r-project.org/web/packages/deal/index.html |
| deepnet |0.2 |https://cran.r-project.org/web/packages/deepnet/index.html |
| deldir |0.1-12 |https://cran.r-project.org/web/packages/deldir/index.html |
| dendextend |1.1.8 |https://cran.r-project.org/web/packages/dendextend/index.html |
| DEoptimR |1.0-4 |https://cran.r-project.org/web/packages/DEoptimR/index.html |
| deSolve |1.13 |https://cran.r-project.org/web/packages/deSolve/index.html |
| DiagrammeR |0.8.2 |https://cran.r-project.org/web/packages/DiagrammeR/index.html |
| dichromat |2.0-0 |https://cran.r-project.org/web/packages/dichromat/index.html |
| digest |0.6.9 |https://cran.r-project.org/web/packages/digest/index.html |
| dlm |1.1-4 |https://cran.r-project.org/web/packages/dlm/index.html |
| DMwR |0.4.1 |https://cran.r-project.org/web/packages/DMwR/index.html |
| dplyr |0.4.3 |https://cran.r-project.org/web/packages/dplyr/index.html |
| DPpackage |1.1-6 |https://cran.r-project.org/web/packages/DPpackage/index.html |
| dse |2015.12-1 |https://cran.r-project.org/web/packages/dse/index.html |
| DT |0.2 |https://cran.r-project.org/web/packages/DT/index.html |
| dtw |1.18-1 |https://cran.r-project.org/web/packages/dtw/index.html |
| e1071 |1.6-7 |https://cran.r-project.org/web/packages/e1071/index.html |
| earth |4.4.4 |https://cran.r-project.org/web/packages/earth/index.html |
| EbayesThresh |1.3.2 |https://cran.r-project.org/web/packages/EbayesThresh/index.html |
| ebdbNet |1.2.3 |https://cran.r-project.org/web/packages/ebdbNet/index.html |
| ellipse |0.3-8 |https://cran.r-project.org/web/packages/ellipse/index.html |
| emulator |1.2-15 |https://cran.r-project.org/web/packages/emulator/index.html |
| ensembleBMA |5.1.2 |https://cran.r-project.org/web/packages/ensembleBMA/index.html |
| entropy |1.2.1 |https://cran.r-project.org/web/packages/entropy/index.html |
| EvalEst |2015.4-2 |https://cran.r-project.org/web/packages/EvalEst/index.html |
| evaluate |0.8.3 |https://cran.r-project.org/web/packages/evaluate/index.html |
| evdbayes |1.1-1 |https://cran.r-project.org/web/packages/evdbayes/index.html |
| exactLoglinTest |1.4.2 |https://cran.r-project.org/web/packages/exactLoglinTest/index.html |
| expm |0.999-0 |https://cran.r-project.org/web/packages/expm/index.html |
| extremevalues |2.3.2 |https://cran.r-project.org/web/packages/extremevalues/index.html |
| FactoMineR |1.32 |https://cran.r-project.org/web/packages/FactoMineR/index.html |
| factorQR |0.1-4 |https://cran.r-project.org/web/packages/factorQR/index.html |
| faoutlier |0.6.1 |https://cran.r-project.org/web/packages/faoutlier/index.html |
| fBasics |3011.87 |https://cran.r-project.org/web/packages/fBasics/index.html |
| fields |8.3-6 |https://cran.r-project.org/web/packages/fields/index.html |
| filehash |2.3 |https://cran.r-project.org/web/packages/filehash/index.html |
| fitdistrplus |1.0-6 |https://cran.r-project.org/web/packages/fitdistrplus/index.html |
| flashClust |1.01-2 |https://cran.r-project.org/web/packages/flashClust/index.html |
| FME |1.3.2 |https://cran.r-project.org/web/packages/FME/index.html |
| fmsb |0.5.2 |https://cran.r-project.org/web/packages/fmsb/index.html |
| foreach |1.4.3 |https://cran.r-project.org/web/packages/foreach/index.html |
| forecast |7 |https://cran.r-project.org/web/packages/forecast/index.html |
| forecastHybrid |0.3.0 |https://cran.r-project.org/web/packages/forecastHybrid/index.html |
| Formula |1.2-1 |https://cran.r-project.org/web/packages/Formula/index.html |
| fracdiff |1.4-2 |https://cran.r-project.org/web/packages/fracdiff/index.html |
| fTrading |3010.78 |https://cran.r-project.org/web/packages/fTrading/index.html |
| futile.logger |1.4.3 |https://cran.r-project.org/web/packages/futile.logger/index.html |
| gam |1.12 |https://cran.r-project.org/web/packages/gam/index.html |
| gamlr |1.13-3 |https://cran.r-project.org/web/packages/gamlr/index.html |
| gclus |1.3.1 |https://cran.r-project.org/web/packages/gclus/index.html |
| gdata |2.17.0 |https://cran.r-project.org/web/packages/gdata/index.html |
| gee |4.13-19 |https://cran.r-project.org/web/packages/gee/index.html |
| genetics |1.3.8.1 |https://cran.r-project.org/web/packages/genetics/index.html |
| geoRglm |0.9-8 |https://cran.r-project.org/web/packages/geoRglm/index.html |
| geosphere |1.5-1 |https://cran.r-project.org/web/packages/geosphere/index.html |
| ggdendro |0.1-18 |https://cran.r-project.org/web/packages/ggdendro/index.html |
| ggmap |2.6.1 |https://cran.r-project.org/web/packages/ggmap/index.html |
| ggmcmc |0.8 |https://cran.r-project.org/web/packages/ggmcmc/index.html |
| ggplot2 |2.1.0 |https://cran.r-project.org/web/packages/ggplot2/index.html |
| ggrepel |0.5 |https://cran.r-project.org/web/packages/ggrepel/index.html |
| ggthemes |3.0.2 |https://cran.r-project.org/web/packages/ggthemes/index.html |
| glmmBUGS |2.3 |https://cran.r-project.org/web/packages/glmmBUGS/index.html |
| glmnet |2.0-5 |https://cran.r-project.org/web/packages/glmnet/index.html |
| gmodels |2.16.2 |https://cran.r-project.org/web/packages/gmodels/index.html |
| gmp |0.5-12 |https://cran.r-project.org/web/packages/gmp/index.html |
| gnm |1.0-8 |https://cran.r-project.org/web/packages/gnm/index.html |
| GPArotation |2014.11-1 |https://cran.r-project.org/web/packages/GPArotation/index.html |
| gridBase |0.4-7 |https://cran.r-project.org/web/packages/gridBase/index.html |
| gridExtra |2.2.1 |https://cran.r-project.org/web/packages/gridExtra/index.html |
| growcurves |0.2.4.0 |https://cran.r-project.org/web/packages/growcurves/index.html |
| grpreg |2.8-1 |https://cran.r-project.org/web/packages/grpreg/index.html |
| gss |2.1-5 |https://cran.r-project.org/web/packages/gss/index.html |
| gsubfn |0.6-6 |https://cran.r-project.org/web/packages/gsubfn/index.html |
| gtable |0.2.0 |https://cran.r-project.org/web/packages/gtable/index.html |
| ggtern |2.2.0 |https://cran.r-project.org/web/packages/ggtern/index.html |
| gtools |3.5.0 |https://cran.r-project.org/web/packages/gtools/index.html |
| haplo.stats |1.7.6 |https://cran.r-project.org/web/packages/haplo.stats/index.html |
| hash |2.2.6 |https://cran.r-project.org/web/packages/hash/index.html |
| hbsae |1 |https://cran.r-project.org/web/packages/hbsae/index.html |
| hdrcde |3.1 |https://cran.r-project.org/web/packages/hdrcde/index.html |
| heavy |0.3 |https://cran.r-project.org/web/packages/heavy/index.html |
| HH |3.1-25 |https://cran.r-project.org/web/packages/HH/index.html |
| HI |0.4 |https://cran.r-project.org/web/packages/HI/index.html |
| Highcharter |0.5.0 |https://cran.r-project.org/web/packages/highcharter/index.html |
| Hmisc |3.17-3 |https://cran.r-project.org/web/packages/Hmisc/index.html |
| HSAUR |1.3-7 |https://cran.r-project.org/web/packages/HSAUR/index.html |
| ifultools |2.0-1 |https://cran.r-project.org/web/packages/ifultools/index.html |
| intervals |0.15.1 |https://cran.r-project.org/web/packages/intervals/index.html |
| ipred |0.9-5 |https://cran.r-project.org/web/packages/ipred/index.html |
| irlba |2.0.0 |https://cran.r-project.org/web/packages/irlba/index.html |
| irr |0.84 |https://cran.r-project.org/web/packages/irr/index.html |
| iterators |1.0.8 |https://cran.r-project.org/web/packages/iterators/index.html |
| jpeg |0.1-8 |https://cran.r-project.org/web/packages/jpeg/index.html |
| kernlab |0.9-24 |https://cran.r-project.org/web/packages/kernlab/index.html |
| KernSmooth |2.23-15 |https://cran.r-project.org/web/packages/KernSmooth/index.html |
| KFKSDS |1.6 |https://cran.r-project.org/web/packages/KFKSDS/index.html |
| kinship2 |1.6.4 |https://cran.r-project.org/web/packages/kinship2/index.html |
| kknn |1.3.1 |https://cran.r-project.org/web/packages/kknn/index.html |
| klaR |0.6-12 |https://cran.r-project.org/web/packages/klaR/index.html |
| knitr |1.12.3 |https://cran.r-project.org/web/packages/knitr/index.html |
| labeling |0.3 |https://cran.r-project.org/web/packages/labeling/index.html |
| lars |1.2 |https://cran.r-project.org/web/packages/lars/index.html |
| lattice |0.20-33 |https://cran.r-project.org/web/packages/lattice/index.html |
| latticeExtra |0.6-28 |https://cran.r-project.org/web/packages/latticeExtra/index.html |
| lava |1.4.1 |https://cran.r-project.org/web/packages/lava/index.html |
| lavaan |0.5-20 |https://cran.r-project.org/web/packages/lavaan/index.html |
| lazyeval |0.1.10 |https://cran.r-project.org/web/packages/lazyeval/index.html |
| leaps |2.9 |https://cran.r-project.org/web/packages/leaps/index.html |
| LearnBayes |2.15 |https://cran.r-project.org/web/packages/LearnBayes/index.html |
| LiblineaR |1.94-2 |https://cran.r-project.org/web/packages/LiblineaR/index.html |
| LICORS |0.2.0 |https://cran.r-project.org/web/packages/LICORS/index.html |
| limSolve |1.5.5.1 |https://cran.r-project.org/web/packages/limSolve/index.html |
| lme4 |1.1-11 |https://cran.r-project.org/web/packages/lme4/index.html |
| lmm |1 |https://cran.r-project.org/web/packages/lmm/index.html |
| lmtest |0.9-34 |https://cran.r-project.org/web/packages/lmtest/index.html |
| locfit |1.5-9.1 |https://cran.r-project.org/web/packages/locfit/index.html |
| locpol |0.6-0 |https://cran.r-project.org/web/packages/locpol/index.html |
| LogicReg |1.5.8 |https://cran.r-project.org/web/packages/LogicReg/index.html |
| lsa |0.73.1 |https://cran.r-project.org/web/packages/lsa/index.html |
| lubridate |1.5.0 |https://cran.r-project.org/web/packages/lubridate/index.html |
| magic |1.5-6 |https://cran.r-project.org/web/packages/magic/index.html |
| magrittr |1.5 |https://cran.r-project.org/web/packages/magrittr/index.html |
| mapdata |2.2-6 |https://cran.r-project.org/web/packages/mapdata/index.html |
| mapproj |1.2-4 |https://cran.r-project.org/web/packages/mapproj/index.html |
| maps |3.1.0 |https://cran.r-project.org/web/packages/maps/index.html |
| maptree |1.4-7 |https://cran.r-project.org/web/packages/maptree/index.html |
| MASS |7.3-45 |https://cran.r-project.org/web/packages/MASS/index.html |
| MasterBayes |2.52 |https://cran.r-project.org/web/packages/MasterBayes/index.html |
| Matrix |1.2-4 |https://cran.r-project.org/web/packages/Matrix/index.html |
| matrixcalc |1.0-3 |https://cran.r-project.org/web/packages/matrixcalc/index.html |
| MatrixModels |0.4-1 |https://cran.r-project.org/web/packages/MatrixModels/index.html |
| maxent |1.3.3.1 |https://cran.r-project.org/web/packages/maxent/index.html |
| maxLik |1.3-4 |https://cran.r-project.org/web/packages/maxLik/index.html |
| mboost |2.6-0 |https://cran.r-project.org/web/packages/mboost/index.html |
| mda |0.4-8 |https://cran.r-project.org/web/packages/mda/index.html |
| memoise |1.0.0 |https://cran.r-project.org/web/packages/memoise/index.html |
| mi |1 |https://cran.r-project.org/web/packages/mi/index.html |
| mice |2.25 |https://cran.r-project.org/web/packages/mice/index.html |
| microbenchmark |1.4-2.1 |https://cran.r-project.org/web/packages/microbenchmark/index.html |
| mime |0.4 |https://cran.r-project.org/web/packages/mime/index.html |
| misc3d |0.8-4 |https://cran.r-project.org/web/packages/misc3d/index.html |
| miscTools |0.6-16 |https://cran.r-project.org/web/packages/miscTools/index.html |
| mitools |2.3 |https://cran.r-project.org/web/packages/mitools/index.html |
| mixtools |1.0.4 |https://cran.r-project.org/web/packages/mixtools/index.html |
| mlbench |2.1-1 |https://cran.r-project.org/web/packages/mlbench/index.html |
| mnormt |1.5-4 |https://cran.r-project.org/web/packages/mnormt/index.html |
| MNP |2.6-4 |https://cran.r-project.org/web/packages/MNP/index.html |
| modeltools |0.2-21 |https://cran.r-project.org/web/packages/modeltools/index.html |
| mombf |1.6.1 |https://cran.r-project.org/web/packages/mombf/index.html |
| monomvn |1.9-6 |https://cran.r-project.org/web/packages/monomvn/index.html |
| MSBVAR |0.9-2 |https://cran.r-project.org/web/packages/MSBVAR/index.html |
| msm |1.6.1 |https://cran.r-project.org/web/packages/msm/index.html |
| multcomp |1.4-4 |https://cran.r-project.org/web/packages/multcomp/index.html |
| munsell |0.4.3 |https://cran.r-project.org/web/packages/munsell/index.html |
| mvtnorm |1.0-5 |https://cran.r-project.org/web/packages/mvtnorm/index.html |
| NbClust |3 |https://cran.r-project.org/web/packages/NbClust/index.html |
| ncvreg |3.5-1 |https://cran.r-project.org/web/packages/ncvreg/index.html |
| networkD3 |0.2.13 |https://cran.r-project.org/web/packages/networkD3/index.html |
| neuralnet |1.33 |https://cran.r-project.org/web/packages/neuralnet/index.html |
| nlme |3.1-126 |https://cran.r-project.org/web/packages/nlme/index.html |
| nloptr |1.0.4 |https://cran.r-project.org/web/packages/nloptr/index.html |
| NLP |0.1-9 |https://cran.r-project.org/web/packages/NLP/index.html |
| NMF |0.20.6 |https://cran.r-project.org/web/packages/NMF/index.html |
| nnet |7.3-12 |https://cran.r-project.org/web/packages/nnet/index.html |
| nnls |1.4 |https://cran.r-project.org/web/packages/nnls/index.html |
| nortest |1.0-4 |https://cran.r-project.org/web/packages/nortest/index.html |
| numbers |0.6-1 |https://cran.r-project.org/web/packages/numbers/index.html |
| numDeriv |2014.2-1 |https://cran.r-project.org/web/packages/numDeriv/index.html |
| OutlierDC |0.3-0 |https://cran.r-project.org/web/packages/OutlierDC/index.html |
| pacbpred |0.92.2 |https://cran.r-project.org/web/packages/pacbpred/index.html |
| party |1.0-25 |https://cran.r-project.org/web/packages/party/index.html |
| partykit |1.0-5 |https://cran.r-project.org/web/packages/partykit/index.html |
| PAWL |0.5 |https://cran.r-project.org/web/packages/PAWL/index.html |
| pbivnorm |0.6.0 |https://cran.r-project.org/web/packages/pbivnorm/index.html |
| pcaPP |1.9-60 |https://cran.r-project.org/web/packages/pcaPP/index.html |
| pdc |1.0.3 |https://cran.r-project.org/web/packages/pdc/index.html |
| PerformanceAnalytics |1.4.3541 |https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html |
| Plotly |4.5.6 |https://cran.r-project.org/web/packages/plotly/index.html |
| plotmo |3.1.4 |https://cran.r-project.org/web/packages/plotmo/index.html |
| plotrix |3.6-1 |https://cran.r-project.org/web/packages/plotrix/index.html |
| pls |2.5-0 |https://cran.r-project.org/web/packages/pls/index.html |
| plyr |1.8.3 |https://cran.r-project.org/web/packages/plyr/index.html |
| png |0.1-7 |https://cran.r-project.org/web/packages/png/index.html |
| polynom |1.3-8 |https://cran.r-project.org/web/packages/polynom/index.html |
| predmixcor |1.1-1 |https://cran.r-project.org/web/packages/predmixcor/index.html |
| PresenceAbsence |1.1.9 |https://cran.r-project.org/web/packages/PresenceAbsence/index.html |
| profdpm |3.3 |https://cran.r-project.org/web/packages/profdpm/index.html |
| proto |0.3-10 |https://cran.r-project.org/web/packages/proto/index.html |
| proxy |0.4-15 |https://cran.r-project.org/web/packages/proxy/index.html |
| pryr |0.1.2 |https://cran.r-project.org/web/packages/pryr/index.html |
| pscl |1.4.9 |https://cran.r-project.org/web/packages/pscl/index.html |
| psych |1.5.8 |https://cran.r-project.org/web/packages/psych/index.html |
| qap |0.1-0 |https://cran.r-project.org/web/packages/qap/index.html |
| qdapRegex |0.6.0 |https://cran.r-project.org/web/packages/qdapRegex/index.html |
| qcc |2.6 |https://cran.r-project.org/web/packages/qcc/index.html |
| quadprog |1.5-5 |https://cran.r-project.org/web/packages/quadprog/index.html |
| quantreg |5.21 |https://cran.r-project.org/web/packages/quantreg/index.html |
| qvcalc |0.9-0 |https://cran.r-project.org/web/packages/qvcalc/index.html |
| R.oo |1.20.0 |https://cran.r-project.org/web/packages/R.oo/index.html |
| ramps |0.6-13 |https://cran.r-project.org/web/packages/ramps/index.html |
| RandomFieldsUtils |0.0.14 |https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html |
| Rblpapi |0.3.5 |https://cran.r-project.org/web/packages/Rblpapi/index.html |
| RColorBrewer |1.1-2 |https://cran.r-project.org/web/packages/RColorBrewer/index.html |
| Rcpp |0.12.3 |https://cran.r-project.org/web/packages/Rcpp/index.html |
| RcppArmadillo |0.6.600.4.0 |https://cran.r-project.org/web/packages/RcppArmadillo/index.html |
| RcppEigen |0.3.2.8.1 |https://cran.r-project.org/web/packages/RcppEigen/index.html |
| redmonder |0.2.0 |https://cran.r-project.org/web/packages/Redmonder/index.html |
| registry |0.3 |https://cran.r-project.org/web/packages/registry/index.html |
| relimp |1.0-5 |https://cran.r-project.org/web/packages/relimp/index.html |
| reshape |0.8.5 |https://cran.r-project.org/web/packages/reshape/index.html |
| reshape2 |1.4.1 |https://cran.r-project.org/web/packages/reshape2/index.html |
| RGraphics |2.0-14 |https://cran.r-project.org/web/packages/RGraphics/index.html |
| rjson |0.2.15 |https://cran.r-project.org/web/packages/rjson/index.html |
| RJSONIO |1.3-0 |https://cran.r-project.org/web/packages/RJSONIO/index.html |
| Rmpfr |0.6-0 |https://cran.r-project.org/web/packages/Rmpfr/index.html |
| rms |4.4-2 |https://cran.r-project.org/web/packages/rms/index.html |
| robustbase |0.92-5 |https://cran.r-project.org/web/packages/robustbase/index.html |
| ROCR |1.0-7 |https://cran.r-project.org/web/packages/ROCR/index.html |
| rpart.plot |1.5.3 |https://cran.r-project.org/web/packages/rpart.plot/index.html |
| rrcov |1.3-11 |https://cran.r-project.org/web/packages/rrcov/index.html |
| rscproxy |2.0-5 |https://cran.r-project.org/web/packages/rscproxy/index.html |
| RSGHB |1.1.2 |https://cran.r-project.org/web/packages/RSGHB/index.html |
| RTextTools |1.4.2 |https://cran.r-project.org/web/packages/RTextTools/index.html |
| rworldmap |1.3-6 |https://cran.r-project.org/web/packages/rworldmap/index.html |
| SampleSizeMeans |1.1 |https://cran.r-project.org/web/packages/SampleSizeMeans/index.html |
| SampleSizeProportions |1 |https://cran.r-project.org/web/packages/SampleSizeProportions/index.html |
| sbgcop |0.975 |https://cran.r-project.org/web/packages/sbgcop/index.html |
| scales |0.4.0 |https://cran.r-project.org/web/packages/scales/index.html |
| scatterplot3d |0.3-36 |https://cran.r-project.org/web/packages/scatterplot3d/index.html |
| sciplot |1.1-0 |https://cran.r-project.org/web/packages/sciplot/index.html |
| segmented |0.5-1.4 |https://cran.r-project.org/web/packages/segmented/index.html |
| seriation |1.2-0 |https://cran.r-project.org/web/packages/seriation/index.html |
| setRNG |2013.9-1 |https://cran.r-project.org/web/packages/setRNG/index.html |
| sfsmisc |1.1-0 |https://cran.r-project.org/web/packages/sfsmisc/index.html |
| SIS |0.7-6 |https://cran.r-project.org/web/packages/SIS/index.html |
| SixSigma |0.9-3 |https://cran.r-project.org/web/packages/SixSigma/index.html |
| skmeans |0.2-8 |https://cran.r-project.org/web/packages/skmeans/index.html |
| slam |0.1-32 |https://cran.r-project.org/web/packages/slam/index.html |
| smoothSurv |1.6 |https://cran.r-project.org/web/packages/smoothSurv/index.html |
| sna |2.3-2 |https://cran.r-project.org/web/packages/sna/index.html |
| snow |0.4-1 |https://cran.r-project.org/web/packages/snow/index.html |
| SnowballC |0.5.1 |https://cran.r-project.org/web/packages/SnowballC/index.html |
| snowFT |1.4-0 |https://cran.r-project.org/web/packages/snowFT/index.html |
| sp |1.2-2 |https://cran.r-project.org/web/packages/sp/index.html |
| spacetime |1.1-5 |https://cran.r-project.org/web/packages/spacetime/index.html |
| spam |1.3-0 |https://cran.r-project.org/web/packages/spam/index.html |
| SparseM |1.7 |https://cran.r-project.org/web/packages/SparseM/index.html |
| spatial |7.3-11 |https://cran.r-project.org/web/packages/spatial/index.html |
| spBayes |0.3-9 |https://cran.r-project.org/web/packages/spBayes/index.html |
| spikeslab |1.1.5 |https://cran.r-project.org/web/packages/spikeslab/index.html |
| splancs |2.01-38 |https://cran.r-project.org/web/packages/splancs/index.html |
| spls |2.2-1 |https://cran.r-project.org/web/packages/spls/index.html |
| spTimer |2.0-1 |https://cran.r-project.org/web/packages/spTimer/index.html |
| sqldf |0.4-10 |https://cran.r-project.org/web/packages/sqldf/index.html |
| sROC |0.1-2 |https://cran.r-project.org/web/packages/sROC/index.html |
| stabledist |0.7-0 |https://cran.r-project.org/web/packages/stabledist/index.html |
| stabs |0.5-1 |https://cran.r-project.org/web/packages/stabs/index.html |
| stepPlr |0.92 |https://cran.r-project.org/web/packages/stepPlr/index.html |
| stringdist |0.9.4.1 |https://cran.r-project.org/web/packages/stringdist/index.html |
| stringr |1.0.0 |https://cran.r-project.org/web/packages/stringr/index.html |
| stsm |1.7 |https://cran.r-project.org/web/packages/stsm/index.html |
| stsm.class |1.3 |https://cran.r-project.org/web/packages/stsm.class/index.html |
| survival |2.38-3 |https://cran.r-project.org/web/packages/survival/index.html |
| tau |0.0-18 |https://cran.r-project.org/web/packages/tau/index.html |
| tcltk2 |1.2-11 |https://cran.r-project.org/web/packages/tcltk2/index.html |
| tensorA |0.36 |https://cran.r-project.org/web/packages/tensorA/index.html |
| textcat |1.0-4 |https://cran.r-project.org/web/packages/textcat/index.html |
| textir |2.0-4 |https://cran.r-project.org/web/packages/textir/index.html |
| tfplot |2015.12-1 |https://cran.r-project.org/web/packages/tfplot/index.html |
| TH.data |1.0-7 |https://cran.r-project.org/web/packages/TH.data/index.html |
| tidyr |0.4.1 |https://cran.r-project.org/web/packages/tidyr/index.html |
| timeDate |3012.1 |https://cran.r-project.org/web/packages/timeDate/index.html |
| timeSeries |3022.101.2 |https://cran.r-project.org/web/packages/timeSeries/index.html |
| timevis |0.4 |https://cran.r-project.org/web/packages/timevis/index.html |
| tm |0.6-2 |https://cran.r-project.org/web/packages/tm/index.html |
| topicmodels |0.2-3 |https://cran.r-project.org/web/packages/topicmodels/index.html |
| tree |1.0-37 |https://cran.r-project.org/web/packages/tree/index.html |
| Treemap |2.4-2 |https://cran.r-project.org/web/packages/treemap/index.html |
| tseries |0.10-34 |https://cran.r-project.org/web/packages/tseries/index.html |
| tsfa |2014.10-1 |https://cran.r-project.org/web/packages/tsfa/index.html |
| tsoutliers |0.6 |https://cran.r-project.org/web/packages/tsoutliers/index.html |
| TSP |1.1-4 |https://cran.r-project.org/web/packages/TSP/index.html |
| vcd |1.4-1 |https://cran.r-project.org/web/packages/vcd/index.html |
| VennDiagram |1.6.17 |https://cran.r-project.org/web/packages/VennDiagram/index.html |
| VGAM |1.0-1 |https://cran.r-project.org/web/packages/VGAM/index.html |
| VIM |4.4.1 |https://cran.r-project.org/web/packages/VIM/index.html |
| whisker |0.3-2 |https://cran.r-project.org/web/packages/whisker/index.html |
| wordcloud |2.5 |https://cran.r-project.org/web/packages/wordcloud/index.html |
| xgboost |0.4-3 |https://cran.r-project.org/web/packages/xgboost/index.html |
| XML |3.98-1.4 |https://cran.r-project.org/web/packages/XML/index.html |
| xts |0.9-7 |https://cran.r-project.org/web/packages/xts/index.html |
| yaml |2.1.13 |https://cran.r-project.org/web/packages/yaml/index.html |
| zipfR |0.6-6 |https://cran.r-project.org/web/packages/zipfR/index.html |
| zoo |1.7-12 |https://cran.r-project.org/web/packages/zoo/index.html |

## R scripts that are not supported in Power BI
The following table shows which packages are **not supported** in the Power BI service.

| Package | Request Date | Reason |
| --- | --- | --- |
| RgoogleMaps |10/05/2016 |Networking is blocked |
| mailR |10/03/2016 |Networking is blocked |
| RevoScaleR |8/30/2016 |ships only with Microsoft R Server |

## Next steps
For more information about R in Power BI, take a look at the following articles:

* [Creating R visuals in the Power BI service](service-r-visuals.md)
* [Create Power BI visuals using R](desktop-r-visuals.md)
* [Running R scripts in Power BI Desktop](desktop-r-scripts.md)
* [Using R in Query Editor](desktop-r-in-query-editor.md)

