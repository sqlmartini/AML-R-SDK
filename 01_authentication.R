library(azuremlsdk)

#Authenticate to AML workspace.  
#Set variables to your AAD tenant ID, Azure Subscription ID, and Resource Group and name of the AML workspace.
#How to find AAD tenant ID:  From Azure Portal go to Azure Active Directory > Properties > Directory ID
#How to find Azure Subscription ID:  From Azure Portal go to Subscriptions > Properties > Subscription ID
myTenantID = ''
myAzureSubscriptionID = ''
amlWorkspaceResourceGroup = 'azureml' #name of my demo aml workspace resource group.  change as needed.
amlWorkspaceName = 'azureml' #name of my demo aml workspace.  change as needed.

#Interactive Authentication
interactive_auth <- interactive_login_authentication(tenant_id = myTenantID)

ws <- get_workspace(name = amlWorkspaceName,
                    subscription_id = myAzureSubscriptionID,
                    resource_group = amlWorkspaceResourceGroup,
                    auth = interactive_auth)

#Create authentication config file to simplify future authentication.  A hidden folder (.azureml) will be created with a config.json file.
config_path = getwd()
write_workspace_config(ws, path = config_path)

#Then future authentication could use the config file for a simplified authentication process
ws <- load_workspace_from_config(path = config_path)