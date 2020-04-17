library(azuremlsdk)

#Authenticate to AML workspace.  Pre-req to write config file done in 01_authentication.R
ws <- load_workspace_from_config()

#Get datastore object
ds <- get_datastore(ws, "oj_sales")

#Path to file(s) in datastore
ds_paths <- list(data_path(ds, "OJ_Sales.csv"))

#Create dataset object
dataset <- create_tabular_dataset_from_delimited_files(path = ds_paths, 
                                            validate = TRUE,
                                            include_path = FALSE, 
                                            infer_column_types = TRUE,
                                            separator = ",", 
                                            header = TRUE)

#Register dataset
register_dataset(workspace = ws,
                 dataset = dataset, 
                 name = "oj_sales", 
                 description = NULL,
                 tags = NULL, 
                 create_new_version = FALSE)

#Get registered dataset by name
dataset <- get_dataset_by_name(workspace = ws, name = "oj_sales")

#Load dataset into dataframe
df <- load_dataset_into_data_frame(dataset)
df