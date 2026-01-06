---
title: Add Images, Videos, and More to Your Dashboard
description: Learn how to use the Add a tile widget to add images, videos, text boxes, web code, or streaming data tiles to a Power BI dashboard for enhanced visualization.
author: julcsc
ms.author: juliacawthra
ms.reviewer: ''
ms.custom: video-removed, video-removed, video-removed
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 12/01/2025
LocalizationGroup: Dashboards
ai-usage: ai-assisted
#customer intent: As a Power BI dashboard designer, I want to add images, videos, and other content to my dashboard so that I can make it more informative, interactive, and visually appealing.
---

# Add images, videos, and more to your dashboard

[!INCLUDE [applies-no-desktop-yes-service](../includes/applies-no-desktop-yes-service.md)]

When you add a tile to your dashboard, you can place an image, text box, video, streaming data, or web code on your dashboard. This article takes you through the steps of adding different types of content to dashboards, making them more informative, interactive, and visually appealing.

> [!TIP]
> **Widget types available:** Use **Edit > Add a tile** to add images, text boxes, videos, streaming data, or web content (embed code) directly to your Power BI dashboard without pinning from a report.

> [!NOTE]
> You must have permission to edit the dashboard, or you won't see the same options described here. Your administrator might also disable certain content.

## Add an image, video, or other tile

You can add an image, text box, video, streaming data, or web code directly to your dashboard.

1. Select the arrow next to **Edit** in the top menu, and then select **Add a tile**.

    :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-tile-icon.png" alt-text="Screenshot showing the Add a tile selection.":::

1. Select the type of tile to add:
   - **[Web content](#add-web-content)**
   - **[Image](#add-an-image)**
   - **[Text box](#add-a-text-box-or-dashboard-heading)**
   - **[Video](#add-a-video)**
   - **[Custom streaming data](#add-streaming-data)**

    :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-tile.png" alt-text="Screenshot of the Add a tile window.":::

## Add an image

To add an image to your dashboard, such as a company logo, you must host the image at a publicly accessible URL. Power BI can't display images that require authentication to access.

> [!IMPORTANT]
> **Image hosting requirements:**
>
> - The image must be accessible through a direct public URL (for example, `https://example.com/images/logo.png`).
> - You **can't** use images stored in OneDrive, SharePoint, or other services that require sign-in because they require authentication.
> - Consider using a public web server, a content delivery network (CDN), or a cloud storage service with public access enabled (such as Azure Blob Storage with anonymous access).

Images can't be in .svg format.

1. From **Add a tile**, select **Image** > **Next**.

1. From **Add image tile**, add the image information:
   1. To display a title above the image, select **Display title and subtitle** and enter a **Title** and an optional **Subtitle**.
   1. Enter the image **URL**.
   1. To make the tile a hyperlink, select **Set custom link** and enter the **URL**.

      When colleagues click the image or title, they go to this URL.

   1. Select **Apply**.

      :::image type="content" source="media/service-dashboard-add-widget/pbi-widget-add-image-new.png" alt-text="Screenshot of the Add image tile window.":::

1. On the dashboard, resize and move the image as needed.

     :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-image-dash.png" alt-text="Screenshot of an image on a dashboard.":::

## Add a text box or dashboard heading

To add a dashboard heading, type your heading in the text box and increase the font size.

1. From the **Add a tile** window, select **Text box** > **Next**.
1. Format the text box:
   1. To display a title above the text box, select **Display title and subtitle** and enter a **Title** and an optional **Subtitle**.
   1. Enter and format **Content** for the text box.  
   1. Optionally, set a custom link for the title. A custom link can be an external site or a dashboard or report in your workspace. However, in this example, add hyperlinks within the text box itself, so don't check **Set custom link**.
   1. Select **Apply**.

     :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-textbox.png" alt-text="Screenshot of the Add textbox tile window.":::

1. On the dashboard, resize and move the text box as needed.

   :::image type="content" source="media/service-dashboard-add-widget/pbi-widget-text-added-new.png" alt-text="Screenshot of a dashboard with an image and textbox.":::

## Add a video

When you add a YouTube or Vimeo video tile to your dashboard, the video plays right on your dashboard.

1. From the **Add a tile** window, select **Video** > **Next**.
1. Add video information in the **Add video tile** window:
   1. To display a title and subtitle at the top of the video tile, select **Display title and subtitle** and enter a **Title** and an optional **Subtitle**. In this example, add a **Subtitle**, and then convert it to a hyperlink to the entire YouTube playlist.
   1. Enter the **Video URL** for the video.
   1. Add a hyperlink for the **Title** and **Subtitle**, so that your colleagues can view the entire playlist on YouTube after they watch the embedded video. To do so, under **Functionality**, select **Set custom link**, and then enter the **URL** for the playlist.
   1. Select **Apply**.  

   :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-video-new.png" alt-text="Screenshot of the Add video tile window.":::

1. On the dashboard, resize and move the video tile as needed.

   :::image type="content" source="media/service-dashboard-add-widget/pbi-widget-video-added-new.png" alt-text="Screenshot of a dashboard with video tile added.":::

1. Select the video tile to play the video.
1. Select the subtitle to visit the playlist on YouTube.

## Add streaming data

You can add streaming data, such as Twitter feeds or sensor data, to a tile in your dashboard. [This example of real-time streaming in Power BI](../connect-data/service-real-time-streaming.md#example-of-real-time-streaming-in-power-bi) using a publicly available stream from PubNub has detailed instructions to get you started. Read the rest of [that article](../connect-data/service-real-time-streaming.md) to learn more about real-time streaming options in Power BI.

## Add web content

You can paste or type any HTML content as a tile to your report or dashboard. Enter the embed code manually or copy and paste from sites such as Twitter, YouTube, embed.ly, and so on.

1. From the **Add a tile** window, select **Web content** > **Next**.

1. Add information to the **Add web content tile** window:

   1. To display a title above the tile, select **Display title and subtitle** and enter a **Title** and an optional **Subtitle**.
   1. Enter the embed code. In this example, copy and paste a Twitter feed.
   1. Select **Apply**.

   :::image type="content" source="media/service-dashboard-add-widget/power-bi-add-web-content.png" alt-text="Screenshot of the Add web content tile window.":::

1. On the dashboard, resize and move the web content tile as needed.

   :::image type="content" source="media/service-dashboard-add-widget/pbi-widget-code-added-new.png" alt-text="Screenshot of a dashboard with four tiles.":::

### Tips for embedding web content

- For iframes, use a secure source. If you enter your iframe embed code and get a blank tile, verify you're not using *http* for the iframe source. If you are, change it to *https*.
  
  ```html
  <iframe src="https://xyz.com">
  ```

- Edit width and height information. The embed code embeds a video and sets the video player to 560 x 315 pixels. This size doesn't change as you resize the tile.
  
  ```html
  <iframe width="560" height="315"
  src="https://www.youtube.com/embed/Cle_rKBpZ28" frameborder="0"
   allowfullscreen></iframe>
  ```
  
  If you want the player to resize to fit the tile size, set the width and height to 100%.

  ```html
  <iframe width="100%" height="100%"
  src="https://www.youtube.com/embed/Cle_rKBpZ28" frameborder="0"
   allowfullscreen></iframe>
  ```

- This code embeds a tweet and retains, as separate links on the dashboard, links for the AFK podcast, \@MeganB's Twitter page, Follow, #analytics, reply, retweet, and like.  Selecting the tile itself takes you to the podcast on Twitter.
  
  ```html
  <blockquote class="twitter-tweet" data-partner="tweetdeck">
  <p lang="en" dir="ltr">Listen to
  <a href="https://twitter.com/MeganB">@MeganB</a> talk to
  us about making videos about Microsoft Business Intelligence
  platform
  <a href="https://t.co/TmRgalz7tv">https://t.co/TmRgalz7tv </a>
  <a href="https://twitter.com/hashtag/analytics?src=hash">
  #analytics</a></p>&mdash; AFTK Podcast (@aftkpodcast) <a
  href="https://twitter.com/aftkpodcast/status/693465456531771392">
  January 30, 2016</a></blockquote> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
  ```

## Edit a tile

To change an existing tile:

1. Hover over the top-right corner of the tile to display the ellipsis (...). Select it to show the **More options** menu.

    :::image type="content" source="media/service-dashboard-add-widget/pbi_ellipses.png" alt-text="Screenshot showing the tile ellipsis selection.":::

1. Select **Edit details** to display the **Tile details** window and make changes.

    :::image type="content" source="media/service-dashboard-add-widget/pbi-edit.png" alt-text="Screenshot showing the Edit details option.":::

## Considerations and troubleshooting

- Add a title and an optional subtitle to make it easier to move the tile on your dashboard.
- If you'd like to embed content from a website, but the website doesn't provide embed code to copy and paste, see embed.ly for help with generating the embed code.
- Make sure security credentials aren't required to access the image file. For example, because OneDrive and SharePoint require authentication, you can't add images stored there to a dashboard.
- You can't use .svg format for images.

## Related content

- [Intro to dashboard tiles for Power BI designers](service-dashboard-tiles.md)

More questions? [Try the Power BI Community](https://community.powerbi.com/).
