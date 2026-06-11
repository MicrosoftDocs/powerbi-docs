---
title: What is the Power BI Desktop Bridge? (Preview)
description: Learn how the Power BI Desktop Bridge connects external tools to Power BI Desktop, discover available APIs, and start building integrations today.
author: billmath
ms.author: billmath
ms.reviewer: saralam
ms.topic: overview
ms.service: powerbi
ms.subservice: powerbi-developer
ms.date: 06/03/2026
ms.collection: ce-skilling-ai-copilot
ms.update-cycle: 180-days
ai-usage: ai-assisted
---

# What is the Power BI Desktop Bridge? (Preview)

The Power BI Desktop Bridge enables external tools to communicate with a running instance of Power BI Desktop on the local machine. External applications can use the bridge to interact with an active Power BI Desktop session through the APIs it exposes.

> [!IMPORTANT]
> The IPC Bridge is currently in preview. Features, behavior, and the API surface might change before general availability.

## How the bridge communicates with Power BI Desktop

The bridge is implemented as a local server hosted within the Power BI Desktop process. It exposes a named pipe endpoint for IPC-based communication. The bridge has the following characteristics:

- Power BI Desktop creates the named pipe `pbi-desktop-bridge-${processId}` to expose the IPC Bridge. If you open multiple Desktop windows, each one has its own independent bridge, so your client must select which instance to connect to.
- Communication is strictly local and doesn't support remote access or REST-based interactions.
- The bridge uses [JSON-RPC 2.0](https://www.jsonrpc.org/specification) as its communication protocol. It transmits messages by using header-delimited framing (Content-Length based framing), which ensures correct delimitation and parsing of JSON payloads over the named pipe transport.
- Multiple clients can connect to the same bridge simultaneously, but only one operation can run at a time. If you send a request while another operation is active, you receive an error. Wait for the current operation to complete before sending the next request.

The bridge is enabled by default. To enable or disable it:

1. Open Power BI Desktop.
1. Go to **File** > **Options and Settings** > **Options**.
1. Select **Preview Features**.
1. Check **Enable external tool access to Power BI Desktop through secure local APIs**.

## API discovery

Call `bridge.manifest` to discover available methods in the current version of Power BI Desktop. This discovery method:

- Returns the list of available API methods that your version of Power BI Desktop supports.
- Describes each method and its parameters.
- Is the best way to check what the bridge can do.

The available methods can change between Desktop versions, so always call `bridge.manifest` before calling any other method.

> [!TIP]
> If you call a method that isn't supported in the current version of Power BI Desktop, you receive a `-32601 MethodNotFound` error. Checking the manifest first prevents this problem.

### Connect to the bridge with PowerShell

The following script connects to the IPC Bridge, calls `bridge.manifest`, and then lets you invoke other methods interactively.

1. Copy the following script and save it as a `.ps1` file (for example, `Test-DesktopBridge.ps1`).
1. Open a PowerShell terminal and run the script:

   ```powershell
   .\Test-DesktopBridge.ps1
   ```

The script calls `bridge.manifest` automatically, then prompts you for additional method calls. Type a method name and select **Enter**, or leave it blank to quit. To print the manifest and exit without the interactive prompt, run with `-Silent`:

```powershell
.\Test-DesktopBridge.ps1 -Silent
```

The full script follows:

```powershell
# ---------------------------------------------------------------
# Script setup
# ---------------------------------------------------------------
# ClientName is a label that identifies your tool to Power BI Desktop.
# Use -Silent to print the manifest and exit without prompting.

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '')]
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'ClientName')]
[CmdletBinding()]
param(
    [string]$ClientName = "Test-DesktopBridge.ps1",
    [switch]$Silent
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ---------------------------------------------------------------
# Message framing functions
# ---------------------------------------------------------------
# The bridge uses header-delimited framing (Content-Length + body)
# to send and receive JSON-RPC messages over the named pipe.

function Write-Frame {
    param(
        [Parameter(Mandatory)] [System.IO.Stream]$Stream,
        [Parameter(Mandatory)] $Payload
    )

    $json = $Payload | ConvertTo-Json -Depth 10 -Compress
    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($json)
    $headerBytes = [System.Text.Encoding]::ASCII.GetBytes(
        "Content-Length: $($bodyBytes.Length)`r`n`r`n"
    )

    $Stream.Write($headerBytes, 0, $headerBytes.Length)
    $Stream.Write($bodyBytes, 0, $bodyBytes.Length)
    $Stream.Flush()

    Write-Host ">>> $json" -ForegroundColor DarkGray
}

function Read-Frame {
    param([Parameter(Mandatory)] [System.IO.Stream]$Stream)

    $header = ""
    while (-not $header.EndsWith("`r`n`r`n")) {
        $b = $Stream.ReadByte()
        if ($b -eq -1) { throw "Connection closed before headers were read." }
        $header += [char]$b
    }
    if ($header -notmatch "Content-Length:\s*(\d+)") {
        throw "Response is missing the Content-Length header."
    }
    $contentLength = [int]$Matches[1]

    $bodyBytes = New-Object byte[] $contentLength
    $offset = 0
    while ($offset -lt $contentLength) {
        $read = $Stream.Read($bodyBytes, $offset, $contentLength - $offset)
        if ($read -eq 0) {
            throw "Connection closed before the response body was fully read."
        }
        $offset += $read
    }

    $json = [System.Text.Encoding]::UTF8.GetString($bodyBytes)
    Write-Host "<<< $json" -ForegroundColor DarkGray
    return $json
}

# ---------------------------------------------------------------
# Method call helper
# ---------------------------------------------------------------
# Invoke-BridgeMethod builds a JSON-RPC 2.0 request, sends it,
# and prints the result. Each call gets a unique id.

$script:nextRequestId = 0
function Invoke-BridgeMethod {
    param(
        [Parameter(Mandatory)] [System.IO.Stream]$Pipe,
        [Parameter(Mandatory)] [string]$Method,
        [hashtable]$Arguments = @{}
    )

    $script:nextRequestId++
    $request = @{
        jsonrpc = "2.0"
        id      = $script:nextRequestId
        method  = $Method
        params  = @{
            args = $Arguments
        }
    }

    Write-Frame -Stream $Pipe -Payload $request
    $responseJson = Read-Frame -Stream $Pipe
    $response = $responseJson | ConvertFrom-Json

    Write-Host ""
    if ($response.PSObject.Properties.Name -contains "error") {
        Write-Host "ERROR [$($response.error.code)]: $($response.error.message)" -ForegroundColor Red
    }
    else {
        Write-Host "SUCCESS:" -ForegroundColor Green
        $response.result | ConvertTo-Json -Depth 10
    }
    Write-Host ""
}

# ---------------------------------------------------------------
# Argument conversion helper
# ---------------------------------------------------------------
# ConvertTo-HashtableTree converts JSON input (parsed by
# ConvertFrom-Json as PSCustomObject) into nested hashtables
# that Invoke-BridgeMethod can use.

function ConvertTo-HashtableTree {
    param($Value)

    if ($null -eq $Value) { return $null }
    if ($Value -is [System.Collections.IDictionary]) {
        $result = @{}
        foreach ($key in $Value.Keys) { $result[$key] = ConvertTo-HashtableTree -Value $Value[$key] }
        return $result
    }
    if ($Value -is [System.Management.Automation.PSCustomObject]) {
        $result = @{}
        foreach ($p in $Value.PSObject.Properties) { $result[$p.Name] = ConvertTo-HashtableTree -Value $p.Value }
        return $result
    }
    if ($Value -is [System.Collections.IEnumerable] -and -not ($Value -is [string])) {
        return @($Value | ForEach-Object { ConvertTo-HashtableTree -Value $_ })
    }
    return $Value
}

# ---------------------------------------------------------------
# Find Power BI Desktop and connect to the pipe
# ---------------------------------------------------------------
# Each Desktop window creates its own bridge pipe. The pipe name
# includes the process ID so the script can find the right one.
# If multiple windows are open, this connects to the first one.

$desktop = Get-Process -Name "PBIDesktop" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $desktop) {
    Write-Error "Power BI Desktop is not running. Start it before running this script."
    return
}

$pipeName = "pbi-desktop-bridge-$($desktop.Id)"

if (-not (Test-Path "\\.\pipe\$pipeName")) {
    Write-Error "Bridge pipe '$pipeName' was not found. Make sure the preview feature is enabled in Power BI Desktop options."
    return
}

Write-Host "Connecting to \\.\pipe\$pipeName (PID $($desktop.Id))" -ForegroundColor Cyan

# ---------------------------------------------------------------
# Call bridge.manifest and start the interactive loop
# ---------------------------------------------------------------
# The connection is wrapped in try/catch/finally so the pipe
# is always closed, even if an error occurs.

$pipe = $null
try {
    $pipe = New-Object System.IO.Pipes.NamedPipeClientStream(".", $pipeName, [System.IO.Pipes.PipeDirection]::InOut)
    $pipe.Connect(5000)
    Write-Host "Connected." -ForegroundColor Green
    Write-Host ""

    # Always start with bridge.manifest to discover available operations.
    Invoke-BridgeMethod -Pipe $pipe -Method "bridge.manifest"

    # Unless -Silent was passed, keep the pipe open and prompt for more calls.
    if (-not $Silent) {
        while ($true) {
            $method = Read-Host "Method (blank to quit)"
            if ([string]::IsNullOrWhiteSpace($method)) { break }

            $argsInput = Read-Host "Args JSON (blank for {})"
            $methodArgs = if ([string]::IsNullOrWhiteSpace($argsInput)) {
                @{}
            }
            else {
                ConvertTo-HashtableTree -Value ($argsInput | ConvertFrom-Json)
            }

            Invoke-BridgeMethod -Pipe $pipe -Method $method -Arguments $methodArgs
        }
    }
}
catch {
    Write-Error "Bridge call failed: $($_.Exception.Message)"
}
finally {
    if ($pipe) {
        try { $pipe.Dispose() } catch { Write-Verbose "Pipe dispose failed: $($_.Exception.Message)" }
    }
}
```

## Integration with the Report Authoring Skill

The [Report Authoring Skill](power-bi-report-authoring-skill-overview.md) shows how to use the IPC Bridge. The skill uses the IPC Bridge to communicate with Power BI Desktop. This approach enables a fast edit-verify loop: read the current report definition, apply changes, capture a screenshot of the result, and iterate.

## Related content

- [Power BI Report Authoring skill overview](power-bi-report-authoring-skill-overview.md)
- [Get started with Power BI Desktop](../../fundamentals/desktop-getting-started.md)
