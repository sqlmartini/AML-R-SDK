#Authenticate to AML workspace
tenantId <- "72f988bf-86f1-41af-91ab-2d7cd011db47"
auth <- interactive_login_authentication(tenant_id = tenantId)

ws <- get_workspace("azureml",
                    "4b395f5d-d1ab-4bae-808d-a4398c9c61c5",
                    "azureml",
                    auth = auth)

#Service principal details
clientId <- "a421c122-f44c-4595-b511-b6c35d217716"
clientSecret <- "DX]LLDtD1lGyYzG[/8YtDJx]RbbjdV34"

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