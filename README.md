# AWS S3 default encryted and not 

- Assuming that access key, secret key, and region are all configured for either approach.
 
```
- AWS CLI needs to be configure E.g. aws configure (Where you need to provide you Access and Secret Key 
- Please run in "~" E.g. /home/user/ location

```
# Available Scripts 
```
        1.) lists3bucket.sh - Create an ouput folder were all output files will stored.
        2.) s3encrypt.sh - Generate a result for all listed S3 buckets and shows which is encryted and which are not. 
```

# Captured evidence


* [Terminal](https://daduber-storage.s3-ap-southeast-1.amazonaws.com/GIFs/s3buckets.gif)

## lists3bucket.sh content
```
#!/bin/sh

out=s3list.log
out1=s3list1.log
out2=s3list2.log
out3=s3final.log
out4=insert.log

#========CREATE DIR FOR OUTPUT========#
#                                     #
mkdir output                          #
#                                     #
#=====================================#

#========LIST ALL S3 BUCKETS=========================================#
#                                                                    #
aws s3api list-buckets --query 'Buckets[*].Name' > ~/output/$out     #
#                                                                    #
#====================================================================#

#========REMOVE FIRST & LAST LINE============#
#                                            #
sed -i '1d' ~/output/$out                    #
sed -e '$ d' ~/output/$out > ~/output/$out1  #
#                                            #
#============================================#

#========REMOVE UNWANTED CHARACTERS=============#
#                                               #
sed 's/,//g' ~/output/$out1 > ~/output/$out2    #
sed -i "s/ //g" ~/output/$out2                  #
#                                               #
#===============================================#

#========INSERT EQUAL CHARACTER IN EVERY LINE========#
#                                                    #
sed "s/.*/=&/" ~/output/$out2 > ~/output/$out3       #
sed -i "s/ //g" ~/output/$out3                       #
#                                                    #
#====================================================#

#========INSERT NUMBERS EACH LINE======================================#
#                                                                      #
awk '{printf "%d\t%s\n", NR, $0}' ~/output/$out3 > ~/output/final.sh   #
sed -i $'s/\t/   /g' ~/output/final.sh                                 #
sed -i "s/ //g" ~/output/final.sh                                      #
sed "s/.*/export var&/" ~/output/final.sh > exec.sh                    #
#                                                                      #
#======================================================================#

#========CREATE A SHELL SCRIPT FILE========#
#                                          #
sed -i '1i #!/bin/sh' ~/exec.sh            #
chmod 755 ~/exec.sh                        #
#                                          #
#==========================================#

```     

## s3encrypt.sh
```
#!/usr/bin/env bash 

source ~/exec.sh 

aws s3api get-bucket-encryption --bucket "$var1"
aws s3api get-bucket-encryption --bucket "$var2"
aws s3api get-bucket-encryption --bucket "$var3"
aws s3api get-bucket-encryption --bucket "$var4"
aws s3api get-bucket-encryption --bucket "$var5"
aws s3api get-bucket-encryption --bucket "$var6"
```

