Instructions for user 

Trusting third party connectors in Power BI is done by listing the thumbprint of the certificate you want to trust in a specified registry value. If this thumbprint matches the thumbprint of the certificate that the connector you want to load was signed with, you will be able to load it in the ‘Recommended’ security level of Power BI. 

The registry path is HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Power BI Desktop. Make sure the path exists, or create it. We chose this location due to it being generally controlled by IT policy, as well as requiring local machine administration access to edit. 

 

 

 

Add a new value under the path specified above. The type should be “Multi-String Value” (REG_MULTI_SZ), and it should be called “TrustedCertificateThumbprints” 

 

 

 

Add the thumbprints of the certificates you want to trust. You can add multiple certificates by using “\0” as a delimiter, or in the registry editor, right click -> modify and put each thumbprint on a new line. Example thumbprint is taken from a self-signed certificate. 

 

 

 

If you’ve followed the instructions properly, and have been given the proper thumbprint by your developer, you should now be able to securely trust connectors signed with the associated certificate. 
