FROM continuumio/miniconda:latest
LABEL name="aangeloo/nxf-ont"
LABEL maintainer="aangeloo@gmail.com" 
LABEL description="Docker image for angelovangel/nxf-ont"

COPY environment.yml .
RUN apt-get update -y && apt-get install -y pigz procps libxt-dev && apt-get clean -y
RUN conda env create -f environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nxf-ont-1.1/bin:$PATH
# sparkline is not on conda, so install here manually
RUN R -e "install.packages('sparkline', repos='http://cran.rstudio.com/')"
