
```
openssl x509 -text -noout -in ca.pem
```


```
openssl x509 -text -noout -in server.pem
```


```
openssl speed rsa2048
Doing 2048 bit private rsa's for 10s: 14561 2048 bit private RSA's in 10.00s
Doing 2048 bit public rsa's for 10s: 341569 2048 bit public RSA's in 9.99s
OpenSSL 1.0.2k-fips  26 Jan 2017
built on: reproducible build, date unspecified
options:bn(64,64) md2(int) rc4(16x,int) des(idx,cisc,16,int) aes(partial) idea(int) blowfish(idx)
compiler: gcc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DKRB5_MIT -m64 -DL_ENDIAN -Wall -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -Wa,--noexecstack -DPURIFY -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
                  sign    verify    sign/s verify/s
rsa 2048 bits 0.000687s 0.000029s   1456.1  34191.1
```
```
openssl speed rsa2048 ecdsap256
Doing 2048 bit private rsa's for 10s: 14564 2048 bit private RSA's in 10.00s
Doing 2048 bit public rsa's for 10s: 342501 2048 bit public RSA's in 10.00s
Doing 256 bit sign ecdsa's for 10s: 236772 256 bit ECDSA signs in 10.00s
Doing 256 bit verify ecdsa's for 10s: 95070 256 bit ECDSA verify in 9.99s
OpenSSL 1.0.2k-fips  26 Jan 2017
built on: reproducible build, date unspecified
options:bn(64,64) md2(int) rc4(16x,int) des(idx,cisc,16,int) aes(partial) idea(int) blowfish(idx)
compiler: gcc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DKRB5_MIT -m64 -DL_ENDIAN -Wall -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -Wa,--noexecstack -DPURIFY -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
                  sign    verify    sign/s verify/s
rsa 2048 bits 0.000687s 0.000029s   1456.4  34250.1
                              sign    verify    sign/s verify/s
 256 bit ecdsa (nistp256)   0.0000s   0.0001s  23677.2   9516.5
```
```
openssl speed ecdhp256
Doing 256 bit  ecdh's for 10s: 133131 256-bit ECDH ops in 10.00s
OpenSSL 1.0.2k-fips  26 Jan 2017
built on: reproducible build, date unspecified
options:bn(64,64) md2(int) rc4(16x,int) des(idx,cisc,16,int) aes(partial) idea(int) blowfish(idx)
compiler: gcc -I. -I.. -I../include  -fPIC -DOPENSSL_PIC -DZLIB -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLFCN -DHAVE_DLFCN_H -DKRB5_MIT -m64 -DL_ENDIAN -Wall -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic -Wa,--noexecstack -DPURIFY -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DRC4_ASM -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DVPAES_ASM -DBSAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
                              op      op/s
 256 bit ecdh (nistp256)   0.0001s  13313.1
```
