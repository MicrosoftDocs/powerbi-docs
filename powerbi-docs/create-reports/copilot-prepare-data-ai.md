---
title: Prepare Your Data for AI
description: Prepare your data for AI in Power BI with new features like AI data schemas, verified answers, and AI instructions.
author: julcsc
ms.author: juliacawthra
ms.reviewer: 
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 05/08/2025
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to understand how to prepare my data for AI to optimize the performance of Copilot, improve AI-driven insights, and enhance user interactions by leveraging new features like AI data schemas, verified answers, and AI instructions.
---

# Prepare your data for AI

Microsoft Power BI has new capabilities to help you get your data ready for natural language experiences with Copilot.

To get the best results from Copilot in Power BI, we recommend that you have a semantic model that follows best practices. However, models often require more assistance to be fully prepared for optimal interactions with AI.

There are tooling features to help you prepare your data for AI. These features allow you to provide more context about your model, help guide Copilot to the right data in the model, and help increase the quality of Copilot output.

> [!NOTE]
> You can now *author* **Prep data for AI** features in both the Power BI service and Power BI Desktop. Users can *consume* these features everywhere that Copilot exists.

## New tooling features to help you prep your data for AI

You can now use three key features to help prepare your data for AI. This preparation provides Copilot the context it needs to reduce ambiguity, improve relevance and accuracy, and make user interactions with Copilot more fluent and intuitive.

:::image type="content" source="media/copilot-prep-data/copilot-prep-data.png" alt-text="Screenshot of the Prep data for AI button in Power BI Desktop, located next to the Copilot button on the home ribbon." lightbox="media/copilot-prep-data/copilot-prep-data.png":::

## Benefits of preparing your data for AI

When you prepare your data for AI, you create the foundation for high-quality, grounded, and context-aware AI experiences. When data is unstructured or ambiguous, AI systems can struggle to correctly interpret it. Outputs might be generic, inaccurate, or even misleading. 

When you invest in data preparation, you help AI systems understand your unique business context, prioritize the right information, and deliver responses that are consistent, reliable, and aligned with your goals. Data preparation not only improves user trust but also accelerates adoption and impact across your organization.

> [!NOTE]
> Features that help prepare your data for AI can't ensure a specific output every time. AI behavior is nondeterministic. Copilot doesn't always produce the exact same response, even with the same input.

## Features to help you prepare your data for AI

### Power BI Desktop

To access the features in Power BI Desktop, follow these steps:

1. Select the **Prep data for AI** button on the home ribbon in Power BI Desktop. When you select this button, a unified experience opens with three features to help you prepare your data to be ready for Copilot.
1. To set a verified answer, select a visual.
1. Select the **...** menu, and then select **Set verified answer**.

Now you can set trigger phrases that use the selected visual to return an answer.

:::image type="content" source="media/copilot-prep-data/copilot-desktop-features.png" alt-text="Screenshot that shows the Copilot Desktop features in Power BI that showcases the Prep data for AI options." lightbox="media/copilot-prep-data/copilot-desktop-features.png":::

All updates are saved on the semantic model, not the report.

### Power BI service

To author an AI data schema and AI instructions in the Power BI service, follow these steps:

1. Select the semantic model to prep for AI.
2. From the ribbon, select the **Prep data for AI** button.
3. Use the available features, and then select **Apply** when you're satisfied with your updates.

> [!NOTE]
> It might take time for the changes that you made to affect Copilot results. If **Prep data for AI** features don't take effect immediately, wait a few minutes and try again.

To set or create a verified answer in the Power BI service, first meet the following requirements:

- You're in a Copilot-enabled workspace.
- You have authoring permission on the semantic model the report is built on.
- You're on a report page.
- You're in edit mode.
- The visual is selected.

#### Set a verified answer

1. To set a verified answer, select a visual.
1. Select the **...** menu, and then select **Set up a verified answer**.

Now you can set trigger phrases that use the selected visual to return an answer. All verified answers are saved to the semantic model.

:::image type="content" source="media/copilot-prep-data/copilot-service-features.png" alt-text="Screenshot that shows Copilot features in Power BI including the Prep data for AI options." lightbox="media/copilot-prep-data/copilot-service-features.png":::

You can manage verified answers by selecting the **Prep data for AI** button on the ribbon of the semantic model page.

:::image type="content" source="media/copilot-prep-data/copilot-prep-data-ai-service.png" alt-text="Screenshot that shows the Prep data for AI features in the Power BI service that showcases the options you can use to prepare data for AI." lightbox="media/copilot-prep-data/copilot-prep-data-ai-service.png":::

## Test your Copilot tooling changes

### Use the skill picker

After you prepare your data for AI, you can use the Copilot report pane in Desktop to test what your end users will see. The skill picker is a tool that gives you greater control over how Copilot responds. By using the skill picker, you can select specific Copilot capabilities to enable.

Currently, the skill picker includes three capabilities:

- **Answer questions about the data**: Uses Copilot to respond to questions based on a given semantic model.
- **Analyze report visuals**: Enables Copilot to interpret and answer questions about the visuals within a report.
- **Create new report pages**: Lets Copilot generate new report pages based on your prompts.

Authors can simulate different environments and test how their changes affect the Copilot experience by selecting which capabilities to enable.

- In **Standalone Copilot experience (Home)**, select **Answer questions about the data**.
- In **Report Copilot Pane - Read Mode**, select **Answer questions about the data** and **Analyze report visuals**.
- In **Report Copilot Pane - Edit Mode**, enable all three capabilities.

All three skills are enabled in Power BI Desktop by default. You can immediately access the full range of Copilot functionality. To customize the skills for your session, choose **Select skills** from the dropdown menu in the Copilot chat box, and then select the combination that fits your needs.

### Test the prepared data for AI capabilities

Use the Copilot report pane in Power BI Desktop to test changes that you make through the **Prep data for AI** dialog. We recommend that you create an iterative and thorough testing process. Each time that you make an update to one of the features, you can view the latest updates by refreshing the Copilot report pane. Just close and reopen it.

You can troubleshoot changes through **Access the download diagnostic** on the **...** menu on the report pane. You can also analyze the **How Copilot arrived at this** (HCAAT) feature, which is included in answers from your semantic model.

:::image type="content" source="media/copilot-prep-data/copilot-test-prep.png" alt-text="Screenshot that shows how to test the Prep data for AI features in Power BI Desktop that showcases the Copilot report pane." lightbox="media/copilot-prep-data/copilot-test-prep.png":::

After you test and confirm your **Prep data for AI** enhancements, you can publish your report to the Power BI service for broad consumption.

## <a name = "mark-your-model-as-prepped-for-ai"></a> Mark your model Prepped for AI

After you prepare your semantic model for AI and it's ready for consumption, you can mark your model **Prepped for AI** by following these steps:

1. Go to the Power BI service and find your semantic model.
1. Select the **Settings** icon in the upper-left corner.
1. Expand the **AI preparation** section.
1. Select the **Prepped for AI** box, and then select the **Apply** button.

:::image type="content" source="media/copilot-prep-data/copilot-ai-preparation.png" alt-text="Screenshot of the AI preparation settings in Power BI service that showcases the option to mark a model Prepped for AI." lightbox="media/copilot-prep-data/copilot-ai-preparation.png":::

When you mark your semantic model **Prepped for AI**, the standalone Copilot agent doesn't apply any [friction treatment](/power-bi/create-reports/copilot-chat-with-data-standalone#prep-data-for-ai) to answers from that model. Also, reports that use that semantic model can be considered **Prepped for AI**.

> [!NOTE]
> When you mark a semantic model **Prepped for AI**, the friction treatment in standalone Copilot for associated reports should be removed.
>
> In most cases, changes are fully reflected within an hour, but it can take up to 24 hours if the model has a lot of reports attached. To force an update to a specific report, you can speed up the process by manually saving a small change to a report.
>
> There's currently *no way* to mark a report, dashboard, or app **Prepped for AI**.

Authors can also turn on an admin setting to [only search data that is marked **Prepped for AI**](/fabric/admin/service-admin-portal-copilot#only-show-ai-prepped-items-in-the-standalone-copilot-in-power-bi-experience-preview) within the standalone Copilot experience.

## Upgrade to new Copilot experience

If your semantic model is still using the Q&A file format ([Linguistic Schema](/power-bi/natural-language/q-and-a-tooling-advanced#whats-a-linguistic-schema)) to store Copilot metadata, the next time you open **Prep data for AI**, you’ll be prompted to migrate to the new Copilot experience.

:::image type="content" source="media/copilot-prep-data/copilot-migrate-from-qa-desktop.png" alt-text="Screenshot of the Prep data for AI migration from Q&A." lightbox="media/copilot-prep-data/copilot-migrate-from-qa-desktop.png":::

For new semantic models, the new Copilot experience is used by default when the **Prep data for AI** preview feature is enabled.

This upgrade is required to continue editing Copilot metadata and to enable upcoming Copilot features. It also improves integration with development tools when using [**Power BI Project (PBIP)**](/power-bi/developer/projects/projects-overview.md), since all Copilot metadata is now stored using the new [Copilot tooling file format](#copilot-tooling-file-format).

### Impact to Q&A

Upgrading to the new Copilot experience will permanently disable Q&A features for the model and any connected reports. For instance, if a Power BI report includes the [Q&A visual](/power-bi/visuals/power-bi-visualization-q-and-a), the visual will display an error message indicating that Q&A is no longer supported.

:::image type="content" source="media/copilot-prep-data/copilot-migrate-from-qa-desktop-qa-error.png" alt-text="Screenshot of the Q&A visual after migration to Copilot tooling file format." lightbox="media/copilot-prep-data/copilot-migrate-from-qa-desktop-qa-error.png":::

Learn more about all Q&A features in [Q&A in Power BI documentation](/power-bi/consumer/end-user-q-and-a).

The following [Q&A tooling](/power-bi/natural-language/q-and-a-tooling-intro) metadata is migrated to the new Copilot tooling format. Other metadata, such as [Linguistic Relationships](/power-bi/natural-language/q-and-a-tooling-intro#relationships), isn’t migrated. If you want to preserve that metadata, you can [export the linguistic schema](/power-bi/natural-language/q-and-a-tooling-advanced#export-then-import-a-yaml-file) before upgrading.

* [Synonyms](/power-bi/natural-language/q-and-a-tooling-intro#field-synonyms)
* [Suggested questions](/power-bi/natural-language/q-and-a-tooling-intro#suggest-questions)

Once you upgrade to the Copilot file format, you cannot revert to using Q&A (LSDL) or re-enable Q&A features. During the upgrade, Power BI automatically creates a backup of your semantic model in the following locations.
    
**Upgrade in Power BI Desktop:**    
  - Microsoft Store version: `%USERPROFILE%\Microsoft\Power BI Desktop Store App\TempSaves\Backups`  
  - Executable installer version: `%USERPROFILE%\AppData\Local\Microsoft\Power BI Desktop\TempSaves\Backups`

**Upgrade in Power BI service:**
  - A new version is saved to [version history](/power-bi/transform-model/service-semantic-model-version-history).

## Copilot tooling file format

When saving as a [**Power BI Project (PBIP)**](/power-bi/developer/projects/projects-overview.md), all Copilot metadata is stored in a single `Copilot/` folder. This structure makes it easier to edit Copilot settings using code editors and enables seamless collaboration through Git.

Example structure of the `Copilot/` folder for a semantic model:

```text
PBIP/
├── Model.SemanticModel/
│   ├── definition/
│   ├── Copilot/
│   │   ├── Instructions/
│   │   │   ├── instructions.md
│   │   │   ├── version.json
│   │   ├── VerifiedAnswers/
│   │   │   ├── definitions/
│   │   │   ├── version.json
│   │   ├── schema.json
│   │   ├── examplePrompts.json
│   │   ├── settings.json
│   │   └── version.json
│   └── definition.pbism
```

Learn more about these files in [Power BI Project documentation](/power-bi/developer/projects/projects-dataset.md#copilot-folder).

## Turn off the preview features in Desktop

You can also remove the ability to author **Prep data for AI** features within Power BI Desktop.

1. Select **File** > **Options and settings** > **Options** > **Preview features** > **Prep data for AI**.
1. Clear the **Prep data for AI** box.

When you restart Desktop, you no longer see the **Prep data for AI** button.

## Considerations and limitations

- You can author all **Prep data for AI** features in Power BI Desktop and the Power BI service.
- Users can consume all **Prep data for AI** features everywhere that Copilot in Power BI is available.
- Prep data for AI features in Power BI Desktop are only supported with the following connection types:
  - Import
  - DirectQuery
  - Composite (local)
- All model types can use the **Prep data for AI** features within the Power BI service.
- When you close the dialog, all **Prep data for AI** features are saved to the model.
- You can test all **Prep data for AI** features on the report Copilot pane before publishing to the service.
- You can troubleshoot **Prep data for AI** features. Use the HCAAT functionality and use the **Download diagnostics** feature from the **...** menu on the Copilot pane in Power BI Desktop. This action ensures that **Prep data for AI** features are applied. Include the diagnostic file when you create support requests.
- We encourage the use of HCAAT, which is included in answers that come from a semantic model. When you use HCAAT, you can see what Copilot used to arrive at an answer.
- After you save changes in the **Prep data for AI** dialog, refresh the Copilot pane by closing and reopening it so that changes take effect.
- In rare circumstances, Copilot capabilities might time out, which results in an error because it can't fetch the tooling metadata.
- When you make tooling edits through Git or deployment pipelines, take note of the following requirements:
  - **Import models**: You're required to do a model refresh in the Power BI service to sync the tooling changes after deployment.
  - **DirectQuery models**: You're required to do a model refresh in the Power BI service to sync the tooling changes after deployment, but only once a day.
  - **Direct Lake models**: You're required to do a model refresh in the Power BI service to sync the tooling changes after deployment, but only once a day.
- The standalone Copilot experience isn't yet available in the following regions: Spain Central, Qatar, India-West, and Mexico.

## Related content

- [AI data schemas](copilot-prepare-data-ai-data-schema.md)
- [Verified answers](copilot-prepare-data-ai-verified-answers.md)
- [AI instructions](copilot-prepare-data-ai-instructions.md)
- [AI settings](copilot-prepare-data-ai-settings.md)
- [Prep data for AI FAQ](copilot-prepare-data-ai-faq.yml)
