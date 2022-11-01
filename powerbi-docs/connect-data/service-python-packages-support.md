---
title: Learn which Python packages are supported
description: Python packages that are supported and unsupported in Power BI
author: otarb
ms.author: otarb
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 06/26/2020
LocalizationGroup: Connect to data
---
# Create visuals by using Python packages in the Power BI service
You can use the powerful [Python programming language](https://www.python.org/) to create visuals in the Power BI service. Many Python packages are supported in the Power BI service and more are being supported all the time.

The following sections provide an alphabetical table of which Python packages are supported in Power BI. 

## Request support for a new Python package
Supported Python packages for the **Power BI service** are found in the following section, titled **Supported Packages**. If you would like to request support of an Python package not found in that list, please submit your request to [Power BI Ideas](https://ideas.powerbi.com).

## Requirements and Limitations of Python packages
There are a handful of requirements and limitations for Python packages:

* Current Python runtime: Python 3.7.7.
* The Power BI service, for the most part, supports Python packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* The Power BI service supports packages published in PyPI. The service does not support private or custom Python packages. Users are encouraged to make their private packages available on PyPI prior to requesting the package be available in the Power BI service.
* For Python visuals in **Power BI Desktop**, you can install any package, including custom Python packages.
* For security and privacy reasons, Python packages that provide client-server queries over the World-Wide Web in the service, are not supported. Networking is blocked for such attempts.
* The approval process for including a new Python package has a tree of dependencies; some dependencies required to be installed in the service cannot be supported.

## Python packages that are supported in Power BI
The following table shows which packages **are supported** in the Power BI service.


|        Package        |   Version   |                                   Link                                   |
|-----------------------|-------------|--------------------------------------------------------------------------|
|cycler|0.11.0|https://pypi.org/project/cycler|
|joblib|1.1.0|https://pypi.org/project/joblib|
|kiwisolver|1.4.4|https://pypi.org/project/kiwisolver|
|matplotlib|3.2.2|https://pypi.org/project/matplotlib|
|numpy|1.21.6|https://pypi.org/project/numpy|
|packaging|21.3|https://pypi.org/project/packaging|
|pandas|1.3.5|https://pypi.org/project/pandas|
|patsy|0.5.2|https://pypi.org/project/patsy|
|pip|22.1.2|https://pypi.org/project/pip|
|pyparsing|3.0.9|https://pypi.org/project/pyparsing|
|python-dateutil|2.8.2|https://pypi.org/project/python-dateutil|
|pytz|2022.1|https://pypi.org/project/pytz|
|scikit-learn|1.0.2|https://pypi.org/project/scikit-learn|
|scipy|1.7.3|https://pypi.org/project/scipy|
|seaborn|0.11.2|https://pypi.org/project/seaborn|
|setuptools|63.2.0|https://pypi.org/project/setuptools|
|six|1.16.0|https://pypi.org/project/six|
|statsmodels|0.13.2|https://pypi.org/project/statsmodels|
|threadpoolctl|3.1.0|https://pypi.org/project/threadpoolctl|
|typing-extensions|4.3.0|https://pypi.org/project/typing-extensions|
|xgboost|1.6.1|https://pypi.org/project/xgboost|

## Next steps
For more information about Python in Power BI, take a look at the following articles:

* [Create Power BI visuals using Python](desktop-python-visuals.md)
* [Running Python scripts in Power BI Desktop](desktop-python-scripts.md)
* [Using Python in Query Editor](desktop-python-in-query-editor.md)
