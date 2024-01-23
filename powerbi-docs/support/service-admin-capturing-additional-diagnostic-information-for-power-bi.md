---
title: Capture diagnostic information for support
description: Instructions for manually collecting diagnostic information from the Power BI service. Send this info to support to help them troubleshoot.
author: kfollis
ms.author: kfollis
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-troubleshooting
ms.topic: troubleshooting
ms.date: 12/6/2022
ms.custom: ''
LocalizationGroup: Troubleshooting
---

# Capture diagnostic information from the Power BI service

Before you contact Microsoft Support for help with a problem you're having with the Power BI service, you can collect files that will help us solve your problem. We recommend you get a browser trace from your browser session. A browser trace is a diagnostic file that can provide important details about what is happening in the Power BI service when the problem occurs.

Power BI admins can use the **Help + support** experience in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) to get self-help solutions and to contact Support. The diagnostic files that you collect by using the following steps can be attached to your support request to help with troubleshooting. For more support options, see [Power BI support options](service-support-options.md).

To collect a browser trace and other session information, use the proceeding steps for the browser you use. If you need to collect diagnostic information from Power BI Desktop, follow the instructions in [Power BI Desktop diagnostics collection](../fundamentals/desktop-diagnostics.md).

## Collect a browser trace

> [!IMPORTANT]
>Sign in to the [Power BI service](https://app.powerbi.com) *before* you start to collect browser trace information, no matter which browser you use. This step is important to make sure that the trace information doesn't include sensitive information related to your sign-in.

#### [Google Chrome or Microsoft Edge](#tab/google-chrome-or-microsoft-edge)

Google Chrome and Microsoft Edge (Chromium) are both based on the [Chromium open source project](https://www.chromium.org/Home). The following steps show how to use the developer tools, which are similar in the two browsers. For more information, see [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools) and [Microsoft Edge (Chromium) Developer Tools](/microsoft-edge/devtools-guide-chromium). The following reference images are taken from Google Chrome.

1. After signing in, press F12 on your keyboard. Or, in Microsoft Edge select **Settings and more (...)** > **More tools** > **Developer tools**. In Google Chrome, select **Customize and control Google Chrome** :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/chromium-icon-settings.png" alt-text="Screenshot of the Google Chrome settings menu icon." border="false"::: > **More tools** > **Developer tools**.
1. Prepare to collect the browser trace by setting trace options. You'll also stop and clear any information that was collected before you start to reproduce the problem. By default, the browser keeps trace information only for the page that's currently loaded. Follow these steps to set up the browser to keep all trace information, even if your repro goes to more than one page:
    1. In the **Developer tools** window, select the **Network** tab. Then, select **Preserve log**.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-preserve-log.png" alt-text="Screenshot of the Google Chrome developer tools with network tab and preserve log selected." :::

    2. Select the **Console** tab, then select **Settings** > **Preserve log**.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-console-settings.png" alt-text="Screenshot of the Google Chrome developer tools with console tab and preserve log selected." :::

        Select **Settings** again to close the **Console settings**.

3. Next, stop and clear any recording in progress. Select the **Network** tab, select **Stop recording network log**, then **Clear**.

   :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-stop-recording.png" alt-text=" Screenshot of the Google Chrome developer tools with network tab and stop and clear recording options selected." :::

2. Now, you'll reproduce the problem that you were having in the Power BI service. To start, in **Developer tools** select the **Network** tab. Select **Record network log**.

    > [!IMPORTANT]
    >Refresh the browser page in the Power BI service before you start to reproduce the problem so that traces are correctly captured.

   Reproduce the steps that resulted in the problem you need help with.

     :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-record-network-log.png" alt-text="Screenshot of the Google Chrome developer tools with network tab and record network log selected." :::

    As you reproduce the problem, you'll see output similar to the following image in the **Developer tools** window.

    :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-output.png" alt-text="Screenshot of the Google Chrome developer tools with network tab displaying session output." :::

3. After reproducing the problem behavior, you need to save the log files and attach them to your support request.
    1. To export the network log, in **Developer tools** select the **Network** tab. Select **Stop recording network log**. Then, select **Export HAR...** and save the file.

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-export-har.png" alt-text="Screenshot of the Google Chrome developer tools with network tab, stop recording, and export HAR options selected." :::

    2. To export the console output, in **Developer tools** select the **Console** tab. Right-click on a displayed message, then select **Save as...**,  and save the console output to a text file.

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-save-as.png" alt-text=" Screenshot of the Google Chrome developer tools with console tab selected and save as option shown." :::

   Package the saved HAR file, console output, and screen recording in a compressed format, such as .zip, and attach the file to your support request.

#### [Apple Safari](#tab/apple-safari)

The following steps show how to use the developer tools in Apple Safari. For more information, see [Safari Developer Tools overview](https://support.apple.com/guide/safari-developer/safari-developer-tools-overview-dev073038698/11.0/mac).

1. After signing in, enable the developer tools in Apple Safari:
    1. From the page header, select **Safari** > **Preferences**.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-preferences.png" alt-text="Screenshot of the Apple Safari menu with preferences selected." :::

    2. Select **Advanced**, then select **Show Develop menu in menu bar** to enable the developer tools.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-show-develop-menu.png" alt-text="Screenshot of the Safari advanced menu with show develop menu in menu bar selected." :::

2. Next, you'll set options in the **Web Inspector** to enable your browser to keep all trace information. By default, the browser keeps trace information only for the page that's currently loaded. These settings ensure that trace information is collected even if your repro requires going to more than one page.

    1. Select **Develop** > **Show Web Inspector**.

        :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-web-inspector.png" alt-text="Screenshot of the Develop menu with Show Web Inspector selected." :::

    2. Select **Network** > **Preserve Log**

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-network-preserve-log.png" alt-text="Screenshot of the Web Inspector menu with Network and Preserve Log selected." :::

    1. Select **Console** > **Preserve Log**

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-console-preserve-log.png" alt-text="Screenshot of the Web Inspector menu with Console and Preserve Log selected." :::

3. After the options are set, select **Network** > **Clear Network Items** to make sure your logs contain only details about the problem repro.

    :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-clear-network-items.png" alt-text="Screenshot of the Web Inspector menu with Network and Clear Network Items selected." :::

4. Now you're ready to reproduce the problem.
    > [!IMPORTANT]
    >Refresh the browser page in the Power BI service before you start to reproduce the problem so that traces are correctly captured.

    Go through the steps to reproduce the issue you're having. As you reproduce the problem, you'll see output similar to the following image in the **Network** window.

    :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-session-output.png" alt-text="Screenshot of the Network window displaying sample output." :::

5. After reproducing the problem behavior, you need to save the log files and attach them to your support request.

    1. To export the network log, from the **Network** tab, select **Export** and save the file in HAR format.

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/safari-export.png" alt-text="Screenshot of the Network tab with export option selected." :::

    2. To export the console output, in **Develop** tools pane, select the **Console** tab and expand the window. Place your cursor at the start of the console output then drag and select the entire contents of the output. Use Command-C to copy the output and save it to a text file.

   Package the saved HAR file, console output, and screen recording in a compressed format, such as .zip, and attach the file to your support request.

#### [Firefox](#tab/firefox)

The following steps show how to use the developer tools in Firefox. For more information, see [Firefox Developer tools](https://developer.mozilla.org/docs/Tools).

1. After signing in, press F12 on your keyboard. Or, in Firefox select **Open menu** :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/firefox-menu.png" alt-text="Screenshot of the Firefox menu icon." border="false"::: > **Web Developer** > **Toggle Tools**. The tools appear at the bottom of your screen.

1. Next, you'll set options in the **Inspector** to enable your browser to keep all trace information. By default, the browser keeps trace information only for the page that's currently loaded. These settings ensure that trace information is collected even if your repro requires going to more than one page.

    1. In the **Inspector** window, select the **Network** tab, then select **Network settings** > **Persist Logs**.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/firefox-network-persist-logs.png" alt-text="Screenshot of the Inspector tools with network tab and persist logs selected." :::

    2. Select the **Console** tab, then select **Console settings** > **Persist Logs**.

       :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/firefox-console-persist-logs.png" alt-text="Screenshot of the Inspector tools with console tab and persist logs selected." :::

3. After the options are set, clear any recording in progress. Select the **Network** tab, then **Clear**.

   :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/browser-trace-stop-recording.png" alt-text="Screenshot of the Developer tools with network tab  and stop and clear recording options selected." :::

2. Now you're ready to reproduce the problem.
    > [!IMPORTANT]
    >Refresh the browser page in the Power BI service before you start to reproduce the problem so that traces are correctly captured.

    Go through the steps to reproduce the issue you're having.

3. After reproducing the problem behavior, you need to save the log files and attach them to your support request.
    1. To export the network log, select **Network** > **Network settings** then **Save All as HAR**.

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/firefox-save-har.png" alt-text="Screenshot of the Network tab with HAR export/import menu and save all options selected." :::

    2. To export the console output, select the **Console** tab. Right-click on a displayed message, then select **Export Visible Messages To** > **File**.

         :::image type="content" source="media/service-admin-capturing-additional-diagnostic-information-for-power-bi/firefox-export-visible-messages.png" alt-text="Screenshot of the Console tab selected and export visible messages option shown." :::

   Package the saved HAR file, console output, and screen recording in a compressed format, such as .zip, and attach the file to your support request.

---

After you collect the diagnostic files, attach them to your support request to help the support engineer solve your problem. The HAR file will contain all the information about network requests between the browser window and the Power BI service, including:

* The activity IDs for each request.

* The precise timestamp for each request.

* Any error information returned to the client.

This trace will also contain the data used to populate the visuals shown on the screen.

## Related content

* [Track Power BI service health in Microsoft 365](service-admin-health.md)
* [Service interruption notifications](service-interruption-notifications.md)
* [Join the Power BI Community](https://community.powerbi.com/)
