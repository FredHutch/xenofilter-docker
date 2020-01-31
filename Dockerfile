FROM r-base:3.6.2

RUN apt-get update -y && apt-get install -y curl libcurl4-openssl-dev

RUN R -q -e "install.packages('BiocManager', repos='https://cran.r-project.org')"
RUN R -q -e 'BiocManager::install(c("Rsamtools", "GenomicAlignments", "BiocParallel", "futile.logger", "GenomicRanges", "Homo.sapiens"))'
#  "Rsamtools", "GenomicAlignments", "GenomicRanges"
RUN R -q -e 'BiocManager::install(c("Rsamtools", "GenomicAlignments", "BiocParallel", "futile.logger", "GenomicRanges", "Homo.sapiens"))'

RUN curl -LO https://github.com/PeeperLab/XenofilteR/releases/download/v1.6/XenofilteR_1.6.tar.gz

RUN R CMD INSTALL XenofilteR_1.6.tar.gz

RUN rm XenofilteR_1.6.tar.gz



