# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
