# ocspcli

OSCP client to verify a site's certificate status via openssl.

## How it works

It download the site's TLS leaf certificate and issuer certificate, then send it to OCSP to verify.

## Usage

```sh
Usage: ocspcli.sh host [port]
Example:
  ocspcli.sh example.com
  ocspcli.sh example.com 443
```

## Example

```sh
$ ocspcli.sh www.example.com
OCSP Response Data:
    OCSP Response Status: successful (0x0)
    Response Type: Basic OCSP Response
    Version: 1 (0x0)
    Responder Id: B76BA2EAA8AA848C79EAB4DA0F98B2C59576B9F4
    Produced At: Mar 25 23:43:20 2023 GMT
    Responses:
    Certificate ID:
      Hash Algorithm: sha1
      Issuer Name Hash: E4E395A229D3D4C1C31FF0980C0B4EC0098AABD8
      Issuer Key Hash: B76BA2EAA8AA848C79EAB4DA0F98B2C59576B9F4
      Serial Number: 0C1FCB184518C7E3866741236D6B73F1
    Cert Status: good
    This Update: Mar 25 23:27:01 2023 GMT
    Next Update: Apr  1 22:42:01 2023 GMT

    Signature Algorithm: sha256WithRSAEncryption
         4a:9b:a8:16:0e:2c:90:8f:ba:75:d1:e2:24:7a:6c:bf:18:31:
         e1:7e:02:42:f1:1a:5c:8f:d8:1e:09:13:1b:6e:61:c1:dc:c3:
         dd:7a:52:4a:b1:19:99:00:18:b1:ff:54:ae:7a:fd:71:07:c1:
         55:96:e1:b7:ba:76:fc:ab:c2:56:43:6d:4c:f0:0c:7d:db:72:
         e7:5a:e3:e8:c5:b1:e2:90:f3:d5:9f:10:15:56:b2:dd:6f:8e:
         3c:c7:6a:8d:3d:c4:29:25:a9:98:02:d2:bf:0c:7a:0d:af:7b:
         07:fe:95:36:ec:93:6b:a4:52:8f:16:c0:bf:82:6b:c6:1e:8c:
         72:62:07:23:71:20:93:07:84:69:4a:ce:30:4f:0d:d5:09:36:
         90:52:33:4e:17:16:d5:fa:31:d6:9f:b3:07:7e:96:1d:de:53:
         9c:56:7f:c1:77:cd:28:39:4d:fd:79:46:78:ab:55:6a:98:94:
         12:eb:a0:b7:d7:25:6c:56:12:d8:28:53:a9:ef:ac:09:a4:60:
         a3:48:a1:05:a3:a0:6d:64:a7:3a:3e:66:d0:03:d5:ae:1d:7b:
         76:79:82:af:a1:2b:e0:f1:a5:e1:a9:90:60:4d:64:0a:9e:84:
         6f:f8:6e:87:22:80:f8:e3:57:5f:5c:2c:f0:dc:8e:35:37:1a:
         da:92:4b:7d
WARNING: no nonce in response
Response verify OK
certificate-www.example.com.pem: good
	This Update: Mar 25 23:27:01 2023 GMT
	Next Update: Apr  1 22:42:01 2023 GMT
```
