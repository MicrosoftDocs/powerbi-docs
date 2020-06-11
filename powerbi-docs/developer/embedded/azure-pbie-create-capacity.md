---
title: Create Power BI Embedded capacity in the Azure portal | Microsoft Docs
description: This article walks through how to create a Power BI Embedded capacity in Microsoft Azure.
author: KesemSharabi
ms.author: kesharab
ms.service: power-bi-embedded
ms.subservice: ''
ms.devlang: csharp, javascript
ms.topic: conceptual
ms.reviewer: zakharb
ms.date: 02/05/2019
---

# Create Power BI Embedded capacity in the Azure portal

This article walks through how to create a [Power BI Embedded](azure-pbie-what-is-power-bi-embedded.md) capacity in Microsoft Azure. Power BI Embedded simplifies Power BI capabilities by helping you quickly add stunning visuals, reports, and dashboards to your apps.

If you don't have an Azure subscription, create a [free account](https://azure.microsoft.com/free/) before you begin.

> [!VIDEO https://www.youtube.com/embed/aXrvFfg_iSk]

## Before you begin

To complete this quickstart, you need:

* **Azure subscription:** Visit [Azure Free Trial](https://azure.microsoft.com/free/) to create an account.
* **Azure Active Directory:** Your subscription must be associated with an Azure Active Directory (Azure AD) tenant. Also, ***you need to be signed in to Azure with an account in that tenant***. Microsoft accounts aren't supported. To learn more, see [Authentication and user permissions](https://docs.microsoft.com/azure/analysis-services/analysis-services-manage-users).
* **Power BI tenant:** At least one account in your Azure AD tenant must have signed up for Power BI.
* **Resource group:** Use a resource group you already have or [create a new one](https://docs.microsoft.com/azure/azure-resource-manager/resource-group-overview).

## Create a capacity

# [Portal](#tab/portal)

1. Sign into the [Azure portal](https://portal.azure.com/).

2. In the search box, search for *Power BI Embedded*.

3. Within Power BI Embedded, select **Add**.

[!INCLUDE [Power BI create capacity parameters](../../includes/powerbi-embedded-create-capacity.md)]

# [Azure CLI](#tab/CLI)

### Use Azure Cloud Shell

Azure hosts Azure Cloud Shell, an interactive shell environment that you can use through your browser. You can use either Bash or PowerShell with Cloud Shell to work with Azure services. You can use the Cloud Shell preinstalled commands to run the code in this article without having to install anything on your local environment.

To start Azure Cloud Shell:

| Option | Example/Link |
|-----------------------------------------------|---|
| Select **Try It** in the upper-right corner of a code block. Selecting **Try It** doesn't automatically copy the code to Cloud Shell. | ![Example of Try It for Azure Cloud Shell](./media/azure-pbie-create-capacity/hdi-azure-cli-try-it.png) |
| Go to [https://shell.azure.com](https://shell.azure.com), or select the **Launch Cloud Shell** button to open Cloud Shell in your browser. | [![Launch Cloud Shell in a new window](media/azure-pbie-create-capacity/hdi-launch-cloud-shell.png)](https://shell.azure.com) |
| Select the **Cloud Shell** button on the menu bar at the upper right in the [Azure portal](https://portal.azure.com). | ![Cloud Shell button in the Azure portal](./media/azure-pbie-create-capacity/hdi-cloud-shell-menu.png) |

To run the code in this article in Azure Cloud Shell:

1. Start Cloud Shell.

2. Select the **Copy** button on a code block to copy the code.

3. Paste the code into the Cloud Shell session by selecting **Ctrl**+**Shift**+**V** on Windows and Linux or by selecting **Cmd**+**Shift**+**V** on macOS.

4. Select **Enter** to run the code.

### Create a capacity with Azure CLI

Use the [az powerbi embedded-capacity create](https://docs.microsoft.com/cli/azure/ext/powerbidedicated/powerbi/embedded-capacity?view=azure-cli-latest#ext-powerbidedicated-az-powerbi-embedded-capacity-create) command to create a capacity.

```azurecli
az powerbi embedded-capacity create --location
                                    --name
                                    --resource-group
                                    --sku-name {A1, A2, A3, A4, A5, A6}
                                    [--administration-members]
                                    [--no-wait]
                                    [--sku-tier {PBIE_Azure}]
                                    [--tags]
```

### Delete a capacity with Azure CLI

To delete a capacity using Azure CLI, use the [az powerbi embedded-capacity delete](https://docs.microsoft.com/cli/azure/ext/powerbidedicated/powerbi/embedded-capacity?view=azure-cli-latest#ext-powerbidedicated-az-powerbi-embedded-capacity-delete) command.

```azurecli
az powerbi embedded-capacity delete --name
                                    --resource-group
                                    [--no-wait]
                                    [--yes]
```

### Manage your capacity with Azure CLI

You can view all the Power BI Embedded Azure CLI commands, in [az powerbi](https://docs.microsoft.com/cli/azure/ext/powerbidedicated/powerbi?view=azure-cli-latest).

# [ARM template](#tab/ARM-template)

### Use Resource Manager template

[Resource Manager template](https://docs.microsoft.com/azure/azure-resource-manager/templates/overview) is a JavaScript Object Notation (JSON) file that defines the infrastructure and configuration for your project. The template uses declarative syntax, which lets you state what you intend to deploy without having to write the sequence of programming commands to create it. If you want to learn more about developing Resource Manager templates, see [Resource Manager documentation](https://docs.microsoft.com/azure/azure-resource-manager/) and the [template reference](https://docs.microsoft.com/azure/templates/).

If you don't have an Azure subscription, create a [free](https://azure.microsoft.com/free/) account before you begin.

### Review the template

```json
{
    "$schema": "http://schema.management.azure.com/schemas/2014-04-01-preview/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "name": {
            "type": "string"
        },
        "location": {
            "type": "string"
        },
        "sku": {
            "type": "string",
            "allowedValues": [
                "A1",
                "A2",
                "A3",
                "A4",
                "A5",
                "A6"
            ]
        },
        "admin": {
            "type": "string"
        },
        "tags": {
            "type": "object"
        }
    },
    "resources": [
        {
            "apiVersion": "2017-10-01",
            "name": "[parameters('name')]",
            "location": "[parameters('location')]",
            "type": "Microsoft.PowerBIDedicated/capacities",
            "sku": {
                "name": "[parameters('sku')]"
            },
            "properties": {
                "administration": {
                    "members": [
                        "[parameters('admin')]"
                    ]
                }
            },
            "tags": "[parameters('tags')]"
        }
    ]
}
```

One Azure resource is defined in the template, [Microsoft.PowerBIDedicated/capacities Az](https://docs.microsoft.com/azure/templates/microsoft.powerbidedicated/allversions) - Create a Power BI Embedded capacity.

### Deploy the template

1. Select the following link to sign in to Azure and open a template. The template creates a Power BI Embedded capacity.

    [![Deploy to Azure](media/azure-pbie-create-capacity/deploy-to-azure.svg)](https://portal.azure.com/#create/Microsoft.Template/uri/media/azure-pbie-create-capacitypower-bi-embedded-create-capacity.json)

[!INCLUDE [Power BI create capacity parameters](../../includes/powerbi-embedded-create-capacity.md)]

---

## Next steps

* To use your new Power BI Embedded capacity, browse to the Power BI admin portal to assign workspaces. For more information, see [Manage capacities within Power BI Premium and Power BI Embedded](https://powerbi.microsoft.com/documentation/powerbi-admin-premium-manage/).

* If you don't need to use this capacity, you can pause it to stop billing. For more information, see [Pause and start your Power BI Embedded capacity in the Azure portal](azure-pbie-pause-start.md).

* To begin embedding Power BI content within your application, see [How to embed your Power BI dashboards, reports, and tiles](https://powerbi.microsoft.com/documentation/powerbi-developer-embedding-content/).

* More questions? [Try asking the Power BI Community](https://community.powerbi.com/)