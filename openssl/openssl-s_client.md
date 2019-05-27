

showcerts
--

```console
$ openssl s_client -connect google.com:443 -showcerts < /dev/null 1> crt 2>&1
```

```console
$ cat crt                                                                                                                        Mon 27 May 2019 02:51:41 AM UTC
depth=2 OU = GlobalSign Root CA - R2, O = GlobalSign, CN = GlobalSign
verify return:1
depth=1 C = US, O = Google Trust Services, CN = Google Internet Authority G3
verify return:1
depth=0 C = US, ST = California, L = Mountain View, O = Google LLC, CN = *.google.com
verify return:1
CONNECTED(00000003)
---
Certificate chain
 0 s:/C=US/ST=California/L=Mountain View/O=Google LLC/CN=*.google.com
   i:/C=US/O=Google Trust Services/CN=Google Internet Authority G3
-----BEGIN CERTIFICATE-----
MIII2zCCB8OgAwIBAgIQIBqHKcwmTY0F3jTGW/pipDANBgkqhkiG9w0BAQsFADBU
MQswCQYDVQQGEwJVUzEeMBwGA1UEChMVR29vZ2xlIFRydXN0IFNlcnZpY2VzMSUw
IwYDVQQDExxHb29nbGUgSW50ZXJuZXQgQXV0aG9yaXR5IEczMB4XDTE5MDUwNzEx
MTY1MVoXDTE5MDczMDEwNTQwMFowZjELMAkGA1UEBhMCVVMxEzARBgNVBAgMCkNh
bGlmb3JuaWExFjAUBgNVBAcMDU1vdW50YWluIFZpZXcxEzARBgNVBAoMCkdvb2ds
ZSBMTEMxFTATBgNVBAMMDCouZ29vZ2xlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAIjamORkuwxUWTyP+CKTcGNxd6LLFELfAChoVpriCUPkvdTf
adUTlHSJv8HuMD/2fZ6sHFwMvNFTjxJomNU+qbKyV5H1hqwFPf/1nNuoWJClPFjW
KMczu0Ne8jMO3w15yU2zMU0wjzJjcNzXdJXg8IcIGnHtzF4XeY0PleToVimi9kDD
1Hk+UZFVRDM3t1B7aHESCl+BqQzi66EkmQc4DwGMCx42SkaNfRfQIfb7F38uxEzu
UOP5CbJGp6LGWqwV92wREkat7/NKFzzfKi5BL06OqVgMH13Rbp7biZ14PBUsroJs
GSnzVb0/MLyBfpyYGR6q1X3dnU9gt5kL/NwuFhcCAwEAAaOCBZUwggWRMBMGA1Ud
JQQMMAoGCCsGAQUFBwMBMIIEagYDVR0RBIIEYTCCBF2CDCouZ29vZ2xlLmNvbYIN
Ki5hbmRyb2lkLmNvbYIWKi5hcHBlbmdpbmUuZ29vZ2xlLmNvbYISKi5jbG91ZC5n
b29nbGUuY29tghgqLmNyb3dkc291cmNlLmdvb2dsZS5jb22CBiouZy5jb4IOKi5n
Y3AuZ3Z0Mi5jb22CESouZ2NwY2RuLmd2dDEuY29tggoqLmdncGh0LmNughYqLmdv
b2dsZS1hbmFseXRpY3MuY29tggsqLmdvb2dsZS5jYYILKi5nb29nbGUuY2yCDiou
Z29vZ2xlLmNvLmlugg4qLmdvb2dsZS5jby5qcIIOKi5nb29nbGUuY28udWuCDyou
Z29vZ2xlLmNvbS5hcoIPKi5nb29nbGUuY29tLmF1gg8qLmdvb2dsZS5jb20uYnKC
DyouZ29vZ2xlLmNvbS5jb4IPKi5nb29nbGUuY29tLm14gg8qLmdvb2dsZS5jb20u
dHKCDyouZ29vZ2xlLmNvbS52boILKi5nb29nbGUuZGWCCyouZ29vZ2xlLmVzggsq
Lmdvb2dsZS5mcoILKi5nb29nbGUuaHWCCyouZ29vZ2xlLml0ggsqLmdvb2dsZS5u
bIILKi5nb29nbGUucGyCCyouZ29vZ2xlLnB0ghIqLmdvb2dsZWFkYXBpcy5jb22C
DyouZ29vZ2xlYXBpcy5jboIRKi5nb29nbGVjbmFwcHMuY26CFCouZ29vZ2xlY29t
bWVyY2UuY29tghEqLmdvb2dsZXZpZGVvLmNvbYIMKi5nc3RhdGljLmNugg0qLmdz
dGF0aWMuY29tghIqLmdzdGF0aWNjbmFwcHMuY26CCiouZ3Z0MS5jb22CCiouZ3Z0
Mi5jb22CFCoubWV0cmljLmdzdGF0aWMuY29tggwqLnVyY2hpbi5jb22CECoudXJs
Lmdvb2dsZS5jb22CFioueW91dHViZS1ub2Nvb2tpZS5jb22CDSoueW91dHViZS5j
b22CFioueW91dHViZWVkdWNhdGlvbi5jb22CESoueW91dHViZWtpZHMuY29tggcq
Lnl0LmJlggsqLnl0aW1nLmNvbYIaYW5kcm9pZC5jbGllbnRzLmdvb2dsZS5jb22C
C2FuZHJvaWQuY29tghtkZXZlbG9wZXIuYW5kcm9pZC5nb29nbGUuY26CHGRldmVs
b3BlcnMuYW5kcm9pZC5nb29nbGUuY26CBGcuY2+CCGdncGh0LmNuggZnb28uZ2yC
FGdvb2dsZS1hbmFseXRpY3MuY29tggpnb29nbGUuY29tgg9nb29nbGVjbmFwcHMu
Y26CEmdvb2dsZWNvbW1lcmNlLmNvbYIYc291cmNlLmFuZHJvaWQuZ29vZ2xlLmNu
ggp1cmNoaW4uY29tggp3d3cuZ29vLmdsggh5b3V0dS5iZYILeW91dHViZS5jb22C
FHlvdXR1YmVlZHVjYXRpb24uY29tgg95b3V0dWJla2lkcy5jb22CBXl0LmJlMGgG
CCsGAQUFBwEBBFwwWjAtBggrBgEFBQcwAoYhaHR0cDovL3BraS5nb29nL2dzcjIv
R1RTR0lBRzMuY3J0MCkGCCsGAQUFBzABhh1odHRwOi8vb2NzcC5wa2kuZ29vZy9H
VFNHSUFHMzAdBgNVHQ4EFgQU7wUub6/M9Y6DUOc5vkH5ME3ukO0wDAYDVR0TAQH/
BAIwADAfBgNVHSMEGDAWgBR3wrhQmmd2drEtwobQg6B+pn66SzAhBgNVHSAEGjAY
MAwGCisGAQQB1nkCBQMwCAYGZ4EMAQICMDEGA1UdHwQqMCgwJqAkoCKGIGh0dHA6
Ly9jcmwucGtpLmdvb2cvR1RTR0lBRzMuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAD
mzweYwpYkUaF52QTlmypunodkNQBDAXCEWuvJyEZ/Dac23+rS25IPtSM4PlugONK
cM9S0bY2HeuBNr7oyd0buWZw4OyOttb8e1eun78SqZuU+aOx6zc8xxQGr0VeFz9Z
yYeEUBTt/GLBUmY12lUgbOAcCj9rdnI1oHCzDfU4xrUGERForFQewxN+N6+ozDuW
eX0wiJesxqdVmtLo/B6hDiVYW91485J0o+gz7SKYxJ5Vil865e3ESKaa4dQFVQAw
ADo8+9aBarN3PLasoExhlcKA1fhCwzoxrUx6vcZQnYT6IS7aAP0JnQOkAKMX7z82
xEFlph74tej6Ou8ytvun
-----END CERTIFICATE-----
 1 s:/C=US/O=Google Trust Services/CN=Google Internet Authority G3
   i:/OU=GlobalSign Root CA - R2/O=GlobalSign/CN=GlobalSign
-----BEGIN CERTIFICATE-----
MIIEXDCCA0SgAwIBAgINAeOpMBz8cgY4P5pTHTANBgkqhkiG9w0BAQsFADBMMSAw
HgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMjETMBEGA1UEChMKR2xvYmFs
U2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNzA2MTUwMDAwNDJaFw0yMTEy
MTUwMDAwNDJaMFQxCzAJBgNVBAYTAlVTMR4wHAYDVQQKExVHb29nbGUgVHJ1c3Qg
U2VydmljZXMxJTAjBgNVBAMTHEdvb2dsZSBJbnRlcm5ldCBBdXRob3JpdHkgRzMw
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDKUkvqHv/OJGuo2nIYaNVW
XQ5IWi01CXZaz6TIHLGp/lOJ+600/4hbn7vn6AAB3DVzdQOts7G5pH0rJnnOFUAK
71G4nzKMfHCGUksW/mona+Y2emJQ2N+aicwJKetPKRSIgAuPOB6Aahh8Hb2XO3h9
RUk2T0HNouB2VzxoMXlkyW7XUR5mw6JkLHnA52XDVoRTWkNty5oCINLvGmnRsJ1z
ouAqYGVQMc/7sy+/EYhALrVJEA8KbtyX+r8snwU5C1hUrwaW6MWOARa8qBpNQcWT
kaIeoYvy/sGIJEmjR0vFEwHdp1cSaWIr6/4g72n7OqXwfinu7ZYW97EfoOSQJeAz
AgMBAAGjggEzMIIBLzAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUH
AwEGCCsGAQUFBwMCMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHfCuFCa
Z3Z2sS3ChtCDoH6mfrpLMB8GA1UdIwQYMBaAFJviB1dnHB7AagbeWbSaLd/cGYYu
MDUGCCsGAQUFBwEBBCkwJzAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AucGtpLmdv
b2cvZ3NyMjAyBgNVHR8EKzApMCegJaAjhiFodHRwOi8vY3JsLnBraS5nb29nL2dz
cjIvZ3NyMi5jcmwwPwYDVR0gBDgwNjA0BgZngQwBAgIwKjAoBggrBgEFBQcCARYc
aHR0cHM6Ly9wa2kuZ29vZy9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEA
HLeJluRT7bvs26gyAZ8so81trUISd7O45skDUmAge1cnxhG1P2cNmSxbWsoiCt2e
ux9LSD+PAj2LIYRFHW31/6xoic1k4tbWXkDCjir37xTTNqRAMPUyFRWSdvt+nlPq
wnb8Oa2I/maSJukcxDjNSfpDh/Bd1lZNgdd/8cLdsE3+wypufJ9uXO1iQpnh9zbu
FIwsIONGl1p3A8CgxkqI/UAih3JaGOqcpcdaCIzkBaR9uYQ1X4k2Vg5APRLouzVy
7a8IVk6wuy6pm+T7HT4LY8ibS5FEZlfAFLSW8NwsVz9SBK2Vqn1N0PIMn5xA6NZV
c7o835DLAFshEWfC7TIe3g==
-----END CERTIFICATE-----
---
Server certificate
subject=/C=US/ST=California/L=Mountain View/O=Google LLC/CN=*.google.com
issuer=/C=US/O=Google Trust Services/CN=Google Internet Authority G3
---
No client certificate CA names sent
Peer signing digest: SHA256
Server Temp Key: ECDH, P-256, 256 bits
---
SSL handshake has read 4099 bytes and written 415 bytes
---
New, TLSv1/SSLv3, Cipher is ECDHE-RSA-AES128-GCM-SHA256
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.2
    Cipher    : ECDHE-RSA-AES128-GCM-SHA256
    Session-ID: 302C63C3C276AA86C6F275D83B923AC4DC12BCE393481900F38DDAED19DEBA0F
    Session-ID-ctx:
    Master-Key: 347CEE74F61B3A9CEC6CDE5C43362AC7966DA66C613F1F046D43148F17786DBBF1BE96A41026A673E38838808C5D02AB
    Key-Arg   : None
    Krb5 Principal: None
    PSK identity: None
    PSK identity hint: None
    TLS session ticket lifetime hint: 100800 (seconds)
    TLS session ticket:
    0000 - 00 8b 26 0a ea 4a 1a 22-09 d6 af 98 31 5e dd ee   ..&..J."....1^..
    0010 - dd 79 a0 dc 5b 7a 06 7d-54 36 74 fc 0d 8a f4 ee   .y..[z.}T6t.....
    0020 - 5e 73 4a 9e e6 9d 1a 07-a6 ab a5 bf 3a 38 29 79   ^sJ.........:8)y
    0030 - 6c 6c 7a b9 5d f4 f8 3f-09 93 7a c8 26 72 1c 16   llz.]..?..z.&r..
    0040 - 8b 82 67 6e 27 ef 3f a2-d4 0a 2d ee b0 33 15 9d   ..gn'.?...-..3..
    0050 - 5b a9 78 02 cd 1f 75 9e-bc 89 d1 c6 9b de 5f 97   [.x...u......._.
    0060 - 42 06 7e 1d 8e 8b c5 b7-36 fe 33 cd a3 34 06 c4   B.~.....6.3..4..
    0070 - e8 0b 0e ad 94 3b 80 49-52 da ac de 0b 65 86 42   .....;.IR....e.B
    0080 - d6 3d 05 b0 4f a9 60 68-2c ce 39 cc e4 5a 67 77   .=..O.`h,.9..Zgw
    0090 - b6 3c b0 18 98 b5 c5 38-a1 e5 17 37 74 ba c6 0b   .<.....8...7t...
    00a0 - 5f fa d2 05 10 3d ab ca-1f 66 30 f2 e6 24 11 04   _....=...f0..$..
    00b0 - 37 37 22 fd 69 a7 20 3e-7e be 21 91 b4 f5 ed 75   77".i. >~.!....u
    00c0 - 1d 55 36 34 3e 87 98 a4-1c 21 9d 57 30 c8 31 68   .U64>....!.W0.1h
    00d0 - 24 81 51 eb eb                                    $.Q..

    Start Time: 1558925501
    Timeout   : 300 (sec)
    Verify return code: 0 (ok)
---
DONE
```

### get cert(Not Intermediate Certificate)
```console
$ openssl s_client -connect google.com:443 -showcerts < /dev/null | grep -m 1 -B 100 'END CERTIFICATE' > crt
$ sed -ni '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' crt   
```

`-m 1` Stop reading a file after NUM matchjing lines.  
`-B 100` Print NUM lines of leading context before matching lines.  

TODO  
using sed command


