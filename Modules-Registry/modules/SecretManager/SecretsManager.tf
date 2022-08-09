###################################################
# Author: bfayty Date: 10/05/2022
# Version : 1.1
#
# Description:
# 1 secrets manager to store EC2 Key Pair
# Creation of public and private key
# Creation of a Key Pair
###################################################

#Create key 
resource "tls_private_key" "Keys" {
  algorithm = var.key-algo
}

# Store locally public and private keys
locals  {
    PrivateKey = tls_private_key.Keys.private_key_pem
    PublicKey  = tls_private_key.Keys.public_key_pem
}

#Store the private key in a local file
resource "local_sensitive_file" "private_key" {
    content  = local.PrivateKey
    filename = "private_key.pem"
}

#Create a secret 
resource "aws_secretsmanager_secret" "crdtls-key-manager" {
    name = var.secretsManagerName
}

#Provisionne a secret
resource "aws_secretsmanager_secret_version" "crdtlsKeyManagerVersion" {
    secret_id     = aws_secretsmanager_secret.crdtls-key-manager.id
    secret_string =  "${local.PublicKey}, ${local.PrivateKey}"
}

#Create EC2 Key
resource "aws_key_pair" "KeyPair" {
    key_name   = var.keyName
    public_key = tls_private_key.Keys.public_key_openssh
}

//Output the value to use them in the root file
# Ouput the public key
output "public-key"{
    value = tls_private_key.Keys.public_key_pem
}

output "key-name" {
    value = aws_key_pair.KeyPair.key_name
}

output "SecretName" {
    value = aws_secretsmanager_secret.crdtls-key-manager.name
}