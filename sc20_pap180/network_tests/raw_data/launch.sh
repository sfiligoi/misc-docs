#/bin/bash
# make sure condor does not re-schedule on first submit; force reschedule
condor_reschedule
for r in AWS-us-east-1 AWS-us-west-2 AZURE-eastus AZURE-westus2 GCP-us-east1 GCP-us-west1; do condor_submit -terse "cloud_region=${r}" "nmax=4" submit_icecube_long.multi.condor; done; 
for r in AWS-us-east-2 AZURE-southcentralus GCP-us-central1 AZURE-australiaeast AZURE-CanadaCentral AZURE-japaneast AZURE-uksouth AZURE-westeurope GCP-asia-east1 GCP-asia-northeast1 GCP-asia-southeast1 GCP-europe-west4 AWS-ap-northeast-1 AWS-ap-southeast-1 AWS-eu-central-1 AWS-eu-west-1; do condor_submit -terse "cloud_region=${r}" "nmax=1" submit_icecube_long.multi.condor; done

