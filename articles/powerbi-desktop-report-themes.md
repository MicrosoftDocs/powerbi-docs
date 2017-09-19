<properties
   pageTitle="Use Report Themes in Power BI Desktop (Preview)"
   description="Learn how to use a custom color palette, and apply it to an entire report in Power BI Desktop"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="erikre"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="09/06/2017"
   ms.author="davidi"/>

# Use Report Themes in Power BI Desktop (Preview)

With **Report Themes** you can apply a color theme to your entire report, such as corporate colors, seasonal coloring, or any other color theme you might want to apply a report. When you apply a **Report Theme**, all visuals in your report use the colors from your selected theme (a few exceptions apply, described later in this article).

![](media/powerbi-desktop-report-themes/report-themes_1.png)

Applying a **Report Theme** requires a JSON file, using a basic structure, which you can then import into Power BI Desktop and apply to your report. The JSON file structure, and the process of importing (it's just a few button clicks) are quick and easy.

Beginning with the September 2017 release of **Power BI Desktop**, you can define even more report theme elements using a JSON file, and customize (and standardize) nearly all elements using the JSON file that you can manually adjust in the **Formatting** pane. The goal with the September 2017 release (and later) is to enable full control over how your reports look and feel, to a granular level.

### Enable Report Themes in Preview

You can try the new **Report Themes** feature beginning with the **March 2017** release of **Power BI Desktop**. To enable this preview feature, select **File > Options and Settings > Options > Preview Features**, then select the checkbox beside **Custom Report Themes**. You'll need to restart **Power BI Desktop** after you make the selection.

![](media/powerbi-desktop-report-themes/report-themes_2.png)

## How Report Themes work

To apply a Report Theme to a Power BI Desktop report, select **Switch Theme** button from the **Home** ribbon, then select **Import Theme** from the drop-down.

![](media/powerbi-desktop-report-themes/report-themes_3.png)

A window appears that lets you navigate to the location of the JSON theme file. Power BI Desktop looks for .JSON files, which is the Power BI Report Theme File type. In the following image, a handful of holiday theme files are available. We'll choose a holiday theme that happens in March.

![](media/powerbi-desktop-report-themes/report-themes_4.png)

When the theme file is successfully loaded, Power BI Desktop lets you know.

![](media/powerbi-desktop-report-themes/report-themes_5.png)

Now that we've imported a theme file, let's take a look at the simple and straightforward JSON file structure.

## Structure of a Report Theme JSON file

The basic JSON file selected in the previous section (the *St Patricks Day.json* file), when opened in an editor, looks like the following.

![](media/powerbi-desktop-report-themes/report-themes_6.png)

That JSON file has the following required lines:

-   **name** - this is the theme name, which is the only required field
-   **dataColors** - A list of hexcode color codes to use for data in Power BI Desktop visuals. The list can contain as many or as few colors as desired
-   **background**, **foreground** and **tableAccent** - These values are colors that should be used in **table** and **matrix** visuals. How these colors are used depends on the specific table or matrix style applied. The **table** and **matrix** visuals apply these styles by default.

To apply a style to a **table** or **matrix** visual, select the visual and in the **Visualizations** pane select the **Format** section, then expand **Matrix style** and select a style from the **Style** drop-down.

![](media/powerbi-desktop-report-themes/report-themes_7.png)

For easy cut-and-paste to create your own JSON file, here's the text of the *St Patricks Day.json* file:

    {
        "name": "St Patricks Day",
        "dataColors": ["#568410", "#3A6108", "#70A322", "#915203", "#D79A12", "#bb7711", "#114400", "#aacc66"],
        "background":"#FFFFFF",
        "foreground": "#3A6108",
        "tableAccent": "#568410"
    }

From there you can enter your own color hexcode for your selected colors.

Beginning with the September 2017 release of **Power BI Desktop**, the JSON file can be much more elaborate. In the JSON file, you only define the formatting that you want to affect, and anything *not* specified in your JSON file simply reverts to the Power BI default settings.

The advantages of creating a JSON file are many. For example, you can specify that all charts use a font size of 12, or that certain visuals use a particular font family, or turn off data labels for specific chart types.

With the ability to use a granular JSON file, you can create a theme file that standardizes your charts and reports, making it easy for your organization reports to be consistent.

For information about the format of the detailed JSON file, see the **Report theme JSON file format** section at the end of this article.

## How Report Theme colors stick to your reports

When you publish your report to the **Power BI service**, your Report Theme colors stay with it.

In addition, the **Data colors** section of the **Format** panel reflect your Report Theme. For example, after applying the multitude of green and brown colors from the **St. Patrick's Day** theme, when we select a visual and go to **Format > Data colors** we see the following.

![](media/powerbi-desktop-report-themes/report-themes_8.png)

See all that green? That's because those colors were part of the **Report Theme** we imported and applied.

### Situations when Report Theme colors won't stick to your reports

If you apply a custom color set (or individual color) to a particular data point in a visual, applying a Report Theme will *not* override that customized data point color.

In addition, if you've manually set a data point's color using the Theme colors section of the color palette, that (or those) colors will *not* be updated when you apply a new Report Theme. To get your default colors back (so they'll update when you apply a new Report Theme), you can select **Revert to default** in the **Theme colors** palette.

![](media/powerbi-desktop-report-themes/report-themes_9.png)

Also, many **Custom Visuals** will not apply Report Themes.


## Report Theme files you can use right now

Want to get started with **Report Themes**? Great! Here are a handful of ready-made Report Theme JSON files that you can download and import into your **Power BI Desktop** report, along with an image of that Report Theme applied to the report used in this article.

-   The [theme](https://go.microsoft.com/fwlink/?linkid=843924) used in the [blog post](https://powerbi.microsoft.com/blog/power-bi-desktop-march-feature-summary/) that announced the first release of **Report Themes**, called [*waveform.json*](https://go.microsoft.com/fwlink/?linkid=843924).

![](media/powerbi-desktop-report-themes/report-themes_10.png)

-   The [theme that's more visually impaired friendly](https://go.microsoft.com/fwlink/?linkid=843923) than the default color theme, called [*ColorblindSafe-Longer.json*](https://go.microsoft.com/fwlink/?linkid=843923).

![](media/powerbi-desktop-report-themes/report-themes_11.png)

-   A whole bunch of [Power View themes](https://go.microsoft.com/fwlink/?linkid=843925) wrapped in a zip file, including one called [*Apothecary.json*](https://go.microsoft.com/fwlink/?linkid=843925) shown below.

![](media/powerbi-desktop-report-themes/report-themes_12.png)

-   Lastly, here's one that is love-ly (the *Valentine's Day* theme) and sure to get your attention.

![](media/powerbi-desktop-report-themes/report-themes_13.png)

Rather than a download, here's the code for the Valentine's day JSON file:

    {
        "name": "Valentine's Day",
        "dataColors": ["#990011", "#cc1144", "#ee7799", "#eebbcc", "#cc4477", "#cc5555", "#882222", "#A30E33"],
        "background":"#FFFFFF",
        "foreground": "#ee7799",
        "tableAccent": "#990011"
    }

**Report Themes** can make your Power BI Desktop reports a colorful reflection of you, your organization, or even the current season or holiday. Enjoy them, they're easy!

## Report theme JSON file format

The basic JSON file has five required lines:

-   **name** - this is the theme name, which is the only required field
-   **dataColors** - A list of hexcode color codes to use for data in Power BI Desktop visuals. The list can contain as many or as few colors as desired
-   **background**, **foreground** and **tableAccent** - These values are colors that should be used in **table** and **matrix** visuals. How these colors are used depends on the specific table or matrix style applied. The **table** and **matrix** visuals apply these styles by default.

To create an extended format JSON file, with more detailed and granular control over formatting, you need to add a **visualStyles** section to the JSON file, and nest formatting specifics in that section. The format of the **visualStyles** section looks like the following:

    visualStyles: {
        visualName: {
            styleName: {
                cardName: [{
                    propertyName: propertyValue
                }]
            }
        }
    }

For the **visualName** and **cardName** sections, you can list a specific visual and cardName, or you can use an asterisk ("*") if you want that setting to apply to all visuals or all cards that contain a property for a specific visual. You can use the asterisk ("*") when you want to apply a setting globally in your report, such as a font size or specific font family that should be used throughout all visuals in your report.

> **Note:** You only need to specify the formatting elements you want to affect. Any formatting elements that are not included in the JSON file simply revert to their default values and settings.

### JSON file element definitions

The tables in this section define visual names (*visualName*), card names (*cardName*), and the enumerations necessary to create your JSON file.

When using *dateTime*, the date must be an ISO date in single quotes, with datetime at the beginning, like the following:

    “datetime’2011-10-05T14:48:00.000Z’”

Booleans are either *true* or *false*. Strings must be in double quotes, as in "this is a string".


| **visualName** |
|---|
|accessibleTable|
|animatedNumber|
|areaChart|
|barChart|
|basicShape|
|bingSocialNews|
|bingSocialTweets|
|card|
|cheerMeter|
|clusteredBarChart|
|clusteredColumnChart|
|columnChart|
|comboChart|
|consoleWriter|
|dataDotChart|
|dataDotClusteredColumnComboChart|
|dataDotStackedColumnComboChart|
|dataViewer|
|debugVisual|
|donutChart|
|filledMap|
|funnel|
|gauge|
|heatMap|
|helloIVisual|
|hundredPercentStackedBarChart|
|hundredPercentStackedColumnChart|
|image|
|kpi|
|lineChart|
|lineClusteredColumnComboChart|
|lineStackedColumnComboChart|
|map|
|matrix|
|multiRowCard|
|pieChart|
|pivotTable|
|realTimeLineChart|
|ribbonChart|
|scatterChart|
|scriptVisual|
|shapeMap|
|slicer|
|stackedAreaChart|
|sunburst|
|table|
|tableEx|
|textbox|
|treemap|
|waterfallChart|

The following table defines *cardName* values. The first value in each cell is the JSON file term, the second value is the name of the card as seen in the **Power BI Desktop** user interface.

| **cardName** |
|---|
|axis: Gauge axis|
|breakdown: Breakdown|
|bubbles: Bubbles|
|calloutValue: Callout Value|
|card: Card|
|cardTitle: Card Title|
|categoryAxis: X-Axis|
|categoryLabels: Category labels|
|clustering: undefined|
|colorBorder: Color border|
|colorByCategory: Color by category|
|columnFormatting: Field formatting|
|columnHeaders: Column headers|
|columnWidth: undefined|
|currentFrameIndex: undefined|
|data: undefined|
|dataLabels: Data labels|
|dataPoint: Data colors|
|date: Date inputs|
|dateRange: Date Range|
|defaultColors: Default Color|
|fill: Fill|
|fillPoint: Fill point|
|filters: undefined|
|forecast: Forecast|
|general: General|
|goals: Goals|
|grid: Grid|
|header: Header|
|imageScaling: Scaling|
|indicator: Indicator|
|items: Items|
|labels: Data labels|
|legend: Legend|
|line: Line|
|lineStyles: Shapes|
|mapControls: Map controls|
|mapStyles: Map styles|
|numericInputStyle: Numeric inputs|
|percentBarLabel: Conversion Rate Label|
|plotArea: Plot Area|
|plotAreaShading: Symmetry shading|
|ratioLine: Ratio line|
|referenceLine: Constant Line|
|ribbonChart: Ribbons|
|rotation: Rotation|
|rowHeaders: Row headers|
|scalarKey: undefined|
|script: undefined|
|selection: Selection Controls|
|sentimentColors: Sentiment colors|
|shape: Shape|
|slider: Slider|
|status: Color coding|
|subTotals: Subtotals|
|target: Target|
|total: Grand total|
|trend: Trend Line|
|trendline: Trend axis|
|valueAxis: Y-Axis|
|values: Values|
|wordWrap: Word wrap|
|xAxisReferenceLine: X-Axis Constant Line|
|y1AxisReferenceLine: Constant Line|
|zoom: Zoom|

The following section defines the enumerations you can use in the JSON file.

    {
        "legend": {
            "position": [
                {
                    "value": "Top",
                    "displayName": "Top"
                },
                {
                    "value": "Bottom",
                    "displayName": "Bottom"
                },
                {
                    "value": "Left",
                    "displayName": "Left"
                },
                {
                    "value": "Right",
                    "displayName": "Right"
                },
                {
                    "value": "TopCenter",
                    "displayName": "Top Center"
                },
                {
                    "value": "BottomCenter",
                    "displayName": "Bottom Center"
                },
                {
                    "value": "LeftCenter",
                    "displayName": "Left Center"
                },
                {
                    "value": "RightCenter",
                    "displayName": "Right center"
                }
            ],
            "legendMarkerRendering": [
                {
                    "value": "markerOnly",
                    "displayName": "Markers only"
                },
                {
                    "value": "lineAndMarker",
                    "displayName": "Line and markers"
                },
                {
                    "value": "lineOnly",
                    "displayName": "Line only"
                }
            ]
        },
        "categoryAxis": {
            "axisScale": [
                {
                    "value": "linear",
                    "displayName": "Linear"
                },
                {
                    "value": "log",
                    "displayName": "Log"
                }
            ],
            "axisType": [
                {
                    "value": "Scalar",
                    "displayName": "Continuous"
                },
                {
                    "value": "Categorical",
                    "displayName": "Categorical"
                }
            ],
            "axisStyle": [
                {
                    "value": "showTitleOnly",
                    "displayName": "Show title only"
                },
                {
                    "value": "showUnitOnly",
                    "displayName": "Show unit only"
                },
                {
                    "value": "showBoth",
                    "displayName": "Show both"
                }
            ],
            "gridlineStyle": [
                {
                    "value": "dashed",
                    "displayName": "Dashed"
                },
                {
                    "value": "solid",
                    "displayName": "Solid"
                },
                {
                    "value": "dotted",
                    "displayName": "Dotted"
                }
            ],
            "position": [
                {
                    "value": "Left",
                    "displayName": "Left"
                },
                {
                    "value": "Right",
                    "displayName": "Right"
                }
            ]
        },
        "valueAxis": {
            "position": [
                {
                    "value": "Left",
                    "displayName": "Left"
                },
                {
                    "value": "Right",
                    "displayName": "Right"
                }
            ],
            "axisScale": [
                {
                    "value": "linear",
                    "displayName": "Linear"
                },
                {
                    "value": "log",
                    "displayName": "Log"
                }
            ],
            "axisStyle": [
                {
                    "value": "showTitleOnly",
                    "displayName": "Show title only"
                },
                {
                    "value": "showUnitOnly",
                    "displayName": "Show unit only"
                },
                {
                    "value": "showBoth",
                    "displayName": "Show both"
                }
            ],
            "gridlineStyle": [
                {
                    "value": "dashed",
                    "displayName": "Dashed"
                },
                {
                    "value": "solid",
                    "displayName": "Solid"
                },
                {
                    "value": "dotted",
                    "displayName": "Dotted"
                }
            ],
            "secPosition": [
                {
                    "value": "Left",
                    "displayName": "Left"
                },
                {
                    "value": "Right",
                    "displayName": "Right"
                }
            ],
            "secAxisScale": [
                {
                    "value": "linear",
                    "displayName": "Linear"
                },
                {
                    "value": "log",
                    "displayName": "Log"
                }
            ],
            "secAxisStyle": [
                {
                    "value": "showTitleOnly",
                    "displayName": "Show title only"
                },
                {
                    "value": "showUnitOnly",
                    "displayName": "Show unit only"
                },
                {
                    "value": "showBoth",
                    "displayName": "Show both"
                }
            ]
        },
        "lineStyles": {
            "strokeLineJoin": [
                {
                    "value": "miter",
                    "displayName": "Miter"
                },
                {
                    "value": "round",
                    "displayName": "Round"
                },
                {
                    "value": "bevel",
                    "displayName": "Bevel"
                }
            ],
            "lineStyle": [
                {
                    "value": "dashed",
                    "displayName": "Dashed"
                },
                {
                    "value": "solid",
                    "displayName": "Solid"
                },
                {
                    "value": "dotted",
                    "displayName": "Dotted"
                }
            ],
            "markerShape": [
                {
                    "value": "circle",
                    "displayName": "●"
                },
                {
                    "value": "square",
                    "displayName": "■"
                },
                {
                    "value": "diamond",
                    "displayName": "◆"
                },
                {
                    "value": "triangle",
                    "displayName": "▲"
                },
                {
                    "value": "x",
                    "displayName": "☓"
                },
                {
                    "value": "shortDash",
                    "displayName": " -"
                },
                {
                    "value": "longDash",
                    "displayName": "—"
                },
                {
                    "value": "plus",
                    "displayName": "+"
                }
            ]
        },
        "trend": {
            "style": [
                {
                    "value": "dashed",
                    "displayName": "Dashed"
                },
                {
                    "value": "solid",
                    "displayName": "Solid"
                },
                {
                    "value": "dotted",
                    "displayName": "Dotted"
            }
        ]
    },
    "y1AxisReferenceLine": {
        "style": [
            {
                "value": "dashed",
                "displayName": "Dashed"
            },
            {
                "value": "solid",
                "displayName": "Solid"
            },
            {
                "value": "dotted",
                "displayName": "Dotted"
            }
        ],
        "position": [
            {
                "value": "back",
                "displayName": "Behind"
            },
            {
                "value": "front",
                "displayName": "In Front"
            }
        ],
        "dataLabelText": [
            {
                "value": "Value",
                "displayName": "Value"
            },
            {
                "value": "Name",
                "displayName": "Name"
            },
            {
                "value": "ValueAndName",
                "displayName": "Name and Value"
            }
        ],
        "dataLabelHorizontalPosition": [
            {
                "value": "left",
                "displayName": "Left"
            },
            {
                "value": "right",
                "displayName": "Right"
            }
        ],
        "dataLabelVerticalPosition": [
            {
                "value": "above",
                "displayName": "Above"
            },
            {
                "value": "under",
                "displayName": "Under"
            }
        ]
    },
    "referenceLine": {
        "style": [
            {
                "value": "dashed",
                "displayName": "Dashed"
            },
            {
                "value": "solid",
                "displayName": "Solid"
            },
            {
                "value": "dotted",
                "displayName": "Dotted"
            }
        ],
        "position": [
            {
                "value": "back",
                "displayName": "Behind"
            },
            {
                "value": "front",
                "displayName": "In Front"
            }
        ],
        "dataLabelText": [
      {
        "value": "Value",
        "displayName": "Value"
      },
      {
        "value": "Name",
        "displayName": "Name"
      },
      {
        "value": "ValueAndName",
        "displayName": "Name and Value"
      }
    ],
    "dataLabelHorizontalPosition": [
      {
        "value": "left",
        "displayName": "Left"
      },
      {
        "value": "right",
        "displayName": "Right"
      }
    ],
    "dataLabelVerticalPosition": [
      {
        "value": "above",
        "displayName": "Above"
      },
      {
        "value": "under",
        "displayName": "Under"
      }
    ]
    },
    "labels": {
    "labelOrientation": [
      {
        "value": "vertical",
        "displayName": "Vertical"
      },
      {
        "value": "horizontal",
        "displayName": "Horizontal"
      }
    ],
    "labelPosition": [
      {
        "value": "Auto",
        "displayName": "Auto"
      },
      {
        "value": "InsideEnd",
        "displayName": "Inside End"
      },
      {
        "value": "OutsideEnd",
        "displayName": "Outside End"
      },
      {
        "value": "InsideCenter",
        "displayName": "Inside Center"
      },
      {
        "value": "InsideBase",
        "displayName": "Inside Base"
      }
    ],
    "labelStyle": [
      {
        "value": "Category",
        "displayName": "Category"
      },
      {
        "value": "Data",
        "displayName": "Data value"
      },
      {
        "value": "Percent of total",
        "displayName": "Percent of total"
      },
      {
        "value": "Both",
        "displayName": "Category, data value"
      },
      {
        "value": "Category, percent of total",
        "displayName": "Category, percent of total"
      },
      {
        "value": "Data value, percent of total",
        "displayName": "Data value, percent of total"
      },
      {
        "value": "Category, data value, percent of total",
        "displayName": "All detail labels"
      }
     ]
    },
    "card": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
         ]
    },
    "imageScaling": {
        "imageScalingType": [
          {
            "value": "Normal",
            "displayName": "Normal"
          },
          {
            "value": "Fit",
            "displayName": "Fit"
          },
          {
            "value": "Fill",
            "displayName": "Fill"
          }
        ]
    },
    "forecast": {
        "confidenceBandStyle": [
          {
            "value": "fill",
            "displayName": "Fill"
          },
          {
            "value": "line",
            "displayName": "Line"
          },
          {
            "value": "none",
            "displayName": "None"
          }
        ],
        "style": [
          {
            "value": "dashed",
            "displayName": "Dashed"
          },
          {
            "value": "solid",
            "displayName": "Solid"
          },
          {
            "value": "dotted",
            "displayName": "Dotted"
          }
        ]
        },
        "mapStyles": {
        "mapTheme": [
          {
            "value": "aerial",
            "displayName": "Aerial"
          },
          {
            "value": "canvasDark",
            "displayName": "Dark"
          },
          {
            "value": "canvasLight",
            "displayName": "Light"
          },
          {
            "value": "grayscale",
            "displayName": "Grayscale"
          },
          {
            "value": "road",
            "displayName": "Road"
          }
        ]
    },
    "shape": {
        "projectionEnum": [
          {
            "value": "albersUsa",
            "displayName": "Albers USA"
          },
          {
            "value": "equirectangular",
            "displayName": "Equirectangular"
          },
          {
            "value": "mercator",
            "displayName": "Mercator"
          },
          {
            "value": "orthographic",
            "displayName": "Orthographic"
          }
        ]
        },
        "xAxisReferenceLine": {
        "style": [
          {
            "value": "dashed",
            "displayName": "Dashed"
          },
          {
            "value": "solid",
            "displayName": "Solid"
          },
          {
            "value": "dotted",
            "displayName": "Dotted"
          }
        ],
        "position": [
          {
            "value": "back",
            "displayName": "Behind"
          },
          {
            "value": "front",
            "displayName": "In Front"
          }
        ],
        "dataLabelText": [
          {
            "value": "Value",
            "displayName": "Value"
          },
          {
            "value": "Name",
            "displayName": "Name"
          },
          {
            "value": "ValueAndName",
            "displayName": "Name and Value"
          }
        ],
        "dataLabelHorizontalPosition": [
          {
            "value": "left",
            "displayName": "Left"
          },
          {
            "value": "right",
            "displayName": "Right"
          }
        ],
        "dataLabelVerticalPosition": [
          {
            "value": "above",
            "displayName": "Above"
          },
          {
            "value": "under",
            "displayName": "Under"
          }
        ]
        },
        "ratioLine": {
        "style": [
          {
            "value": "dashed",
            "displayName": "Dashed"
          },
          {
            "value": "solid",
            "displayName": "Solid"
          },
          {
            "value": "dotted",
            "displayName": "Dotted"
          }
        ]
        },
        "columnHeaders": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "values": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "total": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "rowHeaders": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "subTotals": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ],
        "rowSubtotalsPosition": [
          {
            "value": "Top",
            "displayName": "Top"
          },
          {
            "value": "Bottom",
            "displayName": "Bottom"
          }
        ]
        },
        "general": {
        "orientation": [
          {
            "value": "vertical",
            "displayName": "Vertical"
          },
          {
            "value": "horizontal",
            "displayName": "Horizontal"
          }
        ]
        },
        "data": {
        "relativeRange": [
          {
            "value": "Last",
            "displayName": "Last"
          },
          {
            "value": "Next",
            "displayName": "Next"
          },
          {
            "value": "This",
            "displayName": "This"
          }
        ],
        "relativePeriod": [
          {
            "value": "None",
            "displayName": "Select"
          },
          {
            "value": "Days",
            "displayName": "Days"
          },
          {
            "value": "Weeks",
            "displayName": "Weeks"
          },
          {
            "value": "Calendar Weeks",
            "displayName": "Weeks (Calendar)"
          },
          {
            "value": "Months",
            "displayName": "Months"
          },
          {
            "value": "Calendar Months",
            "displayName": "Months (Calendar)"
          },
          {
            "value": "Years",
            "displayName": "Years"
          },
          {
            "value": "Calendar Years",
            "displayName": "Years (Calendar)"
          }
        ],
        "mode": [
          {
            "value": "Between",
            "displayName": "Between"
          },
          {
            "value": "Before",
            "displayName": "Before"
          },
          {
            "value": "After",
            "displayName": "After"
          },
          {
            "value": "Basic",
            "displayName": "List"
          },
          {
            "value": "Dropdown",
            "displayName": "Dropdown"
          },
          {
            "value": "Relative",
            "displayName": "Relative"
          },
          {
            "value": "Single",
            "displayName": "Single Value"
          }
        ]
        },
        "header": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "items": {
        "outline": [
          {
            "value": "None",
            "displayName": "None"
          },
          {
            "value": "BottomOnly",
            "displayName": "Bottom only"
          },
          {
            "value": "TopOnly",
            "displayName": "Top only"
          },
          {
            "value": "LeftOnly",
            "displayName": "Left only"
          },
          {
            "value": "RightOnly",
            "displayName": "Right only"
          },
          {
            "value": "TopBottom",
            "displayName": "Top + bottom"
          },
          {
            "value": "LeftRight",
            "displayName": "Left + right"
          },
          {
            "value": "Frame",
            "displayName": "Frame"
          }
        ]
        },
        "status": {
        "direction": [
          {
            "value": "Positive",
            "displayName": "High is good"
          },
          {
            "value": "Negative",
            "displayName": "Low is good"
          }
         ]
       }
    }
