# Prep for GitHub Deploy Action

1. Setup user for github action
az ad sp create-for-rbac --name "sambrentall-azure-tf" --role Contributor --scopes /subscriptions/<subscription-id> --sdk-auth

NOTE: Save Outpup

1. Create resource group
    az group create -g terraform-state -l uksouth

1. Create storage account
    az storage account create -n sambtfstorageaccount -g terraform-state -l uksouth --sku Standard_LRS

1. Create container
    az storage container create -n terraformstate --account-name sambtfstorageaccount


For running terraformm locally, init with below settings
terraform init -backend-config="storage_account_name=sambtfstorageaccount" -backend-config="container_name=terraformstate" -backend-config="resource_group_name=terraform-state"