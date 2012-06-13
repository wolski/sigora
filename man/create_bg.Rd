\name{create_bg}
\alias{create_bg}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create a background set from a comma separated Ensembl BioMart mapping file
}
\description{
This function determines which external IDs (e.g. microarray probe IDs) can be uniquely mapped to ENSEMBL IDs and returns the SIGORA IDs of such identifiers. 
In order to use \code{sigs_background}, you need to specify a vector containg the list of assayed genes as SIGORA IDs.
 A convenient way for creation of such a vector is to download a comma separated (.csv) file from 
 Ensembl BioMart (http://www.ensembl.org/biomart/martview) that maps human ENSEMBL Gene IDs to 
 microarray probe IDs. You would then run \code{create_bg} on the downloaded file. 
}
\usage{
create_bg(filename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{filename}{The name of the mapping file. This should be a comma separated (.csv) file (e.g. from BioMart) where the first column contains the human/mouse ENSEMBL Gene IDs and the second column contains the mapped probe IDs.
  }
}
\seealso{
\code{\link{sigs_background}}
}
\examples{
\dontrun{
## Assuming your data came from an Affymetrix HGu133B chip and you have
## downloaded the probe ID mappings to a file called ENS_hgu133b_Chip_uniq.txt: 
hgu133b_bg<-create_bg('ENS_hgu133b_Chip_uniq.txt')
## now you can run sigs_background with the background 
##(bg-genes argument) set to hgu133b_bg.
}
}