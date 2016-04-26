<properties
   pageTitle="Resolve Issues when starting Power BI Desktop"
   description="Resolve Issues when starting Power BI Desktop"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
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
   ms.date="04/26/2016"
   ms.author="davidi"/>

# Resolve Issues when Power BI Desktop will not launch  

In Power BI Desktop, users who installed and are running previous versions of the Power BI Enterprise Gateway can be blocked from launching Power BI Desktop, due to administrative policy restrictions that the Power BI Enterprise Gateway placed on named pipes on the local machine. There are three options to resolve this issue, and allow Power BI Desktop to launch:

### Resolution 1: Install the latest version of Power BI Enterprise Gateway
The latest version of the Power BI Enterprise Gateway does not place named pipe restrictions on the local machine, and allows Power BI Desktop to launch properly. If you need to continue using Power BI Enterprise Gateway, this is the recommended resolution. You can download the the latest version of Power BI Enterprise Gateway from [this location](https://go.microsoft.com/fwlink/?LinkId=698863). Note that the link is a direct download link to the installation executable.


### Resolution 2: Uninstall or stop the Power BI Enterprise Gateway Windows service
If you no longer need the Power BI Enterprise Gateway, you can uninstall it, or you can stop the Power BI Enterprise Gateway Windows service, which removes the policy restriction, and allows Power BI Desktop to launch.

### Resolution 3: Run Power BI Desktop with administrator privilege

Alternatively, you can successfully launch Power BI Desktop as administrator, which also allows Power BI Desktop to successfully launch. It is still recommended that you install the latest version of Power BI Enterprise Gateway, as described earlier in this article.
