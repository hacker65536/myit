
#ldapadd
- -Y mech


>Specify the SASL mechanism to be used for authentication. If it's not specified, the program will  choose  the  best mechanism  the server knows.

- -H ldapuri

>Specify URI(s) referring to the ldap server(s); only the protocol/host/port fields are allowed; a list of URI, separated  by  white‐space or commas is expected.

#ldapsearch


- -L

>Search results are display in LDAP Data Interchange Format detailed in ldif(5).  A single -L restricts the output to LDIFv1.
A second -L disables comments.  A third -L disables printing of the LDIF version.  The default is to use  an  extended  version  of LDIF.

- -D binddn

>Use the Distinguished Name binddn to bind to the LDAP directory.  For SASL binds, the server is expected to ignore this value.

- -b searchbase

>Use searchbase as the starting point for the search instead of the default.

- -w passwd

>Use passwd as the password for simple authentication.

- -W

>Prompt for simple authentication.  This is used instead of specifying the password on the command line.
