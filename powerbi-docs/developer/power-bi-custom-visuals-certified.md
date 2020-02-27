---
title: Certified Power BI visuals
description: Requirements and process to submit a custom visual for certification, and a list of certified Power BI visuals.
author: KesemSharabi
ms.author: kesharab
ms.reviewer: ""
featuredvideoid: ''
ms.service: powerbi
ms.topic: conceptual
ms.subservice: powerbi-custom-visuals
ms.date: 02/17/2020
---

# Get a Power BI visual certified

Certified Power BI visuals are Power BI visuals in [AppSource](https://appsource.microsoft.com/en-us/marketplace/apps?page=1&product=power-bi-visuals) that meet the Microsoft Power BI team [code requirements](#certification-requirements). These visuals are tested to verify that they don't access external services or resources, and that they follow secure coding patterns and guidelines.

Once a Power BI visual is certified, it offers more features. For example, you can [export to PowerPoint](../consumer/end-user-powerpoint.md), or display the visual in received emails, when a user [subscribes to report pages](../consumer/end-user-subscribe.md).

The certification process is optional. Power BI visuals that are not certified, are not necessarily unsafe Power BI visuals. Some Power BI visuals aren't certified because they don’t comply with one or more of the [certification requirements](https://docs.microsoft.com/power-bi/power-bi-custom-visuals-certified?#certification-requirements). For example, a map Power BI visual connecting to an external service, or a Power BI visual using commercial libraries.

> [!NOTE]
> Microsoft is not the author of third-party Power BI visuals. To verify the functionality of third-party visuals, contact the author of the visual directly.

## Certification requirements

To get your Power BI visual [certified](#get-a-power-bi-visual-certified), your Power BI visual must comply with the requirements listed in this section. 

### General requirements

Your Power BI visual has to be approved by Seller Dashboard or Partner Center. We recommend that your Power BI visual is already in [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals). To learn how to publish a Power BI visual to AppSource, see [Publish Power BI visuals to Partner Center](office-store.md).

Before submitting your Power BI visual to be certified, verify that it complies with the [guidelines for Power BI visuals](./guidelines-powerbi-visuals.md).

When submitting the Power BI visual, make sure that the compiled package exactly matches the submitted package.

### Code repository requirements

Although you don’t have to publicly share your code in GitHub, the code repository has to be available for a review by the Power BI team. The best way to do this, is by providing the source code (JavaScript or TypeScript) in GitHub.

The repository must contain the following:
* Code for only one Power BI visual. It can't contain code for multiple Power BI visuals, or unrelated code.
* A branch named **certification** (lowercase required). The source code in this branch has to match the submitted package. This code can only be updated during the next submission process, if you're resubmitting your Power BI visual.

If your Power BI visual uses private npm packages, or git submodules, you must provide access to the additional repositories containing this code.

To understand how a Power BI visual repository looks like, review the GitHub repository for the [Power BI visuals sample bar chart](https://github.com/microsoft/PowerBI-visuals-sampleBarChartgi).

### File requirements

Use the latest version of the API to write the Power BI visual.

The repository must include the following files:
* **.gitignore** - Add `node_modules` to this file. The code cannot include the *node_modules* folder.
* **capabilities.json** - If you are submitting newer version of your Power BI visual with changes to the properties in this file, verify that they do not break reports for existing users.
* **pbiviz.json**
* **package.json**
* **package-lock.json**
* **tsconfig.json**

### Command requirements

Make sure that the following commands don't return any errors.

* `npm install`
* `pbiviz package`
* `npm audit` - Must not return any warnings with high or moderate level.
* [TSlint from Microsoft](https://www.npmjs.com/package/tslint-microsoft-contrib) with no overridden configurations. This command must not return any lint errors.

### Compiling requirements

Use the latest version of [powerbi-visuals-tools](https://www.npmjs.com/package/powerbi-visuals-tools) to write the Power BI visual.

You must compile your Power BI visual with `pbiviz package`. If you're using your own build scripts, provide a `npm run package` custom build command.



### Source code requirements

Verify that you follow the [Power BI visuals additional certification](https://docs.microsoft.com/legal/marketplace/certification-policies#1200-power-bi-visuals-additional-certification) policy list. If your submission doesn't follow these guidelines, the rejection email from Partner Center will include the policy numbers listed in this link.

Follow the code requirements listed below to make sure that your code is in line with the Power BI certification policies.  

**Required**
* Only use public reviewable OSS components such as public JavaScript or TypeScript libraries.
* The code must support the [Rendering Events API](./visuals/event-service.md).
* Ensure DOM is manipulated safely. Use sanitization for user input or user data, before adding it to DOM.
* Use the [sample report](https://github.com/Microsoft/PowerBI-visuals/raw/gh-pages/assets/reports/large_data.pbix) as a test dataset.

**Not allowed**
* Accessing external services or resources. For example, no HTTP/S or WebSocket requests can go out of Power BI to any services.
* Using `innerHTML`, or `D3.html(user data or user input)`.
* JavaScript errors or exceptions in the browser console, for any input data.
* Arbitrary or dynamic code such as `eval()`, unsafe use of `settimeout()`, `requestAnimationFrame()`, `setinterval(user input function)`, and user input or user data.
* Minified JavaScript files or projects.

## Submitting a Power BI visual for certification

You can request to have your Power BI visual certified by the Power BI team via Partner Center.

>[!TIP]
>The Power BI certification process might take time. If you're creating a new Power BI visual, we recommend that you publish your Power BI visual via the Partner Center before you request Power BI certification. This ensures that the publishing of your visual is not delayed.

To request Power BI certification:

1. Sign in to Partner Center.
2. On the **Overview page**, choose your Power BI visual, and go to the **Product** setup page.
3. Select the **Request Power BI certification** check box.
4. On the **Review and publish** page, in the **Notes for certification** text box, provide a link to the source code and the credentials required to access it.

>[!NOTE]
> If you are in the middle of a Power BI visual submission process, and have to use [Seller Dashboard](https://docs.microsoft.com/office/dev/store/use-the-seller-dashboard-to-submit-to-the-office-store) (the old management tool), review the [Seller Dashboard certification submission process](seller-dashboard.md#seller-dashboard-certification-submission-process) instructions.

### Private repository submission process

If you're using a private repository such as GitHub to submit your Power BI visual for certification, follow the instructions in this section.
1. Create a new account for the validation team.
2. Configure [two-factor authentication](https://help.github.com/github/authenticating-to-github/securing-your-account-with-two-factor-authentication-2fa) for your account.
3. [Generate a new set of recovery codes](https://help.github.com/github/authenticating-to-github/configuring-two-factor-authentication-recovery-methods#generating-a-new-set-of-recovery-codes).
4. When submitting your Power BI visual, provide the following:
    * A link to the repository
    * Login credentials (including a password)
    * Recovery codes
    * Read-only permissions to our account ([pbicvsupport](https://github.com/pbicvsupport))

## Certified Power BI visuals

The certified Power BI visuals are listed below. Click the link to open the Power BI visual in AppSource. If a video is available, you can click the video link to watch it.

* [3AG Systems - Bar Chart With Absolute Variance](https://appsource.microsoft.com/product/power-bi-visuals/WA104381802)
*  [3AG Systems - Bar Chart With Relative Variance](https://appsource.microsoft.com/product/power-bi-visuals/WA104381912)
*  [3AG Systems - Column Chart With Relative Variance](https://appsource.microsoft.com/product/power-bi-visuals/WA104381803)
*  [3AG Systems - Column Chart with Variance](https://appsource.microsoft.com/product/power-bi-visuals/WA104381724)
* [Advanced Donut Visual (Full Edition)](https://appsource.microsoft.com/product/power-bi-visuals/WA104381941)
*  [Advanced Donut Visual (Light Edition)](https://appsource.microsoft.com/product/power-bi-visuals/WA104380858)
*  [Advanced Graph Visual](https://appsource.microsoft.com/product/power-bi-visuals/WA104382086)
*  [Advanced Network Visualization](https://appsource.microsoft.com/product/power-bi-visuals/WA104381942)
*  [Advanced TimeSeries Visual (Full Edition)](https://appsource.microsoft.com/product/power-bi-visuals/WA104381943)
*  [Aster Plot](https://appsource.microsoft.com/product/power-bi-visuals/WA104380759)
*  [Beyondsoft Calendar](https://appsource.microsoft.com/product/power-bi-visuals/WA104381096)
*  [Bowtie Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380838)
*  [Box and Whisker chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380831)
* [Box and Whisker chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381351)
*  [Brick Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380836)
*  [Bubble Chart by Akvelon](https://appsource.microsoft.com/product/power-bi-visuals/WA104381340)
*  [Bullet Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380755),  **[video link](https://youtu.be/AOlsFYkfkcw)**
* [Bullet Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380755)
*  [Bullet Chart by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380953), **[video link](https://youtu.be/mtvUNl9bMjA)**
* [Calendar by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381844)
*  [Calendar by Tallan](https://appsource.microsoft.com/product/power-bi-visuals/WA104381146)
*  [Candlestick by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380952), **[video link](https://youtu.be/nT_18gyRxPo)**
*  [Card with States by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380967)
*  [Chiclet Slicer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380756)
*  [Chord](https://appsource.microsoft.com/product/power-bi-visuals/WA104380761), **[video link](https://youtu.be/AQvd2FhRyCI)**
*  [Circular Gauge by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380837)
*  [Cluster Map](https://appsource.microsoft.com/product/power-bi-visuals/WA104380806)
* [Custom Calendar by Akvelon](https://appsource.microsoft.com/product/power-bi-visuals/WA104381179)
* [Cylindrical Gauge by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380874)
*  [Dial Gauge](https://appsource.microsoft.com/product/power-bi-visuals/WA104381184)
[Dot Plot](https://appsource.microsoft.com/product/power-bi-visuals/WA104380760)
*  [Dot Plot by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380949), **[video link](https://youtu.be/By16pX9KT40)**
*  [Drilldown Cartogram](https://appsource.microsoft.com/product/power-bi-visuals/WA104381045)
*  [Drilldown Choropleth](https://appsource.microsoft.com/product/power-bi-visuals/WA104381044)
*  [Drill-down column chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380857), **[video link](https://youtu.be/lBy2gQQ5YsQ)**
*  [Drill-down column chart for time based data](https://appsource.microsoft.com/product/power-bi-visuals/WA104380881), **[video link](https://youtu.be/T_mRou18vx0)**
*  [Drill-down donut chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380858), **[video link](https://youtu.be/AUVFrSHmPeo)**
*  [Dual KPI](https://appsource.microsoft.com/product/power-bi-visuals/WA104380774)
*  [Dynamic Tooltip by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380983)
*  [Enhanced Scatter](https://appsource.microsoft.com/product/power-bi-visuals/WA104380762), **[video link](https://youtu.be/xCfM0cjM4do)**
*  [Enlighten Aquarium](https://appsource.microsoft.com/product/power-bi-visuals/WA104381112)
*  [Enlighten Slicer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380960)
*  [Enlighten Stack Shuffle](https://appsource.microsoft.com/product/power-bi-visuals/WA104380849)
*  [Enlighten Waffle Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380850)
*  [Filter by List by Devscope](https://appsource.microsoft.com/product/power-bi-visuals/WA104381413), **[video link](https://youtu.be/RetEWGwBu0I)**
*  [Force-Directed Graph](https://appsource.microsoft.com/product/power-bi-visuals/WA104380764), **[video link](https://youtu.be/YsTa7uyJ4sg)**
*  [Funnel with Source by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381334)
*  [Gantt](https://appsource.microsoft.com/product/power-bi-visuals/WA104380765), **[video link](https://youtu.be/qJ7s_KrGiUU)**
* [Gantt Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381364)
*  [Globe Data Bars](https://appsource.microsoft.com/product/power-bi-visuals/WA104381344)
*  [Grid by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380825)
*  [Hierarchy Chart by Akvelon](https://appsource.microsoft.com/product/power-bi-visuals/WA104381333), **[video link](https://youtu.be/0ZGzJaq_KT4)**
*  [Histogram Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380776)
*  [Histogram with points by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381032)
* [Horizontal bar chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104381230)
*  [Horizontal Funnel by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380846)
*  [Image by CloudScope](https://appsource.microsoft.com/product/power-bi-visuals/WA104381297)
*  [Image Grid](https://appsource.microsoft.com/product/power-bi-visuals/WA104381355)
*  [Infographic Designer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380898)
*  [KPI Chart by Akvelon](https://appsource.microsoft.com/product/power-bi-visuals/WA104381432)
*  [KPI Column by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380996)
*  [KPI Grid by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380947)
*  [KPI Indicator](https://appsource.microsoft.com/product/power-bi-visuals/WA104380832)
*  [KPI Ticker by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380946)
* [Linear Gauge by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380821)
*  [LineDot Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380766)
*  [Mekko Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380785), **[video link](https://youtu.be/90FLCKpgicA)**
*  [Multi KPI](https://appsource.microsoft.com/product/power-bi-visuals/WA104381763)
*  [Overview by CloudScope](https://appsource.microsoft.com/product/power-bi-visuals/WA104381477)
*  [Play Axis (Dynamic Slicer)](https://appsource.microsoft.com/product/power-bi-visuals/WA104380981)
*  [Power KPI](https://appsource.microsoft.com/product/power-bi-visuals/WA104381083), [video link](https://youtu.be/IvfIP3E6-1Q)
*  [Power KPI Matrix](https://appsource.microsoft.com/product/power-bi-visuals/WA104381299), **[video link](https://youtu.be/1enze8pcGzY)**
*  [Pulse Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104381006), **[video link](https://youtu.be/DQWdcQtjDVw)**
*  [Quadrant Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381011)
*  [Radar Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380771)
*  [Ring Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380824)
*  [Rotating Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381007)
*  [Sankey Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380777), **[video link](https://youtu.be/WWP9wVUHGaA)**
*  [Scatter Chart by Akvelon](https://appsource.microsoft.com/product/power-bi-visuals/WA104381703)
*  [Scroller](https://appsource.microsoft.com/product/power-bi-visuals/WA104381018)
*  [Smart Filter by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380859), **[video link](https://youtu.be/gcJsDDRQq28)**
*  [Sparkline by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380910), **[video link](https://youtu.be/0m3Vnvso9tY)**
*  [Stream Graph](https://appsource.microsoft.com/product/power-bi-visuals/WA104380772)
*  [Sunburst](https://appsource.microsoft.com/product/power-bi-visuals/WA104380767)
*  [Synoptic Panel by OKViz](https://appsource.microsoft.com/product/power-bi-visuals/WA104380873)
*  [Table Heatmap](https://appsource.microsoft.com/product/power-bi-visuals/WA104380818)
*  [Tachometer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380937), **[video link](https://youtu.be/C3OXdETbS9o)**
*  [Text Filter](https://appsource.microsoft.com/product/power-bi-visuals/WA104381309)
*  [Text Wrapper by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380826)
*  [Thermometer by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380847)
*  [Time Brush Slicer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380798)
*  [Timeline Slicer](https://appsource.microsoft.com/product/power-bi-visuals/WA104380786), **[video link](https://youtu.be/ozMtZ4_NZ10)**
*  [Timeline by CloudScope](https://appsource.microsoft.com/product/power-bi-visuals/WA104381427), [video link](https://youtu.be/szNi9YgXFJc)
*  [Tornado chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104380768), **[video link](https://www.youtube.com/watch?v=AQvd2FhRyCI)**
*  [Trading Chart by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104380823)
* [Ultimate KPI Card](https://appsource.microsoft.com/product/power-bi-visuals/WA104381977)
*  [Ultimate Variance](https://appsource.microsoft.com/product/power-bi-visuals/WA104381140), **[video link](https://youtu.be/pDYF8iZxERs)**
*  [Ultimate Waterfall](https://appsource.microsoft.com/product/power-bi-visuals/WA104380956), **[video link](https://youtu.be/0BZsVCQdEkc)**
*  [User List by CloudScope](https://appsource.microsoft.com/product/power-bi-visuals/WA104381426)
*  [Venn Diagram by MAQ Software](https://appsource.microsoft.com/product/power-bi-visuals/WA104381231)
*  [Violin Plot](https://appsource.microsoft.com/product/power-bi-visuals/WA104381947)
*  [Visio Visual](https://appsource.microsoft.com/product/power-bi-visuals/WA104381132)
*  [Waffle Chart](https://appsource.microsoft.com/product/power-bi-visuals/WA104381049), **[video link](https://youtu.be/1vRqYUsm3Vk)**
*  [Word Cloud](https://appsource.microsoft.com/product/power-bi-visuals/WA104380752), **[video link](https://youtu.be/AblTenl9fqo)**

## FAQ

For more information about visuals, see [Frequently asked questions about certified visuals](power-bi-custom-visuals-faq.md#certified-power-bi-visuals).

## Next steps

* [Developing a Power BI custom visual](../developer/custom-visual-develop-tutorial.md)
* [Microsoft's custom visual playlist on YouTube](https://www.youtube.com/playlist?list=PL1N57mwBHtN1vIjfvuBIzZllrmKo-Vz6x)  
* [Visualizations in Power BI](../visuals/power-bi-report-visualizations.md)  
* [Custom Visualizations in Power BI](power-bi-custom-visuals.md)  
* [Publish Power BI visuals to Microsoft AppSource](../developer/office-store.md) 
* If you're a web developer interested in creating your own Power BI visuals and adding them to the [Microsoft AppSource](https://appsource.microsoft.com), start with the [Developing a Power BI visual](visuals/custom-visual-develop-tutorial.md) tutorial. 

More questions? [Try the Power BI Community](https://community.powerbi.com/)
