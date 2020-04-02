#!/bin/bash
for n in exa-v8-eastus-p40 exa-v8-eastus-v100 exa-v8-southeastasia-p40 exa-v8-southeastasia-v100 exa-v8-southcentralus-v100; do 
  total=`az vmss show  --resource-group exa --name $n --output=yaml |awk '/capacity/{print $2}'`
  if [ $? -eq 0 ]; then
    data=`az vmss list-instances  --resource-group exa --name $n --output=yaml |grep provisioningState`
    if [ $? -eq 0 ]; then
      cnt=`echo "$data" | awk '/Succeeded/{n=n+1}END{print n}'`
    else
      cnt=0
    fi
  else
    total=0
  fi
  echo "$n ${cnt}/${total}"
done
