#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM ubuntu:25.10

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    apt-utils=3.1.6* \
    # Verify git and needed tools are installed
    git=1:2.51.0* \
    procps=2:4.0.4* \
    # Install Tex Live
    && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
    texlive-latex-base=2024.20250309* \
    texlive-extra-utils=2024.20250309* \
    texlive-latex-extra=2024.20250309* \
    texlive-bibtex-extra=2024.20250309* \
    texlive-lang-all=2024.20250309* \
    biber=2.20* \
    chktex=1.7.9* \
    latexmk=1:4.87* \
    make=4.4.1* \
    python3-pygments=2.18.0* \
    python3-pkg-resources=78.1.1* \
    curl=8.14.1* \
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
