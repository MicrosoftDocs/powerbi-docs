---
title: Embed a Power BI report with a Copilot narrative visual 
description: Embed Power BI reports with a Copilot narrative visual in secure portals or websites, detailing supported scenarios, benefits, and setup instructions.
author: maggiesmsft
ms.author: maggies
ms.reviewer: cnews
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: how-to
ms.date: 07/24/2024
LocalizationGroup: Create reports
no-loc: [Copilot]
ms.collection: ce-skilling-ai-copilot
#customer intent: As a Power BI user, I want to learn how to enable Fabric Copilot for Power BI to use Copilot in the service and desktop.
---

# Embed a Power BI report with a Copilot narrative visual 

[!INCLUDE [applies-yes-desktop-yes-service](../includes/applies-yes-desktop-yes-service.md)]

The narrative visual with Copilot is supported in "embed for your organization" scenarios where the user owns the data and in secure embed scenarios. 

## Scenarios

There are a few embedded scenarios. Only two are supported at this time. This chart makes it clear which scenarios are supported with the Copilot narrative visual.

|Scenario |Supported |
|---------|---------|
|[**Embed a report in a secure portal or website**](./../collaborate-share/service-embed-secure.md) Power BI. | Yes |
|**User owns data** A user embeds a report containing the narrative visual in a solution where users have to sign in (they need a license) (Also known as embed for your organization) This includes when users want to embed visuals in solutions like PowerPoint as well. | Yes: user must be signed in with a valid workspace. |
|**App owns data** A customer embeds a narrative visual on a website where users visit, and don't need to sign in. Also known as embed for your customer’s application. | No |

## Why embed?

When you embed a Power BI report in an application in the "embed for your organization" scenario, it allows organizations to integrate rich, interactive data visualizations seamlessly into their internal tools and workflows. Now this solution supports the Copilot visual. Copilot enhances data-driven decision-making by providing users with real-time insights within the context of the applications they already use. Additionally, it ensures secure data access and consistent user experience by using existing organizational permissions and authentication mechanisms. 

A sales team might want to embed a Power BI report in their internal CRM application to streamline their workflow. By integrating sales performance dashboards directly into the CRM, team members can easily monitor key metrics like monthly sales targets, pipeline status, and individual performance, without switching between different tools. This integration enables quicker access to actionable insights, helping the team make informed decisions, identify trends, and react swiftly to market changes, all within the secure environment of their organization's data infrastructure.

## Get started

Let's get started unlocking this scenario for your organization. To unlock this scenario, you must add a permission that authorizes your application to generate Copilot responses.

Navigate to the Azure portal (Entra ID) and find the registered application. For more information on registering applications, see the documentation [Set up Power BI Embedded](./../developer/embedded/register-app.md?tabs=organization). Entra ID is where you can set up and manage the authentication for the embedded scenario. For more information, see the article [Edit your Microsoft Entra app permission settings - Power BI](./../developer/embedded/change-permissions.md).

Under API permissions in the left navigation, you can set up different permissions that users can access with this application.

## Next steps

In the permission section on the right, select **Add a permission**. 

:::image type="content" source="media/copilot-narrative-visual-embed-power-bi/add-permission.png" alt-text="Screenshot showing Select add permission." lightbox="media/copilot-narrative-visual-embed-power-bi/add-permission.png":::

Under **APIs my organizations uses**, find and select **Power BI Service**.

:::image type="content" source="media/copilot-narrative-visual-embed-power-bi/power-bi-service-permissions.png" alt-text="Screenshot showing Find and select Power BI service." lightbox="media/copilot-narrative-visual-embed-power-bi/power-bi-service-permissions.png":::

Select **Delegated permissions**.

:::image type="content" source="media/copilot-narrative-visual-embed-power-bi/delegated-permissions.png" alt-text="Screenshot showing selecting delegated permissions." lightbox="media/copilot-narrative-visual-embed-power-bi/delegated-permissions.png":::

After you select delegated permissions, search for *ML model* in the search bar and expand the ML model option that shows up. To enable the embed scenario for the narrative visual with Copilot, select the MLModel.Execute.All permission. Now the visual can show up in the embedded application for signed in users that meet all other Copilot requirements. See the [Requirements section on the main Power BI Copilot](copilot-introduction.md#copilot-requirements) documentation page. Add this permission to the registered application, and you’re finished. 

:::image type="content" source="media/copilot-narrative-visual-embed-power-bi/request-api-permissions.png" alt-text="Screenshot showing searching for the ML model permissions." lightbox="media/copilot-narrative-visual-embed-power-bi/request-api-permissions.png":::

### Consent 

Keep in mind, as with other embed for your organization scenarios, end users are asked for consent for the application to use ML models upon using the application. For more information on user consent and delegated access, read this documentation, [Overview of permissions and consent in the Microsoft identity platform](/entra/identity-platform/permissions-consent-overview).

## Send feedback

We always welcome your feedback about our products. Especially during public preview, your feedback helps us improve the product faster.

## Related content

- [Update your data model to work well with Copilot](copilot-evaluate-data.md)
- [Create a report with Copilot in the Power BI service](copilot-create-report-service.md)
- [Create a report with Copilot in Power BI Desktop](copilot-create-desktop-report.md)
- [Write Copilot prompts for creating report pages in Power BI](copilot-prompts-report-pages.md)
- [Create a narrative summary visual with Copilot for Power BI](copilot-create-narrative.md)
- [Write Copilot prompts for creating narrative visuals in Power BI](copilot-prompts-narratives.md)
- [Overview of Copilot for Fabric (preview)](/fabric/get-started/copilot-fabric-overview)
- [Frequently asked questions about Copilot for Power BI and Fabric](/fabric/get-started/copilot-faq-fabric)
- [Privacy, security, and responsible use for Copilot](/fabric/get-started/copilot-privacy-security) article in the Fabric documentation 
- [Copilot tenant settings (preview)](/fabric/admin/service-admin-portal-copilot) article in the Fabric documentation 
- [Enhance Q&A with Copilot for Power BI](../natural-language/q-and-a-copilot-enhancements.md)
