library(azuremlsdk)

#Authenticate to AML workspace
interactive_auth <- interactive_login_authentication(tenant_id = '')

ws <- get_workspace("azureml",
                    "<subscription ID here>",
                    "azureml",
                    auth = interactive_auth)
