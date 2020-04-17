library(azuremlsdk)

#Authenticate to AML workspace.  Pre-req to write config file done in 01_authentication.R
ws <- load_workspace_from_config()

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