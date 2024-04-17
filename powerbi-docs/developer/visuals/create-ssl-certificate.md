---
title: Create SSL certificates for Power BI visuals
description: Learn how to generate SSL certificates by using Power BI Visual Tools in Windows, Mac, or Linux, or manually.
author: mberdugo
ms.author: monaberdugo
ms.reviewer: sranins
ms.service: powerbi
ms.subservice: powerbi-custom-visuals
ms.custom: linux-related-content
ms.topic: how-to
ms.date: 12/08/2023
---

# Create an SSL certificate

This article describes how to generate and install Secure Sockets Layer (SSL) certificates for Power BI visuals.

For the Windows, macOS X, and Linux procedures, you must have the Power BI Visual Tools `pbiviz` package installed. For more information, see [Set up your environment for developing a Power BI visual](./environment-setup.md).

## Create a certificate on Windows

To generate a certificate by using the PowerShell cmdlet `New-SelfSignedCertificate` on Windows 8 and later, run the following command:

```powershell
pbiviz --install-cert
```

For Windows 7, the `pbiviz` tool requires the OpenSSL utility to be available from the command line. To install OpenSSL, go to [OpenSSL](https://www.openssl.org) or [OpenSSL Binaries](https://wiki.openssl.org/index.php/Binaries).

## Create a certificate on macOS X

The OpenSSL utility is usually available in the macOS X operating system.

You can also install the OpenSSL utility by running either of the following commands:

- From the *Brew* package manager:
  
  ```cmd
  brew install openssl
  brew link openssl --force
  ```

- By using *MacPorts*:
  
  ```cmd
  sudo port install openssl
  ```

After you install the OpenSSL utility, run the following command to generate a new certificate:

```cmd
pbiviz --install-cert
```

## Create a certificate on Linux

The OpenSSL utility is usually available in the Linux operating system.

Before you begin, run the following commands to make sure `openssl` and `certutil` are installed:

```sh
which openssl
which certutil
```

If `openssl` and `certutil` aren't installed, install the `openssl` and `libnss3` utilities.

### Create the SSL configuration file

Create a file called */tmp/openssl.cnf* that contains the following text:

```
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[ alt_names ]
DNS.1=localhost
```

### Generate root certificate authority

To generate root certificate authority (CA) to sign local certificates, run the following commands:

```sh
touch $HOME/.rnd
openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout /tmp/local-root-ca.key -out /tmp/local-root-ca.pem -subj "/C=US/CN=Local Root CA/O=Local Root CA"
openssl x509 -outform pem -in /tmp/local-root-ca.pem -out /tmp/local-root-ca.crt
```

### Generate a certificate for localhost 

To generate a certificate for `localhost` using the generated CA and *openssl.cnf*, run the following commands:

```sh
PBIVIZ=`which pbiviz`
PBIVIZ=`dirname $PBIVIZ`
PBIVIZ="$PBIVIZ/../lib/node_modules/powerbi-visuals-tools/certs"
# Make sure that $PBIVIZ contains the correct certificate directory path. ls $PBIVIZ should list 'blank' file.
openssl req -new -nodes -newkey rsa:2048 -keyout $PBIVIZ/PowerBIVisualTest_private.key -out $PBIVIZ/PowerBIVisualTest.csr -subj "/C=US/O=PowerBI Visuals/CN=localhost"
openssl x509 -req -sha256 -days 1024 -in $PBIVIZ/PowerBIVisualTest.csr -CA /tmp/local-root-ca.pem -CAkey /tmp/local-root-ca.key -CAcreateserial -extfile /tmp/openssl.cnf -out $PBIVIZ/PowerBIVisualTest_public.crt
```

### Add root certificates

To add a root certificate to the Chrome browser's database, run:

```sh
certutil -A -n "Local Root CA" -t "CT,C,C" -i /tmp/local-root-ca.pem -d sql:$HOME/.pki/nssdb
```

To add a root certificate to the Mozilla Firefox browser's database, run:

```sh
for certDB in $(find $HOME/.mozilla* -name "cert*.db")
do
certDir=$(dirname ${certDB});
certutil -A -n "Local Root CA" -t "CT,C,C" -i /tmp/local-root-ca.pem -d sql:${certDir}
done
```

To add a system-wide root certificate, run:

```sh
sudo cp /tmp/local-root-ca.pem /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

### Remove root certificates

To remove a root certificate, run:

```sh
sudo rm /usr/local/share/ca-certificates/local-root-ca.pem
sudo update-ca-certificates --fresh
```

## Generate a certificate manually

You can also generate an SSL certificate manually using OpenSSL. You can specify any tools to generate your certificates.

If the OpenSSL utility is already installed, generate a new certificate by running:

```cmd
openssl req -x509 -newkey rsa:4096 -keyout PowerBIVisualTest_private.key -out PowerBIVisualTest_public.crt -days 365
```

You can usually find the `PowerBI-visuals-tools` web server certificates by running one of the following commands:

- For the global instance of the tools:
  
  ```cmd
  %appdata%\npm\node_modules\PowerBI-visuals-tools\certs
  ```

- For the local instance of the tools:
  
  ```cmd
  <Power BI visual project root>\node_modules\PowerBI-visuals-tools\certs
  ```

### PEM format

If you use the Privacy Enhanced Mail (PEM) certificate format, save the certificate file as *PowerBIVisualTest_public.crt*, and save the private key as *PowerBIVisualTest_private.key*.

### PFX format

If you use the Personal Information Exchange (PFX) certificate format, save the certificate file as *PowerBIVisualTest_public.pfx*.

If your PFX certificate file requires a passphrase:

1. In the config file, specify:
   
   ```cmd
   \PowerBI-visuals-tools\config.json
   ```
   
1. In the `server` section, specify the passphrase by replacing the \<YOUR PASSPHRASE> placeholder:

    ```cmd
    "server":{
        "root":"webRoot",
        "assetsRoute":"/assets",
        "privateKey":"certs/PowerBIVisualTest_private.key",
        "certificate":"certs/PowerBIVisualTest_public.crt",
        "pfx":"certs/PowerBIVisualTest_public.pfx",
        "port":"8080",
        "passphrase":"<YOUR PASSPHRASE>"
    }
    ```

## Related content
- [Develop a Power circle card BI visual](develop-circle-card.md)
- [Power BI visuals samples](samples.md)
- [Publish a Power BI visual to AppSource](office-store.md)
