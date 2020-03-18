#!/bin/sh

#loc=/root/s3/output
out=s3list.log
out1=s3list1.log
out2=s3list2.log
out3=s3final.log
out4=insert.log

#========CREATE DIR FOR OUTPUT========#
#				      #
mkdir output	                      #
#				      #	
#=====================================#

#========LIST ALL S3 BUCKETS=========================================#
#				                                     #
aws s3api list-buckets --query 'Buckets[*].Name' > ~/output/$out     #
#								     #
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
#    	                                        #
#===============================================#

#========INSERT EQUAL CHARACTER IN EVERY LINE========#
#                                                    #
sed "s/.*/=&/" ~/output/$out2 > ~/output/$out3       #
sed -i "s/ //g" ~/output/$out3                       #
#						     #
#====================================================#

#========INSERT NUMBERS EACH LINE======================================#
#                                                                      #
awk '{printf "%d\t%s\n", NR, $0}' ~/output/$out3 > ~/output/final.sh   #
sed -i $'s/\t/   /g' ~/output/final.sh                                 #
sed -i "s/ //g" ~/output/final.sh			               #
sed "s/.*/export var&/" ~/output/final.sh > exec.sh	               #
#							               #
#======================================================================#

#========CREATE A SHELL SCRIPT FILE========#
#					   #
sed -i '1i #!/bin/sh' ~/exec.sh            #
chmod 755 ~/exec.sh			   #
#					   #
#==========================================#
