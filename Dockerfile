
FROM quay.io/biocontainers/mhcflurry:2.1.4--pyh7e72e81_0

FROM alpine:3

ENV DEBIAN_FRONTEND=noninteractive

USER root
RUN apt update && \
    apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev liblzma-dev r-base curl wget && \
    apt clean;

RUN R -q -e "install.packages(c('curl'))" && \
    Rscript -e "install.packages('BiocManager', dependencies=TRUE, repos='http://cran.rstudio.com/')" && \
    Rscript -e "BiocManager::install(c('gridExtra', 'dplyr', 'GenomicRanges', 'ggplot2', 'ggVennDiagram', 'ORFik', 'Biostrings', 'ShortRead'))"

ENV PATH="$PATH:/opt/conda/envs/samtools/bin:/opt/conda/envs/arriba/bin:/opt/conda/envs/fusionseeker/bin:/opt/conda/envs/starfusion/bin:/opt/conda/envs/normal/bin:/bin:/JAFFA/tools/bin:/JAFFA:/bin/fusim-0.2.2:/bin/Fusionseeker"

COPY ./src /src

ENTRYPOINT ["bash", "/src/extract_fusions.R"]
