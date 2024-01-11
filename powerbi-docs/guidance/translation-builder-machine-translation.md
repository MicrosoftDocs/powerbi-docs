---
title: "Generate machine translations using Azure Translator Service"
description: Learn how Translations Builder generates machine translations by using the Azure Translator Service. 
author: maggiesMSFT   
ms.author: maggies
ms.service: powerbi
ms.subservice: powerbi-resource
ms.topic: how-to
ms.date: 07/24/2023
---
# Generate machine translations using Azure Translator Service

One of the biggest challenges in building multiple-language reports is managing the language translation process. You must ensure that the quality of translations is high. Be sure that the translated names of tables, columns, measures, and labels don't lose their meaning when translated to another language. In most cases, acquiring quality translations requires human translators to create or at least review translations as part of the multiple-language report development process.

While human translators are typically an essential part of the end-to-end process, it can take a long time to send out translation files to a translation team and then to wait for them to come back. With all the recent industry advances in AI, you can also generate machine translations using a Web API that can be called directly from an external tool such as Translations Builder. If you generate machine translations, you have something to work with while waiting for a translation team to return their high-quality human translations.

While machine translations aren't always guaranteed to be high quality, they do provide value in the multiple-language report development process.

- They can act as translation placeholders so you can begin your testing by loading reports using secondary languages to see if there are layout issues or unexpected line breaks.
- They can provide human translators with a better starting point because they just need to review and correct translations instead of creating every translation from scratch.
- They can be used to quickly add support for languages where there are legal compliance issues and organizations are facing fines or litigation for noncompliance.

## Generate machine translations

Translations Builder generates machine translations by using [Azure AI Translator](/azure/ai-services/translator/). This product makes it possible to automate enumerating through data model objects to translate its names from the default language to translations for secondary languages.

To test the support in Translations Builder for generating machine translations, you need a key for an instance of the Azure Translator Service. For more information about obtaining a key, see [What is Azure AI Translator?](/azure/ai-services/translator/translator-overview)

> [!NOTE]
> If you haven't installed Translations Builder yet, see [Create multiple-language reports with Translations Builder](translation-builder.md).

Translations Builder provides a **Configuration Options** dialog box where you can configure the key and location to access the Azure Translator Service.

:::image type="content" source="./media/translation-builder-machine-translation/configuration-option-dialog.png" alt-text="Screenshot shows Translations Builder Configuration Options where you can specify a key and service location." lightbox="./media/translation-builder-machine-translation/configuration-option-dialog.png":::

After you configure an **Azure Translator Service Key**, Translations Builder displays other command buttons. These buttons generate translations for a single language at a time or for all languages at once. There are also commands to generate machine translations only for the translations that are currently empty.

:::image type="content" source="./media/translation-builder-machine-translation/generate-machine-translation.png" alt-text="Screenshot shows the Translations Builder Machine Translations pane where you can generate translations." lightbox="./media/translation-builder-machine-translation/generate-machine-translation.png":::

## Related content

- [Add support for multiple-language page navigation](multiple-language-page-navigation.md)
