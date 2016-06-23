## Update to the latest version 
 
A lot of issues can surface when the gateway version is out of date.  It is a good general practice to make sure you are on the latest version.  If you haven't updated the gateway for a month, or longer, you may want to consider installing the latest version of the gateway and see if you can reproduce the issue.

## Installation

### Error: Failed to add user to group.  (-2147463168   PBIEgwService   Performance Log Users   )

You may receive this error if you are trying to install the enterprise gateway on a domain controller. Deploying on a domain controller is not supported. You will need to deploy the enterprise gateway on a machine that is not a domain controller.