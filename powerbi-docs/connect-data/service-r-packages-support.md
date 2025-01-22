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
  * For Custom R visuals, only public CRAN packages are supported for auto-installation of the packages
* For security and privacy reasons, R packages that provide client-server queries over the web, such as *RgoogleMaps*, in the service, aren't supported. Networking is blocked for such attempts. See the following section for a list of supported and unsupported R packages.
* The approval process for including a new R package has a tree of dependencies. Some dependencies required to be installed in the service can't be supported.

### For reports in Premium/Fabric backed workspaces
* Current R runtime: R 4.3.3

### For non-Premium/Fabric backed workspaces/ Sov. Clouds/China 
* Current R runtime: Microsoft R 3.4.4


## R packages that are supported in Power BI (Premium/Fabric backed workspaces)

|        Package        |   Version   |                                   Link                                   |
|-----------------------|-------------|--------------------------------------------------------------------------|
|abc|2.2.1|[https://cran.r-project.org/web/packages/abc/index.html] (https://cran.r-project.org/web/packages/abc/index.html)
|abc.data|1.1|[https://cran.r-project.org/src/contrib/abc.data_1.1.tar.gz] (https://cran.r-project.org/src/contrib/abc.data_1.1.tar.gz)
|abind|1.4-5|[https://cran.r-project.org/web/packages/abind/index.html] (https://cran.r-project.org/web/packages/abind/index.html)
|acepack|1.4.2|[https://cran.r-project.org/src/contrib/acepack_1.4.2.tar.gz] (https://cran.r-project.org/src/contrib/acepack_1.4.2.tar.gz)
|actuar|3.3-4|[https://cran.r-project.org/web/packages/actuar/index.html] (https://cran.r-project.org/web/packages/actuar/index.html)
|ade4|1.7-22|[https://cran.r-project.org/src/contrib/ade4_1.7-22.tar.gz] (https://cran.r-project.org/src/contrib/ade4_1.7-22.tar.gz)
|adegenet|2.1.10|[https://cran.r-project.org/src/contrib/adegenet_2.1.10.tar.gz] (https://cran.r-project.org/src/contrib/adegenet_2.1.10.tar.gz)
|AdMit|2.1.9|[https://cran.r-project.org/src/contrib/AdMit_2.1.9.tar.gz] (https://cran.r-project.org/src/contrib/AdMit_2.1.9.tar.gz)
|AER|1.2-13|[https://cran.r-project.org/web/packages/AER/index.html] (https://cran.r-project.org/web/packages/AER/index.html)
|agricolae|1.3-7|[https://cran.r-project.org/src/contrib/agricolae_1.3-7.tar.gz] (https://cran.r-project.org/src/contrib/agricolae_1.3-7.tar.gz)
|AlgDesign|1.2.1|[https://cran.r-project.org/web/packages/AlgDesign/index.html] (https://cran.r-project.org/web/packages/AlgDesign/index.html)
|alluvial|0.1-2|[https://cran.r-project.org/src/contrib/alluvial_0.1-2.tar.gz] (https://cran.r-project.org/src/contrib/alluvial_0.1-2.tar.gz)
|andrews|1.1.2|[https://cran.r-project.org/src/contrib/andrews_1.1.2.tar.gz] (https://cran.r-project.org/src/contrib/andrews_1.1.2.tar.gz)
|anomalize|0.3.0|[https://cran.r-project.org/src/contrib/anomalize_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/anomalize_0.3.0.tar.gz)
|anytime|0.3.9|[https://cran.r-project.org/web/packages/anytime/index.html] (https://cran.r-project.org/web/packages/anytime/index.html)
|aod|1.3.3|[https://cran.r-project.org/src/contrib/aod_1.3.3.tar.gz] (https://cran.r-project.org/src/contrib/aod_1.3.3.tar.gz)
|apcluster|1.4.13|[https://cran.r-project.org/src/contrib/apcluster_1.4.13.tar.gz] (https://cran.r-project.org/src/contrib/apcluster_1.4.13.tar.gz)
|ape|5.8|[https://cran.r-project.org/web/packages/ape/index.html] (https://cran.r-project.org/web/packages/ape/index.html)
|aplpack|1.3.5|[https://cran.r-project.org/src/contrib/aplpack_1.3.5.tar.gz] (https://cran.r-project.org/src/contrib/aplpack_1.3.5.tar.gz)
|approximator|1.2-8|[https://cran.r-project.org/src/contrib/approximator_1.2-8.tar.gz] (https://cran.r-project.org/src/contrib/approximator_1.2-8.tar.gz)
|arm|1.14-4|[https://cran.r-project.org/src/contrib/arm_1.14-4.tar.gz] (https://cran.r-project.org/src/contrib/arm_1.14-4.tar.gz)
|arsenal|3.6.3|[https://cran.r-project.org/src/contrib/arsenal_3.6.3.tar.gz] (https://cran.r-project.org/src/contrib/arsenal_3.6.3.tar.gz)
|arules|1.7-8|[https://cran.r-project.org/web/packages/arules/index.html] (https://cran.r-project.org/web/packages/arules/index.html)
|arulesViz|1.5.3|[https://cran.r-project.org/src/contrib/arulesViz_1.5.3.tar.gz] (https://cran.r-project.org/src/contrib/arulesViz_1.5.3.tar.gz)
|ash|1.0-15|[https://cran.r-project.org/src/contrib/ash_1.0-15.tar.gz] (https://cran.r-project.org/src/contrib/ash_1.0-15.tar.gz)
|askpass|1.2.0|[https://cran.r-project.org/web/packages/askpass/index.html] (https://cran.r-project.org/web/packages/askpass/index.html)
|assertthat|0.2.1|[https://cran.r-project.org/src/contrib/assertthat_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/assertthat_0.2.1.tar.gz)
|audio|0.1-11|[https://cran.r-project.org/src/contrib/audio_0.1-11.tar.gz] (https://cran.r-project.org/src/contrib/audio_0.1-11.tar.gz)
|autocogs|0.1.4|[https://cran.r-project.org/src/contrib/autocogs_0.1.4.tar.gz] (https://cran.r-project.org/src/contrib/autocogs_0.1.4.tar.gz)
|automap|1.1-12|[https://cran.r-project.org/src/contrib/automap_1.1-12.tar.gz] (https://cran.r-project.org/src/contrib/automap_1.1-12.tar.gz)
|aweek|1.0.3|[https://cran.r-project.org/src/contrib/aweek_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/aweek_1.0.3.tar.gz)
|BACCO|2.1-0|[https://cran.r-project.org/src/contrib/BACCO_2.1-0.tar.gz] (https://cran.r-project.org/src/contrib/BACCO_2.1-0.tar.gz)
|backports|1.5.0|[https://cran.r-project.org/src/contrib/backports_1.5.0.tar.gz] (https://cran.r-project.org/src/contrib/backports_1.5.0.tar.gz)
|BaM|1.0.3|[https://cran.r-project.org/src/contrib/BaM_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/BaM_1.0.3.tar.gz)
|BAS|1.7.1|[https://cran.r-project.org/web/packages/BAS/index.html] (https://cran.r-project.org/web/packages/BAS/index.html)
|base64|2.0.1|[https://cran.r-project.org/web/packages/base64/index.html] (https://cran.r-project.org/web/packages/base64/index.html)
|base64enc|0.1-3|[https://cran.r-project.org/src/contrib/base64enc_0.1-3.tar.gz] (https://cran.r-project.org/src/contrib/base64enc_0.1-3.tar.gz)
|BayesDA|2012.04-1|[https://cran.r-project.org/src/contrib/BayesDA_2012.04-1.tar.gz] (https://cran.r-project.org/src/contrib/BayesDA_2012.04-1.tar.gz)
|BayesFactor|0.9.12-4.7|[https://cran.r-project.org/src/contrib/BayesFactor_0.9.12-4.7.tar.gz] (https://cran.r-project.org/src/contrib/BayesFactor_0.9.12-4.7.tar.gz)
|bayesGARCH|2.1.10|[https://cran.r-project.org/src/contrib/bayesGARCH_2.1.10.tar.gz] (https://cran.r-project.org/src/contrib/bayesGARCH_2.1.10.tar.gz)
|bayesm|3.1-6|[https://cran.r-project.org/src/contrib/bayesm_3.1-6.tar.gz] (https://cran.r-project.org/src/contrib/bayesm_3.1-6.tar.gz)
|bayesmix|0.7-6|[https://cran.r-project.org/src/contrib/bayesmix_0.7-6.tar.gz] (https://cran.r-project.org/src/contrib/bayesmix_0.7-6.tar.gz)
|bayesplot|1.11.1|[https://cran.r-project.org/src/contrib/bayesplot_1.11.1.tar.gz] (https://cran.r-project.org/src/contrib/bayesplot_1.11.1.tar.gz)
|bayesQR|2.4|[https://cran.r-project.org/src/contrib/bayesQR_2.4.tar.gz] (https://cran.r-project.org/src/contrib/bayesQR_2.4.tar.gz)
|bayesSurv|3.7|[https://cran.r-project.org/web/packages/bayesSurv/index.html] (https://cran.r-project.org/web/packages/bayesSurv/index.html)
|bayestestR|0.14.0|[https://cran.r-project.org/web/packages/bayestestR/index.html] (https://cran.r-project.org/web/packages/bayestestR/index.html)
|BayesTree|0.3-1.5|[https://cran.r-project.org/src/contrib/BayesTree_0.3-1.5.tar.gz] (https://cran.r-project.org/src/contrib/BayesTree_0.3-1.5.tar.gz)
|BayesX|0.3-3|[https://cran.r-project.org/src/contrib/BayesX_0.3-3.tar.gz] (https://cran.r-project.org/src/contrib/BayesX_0.3-3.tar.gz)
|BCBCSF|1.0-1|[https://cran.r-project.org/src/contrib/BCBCSF_1.0-1.tar.gz] (https://cran.r-project.org/src/contrib/BCBCSF_1.0-1.tar.gz)
|BDgraph|2.73|[https://cran.r-project.org/src/contrib/BDgraph_2.73.tar.gz] (https://cran.r-project.org/src/contrib/BDgraph_2.73.tar.gz)
|beanplot|1.3.1|[https://cran.r-project.org/src/contrib/beanplot_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/beanplot_1.3.1.tar.gz)
|beepr|2.0|[https://cran.r-project.org/src/contrib/beepr_2.0.tar.gz] (https://cran.r-project.org/src/contrib/beepr_2.0.tar.gz)
|beeswarm|0.4.0|[https://cran.r-project.org/src/contrib/beeswarm_0.4.0.tar.gz] (https://cran.r-project.org/src/contrib/beeswarm_0.4.0.tar.gz)
|benford.analysis|0.1.5|[https://cran.r-project.org/src/contrib/benford.analysis_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/benford.analysis_0.1.5.tar.gz)
|BenfordTests|1.2.0|[https://cran.r-project.org/src/contrib/BenfordTests_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/BenfordTests_1.2.0.tar.gz)
|bfp|0.0-48|[https://cran.r-project.org/src/contrib/bfp_0.0-48.tar.gz] (https://cran.r-project.org/src/contrib/bfp_0.0-48.tar.gz)
|BH|1.84.0-0|[https://cran.r-project.org/web/packages/BH/index.html] (https://cran.r-project.org/web/packages/BH/index.html)
|bibtex|0.5.1|[https://cran.r-project.org/src/contrib/bibtex_0.5.1.tar.gz] (https://cran.r-project.org/src/contrib/bibtex_0.5.1.tar.gz)
|biglm|0.9-3|[https://cran.r-project.org/src/contrib/biglm_0.9-3.tar.gz] (https://cran.r-project.org/src/contrib/biglm_0.9-3.tar.gz)
|bindr|0.1.1|[https://cran.r-project.org/web/packages/bindr/index.html] (https://cran.r-project.org/web/packages/bindr/index.html)
|bindrcpp|0.2.3|[https://cran.r-project.org/src/contrib/bindrcpp_0.2.3.tar.gz] (https://cran.r-project.org/src/contrib/bindrcpp_0.2.3.tar.gz)
|binom|1.1-1.1|[https://cran.r-project.org/src/contrib/binom_1.1-1.1.tar.gz] (https://cran.r-project.org/src/contrib/binom_1.1-1.1.tar.gz)
|BiocManager|1.30.25|[https://cran.r-project.org/src/contrib/BiocManager_1.30.25.tar.gz] (https://cran.r-project.org/src/contrib/BiocManager_1.30.25.tar.gz)
|bit|4.0.5|[https://cran.r-project.org/web/packages/bit/index.html] (https://cran.r-project.org/web/packages/bit/index.html)
|bit64|4.0.5|[https://cran.r-project.org/web/packages/bit64/index.html] (https://cran.r-project.org/web/packages/bit64/index.html)
|bitops|1.0-8|[https://cran.r-project.org/web/packages/bitops/index.html] (https://cran.r-project.org/web/packages/bitops/index.html)
|bizdays|1.0.16|[https://cran.r-project.org/web/packages/bizdays/index.html] (https://cran.r-project.org/web/packages/bizdays/index.html)
|blandr|0.6.0|[https://cran.r-project.org/src/contrib/blandr_0.6.0.tar.gz] (https://cran.r-project.org/src/contrib/blandr_0.6.0.tar.gz)
|blme|1.0-5|[https://cran.r-project.org/web/packages/blme/index.html] (https://cran.r-project.org/web/packages/blme/index.html)
|blob|1.2.4|[https://cran.r-project.org/src/contrib/blob_1.2.4.tar.gz] (https://cran.r-project.org/src/contrib/blob_1.2.4.tar.gz)
|BLR|1.6|[https://cran.r-project.org/src/contrib/BLR_1.6.tar.gz] (https://cran.r-project.org/src/contrib/BLR_1.6.tar.gz)
|BMA|3.18.17|[https://cran.r-project.org/web/packages/BMA/index.html] (https://cran.r-project.org/web/packages/BMA/index.html)
|bmp|0.3|[https://cran.r-project.org/src/contrib/bmp_0.3.tar.gz] (https://cran.r-project.org/src/contrib/bmp_0.3.tar.gz)
|BMS|0.3.5|[https://cran.r-project.org/src/contrib/BMS_0.3.5.tar.gz] (https://cran.r-project.org/src/contrib/BMS_0.3.5.tar.gz)
|bnlearn|4.8.3|[https://cran.r-project.org/web/packages/bnlearn/index.html] (https://cran.r-project.org/web/packages/bnlearn/index.html)
|boa|1.1.8-2|[https://cran.r-project.org/src/contrib/boa_1.1.8-2.tar.gz] (https://cran.r-project.org/src/contrib/boa_1.1.8-2.tar.gz)
|BoolNet|2.1.9|[https://cran.r-project.org/src/contrib/BoolNet_2.1.9.tar.gz] (https://cran.r-project.org/src/contrib/BoolNet_2.1.9.tar.gz)
|Boom|0.9.15|[https://cran.r-project.org/src/contrib/Boom_0.9.15.tar.gz] (https://cran.r-project.org/src/contrib/Boom_0.9.15.tar.gz)
|BoomSpikeSlab|1.2.6|[https://cran.r-project.org/src/contrib/BoomSpikeSlab_1.2.6.tar.gz] (https://cran.r-project.org/src/contrib/BoomSpikeSlab_1.2.6.tar.gz)
|boot|1.3-31|[https://cran.r-project.org/src/contrib/boot_1.3-31.tar.gz] (https://cran.r-project.org/src/contrib/boot_1.3-31.tar.gz)
|bootstrap|2019.6|[https://cran.r-project.org/src/contrib/bootstrap_2019.6.tar.gz] (https://cran.r-project.org/src/contrib/bootstrap_2019.6.tar.gz)
|Boruta|8.0.0|[https://cran.r-project.org/src/contrib/Boruta_8.0.0.tar.gz] (https://cran.r-project.org/src/contrib/Boruta_8.0.0.tar.gz)
|bqtl|1.0-36|[https://cran.r-project.org/web/packages/bqtl/index.html] (https://cran.r-project.org/web/packages/bqtl/index.html)
|BradleyTerry2|1.1-2|[https://cran.r-project.org/src/contrib/BradleyTerry2_1.1-2.tar.gz] (https://cran.r-project.org/src/contrib/BradleyTerry2_1.1-2.tar.gz)
|brew|1.0-10|[https://cran.r-project.org/src/contrib/brew_1.0-10.tar.gz] (https://cran.r-project.org/src/contrib/brew_1.0-10.tar.gz)
|brglm|0.7.2|[https://cran.r-project.org/src/contrib/brglm_0.7.2.tar.gz] (https://cran.r-project.org/src/contrib/brglm_0.7.2.tar.gz)
|brio|1.1.5|[https://cran.r-project.org/src/contrib/brio_1.1.5.tar.gz] (https://cran.r-project.org/src/contrib/brio_1.1.5.tar.gz)
|broom|1.0.6|[https://cran.r-project.org/web/packages/broom/index.html] (https://cran.r-project.org/web/packages/broom/index.html)
|broom.helpers|1.17.0|[https://cran.r-project.org/web/packages/broom.helpers/index.html] (https://cran.r-project.org/web/packages/broom.helpers/index.html)
|broom.mixed|0.2.9.5|[https://cran.r-project.org/web/packages/broom.mixed/index.html] (https://cran.r-project.org/web/packages/broom.mixed/index.html)
|bslib|0.8.0|[https://cran.r-project.org/src/contrib/bslib_0.8.0.tar.gz] (https://cran.r-project.org/src/contrib/bslib_0.8.0.tar.gz)
|bspec|1.6|[https://cran.r-project.org/src/contrib/bspec_1.6.tar.gz] (https://cran.r-project.org/src/contrib/bspec_1.6.tar.gz)
|bspmma|0.1-2|[https://cran.r-project.org/src/contrib/bspmma_0.1-2.tar.gz] (https://cran.r-project.org/src/contrib/bspmma_0.1-2.tar.gz)
|bsts|0.9.10|[https://cran.r-project.org/src/contrib/bsts_0.9.10.tar.gz] (https://cran.r-project.org/src/contrib/bsts_0.9.10.tar.gz)
|bupaR|0.5.4|[https://cran.r-project.org/src/contrib/bupaR_0.5.4.tar.gz] (https://cran.r-project.org/src/contrib/bupaR_0.5.4.tar.gz)
|C50|0.1.8|[https://cran.r-project.org/src/contrib/C50_0.1.8.tar.gz] (https://cran.r-project.org/src/contrib/C50_0.1.8.tar.gz)
|ca|0.71.1|[https://cran.r-project.org/src/contrib/ca_0.71.1.tar.gz] (https://cran.r-project.org/src/contrib/ca_0.71.1.tar.gz)
|cachem|1.1.0|[https://cran.r-project.org/src/contrib/cachem_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/cachem_1.1.0.tar.gz)
|Cairo|1.6-2|[https://cran.r-project.org/src/contrib/Cairo_1.6-2.tar.gz] (https://cran.r-project.org/src/contrib/Cairo_1.6-2.tar.gz)
|cairoDevice|2.28.2.2|[https://cran.r-project.org/web/packages/cairoDevice/index.html] (https://cran.r-project.org/web/packages/cairoDevice/index.html)
|calibrate|1.7.7|[https://cran.r-project.org/src/contrib/calibrate_1.7.7.tar.gz] (https://cran.r-project.org/src/contrib/calibrate_1.7.7.tar.gz)
|calibrator|1.2-8|[https://cran.r-project.org/src/contrib/calibrator_1.2-8.tar.gz] (https://cran.r-project.org/src/contrib/calibrator_1.2-8.tar.gz)
|callr|3.7.6|[https://cran.r-project.org/src/contrib/callr_3.7.6.tar.gz] (https://cran.r-project.org/src/contrib/callr_3.7.6.tar.gz)
|car|3.1-2|[https://cran.r-project.org/web/packages/car/index.html] (https://cran.r-project.org/web/packages/car/index.html)
|carData|3.0-5|[https://cran.r-project.org/src/contrib/carData_3.0-5.tar.gz] (https://cran.r-project.org/src/contrib/carData_3.0-5.tar.gz)
|cards|0.2.2|[https://cran.r-project.org/web/packages/cards/index.html] (https://cran.r-project.org/web/packages/cards/index.html)
|caret|6.0-94|[https://cran.r-project.org/web/packages/caret/index.html] (https://cran.r-project.org/web/packages/caret/index.html)
|catnet|1.16.1|[https://cran.r-project.org/web/packages/catnet/index.html] (https://cran.r-project.org/web/packages/catnet/index.html)
|caTools|1.18.3|[https://cran.r-project.org/src/contrib/caTools_1.18.3.tar.gz] (https://cran.r-project.org/src/contrib/caTools_1.18.3.tar.gz)
|cclust|0.6-26|[https://cran.r-project.org/src/contrib/cclust_0.6-26.tar.gz] (https://cran.r-project.org/src/contrib/cclust_0.6-26.tar.gz)
|cellranger|1.1.0|[https://cran.r-project.org/src/contrib/cellranger_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/cellranger_1.1.0.tar.gz)
|ChainLadder|0.2.19|[https://cran.r-project.org/src/contrib/ChainLadder_0.2.19.tar.gz] (https://cran.r-project.org/src/contrib/ChainLadder_0.2.19.tar.gz)
|changepoint|2.2.4|[https://cran.r-project.org/web/packages/changepoint/index.html] (https://cran.r-project.org/web/packages/changepoint/index.html)
|checkmate|2.3.2|[https://cran.r-project.org/src/contrib/checkmate_2.3.2.tar.gz] (https://cran.r-project.org/src/contrib/checkmate_2.3.2.tar.gz)
|checkpoint|1.0.2|[https://cran.r-project.org/src/contrib/checkpoint_1.0.2.tar.gz] (https://cran.r-project.org/src/contrib/checkpoint_1.0.2.tar.gz)
|chk|0.9.2|[https://cran.r-project.org/src/contrib/chk_0.9.2.tar.gz] (https://cran.r-project.org/src/contrib/chk_0.9.2.tar.gz)
|choroplethrMaps|1.0.1|[https://cran.r-project.org/src/contrib/choroplethrMaps_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/choroplethrMaps_1.0.1.tar.gz)
|chron|2.3-61|[https://cran.r-project.org/web/packages/chron/index.html] (https://cran.r-project.org/web/packages/chron/index.html)
|circlize|0.4.16|[https://cran.r-project.org/src/contrib/circlize_0.4.16.tar.gz] (https://cran.r-project.org/src/contrib/circlize_0.4.16.tar.gz)
|Ckmeans.1d.dp|4.3.5|[https://cran.r-project.org/src/contrib/Ckmeans.1d.dp_4.3.5.tar.gz] (https://cran.r-project.org/src/contrib/Ckmeans.1d.dp_4.3.5.tar.gz)
|class|7.3-22|[https://cran.r-project.org/web/packages/class/index.html] (https://cran.r-project.org/web/packages/class/index.html)
|classInt|0.4-10|[https://cran.r-project.org/web/packages/classInt/index.html] (https://cran.r-project.org/web/packages/classInt/index.html)
|cli|3.6.3|[https://cran.r-project.org/src/contrib/cli_3.6.3.tar.gz] (https://cran.r-project.org/src/contrib/cli_3.6.3.tar.gz)
|ClickClust|1.1.6|[https://cran.r-project.org/src/contrib/ClickClust_1.1.6.tar.gz] (https://cran.r-project.org/src/contrib/ClickClust_1.1.6.tar.gz)
|clickstream|1.3.3|[https://cran.r-project.org/src/contrib/clickstream_1.3.3.tar.gz] (https://cran.r-project.org/src/contrib/clickstream_1.3.3.tar.gz)
|clipr|0.8.0|[https://cran.r-project.org/src/contrib/clipr_0.8.0.tar.gz] (https://cran.r-project.org/src/contrib/clipr_0.8.0.tar.gz)
|clock|0.7.1|[https://cran.r-project.org/src/contrib/clock_0.7.1.tar.gz] (https://cran.r-project.org/src/contrib/clock_0.7.1.tar.gz)
|clue|0.3-65|[https://cran.r-project.org/web/packages/clue/index.html] (https://cran.r-project.org/web/packages/clue/index.html)
|cluster|2.1.6|[https://cran.r-project.org/web/packages/cluster/index.html] (https://cran.r-project.org/web/packages/cluster/index.html)
|clv|0.3-2.4|[https://cran.r-project.org/src/contrib/clv_0.3-2.4.tar.gz] (https://cran.r-project.org/src/contrib/clv_0.3-2.4.tar.gz)
|cmprsk|2.2-12|[https://cran.r-project.org/src/contrib/cmprsk_2.2-12.tar.gz] (https://cran.r-project.org/src/contrib/cmprsk_2.2-12.tar.gz)
|coda|0.19-4.1|[https://cran.r-project.org/src/contrib/coda_0.19-4.1.tar.gz] (https://cran.r-project.org/src/contrib/coda_0.19-4.1.tar.gz)
|codetools|0.2-20|[https://cran.r-project.org/src/contrib/codetools_0.2-20.tar.gz] (https://cran.r-project.org/src/contrib/codetools_0.2-20.tar.gz)
|coefplot|1.2.8|[https://cran.r-project.org/src/contrib/coefplot_1.2.8.tar.gz] (https://cran.r-project.org/src/contrib/coefplot_1.2.8.tar.gz)
|coin|1.4-3|[https://cran.r-project.org/src/contrib/coin_1.4-3.tar.gz] (https://cran.r-project.org/src/contrib/coin_1.4-3.tar.gz)
|collapsibleTree|0.1.8|[https://cran.r-project.org/src/contrib/collapsibleTree_0.1.8.tar.gz] (https://cran.r-project.org/src/contrib/collapsibleTree_0.1.8.tar.gz)
|colorRamps|2.3.4|[https://cran.r-project.org/src/contrib/colorRamps_2.3.4.tar.gz] (https://cran.r-project.org/src/contrib/colorRamps_2.3.4.tar.gz)
|colorspace|2.1-1|[https://cran.r-project.org/src/contrib/colorspace_2.1-1.tar.gz] (https://cran.r-project.org/src/contrib/colorspace_2.1-1.tar.gz)
|colourpicker|1.3.0|[https://cran.r-project.org/src/contrib/colourpicker_1.3.0.tar.gz] (https://cran.r-project.org/src/contrib/colourpicker_1.3.0.tar.gz)
|colourvalues|0.3.9|[https://cran.r-project.org/src/contrib/colourvalues_0.3.9.tar.gz] (https://cran.r-project.org/src/contrib/colourvalues_0.3.9.tar.gz)
|combinat|0.0-8|[https://cran.r-project.org/src/contrib/combinat_0.0-8.tar.gz] (https://cran.r-project.org/src/contrib/combinat_0.0-8.tar.gz)
|commonmark|1.9.1|[https://cran.r-project.org/web/packages/commonmark/index.html] (https://cran.r-project.org/web/packages/commonmark/index.html)
|compositions|2.0-8|[https://cran.r-project.org/src/contrib/compositions_2.0-8.tar.gz] (https://cran.r-project.org/src/contrib/compositions_2.0-8.tar.gz)
|CompQuadForm|1.4.3|[https://cran.r-project.org/src/contrib/CompQuadForm_1.4.3.tar.gz] (https://cran.r-project.org/src/contrib/CompQuadForm_1.4.3.tar.gz)
|confintr|1.0.2|[https://cran.r-project.org/src/contrib/confintr_1.0.2.tar.gz] (https://cran.r-project.org/src/contrib/confintr_1.0.2.tar.gz)
|conflicted|1.2.0|[https://cran.r-project.org/src/contrib/conflicted_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/conflicted_1.2.0.tar.gz)
|conquer|1.3.3|[https://cran.r-project.org/src/contrib/conquer_1.3.3.tar.gz] (https://cran.r-project.org/src/contrib/conquer_1.3.3.tar.gz)
|contfrac|1.1-12|[https://cran.r-project.org/src/contrib/contfrac_1.1-12.tar.gz] (https://cran.r-project.org/src/contrib/contfrac_1.1-12.tar.gz)
|CORElearn|1.57.3|[https://cran.r-project.org/web/packages/CORElearn/index.html] (https://cran.r-project.org/web/packages/CORElearn/index.html)
|corpcor|1.6.10|[https://cran.r-project.org/src/contrib/corpcor_1.6.10.tar.gz] (https://cran.r-project.org/src/contrib/corpcor_1.6.10.tar.gz)
|corrgram|1.14|[https://cran.r-project.org/src/contrib/corrgram_1.14.tar.gz] (https://cran.r-project.org/src/contrib/corrgram_1.14.tar.gz)
|corrplot|0.94|[https://cran.r-project.org/web/packages/corrplot/index.html] (https://cran.r-project.org/web/packages/corrplot/index.html)
|covr|3.6.4|[https://cran.r-project.org/src/contrib/covr_3.6.4.tar.gz] (https://cran.r-project.org/src/contrib/covr_3.6.4.tar.gz)
|cowplot|1.1.3|[https://cran.r-project.org/src/contrib/cowplot_1.1.3.tar.gz] (https://cran.r-project.org/src/contrib/cowplot_1.1.3.tar.gz)
|cplm|0.7-12|[https://cran.r-project.org/web/packages/cplm/index.html] (https://cran.r-project.org/web/packages/cplm/index.html)
|cpp11|0.5.0|[https://cran.r-project.org/web/packages/cpp11/index.html] (https://cran.r-project.org/web/packages/cpp11/index.html)
|crayon|1.5.2|[https://cran.r-project.org/web/packages/crayon/index.html] (https://cran.r-project.org/web/packages/crayon/index.html)
|credentials|2.0.1|[https://cran.r-project.org/web/packages/credentials/index.html] (https://cran.r-project.org/web/packages/credentials/index.html)
|crosstalk|1.2.1|[https://cran.r-project.org/src/contrib/crosstalk_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/crosstalk_1.2.1.tar.gz)
|crul|1.5.0|[https://cran.r-project.org/src/contrib/crul_1.5.0.tar.gz] (https://cran.r-project.org/src/contrib/crul_1.5.0.tar.gz)
|ctv|0.9-5|[https://cran.r-project.org/web/packages/ctv/index.html] (https://cran.r-project.org/web/packages/ctv/index.html)
|cubature|2.0.4.6|[https://cran.r-project.org/web/packages/cubature/index.html] (https://cran.r-project.org/web/packages/cubature/index.html)
|Cubist|0.4.4|[https://cran.r-project.org/src/contrib/Cubist_0.4.4.tar.gz] (https://cran.r-project.org/src/contrib/Cubist_0.4.4.tar.gz)
|curl|5.2.1|[https://cran.r-project.org/web/packages/curl/index.html] (https://cran.r-project.org/web/packages/curl/index.html)
|cvar|0.5|[https://cran.r-project.org/src/contrib/cvar_0.5.tar.gz] (https://cran.r-project.org/src/contrib/cvar_0.5.tar.gz)
|CVST|0.2-3|[https://cran.r-project.org/src/contrib/CVST_0.2-3.tar.gz] (https://cran.r-project.org/src/contrib/CVST_0.2-3.tar.gz)
|cvTools|0.3.3|[https://cran.r-project.org/src/contrib/cvTools_0.3.3.tar.gz] (https://cran.r-project.org/src/contrib/cvTools_0.3.3.tar.gz)
|d3heatmap|0.6.1.2|[https://cran.r-project.org/web/packages/d3heatmap/index.html] (https://cran.r-project.org/web/packages/d3heatmap/index.html)
|d3Network|0.5.2.1|[https://cran.r-project.org/src/contrib/d3Network_0.5.2.1.tar.gz] (https://cran.r-project.org/src/contrib/d3Network_0.5.2.1.tar.gz)
|d3r|1.1.0|[https://cran.r-project.org/src/contrib/d3r_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/d3r_1.1.0.tar.gz)
|data.table|1.15.4|[https://cran.r-project.org/web/packages/data.table/index.html] (https://cran.r-project.org/web/packages/data.table/index.html)
|data.tree|1.1.0|[https://cran.r-project.org/src/contrib/data.tree_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/data.tree_1.1.0.tar.gz)
|datasauRus|0.1.8|[https://cran.r-project.org/src/contrib/datasauRus_0.1.8.tar.gz] (https://cran.r-project.org/src/contrib/datasauRus_0.1.8.tar.gz)
|datawizard|0.12.3|[https://cran.r-project.org/web/packages/datawizard/index.html] (https://cran.r-project.org/web/packages/datawizard/index.html)
|date|1.2-42|[https://cran.r-project.org/src/contrib/date_1.2-42.tar.gz] (https://cran.r-project.org/src/contrib/date_1.2-42.tar.gz)
|DBI|1.2.3|[https://cran.r-project.org/src/contrib/DBI_1.2.3.tar.gz] (https://cran.r-project.org/src/contrib/DBI_1.2.3.tar.gz)
|dbplyr|2.5.0|[https://cran.r-project.org/src/contrib/dbplyr_2.5.0.tar.gz] (https://cran.r-project.org/src/contrib/dbplyr_2.5.0.tar.gz)
|dbscan|1.2-0|[https://cran.r-project.org/src/contrib/dbscan_1.2-0.tar.gz] (https://cran.r-project.org/src/contrib/dbscan_1.2-0.tar.gz)
|dclone|2.3-2|[https://cran.r-project.org/src/contrib/dclone_2.3-2.tar.gz] (https://cran.r-project.org/src/contrib/dclone_2.3-2.tar.gz)
|dcurver|0.9.2|[https://cran.r-project.org/src/contrib/dcurver_0.9.2.tar.gz] (https://cran.r-project.org/src/contrib/dcurver_0.9.2.tar.gz)
|ddalpha|1.3.15|[https://cran.r-project.org/web/packages/ddalpha/index.html] (https://cran.r-project.org/web/packages/ddalpha/index.html)
|deal|1.2-42|[https://cran.r-project.org/src/contrib/deal_1.2-42.tar.gz] (https://cran.r-project.org/src/contrib/deal_1.2-42.tar.gz)
|debugme|1.2.0|[https://cran.r-project.org/src/contrib/debugme_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/debugme_1.2.0.tar.gz)
|decido|0.3.0|[https://cran.r-project.org/src/contrib/decido_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/decido_0.3.0.tar.gz)
|deepnet|0.2.1|[https://cran.r-project.org/src/contrib/deepnet_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/deepnet_0.2.1.tar.gz)
|deldir|2.0-4|[https://cran.r-project.org/src/contrib/deldir_2.0-4.tar.gz] (https://cran.r-project.org/src/contrib/deldir_2.0-4.tar.gz)
|dendextend|1.17.1|[https://cran.r-project.org/web/packages/dendextend/index.html] (https://cran.r-project.org/web/packages/dendextend/index.html)
|DEoptimR|1.1-3|[https://cran.r-project.org/web/packages/DEoptimR/index.html] (https://cran.r-project.org/web/packages/DEoptimR/index.html)
|Deriv|4.1.3|[https://cran.r-project.org/web/packages/Deriv/index.html] (https://cran.r-project.org/web/packages/Deriv/index.html)
|desc|1.4.3|[https://cran.r-project.org/src/contrib/desc_1.4.3.tar.gz] (https://cran.r-project.org/src/contrib/desc_1.4.3.tar.gz)
|descr|1.1.8|[https://cran.r-project.org/src/contrib/descr_1.1.8.tar.gz] (https://cran.r-project.org/src/contrib/descr_1.1.8.tar.gz)
|deSolve|1.40|[https://cran.r-project.org/src/contrib/deSolve_1.40.tar.gz] (https://cran.r-project.org/src/contrib/deSolve_1.40.tar.gz)
|devtools|2.4.5|[https://cran.r-project.org/src/contrib/devtools_2.4.5.tar.gz] (https://cran.r-project.org/src/contrib/devtools_2.4.5.tar.gz)
|diagram|1.6.5|[https://cran.r-project.org/src/contrib/diagram_1.6.5.tar.gz] (https://cran.r-project.org/src/contrib/diagram_1.6.5.tar.gz)
|DiagrammeR|1.0.11|[https://cran.r-project.org/src/contrib/DiagrammeR_1.0.11.tar.gz] (https://cran.r-project.org/src/contrib/DiagrammeR_1.0.11.tar.gz)
|DiagrammeRsvg|0.1|[https://cran.r-project.org/src/contrib/DiagrammeRsvg_0.1.tar.gz] (https://cran.r-project.org/src/contrib/DiagrammeRsvg_0.1.tar.gz)
|dials|1.3.0|[https://cran.r-project.org/src/contrib/dials_1.3.0.tar.gz] (https://cran.r-project.org/src/contrib/dials_1.3.0.tar.gz)
|DiceDesign|1.10|[https://cran.r-project.org/src/contrib/DiceDesign_1.10.tar.gz] (https://cran.r-project.org/src/contrib/DiceDesign_1.10.tar.gz)
|dichromat|2.0-0.1|[https://cran.r-project.org/src/contrib/dichromat_2.0-0.1.tar.gz] (https://cran.r-project.org/src/contrib/dichromat_2.0-0.1.tar.gz)
|diffobj|0.3.5|[https://cran.r-project.org/src/contrib/diffobj_0.3.5.tar.gz] (https://cran.r-project.org/src/contrib/diffobj_0.3.5.tar.gz)
|digest|0.6.33|[https://cran.r-project.org/web/packages/digest/index.html] (https://cran.r-project.org/web/packages/digest/index.html)
|dimRed|0.2.6|[https://cran.r-project.org/web/packages/dimRed/index.html] (https://cran.r-project.org/web/packages/dimRed/index.html)
|diptest|0.77-1|[https://cran.r-project.org/src/contrib/diptest_0.77-1.tar.gz] (https://cran.r-project.org/src/contrib/diptest_0.77-1.tar.gz)
|distcrete|1.0.3|[https://cran.r-project.org/src/contrib/distcrete_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/distcrete_1.0.3.tar.gz)
|distributional|0.4.0|[https://cran.r-project.org/web/packages/distributional/index.html] (https://cran.r-project.org/web/packages/distributional/index.html)
|DistributionUtils|0.6-1|[https://cran.r-project.org/src/contrib/DistributionUtils_0.6-1.tar.gz] (https://cran.r-project.org/src/contrib/DistributionUtils_0.6-1.tar.gz)
|distrom|1.0.1|[https://cran.r-project.org/src/contrib/distrom_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/distrom_1.0.1.tar.gz)
|dlm|1.1-6|[https://cran.r-project.org/web/packages/dlm/index.html] (https://cran.r-project.org/web/packages/dlm/index.html)
|DMwR|0.4.1|[https://cran.r-project.org/web/packages/DMwR/index.html] (https://cran.r-project.org/web/packages/DMwR/index.html)
|doBy|4.6.22|[https://cran.r-project.org/web/packages/doBy/index.html] (https://cran.r-project.org/web/packages/doBy/index.html)
|doFuture|1.0.1|[https://cran.r-project.org/src/contrib/doFuture_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/doFuture_1.0.1.tar.gz)
|doParallel|1.0.17|[https://cran.r-project.org/src/contrib/doParallel_1.0.17.tar.gz] (https://cran.r-project.org/src/contrib/doParallel_1.0.17.tar.gz)
|doSNOW|1.0.20|[https://cran.r-project.org/src/contrib/doSNOW_1.0.20.tar.gz] (https://cran.r-project.org/src/contrib/doSNOW_1.0.20.tar.gz)
|dotCall64|1.1-1|[https://cran.r-project.org/web/packages/dotCall64/index.html] (https://cran.r-project.org/web/packages/dotCall64/index.html)
|downlit|0.4.4|[https://cran.r-project.org/src/contrib/downlit_0.4.4.tar.gz] (https://cran.r-project.org/src/contrib/downlit_0.4.4.tar.gz)
|downloader|0.4|[https://cran.r-project.org/src/contrib/downloader_0.4.tar.gz] (https://cran.r-project.org/src/contrib/downloader_0.4.tar.gz)
|dplyr|1.1.4|[https://cran.r-project.org/src/contrib/dplyr_1.1.4.tar.gz] (https://cran.r-project.org/src/contrib/dplyr_1.1.4.tar.gz)
|DRR|0.0.4|[https://cran.r-project.org/src/contrib/DRR_0.0.4.tar.gz] (https://cran.r-project.org/src/contrib/DRR_0.0.4.tar.gz)
|dse|2020.2-1|[https://cran.r-project.org/web/packages/dse/index.html] (https://cran.r-project.org/web/packages/dse/index.html)
|DT|0.33|[https://cran.r-project.org/src/contrib/DT_0.33.tar.gz] (https://cran.r-project.org/src/contrib/DT_0.33.tar.gz)
|dtplyr|1.3.1|[https://cran.r-project.org/src/contrib/dtplyr_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/dtplyr_1.3.1.tar.gz)
|dtt|0.1-2|[https://cran.r-project.org/src/contrib/dtt_0.1-2.tar.gz] (https://cran.r-project.org/src/contrib/dtt_0.1-2.tar.gz)
|dtw|1.23-1|[https://cran.r-project.org/src/contrib/dtw_1.23-1.tar.gz] (https://cran.r-project.org/src/contrib/dtw_1.23-1.tar.gz)
|dygraphs|1.1.1.6|[https://cran.r-project.org/src/contrib/dygraphs_1.1.1.6.tar.gz] (https://cran.r-project.org/src/contrib/dygraphs_1.1.1.6.tar.gz)
|dynlm|0.3-6|[https://cran.r-project.org/src/contrib/dynlm_0.3-6.tar.gz] (https://cran.r-project.org/src/contrib/dynlm_0.3-6.tar.gz)
|e1071|1.7-14|[https://cran.r-project.org/web/packages/e1071/index.html] (https://cran.r-project.org/web/packages/e1071/index.html)
|earth|5.3.3|[https://cran.r-project.org/web/packages/earth/index.html] (https://cran.r-project.org/web/packages/earth/index.html)
|EbayesThresh|1.4-12|[https://cran.r-project.org/src/contrib/EbayesThresh_1.4-12.tar.gz] (https://cran.r-project.org/src/contrib/EbayesThresh_1.4-12.tar.gz)
|ebdbNet|1.2.8|[https://cran.r-project.org/src/contrib/ebdbNet_1.2.8.tar.gz] (https://cran.r-project.org/src/contrib/ebdbNet_1.2.8.tar.gz)
|ecm|7.2.0|[https://cran.r-project.org/src/contrib/ecm_7.2.0.tar.gz] (https://cran.r-project.org/src/contrib/ecm_7.2.0.tar.gz)
|edeaR|0.9.4|[https://cran.r-project.org/src/contrib/edeaR_0.9.4.tar.gz] (https://cran.r-project.org/src/contrib/edeaR_0.9.4.tar.gz)
|effects|4.2-2|[https://cran.r-project.org/src/contrib/effects_4.2-2.tar.gz] (https://cran.r-project.org/src/contrib/effects_4.2-2.tar.gz)
|effectsize|0.8.9|[https://cran.r-project.org/web/packages/effectsize/index.html] (https://cran.r-project.org/web/packages/effectsize/index.html)
|egg|0.4.5|[https://cran.r-project.org/src/contrib/egg_0.4.5.tar.gz] (https://cran.r-project.org/src/contrib/egg_0.4.5.tar.gz)
|ellipse|0.5.0|[https://cran.r-project.org/src/contrib/ellipse_0.5.0.tar.gz] (https://cran.r-project.org/src/contrib/ellipse_0.5.0.tar.gz)
|ellipsis|0.3.2|[https://cran.r-project.org/src/contrib/ellipsis_0.3.2.tar.gz] (https://cran.r-project.org/src/contrib/ellipsis_0.3.2.tar.gz)
|elliptic|1.4-0|[https://cran.r-project.org/src/contrib/elliptic_1.4-0.tar.gz] (https://cran.r-project.org/src/contrib/elliptic_1.4-0.tar.gz)
|emmeans|1.10.4|[https://cran.r-project.org/web/packages/emmeans/index.html] (https://cran.r-project.org/web/packages/emmeans/index.html)
|emulator|1.2-24|[https://cran.r-project.org/src/contrib/emulator_1.2-24.tar.gz] (https://cran.r-project.org/src/contrib/emulator_1.2-24.tar.gz)
|energy|1.7-12|[https://cran.r-project.org/src/contrib/energy_1.7-12.tar.gz] (https://cran.r-project.org/src/contrib/energy_1.7-12.tar.gz)
|english|1.2-6|[https://cran.r-project.org/src/contrib/english_1.2-6.tar.gz] (https://cran.r-project.org/src/contrib/english_1.2-6.tar.gz)
|ensembleBMA|5.1.8|[https://cran.r-project.org/src/contrib/ensembleBMA_5.1.8.tar.gz] (https://cran.r-project.org/src/contrib/ensembleBMA_5.1.8.tar.gz)
|entropy|1.3.1|[https://cran.r-project.org/src/contrib/entropy_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/entropy_1.3.1.tar.gz)
|epitools|0.5-10.1|[https://cran.r-project.org/src/contrib/epitools_0.5-10.1.tar.gz] (https://cran.r-project.org/src/contrib/epitools_0.5-10.1.tar.gz)
|epitrix|0.4.0|[https://cran.r-project.org/src/contrib/epitrix_0.4.0.tar.gz] (https://cran.r-project.org/src/contrib/epitrix_0.4.0.tar.gz)
|estimability|1.5|[https://cran.r-project.org/web/packages/estimability/index.html] (https://cran.r-project.org/web/packages/estimability/index.html)
|eulerr|7.0.2|[https://cran.r-project.org/src/contrib/eulerr_7.0.2.tar.gz] (https://cran.r-project.org/src/contrib/eulerr_7.0.2.tar.gz)
|evaluate|0.22|[https://cran.r-project.org/web/packages/evaluate/index.html] (https://cran.r-project.org/web/packages/evaluate/index.html)
|evd|2.3-7|[https://cran.r-project.org/web/packages/evd/index.html] (https://cran.r-project.org/web/packages/evd/index.html)
|evdbayes|1.1-3|[https://cran.r-project.org/src/contrib/evdbayes_1.1-3.tar.gz] (https://cran.r-project.org/src/contrib/evdbayes_1.1-3.tar.gz)
|eventdataR|0.3.1|[https://cran.r-project.org/src/contrib/eventdataR_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/eventdataR_0.3.1.tar.gz)
|exactRankTests|0.8-35|[https://cran.r-project.org/src/contrib/exactRankTests_0.8-35.tar.gz] (https://cran.r-project.org/src/contrib/exactRankTests_0.8-35.tar.gz)
|expint|0.1-8|[https://cran.r-project.org/src/contrib/expint_0.1-8.tar.gz] (https://cran.r-project.org/src/contrib/expint_0.1-8.tar.gz)
|expm|1.0-0|[https://cran.r-project.org/src/contrib/expm_1.0-0.tar.gz] (https://cran.r-project.org/src/contrib/expm_1.0-0.tar.gz)
|extraDistr|1.10.0|[https://cran.r-project.org/src/contrib/extraDistr_1.10.0.tar.gz] (https://cran.r-project.org/src/contrib/extraDistr_1.10.0.tar.gz)
|extrafont|0.19|[https://cran.r-project.org/src/contrib/extrafont_0.19.tar.gz] (https://cran.r-project.org/src/contrib/extrafont_0.19.tar.gz)
|extrafontdb|1.0|[https://cran.r-project.org/src/contrib/extrafontdb_1.0.tar.gz] (https://cran.r-project.org/src/contrib/extrafontdb_1.0.tar.gz)
|extremevalues|2.3.4|[https://cran.r-project.org/web/packages/extremevalues/index.html] (https://cran.r-project.org/web/packages/extremevalues/index.html)
|ez|4.4-0|[https://cran.r-project.org/src/contrib/ez_4.4-0.tar.gz] (https://cran.r-project.org/src/contrib/ez_4.4-0.tar.gz)
|factoextra|1.0.7|[https://cran.r-project.org/src/contrib/factoextra_1.0.7.tar.gz] (https://cran.r-project.org/src/contrib/factoextra_1.0.7.tar.gz)
|FactoMineR|2.11|[https://cran.r-project.org/src/contrib/FactoMineR_2.11.tar.gz] (https://cran.r-project.org/src/contrib/FactoMineR_2.11.tar.gz)
|fansi|1.0.5|[https://cran.r-project.org/web/packages/fansi/index.html] (https://cran.r-project.org/web/packages/fansi/index.html)
|faoutlier|0.7.6|[https://cran.r-project.org/src/contrib/faoutlier_0.7.6.tar.gz] (https://cran.r-project.org/src/contrib/faoutlier_0.7.6.tar.gz)
|farver|2.1.2|[https://cran.r-project.org/src/contrib/farver_2.1.2.tar.gz] (https://cran.r-project.org/src/contrib/farver_2.1.2.tar.gz)
|fastICA|1.2-5.1|[https://cran.r-project.org/web/packages/fastICA/index.html] (https://cran.r-project.org/web/packages/fastICA/index.html)
|fastmap|1.2.0|[https://cran.r-project.org/src/contrib/fastmap_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/fastmap_1.2.0.tar.gz)
|fastmatch|1.1-4|[https://cran.r-project.org/web/packages/fastmatch/index.html] (https://cran.r-project.org/web/packages/fastmatch/index.html)
|fBasics|4041.97|[https://cran.r-project.org/src/contrib/fBasics_4041.97.tar.gz] (https://cran.r-project.org/src/contrib/fBasics_4041.97.tar.gz)
|fda|6.1.8|[https://cran.r-project.org/web/packages/fda/index.html] (https://cran.r-project.org/web/packages/fda/index.html)
|fdrtool|1.2.18|[https://cran.r-project.org/src/contrib/fdrtool_1.2.18.tar.gz] (https://cran.r-project.org/src/contrib/fdrtool_1.2.18.tar.gz)
|fds|1.8|[https://cran.r-project.org/src/contrib/fds_1.8.tar.gz] (https://cran.r-project.org/src/contrib/fds_1.8.tar.gz)
|fGarch|4033.92|[https://cran.r-project.org/src/contrib/fGarch_4033.92.tar.gz] (https://cran.r-project.org/src/contrib/fGarch_4033.92.tar.gz)
|fields|16.2|[https://cran.r-project.org/web/packages/fields/index.html] (https://cran.r-project.org/web/packages/fields/index.html)
|filehash|2.4-6|[https://cran.r-project.org/src/contrib/filehash_2.4-6.tar.gz] (https://cran.r-project.org/src/contrib/filehash_2.4-6.tar.gz)
|filelock|1.0.3|[https://cran.r-project.org/src/contrib/filelock_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/filelock_1.0.3.tar.gz)
|FinCal|0.6.3|[https://cran.r-project.org/src/contrib/FinCal_0.6.3.tar.gz] (https://cran.r-project.org/src/contrib/FinCal_0.6.3.tar.gz)
|fitdistrplus|1.2-1|[https://cran.r-project.org/web/packages/fitdistrplus/index.html] (https://cran.r-project.org/web/packages/fitdistrplus/index.html)
|flashClust|1.01-2|[https://cran.r-project.org/src/contrib/flashClust_1.01-2.tar.gz] (https://cran.r-project.org/src/contrib/flashClust_1.01-2.tar.gz)
|flexclust|1.4-2|[https://cran.r-project.org/src/contrib/flexclust_1.4-2.tar.gz] (https://cran.r-project.org/src/contrib/flexclust_1.4-2.tar.gz)
|flexmix|2.3-19|[https://cran.r-project.org/src/contrib/flexmix_2.3-19.tar.gz] (https://cran.r-project.org/src/contrib/flexmix_2.3-19.tar.gz)
|float|0.3-2|[https://cran.r-project.org/src/contrib/float_0.3-2.tar.gz] (https://cran.r-project.org/src/contrib/float_0.3-2.tar.gz)
|FME|1.3.6.3|[https://cran.r-project.org/src/contrib/FME_1.3.6.3.tar.gz] (https://cran.r-project.org/src/contrib/FME_1.3.6.3.tar.gz)
|fmsb|0.7.6|[https://cran.r-project.org/src/contrib/fmsb_0.7.6.tar.gz] (https://cran.r-project.org/src/contrib/fmsb_0.7.6.tar.gz)
|FNN|1.1.4|[https://cran.r-project.org/web/packages/FNN/index.html] (https://cran.r-project.org/web/packages/FNN/index.html)
|fontawesome|0.5.2|[https://cran.r-project.org/web/packages/fontawesome/index.html] (https://cran.r-project.org/web/packages/fontawesome/index.html)
|fontBitstreamVera|0.1.1|[https://cran.r-project.org/src/contrib/fontBitstreamVera_0.1.1.tar.gz] (https://cran.r-project.org/src/contrib/fontBitstreamVera_0.1.1.tar.gz)
|fontLiberation|0.1.0|[https://cran.r-project.org/src/contrib/fontLiberation_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/fontLiberation_0.1.0.tar.gz)
|fontquiver|0.2.1|[https://cran.r-project.org/src/contrib/fontquiver_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/fontquiver_0.2.1.tar.gz)
|forcats|1.0.0|[https://cran.r-project.org/src/contrib/forcats_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/forcats_1.0.0.tar.gz)
|foreach|1.5.2|[https://cran.r-project.org/src/contrib/foreach_1.5.2.tar.gz] (https://cran.r-project.org/src/contrib/foreach_1.5.2.tar.gz)
|forecast|8.23.0|[https://cran.r-project.org/src/contrib/forecast_8.23.0.tar.gz] (https://cran.r-project.org/src/contrib/forecast_8.23.0.tar.gz)
|forecastHybrid|5.0.19|[https://cran.r-project.org/src/contrib/forecastHybrid_5.0.19.tar.gz] (https://cran.r-project.org/src/contrib/forecastHybrid_5.0.19.tar.gz)
|foreign|0.8-87|[https://cran.r-project.org/web/packages/foreign/index.html] (https://cran.r-project.org/web/packages/foreign/index.html)
|formatR|1.14|[https://cran.r-project.org/src/contrib/formatR_1.14.tar.gz] (https://cran.r-project.org/src/contrib/formatR_1.14.tar.gz)
|formattable|0.2.1|[https://cran.r-project.org/src/contrib/formattable_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/formattable_0.2.1.tar.gz)
|Formula|1.2-5|[https://cran.r-project.org/src/contrib/Formula_1.2-5.tar.gz] (https://cran.r-project.org/src/contrib/Formula_1.2-5.tar.gz)
|fpc|2.2-12|[https://cran.r-project.org/web/packages/fpc/index.html] (https://cran.r-project.org/web/packages/fpc/index.html)
|fracdiff|1.5-3|[https://cran.r-project.org/src/contrib/fracdiff_1.5-3.tar.gz] (https://cran.r-project.org/src/contrib/fracdiff_1.5-3.tar.gz)
|fs|1.6.4|[https://cran.r-project.org/web/packages/fs/index.html] (https://cran.r-project.org/web/packages/fs/index.html)
|fTrading|3042.79|[https://cran.r-project.org/src/contrib/fTrading_3042.79.tar.gz] (https://cran.r-project.org/src/contrib/fTrading_3042.79.tar.gz)
|fUnitRoots|4040.81|[https://cran.r-project.org/src/contrib/fUnitRoots_4040.81.tar.gz] (https://cran.r-project.org/src/contrib/fUnitRoots_4040.81.tar.gz)
|furrr|0.3.1|[https://cran.r-project.org/src/contrib/furrr_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/furrr_0.3.1.tar.gz)
|futile.logger|1.4.3|[https://cran.r-project.org/src/contrib/futile.logger_1.4.3.tar.gz] (https://cran.r-project.org/src/contrib/futile.logger_1.4.3.tar.gz)
|futile.options|1.0.1|[https://cran.r-project.org/src/contrib/futile.options_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/futile.options_1.0.1.tar.gz)
|future|1.34.0|[https://cran.r-project.org/src/contrib/future_1.34.0.tar.gz] (https://cran.r-project.org/src/contrib/future_1.34.0.tar.gz)
|future.apply|1.11.2|[https://cran.r-project.org/web/packages/future.apply/index.html] (https://cran.r-project.org/web/packages/future.apply/index.html)
|gam|1.22-4|[https://cran.r-project.org/web/packages/gam/index.html] (https://cran.r-project.org/web/packages/gam/index.html)
|gamlr|1.13-8|[https://cran.r-project.org/src/contrib/gamlr_1.13-8.tar.gz] (https://cran.r-project.org/src/contrib/gamlr_1.13-8.tar.gz)
|gamlss|5.4-22|[https://cran.r-project.org/src/contrib/gamlss_5.4-22.tar.gz] (https://cran.r-project.org/src/contrib/gamlss_5.4-22.tar.gz)
|gamlss.data|6.0-6|[https://cran.r-project.org/src/contrib/gamlss.data_6.0-6.tar.gz] (https://cran.r-project.org/src/contrib/gamlss.data_6.0-6.tar.gz)
|gamlss.dist|6.1-1|[https://cran.r-project.org/src/contrib/gamlss.dist_6.1-1.tar.gz] (https://cran.r-project.org/src/contrib/gamlss.dist_6.1-1.tar.gz)
|gargle|1.5.2|[https://cran.r-project.org/src/contrib/gargle_1.5.2.tar.gz] (https://cran.r-project.org/src/contrib/gargle_1.5.2.tar.gz)
|gbm|2.2.2|[https://cran.r-project.org/src/contrib/gbm_2.2.2.tar.gz] (https://cran.r-project.org/src/contrib/gbm_2.2.2.tar.gz)
|gbRd|0.4.12|[https://cran.r-project.org/src/contrib/gbRd_0.4.12.tar.gz] (https://cran.r-project.org/src/contrib/gbRd_0.4.12.tar.gz)
|gbutils|0.5|[https://cran.r-project.org/src/contrib/gbutils_0.5.tar.gz] (https://cran.r-project.org/src/contrib/gbutils_0.5.tar.gz)
|gclus|1.3.2|[https://cran.r-project.org/src/contrib/gclus_1.3.2.tar.gz] (https://cran.r-project.org/src/contrib/gclus_1.3.2.tar.gz)
|gdalUtils|2.0.3.2|[https://cran.r-project.org/web/packages/gdalUtils/index.html] (https://cran.r-project.org/web/packages/gdalUtils/index.html)
|gdata|3.0.0|[https://cran.r-project.org/web/packages/gdata/index.html] (https://cran.r-project.org/web/packages/gdata/index.html)
|gdtools|0.4.0|[https://cran.r-project.org/web/packages/gdtools/index.html] (https://cran.r-project.org/web/packages/gdtools/index.html)
|gee|4.13-27|[https://cran.r-project.org/web/packages/gee/index.html] (https://cran.r-project.org/web/packages/gee/index.html)
|genalg|0.2.1|[https://cran.r-project.org/src/contrib/genalg_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/genalg_0.2.1.tar.gz)
|generics|0.1.3|[https://cran.r-project.org/src/contrib/generics_0.1.3.tar.gz] (https://cran.r-project.org/src/contrib/generics_0.1.3.tar.gz)
|genetics|1.3.8.1.3|[https://cran.r-project.org/src/contrib/genetics_1.3.8.1.3.tar.gz] (https://cran.r-project.org/src/contrib/genetics_1.3.8.1.3.tar.gz)
|GenSA|1.1.14|[https://cran.r-project.org/web/packages/GenSA/index.html] (https://cran.r-project.org/web/packages/GenSA/index.html)
|geojson|0.3.5|[https://cran.r-project.org/src/contrib/geojson_0.3.5.tar.gz] (https://cran.r-project.org/src/contrib/geojson_0.3.5.tar.gz)
|geojsonio|0.11.3|[https://cran.r-project.org/src/contrib/geojsonio_0.11.3.tar.gz] (https://cran.r-project.org/src/contrib/geojsonio_0.11.3.tar.gz)
|geojsonlint|0.4.0|[https://cran.r-project.org/web/packages/geojsonlint/index.html] (https://cran.r-project.org/web/packages/geojsonlint/index.html)
|geojsonsf|2.0.3|[https://cran.r-project.org/src/contrib/geojsonsf_2.0.3.tar.gz] (https://cran.r-project.org/src/contrib/geojsonsf_2.0.3.tar.gz)
|geometries|0.2.4|[https://cran.r-project.org/src/contrib/geometries_0.2.4.tar.gz] (https://cran.r-project.org/src/contrib/geometries_0.2.4.tar.gz)
|geometry|0.4.7|[https://cran.r-project.org/web/packages/geometry/index.html] (https://cran.r-project.org/web/packages/geometry/index.html)
|geoR|1.9-4|[https://cran.r-project.org/src/contrib/geoR_1.9-4.tar.gz] (https://cran.r-project.org/src/contrib/geoR_1.9-4.tar.gz)
|geosphere|1.5-18|[https://cran.r-project.org/web/packages/geosphere/index.html] (https://cran.r-project.org/web/packages/geosphere/index.html)
|gert|2.1.1|[https://cran.r-project.org/web/packages/gert/index.html] (https://cran.r-project.org/web/packages/gert/index.html)
|gfonts|0.2.0|[https://cran.r-project.org/src/contrib/gfonts_0.2.0.tar.gz] (https://cran.r-project.org/src/contrib/gfonts_0.2.0.tar.gz)
|GGally|2.2.1|[https://cran.r-project.org/src/contrib/GGally_2.2.1.tar.gz] (https://cran.r-project.org/src/contrib/GGally_2.2.1.tar.gz)
|ggalt|0.4.0|[https://cran.r-project.org/src/contrib/ggalt_0.4.0.tar.gz] (https://cran.r-project.org/src/contrib/ggalt_0.4.0.tar.gz)
|gganimate|1.0.9|[https://cran.r-project.org/src/contrib/gganimate_1.0.9.tar.gz] (https://cran.r-project.org/src/contrib/gganimate_1.0.9.tar.gz)
|ggcorrplot|0.1.4.1|[https://cran.r-project.org/src/contrib/ggcorrplot_0.1.4.1.tar.gz] (https://cran.r-project.org/src/contrib/ggcorrplot_0.1.4.1.tar.gz)
|ggdendro|0.2.0|[https://cran.r-project.org/src/contrib/ggdendro_0.2.0.tar.gz] (https://cran.r-project.org/src/contrib/ggdendro_0.2.0.tar.gz)
|ggeffects|1.7.1|[https://cran.r-project.org/web/packages/ggeffects/index.html] (https://cran.r-project.org/web/packages/ggeffects/index.html)
|ggExtra|0.10.1|[https://cran.r-project.org/src/contrib/ggExtra_0.10.1.tar.gz] (https://cran.r-project.org/src/contrib/ggExtra_0.10.1.tar.gz)
|ggfittext|0.10.2|[https://cran.r-project.org/src/contrib/ggfittext_0.10.2.tar.gz] (https://cran.r-project.org/src/contrib/ggfittext_0.10.2.tar.gz)
|ggforce|0.4.2|[https://cran.r-project.org/src/contrib/ggforce_0.4.2.tar.gz] (https://cran.r-project.org/src/contrib/ggforce_0.4.2.tar.gz)
|ggformula|0.12.0|[https://cran.r-project.org/src/contrib/ggformula_0.12.0.tar.gz] (https://cran.r-project.org/src/contrib/ggformula_0.12.0.tar.gz)
|ggfortify|0.4.17|[https://cran.r-project.org/src/contrib/ggfortify_0.4.17.tar.gz] (https://cran.r-project.org/src/contrib/ggfortify_0.4.17.tar.gz)
|ggfun|0.1.6|[https://cran.r-project.org/web/packages/ggfun/index.html] (https://cran.r-project.org/web/packages/ggfun/index.html)
|gghighlight|0.4.1|[https://cran.r-project.org/src/contrib/gghighlight_0.4.1.tar.gz] (https://cran.r-project.org/src/contrib/gghighlight_0.4.1.tar.gz)
|ggimage|0.3.3|[https://cran.r-project.org/src/contrib/ggimage_0.3.3.tar.gz] (https://cran.r-project.org/src/contrib/ggimage_0.3.3.tar.gz)
|ggiraph|0.8.10|[https://cran.r-project.org/web/packages/ggiraph/index.html] (https://cran.r-project.org/web/packages/ggiraph/index.html)
|ggjoy|0.4.1|[https://cran.r-project.org/src/contrib/ggjoy_0.4.1.tar.gz] (https://cran.r-project.org/src/contrib/ggjoy_0.4.1.tar.gz)
|ggm|2.3|[https://cran.r-project.org/web/packages/ggm/index.html] (https://cran.r-project.org/web/packages/ggm/index.html)
|ggmap|4.0.0|[https://cran.r-project.org/src/contrib/ggmap_4.0.0.tar.gz] (https://cran.r-project.org/src/contrib/ggmap_4.0.0.tar.gz)
|ggmcmc|1.5.1.1|[https://cran.r-project.org/src/contrib/ggmcmc_1.5.1.1.tar.gz] (https://cran.r-project.org/src/contrib/ggmcmc_1.5.1.1.tar.gz)
|ggplot2|3.5.1|[https://cran.r-project.org/src/contrib/ggplot2_3.5.1.tar.gz] (https://cran.r-project.org/src/contrib/ggplot2_3.5.1.tar.gz)
|ggplot2movies|0.0.1|[https://cran.r-project.org/src/contrib/ggplot2movies_0.0.1.tar.gz] (https://cran.r-project.org/src/contrib/ggplot2movies_0.0.1.tar.gz)
|ggplotify|0.1.2|[https://cran.r-project.org/src/contrib/ggplotify_0.1.2.tar.gz] (https://cran.r-project.org/src/contrib/ggplotify_0.1.2.tar.gz)
|ggpmisc|0.6.0|[https://cran.r-project.org/web/packages/ggpmisc/index.html] (https://cran.r-project.org/web/packages/ggpmisc/index.html)
|ggpp|0.5.8-1|[https://cran.r-project.org/src/contrib/ggpp_0.5.8-1.tar.gz] (https://cran.r-project.org/src/contrib/ggpp_0.5.8-1.tar.gz)
|ggpubr|0.6.0|[https://cran.r-project.org/src/contrib/ggpubr_0.6.0.tar.gz] (https://cran.r-project.org/src/contrib/ggpubr_0.6.0.tar.gz)
|ggQC|0.0.31|[https://cran.r-project.org/src/contrib/ggQC_0.0.31.tar.gz] (https://cran.r-project.org/src/contrib/ggQC_0.0.31.tar.gz)
|ggRandomForests|2.2.1|[https://cran.r-project.org/src/contrib/ggRandomForests_2.2.1.tar.gz] (https://cran.r-project.org/src/contrib/ggRandomForests_2.2.1.tar.gz)
|ggraph|2.2.1|[https://cran.r-project.org/src/contrib/ggraph_2.2.1.tar.gz] (https://cran.r-project.org/src/contrib/ggraph_2.2.1.tar.gz)
|ggrepel|0.9.5|[https://cran.r-project.org/web/packages/ggrepel/index.html] (https://cran.r-project.org/web/packages/ggrepel/index.html)
|ggridges|0.5.6|[https://cran.r-project.org/src/contrib/ggridges_0.5.6.tar.gz] (https://cran.r-project.org/src/contrib/ggridges_0.5.6.tar.gz)
|ggsci|3.2.0|[https://cran.r-project.org/src/contrib/ggsci_3.2.0.tar.gz] (https://cran.r-project.org/src/contrib/ggsci_3.2.0.tar.gz)
|ggsignif|0.6.4|[https://cran.r-project.org/src/contrib/ggsignif_0.6.4.tar.gz] (https://cran.r-project.org/src/contrib/ggsignif_0.6.4.tar.gz)
|ggsoccer|0.1.7|[https://cran.r-project.org/web/packages/ggsoccer/index.html] (https://cran.r-project.org/web/packages/ggsoccer/index.html)
|ggstance|0.3.7|[https://cran.r-project.org/src/contrib/ggstance_0.3.7.tar.gz] (https://cran.r-project.org/src/contrib/ggstance_0.3.7.tar.gz)
|ggstats|0.6.0|[https://cran.r-project.org/web/packages/ggstats/index.html] (https://cran.r-project.org/web/packages/ggstats/index.html)
|ggtern|3.5.0|[https://cran.r-project.org/src/contrib/ggtern_3.5.0.tar.gz] (https://cran.r-project.org/src/contrib/ggtern_3.5.0.tar.gz)
|ggtext|0.1.2|[https://cran.r-project.org/src/contrib/ggtext_0.1.2.tar.gz] (https://cran.r-project.org/src/contrib/ggtext_0.1.2.tar.gz)
|ggthemes|5.1.0|[https://cran.r-project.org/src/contrib/ggthemes_5.1.0.tar.gz] (https://cran.r-project.org/src/contrib/ggthemes_5.1.0.tar.gz)
|gh|1.4.1|[https://cran.r-project.org/src/contrib/gh_1.4.1.tar.gz] (https://cran.r-project.org/src/contrib/gh_1.4.1.tar.gz)
|gistr|0.9.0|[https://cran.r-project.org/src/contrib/gistr_0.9.0.tar.gz] (https://cran.r-project.org/src/contrib/gistr_0.9.0.tar.gz)
|git2r|0.33.0|[https://cran.r-project.org/web/packages/git2r/index.html] (https://cran.r-project.org/web/packages/git2r/index.html)
|gitcreds|0.1.2|[https://cran.r-project.org/src/contrib/gitcreds_0.1.2.tar.gz] (https://cran.r-project.org/src/contrib/gitcreds_0.1.2.tar.gz)
|glasso|1.11|[https://cran.r-project.org/src/contrib/glasso_1.11.tar.gz] (https://cran.r-project.org/src/contrib/glasso_1.11.tar.gz)
|glmmTMB|1.1.9|[https://cran.r-project.org/web/packages/glmmTMB/index.html] (https://cran.r-project.org/web/packages/glmmTMB/index.html)
|glmnet|4.1-8|[https://cran.r-project.org/src/contrib/glmnet_4.1-8.tar.gz] (https://cran.r-project.org/src/contrib/glmnet_4.1-8.tar.gz)
|GlobalOptions|0.1.2|[https://cran.r-project.org/src/contrib/GlobalOptions_0.1.2.tar.gz] (https://cran.r-project.org/src/contrib/GlobalOptions_0.1.2.tar.gz)
|globals|0.16.3|[https://cran.r-project.org/src/contrib/globals_0.16.3.tar.gz] (https://cran.r-project.org/src/contrib/globals_0.16.3.tar.gz)
|glue|1.6.2|[https://cran.r-project.org/web/packages/glue/index.html] (https://cran.r-project.org/web/packages/glue/index.html)
|gmodels|2.19.1|[https://cran.r-project.org/src/contrib/gmodels_2.19.1.tar.gz] (https://cran.r-project.org/src/contrib/gmodels_2.19.1.tar.gz)
|gmp|0.7-5|[https://cran.r-project.org/src/contrib/gmp_0.7-5.tar.gz] (https://cran.r-project.org/src/contrib/gmp_0.7-5.tar.gz)
|gnm|1.1-5|[https://cran.r-project.org/src/contrib/gnm_1.1-5.tar.gz] (https://cran.r-project.org/src/contrib/gnm_1.1-5.tar.gz)
|goftest|1.2-3|[https://cran.r-project.org/src/contrib/goftest_1.2-3.tar.gz] (https://cran.r-project.org/src/contrib/goftest_1.2-3.tar.gz)
|googledrive|2.1.1|[https://cran.r-project.org/src/contrib/googledrive_2.1.1.tar.gz] (https://cran.r-project.org/src/contrib/googledrive_2.1.1.tar.gz)
|googlePolylines|0.8.4|[https://cran.r-project.org/web/packages/googlePolylines/index.html] (https://cran.r-project.org/web/packages/googlePolylines/index.html)
|googlesheets4|1.1.1|[https://cran.r-project.org/src/contrib/googlesheets4_1.1.1.tar.gz] (https://cran.r-project.org/src/contrib/googlesheets4_1.1.1.tar.gz)
|googleVis|0.7.3|[https://cran.r-project.org/src/contrib/googleVis_0.7.3.tar.gz] (https://cran.r-project.org/src/contrib/googleVis_0.7.3.tar.gz)
|gower|1.0.1|[https://cran.r-project.org/web/packages/gower/index.html] (https://cran.r-project.org/web/packages/gower/index.html)
|GPArotation|2024.3-1|[https://cran.r-project.org/src/contrib/GPArotation_2024.3-1.tar.gz] (https://cran.r-project.org/src/contrib/GPArotation_2024.3-1.tar.gz)
|GPfit|1.0-8|[https://cran.r-project.org/src/contrib/GPfit_1.0-8.tar.gz] (https://cran.r-project.org/src/contrib/GPfit_1.0-8.tar.gz)
|gplots|3.1.3.1|[https://cran.r-project.org/web/packages/gplots/index.html] (https://cran.r-project.org/web/packages/gplots/index.html)
|graphlayouts|1.1.1|[https://cran.r-project.org/web/packages/graphlayouts/index.html] (https://cran.r-project.org/web/packages/graphlayouts/index.html)
|greybox|2.0.2|[https://cran.r-project.org/web/packages/greybox/index.html] (https://cran.r-project.org/web/packages/greybox/index.html)
|grid|4.3.3|[https://cran.r-project.org/web/packages/grid/index.html] (https://cran.r-project.org/web/packages/grid/index.html)
|gridBase|0.4-7|[https://cran.r-project.org/src/contrib/gridBase_0.4-7.tar.gz] (https://cran.r-project.org/src/contrib/gridBase_0.4-7.tar.gz)
|gridExtra|2.3|[https://cran.r-project.org/src/contrib/gridExtra_2.3.tar.gz] (https://cran.r-project.org/src/contrib/gridExtra_2.3.tar.gz)
|gridGraphics|0.5-1|[https://cran.r-project.org/src/contrib/gridGraphics_0.5-1.tar.gz] (https://cran.r-project.org/src/contrib/gridGraphics_0.5-1.tar.gz)
|gridSVG|1.7-5|[https://cran.r-project.org/src/contrib/gridSVG_1.7-5.tar.gz] (https://cran.r-project.org/src/contrib/gridSVG_1.7-5.tar.gz)
|gridtext|0.1.5|[https://cran.r-project.org/src/contrib/gridtext_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/gridtext_0.1.5.tar.gz)
|grImport|0.9-7|[https://cran.r-project.org/src/contrib/grImport_0.9-7.tar.gz] (https://cran.r-project.org/src/contrib/grImport_0.9-7.tar.gz)
|grImport2|0.3-3|[https://cran.r-project.org/src/contrib/grImport2_0.3-3.tar.gz] (https://cran.r-project.org/src/contrib/grImport2_0.3-3.tar.gz)
|grpreg|3.5.0|[https://cran.r-project.org/src/contrib/grpreg_3.5.0.tar.gz] (https://cran.r-project.org/src/contrib/grpreg_3.5.0.tar.gz)
|gsl|2.1-8|[https://cran.r-project.org/src/contrib/gsl_2.1-8.tar.gz] (https://cran.r-project.org/src/contrib/gsl_2.1-8.tar.gz)
|gss|2.2-7|[https://cran.r-project.org/web/packages/gss/index.html] (https://cran.r-project.org/web/packages/gss/index.html)
|gstat|2.1-2|[https://cran.r-project.org/src/contrib/gstat_2.1-2.tar.gz] (https://cran.r-project.org/src/contrib/gstat_2.1-2.tar.gz)
|gsubfn|0.7|[https://cran.r-project.org/src/contrib/gsubfn_0.7.tar.gz] (https://cran.r-project.org/src/contrib/gsubfn_0.7.tar.gz)
|gtable|0.3.5|[https://cran.r-project.org/web/packages/gtable/index.html] (https://cran.r-project.org/web/packages/gtable/index.html)
|gtools|3.9.5|[https://cran.r-project.org/src/contrib/gtools_3.9.5.tar.gz] (https://cran.r-project.org/src/contrib/gtools_3.9.5.tar.gz)
|gtrendsR|1.5.1|[https://cran.r-project.org/src/contrib/gtrendsR_1.5.1.tar.gz] (https://cran.r-project.org/src/contrib/gtrendsR_1.5.1.tar.gz)
|gWidgets|0.0-54.2|[https://cran.r-project.org/web/packages/gWidgets/index.html] (https://cran.r-project.org/web/packages/gWidgets/index.html)
|gWidgets2|1.0-9|[https://cran.r-project.org/web/packages/gWidgets2/index.html] (https://cran.r-project.org/web/packages/gWidgets2/index.html)
|gWidgets2tcltk|1.0-8|[https://cran.r-project.org/src/contrib/gWidgets2tcltk_1.0-8.tar.gz] (https://cran.r-project.org/src/contrib/gWidgets2tcltk_1.0-8.tar.gz)
|gWidgetsRGtk2|0.0-86.1|[https://cran.r-project.org/web/packages/gWidgetsRGtk2/index.html] (https://cran.r-project.org/web/packages/gWidgetsRGtk2/index.html)
|gWidgetstcltk|0.0-55.1|[https://cran.r-project.org/web/packages/gWidgetstcltk/index.html] (https://cran.r-project.org/web/packages/gWidgetstcltk/index.html)
|haplo.stats|1.9.5.1|[https://cran.r-project.org/web/packages/haplo.stats/index.html] (https://cran.r-project.org/web/packages/haplo.stats/index.html)
|hardhat|1.4.0|[https://cran.r-project.org/src/contrib/hardhat_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/hardhat_1.4.0.tar.gz)
|hash|2.2.6.3|[https://cran.r-project.org/src/contrib/hash_2.2.6.3.tar.gz] (https://cran.r-project.org/src/contrib/hash_2.2.6.3.tar.gz)
|haven|2.5.4|[https://cran.r-project.org/src/contrib/haven_2.5.4.tar.gz] (https://cran.r-project.org/src/contrib/haven_2.5.4.tar.gz)
|hbsae|1.2|[https://cran.r-project.org/src/contrib/hbsae_1.2.tar.gz] (https://cran.r-project.org/src/contrib/hbsae_1.2.tar.gz)
|HDInterval|0.2.4|[https://cran.r-project.org/src/contrib/HDInterval_0.2.4.tar.gz] (https://cran.r-project.org/src/contrib/HDInterval_0.2.4.tar.gz)
|hdrcde|3.4|[https://cran.r-project.org/src/contrib/hdrcde_3.4.tar.gz] (https://cran.r-project.org/src/contrib/hdrcde_3.4.tar.gz)
|heatmaply|1.5.0|[https://cran.r-project.org/src/contrib/heatmaply_1.5.0.tar.gz] (https://cran.r-project.org/src/contrib/heatmaply_1.5.0.tar.gz)
|here|1.0.1|[https://cran.r-project.org/src/contrib/here_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/here_1.0.1.tar.gz)
|hexbin|1.28.4|[https://cran.r-project.org/web/packages/hexbin/index.html] (https://cran.r-project.org/web/packages/hexbin/index.html)
|hflights|0.1|[https://cran.r-project.org/src/contrib/hflights_0.1.tar.gz] (https://cran.r-project.org/src/contrib/hflights_0.1.tar.gz)
|HH|3.1-52|[https://cran.r-project.org/src/contrib/HH_3.1-52.tar.gz] (https://cran.r-project.org/src/contrib/HH_3.1-52.tar.gz)
|highcharter|0.9.4|[https://cran.r-project.org/src/contrib/highcharter_0.9.4.tar.gz] (https://cran.r-project.org/src/contrib/highcharter_0.9.4.tar.gz)
|highr|0.11|[https://cran.r-project.org/src/contrib/highr_0.11.tar.gz] (https://cran.r-project.org/src/contrib/highr_0.11.tar.gz)
|HistData|0.9-1|[https://cran.r-project.org/src/contrib/HistData_0.9-1.tar.gz] (https://cran.r-project.org/src/contrib/HistData_0.9-1.tar.gz)
|Hmisc|5.1-3|[https://cran.r-project.org/web/packages/Hmisc/index.html] (https://cran.r-project.org/src/contrib/Hmisc_5.2-2.tar.gz)
|hms|1.1.3|[https://cran.r-project.org/src/contrib/hms_1.1.3.tar.gz] (https://cran.r-project.org/src/contrib/hms_1.1.3.tar.gz)
|hoardr|0.5.4|
|hrbrthemes|0.8.7|[https://cran.r-project.org/src/contrib/hrbrthemes_0.8.7.tar.gz] (https://cran.r-project.org/src/contrib/hrbrthemes_0.8.7.tar.gz)
|HSAUR|1.3-10|[https://cran.r-project.org/src/contrib/HSAUR_1.3-10.tar.gz] (https://cran.r-project.org/src/contrib/HSAUR_1.3-10.tar.gz)
|htmlTable|2.4.3|[https://cran.r-project.org/src/contrib/htmlTable_2.4.3.tar.gz] (https://cran.r-project.org/src/contrib/htmlTable_2.4.3.tar.gz)
|htmltools|0.5.8.1|[https://cran.r-project.org/src/contrib/htmltools_0.5.8.1.tar.gz] (https://cran.r-project.org/src/contrib/htmltools_0.5.8.1.tar.gz)
|htmlwidgets|1.6.4|[https://cran.r-project.org/src/contrib/htmlwidgets_1.6.4.tar.gz] (https://cran.r-project.org/src/contrib/htmlwidgets_1.6.4.tar.gz)
|hts|6.0.3|[https://cran.r-project.org/src/contrib/hts_6.0.3.tar.gz] (https://cran.r-project.org/src/contrib/hts_6.0.3.tar.gz)
|httpcode|0.3.0|[https://cran.r-project.org/src/contrib/httpcode_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/httpcode_0.3.0.tar.gz)
|httpuv|1.6.15|[https://cran.r-project.org/src/contrib/httpuv_1.6.15.tar.gz] (https://cran.r-project.org/src/contrib/httpuv_1.6.15.tar.gz)
|httr|1.4.7|[https://cran.r-project.org/src/contrib/httr_1.4.7.tar.gz] (https://cran.r-project.org/src/contrib/httr_1.4.7.tar.gz)
|httr2|1.0.3|[https://cran.r-project.org/web/packages/httr2/index.html] (https://cran.r-project.org/web/packages/httr2/index.html)
|huge|1.3.5|[https://cran.r-project.org/src/contrib/huge_1.3.5.tar.gz] (https://cran.r-project.org/src/contrib/huge_1.3.5.tar.gz)
|hunspell|3.0.4|[https://cran.r-project.org/web/packages/hunspell/index.html] (https://cran.r-project.org/web/packages/hunspell/index.html)
|hydroTSM|0.7-0|[https://cran.r-project.org/web/packages/hydroTSM/index.html] (https://cran.r-project.org/web/packages/hydroTSM/index.html)
|hypergeo|1.2-13|[https://cran.r-project.org/src/contrib/hypergeo_1.2-13.tar.gz] (https://cran.r-project.org/src/contrib/hypergeo_1.2-13.tar.gz)
|IBrokers|0.10-2|[https://cran.r-project.org/src/contrib/IBrokers_0.10-2.tar.gz] (https://cran.r-project.org/src/contrib/IBrokers_0.10-2.tar.gz)
|ids|1.0.1|[https://cran.r-project.org/src/contrib/ids_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/ids_1.0.1.tar.gz)
|ifultools|2.0-26|[https://cran.r-project.org/web/packages/ifultools/index.html] (https://cran.r-project.org/web/packages/ifultools/index.html)
|igraph|2.0.3|[https://cran.r-project.org/web/packages/igraph/index.html] (https://cran.r-project.org/web/packages/igraph/index.html)
|imager|1.0.2|[https://cran.r-project.org/src/contrib/imager_1.0.2.tar.gz] (https://cran.r-project.org/src/contrib/imager_1.0.2.tar.gz)
|imputeTS|3.3|[https://cran.r-project.org/src/contrib/imputeTS_3.3.tar.gz] (https://cran.r-project.org/src/contrib/imputeTS_3.3.tar.gz)
|incidence|1.7.5|[https://cran.r-project.org/src/contrib/incidence_1.7.5.tar.gz] (https://cran.r-project.org/src/contrib/incidence_1.7.5.tar.gz)
|infer|1.0.7|[https://cran.r-project.org/src/contrib/infer_1.0.7.tar.gz] (https://cran.r-project.org/src/contrib/infer_1.0.7.tar.gz)
|influenceR|0.1.5|[https://cran.r-project.org/src/contrib/influenceR_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/influenceR_0.1.5.tar.gz)
|ini|0.3.1|[https://cran.r-project.org/src/contrib/ini_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/ini_0.3.1.tar.gz)
|inline|0.3.19|[https://cran.r-project.org/web/packages/inline/index.html] (https://cran.r-project.org/web/packages/inline/index.html)
|insight|0.20.4|[https://cran.r-project.org/web/packages/insight/index.html] (https://cran.r-project.org/web/packages/insight/index.html)
|interp|1.1-6|[https://cran.r-project.org/src/contrib/interp_1.1-6.tar.gz] (https://cran.r-project.org/src/contrib/interp_1.1-6.tar.gz)
|intervals|0.15.5|[https://cran.r-project.org/src/contrib/intervals_0.15.5.tar.gz] (https://cran.r-project.org/src/contrib/intervals_0.15.5.tar.gz)
|inum|1.0-5|[https://cran.r-project.org/src/contrib/inum_1.0-5.tar.gz] (https://cran.r-project.org/src/contrib/inum_1.0-5.tar.gz)
|investr|1.4.2|[https://cran.r-project.org/src/contrib/investr_1.4.2.tar.gz] (https://cran.r-project.org/src/contrib/investr_1.4.2.tar.gz)
|ipred|0.9-15|[https://cran.r-project.org/src/contrib/ipred_0.9-15.tar.gz] (https://cran.r-project.org/src/contrib/ipred_0.9-15.tar.gz)
|IRdisplay|1.1|[https://cran.r-project.org/src/contrib/IRdisplay_1.1.tar.gz] (https://cran.r-project.org/src/contrib/IRdisplay_1.1.tar.gz)
|IRkernel|1.3.2|[https://cran.r-project.org/src/contrib/IRkernel_1.3.2.tar.gz] (https://cran.r-project.org/src/contrib/IRkernel_1.3.2.tar.gz)
|irlba|2.3.5.1|[https://cran.r-project.org/src/contrib/irlba_2.3.5.1.tar.gz] (https://cran.r-project.org/src/contrib/irlba_2.3.5.1.tar.gz)
|irr|0.84.1|[https://cran.r-project.org/src/contrib/irr_0.84.1.tar.gz] (https://cran.r-project.org/src/contrib/irr_0.84.1.tar.gz)
|isoband|0.2.7|[https://cran.r-project.org/src/contrib/isoband_0.2.7.tar.gz] (https://cran.r-project.org/src/contrib/isoband_0.2.7.tar.gz)
|ISOcodes|2024.02.12|[https://cran.r-project.org/src/contrib/ISOcodes_2024.02.12.tar.gz] (https://cran.r-project.org/src/contrib/ISOcodes_2024.02.12.tar.gz)
|iterators|1.0.14|[https://cran.r-project.org/src/contrib/iterators_1.0.14.tar.gz] (https://cran.r-project.org/src/contrib/iterators_1.0.14.tar.gz)
|janeaustenr|1.0.0|[https://cran.r-project.org/src/contrib/janeaustenr_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/janeaustenr_1.0.0.tar.gz)
|janitor|2.2.0|[https://cran.r-project.org/web/packages/janitor/index.html] (https://cran.r-project.org/web/packages/janitor/index.html)
|jmvcore|2.4.7|[https://cran.r-project.org/web/packages/jmvcore/index.html] (https://cran.r-project.org/web/packages/jmvcore/index.html)
|jomo|2.7-6|[https://cran.r-project.org/src/contrib/jomo_2.7-6.tar.gz] (https://cran.r-project.org/src/contrib/jomo_2.7-6.tar.gz)
|jpeg|0.1-10|[https://cran.r-project.org/src/contrib/jpeg_0.1-10.tar.gz] (https://cran.r-project.org/src/contrib/jpeg_0.1-10.tar.gz)
|jqr|1.3.4|[https://cran.r-project.org/web/packages/jqr/index.html] (https://cran.r-project.org/web/packages/jqr/index.html)
|jquerylib|0.1.4|[https://cran.r-project.org/src/contrib/jquerylib_0.1.4.tar.gz] (https://cran.r-project.org/src/contrib/jquerylib_0.1.4.tar.gz)
|jsonify|1.2.2|[https://cran.r-project.org/src/contrib/jsonify_1.2.2.tar.gz] (https://cran.r-project.org/src/contrib/jsonify_1.2.2.tar.gz)
|jsonlite|1.8.7|[https://cran.r-project.org/web/packages/jsonlite/index.html] (https://cran.r-project.org/web/packages/jsonlite/index.html)
|jsonvalidate|1.3.2|[https://cran.r-project.org/src/contrib/jsonvalidate_1.3.2.tar.gz] (https://cran.r-project.org/src/contrib/jsonvalidate_1.3.2.tar.gz)
|jtools|2.3.0|[https://cran.r-project.org/src/contrib/jtools_2.3.0.tar.gz] (https://cran.r-project.org/src/contrib/jtools_2.3.0.tar.gz)
|kableExtra|1.4.0|[https://cran.r-project.org/src/contrib/kableExtra_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/kableExtra_1.4.0.tar.gz)
|Kendall|2.2.1|[https://cran.r-project.org/src/contrib/Kendall_2.2.1.tar.gz] (https://cran.r-project.org/src/contrib/Kendall_2.2.1.tar.gz)
|kernlab|0.9-33|[https://cran.r-project.org/src/contrib/kernlab_0.9-33.tar.gz] (https://cran.r-project.org/src/contrib/kernlab_0.9-33.tar.gz)
|KernSmooth|2.23-24|[https://cran.r-project.org/web/packages/KernSmooth/index.html] (https://cran.r-project.org/web/packages/KernSmooth/index.html)
|kinship2|1.9.6.1|[https://cran.r-project.org/src/contrib/kinship2_1.9.6.1.tar.gz] (https://cran.r-project.org/src/contrib/kinship2_1.9.6.1.tar.gz)
|kknn|1.3.1|[https://cran.r-project.org/src/contrib/kknn_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/kknn_1.3.1.tar.gz)
|klaR|1.7-3|[https://cran.r-project.org/src/contrib/klaR_1.7-3.tar.gz] (https://cran.r-project.org/src/contrib/klaR_1.7-3.tar.gz)
|km.ci|0.5-6|[https://cran.r-project.org/src/contrib/km.ci_0.5-6.tar.gz] (https://cran.r-project.org/src/contrib/km.ci_0.5-6.tar.gz)
|KMsurv|0.1-5|[https://cran.r-project.org/src/contrib/KMsurv_0.1-5.tar.gz] (https://cran.r-project.org/src/contrib/KMsurv_0.1-5.tar.gz)
|knitr|1.48|[https://cran.r-project.org/web/packages/knitr/index.html] (https://cran.r-project.org/web/packages/knitr/index.html)
|ks|1.14.2|[https://cran.r-project.org/web/packages/ks/index.html] (https://cran.r-project.org/web/packages/ks/index.html)
|labeling|0.4.3|[https://cran.r-project.org/src/contrib/labeling_0.4.3.tar.gz] (https://cran.r-project.org/src/contrib/labeling_0.4.3.tar.gz)
|labelled|2.13.0|[https://cran.r-project.org/web/packages/labelled/index.html] (https://cran.r-project.org/web/packages/labelled/index.html)
|laeken|0.5.3|[https://cran.r-project.org/src/contrib/laeken_0.5.3.tar.gz] (https://cran.r-project.org/src/contrib/laeken_0.5.3.tar.gz)
|Lahman|11.0-0|[https://cran.r-project.org/web/packages/Lahman/index.html] (https://cran.r-project.org/web/packages/Lahman/index.html)
|lambda.r|1.2.4|[https://cran.r-project.org/src/contrib/lambda.r_1.2.4.tar.gz] (https://cran.r-project.org/src/contrib/lambda.r_1.2.4.tar.gz)
|lars|1.3|[https://cran.r-project.org/src/contrib/lars_1.3.tar.gz] (https://cran.r-project.org/src/contrib/lars_1.3.tar.gz)
|later|1.3.2|[https://cran.r-project.org/web/packages/later/index.html] (https://cran.r-project.org/web/packages/later/index.html)
|latex2exp|0.9.6|[https://cran.r-project.org/src/contrib/latex2exp_0.9.6.tar.gz] (https://cran.r-project.org/src/contrib/latex2exp_0.9.6.tar.gz)
|lattice|0.22-6|[https://cran.r-project.org/src/contrib/lattice_0.22-6.tar.gz] (https://cran.r-project.org/src/contrib/lattice_0.22-6.tar.gz)
|latticeExtra|0.6-30|[https://cran.r-project.org/src/contrib/latticeExtra_0.6-30.tar.gz] (https://cran.r-project.org/src/contrib/latticeExtra_0.6-30.tar.gz)
|lava|1.8.0|[https://cran.r-project.org/web/packages/lava/index.html] (https://cran.r-project.org/web/packages/lava/index.html)
|lavaan|0.6-18|[https://cran.r-project.org/web/packages/lavaan/index.html] (https://cran.r-project.org/web/packages/lavaan/index.html)
|lazyeval|0.2.2|[https://cran.r-project.org/src/contrib/lazyeval_0.2.2.tar.gz] (https://cran.r-project.org/src/contrib/lazyeval_0.2.2.tar.gz)
|lda|1.5.2|[https://cran.r-project.org/src/contrib/lda_1.5.2.tar.gz] (https://cran.r-project.org/src/contrib/lda_1.5.2.tar.gz)
|leafem|0.2.3|[https://cran.r-project.org/src/contrib/leafem_0.2.3.tar.gz] (https://cran.r-project.org/src/contrib/leafem_0.2.3.tar.gz)
|leaflet|2.2.2|[https://cran.r-project.org/src/contrib/leaflet_2.2.2.tar.gz] (https://cran.r-project.org/src/contrib/leaflet_2.2.2.tar.gz)
|leaflet.esri|1.0.0|[https://cran.r-project.org/src/contrib/leaflet.esri_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/leaflet.esri_1.0.0.tar.gz)
|leaflet.extras|2.0.1|[https://cran.r-project.org/src/contrib/leaflet.extras_2.0.1.tar.gz] (https://cran.r-project.org/src/contrib/leaflet.extras_2.0.1.tar.gz)
|leaflet.providers|2.0.0|[https://cran.r-project.org/src/contrib/leaflet.providers_2.0.0.tar.gz] (https://cran.r-project.org/src/contrib/leaflet.providers_2.0.0.tar.gz)
|leafpop|0.1.0|[https://cran.r-project.org/src/contrib/leafpop_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/leafpop_0.1.0.tar.gz)
|leafsync|0.1.0|[https://cran.r-project.org/src/contrib/leafsync_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/leafsync_0.1.0.tar.gz)
|leaps|3.2|[https://cran.r-project.org/src/contrib/leaps_3.2.tar.gz] (https://cran.r-project.org/src/contrib/leaps_3.2.tar.gz)
|LearnBayes|2.15.1|[https://cran.r-project.org/src/contrib/LearnBayes_2.15.1.tar.gz] (https://cran.r-project.org/src/contrib/LearnBayes_2.15.1.tar.gz)
|lexicon|1.2.1|[https://cran.r-project.org/src/contrib/lexicon_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/lexicon_1.2.1.tar.gz)
|lgr|0.4.4|[https://cran.r-project.org/src/contrib/lgr_0.4.4.tar.gz] (https://cran.r-project.org/src/contrib/lgr_0.4.4.tar.gz)
|lhs|1.2.0|[https://cran.r-project.org/src/contrib/lhs_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/lhs_1.2.0.tar.gz)
|libcoin|1.0-10|[https://cran.r-project.org/src/contrib/libcoin_1.0-10.tar.gz] (https://cran.r-project.org/src/contrib/libcoin_1.0-10.tar.gz)
|LiblineaR|2.10-23|[https://cran.r-project.org/web/packages/LiblineaR/index.html] (https://cran.r-project.org/web/packages/LiblineaR/index.html)
|LICORS|0.2.0|[https://cran.r-project.org/web/packages/LICORS/index.html] (https://cran.r-project.org/web/packages/LICORS/index.html)
|lifecycle|1.0.3|[https://cran.r-project.org/web/packages/lifecycle/index.html] (https://cran.r-project.org/web/packages/lifecycle/index.html)
|likert|1.3.5|[https://cran.r-project.org/src/contrib/likert_1.3.5.tar.gz] (https://cran.r-project.org/src/contrib/likert_1.3.5.tar.gz)
|limSolve|1.5.7.1|[https://cran.r-project.org/src/contrib/limSolve_1.5.7.1.tar.gz] (https://cran.r-project.org/src/contrib/limSolve_1.5.7.1.tar.gz)
|linelist|1.1.4|[https://cran.r-project.org/src/contrib/linelist_1.1.4.tar.gz] (https://cran.r-project.org/src/contrib/linelist_1.1.4.tar.gz)
|linprog|0.9-4|[https://cran.r-project.org/src/contrib/linprog_0.9-4.tar.gz] (https://cran.r-project.org/src/contrib/linprog_0.9-4.tar.gz)
|listenv|0.9.1|[https://cran.r-project.org/src/contrib/listenv_0.9.1.tar.gz] (https://cran.r-project.org/src/contrib/listenv_0.9.1.tar.gz)
|lm.beta|1.7-2|[https://cran.r-project.org/src/contrib/lm.beta_1.7-2.tar.gz] (https://cran.r-project.org/src/contrib/lm.beta_1.7-2.tar.gz)
|lme4|1.1-35.5|[https://cran.r-project.org/web/packages/lme4/index.html] (https://cran.r-project.org/web/packages/lme4/index.html)
|lmm|1.4|[https://cran.r-project.org/src/contrib/lmm_1.4.tar.gz] (https://cran.r-project.org/src/contrib/lmm_1.4.tar.gz)
|lmodel2|1.7-3|[https://cran.r-project.org/web/packages/lmodel2/index.html] (https://cran.r-project.org/web/packages/lmodel2/index.html)
|lmtest|0.9-40|[https://cran.r-project.org/src/contrib/lmtest_0.9-40.tar.gz] (https://cran.r-project.org/src/contrib/lmtest_0.9-40.tar.gz)
|lobstr|1.1.2|[https://cran.r-project.org/src/contrib/lobstr_1.1.2.tar.gz] (https://cran.r-project.org/src/contrib/lobstr_1.1.2.tar.gz)
|locfit|1.5-9.9|[https://cran.r-project.org/web/packages/locfit/index.html] (https://cran.r-project.org/web/packages/locfit/index.html)
|locpol|0.8.0|[https://cran.r-project.org/src/contrib/locpol_0.8.0.tar.gz] (https://cran.r-project.org/src/contrib/locpol_0.8.0.tar.gz)
|LogicReg|1.6.6|[https://cran.r-project.org/src/contrib/LogicReg_1.6.6.tar.gz] (https://cran.r-project.org/src/contrib/LogicReg_1.6.6.tar.gz)
|loo|2.8.0|[https://cran.r-project.org/src/contrib/loo_2.8.0.tar.gz] (https://cran.r-project.org/src/contrib/loo_2.8.0.tar.gz)
|lpSolve|5.6.20|[https://cran.r-project.org/web/packages/lpSolve/index.html] (https://cran.r-project.org/web/packages/lpSolve/index.html)
|lsa|0.73.3|[https://cran.r-project.org/src/contrib/lsa_0.73.3.tar.gz] (https://cran.r-project.org/src/contrib/lsa_0.73.3.tar.gz)
|lsmeans|2.30-0|[https://cran.r-project.org/src/contrib/lsmeans_2.30-0.tar.gz] (https://cran.r-project.org/src/contrib/lsmeans_2.30-0.tar.gz)
|lubridate|1.9.3|[https://cran.r-project.org/web/packages/lubridate/index.html] (https://cran.r-project.org/web/packages/lubridate/index.html)
|lwgeom|0.2-14|[https://cran.r-project.org/src/contrib/lwgeom_0.2-14.tar.gz] (https://cran.r-project.org/src/contrib/lwgeom_0.2-14.tar.gz)
|magic|1.6-1|[https://cran.r-project.org/src/contrib/magic_1.6-1.tar.gz] (https://cran.r-project.org/src/contrib/magic_1.6-1.tar.gz)
|magick|2.8.4|[https://cran.r-project.org/web/packages/magick/index.html] (https://cran.r-project.org/web/packages/magick/index.html)
|magrittr|2.0.3|[https://cran.r-project.org/src/contrib/magrittr_2.0.3.tar.gz] (https://cran.r-project.org/src/contrib/magrittr_2.0.3.tar.gz)
|manipulateWidget|0.11.1|[https://cran.r-project.org/src/contrib/manipulateWidget_0.11.1.tar.gz] (https://cran.r-project.org/src/contrib/manipulateWidget_0.11.1.tar.gz)
|MAPA|2.0.7|[https://cran.r-project.org/src/contrib/MAPA_2.0.7.tar.gz] (https://cran.r-project.org/src/contrib/MAPA_2.0.7.tar.gz)
|mapdata|2.3.1|[https://cran.r-project.org/src/contrib/mapdata_2.3.1.tar.gz] (https://cran.r-project.org/src/contrib/mapdata_2.3.1.tar.gz)
|mapdeck|0.3.5|[https://cran.r-project.org/src/contrib/mapdeck_0.3.5.tar.gz] (https://cran.r-project.org/src/contrib/mapdeck_0.3.5.tar.gz)
|mapproj|1.2.11|[https://cran.r-project.org/src/contrib/mapproj_1.2.11.tar.gz] (https://cran.r-project.org/src/contrib/mapproj_1.2.11.tar.gz)
|maps|3.4.2|[https://cran.r-project.org/web/packages/maps/index.html] (https://cran.r-project.org/web/packages/maps/index.html)
|maptools|1.1-8|[https://cran.r-project.org/web/packages/maptools/index.html] (https://cran.r-project.org/web/packages/maptools/index.html)
|maptree|1.4-8|[https://cran.r-project.org/src/contrib/maptree_1.4-8.tar.gz] (https://cran.r-project.org/src/contrib/maptree_1.4-8.tar.gz)
|mapview|2.11.2|[https://cran.r-project.org/src/contrib/mapview_2.11.2.tar.gz] (https://cran.r-project.org/src/contrib/mapview_2.11.2.tar.gz)
|marima|2.2|[https://cran.r-project.org/src/contrib/marima_2.2.tar.gz] (https://cran.r-project.org/src/contrib/marima_2.2.tar.gz)
|markdown|1.13|[https://cran.r-project.org/src/contrib/markdown_1.13.tar.gz] (https://cran.r-project.org/src/contrib/markdown_1.13.tar.gz)
|MASS|7.3-60.0.1|[https://cran.r-project.org/web/packages/MASS/index.html] (https://cran.r-project.org/web/packages/MASS/index.html)
|Matching|4.10-14|[https://cran.r-project.org/web/packages/Matching/index.html] (https://cran.r-project.org/web/packages/Matching/index.html)
|MatchIt|4.5.5|[https://cran.r-project.org/web/packages/MatchIt/index.html] (https://cran.r-project.org/web/packages/MatchIt/index.html)
|matchmaker|0.1.1|[https://cran.r-project.org/src/contrib/matchmaker_0.1.1.tar.gz] (https://cran.r-project.org/src/contrib/matchmaker_0.1.1.tar.gz)
|mathjaxr|1.6-0|[https://cran.r-project.org/src/contrib/mathjaxr_1.6-0.tar.gz] (https://cran.r-project.org/src/contrib/mathjaxr_1.6-0.tar.gz)
|Matrix|1.6-5|[https://cran.r-project.org/web/packages/Matrix/index.html] (https://cran.r-project.org/web/packages/Matrix/index.html)
|matrixcalc|1.0-6|[https://cran.r-project.org/src/contrib/matrixcalc_1.0-6.tar.gz] (https://cran.r-project.org/src/contrib/matrixcalc_1.0-6.tar.gz)
|MatrixExtra|0.1.15|[https://cran.r-project.org/src/contrib/MatrixExtra_0.1.15.tar.gz] (https://cran.r-project.org/src/contrib/MatrixExtra_0.1.15.tar.gz)
|MatrixModels|0.5-3|[https://cran.r-project.org/src/contrib/MatrixModels_0.5-3.tar.gz] (https://cran.r-project.org/src/contrib/MatrixModels_0.5-3.tar.gz)
|matrixStats|1.4.0|[https://cran.r-project.org/web/packages/matrixStats/index.html] (https://cran.r-project.org/web/packages/matrixStats/index.html)
|maxLik|1.5-2.1|[https://cran.r-project.org/src/contrib/maxLik_1.5-2.1.tar.gz] (https://cran.r-project.org/src/contrib/maxLik_1.5-2.1.tar.gz)
|maxstat|0.7-25|[https://cran.r-project.org/src/contrib/maxstat_0.7-25.tar.gz] (https://cran.r-project.org/src/contrib/maxstat_0.7-25.tar.gz)
|mboost|2.9-11|[https://cran.r-project.org/src/contrib/mboost_2.9-11.tar.gz] (https://cran.r-project.org/src/contrib/mboost_2.9-11.tar.gz)
|mclust|6.1.1|[https://cran.r-project.org/src/contrib/mclust_6.1.1.tar.gz] (https://cran.r-project.org/src/contrib/mclust_6.1.1.tar.gz)
|mcmc|0.9-8|[https://cran.r-project.org/src/contrib/mcmc_0.9-8.tar.gz] (https://cran.r-project.org/src/contrib/mcmc_0.9-8.tar.gz)
|MCMCglmm|2.36|[https://cran.r-project.org/src/contrib/MCMCglmm_2.36.tar.gz] (https://cran.r-project.org/src/contrib/MCMCglmm_2.36.tar.gz)
|MCMCpack|1.7-1|[https://cran.r-project.org/src/contrib/MCMCpack_1.7-1.tar.gz] (https://cran.r-project.org/src/contrib/MCMCpack_1.7-1.tar.gz)
|mda|0.5-4|[https://cran.r-project.org/web/packages/mda/index.html] (https://cran.r-project.org/web/packages/mda/index.html)
|memoise|2.0.1|[https://cran.r-project.org/src/contrib/memoise_2.0.1.tar.gz] (https://cran.r-project.org/src/contrib/memoise_2.0.1.tar.gz)
|merTools|0.6.2|[https://cran.r-project.org/src/contrib/merTools_0.6.2.tar.gz] (https://cran.r-project.org/src/contrib/merTools_0.6.2.tar.gz)
|meta|7.0-0|[https://cran.r-project.org/web/packages/meta/index.html] (https://cran.r-project.org/web/packages/meta/index.html)
|metadat|1.2-0|[https://cran.r-project.org/src/contrib/metadat_1.2-0.tar.gz] (https://cran.r-project.org/src/contrib/metadat_1.2-0.tar.gz)
|metafor|4.6-0|[https://cran.r-project.org/src/contrib/metafor_4.6-0.tar.gz] (https://cran.r-project.org/src/contrib/metafor_4.6-0.tar.gz)
|mgcv|1.9-1|[https://cran.r-project.org/src/contrib/mgcv_1.9-1.tar.gz] (https://cran.r-project.org/src/contrib/mgcv_1.9-1.tar.gz)
|mgsub|1.7.3|[https://cran.r-project.org/src/contrib/mgsub_1.7.3.tar.gz] (https://cran.r-project.org/src/contrib/mgsub_1.7.3.tar.gz)
|mi|1.1|[https://cran.r-project.org/src/contrib/mi_1.1.tar.gz] (https://cran.r-project.org/src/contrib/mi_1.1.tar.gz)
|mice|3.16.0|[https://cran.r-project.org/web/packages/mice/index.html] (https://cran.r-project.org/web/packages/mice/index.html)
|microbenchmark|1.5.0|[https://cran.r-project.org/src/contrib/microbenchmark_1.5.0.tar.gz] (https://cran.r-project.org/src/contrib/microbenchmark_1.5.0.tar.gz)
|mime|0.12|[https://cran.r-project.org/src/contrib/mime_0.12.tar.gz] (https://cran.r-project.org/src/contrib/mime_0.12.tar.gz)
|miniCRAN|0.3.0|[https://cran.r-project.org/src/contrib/miniCRAN_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/miniCRAN_0.3.0.tar.gz)
|miniUI|0.1.1.1|[https://cran.r-project.org/src/contrib/miniUI_0.1.1.1.tar.gz] (https://cran.r-project.org/src/contrib/miniUI_0.1.1.1.tar.gz)
|minpack.lm|1.2-4|[https://cran.r-project.org/src/contrib/minpack.lm_1.2-4.tar.gz] (https://cran.r-project.org/src/contrib/minpack.lm_1.2-4.tar.gz)
|minqa|1.2.8|[https://cran.r-project.org/src/contrib/minqa_1.2.8.tar.gz] (https://cran.r-project.org/src/contrib/minqa_1.2.8.tar.gz)
|mirt|1.41|[https://cran.r-project.org/web/packages/mirt/index.html] (https://cran.r-project.org/web/packages/mirt/index.html)
|misc3d|0.9-1|[https://cran.r-project.org/src/contrib/misc3d_0.9-1.tar.gz] (https://cran.r-project.org/src/contrib/misc3d_0.9-1.tar.gz)
|miscTools|0.6-28|[https://cran.r-project.org/src/contrib/miscTools_0.6-28.tar.gz] (https://cran.r-project.org/src/contrib/miscTools_0.6-28.tar.gz)
|mitml|0.4-5|[https://cran.r-project.org/src/contrib/mitml_0.4-5.tar.gz] (https://cran.r-project.org/src/contrib/mitml_0.4-5.tar.gz)
|mitools|2.4|[https://cran.r-project.org/src/contrib/mitools_2.4.tar.gz] (https://cran.r-project.org/src/contrib/mitools_2.4.tar.gz)
|mixtools|2.0.0|[https://cran.r-project.org/src/contrib/mixtools_2.0.0.tar.gz] (https://cran.r-project.org/src/contrib/mixtools_2.0.0.tar.gz)
|mlapi|0.1.1|[https://cran.r-project.org/src/contrib/mlapi_0.1.1.tar.gz] (https://cran.r-project.org/src/contrib/mlapi_0.1.1.tar.gz)
|mlbench|2.1-5|[https://cran.r-project.org/web/packages/mlbench/index.html] (https://cran.r-project.org/web/packages/mlbench/index.html)
|mlogitBMA|0.1-7|[https://cran.r-project.org/web/packages/mlogitBMA/index.html] (https://cran.r-project.org/web/packages/mlogitBMA/index.html)
|mnormt|2.1.1|[https://cran.r-project.org/src/contrib/mnormt_2.1.1.tar.gz] (https://cran.r-project.org/src/contrib/mnormt_2.1.1.tar.gz)
|MNP|3.1-5|[https://cran.r-project.org/src/contrib/MNP_3.1-5.tar.gz] (https://cran.r-project.org/src/contrib/MNP_3.1-5.tar.gz)
|modeldata|1.4.0|[https://cran.r-project.org/src/contrib/modeldata_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/modeldata_1.4.0.tar.gz)
|modelenv|0.1.1|[https://cran.r-project.org/web/packages/modelenv/index.html] (https://cran.r-project.org/web/packages/modelenv/index.html)
|ModelMetrics|1.2.2.2|[https://cran.r-project.org/src/contrib/ModelMetrics_1.2.2.2.tar.gz] (https://cran.r-project.org/src/contrib/ModelMetrics_1.2.2.2.tar.gz)
|modelr|0.1.11|[https://cran.r-project.org/src/contrib/modelr_0.1.11.tar.gz] (https://cran.r-project.org/src/contrib/modelr_0.1.11.tar.gz)
|modeltools|0.2-23|[https://cran.r-project.org/src/contrib/modeltools_0.2-23.tar.gz] (https://cran.r-project.org/src/contrib/modeltools_0.2-23.tar.gz)
|mombf|3.5.4|[https://cran.r-project.org/src/contrib/mombf_3.5.4.tar.gz] (https://cran.r-project.org/src/contrib/mombf_3.5.4.tar.gz)
|moments|0.14.1|[https://cran.r-project.org/src/contrib/moments_0.14.1.tar.gz] (https://cran.r-project.org/src/contrib/moments_0.14.1.tar.gz)
|monomvn|1.9-20|[https://cran.r-project.org/web/packages/monomvn/index.html] (https://cran.r-project.org/web/packages/monomvn/index.html)
|monreg|0.1.4.1|[https://cran.r-project.org/src/contrib/monreg_0.1.4.1.tar.gz] (https://cran.r-project.org/src/contrib/monreg_0.1.4.1.tar.gz)
|mosaic|1.9.1|[https://cran.r-project.org/src/contrib/mosaic_1.9.1.tar.gz] (https://cran.r-project.org/src/contrib/mosaic_1.9.1.tar.gz)
|mosaicCore|0.9.4.0|[https://cran.r-project.org/src/contrib/mosaicCore_0.9.4.0.tar.gz] (https://cran.r-project.org/src/contrib/mosaicCore_0.9.4.0.tar.gz)
|mosaicData|0.20.4|[https://cran.r-project.org/src/contrib/mosaicData_0.20.4.tar.gz] (https://cran.r-project.org/src/contrib/mosaicData_0.20.4.tar.gz)
|msir|1.3.3|[https://cran.r-project.org/src/contrib/msir_1.3.3.tar.gz] (https://cran.r-project.org/src/contrib/msir_1.3.3.tar.gz)
|msm|1.7.1|[https://cran.r-project.org/web/packages/msm/index.html] (https://cran.r-project.org/web/packages/msm/index.html)
|multcomp|1.4-26|[https://cran.r-project.org/src/contrib/multcomp_1.4-26.tar.gz] (https://cran.r-project.org/src/contrib/multcomp_1.4-26.tar.gz)
|multcompView|0.1-10|[https://cran.r-project.org/src/contrib/multcompView_0.1-10.tar.gz] (https://cran.r-project.org/src/contrib/multcompView_0.1-10.tar.gz)
|multicool|1.0.1|[https://cran.r-project.org/src/contrib/multicool_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/multicool_1.0.1.tar.gz)
|munsell|0.5.1|[https://cran.r-project.org/src/contrib/munsell_0.5.1.tar.gz] (https://cran.r-project.org/src/contrib/munsell_0.5.1.tar.gz)
|mvoutlier|2.1.1|[https://cran.r-project.org/src/contrib/mvoutlier_2.1.1.tar.gz] (https://cran.r-project.org/src/contrib/mvoutlier_2.1.1.tar.gz)
|mvtnorm|1.3-1|[https://cran.r-project.org/web/packages/mvtnorm/index.html] (https://cran.r-project.org/web/packages/mvtnorm/index.html)
|NADA|1.6-1.1|[https://cran.r-project.org/src/contrib/NADA_1.6-1.1.tar.gz] (https://cran.r-project.org/src/contrib/NADA_1.6-1.1.tar.gz)
|nanoparquet|0.3.1|[https://cran.r-project.org/src/contrib/nanoparquet_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/nanoparquet_0.3.1.tar.gz)
|NbClust|3.0.1|[https://cran.r-project.org/src/contrib/NbClust_3.0.1.tar.gz] (https://cran.r-project.org/src/contrib/NbClust_3.0.1.tar.gz)
|ncvreg|3.14.3|[https://cran.r-project.org/src/contrib/ncvreg_3.14.3.tar.gz] (https://cran.r-project.org/src/contrib/ncvreg_3.14.3.tar.gz)
|network|1.18.2|[https://cran.r-project.org/web/packages/network/index.html] (https://cran.r-project.org/web/packages/network/index.html)
|networkD3|0.4|[https://cran.r-project.org/src/contrib/networkD3_0.4.tar.gz] (https://cran.r-project.org/src/contrib/networkD3_0.4.tar.gz)
|neuralnet|1.44.2|[https://cran.r-project.org/src/contrib/neuralnet_1.44.2.tar.gz] (https://cran.r-project.org/src/contrib/neuralnet_1.44.2.tar.gz)
|ngram|3.2.3|[https://cran.r-project.org/src/contrib/ngram_3.2.3.tar.gz] (https://cran.r-project.org/src/contrib/ngram_3.2.3.tar.gz)
|nlme|3.1-165|[https://cran.r-project.org/web/packages/nlme/index.html] (https://cran.r-project.org/web/packages/nlme/index.html)
|nloptr|2.1.1|[https://cran.r-project.org/src/contrib/nloptr_2.1.1.tar.gz] (https://cran.r-project.org/src/contrib/nloptr_2.1.1.tar.gz)
|NLP|0.3-0|[https://cran.r-project.org/web/packages/NLP/index.html] (https://cran.r-project.org/web/packages/NLP/index.html)
|nls.multstart|1.3.0|[https://cran.r-project.org/web/packages/nls.multstart/index.html] (https://cran.r-project.org/web/packages/nls.multstart/index.html)
|NMF|0.21.0|[https://cran.r-project.org/web/packages/NMF/index.html] (https://cran.r-project.org/web/packages/NMF/index.html)
|nnet|7.3-19|[https://cran.r-project.org/web/packages/nnet/index.html] (https://cran.r-project.org/web/packages/nnet/index.html)
|nnls|1.5|[https://cran.r-project.org/web/packages/nnls/index.html] (https://cran.r-project.org/web/packages/nnls/index.html)
|nortest|1.0-4|[https://cran.r-project.org/src/contrib/nortest_1.0-4.tar.gz] (https://cran.r-project.org/src/contrib/nortest_1.0-4.tar.gz)
|numbers|0.8-5|[https://cran.r-project.org/src/contrib/numbers_0.8-5.tar.gz] (https://cran.r-project.org/src/contrib/numbers_0.8-5.tar.gz)
|numDeriv|2016.8-1.1|[https://cran.r-project.org/src/contrib/numDeriv_2016.8-1.1.tar.gz] (https://cran.r-project.org/src/contrib/numDeriv_2016.8-1.1.tar.gz)
|numform|0.7.0|[https://cran.r-project.org/src/contrib/numform_0.7.0.tar.gz] (https://cran.r-project.org/src/contrib/numform_0.7.0.tar.gz)
|OceanView|1.0.7|[https://cran.r-project.org/src/contrib/OceanView_1.0.7.tar.gz] (https://cran.r-project.org/src/contrib/OceanView_1.0.7.tar.gz)
|openair|2.18-2|[https://cran.r-project.org/src/contrib/openair_2.18-2.tar.gz] (https://cran.r-project.org/src/contrib/openair_2.18-2.tar.gz)
|openssl|2.2.1|[https://cran.r-project.org/web/packages/openssl/index.html] (https://cran.r-project.org/web/packages/openssl/index.html)
|ordinal|2023.12-4.1|[https://cran.r-project.org/src/contrib/ordinal_2023.12-4.1.tar.gz] (https://cran.r-project.org/src/contrib/ordinal_2023.12-4.1.tar.gz)
|osmar|1.1-7|[https://cran.r-project.org/web/packages/osmar/index.html] (https://cran.r-project.org/web/packages/osmar/index.html)
|outbreaks|1.9.0|[https://cran.r-project.org/src/contrib/outbreaks_1.9.0.tar.gz] (https://cran.r-project.org/src/contrib/outbreaks_1.9.0.tar.gz)
|outliers|0.15|[https://cran.r-project.org/src/contrib/outliers_0.15.tar.gz] (https://cran.r-project.org/src/contrib/outliers_0.15.tar.gz)
|packcircles|0.3.6|[https://cran.r-project.org/web/packages/packcircles/index.html] (https://cran.r-project.org/web/packages/packcircles/index.html)
|padr|0.6.2|[https://cran.r-project.org/web/packages/padr/index.html] (https://cran.r-project.org/web/packages/padr/index.html)
|pan|1.9|[https://cran.r-project.org/src/contrib/pan_1.9.tar.gz] (https://cran.r-project.org/src/contrib/pan_1.9.tar.gz)
|pander|0.6.5|[https://cran.r-project.org/src/contrib/pander_0.6.5.tar.gz] (https://cran.r-project.org/src/contrib/pander_0.6.5.tar.gz)
|parallelly|1.38.0|[https://cran.r-project.org/web/packages/parallelly/index.html] (https://cran.r-project.org/web/packages/parallelly/index.html)
|parameters|0.22.2|[https://cran.r-project.org/web/packages/parameters/index.html] (https://cran.r-project.org/web/packages/parameters/index.html)
|parsnip|1.2.1|[https://cran.r-project.org/src/contrib/parsnip_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/parsnip_1.2.1.tar.gz)
|partitions|1.10-7|[https://cran.r-project.org/src/contrib/partitions_1.10-7.tar.gz] (https://cran.r-project.org/src/contrib/partitions_1.10-7.tar.gz)
|party|1.3-17|[https://cran.r-project.org/src/contrib/party_1.3-17.tar.gz] (https://cran.r-project.org/src/contrib/party_1.3-17.tar.gz)
|partykit|1.2-22|[https://cran.r-project.org/web/packages/partykit/index.html] (https://cran.r-project.org/web/packages/partykit/index.html)
|patchwork|1.2.0|[https://cran.r-project.org/web/packages/patchwork/index.html] (https://cran.r-project.org/web/packages/patchwork/index.html)
|pbapply|1.7-2|[https://cran.r-project.org/src/contrib/pbapply_1.7-2.tar.gz] (https://cran.r-project.org/src/contrib/pbapply_1.7-2.tar.gz)
|pbdZMQ|0.3-10|[https://cran.r-project.org/web/packages/pbdZMQ/index.html] (https://cran.r-project.org/web/packages/pbdZMQ/index.html)
|pbivnorm|0.6.0|[https://cran.r-project.org/src/contrib/pbivnorm_0.6.0.tar.gz] (https://cran.r-project.org/src/contrib/pbivnorm_0.6.0.tar.gz)
|pbkrtest|0.5.3|[https://cran.r-project.org/src/contrib/pbkrtest_0.5.3.tar.gz] (https://cran.r-project.org/src/contrib/pbkrtest_0.5.3.tar.gz)
|PCAmixdata|3.1|[https://cran.r-project.org/src/contrib/PCAmixdata_3.1.tar.gz] (https://cran.r-project.org/src/contrib/PCAmixdata_3.1.tar.gz)
|pcaPP|2.0-5|[https://cran.r-project.org/src/contrib/pcaPP_2.0-5.tar.gz] (https://cran.r-project.org/src/contrib/pcaPP_2.0-5.tar.gz)
|pdc|1.0.3|[https://cran.r-project.org/src/contrib/pdc_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/pdc_1.0.3.tar.gz)
|pegas|1.3|[https://cran.r-project.org/src/contrib/pegas_1.3.tar.gz] (https://cran.r-project.org/src/contrib/pegas_1.3.tar.gz)
|performance|0.12.3|[https://cran.r-project.org/web/packages/performance/index.html] (https://cran.r-project.org/web/packages/performance/index.html)
|PerformanceAnalytics|2.0.4|[https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html] (https://cran.r-project.org/web/packages/PerformanceAnalytics/index.html)
|permute|0.9-7|[https://cran.r-project.org/src/contrib/permute_0.9-7.tar.gz] (https://cran.r-project.org/src/contrib/permute_0.9-7.tar.gz)
|perry|0.3.1|[https://cran.r-project.org/src/contrib/perry_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/perry_0.3.1.tar.gz)
|petrinetR|0.3.0|[https://cran.r-project.org/src/contrib/petrinetR_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/petrinetR_0.3.0.tar.gz)
|pheatmap|1.0.12|[https://cran.r-project.org/src/contrib/pheatmap_1.0.12.tar.gz] (https://cran.r-project.org/src/contrib/pheatmap_1.0.12.tar.gz)
|pillar|1.9.0|[https://cran.r-project.org/web/packages/pillar/index.html] (https://cran.r-project.org/web/packages/pillar/index.html)
|pixmap|0.4-13|[https://cran.r-project.org/src/contrib/pixmap_0.4-13.tar.gz] (https://cran.r-project.org/src/contrib/pixmap_0.4-13.tar.gz)
|pkgbuild|1.4.4|[https://cran.r-project.org/web/packages/pkgbuild/index.html] (https://cran.r-project.org/web/packages/pkgbuild/index.html)
|pkgcache|2.2.2|[https://cran.r-project.org/web/packages/pkgcache/index.html] (https://cran.r-project.org/web/packages/pkgcache/index.html)
|pkgconfig|2.0.3|[https://cran.r-project.org/src/contrib/pkgconfig_2.0.3.tar.gz] (https://cran.r-project.org/src/contrib/pkgconfig_2.0.3.tar.gz)
|pkgdepends|0.7.2|[https://cran.r-project.org/web/packages/pkgdepends/index.html] (https://cran.r-project.org/web/packages/pkgdepends/index.html)
|pkgdown|2.1.0|[https://cran.r-project.org/web/packages/pkgdown/index.html] (https://cran.r-project.org/web/packages/pkgdown/index.html)
|pkgload|1.4.0|[https://cran.r-project.org/src/contrib/pkgload_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/pkgload_1.4.0.tar.gz)
|pkgmaker|0.32.10|[https://cran.r-project.org/web/packages/pkgmaker/index.html] (https://cran.r-project.org/web/packages/pkgmaker/index.html)
|platetools|0.1.7|[https://cran.r-project.org/src/contrib/platetools_0.1.7.tar.gz] (https://cran.r-project.org/src/contrib/platetools_0.1.7.tar.gz)
|plogr|0.2.0|[https://cran.r-project.org/src/contrib/plogr_0.2.0.tar.gz] (https://cran.r-project.org/src/contrib/plogr_0.2.0.tar.gz)
|plot3D|1.4.1|[https://cran.r-project.org/src/contrib/plot3D_1.4.1.tar.gz] (https://cran.r-project.org/src/contrib/plot3D_1.4.1.tar.gz)
|plot3Drgl|1.0.4|[https://cran.r-project.org/src/contrib/plot3Drgl_1.0.4.tar.gz] (https://cran.r-project.org/src/contrib/plot3Drgl_1.0.4.tar.gz)
|plotly|4.10.4|[https://cran.r-project.org/src/contrib/plotly_4.10.4.tar.gz] (https://cran.r-project.org/src/contrib/plotly_4.10.4.tar.gz)
|plotmo|3.6.4|[https://cran.r-project.org/src/contrib/plotmo_3.6.4.tar.gz] (https://cran.r-project.org/src/contrib/plotmo_3.6.4.tar.gz)
|plotrix|3.8-4|[https://cran.r-project.org/src/contrib/plotrix_3.8-4.tar.gz] (https://cran.r-project.org/src/contrib/plotrix_3.8-4.tar.gz)
|pls|2.8-4|[https://cran.r-project.org/web/packages/pls/index.html] (https://cran.r-project.org/web/packages/pls/index.html)
|plyr|1.8.9|[https://cran.r-project.org/src/contrib/plyr_1.8.9.tar.gz] (https://cran.r-project.org/src/contrib/plyr_1.8.9.tar.gz)
|png|0.1-8|[https://cran.r-project.org/src/contrib/png_0.1-8.tar.gz] (https://cran.r-project.org/src/contrib/png_0.1-8.tar.gz)
|polspline|1.1.25|[https://cran.r-project.org/src/contrib/polspline_1.1.25.tar.gz] (https://cran.r-project.org/src/contrib/polspline_1.1.25.tar.gz)
|polyclip|1.10-7|[https://cran.r-project.org/src/contrib/polyclip_1.10-7.tar.gz] (https://cran.r-project.org/src/contrib/polyclip_1.10-7.tar.gz)
|polylabelr|0.2.0|[https://cran.r-project.org/web/packages/polylabelr/index.html] (https://cran.r-project.org/web/packages/polylabelr/index.html)
|polynom|1.4-1|[https://cran.r-project.org/src/contrib/polynom_1.4-1.tar.gz] (https://cran.r-project.org/src/contrib/polynom_1.4-1.tar.gz)
|posterior|1.6.0|[https://cran.r-project.org/src/contrib/posterior_1.6.0.tar.gz] (https://cran.r-project.org/src/contrib/posterior_1.6.0.tar.gz)
|ppcor|1.1|[https://cran.r-project.org/src/contrib/ppcor_1.1.tar.gz] (https://cran.r-project.org/src/contrib/ppcor_1.1.tar.gz)
|prabclus|2.3-3|[https://cran.r-project.org/web/packages/prabclus/index.html] (https://cran.r-project.org/web/packages/prabclus/index.html)
|pracma|2.4.4|[https://cran.r-project.org/src/contrib/pracma_2.4.4.tar.gz] (https://cran.r-project.org/src/contrib/pracma_2.4.4.tar.gz)
|praise|1.0.0|[https://cran.r-project.org/src/contrib/praise_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/praise_1.0.0.tar.gz)
|precrec|0.14.4|[https://cran.r-project.org/src/contrib/precrec_0.14.4.tar.gz] (https://cran.r-project.org/src/contrib/precrec_0.14.4.tar.gz)
|prediction|0.3.18|[https://cran.r-project.org/src/contrib/prediction_0.3.18.tar.gz] (https://cran.r-project.org/src/contrib/prediction_0.3.18.tar.gz)
|PresenceAbsence|1.1.11|[https://cran.r-project.org/src/contrib/PresenceAbsence_1.1.11.tar.gz] (https://cran.r-project.org/src/contrib/PresenceAbsence_1.1.11.tar.gz)
|prettyunits|1.2.0|[https://cran.r-project.org/src/contrib/prettyunits_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/prettyunits_1.2.0.tar.gz)
|pROC|1.18.5|[https://cran.r-project.org/src/contrib/pROC_1.18.5.tar.gz] (https://cran.r-project.org/src/contrib/pROC_1.18.5.tar.gz)
|processmapR|0.5.5|[https://cran.r-project.org/web/packages/processmapR/index.html] (https://cran.r-project.org/web/packages/processmapR/index.html)
|processmonitR|0.1.0|[https://cran.r-project.org/src/contrib/processmonitR_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/processmonitR_0.1.0.tar.gz)
|processx|3.8.4|[https://cran.r-project.org/web/packages/processx/index.html] (https://cran.r-project.org/web/packages/processx/index.html)
|prodlim|2024.06.25|[https://cran.r-project.org/src/contrib/prodlim_2024.06.25.tar.gz] (https://cran.r-project.org/src/contrib/prodlim_2024.06.25.tar.gz)
|profileModel|0.6.1|[https://cran.r-project.org/src/contrib/profileModel_0.6.1.tar.gz] (https://cran.r-project.org/src/contrib/profileModel_0.6.1.tar.gz)
|profvis|0.3.8|[https://cran.r-project.org/web/packages/profvis/index.html] (https://cran.r-project.org/web/packages/profvis/index.html)
|progress|1.2.3|[https://cran.r-project.org/src/contrib/progress_1.2.3.tar.gz] (https://cran.r-project.org/src/contrib/progress_1.2.3.tar.gz)
|progressr|0.14.0|[https://cran.r-project.org/web/packages/progressr/index.html] (https://cran.r-project.org/web/packages/progressr/index.html)
|proj4|1.0-14|[https://cran.r-project.org/src/contrib/proj4_1.0-14.tar.gz] (https://cran.r-project.org/src/contrib/proj4_1.0-14.tar.gz)
|promises|1.3.0|[https://cran.r-project.org/web/packages/promises/index.html] (https://cran.r-project.org/web/packages/promises/index.html)
|prophet|1.0|[https://cran.r-project.org/src/contrib/prophet_1.0.tar.gz] (https://cran.r-project.org/src/contrib/prophet_1.0.tar.gz)
|proto|1.0.0|[https://cran.r-project.org/src/contrib/proto_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/proto_1.0.0.tar.gz)
|protolite|2.3.0|[https://cran.r-project.org/web/packages/protolite/index.html] (https://cran.r-project.org/web/packages/protolite/index.html)
|proxy|0.4-27|[https://cran.r-project.org/src/contrib/proxy_0.4-27.tar.gz] (https://cran.r-project.org/src/contrib/proxy_0.4-27.tar.gz)
|pryr|0.1.6|[https://cran.r-project.org/src/contrib/pryr_0.1.6.tar.gz] (https://cran.r-project.org/src/contrib/pryr_0.1.6.tar.gz)
|ps|1.7.7|[https://cran.r-project.org/web/packages/ps/index.html] (https://cran.r-project.org/web/packages/ps/index.html)
|pscl|1.5.9|[https://cran.r-project.org/src/contrib/pscl_1.5.9.tar.gz] (https://cran.r-project.org/src/contrib/pscl_1.5.9.tar.gz)
|psych|2.4.3|[https://cran.r-project.org/web/packages/psych/index.html] (https://cran.r-project.org/web/packages/psych/index.html)
|purrr|1.0.2|[https://cran.r-project.org/src/contrib/purrr_1.0.2.tar.gz] (https://cran.r-project.org/src/contrib/purrr_1.0.2.tar.gz)
|pwr|1.3-0|[https://cran.r-project.org/src/contrib/pwr_1.3-0.tar.gz] (https://cran.r-project.org/src/contrib/pwr_1.3-0.tar.gz)
|qap|0.1-2|[https://cran.r-project.org/src/contrib/qap_0.1-2.tar.gz] (https://cran.r-project.org/src/contrib/qap_0.1-2.tar.gz)
|qcc|2.7|[https://cran.r-project.org/src/contrib/qcc_2.7.tar.gz] (https://cran.r-project.org/src/contrib/qcc_2.7.tar.gz)
|qdapDictionaries|1.0.7|[https://cran.r-project.org/src/contrib/qdapDictionaries_1.0.7.tar.gz] (https://cran.r-project.org/src/contrib/qdapDictionaries_1.0.7.tar.gz)
|qdapRegex|0.7.8|[https://cran.r-project.org/src/contrib/qdapRegex_0.7.8.tar.gz] (https://cran.r-project.org/src/contrib/qdapRegex_0.7.8.tar.gz)
|qdapTools|1.3.7|[https://cran.r-project.org/src/contrib/qdapTools_1.3.7.tar.gz] (https://cran.r-project.org/src/contrib/qdapTools_1.3.7.tar.gz)
|qgraph|1.9.8|[https://cran.r-project.org/src/contrib/qgraph_1.9.8.tar.gz] (https://cran.r-project.org/src/contrib/qgraph_1.9.8.tar.gz)
|qicharts|0.5.8|[https://cran.r-project.org/src/contrib/qicharts_0.5.8.tar.gz] (https://cran.r-project.org/src/contrib/qicharts_0.5.8.tar.gz)
|qicharts2|0.7.5|[https://cran.r-project.org/src/contrib/qicharts2_0.7.5.tar.gz] (https://cran.r-project.org/src/contrib/qicharts2_0.7.5.tar.gz)
|quadprog|1.5-8|[https://cran.r-project.org/src/contrib/quadprog_1.5-8.tar.gz] (https://cran.r-project.org/src/contrib/quadprog_1.5-8.tar.gz)
|quanteda|3.3.1|[https://cran.r-project.org/web/packages/quanteda/index.html] (https://cran.r-project.org/web/packages/quanteda/index.html)
|quantmod|0.4.26|[https://cran.r-project.org/src/contrib/quantmod_0.4.26.tar.gz] (https://cran.r-project.org/src/contrib/quantmod_0.4.26.tar.gz)
|quantreg|5.98|[https://cran.r-project.org/web/packages/quantreg/index.html] (https://cran.r-project.org/web/packages/quantreg/index.html)
|questionr|0.7.8|[https://cran.r-project.org/src/contrib/questionr_0.7.8.tar.gz] (https://cran.r-project.org/src/contrib/questionr_0.7.8.tar.gz)
|QuickJSR|1.3.1|[https://cran.r-project.org/web/packages/QuickJSR/index.html] (https://cran.r-project.org/web/packages/QuickJSR/index.html)
|qvcalc|1.0.3|[https://cran.r-project.org/src/contrib/qvcalc_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/qvcalc_1.0.3.tar.gz)
|R.cache|0.16.0|[https://cran.r-project.org/src/contrib/R.cache_0.16.0.tar.gz] (https://cran.r-project.org/src/contrib/R.cache_0.16.0.tar.gz)
|R.matlab|3.7.0|[https://cran.r-project.org/src/contrib/R.matlab_3.7.0.tar.gz] (https://cran.r-project.org/src/contrib/R.matlab_3.7.0.tar.gz)
|R.methodsS3|1.8.2|[https://cran.r-project.org/src/contrib/R.methodsS3_1.8.2.tar.gz] (https://cran.r-project.org/src/contrib/R.methodsS3_1.8.2.tar.gz)
|R.oo|1.26.0|[https://cran.r-project.org/web/packages/R.oo/index.html] (https://cran.r-project.org/web/packages/R.oo/index.html)
|R.utils|2.12.3|[https://cran.r-project.org/src/contrib/R.utils_2.12.3.tar.gz] (https://cran.r-project.org/src/contrib/R.utils_2.12.3.tar.gz)
|r2d3|0.2.6|[https://cran.r-project.org/src/contrib/r2d3_0.2.6.tar.gz] (https://cran.r-project.org/src/contrib/r2d3_0.2.6.tar.gz)
|R2HTML|2.3.4|[https://cran.r-project.org/src/contrib/R2HTML_2.3.4.tar.gz] (https://cran.r-project.org/src/contrib/R2HTML_2.3.4.tar.gz)
|R2jags|0.8-5|[https://cran.r-project.org/web/packages/R2jags/index.html] (https://cran.r-project.org/web/packages/R2jags/index.html)
|R2OpenBUGS|3.2-3.2.1|[https://cran.r-project.org/src/contrib/R2OpenBUGS_3.2-3.2.1.tar.gz] (https://cran.r-project.org/src/contrib/R2OpenBUGS_3.2-3.2.1.tar.gz)
|R2WinBUGS|2.1-22.1|[https://cran.r-project.org/src/contrib/R2WinBUGS_2.1-22.1.tar.gz] (https://cran.r-project.org/src/contrib/R2WinBUGS_2.1-22.1.tar.gz)
|R6|2.5.1|[https://cran.r-project.org/src/contrib/R6_2.5.1.tar.gz] (https://cran.r-project.org/src/contrib/R6_2.5.1.tar.gz)
|ragg|1.3.2|[https://cran.r-project.org/web/packages/ragg/index.html] (https://cran.r-project.org/web/packages/ragg/index.html)
|rainbow|3.8|[https://cran.r-project.org/src/contrib/rainbow_3.8.tar.gz] (https://cran.r-project.org/src/contrib/rainbow_3.8.tar.gz)
|ramps|0.6.18|[https://cran.r-project.org/src/contrib/ramps_0.6.18.tar.gz] (https://cran.r-project.org/src/contrib/ramps_0.6.18.tar.gz)
|RandomFields|3.3.14|[https://cran.r-project.org/web/packages/RandomFields/index.html] (https://cran.r-project.org/web/packages/RandomFields/index.html)
|RandomFieldsUtils|1.2.5|[https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html] (https://cran.r-project.org/web/packages/RandomFieldsUtils/index.html)
|randomForest|4.7-1.1|[https://cran.r-project.org/web/packages/randomForest/index.html] (https://cran.r-project.org/web/packages/randomForest/index.html)
|randomForestSRC|3.3.1|[https://cran.r-project.org/web/packages/randomForestSRC/index.html] (https://cran.r-project.org/web/packages/randomForestSRC/index.html)
|ranger|0.16.0|[https://cran.r-project.org/web/packages/ranger/index.html] (https://cran.r-project.org/web/packages/ranger/index.html)
|RApiDatetime|0.0.9|[https://cran.r-project.org/src/contrib/RApiDatetime_0.0.9.tar.gz] (https://cran.r-project.org/src/contrib/RApiDatetime_0.0.9.tar.gz)
|rapidjsonr|1.2.0|[https://cran.r-project.org/src/contrib/rapidjsonr_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/rapidjsonr_1.2.0.tar.gz)
|rappdirs|0.3.3|[https://cran.r-project.org/src/contrib/rappdirs_0.3.3.tar.gz] (https://cran.r-project.org/src/contrib/rappdirs_0.3.3.tar.gz)
|raster|3.6-26|[https://cran.r-project.org/web/packages/raster/index.html] (https://cran.r-project.org/web/packages/raster/index.html)
|rattle|5.5.1|[https://cran.r-project.org/src/contrib/rattle_5.5.1.tar.gz] (https://cran.r-project.org/src/contrib/rattle_5.5.1.tar.gz)
|rayimage|0.10.0|[https://cran.r-project.org/web/packages/rayimage/index.html] (https://cran.r-project.org/web/packages/rayimage/index.html)
|rayshader|0.24.10|[https://cran.r-project.org/web/packages/rayshader/index.html] (https://cran.r-project.org/web/packages/rayshader/index.html)
|rayvertex|0.11.4|[https://cran.r-project.org/src/contrib/rayvertex_0.11.4.tar.gz] (https://cran.r-project.org/src/contrib/rayvertex_0.11.4.tar.gz)
|rbenchmark|1.0.0|[https://cran.r-project.org/src/contrib/rbenchmark_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/rbenchmark_1.0.0.tar.gz)
|rbibutils|2.2.16|[https://cran.r-project.org/web/packages/rbibutils/index.html] (https://cran.r-project.org/web/packages/rbibutils/index.html)
|Rblpapi|0.3.14|[https://cran.r-project.org/web/packages/Rblpapi/index.html] (https://cran.r-project.org/web/packages/Rblpapi/index.html)
|rbokeh|0.5.2|[https://cran.r-project.org/web/packages/rbokeh/index.html] (https://cran.r-project.org/web/packages/rbokeh/index.html)
|rcmdcheck|1.4.0|[https://cran.r-project.org/src/contrib/rcmdcheck_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/rcmdcheck_1.4.0.tar.gz)
|RColorBrewer|1.1-3|[https://cran.r-project.org/src/contrib/RColorBrewer_1.1-3.tar.gz] (https://cran.r-project.org/src/contrib/RColorBrewer_1.1-3.tar.gz)
|Rcpp|1.0.13|[https://cran.r-project.org/web/packages/Rcpp/index.html] (https://cran.r-project.org/web/packages/Rcpp/index.html)
|RcppArmadillo|14.0.0-1|[https://cran.r-project.org/web/packages/RcppArmadillo/index.html] (https://cran.r-project.org/web/packages/RcppArmadillo/index.html)
|RcppDE|0.1.7|[https://cran.r-project.org/src/contrib/RcppDE_0.1.7.tar.gz] (https://cran.r-project.org/src/contrib/RcppDE_0.1.7.tar.gz)
|RcppEigen|0.3.4.0.2|[https://cran.r-project.org/src/contrib/RcppEigen_0.3.4.0.2.tar.gz] (https://cran.r-project.org/src/contrib/RcppEigen_0.3.4.0.2.tar.gz)
|RcppExamples|0.1.9|[https://cran.r-project.org/src/contrib/RcppExamples_0.1.9.tar.gz] (https://cran.r-project.org/src/contrib/RcppExamples_0.1.9.tar.gz)
|RcppParallel|5.1.9|[https://cran.r-project.org/src/contrib/RcppParallel_5.1.9.tar.gz] (https://cran.r-project.org/src/contrib/RcppParallel_5.1.9.tar.gz)
|RcppProgress|0.4.2|[https://cran.r-project.org/src/contrib/RcppProgress_0.4.2.tar.gz] (https://cran.r-project.org/src/contrib/RcppProgress_0.4.2.tar.gz)
|RcppRoll|0.3.1|[https://cran.r-project.org/src/contrib/RcppRoll_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/RcppRoll_0.3.1.tar.gz)
|RcppThread|2.1.7|[https://cran.r-project.org/web/packages/RcppThread/index.html] (https://cran.r-project.org/web/packages/RcppThread/index.html)
|RcppTOML|0.2.2|[https://cran.r-project.org/src/contrib/RcppTOML_0.2.2.tar.gz] (https://cran.r-project.org/src/contrib/RcppTOML_0.2.2.tar.gz)
|RCurl|1.98-1.16|[https://cran.r-project.org/src/contrib/RCurl_1.98-1.16.tar.gz] (https://cran.r-project.org/src/contrib/RCurl_1.98-1.16.tar.gz)
|Rdpack|2.6.1|[https://cran.r-project.org/web/packages/Rdpack/index.html] (https://cran.r-project.org/web/packages/Rdpack/index.html)
|readbitmap|0.1.5|[https://cran.r-project.org/src/contrib/readbitmap_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/readbitmap_0.1.5.tar.gz)
|readr|2.1.5|[https://cran.r-project.org/src/contrib/readr_2.1.5.tar.gz] (https://cran.r-project.org/src/contrib/readr_2.1.5.tar.gz)
|readxl|1.4.3|[https://cran.r-project.org/src/contrib/readxl_1.4.3.tar.gz] (https://cran.r-project.org/src/contrib/readxl_1.4.3.tar.gz)
|recipes|1.1.0|[https://cran.r-project.org/src/contrib/recipes_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/recipes_1.1.0.tar.gz)
|Redmonder|0.2.0|[https://cran.r-project.org/src/contrib/Redmonder_0.2.0.tar.gz] (https://cran.r-project.org/src/contrib/Redmonder_0.2.0.tar.gz)
|registry|0.5-1|[https://cran.r-project.org/src/contrib/registry_0.5-1.tar.gz] (https://cran.r-project.org/src/contrib/registry_0.5-1.tar.gz)
|relaimpo|2.2-7|[https://cran.r-project.org/src/contrib/relaimpo_2.2-7.tar.gz] (https://cran.r-project.org/src/contrib/relaimpo_2.2-7.tar.gz)
|relimp|1.0-5|[https://cran.r-project.org/src/contrib/relimp_1.0-5.tar.gz] (https://cran.r-project.org/src/contrib/relimp_1.0-5.tar.gz)
|rematch|2.0.0|[https://cran.r-project.org/src/contrib/rematch_2.0.0.tar.gz] (https://cran.r-project.org/src/contrib/rematch_2.0.0.tar.gz)
|rematch2|2.1.2|[https://cran.r-project.org/src/contrib/rematch2_2.1.2.tar.gz] (https://cran.r-project.org/src/contrib/rematch2_2.1.2.tar.gz)
|remotes|2.5.0|[https://cran.r-project.org/src/contrib/remotes_2.5.0.tar.gz] (https://cran.r-project.org/src/contrib/remotes_2.5.0.tar.gz)
|Renext|3.1-4|[https://cran.r-project.org/src/contrib/Renext_3.1-4.tar.gz] (https://cran.r-project.org/src/contrib/Renext_3.1-4.tar.gz)
|repr|1.1.6|[https://cran.r-project.org/web/packages/repr/index.html] (https://cran.r-project.org/web/packages/repr/index.html)
|reprex|2.1.1|[https://cran.r-project.org/src/contrib/reprex_2.1.1.tar.gz] (https://cran.r-project.org/src/contrib/reprex_2.1.1.tar.gz)
|reshape|0.8.9|[https://cran.r-project.org/src/contrib/reshape_0.8.9.tar.gz] (https://cran.r-project.org/src/contrib/reshape_0.8.9.tar.gz)
|reshape2|1.4.4|[https://cran.r-project.org/src/contrib/reshape2_1.4.4.tar.gz] (https://cran.r-project.org/src/contrib/reshape2_1.4.4.tar.gz)
|reticulate|1.39.0|[https://cran.r-project.org/web/packages/reticulate/index.html] (https://cran.r-project.org/web/packages/reticulate/index.html)
|rex|1.2.1|[https://cran.r-project.org/src/contrib/rex_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/rex_1.2.1.tar.gz)
|rFerns|5.0.0|[https://cran.r-project.org/src/contrib/rFerns_5.0.0.tar.gz] (https://cran.r-project.org/src/contrib/rFerns_5.0.0.tar.gz)
|rfm|0.3.0|[https://cran.r-project.org/src/contrib/rfm_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/rfm_0.3.0.tar.gz)
|rgdal|1.6-7|[https://cran.r-project.org/web/packages/rgdal/index.html] (https://cran.r-project.org/web/packages/rgdal/index.html)
|rgeos|0.6-4|[https://cran.r-project.org/web/packages/rgeos/index.html] (https://cran.r-project.org/web/packages/rgeos/index.html)
|rgexf|0.16.3|[https://cran.r-project.org/src/contrib/rgexf_0.16.3.tar.gz] (https://cran.r-project.org/src/contrib/rgexf_0.16.3.tar.gz)
|rgl|1.3.1|[https://cran.r-project.org/web/packages/rgl/index.html] (https://cran.r-project.org/web/packages/rgl/index.html)
|RgoogleMaps|1.5.1|[https://cran.r-project.org/src/contrib/RgoogleMaps_1.5.1.tar.gz] (https://cran.r-project.org/src/contrib/RgoogleMaps_1.5.1.tar.gz)
|RGraphics|3.0-2|[https://cran.r-project.org/src/contrib/RGraphics_3.0-2.tar.gz] (https://cran.r-project.org/src/contrib/RGraphics_3.0-2.tar.gz)
|RGtk2|2.20.36.3|[https://cran.r-project.org/web/packages/RGtk2/index.html] (https://cran.r-project.org/web/packages/RGtk2/index.html)
|RhpcBLASctl|0.23-42|[https://cran.r-project.org/src/contrib/RhpcBLASctl_0.23-42.tar.gz] (https://cran.r-project.org/src/contrib/RhpcBLASctl_0.23-42.tar.gz)
|RInside|0.2.18|[https://cran.r-project.org/src/contrib/RInside_0.2.18.tar.gz] (https://cran.r-project.org/src/contrib/RInside_0.2.18.tar.gz)
|rio|1.2.2|[https://cran.r-project.org/web/packages/rio/index.html] (https://cran.r-project.org/web/packages/rio/index.html)
|rjags|4-16|[https://cran.r-project.org/src/contrib/rjags_4-16.tar.gz] (https://cran.r-project.org/src/contrib/rjags_4-16.tar.gz)
|rjson|0.2.21|[https://cran.r-project.org/web/packages/rjson/index.html] (https://cran.r-project.org/web/packages/rjson/index.html)
|RJSONIO|1.3-1.9|[https://cran.r-project.org/src/contrib/RJSONIO_1.3-1.9.tar.gz] (https://cran.r-project.org/src/contrib/RJSONIO_1.3-1.9.tar.gz)
|rlang|1.1.4|
|rlecuyer|0.3-8|[https://cran.r-project.org/src/contrib/rlecuyer_0.3-8.tar.gz] (https://cran.r-project.org/src/contrib/rlecuyer_0.3-8.tar.gz)
|rlist|0.4.6.2|[https://cran.r-project.org/src/contrib/rlist_0.4.6.2.tar.gz] (https://cran.r-project.org/src/contrib/rlist_0.4.6.2.tar.gz)
|rmapshaper|0.5.0|[https://cran.r-project.org/src/contrib/rmapshaper_0.5.0.tar.gz] (https://cran.r-project.org/src/contrib/rmapshaper_0.5.0.tar.gz)
|rmarkdown|2.28|[https://cran.r-project.org/web/packages/rmarkdown/index.html] (https://cran.r-project.org/web/packages/rmarkdown/index.html)
|Rmisc|1.5.1|[https://cran.r-project.org/src/contrib/Rmisc_1.5.1.tar.gz] (https://cran.r-project.org/src/contrib/Rmisc_1.5.1.tar.gz)
|Rmpfr|0.9-5|[https://cran.r-project.org/web/packages/Rmpfr/index.html] (https://cran.r-project.org/web/packages/Rmpfr/index.html)
|rms|6.8-1|[https://cran.r-project.org/web/packages/rms/index.html] (https://cran.r-project.org/web/packages/rms/index.html)
|RMySQL|0.10.28|[https://cran.r-project.org/web/packages/RMySQL/index.html] (https://cran.r-project.org/web/packages/RMySQL/index.html)
|rngtools|1.5.2|[https://cran.r-project.org/src/contrib/rngtools_1.5.2.tar.gz] (https://cran.r-project.org/src/contrib/rngtools_1.5.2.tar.gz)
|robCompositions|2.4.1|[https://cran.r-project.org/src/contrib/robCompositions_2.4.1.tar.gz] (https://cran.r-project.org/src/contrib/robCompositions_2.4.1.tar.gz)
|robfilter|4.1.5|[https://cran.r-project.org/src/contrib/robfilter_4.1.5.tar.gz] (https://cran.r-project.org/src/contrib/robfilter_4.1.5.tar.gz)
|robustbase|0.99-4|[https://cran.r-project.org/web/packages/robustbase/index.html] (https://cran.r-project.org/web/packages/robustbase/index.html)
|robustHD|0.8.1|[https://cran.r-project.org/src/contrib/robustHD_0.8.1.tar.gz] (https://cran.r-project.org/src/contrib/robustHD_0.8.1.tar.gz)
|ROCR|1.0-11|[https://cran.r-project.org/src/contrib/ROCR_1.0-11.tar.gz] (https://cran.r-project.org/src/contrib/ROCR_1.0-11.tar.gz)
|RODBC|1.3-23|[https://cran.r-project.org/web/packages/RODBC/index.html] (https://cran.r-project.org/web/packages/RODBC/index.html)
|Rook|1.2|[https://cran.r-project.org/src/contrib/Rook_1.2.tar.gz] (https://cran.r-project.org/src/contrib/Rook_1.2.tar.gz)
|rootSolve|1.8.2.4|[https://cran.r-project.org/src/contrib/rootSolve_1.8.2.4.tar.gz] (https://cran.r-project.org/src/contrib/rootSolve_1.8.2.4.tar.gz)
|roxygen2|7.3.2|[https://cran.r-project.org/src/contrib/roxygen2_7.3.2.tar.gz] (https://cran.r-project.org/src/contrib/roxygen2_7.3.2.tar.gz)
|rpart|4.1.23|[https://cran.r-project.org/web/packages/rpart/index.html] (https://cran.r-project.org/web/packages/rpart/index.html)
|rpart.plot|3.1.2|[https://cran.r-project.org/src/contrib/rpart.plot_3.1.2.tar.gz] (https://cran.r-project.org/src/contrib/rpart.plot_3.1.2.tar.gz)
|rpivotTable|0.3.0|[https://cran.r-project.org/src/contrib/rpivotTable_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/rpivotTable_0.3.0.tar.gz)
|rprojroot|2.0.4|[https://cran.r-project.org/src/contrib/rprojroot_2.0.4.tar.gz] (https://cran.r-project.org/src/contrib/rprojroot_2.0.4.tar.gz)
|RPushbullet|0.3.4|[https://cran.r-project.org/src/contrib/RPushbullet_0.3.4.tar.gz] (https://cran.r-project.org/src/contrib/RPushbullet_0.3.4.tar.gz)
|rrcov|1.7-6|[https://cran.r-project.org/src/contrib/rrcov_1.7-6.tar.gz] (https://cran.r-project.org/src/contrib/rrcov_1.7-6.tar.gz)
|rsample|1.2.1|[https://cran.r-project.org/src/contrib/rsample_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/rsample_1.2.1.tar.gz)
|rsdmx|0.6-3|[https://cran.r-project.org/web/packages/rsdmx/index.html] (https://cran.r-project.org/web/packages/rsdmx/index.html)
|RSGHB|1.2.2|[https://cran.r-project.org/src/contrib/RSGHB_1.2.2.tar.gz] (https://cran.r-project.org/src/contrib/RSGHB_1.2.2.tar.gz)
|RSNNS|0.4-17|[https://cran.r-project.org/src/contrib/RSNNS_0.4-17.tar.gz] (https://cran.r-project.org/src/contrib/RSNNS_0.4-17.tar.gz)
|Rsolnp|1.16|[https://cran.r-project.org/src/contrib/Rsolnp_1.16.tar.gz] (https://cran.r-project.org/src/contrib/Rsolnp_1.16.tar.gz)
|rsparse|0.5.2|[https://cran.r-project.org/src/contrib/rsparse_0.5.2.tar.gz] (https://cran.r-project.org/src/contrib/rsparse_0.5.2.tar.gz)
|RSpectra|0.16-2|[https://cran.r-project.org/src/contrib/RSpectra_0.16-2.tar.gz] (https://cran.r-project.org/src/contrib/RSpectra_0.16-2.tar.gz)
|RSQLite|2.3.7|[https://cran.r-project.org/web/packages/RSQLite/index.html] (https://cran.r-project.org/web/packages/RSQLite/index.html)
|rstan|2.32.6|[https://cran.r-project.org/src/contrib/rstan_2.32.6.tar.gz] (https://cran.r-project.org/src/contrib/rstan_2.32.6.tar.gz)
|rstantools|2.4.0|[https://cran.r-project.org/src/contrib/rstantools_2.4.0.tar.gz] (https://cran.r-project.org/src/contrib/rstantools_2.4.0.tar.gz)
|rstatix|0.7.2|[https://cran.r-project.org/src/contrib/rstatix_0.7.2.tar.gz] (https://cran.r-project.org/src/contrib/rstatix_0.7.2.tar.gz)
|rstudioapi|0.16.0|[https://cran.r-project.org/web/packages/rstudioapi/index.html] (https://cran.r-project.org/web/packages/rstudioapi/index.html)
|rsvg|2.6.0|[https://cran.r-project.org/web/packages/rsvg/index.html] (https://cran.r-project.org/web/packages/rsvg/index.html)
|RTextTools|1.4.3|[https://cran.r-project.org/src/contrib/RTextTools_1.4.3.tar.gz] (https://cran.r-project.org/src/contrib/RTextTools_1.4.3.tar.gz)
|Rttf2pt1|1.3.12|[https://cran.r-project.org/src/contrib/Rttf2pt1_1.3.12.tar.gz] (https://cran.r-project.org/src/contrib/Rttf2pt1_1.3.12.tar.gz)
|RUnit|0.4.33|[https://cran.r-project.org/src/contrib/RUnit_0.4.33.tar.gz] (https://cran.r-project.org/src/contrib/RUnit_0.4.33.tar.gz)
|runjags|2.2.2-4|[https://cran.r-project.org/src/contrib/runjags_2.2.2-4.tar.gz] (https://cran.r-project.org/src/contrib/runjags_2.2.2-4.tar.gz)
|Runuran|0.38|[https://cran.r-project.org/web/packages/Runuran/index.html] (https://cran.r-project.org/web/packages/Runuran/index.html)
|rvcheck|0.2.1|[https://cran.r-project.org/src/contrib/rvcheck_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/rvcheck_0.2.1.tar.gz)
|rversions|2.1.2|[https://cran.r-project.org/src/contrib/rversions_2.1.2.tar.gz] (https://cran.r-project.org/src/contrib/rversions_2.1.2.tar.gz)
|rvest|1.0.4|[https://cran.r-project.org/src/contrib/rvest_1.0.4.tar.gz] (https://cran.r-project.org/src/contrib/rvest_1.0.4.tar.gz)
|rworldmap|1.3-8|[https://cran.r-project.org/src/contrib/rworldmap_1.3-8.tar.gz] (https://cran.r-project.org/src/contrib/rworldmap_1.3-8.tar.gz)
|rworldxtra|1.01|[https://cran.r-project.org/src/contrib/rworldxtra_1.01.tar.gz] (https://cran.r-project.org/src/contrib/rworldxtra_1.01.tar.gz)
|s2|1.1.7|[https://cran.r-project.org/src/contrib/s2_1.1.7.tar.gz] (https://cran.r-project.org/src/contrib/s2_1.1.7.tar.gz)
|SampleSizeMeans|1.2.3|[https://cran.r-project.org/src/contrib/SampleSizeMeans_1.2.3.tar.gz] (https://cran.r-project.org/src/contrib/SampleSizeMeans_1.2.3.tar.gz)
|SampleSizeProportions|1.1.3|[https://cran.r-project.org/src/contrib/SampleSizeProportions_1.1.3.tar.gz] (https://cran.r-project.org/src/contrib/SampleSizeProportions_1.1.3.tar.gz)
|sandwich|3.1-0|[https://cran.r-project.org/web/packages/sandwich/index.html] (https://cran.r-project.org/web/packages/sandwich/index.html)
|sas7bdat|0.8|[https://cran.r-project.org/src/contrib/sas7bdat_0.8.tar.gz] (https://cran.r-project.org/src/contrib/sas7bdat_0.8.tar.gz)
|sass|0.4.9|[https://cran.r-project.org/src/contrib/sass_0.4.9.tar.gz] (https://cran.r-project.org/src/contrib/sass_0.4.9.tar.gz)
|satellite|1.0.5|[https://cran.r-project.org/src/contrib/satellite_1.0.5.tar.gz] (https://cran.r-project.org/src/contrib/satellite_1.0.5.tar.gz)
|sbgcop|0.980|[https://cran.r-project.org/src/contrib/sbgcop_0.980.tar.gz] (https://cran.r-project.org/src/contrib/sbgcop_0.980.tar.gz)
|scales|1.3.0|[https://cran.r-project.org/src/contrib/scales_1.3.0.tar.gz] (https://cran.r-project.org/src/contrib/scales_1.3.0.tar.gz)
|scatterplot3d|0.3-44|[https://cran.r-project.org/src/contrib/scatterplot3d_0.3-44.tar.gz] (https://cran.r-project.org/src/contrib/scatterplot3d_0.3-44.tar.gz)
|sciplot|1.2-0|[https://cran.r-project.org/src/contrib/sciplot_1.2-0.tar.gz] (https://cran.r-project.org/src/contrib/sciplot_1.2-0.tar.gz)
|segmented|2.1-2|[https://cran.r-project.org/web/packages/segmented/index.html] (https://cran.r-project.org/web/packages/segmented/index.html)
|selectr|0.4-2|[https://cran.r-project.org/src/contrib/selectr_0.4-2.tar.gz] (https://cran.r-project.org/src/contrib/selectr_0.4-2.tar.gz)
|sem|3.1-16|[https://cran.r-project.org/src/contrib/sem_3.1-16.tar.gz] (https://cran.r-project.org/src/contrib/sem_3.1-16.tar.gz)
|sentimentr|2.9.0|[https://cran.r-project.org/src/contrib/sentimentr_2.9.0.tar.gz] (https://cran.r-project.org/src/contrib/sentimentr_2.9.0.tar.gz)
|seqinr|4.2-36|[https://cran.r-project.org/src/contrib/seqinr_4.2-36.tar.gz] (https://cran.r-project.org/src/contrib/seqinr_4.2-36.tar.gz)
|seriation|1.5.6|[https://cran.r-project.org/web/packages/seriation/index.html] (https://cran.r-project.org/web/packages/seriation/index.html)
|servr|0.31|[https://cran.r-project.org/web/packages/servr/index.html] (https://cran.r-project.org/web/packages/servr/index.html)
|sessioninfo|1.2.2|[https://cran.r-project.org/src/contrib/sessioninfo_1.2.2.tar.gz] (https://cran.r-project.org/src/contrib/sessioninfo_1.2.2.tar.gz)
|setRNG|2024.2-1|[https://cran.r-project.org/src/contrib/setRNG_2024.2-1.tar.gz] (https://cran.r-project.org/src/contrib/setRNG_2024.2-1.tar.gz)
|sets|1.0-25|[https://cran.r-project.org/src/contrib/sets_1.0-25.tar.gz] (https://cran.r-project.org/src/contrib/sets_1.0-25.tar.gz)
|sf|1.0-16|[https://cran.r-project.org/web/packages/sf/index.html] (https://cran.r-project.org/web/packages/sf/index.html)
|sfd|0.1.0|[https://cran.r-project.org/src/contrib/sfd_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/sfd_0.1.0.tar.gz)
|sfheaders|0.4.4|[https://cran.r-project.org/src/contrib/sfheaders_0.4.4.tar.gz] (https://cran.r-project.org/src/contrib/sfheaders_0.4.4.tar.gz)
|sfsmisc|1.1-19|[https://cran.r-project.org/web/packages/sfsmisc/index.html] (https://cran.r-project.org/web/packages/sfsmisc/index.html)
|sftime|0.2-0|[https://cran.r-project.org/web/packages/sftime/index.html] (https://cran.r-project.org/web/packages/sftime/index.html)
|sgeostat|1.0-27|[https://cran.r-project.org/src/contrib/sgeostat_1.0-27.tar.gz] (https://cran.r-project.org/src/contrib/sgeostat_1.0-27.tar.gz)
|shades|1.4.0|[https://cran.r-project.org/src/contrib/shades_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/shades_1.4.0.tar.gz)
|shape|1.4.6.1|[https://cran.r-project.org/src/contrib/shape_1.4.6.1.tar.gz] (https://cran.r-project.org/src/contrib/shape_1.4.6.1.tar.gz)
|shapefiles|0.7.2|[https://cran.r-project.org/src/contrib/shapefiles_0.7.2.tar.gz] (https://cran.r-project.org/src/contrib/shapefiles_0.7.2.tar.gz)
|shiny|1.9.1|[https://cran.r-project.org/web/packages/shiny/index.html] (https://cran.r-project.org/web/packages/shiny/index.html)
|shinyBS|0.61.1|[https://cran.r-project.org/src/contrib/shinyBS_0.61.1.tar.gz] (https://cran.r-project.org/src/contrib/shinyBS_0.61.1.tar.gz)
|shinycssloaders|1.1.0|[https://cran.r-project.org/src/contrib/shinycssloaders_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/shinycssloaders_1.1.0.tar.gz)
|shinyjs|2.1.0|[https://cran.r-project.org/src/contrib/shinyjs_2.1.0.tar.gz] (https://cran.r-project.org/src/contrib/shinyjs_2.1.0.tar.gz)
|shinyTime|1.0.3|[https://cran.r-project.org/src/contrib/shinyTime_1.0.3.tar.gz] (https://cran.r-project.org/src/contrib/shinyTime_1.0.3.tar.gz)
|showtext|0.9-7|[https://cran.r-project.org/src/contrib/showtext_0.9-7.tar.gz] (https://cran.r-project.org/src/contrib/showtext_0.9-7.tar.gz)
|showtextdb|3.0|[https://cran.r-project.org/src/contrib/showtextdb_3.0.tar.gz] (https://cran.r-project.org/src/contrib/showtextdb_3.0.tar.gz)
|SimDesign|2.17.1|[https://cran.r-project.org/web/packages/SimDesign/index.html] (https://cran.r-project.org/web/packages/SimDesign/index.html)
|SIS|0.8-8|[https://cran.r-project.org/src/contrib/SIS_0.8-8.tar.gz] (https://cran.r-project.org/src/contrib/SIS_0.8-8.tar.gz)
|SixSigma|0.11.1|[https://cran.r-project.org/src/contrib/SixSigma_0.11.1.tar.gz] (https://cran.r-project.org/src/contrib/SixSigma_0.11.1.tar.gz)
|sjlabelled|1.2.0|[https://cran.r-project.org/src/contrib/sjlabelled_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/sjlabelled_1.2.0.tar.gz)
|sjmisc|2.8.10|[https://cran.r-project.org/src/contrib/sjmisc_2.8.10.tar.gz] (https://cran.r-project.org/src/contrib/sjmisc_2.8.10.tar.gz)
|sjPlot|2.8.16|[https://cran.r-project.org/web/packages/sjPlot/index.html] (https://cran.r-project.org/web/packages/sjPlot/index.html)
|sjstats|0.19.0|[https://cran.r-project.org/src/contrib/sjstats_0.19.0.tar.gz] (https://cran.r-project.org/src/contrib/sjstats_0.19.0.tar.gz)
|skmeans|0.2-17|[https://cran.r-project.org/web/packages/skmeans/index.html] (https://cran.r-project.org/web/packages/skmeans/index.html)
|slam|0.1-53|[https://cran.r-project.org/web/packages/slam/index.html] (https://cran.r-project.org/web/packages/slam/index.html)
|slider|0.3.1|[https://cran.r-project.org/web/packages/slider/index.html] (https://cran.r-project.org/web/packages/slider/index.html)
|sm|2.2-6.0|[https://cran.r-project.org/src/contrib/sm_2.2-6.0.tar.gz] (https://cran.r-project.org/src/contrib/sm_2.2-6.0.tar.gz)
|smooth|4.0.2|[https://cran.r-project.org/web/packages/smooth/index.html] (https://cran.r-project.org/web/packages/smooth/index.html)
|smoothSurv|2.6|[https://cran.r-project.org/src/contrib/smoothSurv_2.6.tar.gz] (https://cran.r-project.org/src/contrib/smoothSurv_2.6.tar.gz)
|sna|2.7-2|[https://cran.r-project.org/web/packages/sna/index.html] (https://cran.r-project.org/web/packages/sna/index.html)
|snakecase|0.11.1|[https://cran.r-project.org/src/contrib/snakecase_0.11.1.tar.gz] (https://cran.r-project.org/src/contrib/snakecase_0.11.1.tar.gz)
|snow|0.4-4|[https://cran.r-project.org/src/contrib/snow_0.4-4.tar.gz] (https://cran.r-project.org/src/contrib/snow_0.4-4.tar.gz)
|SnowballC|0.7.1|[https://cran.r-project.org/src/contrib/SnowballC_0.7.1.tar.gz] (https://cran.r-project.org/src/contrib/SnowballC_0.7.1.tar.gz)
|snowFT|1.6-1|[https://cran.r-project.org/src/contrib/snowFT_1.6-1.tar.gz] (https://cran.r-project.org/src/contrib/snowFT_1.6-1.tar.gz)
|sodium|1.3.1|[https://cran.r-project.org/web/packages/sodium/index.html] (https://cran.r-project.org/web/packages/sodium/index.html)
|sourcetools|0.1.7-1|[https://cran.r-project.org/src/contrib/sourcetools_0.1.7-1.tar.gz] (https://cran.r-project.org/src/contrib/sourcetools_0.1.7-1.tar.gz)
|sp|2.1-4|[https://cran.r-project.org/src/contrib/sp_2.1-4.tar.gz] (https://cran.r-project.org/src/contrib/sp_2.1-4.tar.gz)
|spacefillr|0.3.3|[https://cran.r-project.org/src/contrib/spacefillr_0.3.3.tar.gz] (https://cran.r-project.org/src/contrib/spacefillr_0.3.3.tar.gz)
|spacetime|1.3-2|[https://cran.r-project.org/src/contrib/spacetime_1.3-2.tar.gz] (https://cran.r-project.org/src/contrib/spacetime_1.3-2.tar.gz)
|spacyr|1.3.0|[https://cran.r-project.org/src/contrib/spacyr_1.3.0.tar.gz] (https://cran.r-project.org/src/contrib/spacyr_1.3.0.tar.gz)
|spam|2.10-0|[https://cran.r-project.org/web/packages/spam/index.html] (https://cran.r-project.org/web/packages/spam/index.html)
|SparseM|1.84-2|[https://cran.r-project.org/src/contrib/SparseM_1.84-2.tar.gz] (https://cran.r-project.org/src/contrib/SparseM_1.84-2.tar.gz)
|sparsepp|1.22|[https://cran.r-project.org/src/contrib/sparsepp_1.22.tar.gz] (https://cran.r-project.org/src/contrib/sparsepp_1.22.tar.gz)
|spatial|7.3-17|[https://cran.r-project.org/web/packages/spatial/index.html] (https://cran.r-project.org/web/packages/spatial/index.html)
|spatstat|3.0-7|[https://cran.r-project.org/web/packages/spatstat/index.html] (https://cran.r-project.org/web/packages/spatstat/index.html)
|spatstat.data|3.1-2|[https://cran.r-project.org/web/packages/spatstat.data/index.html] (https://cran.r-project.org/web/packages/spatstat.data/index.html)
|spatstat.explore|3.2-6|[https://cran.r-project.org/web/packages/spatstat.explore/index.html] (https://cran.r-project.org/web/packages/spatstat.explore/index.html)
|spatstat.geom|3.2-9|[https://cran.r-project.org/web/packages/spatstat.geom/index.html] (https://cran.r-project.org/web/packages/spatstat.geom/index.html)
|spatstat.linnet|3.1-4|[https://cran.r-project.org/web/packages/spatstat.linnet/index.html] (https://cran.r-project.org/web/packages/spatstat.linnet/index.html)
|spatstat.model|3.2-10|[https://cran.r-project.org/web/packages/spatstat.model/index.html] (https://cran.r-project.org/web/packages/spatstat.model/index.html)
|spatstat.random|3.2-3|[https://cran.r-project.org/web/packages/spatstat.random/index.html] (https://cran.r-project.org/web/packages/spatstat.random/index.html)
|spatstat.sparse|3.1-0|[https://cran.r-project.org/src/contrib/spatstat.sparse_3.1-0.tar.gz] (https://cran.r-project.org/src/contrib/spatstat.sparse_3.1-0.tar.gz)
|spatstat.univar|3.0-1|[https://cran.r-project.org/web/packages/spatstat.univar/index.html] (https://cran.r-project.org/web/packages/spatstat.univar/index.html)
|spatstat.utils|3.1-0|[https://cran.r-project.org/web/packages/spatstat.utils/index.html] (https://cran.r-project.org/web/packages/spatstat.utils/index.html)
|spBayes|0.4-7|[https://cran.r-project.org/web/packages/spBayes/index.html] (https://cran.r-project.org/web/packages/spBayes/index.html)
|spData|2.3.3|[https://cran.r-project.org/web/packages/spData/index.html] (https://cran.r-project.org/web/packages/spData/index.html)
|spdep|1.3-5|[https://cran.r-project.org/web/packages/spdep/index.html] (https://cran.r-project.org/web/packages/spdep/index.html)
|spikeslab|1.1.6|[https://cran.r-project.org/src/contrib/spikeslab_1.1.6.tar.gz] (https://cran.r-project.org/src/contrib/spikeslab_1.1.6.tar.gz)
|splancs|2.01-45|[https://cran.r-project.org/src/contrib/splancs_2.01-45.tar.gz] (https://cran.r-project.org/src/contrib/splancs_2.01-45.tar.gz)
|splines|4.3.3|[https://cran.r-project.org/web/packages/splines/index.html] (https://cran.r-project.org/web/packages/splines/index.html)
|spls|2.2-3|[https://cran.r-project.org/src/contrib/spls_2.2-3.tar.gz] (https://cran.r-project.org/src/contrib/spls_2.2-3.tar.gz)
|splus2R|1.3-5|[https://cran.r-project.org/src/contrib/splus2R_1.3-5.tar.gz] (https://cran.r-project.org/src/contrib/splus2R_1.3-5.tar.gz)
|spTimer|3.3.2|[https://cran.r-project.org/web/packages/spTimer/index.html] (https://cran.r-project.org/web/packages/spTimer/index.html)
|sqldf|0.4-11|[https://cran.r-project.org/src/contrib/sqldf_0.4-11.tar.gz] (https://cran.r-project.org/src/contrib/sqldf_0.4-11.tar.gz)
|SQUAREM|2021.1|[https://cran.r-project.org/src/contrib/SQUAREM_2021.1.tar.gz] (https://cran.r-project.org/src/contrib/SQUAREM_2021.1.tar.gz)
|sROC|0.1-2|[https://cran.r-project.org/web/packages/sROC/index.html] (https://cran.r-project.org/web/packages/sROC/index.html)
|stabledist|0.7-2|[https://cran.r-project.org/src/contrib/stabledist_0.7-2.tar.gz] (https://cran.r-project.org/src/contrib/stabledist_0.7-2.tar.gz)
|stabs|0.6-4|[https://cran.r-project.org/src/contrib/stabs_0.6-4.tar.gz] (https://cran.r-project.org/src/contrib/stabs_0.6-4.tar.gz)
|StanHeaders|2.32.10|[https://cran.r-project.org/src/contrib/StanHeaders_2.32.10.tar.gz] (https://cran.r-project.org/src/contrib/StanHeaders_2.32.10.tar.gz)
|stars|0.6-6|[https://cran.r-project.org/web/packages/stars/index.html] (https://cran.r-project.org/web/packages/stars/index.html)
|statmod|1.5.0|[https://cran.r-project.org/src/contrib/statmod_1.5.0.tar.gz] (https://cran.r-project.org/src/contrib/statmod_1.5.0.tar.gz)
|statnet.common|4.9.0|[https://cran.r-project.org/web/packages/statnet.common/index.html] (https://cran.r-project.org/web/packages/statnet.common/index.html)
|stepPlr|0.93|[https://cran.r-project.org/src/contrib/stepPlr_0.93.tar.gz] (https://cran.r-project.org/src/contrib/stepPlr_0.93.tar.gz)
|stinepack|1.5|[https://cran.r-project.org/src/contrib/stinepack_1.5.tar.gz] (https://cran.r-project.org/src/contrib/stinepack_1.5.tar.gz)
|stochvol|3.2.4|[https://cran.r-project.org/web/packages/stochvol/index.html] (https://cran.r-project.org/web/packages/stochvol/index.html)
|stopwords|2.3|[https://cran.r-project.org/src/contrib/stopwords_2.3.tar.gz] (https://cran.r-project.org/src/contrib/stopwords_2.3.tar.gz)
|stringdist|0.9.12|[https://cran.r-project.org/web/packages/stringdist/index.html] (https://cran.r-project.org/web/packages/stringdist/index.html)
|stringi|1.8.4|[https://cran.r-project.org/src/contrib/stringi_1.8.4.tar.gz] (https://cran.r-project.org/src/contrib/stringi_1.8.4.tar.gz)
|stringr|1.5.1|[https://cran.r-project.org/src/contrib/stringr_1.5.1.tar.gz] (https://cran.r-project.org/src/contrib/stringr_1.5.1.tar.gz)
|strucchange|1.5-4|[https://cran.r-project.org/src/contrib/strucchange_1.5-4.tar.gz] (https://cran.r-project.org/src/contrib/strucchange_1.5-4.tar.gz)
|styler|1.10.3|[https://cran.r-project.org/src/contrib/styler_1.10.3.tar.gz] (https://cran.r-project.org/src/contrib/styler_1.10.3.tar.gz)
|sugrrants|0.2.9|[https://cran.r-project.org/src/contrib/sugrrants_0.2.9.tar.gz] (https://cran.r-project.org/src/contrib/sugrrants_0.2.9.tar.gz)
|sunburstR|2.1.8|[https://cran.r-project.org/src/contrib/sunburstR_2.1.8.tar.gz] (https://cran.r-project.org/src/contrib/sunburstR_2.1.8.tar.gz)
|SuppDists|1.1-9.8|[https://cran.r-project.org/src/contrib/SuppDists_1.1-9.8.tar.gz] (https://cran.r-project.org/src/contrib/SuppDists_1.1-9.8.tar.gz)
|survey|4.4-2|[https://cran.r-project.org/src/contrib/survey_4.4-2.tar.gz] (https://cran.r-project.org/src/contrib/survey_4.4-2.tar.gz)
|survival|3.7-0|[https://cran.r-project.org/web/packages/survival/index.html] (https://cran.r-project.org/web/packages/survival/index.html)
|survminer|0.4.9|[https://cran.r-project.org/web/packages/survminer/index.html] (https://cran.r-project.org/web/packages/survminer/index.html)
|survMisc|0.5.6|[https://cran.r-project.org/src/contrib/survMisc_0.5.6.tar.gz] (https://cran.r-project.org/src/contrib/survMisc_0.5.6.tar.gz)
|svglite|2.1.3|[https://cran.r-project.org/src/contrib/svglite_2.1.3.tar.gz] (https://cran.r-project.org/src/contrib/svglite_2.1.3.tar.gz)
|svmpath|0.970|[https://cran.r-project.org/src/contrib/svmpath_0.970.tar.gz] (https://cran.r-project.org/src/contrib/svmpath_0.970.tar.gz)
|svUnit|1.0.6|[https://cran.r-project.org/src/contrib/svUnit_1.0.6.tar.gz] (https://cran.r-project.org/src/contrib/svUnit_1.0.6.tar.gz)
|sweep|0.2.5|[https://cran.r-project.org/src/contrib/sweep_0.2.5.tar.gz] (https://cran.r-project.org/src/contrib/sweep_0.2.5.tar.gz)
|sys|3.4.2|[https://cran.r-project.org/web/packages/sys/index.html] (https://cran.r-project.org/web/packages/sys/index.html)
|sysfonts|0.8.9|[https://cran.r-project.org/src/contrib/sysfonts_0.8.9.tar.gz] (https://cran.r-project.org/src/contrib/sysfonts_0.8.9.tar.gz)
|systemfit|1.1-30|[https://cran.r-project.org/src/contrib/systemfit_1.1-30.tar.gz] (https://cran.r-project.org/src/contrib/systemfit_1.1-30.tar.gz)
|systemfonts|1.1.0|
|syuzhet|1.0.7|[https://cran.r-project.org/src/contrib/syuzhet_1.0.7.tar.gz] (https://cran.r-project.org/src/contrib/syuzhet_1.0.7.tar.gz)
|tau|0.0-25|[https://cran.r-project.org/web/packages/tau/index.html] (https://cran.r-project.org/web/packages/tau/index.html)
|tcltk|4.3.3|[https://cran.r-project.org/web/packages/tcltk/index.html] (https://cran.r-project.org/web/packages/tcltk/index.html)
|tcltk2|1.2-11|[https://cran.r-project.org/src/contrib/tcltk2_1.2-11.tar.gz] (https://cran.r-project.org/src/contrib/tcltk2_1.2-11.tar.gz)
|TeachingDemos|2.13|[https://cran.r-project.org/src/contrib/TeachingDemos_2.13.tar.gz] (https://cran.r-project.org/src/contrib/TeachingDemos_2.13.tar.gz)
|tensor|1.5|[https://cran.r-project.org/src/contrib/tensor_1.5.tar.gz] (https://cran.r-project.org/src/contrib/tensor_1.5.tar.gz)
|tensorA|0.36.2.1|[https://cran.r-project.org/src/contrib/tensorA_0.36.2.1.tar.gz] (https://cran.r-project.org/src/contrib/tensorA_0.36.2.1.tar.gz)
|terra|1.7-78|[https://cran.r-project.org/web/packages/terra/index.html] (https://cran.r-project.org/web/packages/terra/index.html)
|terrainmeshr|0.1.0|[https://cran.r-project.org/src/contrib/terrainmeshr_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/terrainmeshr_0.1.0.tar.gz)
|testthat|3.2.1.1|[https://cran.r-project.org/web/packages/testthat/index.html] (https://cran.r-project.org/web/packages/testthat/index.html)
|texreg|1.39.4|[https://cran.r-project.org/src/contrib/texreg_1.39.4.tar.gz] (https://cran.r-project.org/src/contrib/texreg_1.39.4.tar.gz)
|text2vec|0.6.4|[https://cran.r-project.org/src/contrib/text2vec_0.6.4.tar.gz] (https://cran.r-project.org/src/contrib/text2vec_0.6.4.tar.gz)
|textcat|1.0-8|[https://cran.r-project.org/web/packages/textcat/index.html] (https://cran.r-project.org/web/packages/textcat/index.html)
|textclean|0.9.3|[https://cran.r-project.org/src/contrib/textclean_0.9.3.tar.gz] (https://cran.r-project.org/src/contrib/textclean_0.9.3.tar.gz)
|textir|2.0-5|[https://cran.r-project.org/src/contrib/textir_2.0-5.tar.gz] (https://cran.r-project.org/src/contrib/textir_2.0-5.tar.gz)
|textmineR|3.0.5|[https://cran.r-project.org/src/contrib/textmineR_3.0.5.tar.gz] (https://cran.r-project.org/src/contrib/textmineR_3.0.5.tar.gz)
|textshape|1.7.5|[https://cran.r-project.org/src/contrib/textshape_1.7.5.tar.gz] (https://cran.r-project.org/src/contrib/textshape_1.7.5.tar.gz)
|textshaping|0.4.0|[https://cran.r-project.org/web/packages/textshaping/index.html] (https://cran.r-project.org/web/packages/textshaping/index.html)
|tfplot|2021.6-1|[https://cran.r-project.org/src/contrib/tfplot_2021.6-1.tar.gz] (https://cran.r-project.org/src/contrib/tfplot_2021.6-1.tar.gz)
|tframe|2015.12-1.1|[https://cran.r-project.org/src/contrib/tframe_2015.12-1.1.tar.gz] (https://cran.r-project.org/src/contrib/tframe_2015.12-1.1.tar.gz)
|tgp|2.4-23|[https://cran.r-project.org/src/contrib/tgp_2.4-23.tar.gz] (https://cran.r-project.org/src/contrib/tgp_2.4-23.tar.gz)
|TH.data|1.1-2|
|thief|0.3|[https://cran.r-project.org/src/contrib/thief_0.3.tar.gz] (https://cran.r-project.org/src/contrib/thief_0.3.tar.gz)
|threejs|0.3.3|[https://cran.r-project.org/src/contrib/threejs_0.3.3.tar.gz] (https://cran.r-project.org/src/contrib/threejs_0.3.3.tar.gz)
|tibble|3.2.1|[https://cran.r-project.org/src/contrib/tibble_3.2.1.tar.gz] (https://cran.r-project.org/src/contrib/tibble_3.2.1.tar.gz)
|tibbletime|0.1.8|[https://cran.r-project.org/web/packages/tibbletime/index.html] (https://cran.r-project.org/web/packages/tibbletime/index.html)
|tidycensus|1.6.5|[https://cran.r-project.org/web/packages/tidycensus/index.html] (https://cran.r-project.org/web/packages/tidycensus/index.html)
|tidygraph|1.3.0|[https://cran.r-project.org/web/packages/tidygraph/index.html] (https://cran.r-project.org/web/packages/tidygraph/index.html)
|tidymodels|1.2.0|[https://cran.r-project.org/src/contrib/tidymodels_1.2.0.tar.gz] (https://cran.r-project.org/src/contrib/tidymodels_1.2.0.tar.gz)
|tidyquant|1.0.9|[https://cran.r-project.org/web/packages/tidyquant/index.html] (https://cran.r-project.org/web/packages/tidyquant/index.html)
|tidyr|1.3.1|[https://cran.r-project.org/src/contrib/tidyr_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/tidyr_1.3.1.tar.gz)
|tidyselect|1.2.1|[https://cran.r-project.org/src/contrib/tidyselect_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/tidyselect_1.2.1.tar.gz)
|tidytext|0.4.2|[https://cran.r-project.org/src/contrib/tidytext_0.4.2.tar.gz] (https://cran.r-project.org/src/contrib/tidytext_0.4.2.tar.gz)
|tidyverse|2.0.0|[https://cran.r-project.org/src/contrib/tidyverse_2.0.0.tar.gz] (https://cran.r-project.org/src/contrib/tidyverse_2.0.0.tar.gz)
|tiff|0.1-12|[https://cran.r-project.org/src/contrib/tiff_0.1-12.tar.gz] (https://cran.r-project.org/src/contrib/tiff_0.1-12.tar.gz)
|tigris|2.1|[https://cran.r-project.org/src/contrib/tigris_2.1.tar.gz] (https://cran.r-project.org/src/contrib/tigris_2.1.tar.gz)
|timechange|0.3.0|[https://cran.r-project.org/src/contrib/timechange_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/timechange_0.3.0.tar.gz)
|timeDate|4032.109|[https://cran.r-project.org/web/packages/timeDate/index.html] (https://cran.r-project.org/web/packages/timeDate/index.html)
|timelineS|0.1.1|[https://cran.r-project.org/src/contrib/timelineS_0.1.1.tar.gz] (https://cran.r-project.org/src/contrib/timelineS_0.1.1.tar.gz)
|timeSeries|4032.109|[https://cran.r-project.org/web/packages/timeSeries/index.html] (https://cran.r-project.org/web/packages/timeSeries/index.html)
|timetk|2.9.0|[https://cran.r-project.org/src/contrib/timetk_2.9.0.tar.gz] (https://cran.r-project.org/src/contrib/timetk_2.9.0.tar.gz)
|timevis|2.1.0|[https://cran.r-project.org/src/contrib/timevis_2.1.0.tar.gz] (https://cran.r-project.org/src/contrib/timevis_2.1.0.tar.gz)
|tinytex|0.52|[https://cran.r-project.org/web/packages/tinytex/index.html] (https://cran.r-project.org/web/packages/tinytex/index.html)
|tm|0.7-14|[https://cran.r-project.org/web/packages/tm/index.html] (https://cran.r-project.org/web/packages/tm/index.html)
|tmap|3.3-4|[https://cran.r-project.org/src/contrib/tmap_3.3-4.tar.gz] (https://cran.r-project.org/src/contrib/tmap_3.3-4.tar.gz)
|tmaptools|3.1-1|[https://cran.r-project.org/web/packages/tmaptools/index.html] (https://cran.r-project.org/web/packages/tmaptools/index.html)
|TMB|1.9.14|[https://cran.r-project.org/web/packages/TMB/index.html] (https://cran.r-project.org/web/packages/TMB/index.html)
|tmvnsim|1.0-2|[https://cran.r-project.org/src/contrib/tmvnsim_1.0-2.tar.gz] (https://cran.r-project.org/src/contrib/tmvnsim_1.0-2.tar.gz)
|tokenizers|0.3.0|[https://cran.r-project.org/src/contrib/tokenizers_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/tokenizers_0.3.0.tar.gz)
|topicmodels|0.2-16|[https://cran.r-project.org/web/packages/topicmodels/index.html] (https://cran.r-project.org/web/packages/topicmodels/index.html)
|TraMineR|2.2-10|[https://cran.r-project.org/web/packages/TraMineR/index.html] (https://cran.r-project.org/web/packages/TraMineR/index.html)
|transformr|0.1.5|[https://cran.r-project.org/src/contrib/transformr_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/transformr_0.1.5.tar.gz)
|tree|1.0-43|[https://cran.r-project.org/web/packages/tree/index.html] (https://cran.r-project.org/web/packages/tree/index.html)
|treemap|2.4-4|[https://cran.r-project.org/src/contrib/treemap_2.4-4.tar.gz] (https://cran.r-project.org/src/contrib/treemap_2.4-4.tar.gz)
|treemapify|2.5.6|[https://cran.r-project.org/src/contrib/treemapify_2.5.6.tar.gz] (https://cran.r-project.org/src/contrib/treemapify_2.5.6.tar.gz)
|trelliscopejs|0.2.6|[https://cran.r-project.org/src/contrib/trelliscopejs_0.2.6.tar.gz] (https://cran.r-project.org/src/contrib/trelliscopejs_0.2.6.tar.gz)
|triebeard|0.4.1|[https://cran.r-project.org/src/contrib/triebeard_0.4.1.tar.gz] (https://cran.r-project.org/src/contrib/triebeard_0.4.1.tar.gz)
|trimcluster|0.1-5|[https://cran.r-project.org/src/contrib/trimcluster_0.1-5.tar.gz] (https://cran.r-project.org/src/contrib/trimcluster_0.1-5.tar.gz)
|truncnorm|1.0-9|[https://cran.r-project.org/src/contrib/truncnorm_1.0-9.tar.gz] (https://cran.r-project.org/src/contrib/truncnorm_1.0-9.tar.gz)
|TSA|1.3.1|[https://cran.r-project.org/src/contrib/TSA_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/TSA_1.3.1.tar.gz)
|tseries|0.10-57|[https://cran.r-project.org/web/packages/tseries/index.html] (https://cran.r-project.org/web/packages/tseries/index.html)
|tsfeatures|1.1.1|[https://cran.r-project.org/src/contrib/tsfeatures_1.1.1.tar.gz] (https://cran.r-project.org/src/contrib/tsfeatures_1.1.1.tar.gz)
|tsibble|1.1.5|[https://cran.r-project.org/src/contrib/tsibble_1.1.5.tar.gz] (https://cran.r-project.org/src/contrib/tsibble_1.1.5.tar.gz)
|tsintermittent|1.10|[https://cran.r-project.org/src/contrib/tsintermittent_1.10.tar.gz] (https://cran.r-project.org/src/contrib/tsintermittent_1.10.tar.gz)
|tsoutliers|0.6-10|[https://cran.r-project.org/src/contrib/tsoutliers_0.6-10.tar.gz] (https://cran.r-project.org/src/contrib/tsoutliers_0.6-10.tar.gz)
|TSP|1.2-4|[https://cran.r-project.org/src/contrib/TSP_1.2-4.tar.gz] (https://cran.r-project.org/src/contrib/TSP_1.2-4.tar.gz)
|TSstudio|0.1.7|[https://cran.r-project.org/src/contrib/TSstudio_0.1.7.tar.gz] (https://cran.r-project.org/src/contrib/TSstudio_0.1.7.tar.gz)
|TTR|0.24.4|[https://cran.r-project.org/src/contrib/TTR_0.24.4.tar.gz] (https://cran.r-project.org/src/contrib/TTR_0.24.4.tar.gz)
|tune|1.2.1|[https://cran.r-project.org/src/contrib/tune_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/tune_1.2.1.tar.gz)
|tweedie|2.3.5|[https://cran.r-project.org/src/contrib/tweedie_2.3.5.tar.gz] (https://cran.r-project.org/src/contrib/tweedie_2.3.5.tar.gz)
|tweenr|2.0.3|[https://cran.r-project.org/src/contrib/tweenr_2.0.3.tar.gz] (https://cran.r-project.org/src/contrib/tweenr_2.0.3.tar.gz)
|twitteR|1.1.9|[https://cran.r-project.org/src/contrib/twitteR_1.1.9.tar.gz] (https://cran.r-project.org/src/contrib/twitteR_1.1.9.tar.gz)
|tzdb|0.4.0|[https://cran.r-project.org/src/contrib/tzdb_0.4.0.tar.gz] (https://cran.r-project.org/src/contrib/tzdb_0.4.0.tar.gz)
|ucminf|1.2.2|[https://cran.r-project.org/src/contrib/ucminf_1.2.2.tar.gz] (https://cran.r-project.org/src/contrib/ucminf_1.2.2.tar.gz)
|udpipe|0.8.11|[https://cran.r-project.org/src/contrib/udpipe_0.8.11.tar.gz] (https://cran.r-project.org/src/contrib/udpipe_0.8.11.tar.gz)
|udunits2|0.13.2.1|[https://cran.r-project.org/src/contrib/udunits2_0.13.2.1.tar.gz] (https://cran.r-project.org/src/contrib/udunits2_0.13.2.1.tar.gz)
|units|0.8-5|[https://cran.r-project.org/src/contrib/units_0.8-5.tar.gz] (https://cran.r-project.org/src/contrib/units_0.8-5.tar.gz)
|UpSetR|1.4.0|[https://cran.r-project.org/src/contrib/UpSetR_1.4.0.tar.gz] (https://cran.r-project.org/src/contrib/UpSetR_1.4.0.tar.gz)
|urca|1.3-4|[https://cran.r-project.org/src/contrib/urca_1.3-4.tar.gz] (https://cran.r-project.org/src/contrib/urca_1.3-4.tar.gz)
|urlchecker|1.0.1|[https://cran.r-project.org/src/contrib/urlchecker_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/urlchecker_1.0.1.tar.gz)
|urltools|1.7.3|[https://cran.r-project.org/src/contrib/urltools_1.7.3.tar.gz] (https://cran.r-project.org/src/contrib/urltools_1.7.3.tar.gz)
|useful|1.2.6.1|[https://cran.r-project.org/src/contrib/useful_1.2.6.1.tar.gz] (https://cran.r-project.org/src/contrib/useful_1.2.6.1.tar.gz)
|usethis|3.0.0|[https://cran.r-project.org/web/packages/usethis/index.html] (https://cran.r-project.org/web/packages/usethis/index.html)
|UsingR|2.0-7|[https://cran.r-project.org/src/contrib/UsingR_2.0-7.tar.gz] (https://cran.r-project.org/src/contrib/UsingR_2.0-7.tar.gz)
|usmap|0.7.1|[https://cran.r-project.org/src/contrib/usmap_0.7.1.tar.gz] (https://cran.r-project.org/src/contrib/usmap_0.7.1.tar.gz)
|usmapdata|0.3.0|[https://cran.r-project.org/src/contrib/usmapdata_0.3.0.tar.gz] (https://cran.r-project.org/src/contrib/usmapdata_0.3.0.tar.gz)
|utf8|1.2.4|[https://cran.r-project.org/src/contrib/utf8_1.2.4.tar.gz] (https://cran.r-project.org/src/contrib/utf8_1.2.4.tar.gz)
|uuid|1.1-1|[https://cran.r-project.org/web/packages/uuid/index.html] (https://cran.r-project.org/web/packages/uuid/index.html)
|V8|5.0.0|[https://cran.r-project.org/web/packages/V8/index.html] (https://cran.r-project.org/web/packages/V8/index.html)
|vars|1.6-1|[https://cran.r-project.org/src/contrib/vars_1.6-1.tar.gz] (https://cran.r-project.org/src/contrib/vars_1.6-1.tar.gz)
|vcd|1.4-12|[https://cran.r-project.org/web/packages/vcd/index.html] (https://cran.r-project.org/web/packages/vcd/index.html)
|vctrs|0.6.4|[https://cran.r-project.org/web/packages/vctrs/index.html] (https://cran.r-project.org/web/packages/vctrs/index.html)
|vdiffr|1.0.7|[https://cran.r-project.org/web/packages/vdiffr/index.html] (https://cran.r-project.org/web/packages/vdiffr/index.html)
|vegan|2.6-8|[https://cran.r-project.org/src/contrib/vegan_2.6-8.tar.gz] (https://cran.r-project.org/src/contrib/vegan_2.6-8.tar.gz)
|VennDiagram|1.7.3|[https://cran.r-project.org/src/contrib/VennDiagram_1.7.3.tar.gz] (https://cran.r-project.org/src/contrib/VennDiagram_1.7.3.tar.gz)
|VGAM|1.1-11|[https://cran.r-project.org/web/packages/VGAM/index.html] (https://cran.r-project.org/web/packages/VGAM/index.html)
|VIM|6.2.2|[https://cran.r-project.org/src/contrib/VIM_6.2.2.tar.gz] (https://cran.r-project.org/src/contrib/VIM_6.2.2.tar.gz)
|vioplot|0.5.0|[https://cran.r-project.org/src/contrib/vioplot_0.5.0.tar.gz] (https://cran.r-project.org/src/contrib/vioplot_0.5.0.tar.gz)
|viridis|0.6.5|[https://cran.r-project.org/src/contrib/viridis_0.6.5.tar.gz] (https://cran.r-project.org/src/contrib/viridis_0.6.5.tar.gz)
|viridisLite|0.4.2|[https://cran.r-project.org/src/contrib/viridisLite_0.4.2.tar.gz] (https://cran.r-project.org/src/contrib/viridisLite_0.4.2.tar.gz)
|visNetwork|2.1.2|[https://cran.r-project.org/src/contrib/visNetwork_2.1.2.tar.gz] (https://cran.r-project.org/src/contrib/visNetwork_2.1.2.tar.gz)
|vistime|1.2.4|[https://cran.r-project.org/src/contrib/vistime_1.2.4.tar.gz] (https://cran.r-project.org/src/contrib/vistime_1.2.4.tar.gz)
|vroom|1.6.5|[https://cran.r-project.org/src/contrib/vroom_1.6.5.tar.gz] (https://cran.r-project.org/src/contrib/vroom_1.6.5.tar.gz)
|waldo|0.5.3|[https://cran.r-project.org/web/packages/waldo/index.html] (https://cran.r-project.org/web/packages/waldo/index.html)
|warp|0.2.1|[https://cran.r-project.org/src/contrib/warp_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/warp_0.2.1.tar.gz)
|waterfalls|1.0.0|[https://cran.r-project.org/src/contrib/waterfalls_1.0.0.tar.gz] (https://cran.r-project.org/src/contrib/waterfalls_1.0.0.tar.gz)
|wavethresh|4.7.3|[https://cran.r-project.org/src/contrib/wavethresh_4.7.3.tar.gz] (https://cran.r-project.org/src/contrib/wavethresh_4.7.3.tar.gz)
|webshot|0.5.5|[https://cran.r-project.org/src/contrib/webshot_0.5.5.tar.gz] (https://cran.r-project.org/src/contrib/webshot_0.5.5.tar.gz)
|webutils|1.2.1|[https://cran.r-project.org/web/packages/webutils/index.html] (https://cran.r-project.org/web/packages/webutils/index.html)
|WeibullR|1.2.1|[https://cran.r-project.org/src/contrib/WeibullR_1.2.1.tar.gz] (https://cran.r-project.org/src/contrib/WeibullR_1.2.1.tar.gz)
|weights|1.0.4|[https://cran.r-project.org/src/contrib/weights_1.0.4.tar.gz] (https://cran.r-project.org/src/contrib/weights_1.0.4.tar.gz)
|whisker|0.4.1|[https://cran.r-project.org/src/contrib/whisker_0.4.1.tar.gz] (https://cran.r-project.org/src/contrib/whisker_0.4.1.tar.gz)
|widgetframe|0.3.1|[https://cran.r-project.org/src/contrib/widgetframe_0.3.1.tar.gz] (https://cran.r-project.org/src/contrib/widgetframe_0.3.1.tar.gz)
|withr|3.0.1|[https://cran.r-project.org/web/packages/withr/index.html] (https://cran.r-project.org/web/packages/withr/index.html)
|wk|0.9.2|[https://cran.r-project.org/web/packages/wk/index.html] (https://cran.r-project.org/web/packages/wk/index.html)
|wmtsa|2.0-3|[https://cran.r-project.org/web/packages/wmtsa/index.html] (https://cran.r-project.org/web/packages/wmtsa/index.html)
|wordcloud|2.6|[https://cran.r-project.org/src/contrib/wordcloud_2.6.tar.gz] (https://cran.r-project.org/src/contrib/wordcloud_2.6.tar.gz)
|wordcloud2|0.2.1|[https://cran.r-project.org/src/contrib/wordcloud2_0.2.1.tar.gz] (https://cran.r-project.org/src/contrib/wordcloud2_0.2.1.tar.gz)
|workflows|1.1.4|[https://cran.r-project.org/src/contrib/workflows_1.1.4.tar.gz] (https://cran.r-project.org/src/contrib/workflows_1.1.4.tar.gz)
|workflowsets|1.1.0|[https://cran.r-project.org/src/contrib/workflowsets_1.1.0.tar.gz] (https://cran.r-project.org/src/contrib/workflowsets_1.1.0.tar.gz)
|writexl|1.5.0|[https://cran.r-project.org/web/packages/writexl/index.html] (https://cran.r-project.org/web/packages/writexl/index.html)
|xesreadR|0.2.3|[https://cran.r-project.org/src/contrib/xesreadR_0.2.3.tar.gz] (https://cran.r-project.org/src/contrib/xesreadR_0.2.3.tar.gz)
|xfun|0.47|[https://cran.r-project.org/web/packages/xfun/index.html] (https://cran.r-project.org/web/packages/xfun/index.html)
|xgboost|2.1.1.1|[https://cran.r-project.org/web/packages/xgboost/index.html] (https://cran.r-project.org/web/packages/xgboost/index.html)
|XML|3.99-0.17|[https://cran.r-project.org/web/packages/XML/index.html] (https://cran.r-project.org/web/packages/XML/index.html)
|xml2|1.3.6|[https://cran.r-project.org/src/contrib/xml2_1.3.6.tar.gz] (https://cran.r-project.org/src/contrib/xml2_1.3.6.tar.gz)
|xopen|1.0.1|[https://cran.r-project.org/src/contrib/xopen_1.0.1.tar.gz] (https://cran.r-project.org/src/contrib/xopen_1.0.1.tar.gz)
|xplorerr|0.1.2|[https://cran.r-project.org/web/packages/xplorerr/index.html] (https://cran.r-project.org/web/packages/xplorerr/index.html)
|xtable|1.8-4|[https://cran.r-project.org/src/contrib/xtable_1.8-4.tar.gz] (https://cran.r-project.org/src/contrib/xtable_1.8-4.tar.gz)
|xts|0.14.0|[https://cran.r-project.org/web/packages/xts/index.html] (https://cran.r-project.org/web/packages/xts/index.html)
|yaml|2.3.10|[https://cran.r-project.org/src/contrib/yaml_2.3.10.tar.gz] (https://cran.r-project.org/src/contrib/yaml_2.3.10.tar.gz)
|yardstick|1.3.1|[https://cran.r-project.org/src/contrib/yardstick_1.3.1.tar.gz] (https://cran.r-project.org/src/contrib/yardstick_1.3.1.tar.gz)
|yarrr|0.1.5|[https://cran.r-project.org/src/contrib/yarrr_0.1.5.tar.gz] (https://cran.r-project.org/src/contrib/yarrr_0.1.5.tar.gz)
|YieldCurve|5.1|[https://cran.r-project.org/src/contrib/YieldCurve_5.1.tar.gz] (https://cran.r-project.org/src/contrib/YieldCurve_5.1.tar.gz)
|yulab.utils|0.1.7|[https://cran.r-project.org/web/packages/yulab.utils/index.html] (https://cran.r-project.org/web/packages/yulab.utils/index.html)
|zCompositions|1.5.0-4|[https://cran.r-project.org/src/contrib/zCompositions_1.5.0-4.tar.gz] (https://cran.r-project.org/src/contrib/zCompositions_1.5.0-4.tar.gz)
|zeallot|0.1.0|[https://cran.r-project.org/src/contrib/zeallot_0.1.0.tar.gz] (https://cran.r-project.org/src/contrib/zeallot_0.1.0.tar.gz)
|zic|0.9.1|[https://cran.r-project.org/src/contrib/zic_0.9.1.tar.gz] (https://cran.r-project.org/src/contrib/zic_0.9.1.tar.gz)
|zip|2.3.1|[https://cran.r-project.org/src/contrib/zip_2.3.1.tar.gz] (https://cran.r-project.org/src/contrib/zip_2.3.1.tar.gz)
|zipfR|0.6-70|[https://cran.r-project.org/src/contrib/zipfR_0.6-70.tar.gz] (https://cran.r-project.org/src/contrib/zipfR_0.6-70.tar.gz)
|zoo|1.8-12|[https://cran.r-project.org/src/contrib/zoo_1.8-12.tar.gz] (https://cran.r-project.org/src/contrib/zoo_1.8-12.tar.gz)
|base|4.3.3|Built-in|Package
|compiler|4.3.3|Built-in|Package
|datasets|4.3.3|Built-in|Package
|graphics|4.3.3|Built-in|Package
|grDevices|4.3.3|Built-in|Package
|MatrixGenerics|1.14.0|[https://bioconductor.org/packages/MatrixGenerics] (https://bioconductor.org/packages/MatrixGenerics)
|methods|4.3.3|Built-in|Package
|parallel|4.3.3|Built-in|Package
|sparseMatrixStats|1.14.0|[https://github.com/const-ae/sparseMatrixStats] (https://github.com/const-ae/sparseMatrixStats)
|stats|4.3.3|Built-in|Package
|stats4|4.3.3|Built-in|Package
|tools|4.3.3|Built-in|Package
|utils|4.3.3|Built-in|Package




## R packages that are supported in Power BI (non-Premium/Fabric backed workspaces/ Sov. Clouds/China)

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

The following table shows which packages are not supported in the Power BI service.

| Package | Request Date | Reason |
| --- | --- | --- |
| RgoogleMaps |10/05/2016 |Networking is blocked |
| mailR |10/03/2016 |Networking is blocked |
| RevoScaleR |8/30/2016 |Ships only with Microsoft R Server |


## Considerations and limitations

- R visuals are not supported with Service Principal profiles
- The R visuals rendered from the Power BI service (for Premium/ F SKUs) will support payloads of <30Mb
 


## Related content

For more information about R in Power BI, take a look at the following articles:

* [Creating R visuals in the Power BI service](../visuals/service-r-visuals.md)
* [Create Power BI visuals using R](../create-reports/desktop-r-visuals.md)
* [Running R scripts in Power BI Desktop](desktop-r-scripts.md)
* [Using R in Power Query Editor](desktop-r-in-query-editor.md)
