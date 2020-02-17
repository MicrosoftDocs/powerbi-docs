---
title:  Adding external libraries to Power BI visuals
description: This article describes how to use external libraries in Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 02/14/2020
---
# Adding external libraries and utilities

This article describes how to use external libraries and utilities in Power BI visuals. You fill find here information about how to install, import, and call it from custom visual's code.
In the following examples below we would talk about most common cases.

It includes JavaScript and CSS files installation, import, and usage in the visual's code.
Also there is example of most common for custom visuals libraries usage - d3 and Bootstrap.


* [Including JavaScript files](#including-javascript-files)
* [Including CSS files](#including-css-files)
<br></br>
## Including JavaScript files
1. Install an external JavaScript library by using any package manager (npm, yarn, etc.)
2. Include a path of the library to the ```externalJS``` property of the ```pbiviz.json```

Pay attention to [@types/d3](https://www.npmjs.com/package/@types/d3) package if you'd like to add typings for your JavaScript file to get intellisense and compile-time safety on them.

### Example
* Installing [d3](https://www.npmjs.com/package/d3) by using [npm](https://www.npmjs.com/)

```
npm install d3@3.5 --save
npm install @types/d3@3.5 --save
```

* Including ```d3``` to the ```pbiviz.json```

```json
{
  "visual": {...},
  "apiVersion": ...,
  "author": {...},
  "assets": {...},
  "externalJS": [
    "node_modules/d3/d3.min.js"
  ],
  "style": ...,
  "capabilities": ...,
  "dependencies": ...
}
```

Please visit [this](https://github.com/Microsoft/powerbi-visuals-sankey/blob/c8200da56913cd8b253be949a35fad0f4472b6de/pbiviz.json#L22) page to find the real example.
<br></br>

## Including CSS files
1. Install an external CSS framework by using any package manager (npm, yarn, etc.)
2. Include the ```import``` statement to the ```.less``` file of the visual

### Example
* Installing [bootstrap](https://www.npmjs.com/package/bootstrap) by using [npm](https://www.npmjs.com/)

```
npm install bootstrap --save
```

* Include the ```import``` statement to the ```visual.less```

```less
@import (less) "node_modules/bootstrap/dist/css/bootstrap.css";
```

Please visit [this](https://github.com/Microsoft/powerbi-visuals-sankey/blob/c8200da56913cd8b253be949a35fad0f4472b6de/style/visual.less#L32) page to find the real example.