---
title: Using service tags with Power BI
description: Learn how to use service tags with Power BI to connect to a SQL Managed Instance
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: powerbi-premium
ms.topic: how-to
ms.date: 05/12/2021
LocalizationGroup: Premium
---
# Using service tags with Power BI

You can use **Azure service tags** with Power BI to enable an [Azure SQL Managed Instance (MI)](/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview) to allow incoming connections from the Power BI service. In Azure, a *service tag* is a defined group of IP addresses that you can configure to be automatically managed, as a group, to minimize the complexity of updates or changes to network security rules. By using service tags with Power BI, you can enable a SQL Managed Instance to allow incoming connections from the Power BI service.

The following configurations are necessary to successfully enable the endpoints for use in the Power BI service:

1. Enable a public endpoint in the SQL Managed Instance
2. Create a Network Security Group rule to allow inbound traffic
3. Enter the credentials in Power BI

The following sections look at each of these steps in turn.


## Enable a public endpoint

The first part of the process is to [enable a Public Endpoint in the SQL Managed Instance](/azure/azure-sql/managed-instance/public-endpoint-configure). Take the following steps:

1. Navigate to your SQL Managed Instance in the Azure portal.
2. On the **Networking** blade, slid the **Public endpoint (data)** to **Enable**. The following image shows the screen in the Azure portal.

    :::image type="content" source="media/service-premium-service-tags/premium-service-tags-01.png" alt-text="Screenshot of Azure portal to enable public endpoints":::

3. Set the **Minimum TLS version** to **1.2**
4. Select **Save** to save your settings.

## Create a network security group rule

The next collection of steps requires that you create a **Network Security Group (NSG)** rule to allow inbound traffic for the Power BI service. This cannot currently be done in the Azure portal, and rather, must be accomplished using either the *Command Line Interface (CLI)* or by using PowerShell. 

> [!NOTE]
> The priority of the rule you set must be higher than the 4096 *deny_all_inbound* rule, which means the priority value must be lower than 4096. In the following example, a priority value of 400 is used.

The following **CLI script** is provided as a reference example. See [az network nsg rule](/cli/azure/network/nsg/rule?view=azure-cli-latest) for more information. You may need to change multiple values for the example to work properly in your situation. A PowerShell script is provided afterward. 

```azurecli
#login to azure
az login
 
#set subscription that contains SQL MI instance
$subname = "mysubscriptionname"
az account set --subscription $subname
 
#set NSG rule for inbound PowerBI traffic

#update $RG to your resource group name
$rg = 'myresourcegroup'
#update $nsg to your Network Security Group name
$nsg = 'nsgresourcename'
# Name the NSG rule
$rule = 'allow_inbound_PowerBI'
#set the priority - this must be higher priority (lower number) than the deny_all_inbound rule
$priority = 400
#specifiy the service tag to use
$servicetag = 'PowerBI'
#specify the public endpoint port defined in step 1
$port = 3342
#set the rule to inbound direction
$direction = 'Inbound'
#set the access type to "Allow"
$access = 'Allow'
#Set the protocol as TCP
$protocol = 'tcp'
#Provide a description for the rule
$desc = 'Allow PowerBI Access to SQL MI for Direct Query or Data Refresh.'
 
#create the NSG rule
az network nsg rule create -g $rg \
--nsg-name $nsg -n $rule --priority $priority \
--source-address-prefixes $servicetag --destination-address-prefixes '*' \
--destination-port-ranges $port --direction $direction --access $access \
--protocol $protocol --description $desc
```

The following **PowerShell** script is provided as another reference to create the Network Security Group (NSG) rule. See [Add a network security group rule in PowerShell](/azure/service-fabric/scripts/service-fabric-powershell-add-nsg-rule) for more information. You may need to change multiple values for the example to work properly in your situation. 

```powershell
#login to azure
Login-AzAccount

#get your subscription ID
Get-AzSubscription


####
#Script to create Network Security Group Rule
###

#enter your subscription ID
Set-AzContext -SubscriptionId "yoursubscriptionID" 

#Provide the resource group for your Network Security Group
$RGname="yourRG"
#Enter the port for the SQL Managed Instance Public Endpoint
$port=3342
#name the NSG rule
$rulename="allow_inbound_PowerBI"
#provide the name of the Network Security Group to add the rule to
$nsgname="yourNSG"
#set direction to inbound to allow PowerBI to access SQL MI
$direction ="Inbound"
#set the priority of the rule. Priority must be higher (ie. lower number) than the deny_all_inbound (4096)
$priority=400
#set the service tags for the source to \u201cPowerBI\u201d
$serviceTag = "PowerBI"

# Get the NSG resource
$nsg = Get-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $RGname

# Add the inbound security rule.
$nsg | Add-AzNetworkSecurityRuleConfig -Name $rulename -Description "Allow app port" -Access Allow `
    -Protocol * -Direction $direction -Priority $priority -SourceAddressPrefix $serviceTag -SourcePortRange * `
    -DestinationAddressPrefix * -DestinationPortRange $port

# Update the NSG.
$nsg | Set-AzNetworkSecurityGroup 

```

## Enter the credentials in the Power BI service

The last part of the process is entering the credentials in the Power BI service. Log into Power BI and navigate to the workspace containing the dataset(s) that are using SQL Managed Instance. In the following example, that workspace is called *ASAdataset* and the dataset is called *Contoso SQL MI Demo*. Take the following steps to complete the process:

1. Navigate to **Dataset settings**.
2. Expand the **Data source credentials** section, as shown in the following image.
    :::image type="content" source="media/service-premium-service-tags/premium-service-tags-02.png" alt-text="Screenshot of edit credentials":::

3. Select the **edit credentials** link. In the dialog that appears, enter valid credentials.

Save your settings and exit. Your SQL Managed Instance is now configured to allow incoming connections from the Power BI service.


## Next steps

* [What is Power BI Premium?](service-premium-what-is.md)
* [Enable a Public Endpoint in the SQL Managed Instance](/azure/azure-sql/managed-instance/public-endpoint-configure)
* [az network nsg rule](/cli/azure/network/nsg/rule?view=azure-cli-latest)
* [Add a network security group rule in PowerShell](/azure/service-fabric/scripts/service-fabric-powershell-add-nsg-rule)






