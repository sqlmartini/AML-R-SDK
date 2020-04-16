library(azuremlsdk)

#Authenticate to AML workspace
tenantId <- "<your AAD Tenant ID here>"
auth <- interactive_login_authentication(tenant_id = tenantId)

ws <- get_workspace(name = "azureml",
                    subscription_id = "<your subscription ID here>",
                    resource_group = "azureml",
                    auth = auth)

#Service principal details
clientId <- ""
clientSecret <- ""

#Register ADLS datastore
register_azure_data_lake_gen2_datastore(workspace = ws, 
                                        datastore_name = "oj_sales",
                                        filesystem = "oj-sales",
                                        account_name = "anthmaadlsgen2", 
                                        tenant_id = tenantId, 
                                        client_id = clientId, 
                                        client_secret = clientSecret)

#Get datastore object
ds <- get_datastore(ws, "oj_sales")
