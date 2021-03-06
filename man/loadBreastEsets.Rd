% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadBreastEsets.R
\name{loadBreastEsets}
\alias{loadBreastEsets}
\title{Function to load breast cancer expression sets from the Experiment Hub}
\usage{
loadBreastEsets(
  loadString = "majority",
  removeDuplicates = TRUE,
  quantileCutoff = 0,
  rescale = FALSE,
  minNumberGenes = 0,
  minNumberEvents = 0,
  minSampleSize = 0,
  removeRetracted = TRUE,
  removeSubsets = TRUE,
  keepCommonOnly = FALSE,
  imputeMissing = FALSE
)
}
\arguments{
\item{loadString}{a character vector specifying which data will be loaded.
The default is "majority", which loads in 37 of the 39 datasets.
The other option is to provide a character vecotr of the names of the
datasets to load. The metabric and tcga datasets areloaded separately as
they are very large and doing so will help prevent memory allocation errors
for R windows. Furthermore, these datasets are so large that they dominate
statistical analyses so it is best that they are analyzed separate of the
37 smaller datasets loaded with the string majority}

\item{removeDuplicates}{remove patients with a Spearman correlation greater
than or equal to 0.98 with other patient expression profiles (default TRUE)}

\item{quantileCutoff}{A nueric between 0 and 1 specifying to remove genes
with standard deviation below the required quantile (default 0)}

\item{rescale}{apply centering and scaling to the expression sets
(default FALSE)}

\item{minNumberGenes}{an integer specifying to remove expression sets with
less genes than this number (default 0)}

\item{minNumberEvents}{an integer specifying how man survival events must be
in the dataset to keep the dataset (default 0)}

\item{minSampleSize}{an integer specifying the minimum number of patients
required in an eset (default 0)}

\item{removeRetracted}{remove datasets from retracted papers (default TRUE,
currently just PMID17290060 dataset)}

\item{removeSubsets}{remove datasets that are a subset of other datasets
(defeault TRUE, currently just PMID19318476)}

\item{keepCommonOnly}{remove probes not common to all datasets
(default FALSE)}

\item{imputeMissing}{remove patients from datasets with missing expression
values}
}
\value{
a list with 2 elements. The First element named esets contains the
datasets. The second element named duplicates contains a vector with patient
IDs for the duplicate patients (those with Spearman correlation greater
than or equal to 0.98 with other patient expression profiles).
}
\description{
This function returns breast cancer datasets from the hub and a vector of
patients from the datasets that are most likely duplicates
}
\examples{

## Use the default loadString="majority" if you want the 37 smaller datasets
esetsAndDups <- loadBreastEsets(loadString = c("CAL", "DFHCC", "DFHCC2",
    "DFHCC3", "DUKE", "DUKE2", "EMC2"))

}
