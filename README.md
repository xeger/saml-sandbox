This is a trivial Rails app designed to act as a testbed for implementing, understanding and debugging SAML protocol using the Ruby programming language. The app uses open source RubyGems to implement a SAML IdP and SP and provides minimalistic UI for performing Web SSO between the IdP and SP.

# Prerequisites

* Ruby version 2.3

#### Configuration

No database required. You do need to create some self-signed certificates in tmp; see Operator's Guide.

# Developer's Guide

The Rails app layout is hopefully simple enough to be self-explanatory.

IdP gem API: https://github.com/saml-idp/saml_idp  

SP gem API: https://github.com/onelogin/ruby-saml

# Operator's Guide

## Certificate Manegement

### Self-Signed

```
$ genrsa -out saml.key 2048

  Generating RSA private key, 2048 bit long modulus
  .................+++
  ...............................................+++
  e is 65537 (0x10001)

$ openssl req -new -key saml.key -out saml.csr

  You are about to be asked to enter information that will be incorporated
  into your certificate request.
  ( ... enter Distinguished Name stuff; leave challenge password blank )

$ openssl x509 -req -days 3650 -in saml.csr -signkey saml.key -out saml.crt

  Signature ok
  subject=/C=US/ST=California/L=Santa Barbara/CN=localhost/emailAddress=localhost@localhost.com
  Getting Private key
```
