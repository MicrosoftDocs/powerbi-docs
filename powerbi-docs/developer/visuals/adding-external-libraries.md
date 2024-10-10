---
title:  Adding external libraries to Power BI visuals
description: Learn how to install, import, and call external libraries in Power BI visuals to enhance your visualizations with additional functionality.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: tebercov 
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 1/09/2024
#customer intent: As a developer, I want to learn how to use external libraries in Power BI visuals so I can enhance my visualizations with additional functionality.
---

# How to add external libraries

This article describes how to use external libraries in Power BI visuals. This article also describes how to install, import, and call external libraries from a Power BI visual's code.

## JavaScript libraries

1. Install an external JavaScript library by using a package manager, such as *npm* or *yarn*.
2. Import the required modules into the source files using the external library.

>[!NOTE]
> To add typings to your JavaScript library, and get [Intellisense](https://code.visualstudio.com/docs/editor/intellisense) and compile-time safety, make sure that you install the appropriate package.

### Installing the D3 library

This section provides an example of installing the [D3 library](https://www.npmjs.com/package/d3) and the [@types/d3](https://www.npmjs.com/package/@types/d3) package using [npm](https://www.npmjs.com/) in the code of a Power BI visual.

For a full example, see the [Power BI visualizations](https://github.com/microsoft/powerbi-visuals-gantt/blob/master/src/gantt.ts#L29) code.

1. Install the *d3* package and the *@types/d3* package.

    ```powershell
    npm install d3@5 --save
    npm install @types/d3@5 --save
    ```

2. Import the *d3* library in the files that use it, such as *visual.ts*.

    ```typescript
    import * as d3 from "d3";
    ```

## CSS framework

1. Install an external CSS framework by using any package manager, such as *npm* or *yarn*.
2. In the *.less* file of the visual, include the `import` statement.

### Installing bootstrap

This section provides an example of installing [bootstrap](https://www.npmjs.com/package/bootstrap) using [npm](https://www.npmjs.com/).

For a full example, see the [Power BI visualizations](https://github.com/Microsoft/powerbi-visuals-sankey/blob/c8200da56913cd8b253be949a35fad0f4472b6de/style/visual.less#L32) code.

1. Install the *bootstrap* package.

    ```powershell
    npm install bootstrap --save
    ```

2. Include the `import` statement in *visual.less*.

    ```less
    @import (less) "node_modules/bootstrap/dist/css/bootstrap.css";
    ```

## Related content

[Set up your environment for developing a Power BI visual](environment-setup.md)
