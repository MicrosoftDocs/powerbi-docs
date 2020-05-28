---
title: "Power BI Developer in a Day course"
description: This video-based course empowers you as an app developer with the technical knowledge required to embed Power BI content.
author: peter-myers
ms.reviewer: yana.berkovich
featuredvideoid: TODO
ms.service: powerbi
ms.subservice: powerbi-developer
ms.topic: tutorial
ms.date: 06/01/2020
ms.author: v-pemyer
---

# Power BI Developer in a Day course

The **Power BI Developer in a Day** video-based course empowers you as an app developer with the technical knowledge required to embed Power BI content. It comprises 3 hours 20 minutes of viewable content—available on demand, and is free of charge. There's also a [self-study kit](#self-study-kit) that you can download and use to complete a series of five hands-on labs.

The course was designed specifically for experienced app developers. So, it's an advantage if you have development experience with:

- ASP.NET
- Visual C#
- HTML
- JavaScript

Familiarity with Power BI will be beneficial, but not essential. We'll introduce you to the core concepts.

After you complete the course, you'll know how to:

> [!div class="checklist"]
> - Acquire access using Azure AD apps and tokens
> - Work with the Power BI REST API
> - Embed Power BI content in your apps
> - Integrate Power BI content in your apps using the Power BI JavaScript API
> - Enforce row-level security (RLS) to ensure app users see the right data
> - Choose the right license to suit your requirements

Watch the welcome and introduction video to start the course.

> [!VIDEO https://www.youtube.com/embed/TODO]

## Course outline

The [course of 20 videos](https://www.youtube.com/playlist?list=TODO) is organized into seven modules. We recommend you watch the videos in the recorded sequence, starting with video 01 and ending with video 20.

- **Introduction**
  - Video 01: [Welcome and Course Introduction](https://www.youtube.com/watch?v=TODO)
  - Video 02: [Self-study Kit](https://www.youtube.com/watch?v=TODO)
- **Module 01: Power BI Overview**
  - Video 03: [Power BI Overview - Part 1](https://www.youtube.com/watch?v=TODO)
  - Video 04: [Power BI Overview - Part 2](https://www.youtube.com/watch?v=TODO)
  - Video 05: [Power BI Overview - Part 3](https://www.youtube.com/watch?v=TODO)
- **Module 02: Power BI Embedded Analytics**
  - Video 06: [Power BI Embedded Analytics - Part 1](https://www.youtube.com/watch?v=TODO)
  - Video 07: [Power BI Embedded Analytics - Part 2](https://www.youtube.com/watch?v=TODO)
- **Module 03: Acquiring Access**
  - Video 08: [Acquiring Access](https://www.youtube.com/watch?v=TODO)
- **Module 04: Embedding Power BI Content**
  - Video 09: [Embedding Power BI Content - Part 1](https://www.youtube.com/watch?v=TODO)
  - Video 10: [Embedding Power BI Content - Part 2](https://www.youtube.com/watch?v=TODO)
  - Video 11: [Embedding Power BI Content - Part 3](https://www.youtube.com/watch?v=TODO)
  - Video 12: [Embedding Power BI Content - Part 4](https://www.youtube.com/watch?v=TODO)
  - Video 13: [Embedding Power BI Content - Part 5](https://www.youtube.com/watch?v=TODO)
- **Module 05: Integrating Content with the Power BI JavaScript API**
  - Video 14: [Integrating Content with the Power BI JavaScript API - Part 1](https://www.youtube.com/watch?v=TODO)
  - Video 15: [Integrating Content with the Power BI JavaScript API - Part 2](https://www.youtube.com/watch?v=TODO)
- **Module 06: Enforcing Row-level Security**
  - Video 16: [Enforcing Row-level Security - Part 1](https://www.youtube.com/watch?v=TODO)
  - Video 17: [Enforcing Row-level Security - Part 2](https://www.youtube.com/watch?v=TODO)
  - Video 18: [Enforcing Row-level Security - Part 3](https://www.youtube.com/watch?v=TODO)
- **Module 07: Power BI Embedding Licensing**
  - Video 19: [Power BI Embedding Licensing](https://www.youtube.com/watch?v=TODO)
- **Bonus Content**
  - Video 20: [Power BI Embedded Playground](https://www.youtube.com/watch?v=TODO)

## Self-study kit

You can download and set up a self-study kit, which consists of the presentation content and five hands-on labs. For more information, watch the [Self-study Kit](https://www.youtube.com/watch?v=TODO) video.

To complete the labs, you'll need a Windows PC (Windows 7, or later) and the following software installed:

- The latest version of [Power BI Desktop](../fundamentals/desktop-get-the-desktop.md).
- Visual Studio 2015, or later. We recommend [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/). You can use **Community** edition, which is free and suited for learning scenarios. It must have the **ASP.NET and web development** workload installed.
- A web browser [supported by Power BI](../power-bi-browsers.md). We recommend Microsoft Edge.

Follow these steps to get set up:

1. Use [this link](https://aka.ms/deviad-student) to download the self-study kit (.zip) locally to your PC.
1. Open the file properties, and then check "unblock" (Windows may flag the file as potentially untrusted).
1. Extract the file contents to a folder in your file system. We recommend you create a folder that will be easy to find, perhaps naming it **Training**. The lab documents will refer to this location as **&lt;CourseFolder&gt;**.

Once extracted, you'll have the **PowerBIDevIAD** folder, and within it you'll find the following folders:

- **Lab01A** (and all other lab folders). The lab folders contain the lab document and lab resources, which may include assets and solution files.
- **MySolution**: This folder stores your solution files. The lab instructions will direct you when to use it.
- **Presentation**: This folder contains the course presentation file, which is available as a PDF document.

### Get started with the kit

We recommend you watch the online course first. You can refer back to the presentation theory by opening the **&lt;CourseFolder&gt;\PowerBIDevIAD\Presentation\PowerBIDevIAD_Presentation.pdf** file. The presentation includes five lab slides, which indicate when it's time to put the theory to practice. It also includes many resource links to help you find related content.

When you're ready to commence the first lab, open the **&lt;CourseFolder&gt;\PowerBIDevIAD\Lab01A\PowerBIDevIAD_Lab01A.pdf** file. This document guides you to sign in to the Power BI service and prepare a Power BI report.

> [!NOTE]
> You're responsible for having your own Power BI account. If you don't already have one, see [Sign up for Power BI as an individual](../service-self-service-signup-for-power-bi.md).
>
> Your account must have a Power BI Pro license, or you can still accept a Power BI Pro Trial license—an offer that can only be accepted once. Also, your account must not have depleted the reserve of free embed tokens, available with the Power BI Pro license.
>
> Also, you must be OK to have your password stored in cleartext in the lab solution. Storing sensitive information is never a recommended practice—it's done to simplify the lab. If you want to encrypt your password, you'll need to implement the logic yourself.
>
> Consider creating a Power BI account for exclusive use in the labs. You can create a free account with a public domain like [https://outlook.live.com](https://outlook.live.com), and then using it to sign in to Power BI and accept the Power BI Pro Trial license.

## Instructor kit

Use [this link](https://aka.ms/deviad-instructor) to download the instructor kit (.zip) locally to your PC. You'll find classroom setup notes in slide one of the PowerPoint slide deck.

## Next steps

For more information related to this article, check out the following resources:

- Questions? [Try asking the Power BI Community](https://community.powerbi.com/)
- Suggestions? [Contribute ideas to improve Power BI](https://ideas.powerbi.com/)
