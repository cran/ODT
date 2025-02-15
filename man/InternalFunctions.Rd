% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AuxFunctions.R
\name{InternalFunctions}
\alias{InternalFunctions}
\alias{getTreatment}
\alias{getSplit}
\alias{getsumic50v3}
\alias{findsplitExp}
\alias{growtreeExp}
\alias{findsplitMut}
\alias{growtreeMut}
\title{ODT Internal Functions}
\usage{
getTreatment(PatientSensitivity, weights)

getSplit(gene, PatientData, PatientSensitivity)

getsumic50v3(genePatientResponse, PatientSensitivity)

findsplitExp(
  PatientSensitivity,
  PatientData,
  minimum = 1,
  weights = NULL,
  verbose = FALSE
)

growtreeExp(
  id = 1L,
  PatientSensitivity,
  PatientData,
  minbucket = 10,
  weights = NULL
)

findsplitMut(PatientSensitivity, X, minimum = 1, weights)

growtreeMut(
  id = 1L,
  PatientSensitivity,
  PatientData,
  minbucket = 10,
  weights = NULL,
  findsplit = findsplitMut
)
}
\arguments{
\item{PatientSensitivity}{A matrix representing drug response values (e.g., IC50), where rows correspond to patients/samples and columns correspond to drugs.}

\item{weights}{A numeric vector indicating which samples are under study; defaults to NULL, meaning all samples are considered.}

\item{gene}{The index of the gene used for splitting the data.}

\item{PatientData}{A matrix representing patient features, where rows correspond to patients/samples and columns correspond to genes/features.}

\item{genePatientResponse}{A numeric vector representing the response of patients to a particular gene.}

\item{minimum}{An integer specifying the minimum number of samples required for a valid split (default is 1).}

\item{verbose}{A logical value indicating whether to print additional information during execution (default is FALSE).}

\item{id}{A unique identifier for the node in the decision tree (default is 1L).}

\item{minbucket}{An integer specifying the minimum number of samples required in a child node for further splitting (default is 10).}

\item{X}{(PatientData) A matrix representing patient features, where rows correspond to patients/samples and columns correspond to genes/features.}

\item{findsplit}{A function used to find the best split; defaults to `findsplitMut`.}
}
\value{
A list of internal outputs generated by these functions.

An integer indicating the index of the optimal treatment based on the minimum sum of sensitivity values.

A list containing:
  - `sumic50`: The minimum summed IC50 values for the two groups.
  - `Treatment1`: The treatment associated with the first group.
  - `Treatment2`: The treatment associated with the second group.
  - `split`: The index of the optimal split point.
  - `expressionSplit`: The expression value at the split point adjusted by a small epsilon.

A numeric value representing the minimum summed IC50 value derived from the patient responses.

A `partysplit` object representing the optimal split based on the specified patient sensitivity and expression data.

A `partynode` object representing the current node and its children in the decision tree.

A `partysplit` object if a valid split is found, or `NULL` if no valid split can be determined.

A `partynode` object representing the current node and its children in the decision tree.
}
\description{
Internal functions used by `trainTree` in the various
steps of the algorithm. These functions are not intended for
direct use by end users and are primarily for internal logic
and calculations within the package.

This internal function calculates the optimal treatment based on patient sensitivity data.

This internal function calculates the optimal split point based on a specified gene in the expression data.

This internal function calculates the summed IC50 value based on the response of patients to a specific gene.

This internal function identifies the optimal split point in expression data based on patient sensitivity (IC50).

This internal function recursively builds a decision tree based on expression data and patient sensitivity (IC50).

This internal function identifies the optimal split point in a mutation matrix based on
patient sensitivity data (IC50) and the presence of specific mutations.

This internal function recursively builds a decision tree based on patient data and
drug sensitivity responses, specifically designed for mutation data.
}
\keyword{internal}
