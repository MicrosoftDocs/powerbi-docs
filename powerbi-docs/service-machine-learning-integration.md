---
title: Azure Machine Learning integration in Power BI
description: Learn how to use Machine Learning with Power BI
author: davidiseminger
ms.reviewer: ''

ms.service: powerbi
ms.subservice: powerbi-service
ms.topic: conceptual
ms.date: 05/31/2019
ms.author: davidi

LocalizationGroup: conceptual
---

# Azure Machine Learning integration in Power BI

Numerous organizations use **Machine Learning** models for better insights and predictions about their business. The ability to visualize and invoke insights from these models, in your reports and dashboards and other analytics, can help disseminate these insights to the business users who need it the most.  Power BI now makes it simple to incorporate the insights from models hosted on Azure Machine Learning, using straightforward point-and-click gestures.

To use this capability, a data scientist can simply grant access to the Azure ML model to the BI analyst using the Azure portal.  Then, at the start of each session, Power Query discovers all the Azure ML models to which the user has access and exposes them as dynamic Power Query functions.  The user can then invoke those functions by accessing them from the ribbon in Power Query Editor, or by invoking the M function directly. Power BI also automatically batches the access requests when invoking the Azure ML model for a set of rows to achieve better performance.

This functionality is currently only supported for Power BI dataflows, and for Power Query online in the Power BI service.

To learn more about dataflows, see [Self-service data prep in Power BI](service-dataflows-overview.md).

To learn more about Azure Machine Learning, please see:

- Overview:  [What is Azure Machine Learning?](https://docs.microsoft.com/azure/machine-learning/service/overview-what-is-azure-ml)
- Quick Starts and Tutorials for Azure Machine Learning:  [Azure Machine Learning Documentation](https://docs.microsoft.com/azure/machine-learning/)

## Granting access to the Azure ML model to a Power BI user

To access an Azure ML model from Power BI, the user must have **Read** access to the Azure subscription.  In addition:

- For Machine Learning Studio (classic) models, **Read** access to Machine Learning Studio (classic) web service
- For Machine Learning models, **Read** access to the Machine Learning workspace

The steps in this article describe how to grant a Power BI user access to a model hosted on the Azure ML service, so they can access this model as a Power Query function.  For further details, please see [Manage access using RBAC and the Azure portal](https://docs.microsoft.com/azure/role-based-access-control/role-assignments-portal).

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Go to the **Subscriptions** page. You can find the **Subscriptions** page through the **All Services** list in the nav pane menu of the Azure portal.

    ![Azure subscriptions page](media/service-machine-learning-integration/machine-learning-integration_01.png)

3. Select your subscription.

    ![Select your subscription](media/service-machine-learning-integration/machine-learning-integration_02.png)

4. Select **Access Control (IAM)**, and then select the **Add** button.

    ![Access control AIM](media/service-machine-learning-integration/machine-learning-integration_03.png)

5. Select **Reader** as the Role. Select the Power BI user to whom you wish to grant access to the Azure ML model.

    ![Select Reader as the role](media/service-machine-learning-integration/machine-learning-integration_04.png)

6. Select **Save**.

7. Repeat steps three through six to grant **Reader** access to the user for the specific Machine Learning Studio (classic) web service, *or* the Machine Learning workspace hosting the model.


## Schema discovery for Machine Learning models

Data scientists primarily use Python to develop, and even deploy, their machine learning models for Machine Learning.  Unlike the Machine Learning Studio (classic), which helps automate the task of creating a schema file for the model, in the case of Machine Learning, the data scientist must explicitly generate the schema file using Python.

This schema file must be included in the deployed web service for Machine Learning models. To automatically generate the schema for web service, you must provide a sample of the input/output in the entry script for the deployed model. Please see the subsection on [(Optional) Automatic Swagger schema generation in the Deploy models with the Azure Machine Learning](https://docs.microsoft.com/azure/machine-learning/service/how-to-deploy-and-where#optional-automatic-schema-generation) service documentation. The link includes the example entry script with the statements for the schema generation. 

Specifically, the *\@input_schema* and *\@output_schema* functions in the entry script reference the input and output sample formats in the *input_sample* and *output_sample* variables, and use these samples to generate an OpenAPI (Swagger) specification for the web service during deployment.

These instructions for schema generation by updating the entry script must also be applied to models created using automated machine learning experiments using the Azure Machine Learning SDK.

> [!NOTE]
> Models created using the Azure Machine Learning visual interface do not currently support schema generation, but will in subsequent releases. 

## Invoking the Azure ML model in Power BI

You can invoke any Azure ML model to which you have been granted access, directly from the Power Query Editor in your dataflow. To access the Azure ML models, select the **Edit** button for the entity that you want to enrich with insights from your Azure ML model, as shown in the following image.

![Power BI service - edit the entity](media/service-machine-learning-integration/machine-learning-integration_05.png)

Selecting the **Edit** button opens the Power Query Editor for the entities in your dataflow.

![Power Query Editor](media/service-machine-learning-integration/machine-learning-integration_06.png)

Select the **AI Insights** button in the ribbon, and then select the _Azure Machine Learning Models_ folder from the nav pane menu. All the Azure ML models to which you have access are listed here as Power Query functions. Also, the input parameters for the Azure ML model are automatically mapped as parameters of the corresponding Power Query function.

To invoke an Azure ML model, you can specify any of the selected entity's columns as an input from the drop-down. You can also specify a constant value to be used as an input by toggling the column icon to the left of the input dialog.

![select the column](media/service-machine-learning-integration/machine-learning-integration_07.png)

Select **Invoke** to view the preview of the Azure ML model's output as a new column in the entity table. You will also see the model invocation as an applied step for the query.

![Select invoke](media/service-machine-learning-integration/machine-learning-integration_08.png)

If the model returns multiple output parameters, they are grouped together as a record in the output column. You can expand the column to produce individual output parameters in separate columns.

![expand the column](media/service-machine-learning-integration/machine-learning-integration_09.png)

Once you save your dataflow, the model is automatically invoked when the dataflow is refreshed, for any new or updated rows in the entity table.

## Next Steps

This article provided an overview of integrating Machine Learning into the Power BI service. The following articles might also be interesting and useful. 

* [Tutorial: Invoke a Machine Learning Studio (classic) model in Power BI](service-tutorial-invoke-machine-learning-model.md)
* [Tutorial: Using Cognitive Services in Power BI](service-tutorial-use-cognitive-services.md)
* [Cognitive Services in Power BI](service-cognitive-services.md)

For more information about dataflows, you can read these articles:
* [Create and use dataflows in Power BI](service-dataflows-create-use.md)
* [Using computed entities on Power BI Premium](service-dataflows-computed-entities-premium.md)
* [Using dataflows with on-premises data sources](service-dataflows-on-premises-gateways.md)
* [Developer resources for Power BI dataflows](service-dataflows-developer-resources.md)
* [Dataflows and Azure Data Lake integration (Preview)](service-dataflows-azure-data-lake-integration.md)


