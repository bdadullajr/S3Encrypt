#!/usr/bin/env bash 

source ~/exec.sh 

aws s3api get-bucket-encryption --bucket "$var1"
aws s3api get-bucket-encryption --bucket "$var2"
aws s3api get-bucket-encryption --bucket "$var3"
aws s3api get-bucket-encryption --bucket "$var4"
aws s3api get-bucket-encryption --bucket "$var5"
aws s3api get-bucket-encryption --bucket "$var6"
