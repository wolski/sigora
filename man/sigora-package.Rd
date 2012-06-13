\name{sigora-package}
\alias{sigora}
\docType{package}
\title{
Signature Overrepresentation Analysis
}
\description{
This section gives a brief overview of the most important functions of the pathway 
analysis package SIGORA. This documentation uses the terminology described in our 
manuscript submitted to Bioinformatics, 2012.
 In short: a GPS (gene pair signature) is a (weighted) pair of genes that 
 \emph{as a combination} occurs only in a single pathway within a pathway repository.
 A query list is a vector containing a gene list of interest (e.g. genes that 
 are differentially expressed in a particular condition). 
A \emph{present} GPS is a GPS for which both components are in the query list.
SIGORA identifies relevant pathways based on the over-representation analysis 
of their (present) GPS.
}
\details{
\tabular{ll}{
Package: \tab sigora\cr
Type: \tab Package\cr
Version: \tab 0.9.2\cr
Date: \tab 2012-06-13\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
\subsection{Getting started}{
To install from CRAN:\cr 
>\code{install.packages('sigora')}\cr
As an alternative, you can download the tarball and install from the local file: \cr
>\code{install.packages('sigora_0.9.2.tar.gz',type='source',repos = NULL)} \cr
To load the library:\cr 
> \code{library('sigora')}\cr 
Now it would be a good idea to look at a man page.\cr 
>\code{?sigs}\cr 
This shows the man page of sigs, SIGORA's most important function.\cr 
You will notice the following entry for the parameter \code{samplename}:\cr 
\emph{"A user specified list of genes of interest ('query list'), as a vector of
  SIGORA IDs. To obtain such a vector, import the list of
  ENSEMBL/Entrez IDs using \code{scan(..,what='character')} and apply the
  appropriate mapping_function (\code{entrez_converter} or \code{ens_converter}) to it."}\cr
We will get to this shortly, but let's try the example from the 'example' section of\code{
?sigs} first. \cr  
}
\subsection{Examining a pre-loaded example set}{
A few datasets are pre-loaded. For example:\cr 
\code{dengue_hoang} is a Dengue fever dataset 
(significantly up-regulated genes from GSE25001, Hoang et al. 2010),\cr
\code{rcc_lenburg} a Renal Cell Carcinoma set 
(Differentially expressed genes in GSE781, Lenburg et al. 2003). 
\cr You could run the following:\cr 
> \code{sigs(dengue_hoang,'k' ,1 ,level=2)}\cr 
This runs Signature Over-representation on the Dengue Fever dataset, using 
KEGG_signatures ('k'), including marker genes and examines two levels of the hierarchy in the repository (see manuscript).
 Once \code{sigs} finishes, you are presented with the list of pathways that it deems to be statistically significant for this dataset, along with a few lines on how to access the results and what you might want to do next with them.\cr 
 The output of the above command should end on something like:
\preformatted{
[1] ##################### Highlighted Pathways: ##################
[1] Systemic lupus erythematosus          Hepatitis C                          
[3] Complement and coagulation cascades   RIG-I-like receptor signaling pathway
[5] Lysosome                              Chemokine signaling pathway          
[7] Osteoclast differentiation            Cytosolic DNA-sensing pathway        
[9] Antigen processing and presentation   NOD-like receptor signaling pathway   
[11] Toll-like receptor signaling pathway                                      
    ##############################################################           
    You might also want to take a look at summary_results to see all pathways 
    for which a GPS was found, then run det_out(filename) and related_genes() 
  ** Please note that the recommended cut-off threshold for significance in
     this case is:  [1] 3.37e-05
    ##############################################################
   user  system elapsed
 12.465   1.160  13.628
}
Let's assume you were interested in the genes that contribute strongly to the evidence for 
the 4th ranked pathway (\emph{'RIG-I-like receptor signaling pathway'}), you could try the following: \cr
> \code{get_genes(4,0.5)}\cr
# This returns the list genes that are involved in the present GPS of the \cr# 4th ranked pathway with weights better than 0.5. 
\preformatted{
                  gene_name  sigora_internal_id  ENSEMBL_ID   
16460               IRF7               17225 ENSG00000185507  
12781             CXCL10               25212 ENSG00000169245  
3630               DHX58               50252 ENSG00000108771  
3439               DDX58               55854 ENSG00000107201  
18639             TBKBP1               56118 ENSG00000198933  
4453               IFIH1               73750 ENSG00000115267  
16985              ISG15               84312 ENSG00000187608  
}
 }     
\subsection{Exporting the results}{
You also have access to all results and calculations: \cr 
> \code{ls()}\cr
\code{[1] "detailed_results" "summary_results" "padj_number"
}\cr
\code{detailed_results} contains all present GPS (i.e. all Gene-Pair-Signatures 
for which both component genes were in the input list)\cr
\code{summary_results} gives an overview of the over-representation analysis of the GPS: i.e. number of present GPS per pathway, the sum of their weights, 
the associated p-value and adjusted p-values and the parameters of the 
hypergeometric function that produces the p-values.\cr
\code{padj_number} is the number of tests and is used to adjust the 
p-values for multiple testing. By default, this is set to the number of all 
pathways in the repository for which at the specified level of hierarchy a 
possible GPS exists.\cr  
> \code{head(summary_results)} \cr 
> \code{write.table(summary_results,'myresults.txt')}\cr 
> \code{?det_out}\cr 
> \code{det_out('some_file.txt')}\cr 
> \code{?related_genes}\cr 
This function gives the list of genes involved in all present GPS  per pathway.
} 
\subsection{Examining own your datasets}{
 As mentioned above, to examine your own datasets you first need to convert 
the identifiers of your genes of interest to SIGORA IDs. This can be done using \code{ens_converter} which converts human or mouse ENSEMBL IDs to SIGORA IDs or using \code{entrez_converter} which converts human or mouse Entrez IDs to SIGORA IDs. \cr 
As a last resort, \code{genename_converter} can be used to map gene names to SIGORA IDs, but whenever possible, you should use ENSEMBL IDs \cr 
\code{idb_to_genename} and \code{idb_converter} can be used to reverse these mappings.\cr 
So, if you have a file with human ENSEMBL IDs, you would run:\cr 
>\code{tmp<-scan('test_ensemble_data.txt', what='character')}\cr 
>\code{mysample<-ens_converter(tmp)}\cr 
## It would be a good idea to make sure that the mapping went OK:\cr 
>\code{length(mysample)}\cr 
## Now, you can proceed with sigs as described above.\cr 
}
  }
\author{
Amir Foroushani \cr
Maintainer:  <amir.foroushani@teagasc.ie>
}
\keyword{ package }
\examples{
\dontrun{
### sigs is the most important function of sigora. 
## A few datasets are already preloaded, for example dengue_hoang is a 
##list of differentially up-regulated genes in a Dengue Fever Data.
sigs(dengue_hoang,'k',1,level=2)
### There are various converters for mapping different gene identifier types to
## SIGORA IDs.
tmp<-scan('test_ensemble_data.txt', what='character')
mysample<-ens_converter(tmp)
sigs(mysample,'k',1,level=2)
head(summary_results)
det_out("detailed_evidence.txt")
related_genes()
### Returns list of human marker genes in KEGG as SIGORA IDs:
tmp<-get_marker_genes(archive='keg')
# convert the above results to human readable gene names and ENSEMBL ids
idb_converter(tmp)
}
}
