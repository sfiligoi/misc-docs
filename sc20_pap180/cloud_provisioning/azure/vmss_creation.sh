#!/bin/bash

export AZ_SSH="$MYSSH"

export AZ_SUB=/subscriptions/$MYAZUREID/resourceGroups/$MYGRP/providers/Microsoft

export AZ_STD_ARGS="--admin-username centos --authentication-type ssh --ssh-key-values \"${AZ_SSH}\"
                   --priority spot --public-ip-per-vm --upgrade-policy-mode manual --lb \"\"
                   --disable-overprovision --eviction-policy delete 
                   --assign-identity ${AZ_SUB}.ManagedIdentity/userAssignedIdentities/blob-writer
                   --image ${AZ_SUB}.Compute/galleries/galery_uswest2/images/wn-wgpu-v8"


eval az vmss create --resource-group exa --name exa-v8-eastus-p40 \
               --location eastus \
               --vm-sku "Standard_ND6s" \
               --nsg ${AZ_SUB}.Network/networkSecurityGroups/us-east1-all-in \
               --subnet ${AZ_SUB}.Network/virtualNetworks/net-us-east1-64k/subnets/subnet-us-east1-64k \
               --single-placement-group false \
               ${AZ_STD_ARGS} --instance-count 0 # no zones

eval az vmss create --resource-group exa --name exa-v8-eastus-v100 \
               --location eastus \
               --vm-sku "Standard_NC6s_v3" \
               --nsg ${AZ_SUB}.Network/networkSecurityGroups/us-east1-all-in \
               --subnet ${AZ_SUB}.Network/virtualNetworks/net-us-east1-64k/subnets/subnet-us-east1-64k \
               --single-placement-group false \
               ${AZ_STD_ARGS} --instance-count 0 # no zones

eval az vmss create --resource-group exa --name exa-v8-southeastasia-p40 \
               --location southeastasia \
               --vm-sku "Standard_ND6s" \
               --nsg ${AZ_SUB}.Network/networkSecurityGroups/ap-se-all \
               --subnet ${AZ_SUB}.Network/virtualNetworks/net-ap-se-64k/subnets/subnet-ap-se-64k \
               --single-placement-group false \
               ${AZ_STD_ARGS} --instance-count 0 # no zones

eval az vmss create --resource-group exa --name exa-v8-southeastasia-v100 \
               --location southeastasia \
               --vm-sku "Standard_NC6s_v3" \
               --nsg ${AZ_SUB}.Network/networkSecurityGroups/ap-se-all \
               --subnet ${AZ_SUB}.Network/virtualNetworks/net-ap-se-64k/subnets/subnet-ap-se-64k \
               --single-placement-group false \
               ${AZ_STD_ARGS} --instance-count 0 # no zones

eval az vmss create --resource-group exa --name exa-v8-southcentralus-v100 \
               --location southcentralus \
               --vm-sku "Standard_NC6s_v3" \
               --nsg ${AZ_SUB}.Network/networkSecurityGroups/nc-sc-all \
               --subnet ${AZ_SUB}.Network/virtualNetworks/net-us-sc-64k/subnets/subnet-us-sc-64k \
               ${AZ_STD_ARGS} --instance-count 0 # no zones


