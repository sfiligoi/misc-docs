#!/bin/bash
#
# Arguments:
#   fname timer
#

grep -e "Timer: $2 " -e bowtie2 -e "= CPU " "$1" |awk '/Timer/{t=t+$3; n=n+1}/bowtie/{print n " " t; print $1 " " $2 " "$3 " " $4; ;n=0;t=0}/CPU/{print n " " t; print $0;n=0;t=0}END{print n " " t}'
