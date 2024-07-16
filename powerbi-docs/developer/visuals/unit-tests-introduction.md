---
title: Introduction to unit tests for Power BI visual projects
description: Learn how to write unit tests for Power BI custom visuals by using the Karma JavaScript testing framework.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: tutorial
ms.date: 12/1/2023
#customer intent: As a Power BI visual developer, I want to learn how to write unit tests for my visual so that I can ensure the visual works as expected.
---

# Tutorial: Add unit tests for Power BI visual projects

This article describes the basics of writing unit tests for your Power BI visuals, including how to:

* Set up the Karma JavaScript test runner testing framework, Jasmine.
* Use the powerbi-visuals-utils-testutils package.
* Use mocks and fakes to help simplify unit testing of Power BI visuals.

## Prerequisites

* An installed Power BI visuals project
* A configured Node.js environment

The examples in this article use the [bar chart](create-bar-chart.md) visual for testing.

## Install and configure the Karma JavaScript test runner and Jasmine

Add the required libraries to the *package.json* file in the `devDependencies` section:

```json
"@types/d3": "5.7.2",
"@types/d3-selection": "^1.0.0",
"@types/jasmine": "^3.10.2",
"@types/jasmine-jquery": "^1.5.34",
"@types/jquery": "^3.5.8",
"@types/karma": "^6.3.1",
"@types/lodash-es": "^4.17.5",
"coveralls": "^3.1.1",
"d3": "5.12.0",
"jasmine": "^3.10.0",
"jasmine-core": "^3.10.1",
"jasmine-jquery": "^2.1.1",
"jquery": "^3.6.0",
"karma": "^6.3.9",
"karma-chrome-launcher": "^3.1.0",
"karma-coverage": "^2.0.3",
"karma-coverage-istanbul-reporter": "^3.0.3",
"karma-jasmine": "^4.0.1",
"karma-junit-reporter": "^2.0.1",
"karma-sourcemap-loader": "^0.3.8",
"karma-typescript": "^5.5.2",
"karma-typescript-preprocessor": "^0.4.0",
"karma-webpack": "^5.0.0",
"powerbi-visuals-api": "^3.8.4",
"powerbi-visuals-tools": "^3.3.2",
"powerbi-visuals-utils-dataviewutils": "^2.4.1",
"powerbi-visuals-utils-formattingutils": "^4.7.1",
"powerbi-visuals-utils-interactivityutils": "^5.7.1",
"powerbi-visuals-utils-tooltiputils": "^2.5.2",
"puppeteer": "^11.0.0",
"style-loader": "^3.3.1",
"ts-loader": "~8.2.0",
"ts-node": "^10.4.0",
"tslint": "^5.20.1",
"tslint-microsoft-contrib": "^6.2.0"
```

To learn more about *package.json*, see the description at [npm-package.json](https://docs.npmjs.com/files/package.json).

Save the *package.json* file and run the following command at the location of the *package.json* file:

```cmd
npm install
```

The package manager installs all new packages that are added to *package.json*.

To run unit tests, configure the test runner and the `webpack` config.

The following code is a sample of the *test.webpack.config.js* file:

```typescript
const path = require('path');
const webpack = require("webpack");

module.exports = {
    devtool: 'source-map',
    mode: 'development',
    optimization : {
        concatenateModules: false,
        minimize: false
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/
            },
            {
                test: /\.json$/,
                loader: 'json-loader'
            },
            {
                test: /\.tsx?$/i,
                enforce: 'post',
                include: /(src)/,
                exclude: /(node_modules|resources\/js\/vendor)/,
                loader: 'istanbul-instrumenter-loader',
                options: { esModules: true }
            },
            {
                test: /\.less$/,
                use: [
                    {
                        loader: 'style-loader'
                    },
                    {
                        loader: 'css-loader'
                    },
                    {
                        loader: 'less-loader',
                        options: {
                            paths: [path.resolve(__dirname, 'node_modules')]
                        }
                    }
                ]
            }
        ]
    },
    externals: {
        "powerbi-visuals-api": '{}'
    },
    resolve: {
        extensions: ['.tsx', '.ts', '.js', '.css']
    },
    output: {
        path: path.resolve(__dirname, ".tmp/test")
    },
    plugins: [
        new webpack.ProvidePlugin({
            'powerbi-visuals-api': null
        })
    ]
};
```

The following code is a sample of the *karma.conf.ts* file:

```typescript
"use strict";

const webpackConfig = require("./test.webpack.config.js");
const tsconfig = require("./test.tsconfig.json");
const path = require("path");

const testRecursivePath = "test/visualTest.ts";
const srcOriginalRecursivePath = "src/**/*.ts";
const coverageFolder = "coverage";

process.env.CHROME_BIN = require("puppeteer").executablePath();

import { Config, ConfigOptions } from "karma";

module.exports = (config: Config) => {
    config.set(<ConfigOptions>{
        mode: "development",
        browserNoActivityTimeout: 100000,
        browsers: ["ChromeHeadless"], // or specify Chrome to use the locally installed Chrome browser
        colors: true,
        frameworks: ["jasmine"],
        reporters: [
            "progress",
            "junit",
            "coverage-istanbul"
        ],
        junitReporter: {
            outputDir: path.join(__dirname, coverageFolder),
            outputFile: "TESTS-report.xml",
            useBrowserName: false
        },
        singleRun: true,
        plugins: [
            "karma-coverage",
            "karma-typescript",
            "karma-webpack",
            "karma-jasmine",
            "karma-sourcemap-loader",
            "karma-chrome-launcher",
            "karma-junit-reporter",
            "karma-coverage-istanbul-reporter"
        ],
        files: [
            "node_modules/jquery/dist/jquery.min.js",
            "node_modules/jasmine-jquery/lib/jasmine-jquery.js",
            {
                pattern: './capabilities.json',
                watched: false,
                served: true,
                included: false
            },
            testRecursivePath,
            {
                pattern: srcOriginalRecursivePath,
                included: false,
                served: true
            }
        ],
        preprocessors: {
            [testRecursivePath]: ["webpack", "coverage"]
        },
        typescriptPreprocessor: {
            options: tsconfig.compilerOptions
        },
        coverageIstanbulReporter: {
            reports: ["html", "lcovonly", "text-summary", "cobertura"],
            dir: path.join(__dirname, coverageFolder),
            'report-config': {
                html: {
                    subdir: 'html-report'
                }
            },
            combineBrowserReports: true,
            fixWebpackSourcePaths: true,
            verbose: false
        },
        coverageReporter: {
            dir: path.join(__dirname, coverageFolder),
            reporters: [
                // reporters not supporting the `file` property
                { type: 'html', subdir: 'html-report' },
                { type: 'lcov', subdir: 'lcov' },
                // reporters supporting the `file` property, use `subdir` to directly
                // output them in the `dir` directory
                { type: 'cobertura', subdir: '.', file: 'cobertura-coverage.xml' },
                { type: 'lcovonly', subdir: '.', file: 'report-lcovonly.txt' },
                { type: 'text-summary', subdir: '.', file: 'text-summary.txt' },
            ]
        },
        mime: {
            "text/x-typescript": ["ts", "tsx"]
        },
        webpack: webpackConfig,
        webpackMiddleware: {
            stats: "errors-only"
        }
    });
};
```

If necessary, you can modify this configuration.

The code in *karma.conf.js* contains the following variables:

* `recursivePathToTests`: Locates the test code.

* `srcRecursivePath`: Locates the output JavaScript code after compiling.

* `srcCssRecursivePath`: Locates the output CSS after compiling less file with styles.

* `srcOriginalRecursivePath`: Locates the source code of your visual.

* `coverageFolder`: Determines where the coverage report is to be created.

The configuration file includes the following properties:

* `singleRun: true`: Tests are run on a continuous integration (CI) system, or they can be run one time. You can change the setting to `false` for debugging your tests. The Karma framework keeps the browser running so that you can use the console for debugging.

* `files: [...]`: In this array, you can specify the files to load to the browser. The files you load are typically source files, test cases, and libraries (such as Jasmine or test utilities). You can add more files as necessary.

* `preprocessors`: In this section, you configure actions that run before the unit tests run. The actions can precompile TypeScript to JavaScript, prepare source map files, and generate a code coverage report. You can disable `coverage` when you debug your tests. `coverage` generates more code for code coverage testing, which complicates debugging tests.

For descriptions of all Karma configurations, go to the [Karma Configuration File](https://karma-runner.github.io/1.0/config/configuration-file.html) page.

For your convenience, you can add a test command into `scripts` in *package.json*:

```json
{
    "scripts": {
        "pbiviz": "pbiviz",
        "start": "pbiviz start",
        "typings":"node node_modules/typings/dist/bin.js i",
        "lint": "tslint -r \"node_modules/tslint-microsoft-contrib\"  \"+(src|test)/**/*.ts\"",
        "pretest": "pbiviz package --resources --no-minify --no-pbiviz --no-plugin",
        "test": "karma start"
    }
    ...
}
```

You're now ready to begin writing your unit tests.

## Check the DOM element of the visual

To test the visual, first create an instance of the visual.

### Create a visual instance builder

Add a *visualBuilder.ts* file to the *test* folder by using the following code:

```typescript
import { VisualBuilderBase } from "powerbi-visuals-utils-testutils";

import { BarChart as VisualClass } from "../src/barChart";

import powerbi from "powerbi-visuals-api";
import VisualConstructorOptions = powerbi.extensibility.visual.VisualConstructorOptions;

export class BarChartBuilder extends VisualBuilderBase<VisualClass> {
  constructor(width: number, height: number) {
    super(width, height);
  }

  protected build(options: VisualConstructorOptions) {
    return new VisualClass(options);
  }

  public get mainElement() {
    return $(this.element).children("svg.barChart");
  }
}
```

The `build` method creates an instance of your visual. `mainElement` is a get method, which returns an instance of a root document object model (DOM) element in your visual. The getter is optional, but it makes writing the unit test easier.

You now have a build of an instance of your visual. Let's write the test case. The example test case checks the SVG elements that are created when your visual is displayed.

### Create a TypeScript file to write test cases

Add a *visualTest.ts* file for the test cases by using the following code:

```typescript
import powerbi from "powerbi-visuals-api";

import { BarChartBuilder } from "./visualBuilder";
import { SampleBarChartDataBuilder } from "./visualData";

import DataView = powerbi.DataView;

describe("BarChart", () => {
  let visualBuilder: BarChartBuilder;
  let dataView: DataView;
  let defaultDataViewBuilder: SampleBarChartDataBuilder;

  beforeEach(() => {
    visualBuilder = new BarChartBuilder(500, 500);
    defaultDataViewBuilder = new SampleBarChartDataBuilder();
    dataView = defaultDataViewBuilder.getDataView();
  });

  it("root DOM element is created", () => {
    visualBuilder.updateRenderTimeout(dataView, () => {
      expect(visualBuilder.mainElement[0]).toBeInDOM();
    });
  });
});
```

Several Jasmine methods are called:

* [`describe`](https://jasmine.github.io/api/2.6/global.html#describe): Describes a test case. In the context of the Jasmine framework, `describe` often describes a suite or group of specs.

* `beforeEach`: Is called before each call of the `it` method, which is defined in the [`describe`](https://jasmine.github.io/api/2.6/global.html#beforeEach) method.

* [`it`](https://jasmine.github.io/api/2.6/global.html#it): Defines a single spec. The `it` method should contain one or more `expectations`.

* [`expect`](https://jasmine.github.io/api/2.6/global.html#expect): Creates an expectation for a spec. A spec succeeds if all expectations pass without any failures.

* `toBeInDOM`: Is one of the *matchers* methods. For more information about matchers, see [Jasmine Namespace: matchers](https://jasmine.github.io/api/2.6/matchers.html).

For more information about Jasmine, see the [Jasmine framework documentation](https://jasmine.github.io/) page.

### Launch unit tests

This test checks that the root SVG element for your visual exists when the visual runs. To run the unit test, enter the following command in the command-line tool:

```cmd
npm run test
```

`karma.js` runs the test case in the Chrome browser.

:::image type="content" source="media/unit-tests-introduction/karmajs-chrome.png" alt-text="Screenshot of the Chrome browser, which shows that karma dot js is running the test case.":::

> [!NOTE]
> You must install Google Chrome locally.

In the command-line window, you'll get following output:

```cmd
> karma start

23 05 2017 12:24:26.842:WARN [watcher]: Pattern "E:/WORKSPACE/PowerBI/PowerBI-visuals-sampleBarChart/data/*.csv" does not match any file.
23 05 2017 12:24:30.836:WARN [karma]: No captured browser, open https://localhost:9876/
23 05 2017 12:24:30.849:INFO [karma]: Karma v1.3.0 server started at https://localhost:9876/
23 05 2017 12:24:30.850:INFO [launcher]: Launching browser Chrome with unlimited concurrency
23 05 2017 12:24:31.059:INFO [launcher]: Starting browser Chrome
23 05 2017 12:24:33.160:INFO [Chrome 58.0.3029 (Windows 10 0.0.0)]: Connected on socket /#2meR6hjXFmsE_fjiAAAA with id 5875251
Chrome 58.0.3029 (Windows 10 0.0.0): Executed 1 of 1 SUCCESS (0.194 secs / 0.011 secs)

=============================== Coverage summary ===============================
Statements   : 27.43% ( 65/237 )
Branches     : 19.84% ( 25/126 )
Functions    : 43.86% ( 25/57 )
Lines        : 20.85% ( 44/211 )
================================================================================
```

### How to add static data for unit tests

Create the *visualData.ts* file in the *test* folder by using the following code:

```typescript
import powerbi from "powerbi-visuals-api";
import DataView = powerbi.DataView;

import { testDataViewBuilder } from "powerbi-visuals-utils-testutils";

import TestDataViewBuilder = testDataViewBuilder.TestDataViewBuilder;

export class SampleBarChartDataBuilder extends TestDataViewBuilder {
  public static CategoryColumn: string = "category";
  public static MeasureColumn: string = "measure";

  public getDataView(columnNames?: string[]): DataView {
    let dateView: any = this.createCategoricalDataViewBuilder(
      [
          ...
      ],
      [
          ...
      ],
      columnNames
    ).build();

    // there's client side computed maxValue
    let maxLocal = 0;
    this.valuesMeasure.forEach((item) => {
      if (item > maxLocal) {
        maxLocal = item;
      }
    });
    (<any>dataView).categorical.values[0].maxLocal = maxLocal;

    return dataView;
  }
}
```

The `SampleBarChartDataBuilder` class extends `TestDataViewBuilder` and implements the abstract method `getDataView`.

When you put data into data-field buckets, Power BI produces a categorical `dataview` object that's based on your data.

:::image type="content" source="media/unit-tests-introduction/fields-buckets.png" alt-text="Screenshot of Power BI, which shows the data fields buckets are empty.":::

In unit tests, you don't have access to Power BI core functions that you normally use to reproduce the data. But you need to map your static data to the categorical `dataview`. Use the `TestDataViewBuilder` class to map your static data.

For more information about Data View mapping, see [DataViewMappings](https://github.com/PowerBi-Projects/PowerBI-visuals/blob/master/Capabilities/DataViewMappings.md).

In the `getDataView` method, you call the `createCategoricalDataViewBuilder` method with your data.

In the `sampleBarChart` visual [capabilities.json](https://github.com/Microsoft/PowerBI-visuals-sampleBarChart/blob/master/capabilities.json#L2) file, we have `dataRoles` and `dataViewMapping` objects:

```json
"dataRoles": [
    {
        "displayName": "Category Data",
        "name": "category",
        "kind": "Grouping"
    },
    {
        "displayName": "Measure Data",
        "name": "measure",
        "kind": "Measure"
    }
],
"dataViewMappings": [
    {
        "conditions": [
            {
                "category": {
                    "max": 1
                },
                "measure": {
                    "max": 1
                }
            }
        ],
        "categorical": {
            "categories": {
                "for": {
                    "in": "category"
                }
            },
            "values": {
                "select": [
                    {
                        "bind": {
                            "to": "measure"
                        }
                    }
                ]
            }
        }
    }
],
```

To generate the same mapping, you must set the following parameters to the `createCategoricalDataViewBuilder` method:

```typescript
([
    {
        source: {
            displayName: "Category",
            queryName: SampleBarChartDataBuilder.CategoryColumn,
            type: ValueType.fromDescriptor({ text: true }),
            roles: {
                Category: true
            },
        },
        values: this.valuesCategory
    }
],
[
    {
        source: {
            displayName: "Measure",
            isMeasure: true,
            queryName: SampleBarChartDataBuilder.MeasureColumn,
            type: ValueType.fromDescriptor({ numeric: true }),
            roles: {
                Measure: true
            },
        },
        values: this.valuesMeasure
    },
], columnNames)
```

Where `this.valuesCategory` is an array of categories:

```ts
public valuesCategory: string[] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
```

And `this.valuesMeasure` is an array of measures for each category:

```ts
public valuesMeasure: number[] = [742731.43, 162066.43, 283085.78, 300263.49, 376074.57, 814724.34, 570921.34];
```

The final version of *visualData.ts* contains the following code:

```ts
import powerbi from "powerbi-visuals-api";
import DataView = powerbi.DataView;

import { testDataViewBuilder } from "powerbi-visuals-utils-testutils";
import { valueType } from "powerbi-visuals-utils-typeutils";
import ValueType = valueType.ValueType;

import TestDataViewBuilder = testDataViewBuilder.TestDataViewBuilder;

export class SampleBarChartDataBuilder extends TestDataViewBuilder {
  public static CategoryColumn: string = "category";
  public static MeasureColumn: string = "measure";
  public valuesCategory: string[] = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  public valuesMeasure: number[] = [
    742731.43, 162066.43, 283085.78, 300263.49, 376074.57, 814724.34, 570921.34,
  ];

  public getDataView(columnNames?: string[]): DataView {
    let dataView: any = this.createCategoricalDataViewBuilder(
      [
        {
          source: {
            displayName: "Category",
            queryName: SampleBarChartDataBuilder.CategoryColumn,
            type: ValueType.fromDescriptor({ text: true }),
            roles: {
              category: true,
            },
          },
          values: this.valuesCategory,
        },
      ],
      [
        {
          source: {
            displayName: "Measure",
            isMeasure: true,
            queryName: SampleBarChartDataBuilder.MeasureColumn,
            type: ValueType.fromDescriptor({ numeric: true }),
            roles: {
              measure: true,
            },
          },
          values: this.valuesMeasure,
        },
      ],
      columnNames
    ).build();

    // there's client side computed maxValue
    let maxLocal = 0;
    this.valuesMeasure.forEach((item) => {
      if (item > maxLocal) {
        maxLocal = item;
      }
    });
    (<any>dataView).categorical.values[0].maxLocal = maxLocal;

    return dataView;
  }
}
```

Now, you can use the `SampleBarChartDataBuilder` class in your unit test.

The `ValueType` class is defined in the powerbi-visuals-utils-testutils package.

Add the powerbi-visuals-utils-testutils package to the dependencies. In the `package.json` file, locate the `dependencies` section and add the following code:

```json
"powerbi-visuals-utils-testutils": "^2.4.1",
```

Call

```cmd
npm install
```

to install `powerbi-visuals-utils-testutils` package.

Now, you can run the unit test again. You must get the following output:

```cmd
> karma start

23 05 2017 16:19:54.318:WARN [watcher]: Pattern "E:/WORKSPACE/PowerBI/PowerBI-visuals-sampleBarChart/data/*.csv" does not match any file.
23 05 2017 16:19:58.333:WARN [karma]: No captured browser, open https://localhost:9876/
23 05 2017 16:19:58.346:INFO [karma]: Karma v1.3.0 server started at https://localhost:9876/
23 05 2017 16:19:58.346:INFO [launcher]: Launching browser Chrome with unlimited concurrency
23 05 2017 16:19:58.394:INFO [launcher]: Starting browser Chrome
23 05 2017 16:19:59.873:INFO [Chrome 58.0.3029 (Windows 10 0.0.0)]: Connected on socket /#NcNTAGH9hWfGMCuEAAAA with id 3551106
Chrome 58.0.3029 (Windows 10 0.0.0): Executed 1 of 1 SUCCESS (1.266 secs / 1.052 secs)

=============================== Coverage summary ===============================
Statements   : 56.72% ( 135/238 )
Branches     : 32.54% ( 41/126 )
Functions    : 66.67% ( 38/57 )
Lines        : 52.83% ( 112/212 )
================================================================================
```

The summary shows that coverage has increased. To learn more about current code coverage, open the `coverage/html-report/index.html` file.

:::image type="content" source="media/unit-tests-introduction/code-coverage-index.png" alt-text="Screenshot of the browser window, which shows the HTML code coverage report.":::

Or look at the scope of the `src` folder:

:::image type="content" source="media/unit-tests-introduction/code-coverage-src-folder.png" alt-text="Screenshot of the browser window, which shows the code coverage report for the visual dot ts file.":::

In the file scope, you can view the source code. The `coverage` utilities highlight the row in red if certain lines of code don't run during the unit tests.

:::image type="content" source="media/unit-tests-introduction/code-coverage-visual-src.png" alt-text="Screenshot of the visual source code, which shows that the lines of code that didn't run in unit tests are highlighted in red.":::

> [!IMPORTANT]
> Code coverage doesn't mean that you have good functionality coverage of the visual. One simple unit test provides over 96 percent coverage in `src/barChart.ts`.

### Debugging

To debug your tests via browser console, change the `singleRun` value in *karma.conf.ts* to `false`. This setting will keep your browser running when the browser launches after the tests run.

Your visual opens in the Chrome browser.

:::image type="content" source="media/unit-tests-introduction/karmajs-chrome-ut-runned.png" alt-text="Screenshot of the Chrome browser window, which shows the custom Power BI visual.":::

## Related content

When your visual is ready, you can submit it for publication. For more information, see [Publish Power BI visuals to AppSource](office-store.md).
