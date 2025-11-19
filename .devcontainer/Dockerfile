#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM ubuntu:24.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    apt-utils=2.8.3* \
    # Verify git and needed tools are installed
    git=1:2.43.0* \
    procps=2:4.0.4* \
    # Install Tex Live
    && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
    texlive-latex-base=2023.20240207* \
    texlive-extra-utils=2023.20240207* \
    texlive-latex-extra=2023.20240207* \
    texlive-bibtex-extra=2023.20240207* \
    texlive-lang-all=2023.20240207* \
    biber=2.19* \
    chktex=1.7.8* \
    latexmk=1:4.83* \
    make=4.3* \
    python3-pygments=2.17.2* \
    python3-pkg-resources=68.1.2* \
    curl=8.5.0* \
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
    
# latexindent modules
RUN curl -L http://cpanmin.us | perl - App::cpanminus \
    && cpanm Log::Dispatch::File \
    && cpanm YAML::Tiny \
    && cpanm File::HomeDir \
    && cpanm Unicode::GCString

# Dockerfile linter
COPY --from=hadolint/hadolint:v2.14.0-debian /bin/hadolint /bin/hadolint

ENV DEBIAN_FRONTEND=dialog \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8
