---
title: Learn which Python packages are supported
description: Learn which Python packages are supported for Power BI visualizations. You can suggest support for a Python package.
author: otarb
ms.author: otarb
ms.reviewer: ''
ms.custom: ''
ms.service: powerbi
ms.subservice: pbi-data-sources
ms.topic: conceptual
ms.date: 01/13/2023
LocalizationGroup: Connect to data
---
# Learn which Python packages are supported in Power BI

You can use the powerful [Python programming language](https://www.python.org/) to create visuals in Power BI. Many Python packages are supported in Power BI and more are being supported all the time.

The following sections provide an alphabetical table of which Python packages are supported in Power BI.

## Request support for a new Python package

Supported Python packages for Power BI are found in the [following section](#python-packages-that-are-supported-in-power-bi). If you would like to request support of a Python package not found in that list, submit your request to [Power BI Ideas](https://ideas.powerbi.com).

## Requirements and limitations of Python packages

There are a handful of requirements and limitations for Python packages:

* Current Python runtime: Python 3.7.7.
* Power BI, for the most part, supports Python packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* Power BI supports packages published in PyPI. The service doesn't support private or custom Python packages. Users are encouraged to make their private packages available on PyPI prior to requesting the package be available in Power BI.
* For Python visuals in Power BI Desktop, you can install any package, including custom Python packages.
* For security and privacy reasons, Python packages that provide client-server queries over the web in the service, aren't supported. Networking is blocked for such attempts.
* The approval process for including a new Python package has a tree of dependencies. Some dependencies required to be installed in the service can't be supported.

## Python packages that are supported in Power BI

The following table shows which packages **are supported** in Power BI.

|        Package        |   Version   |                                   Link                                   |
|:----------------------|:------------|:-------------------------------------------------------------------------|
| `cycler` | 0.11.0 | [https://pypi.org/project/cycler](https://pypi.org/project/cycler) |
| `joblib` | 1.1.0 | [https://pypi.org/project/joblib](https://pypi.org/project/joblib) |
| `kiwisolver` | 1.4.4 | [https://pypi.org/project/kiwisolver](https://pypi.org/project/kiwisolver) |
| `matplotlib` | 3.2.2 | [https://pypi.org/project/matplotlib](https://pypi.org/project/matplotlib) |
| `numpy` | 1.21.6 | [https://pypi.org/project/numpy](https://pypi.org/project/numpy) |
| `packaging` | 21.3 | [https://pypi.org/project/packaging](https://pypi.org/project/packaging) |
| `pandas` | 1.3.5 | [https://pypi.org/project/pandas](https://pypi.org/project/pandas) |
| `patsy` | 0.5.2 | [https://pypi.org/project/patsy](https://pypi.org/project/patsy) |
| `pip` | 22.1.2 | [https://pypi.org/project/pip](https://pypi.org/project/pip) |
| `pyparsing` | 3.0.9 | [https://pypi.org/project/pyparsing](https://pypi.org/project/pyparsing) |
| `python-dateutil` | 2.8.2 | [https://pypi.org/project/python-dateutil](https://pypi.org/project/python-dateutil) |
| `pytz` | 2022.1 | [https://pypi.org/project/pytz](https://pypi.org/project/pytz) |
| `scikit-learn` | 1.0.2 | [https://pypi.org/project/scikit-learn](https://pypi.org/project/scikit-learn) |
| `scipy` | 1.7.3 | [https://pypi.org/project/scipy](https://pypi.org/project/scipy) |
| `seaborn` | 0.11.2 | [https://pypi.org/project/seaborn](https://pypi.org/project/seaborn) |
| `setuptools` | 63.2.0 | [https://pypi.org/project/setuptools](https://pypi.org/project/setuptools) |
| `six` | 1.16.0 | [https://pypi.org/project/six](https://pypi.org/project/six) |
| `statsmodels` | 0.13.2 | [https://pypi.org/project/statsmodels](https://pypi.org/project/statsmodels) |
| `threadpoolctl` | 3.1.0 | [https://pypi.org/project/threadpoolctl](https://pypi.org/project/threadpoolctl) |
| `typing-extensions` | 4.3.0 | [https://pypi.org/project/typing-extensions](https://pypi.org/project/typing-extensions) |
| `xgboost` | 1.6.1 | [https://pypi.org/project/xgboost](https://pypi.org/project/xgboost) |

## Related content

For more information about Python in Power BI, take a look at the following articles:

* [Create Power BI visuals using Python](desktop-python-visuals.md)
* [Running Python scripts in Power BI Desktop](desktop-python-scripts.md)
* [Using Python in Query Editor](desktop-python-in-query-editor.md)
