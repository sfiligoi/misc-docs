#!/bin/bash

for z in a b f; do
    gcloud beta compute --project=exa-demo instance-groups managed create ig-us-central1-${z}-t4-v8 \
                        --base-instance-name=ig-us-central1-${z}-t4 --template=it-us-t4-v8-a2 --size=0 \
                        --zones=us-central1-${z} --instance-redistribution-type=NONE
done


for z in b c; do
    # there were no changes re eu from a1 to a2, and west4 is the only eu site
    gcloud beta compute --project=exa-demo instance-groups managed create ig-europe-west4-${z}-t4-v8 \
                        --base-instance-name=ig-europe-west4-${z}-t4 --template=it-europe-west4-t4-v8-a1 --size=0 \
                        --zones=europe-west4-${z} --instance-redistribution-type=NONE
done

#
#
#

for z in a b c f; do
    gcloud beta compute --project=exa-demo instance-groups managed create ig-us-central1-${z}-v100-v8 \
                        --base-instance-name=ig-us-central1-${z}-v100 --template=it-us-v100-v8-a2 --size=0 \
                        --zones=us-central1-${z} --instance-redistribution-type=NONE
done

for z in a b c; do
    # there were no changes re eu from a1 to a2, and west4 is the only eu site
    gcloud beta compute --project=exa-demo instance-groups managed create ig-europe-west4-${z}-v100-v8 \
                        --base-instance-name=ig-europe-west4-${z}-v100 --template=it-europe-west4-v100-v8-a1 --size=0 \
                        --zones=europe-west4-${z} --instance-redistribution-type=NONE
done

for z in a b; do
    gcloud beta compute --project=exa-demo instance-groups managed create ig-us-west1-${z}-v100-v8 \
                        --base-instance-name=ig-us-west1-${z}-v100 --template=it-us-v100-v8-a2 --size=0 \
                        --zones=us-west1-${z} --instance-redistribution-type=NONE
done


