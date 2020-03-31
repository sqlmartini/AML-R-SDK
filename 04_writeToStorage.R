library(azuremlsdk)

#Authenticate to AML workspace
tenantId <- "72f988bf-86f1-41af-91ab-2d7cd011db47"
auth <- interactive_login_authentication(tenant_id = tenantId)

ws <- get_workspace(name = "azureml",
                    subscription_id = "4b395f5d-d1ab-4bae-808d-a4398c9c61c5",
                    resource_group = "azureml",
                    auth = auth)

#Get registered dataset by name
dataset <- get_dataset_by_name(workspace = ws, name = "oj_sales")

#Load dataset into dataframe
df <- load_dataset_into_data_frame(dataset)

#Check current working directory.  If using Compute Instance uses default Azure File Share.
wd <- getwd() # "/mnt/batch/tasks/shared/LS_root/mounts/clusters/ComputeInstanceNameHere/code"

#Create subdirectory to store data file
targetDir <- paste(wd, '/Users/R-SDK/Data', sep='')
dir.create(targetDir)

#Create path/name to write file to
file <- paste(targetDir, '/test.csv', sep='')

#Write file to path
write.csv(x = df, file = file)

#Optional upload to different registered datastore
ds <- get_datastore(ws, "workspaceblobstore")
upload_to_datastore(ds, targetDir)