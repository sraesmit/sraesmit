#!/bin/bash

#Starts the SDI's for OTMAPP Server auto"magically"#
#SDI's are java applets designed to talk to the MTS from high to low, and vice versa.#
#Each SDI will be binded to it's own IP address and ports. Ports are 5007/8, 5010, and 8081.#

$ETHDEV
$SDIDIR
$SDIAPPLETNAME

#Check ETH device status

ifconfig -a | grep $ETHDEV

#Check port openings for 5007/7 and 5010

#check for TCP ports
netstat -anp $ETHDEV TCP | grep 5007
echo 5007 is open
netstat -anp $ETHDEV TCP | grep 5008
echo 5008 is open
#check for Log Server
nestat -anp $ETHDEV | grep 555
echo 5555 is open
#check for udp
netstat -anp UDP | grep 5010

#Initialize each SDI binded to their IP

java -jar $SDIAPPLETNAME sd$SDIAPPLETNAME > err.log 2>&1 & 

#Check SDI status
ps -ef | grep sd*
