---
title: ""
description: 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: conceptual
ms.date: 07/21/2023
---
# Generate machine translations using Azure Translator Service

One of the biggest challenges in building multiple-language reports is managing the language translation process. You must ensure that the quality of translations is high. Be sure that the translated names of tables, columns, measures and labels don't lose their meaning when translated to another language. In most cases, acquiring quality translations requires human translators to create or at least review translations as part of the multiple-language report development process.

While human translators are typically an essential part of the end-to-end process, it can take a long time to send out translation files to a translation team and then to wait for them to come back. With all the recent industry advances in Artificial Intelligence (AI), you can also generate machine translations using a Web API that can be called directly from an external tool such as Translations Builder. If you initially generate machine translations for each secondary language you need to support, you have something to work with while waiting for a translation team to return their high-quality human translations.

While machine translations aren't always guaranteed to be high quality, they do provide value in the multiple-language report development process. First, they can act as translation placeholders so you can begin your testing by loading reports using secondary languages to see if there are layout issues or unexpected line breaks. Machine translations can also provide human translators with a better starting point as they just need to review and correct translations instead of creating every translation from scratch. Finally, machine translations can be used to quickly add support for languages in scenarios where there are legal compliance issues and organizations are facing fines or litigation for noncompliance.

## Generate machine translations

Translations Builder generates machine translations by running API calls against the [**Azure Translator service**](https://docs.microsoft.com/en-us/azure/cognitive-services/translator/translator-info-overview) which is an API endpoint offered through Azure Cognitive Services. This Web API makes it possible to automate enumerating through dataset objects to translate dataset object names from the default language to translations for secondary languages.

If you'd like to test out the support in Translations Builder for generating machine translations, you need a Key for an instance of the Azure Translator Service. If you have an Azure subscription, you can learn how to obtain this key and its location by reading [Obtaining a Key for the Azure Translator Service](https://github.com/PowerBiDevCamp/TranslationsBuilder/blob/main/Docs/Obtaining%20a%20Key%20for%20the%20Azure%20Translator%20Service.md). Translations Builder provides a **Configuration Options** dialog that makes it possible to configure the key and location to access the Azure Translator Service.

:::image type="content" source="./media/translation-builder-machine-translation/configuration-option-dialog.png" alt-text="Screenshot shows Translations Builder Configuration Options where you can specify a key and service location." lightbox="./media/translation-builder-machine-translation/configuration-option-dialog.png":::

Once a user has configured an Azure Translator Service key, Translations Builder begins to display other command buttons that make it possible to generate translations for a single language at a time or for all languages at once. There are also commands to generate machine translations only for the translations that are currently empty.

:::image type="content" source="./media/translation-builder-machine-translation/generate-machine-translation.png" alt-text="Screenshot shows the Translations Builder Machine Translations pane where you can generate translations." lightbox="./media/translation-builder-machine-translation/generate-machine-translation.png":::

## Next steps
