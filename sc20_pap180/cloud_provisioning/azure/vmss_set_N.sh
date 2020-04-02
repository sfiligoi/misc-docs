#!/bin/bash
for n in exa-v8-eastus-p40 exa-v8-eastus-v100 exa-v8-southeastasia-p40 exa-v8-southeastasia-v100 exa-v8-southcentralus-v100; do 

  echo "az vmss scale  --resource-group exa --no-wait --name $n --new-capacity=$1"
  az vmss scale  --resource-group exa --no-wait --name $n --new-capacity="$1"
done
