# **Intro**

This repo is meant to show you how to get started with using the Azure Machine Learning (AML) R SDK (v0.6.85).

R scripts:
- **00_installation.R**:  script walks through the environment setup.  As of 3/31/2020 use the github R SDK remote in order to use all functions in subsequent scripts.
- **01_authentication.R**:  shows how to authenticate to an AML workspace.  Showcases how to use AAD tenant ID for those that have accounts guested into multiple AAD tenants.
- **02_datastore.R**:  shows how to register ADLSv2 storage and account and then retrieve datastore object by name.
- **03_dataset.R**:  shows how to register a tabular dataset and then load into a dataframe.

Full SDK Reference:
https://azure.github.io/azureml-sdk-for-r/reference/index.html