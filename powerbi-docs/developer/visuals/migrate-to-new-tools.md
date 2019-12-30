---
title: Migrating to powerbi-visuals-tools version 3.x
description: Getting started with the new version of powerbi-visuals-tools
author: zBritva
ms.author: v-ilgali
manager: rkarlin
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: conceptual
ms.date: 06/18/2019
---

# Migrate to the new powerbi-visuals-tools version 3.*x*

Starting with version 3, Power BI Visuals Tools (powerbi-visuals-tools, or `pbiviz`) use webpack to build custom visuals.
The new version offers developers many improvements for creating visuals:

- TypeScript version 3.*x* is used by default. Starting with TypeScript 1.5, the nomenclature has changed. [Read more about TypeScript modules](https://www.typescriptlang.org/docs/handbook/modules.html).

- ECMAScript 6 (ES6) modules are supported. Use ES6 imports now instead of [externalJS](migrate-to-new-tools.md#configure-loading-of-external-libraries).

- New versions of Data-Driven Documents ([D3v5](https://d3js.org/)) and other ES6 module-based libraries are supported.

- Reduced package size. [Tree shaking](https://webpack.js.org/guides/tree-shaking/) is used by webpack to remove unused code. It reduces the JavaScript code and gives you better performance in loading visuals.

- Improved API performance.

- The Globalize.js library [is integrated](migrate-to-new-tools.md#remove-the- globalizejs-library) into FormattingUtils.

- Power BI Visuals Tools use [webpack-bundle-analyzer](https://github.com/webpack-contrib/webpack-bundle-analyzer) to display the code base of the visual.

This article describes all migration steps for the new version of Power BI Visuals Tools.

## Backward compatibility

The new tools save backward-compatibility info for the old visuals code base, but might require some additional changes to load external libraries.

The libraries that support module systems are imported as webpack modules. All other libraries and source code for the visual are wrapped into one module.

Global variables like JQuery and Lodash, which were used in the previous Power BI Visuals Tools, are obsolete now. If the old code for your visual relies on global variables, the visual probably won't work with the new tools.

The previous version of Power BI Visuals Tools required you to define a visual class under the `powerbi.extensibility.visual` module. With the new version of the tools, you must instead define a visual class in the main TypeScript (.ts) file. Typically, that file is `src/visual.ts`.

## Install powerbi-visuals-tools

Run this command to install the new tools:

```cmd
npm install -g powerbi-visuals-tools
```

The following code is from the `package.json` file in the [sampleBarChart visual repository](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/471f103fcef9af93cff76cbac9c7fc67564acd4b/package.json#L15), after the visual project has been updated to work with the new tools:

```json
{
    "name": "visual",
    "version": "3.0.0",
    "scripts": {
        "pbiviz": "pbiviz",
        "start": "pbiviz start",
        "package": "pbiviz package",
        "lint": "tslint -r \"node_modules/tslint-microsoft-contrib\"  \"+(src|test)/**/*.ts\"",
        "test": "pbiviz package --resources --no-minify --no-pbiviz"
    },
    "devDependencies": {
        "@types/d3": "5.7.2",
        "d3": "5.12.0",
        "powerbi-visuals-api": "^2.6.1",
        "powerbi-visuals-tools": "^3.1.7",
        "powerbi-visuals-utils-dataviewutils": "^2.2.1",
        "powerbi-visuals-utils-formattingutils": "^4.4.2",
        "powerbi-visuals-utils-interactivityutils": "^5.6.0",
        "powerbi-visuals-utils-tooltiputils": "^2.3.1",
        "tslint": "^5.20.0",
        "tslint-microsoft-contrib": "^6.2.0"
    }
}
```

## Install the Power BI Custom Visuals API

The new version of powerbi-visuals-tools doesn't include all API versions. Instead, you must install a specific version of the [powerbi-visuals-api](https://www.npmjs.com/package/powerbi-visuals-api) package. Choose the version of the package that matches the API version of your Power BI custom visuals. The package provides all type definitions for the Power BI Custom Visuals API.

Add `powerbi-visuals-api` to your project dependencies of a project by running this command:

```cmd
npm install --save-dev powerbi-visuals-api
```

Also, remove any links to old API type definitions, because webpack automatically includes types from `powerbi-visuals-api`. Corresponding changes are in [package.json](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/blob/sample-next/package.json#L14).

## Update tsconfig.json

To use external modules, change the `out` option to `outDir`. For example, use
`"outDir": "./.tmp/build/",` instead of `"out": "./.tmp/build/visual.js",`.

This change is required because TypeScript files will be compiled into JavaScript files independently. That's why you no longer have to specify the visual.js file as an output.

You can also change the `target` option to `ES6` if you want to use modern JavaScript as an output. This change is [optional](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/471f103fcef9af93cff76cbac9c7fc67564acd4b/tsconfig.json#L7).

## Update custom visuals utilities

If you use any of the [powerbi-visuals-utils](https://www.npmjs.com/search?q=powerbi-visuals-utils) packages, update them to the latest version, too. To do that, run this command:

```cmd
npm install powerbi-visuals-utils-<UTILNAME> --save
```

For example, to get the new version with external modules of TypeScript, run: 

```cmd
npm install powerbi-visuals-utils-dataviewutils --save
```

For an example of a visual that uses all `powerbi-visuals-utils` packages, see the [MekkoChart repository](https://github.com/Microsoft/powerbi-visuals-mekkochart).

## Remove the Globalize.js library

The new version of [powerbi-visuals-utils-formattingutils@4.3](https://www.npmjs.com/package/powerbi-visuals-utils-formattingutils) includes Globalize.js. So, you don't need to include this library manually in your project. All required localizations will be added to the final package automatically.

## Configure loading of external libraries

Include new JavaScript files after libraries in the `externalJS` array of `pbiviz.json`. For example:

```JSON
"externalJS": [
    ...
    "node_modules/lodash/lodash.min.js",
    "externalJS/init.lodash.js",
    ...
]
```

Import the libraries in your source code. For example, for `lodash-es`, use this statement:

```JS
import * as _ from "lodash-es";
```

In the preceding example, `_` is the global variable for the `lodash` library.

## Make changes in the sources of your visuals

The main change that you must make is to convert internal modules to external modules. You can't use external modules within internal modules.

Here's a detailed description of the changes to make. The modifications are described in the context of the Bar Chart custom visual code sample:

1. Remove all module definitions from each [source code](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-433142f7814fee940a0ffc98dc75bfcbL1-L3) file:

    ```typescript
    module powerbi.extensibility.visual {
        ...
    }
    ```

2. [Import the Power BI custom visual API definitions](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-433142f7814fee940a0ffc98dc75bfcbR4):

    ```typescript
    import powerbi from "powerbi-visuals-api";
    ```

3. [Import the necessary interfaces or classes](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-433142f7814fee940a0ffc98dc75bfcbR12-R35) from the `powerbi` internal module.

    ```typescript
    import PrimitiveValue = powerbi.PrimitiveValue; 
    import VisualUpdateOptions = powerbi.extensibility.visual.VisualUpdateOptions; 
    import VisualConstructorOptions = powerbi.extensibility.visual.VisualConstructorOptions; 
    import IVisualHost = powerbi.extensibility.visual.IVisualHost; 
    import IColorPalette = powerbi.extensibility.IColorPalette; 
    import IVisual = powerbi.extensibility.visual.IVisual; 
    import VisualObjectInstance = powerbi.VisualObjectInstance; 
    import VisualObjectInstanceEnumeration = powerbi.VisualObjectInstanceEnumeration; 
    import EnumerateVisualObjectInstancesOptions = powerbi.EnumerateVisualObjectInstancesOptions; 
    import Fill = powerbi.Fill; 
    import VisualTooltipDataItem = powerbi.extensibility.VisualTooltipDataItem; 
    import ISelectionManager = powerbi.extensibility.ISelectionManager; 
    ```

4. [Import the D3.js library](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-433142f7814fee940a0ffc98dc75bfcbR2):

    ```typescript
    import * as d3 from "d3";
    ```

    Or, import only the required D3 library modules:

    ```typescript
    import { max, min } from "d3-array";
    ```

5. [Import utilities, classes, and interfaces defined in the visual project](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-433142f7814fee940a0ffc98dc75bfcbR38-R41) to the main source file:

    ```typescript
    import { getLocalizedString } from "./localization/localizationHelper";
    import { getValue, getCategoricalObjectValue } from "./objectEnumerationUtility";
    import {
        ITooltipServiceWrapper,
        TooltipEventArgs,
        createTooltipServiceWrapper
    } from "./tooltipServiceWrapper";
    ```

### Import CSS Styles

The new version of the tools allows you to import `CSS` and `Less` styles directly into the TypeScript code. The [styles section](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/blob/sample-next/pbiviz.json#L22) that was used previously is now ignored by the compiler.

To use your stylesheet, open the main TypeScript (.ts) file and add this line:  

```typescript
import "./../style/visual.less";
```  

Your `CSS` and `Less` styles will be compiled automatically.

### externalJS section in pbiviz.json

The tools [don't require a list of `externalJS` libraries](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/commit/72ec605ce6a311a6cc004453b07973b6ed5e61f9#diff-a1a7bbee7e7d2f9d449f4b534532bcf2R20) to load into the visual bundle, because webpack includes all imported libraries.

> [!NOTE]
> In `pbiviz.json`, leave the `externalJS` section empty.

Use the typical command `npm run package` to create the visual package, or `npm run start` to start the development server.

## Update the D3.js library to version 5

With the new visuals tools, you can start using the new version of the D3.js library. Run these commands to update D3 in your visual project:

- `npm install --save d3@5` to install the new D3.js.

- `npm install --save-dev @types/d3@5` to install the new type definitions for D3.js.

> [!IMPORTANT]
> D3 version 5 introduces several breaking changes.

Modify your code to work with the new D3.js:

- The interface `d3.Selection<T>` [was changed](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/af2ff9fb0fc70bd94ea0c604d75a362411d5abeb#diff-433142f7814fee940a0ffc98dc75bfcbR157) to `Selection<GElement extends BaseType, Datum, PElement extends BaseType, PDatum>`.

- You can't apply several attributes by using a single call to the `attr` method. Instead, you must [pass each attribute in a separate call](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/af2ff9fb0fc70bd94ea0c604d75a362411d5abeb#diff-433142f7814fee940a0ffc98dc75bfcbR278) to `attr`. Make [separate calls to the `style` method](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/af2ff9fb0fc70bd94ea0c604d75a362411d5abeb#diff-433142f7814fee940a0ffc98dc75bfcbR247) also.

- D3.js version 4 introduced the new `merge` method. This method is commonly used to merge `enter` and `update` selections after a data-join operation. To use D3 properly, [call the `merge` method](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/commit/83fe8d52d362dccd0034dd8e32c94080d9376b29#diff-433142f7814fee940a0ffc98dc75bfcbR272).

[Read more](https://github.com/d3/d3/blob/master/CHANGES.md) about changes in the D3.js library.

## Install Babel and core-js

Starting with version 3.1, the visuals tools use Babel to compile modern JavaScript code into old ECMAScript 5 (ES5) to support a wide range of browsers.

The Babel option is enabled by default, but you must manually import the [`core-js`](https://www.npmjs.com/package/core-js) package. Run this command to install the package:

```cmd
npm install --save core-js
```

Then, import the package at the start point of the visual code. Typically, that's the 'src/visual.ts' file.

```JS
import "core-js/stable";
```

Read more about Babel [in docs](https://babeljs.io/docs/en/).
