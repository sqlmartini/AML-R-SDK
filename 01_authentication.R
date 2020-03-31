library(azuremlsdk)

#Authenticate to AML workspace
interactive_auth <- interactive_login_authentication(tenant_id = '72f988bf-86f1-41af-91ab-2d7cd011db47')

ws <- get_workspace("azureml",
                    "4b395f5d-d1ab-4bae-808d-a4398c9c61c5",
                    "azureml",
                    auth = interactive_auth)