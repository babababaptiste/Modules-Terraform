# Secrets Manager

This file creates a public and a private keys, use them to create a key pair and store it in secrets manager

## resource tls_private_key

This resource creates a new key

We define the algorithm of the key (RSA)
```
resource "tls_private_key" "Keys" {
  algorithm = var.key-algo
}
```

## resource local_sensitive_file

To able the user to store the key localy we use a local sensitive file on pem format.

```
locals  {
    PrivateKey = tls_private_key.Keys.private_key_pem
    PublicKey  = tls_private_key.Keys.public_key_pem
}

#Store the private key in a local file
resource "local_sensitive_file" "private_key" {
    content  = local.PrivateKey
    filename = "private_key.pem"
}
```

## resource aws_secretsmanager_secret

This resource creates a new secret in secrets manager.

We define the name of the secret

```
resource "aws_secretsmanager_secret" "crdtls-key-manager" {
    name = var.secretsManagerName
}
```

## resource aws_secretsmanager_secret_version

This resource add the keys to our new secrets manager secret

We define the id of the secret and what we store inside

```
resource "aws_secretsmanager_secret_version" "crdtlsKeyManagerVersion" {
    secret_id     = aws_secretsmanager_secret.crdtls-key-manager.id
    secret_string =  "${local.PublicKey}, ${local.PrivateKey}"
}
```

## resource aws_key_pair

Finaly we can create our key pair using the private and public keys

We need to define a name for the key pair and the public key

```
resource "aws_key_pair" "KeyPair" {
    key_name   = var.keyName
    public_key = tls_private_key.Keys.public_key_openssh
}
``` 

## Outputs

To be able to use the values of our new resources we need to output the value to use them in the Main.tf file.

```
output "public-key"{
    value = tls_private_key.Keys.public_key_pem
}

output "key-name" {
    value = aws_key_pair.KeyPair.key_name
}

output "SecretName" {
    value = aws_secretsmanager_secret.crdtls-key-manager.name
}
``` 