This repository is a collection of scripts that run map and align pacbio mouse sequencing data then leverages a collection of R scripts that ultimately output MHCFlurry (https://github.com/openvax/mhcflurry) scores to determine possible immunogenic antigens. 

The src directory contains files relevant to the pipeline. The pipeline is meant to be run in the asscociated docker image located at https://hub.docker.com/repository/docker/vantwisk/longread-fusion-transcript-pipeline/general.

The pipeline will produce the ref, alignments, and results directories in the bound folder. The results directory contains the fusion results for the various tools as well as the output graphs in the graphs directory.

Files in the ref directory can be used for subsequent runs. Otherwise, the pipeline will populate it with needed resources to run the pipeline.
