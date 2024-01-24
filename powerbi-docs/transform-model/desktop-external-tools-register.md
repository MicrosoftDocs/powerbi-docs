---
title: Register external tools in Power BI Desktop
description: Learn how to register external tools for Power BI Desktop and configure elements of an external tool to fit your needs.
author: davidiseminger
ms.author: davidi
ms.reviewer: ''
ms.service: powerbi
ms.subservice: pbi-reports-dashboards
ms.topic: conceptual
ms.date: 11/10/2023
LocalizationGroup: Create reports
---

# Register an external tool

Some tools must be manually registered with Power BI Desktop. To register an external tool, create a JSON file with the following example code:

```json
{
    "name": "<tool name>",
    "description": "<tool description>",
    "path": "<tool executable path>",
    "arguments": "<optional command line arguments>",
    "iconData": "image/png;base64,<encoded png icon data>"
}
```

The pbitool.json file includes the following elements:

* **name:** Provide a name for the tool, which will appear as a button caption in the External Tools ribbon within Power BI Desktop.
* **description:** (optional) Provide a description, which will appear as a tooltip on the External Tools ribbon button within Power BI Desktop.
* **path:** Provide the fully qualified path to the tool executable.
* **arguments:** (optional) Provide a string of command-line arguments that the tool executable should be launched with. You can use any of the following placeholders:
  * **%server%:** Replaced with the server name and portnumber of the local instance of Analysis Services Tabular for imported/DirectQuery data models.
  * **%database%:** Replaced with the database name of the model hosted in the local instance of Analysis Services Tabular for imported/DirectQuery data models.
* **iconData:** Provide image data, which will be rendered as a button icon in the External Tools ribbon within Power BI Desktop. The string should be formatted according to the syntax for Data URIs without the "data:" prefix.

Name the file `"<tool name>.pbitool.json"` and place it in the following folder:

* `%commonprogramfiles%\Microsoft Shared\Power BI Desktop\External Tools`

For 64-bit environments, place the files in the following folder:

* **Program Files (x86)\Common Files\Microsoft Shared\Power BI Desktop\External Tools**

Files in that specified location with the **.pbitool.json** extension are loaded by Power BI Desktop upon startup.

## Example

The following *.pbitool.json file launches powershell.exe from the External Tools ribbon and runs a script called pbiToolsDemo.ps1. The script passes the server name and port number in the -Server parameter and the semantic model name in the -Database parameter.

```json
{ 
    "version": "1.0.0", 
    "name": "External Tools Demo", 
    "description": "Launches PowerShell and runs a script that outputs server and database parameters. (Requires elevated PowerShell permissions.)", 
    "path": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe", 
    "arguments": "C:\\pbiToolsDemo.ps1 -Server \"%server%\" -Database \"%database%\"", 
    "iconData": "image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsEAAA7BAbiRa+0AAAANSURBVBhXY/jH9+8/AAciAwpql7QkAAAAAElFTkSuQmCC" 
} 
```

The corresponding pbiToolsDemo.ps1 script outputs the Server and Database parameters to the console.

```powershell
[CmdletBinding()] 
param 
( 
        [Parameter(Mandatory = $true)]         
[string] $Server, 
        [Parameter(Mandatory = $true)]         
[string] $Database  
) 
Write-Host "" 
Write-Host "Analysis Services instance: " -NoNewline 
Write-Host "$Server" -ForegroundColor Yellow 
Write-Host "Dataset name: " -NoNewline 
Write-Host "$Database" -ForegroundColor Green 
Write-Host "" 
Read-Host -Prompt 'Press [Enter] to close this window'  
```

:::image type="content" source="media/desktop-external-tools-register/json-example-output.png" border="false" alt-text="Screenshot of PowerShell console output created from the example external tool.":::

## Icon data URIs

To include an icon in the External Tools ribbon, the pbitool.json registration file must include an iconData element.

:::image type="content" source="media/desktop-external-tools-register/tool-ribbon.png" alt-text="Screenshot of the external tools ribbon with the tool icons.":::

The iconData element takes a data URI without the **data:** prefix. For example, the data URI of a one pixel magenta png image is:

`data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsEAAA7BAbiRa+0AAAANSURBVBhXY/jH9+8/AAciAwpql7QkAAAAAElFTkSuQmCC`

Be sure to remove the **data:** prefix, as shown in the pbitool.json preceding example.

To convert a .png or other image file type to a data URI, use an online tool or a custom tool such as the one shown in the following C# code snippet:

```c#
string ImageDataUri; 
OpenFileDialog openFileDialog1 = new OpenFileDialog(); 
openFileDialog1.Filter = "PNG Files (.png)|*.png|All Files (*.*)|*.*"; 
openFileDialog1.FilterIndex = 1; 
openFileDialog1.Multiselect = false; 
openFileDialog1.CheckFileExists = true; 
bool? userClickedOK = openFileDialog1.ShowDialog(); 
if (userClickedOK == true) 
{ 
    var fileName = openFileDialog1.FileName; 
    var sb = new StringBuilder(); 
    sb.Append("image/") 
        .Append((System.IO.Path.GetExtension(fileName) ?? "png").Replace(".", "")) 
        .Append(";base64,") 
        .Append(Convert.ToBase64String(File.ReadAllBytes(fileName))); 
    ImageDataUri = sb.ToString(); 
} 
```

## Related content

* [External tools in Power BI Desktop](desktop-external-tools.md)  
* [Analysis Services client libraries](/analysis-services/client-libraries?view=power-bi-premium-current&preserve-view=true)  
* [Tabular Object Model (TOM)](/analysis-services/tom/introduction-to-the-tabular-object-model-tom-in-analysis-services-amo?view=power-bi-premium-current&preserve-view=true)  
