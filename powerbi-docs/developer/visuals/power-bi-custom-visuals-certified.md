---
title: Getting Power BI visuals certified
description: Requirements and process to submit a custom visual for certification, and a list of certified Power BI visuals.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: ""
featuredvideoid: ''
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.topic: how-to
ms.date: 12/05/2021
---

# Get a Power BI visual certified

Certified Power BI visuals are Power BI visuals in [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals) that meet the Microsoft Power BI team [code requirements](#certification-requirements). These visuals are tested to verify that they don't access external services or resources, and that they follow secure coding patterns and guidelines.

Once a Power BI visual is certified, it offers more features. For example, you can [export to PowerPoint](../../consumer/end-user-powerpoint.md), or display the visual in received emails, when a user [subscribes to report pages](../../consumer/end-user-subscribe.md).

The certification process is optional. Power BI visuals that are not certified, are not necessarily unsafe Power BI visuals. Some Power BI visuals aren't certified because they don't comply with one or more of the [certification requirements](power-bi-custom-visuals-certified.md#certification-requirements). For example, a map Power BI visual connecting to an external service, or a Power BI visual using commercial libraries.

> [!NOTE]
> Microsoft is not the author of third-party Power BI visuals. To verify the functionality of third-party visuals, contact the author of the visual directly.

## Certification requirements

To get your Power BI visual [certified](#get-a-power-bi-visual-certified), your Power BI visual must comply with the requirements listed in this section.

### General requirements

Your Power BI visual has to be approved by Partner Center. We recommend that your Power BI visual is already in [AppSource](https://appsource.microsoft.com/marketplace/apps?page=1&product=power-bi-visuals). To learn how to publish a Power BI visual to AppSource, see [Publish Power BI visuals to Partner Center](office-store.md).

Before submitting your Power BI visual to be certified, verify that:

* the visual complies with the [guidelines for Power BI visuals](guidelines-powerbi-visuals.md)
* the visual passes all the [required tests](submission-testing.md)
* the compiled package exactly matches the submitted package

### Code repository requirements

Although you don't have to publicly share your code in GitHub, the code repository has to be available for a review by the Power BI team. The best way to do this, is by providing the source code (JavaScript or TypeScript) in GitHub.

The repository must contain the following:

* Code for only one Power BI visual. It can't contain code for multiple Power BI visuals, or unrelated code.
* A branch named **certification** (lowercase required). The source code in this branch has to match the submitted package. This code can only be updated during the next submission process, if you're resubmitting your Power BI visual.

If your Power BI visual uses private npm packages, or git submodules, you must provide access to the additional repositories containing this code.

To understand how a Power BI visual repository looks, review the GitHub repository for the [Power BI visuals sample bar chart](https://github.com/microsoft/PowerBI-visuals-sampleBarChart).

### File requirements

Use the latest version of the API to write the Power BI visual.

The repository must include the following files:

* **.gitignore** - Add `node_modules`, `.tmp` and  `dist` to this file. The code cannot include the *node_modules*, *.tmp* or *dist* folders.
* **capabilities.json** - If you are submitting newer version of your Power BI visual with changes to the properties in this file, verify that they do not break reports for existing users.
* **pbiviz.json**
* **package.json**. The visual must have the following package installed:
  * ["tslint"](https://www.npmjs.com/package/tslint) - Version 5.18.0 or higher
  * ["typescript"](https://www.npmjs.com/package/typescript) - Version 3.0.0 or higher
  * ["tslint-microsoftcontrib"](https://www.npmjs.com/package/tslint-microsoft-contrib) - Version 6.2.0 or higher
  * The file must contain a command for running linter -  `"lint": "tslint -c tslint.json -p tsconfig.json"`
* **package-lock.json**
* **tsconfig.json**

### Command requirements

Make sure that the following commands don't return any errors.

* `npm install`
* `pbiviz package`
* `npm audit` - Must not return any warnings with high or moderate level.
* [TSlint from Microsoft](https://www.npmjs.com/package/tslint-microsoft-contrib) with [the required configuration](https://github.com/microsoft/PowerBI-visuals-sampleBarChart/blob/master/tslint.json). This command must not return any lint errors.

### Compiling requirements

Use the latest version of [powerbi-visuals-tools](https://www.npmjs.com/package/powerbi-visuals-tools) to write the Power BI visual.

You must compile your Power BI visual with `pbiviz package`. If you're using your own build scripts, provide a `npm run package` custom build command.

### Source code requirements

Verify that you follow the [Power BI visuals additional certification](/legal/marketplace/certification-policies#1200-power-bi-visuals-additional-certification) policy list. If your submission doesn't follow these guidelines, the rejection email from Partner Center will include the policy numbers listed in this link.

Follow the code requirements listed below to make sure that your code is in line with the Power BI certification policies.  

The following are **Required**:

* Only use public reviewable OSS components such as public JavaScript or TypeScript libraries.
* The code must support the [Rendering Events API](event-service.md).
* Ensure DOM is manipulated safely. Use sanitization for user input or user data, before adding it to DOM.
* Use the [sample report](https://github.com/PowerBi-Projects/PowerBI-visuals/tree/gh-pages/assets) as a test dataset.

The following are **Not allowed**:

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

### Private repository submission process

If you're using a private repository such as GitHub to submit your Power BI visual for certification, follow the instructions in this section.

1. Create a new account for the validation team.
2. Configure [two-factor authentication](https://help.github.com/github/authenticating-to-github/securing-your-account-with-two-factor-authentication-2fa) for your account.
3. [Generate a new set of recovery codes](https://help.github.com/github/authenticating-to-github/configuring-two-factor-authentication-recovery-methods#generating-a-new-set-of-recovery-codes).
4. When submitting your Power BI visual, make sure you provide the following:
    * A link to the repository
    * Login credentials (including a password)
    * Recovery codes
    * Read-only permissions to our account ([pbicvsupport](https://github.com/pbicvsupport))

## Certified Power BI visual badges

Once a Power BI visual is certified, it gets a designated badge that indicates that it's certified.

### Certified Power BI visuals in AppSource

* When searching online for [Power BI visuals in AppSource](https://appsource.microsoft.com/marketplace/apps?product=power-bi-visuals), a small yellow badge on the visual's card indicates that it's a certified Power BI visual.

    ![AppSource certified Power BI visual](media/power-bi-custom-visuals-certified/certified-visual-yellow-small.png)

* After clicking the Power BI visual card in AppSource, a yellow badge titled *PBI Certified* indicates that this Power BI visual is certified.

    ![App page certified Power BI visual](media/power-bi-custom-visuals-certified/certified-visual-yellow-big.png)

### Certified Power BI visuals in the Power BI interface

* When importing a Power BI visual from within Power BI (Desktop or service), a blue badge indicates that the Power BI visual is certified.

    ![Power BI interface certified Power BI visual](media/power-bi-custom-visuals-certified/certified-visual-blue.png)

* You can display only certified Power BI visuals, by selecting the *Power BI Certified* filter option.

## Publication timeline

Deploying to AppSource is a process that may take some time.
Your Power BI visual will be available to download from AppSource when this process is complete.

### When will users be able to download my visual?

* If you submitted a Power BI visual for the first time, users will be able to download it a few hours after you receive an email from AppSource.

* If you submitted an update to an existing Power BI visual, users will be able to download it within two weeks of your submission.

    >[!NOTE]
    > The *version* field in AppSource will be updated with the day your Power BI was approved by AppSource, approximately a week after you submitted your visual. Users will be able to download the updated visual but the updated capabilities will not take effect. Your visual's new capabilities will affect the user's reports after about a two weeks.

### When will my Power BI visual display a certification badge?

* If you submitted a Power BI visual for the first time, the certification badge will appear within a day of receiving the approval email from AppSource.

* If you're requesting certification for an existing Power BI visual, the certification badge will be visible within two weeks of your submission.

## Next steps

>[!div class="nextstepaction"]
>[Frequently asked questions about certified visuals](power-bi-custom-visuals-faq.yml#certified-power-bi-visuals).

>[!div class="nextstepaction"]
>[Guidelines for publishing Power BI visuals](guidelines-powerbi-visuals.md)

>[!div class="nextstepaction"]
>[Publish Power BI visuals to Microsoft AppSource](office-store.md)

>[!div class="nextstepaction"]
>[Try the Power BI Community](https://community.powerbi.com/)
