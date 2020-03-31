#Documentation:  https://azure.github.io/azureml-sdk-for-r/articles/installation.html

#Install pre-req
install.packages('remotes')

#Install from GitHub or CRAN

remotes::install_github('https://github.com/Azure/azureml-sdk-for-r')
#remotes::install_cran('azuremlsdk', repos = 'https://cloud.r-project.org/')

#Install the AML python SDK
azuremlsdk::install_azureml(envname = 'r-reticulate')

#Test install
library(azuremlsdk)
get_current_run()