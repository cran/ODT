## ----LoadFunctions, echo=FALSE, message=FALSE, warning=FALSE, results='hide'----
library(knitr)
library(rmarkdown)
opts_chunk$set(error = FALSE)

## ----eval=FALSE---------------------------------------------------------------
#  
#  install.packages("ODT")
#  

## ----eval=FALSE---------------------------------------------------------------
#  
#  ODT_MUT <- trainTree(PatientResponse = mut_small, PatientSensitivity = drug_small, minbucket = 1)
#  

## ----eval=FALSE---------------------------------------------------------------
#  
#  niceTree(tree = ODT_MUT, folder = NULL)
#  

## ----eval=TRUE, message=FALSE-------------------------------------------------
# Load the necessary library and datasets
library(ODT)
data("mutations_w34")
data("drug_response_w34")

# Select a subset of the mutation and drug response data
mut_small <- mutations_w34[1:100, 1:50] # Select first 100 patients and 50 genes
drug_small <- drug_response_w34[1:100, 1:15] # Select first 100 patients and 15 drugs

# Train the decision tree using the selected patient data
ODT_MUT <- trainTree(PatientData = mut_small, PatientSensitivity = drug_small, minbucket = 2)

# Visualize the trained decision tree
niceTree(ODT_MUT)

# Predict the optimal treatment for each patient
ODT_MUTpred <- predictTree(tree = ODT_MUT, PatientSensitivityTrain = drug_small, PatientData = mut_small)

# Retrieve and display the names of the selected treatments
names_drug <- colnames(drug_small)
selected_treatments <- names_drug[ODT_MUTpred]
selected_treatments[1:3] # Treatment selected for first 3 patients

## ----eval=FALSE---------------------------------------------------------------
#  
#   ODT_EXP <- trainTree(PatientData = gene_small, PatientSensitivity = drug_small, minbucket = 1)
#  

## ----eval=FALSE---------------------------------------------------------------
#  
#  niceTree(tree = ODT_EXP, folder = NULL)
#  

## ----eval=TRUE----------------------------------------------------------------
# Load the necessary library and datasets
library(ODT)

# Load the gene expression and drug response data
data("expression_w34")
data("drug_response_w34")

# Select a subset of the gene expression and drug response data
gene_small <- expression_w34[1:3, 1:3]
drug_small <- drug_response_w34[1:3, 1:3]

# Train the decision tree using the selected patient data
ODT_EXP <- trainTree(PatientData = gene_small, PatientSensitivity = drug_small, minbucket = 1)

# Visualize the trained decision tree
niceTree(ODT_EXP)

# Predict the optimal treatment for each patient
ODT_EXPpred <- predictTree(tree = ODT_EXP, PatientSensitivityTrain = drug_small, PatientData = gene_small)

# Retrieve and display the names of the selected treatments
selected_treatments <- colnames(drug_small)[ODT_EXPpred]
selected_treatments

## ----eval=TRUE----------------------------------------------------------------
# Load the necessary library and datasets
library(ODT)
data("mutations_w34")
data("mutations_w12")
data("drug_response_w12")
data("drug_response_w34")

# Define a binary matrix for new patients (using the first patient as an example)
mut_newpatients<-mutations_w34[1, ,drop=FALSE]

# Train the decision tree model using known patient data
ODT_MUT<-trainTree(PatientData = mutations_w12, PatientSensitivity=drug_response_w12, minbucket =10)

# Visualize the trained decision tree
niceTree(ODT_MUT,folder=NULL)

# Predict the optimal treatment for the new patient
ODT_MUTpred<-predictTree(tree=ODT_MUT, PatientSensitivityTrain=drug_response_w12, PatientData=mut_newpatients)

# Retrieve and display the name of the selected treatment
selected_treatment <- colnames(drug_response_w12)[ODT_MUTpred]
selected_treatment

## ----eval=TRUE----------------------------------------------------------------
# Load the necessary library and datasets
library(ODT)

# Load gene expression and drug response data
data("expression_w34")
data("expression_w12")
data("drug_response_w12")
data("drug_response_w34")

# Define a matrix for new patients (using the first patient as an example)
exp_newpatients <- expression_w34[1, , drop = FALSE]
# Train the decision tree model using known patient data
ODT_EXP <- trainTree(PatientData = expression_w12, PatientSensitivity = drug_response_w12, minbucket = 10)

# Visualize the trained decision tree
niceTree(ODT_EXP, folder = NULL)

# Predict the optimal treatment for the new patient
ODT_EXPpred <- predictTree(tree = ODT_EXP, PatientSensitivityTrain = drug_response_w12, PatientData = exp_newpatients)

# Retrieve and display the name of the selected treatment
selected_treatment <- colnames(drug_response_w12)[ODT_EXPpred]
selected_treatment

## -----------------------------------------------------------------------------
sessionInfo()

