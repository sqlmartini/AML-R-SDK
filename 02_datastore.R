library(azuremlsdk)

#Authenticate to AML workspace.  Pre-req to write config file done in 01_authentication.R
ws <- load_workspace_from_config()

#Service principal details used to authenticate to ADLS data store
#https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal
tenantID <- ''
clientID <- ''
clientSecret <- ''

#Or you can utilize the default Azure Key Vault service deployed with the AML workspace for storing secrets
#Assumes you've created secrets named tenantID, clientID, and clientSecret
#https://docs.microsoft.com/en-us/azure/key-vault/secrets/quick-create-portal

kv <- get_default_keyvault(ws)

#Names of the secrets we want to get from Key Vault
secrets <- c('tenantID', 'clientID', 'clientSecret')

#Get the secrets.  Return type is a list.
secret_values <- get_secrets(kv, secrets)

#Set variables using unlist()
tenantID <- unlist(secret_values[1], use.names = FALSE)
clientID <- unlist(secret_values[2], use.names = FALSE)
clientSecret <- unlist(secret_values[3], use.names = FALSE)

#Register ADLS datastore
register_azure_data_lake_gen2_datastore(workspace = ws, 
                                        datastore_name = 'oj_sales',
                                        filesystem = 'oj-sales',
                                        account_name = 'anthmaadlsgen2', 
                                        tenant_id = tenantID, 
                                        client_id = clientID, 
                                        client_secret = clientSecret)

#Get datastore object
ds <- get_datastore(ws, 'oj_sales')