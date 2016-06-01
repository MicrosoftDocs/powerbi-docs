<properties
   pageTitle="DAX Expressions"
   description="Using variables in your DAX expressions"
   services="powerbi"
   documentationCenter=""
   authors="davidiseminger"
   manager="mblythe"
   backup=""
   editor=""
   tags=""
   qualityFocus="no"
   qualityDate=""
   featuredVideoId=""
   courseDuration="2m"/>

<tags
   ms.service="powerbi"
   ms.devlang="NA"
   ms.topic="article"
   ms.tgt_pltfrm="NA"
   ms.workload="powerbi"
   ms.date="06/01/2016"
   ms.author="davidi"/>

# DAX Expressions

Variables are an extremely powerful part of a DAX function. You can define a variable anywhere in an expression, using the syntax VARNAME = RETURNEDVALUE. Variables can be any data type, including entire tables.

Keep in mind that each time you reference your variable, Power BI has to recalculate its value according to your definition. For this reason, it's good practice to avoid repeating variables in your function.
