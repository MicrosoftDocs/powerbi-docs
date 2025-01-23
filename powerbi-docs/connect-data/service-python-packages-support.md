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
ms.date: 01/17/2025
LocalizationGroup: Connect to data
---
# Learn which Python packages are supported in Power BI

You can use the powerful [Python programming language](https://www.python.org/) to create visuals in Power BI. Many Python packages are supported in Power BI and more are being supported all the time.

The following sections provide an alphabetical table of which Python packages are supported in Power BI.

## Requirements and limitations of Python packages

There are a handful of requirements and limitations for Python packages:

* Power BI, for the most part, supports Python packages with free and open-source software licenses such as GPL-2, GPL-3, MIT+, and so on.
* Power BI supports packages published in PyPI. The service doesn't support private or custom Python packages. Users are encouraged to make their private packages available on PyPI prior to requesting the package be available in Power BI.
* For Python visuals in Power BI Desktop, you can install any package, including custom Python packages.
* For security and privacy reasons, Python packages that provide client-server queries over the web in the service, aren't supported. Networking is blocked for such attempts.
* The approval process for including a new Python package has a tree of dependencies. Some dependencies required to be installed in the service can't be supported.

### For reports in Premium/Fabric backed workspaces
* Python runtime: Python 3.11

## Python packages that are supported in the Power BI service (Premium/ Fabric backed workspaces)

The following table shows which packages **are supported** in Power BI for reports in **Premium/Fabric backed workspaces**.
[Download packages here] (https://pypi.org/) 

| Package            | Version   |  
|--------------------|-----------|
| asttokens          | 2.4.1     | 
| certifi            | 2024.8.30 |
| comm               | 0.2.2     |
| contourpy          | 1.3.0     |
| cycler             | 0.12.1    |
| debugpy            | 1.8.5     | 
| decorator          | 5.1.1     |
| exceptiongroup     | 1.2.2     |
| executing          | 2.1.0     | 
| fonttools          | 4.53.1    |
| importlib_metadata | 8.4.0     |
| ipykernel          | 6.29.4    |
| ipython            | 8.27.0    | 
| jedi               | 0.19.1    | 
| joblib             | 1.4.2     |
| jupyter_client     | 8.6.2     | 
| jupyter_core       | 5.7.2     |  
| kiwisolver         | 1.4.5     | 
| matplotlib         | 3.8.4     |
| matplotlib inline  | 0.1.7     | 
| munkres            | 1.1.4     | 
| nest_asyncio       | 1.6.0     |  
| numpy              | 2.0.0     | 
| packaging          | 24.1      |  
| pandas             | 2.2.2     |  
| parso              | 0.8.4     |  
| patsy              | 0.5.6     |
| pexpect            | 4.9.0     |  
| pickleshare        | 0.7.5     |
| pillow             | 10.4.0    |  
| pip                | 24        |  
| platformdirs       | 4.2.2     |  
| ply                | 3.11      |  
| prompt_toolkit     | 3.0.47    |  
| psutil             | 6.0.0     |
| ptyprocess         | 0.7.0     |
| pure_eval          | 0.2.3     |  
| Pygments           | 2.18.0    |  
| pyparsing          | 3.1.2     |  
| PyQt5              | 5.15.9    |  
| PyQt5 sip          | 12.12.2   |  
| python dateutil    | 2.9.0     |  
| pytz               | 2024.1    |  
| pyzmq              | 26.2.0    |
| scikit learn       | 1.5.0     |
| scipy              | 1.13.1    |  
| seaborn            | 0.13.2    |  
| setuptools         | 70.0.0    |  
| sip                | 6.7.12    |  
| six                | 1.16.0    |  
| stack data         | 0.6.2     |  
| statsmodels        | 0.14.2    |
| threadpoolctl      | 3.5.0     |
| toml               | 0.10.2    |  
| tomli              | 2.0.1     |  
| tornado            | 6.4.1     |
| traitlets          | 5.14.3    |  
| typing_extensions  | 4.12.2    |
| tzdata             | 2024.1    |  
| unicodedata2       | 15.1.0    |
| wcwidth            | 0.2.13    | 
| wheel              | 0.44.0    | 
| xgboost            | 2.0.3     |
| zipp               | 3.20.1    | 


### For non-Premium/Fabric backed workspaces/ Sov. Clouds/China
* Python runtime: Python 3.7.7

The following table shows which packages **are supported** in Power BI reports in **non-Premium/Fabric backed workspaces**.

|        Package        |   Version   |                                   Link                                   |
|-----------------------|-------------|--------------------------------------------------------------------------|
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


## Considerations and limitations

- Py visuals aren't supported with Service Principal Profiles for App Owns Data.
- Py visuals rendered from the Power BI service (for Premium/ F SKUs) will support payloads of < 30Mb.


## Related content

For more information about Python in Power BI, take a look at the following articles:

* [Create Power BI visuals using Python](desktop-python-visuals.md)
* [Running Python scripts in Power BI Desktop](desktop-python-scripts.md)
* [Using Python in Query Editor](desktop-python-in-query-editor.md)
