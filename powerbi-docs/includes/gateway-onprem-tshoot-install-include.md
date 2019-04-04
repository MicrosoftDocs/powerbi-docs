## Update to the latest version
A lot of issues can surface when the gateway version is out of date.  It is a good general practice to make sure you are on the latest version.  If you haven't updated the gateway for a month, or longer, you may want to consider installing the latest version of the gateway and see if you can reproduce the issue.

## Common issues
Here are a few common issues and resolutions that have helped a number of customers in environments that restrict internet access.

### Authentication to proxy server
Your proxy may require authentication from a domain user account. By default, the gateway uses a Service SID for the windows service log on user. Changing the log on user to a domain user can help with this. For more information, see [Changing the gateway service account to a domain user](../service-gateway-proxy.md#changing-the-gateway-service-account-to-a-domain-user).

### Your proxy only allows ports 80 and 443 traffic
Some proxies restrict traffic to only ports 80 and 443. By default, communication to Azure Service Bus will occur on ports other than 443.

You can force the gateway to communicate with Azure Service Bus using HTTPS instead of direct TCP. You will need to modify the *Microsoft.PowerBI.DataMovement.Pipeline.GatewayCore.dll.config* file. Change the value from `AutoDetect` to `Https`. This file is located, by default, at *C:\Program Files\On-premises data gateway*.

```
<setting name="ServiceBusSystemConnectivityModeString" serializeAs="String">
    <value>Https</value>
</setting>
```

## Installation
### Error: Failed to add user to group.  (-2147463168   PBIEgwService   Performance Log Users   )
You may receive this error if you are trying to install the gateway on a domain controller. Deploying on a domain controller is not supported. You will need to deploy the gateway on a machine that is not a domain controller.

### Installation fails
You may encounter installation failures if the anti-virus software on the installation machine is out of date. You can either update the anti-virus installation, or disable anti-virus only for the duration of the gateway installation to complete, then re-enable anti-virus.

