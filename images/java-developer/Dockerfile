FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

# Install spanner-cli
RUN go install github.com/cloudspannerecosystem/spanner-cli@latest && sudo mv /root/go/bin/spanner-cli /usr/local/go/bin

# Install Cloud Spanner Emulator
RUN sudo apt-get install google-cloud-cli-spanner-emulator

# Install Terraform
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common && \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    sudo apt update && \
    sudo apt-get install terraform

# Spring Boot Extension
RUN wget https://open-vsx.org/api/VMware/vscode-boot-dev-pack/0.1.0/file/VMware.vscode-boot-dev-pack-0.1.0.vsix && \
    unzip VMware.vscode-boot-dev-pack-0.1.0.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-boot-dev-pack

# Spring Initializr Java Support
RUN wget https://open-vsx.org/api/vscjava/vscode-spring-initializr/0.11.2/file/vscjava.vscode-spring-initializr-0.11.2.vsix && \
    unzip vscjava.vscode-spring-initializr-0.11.2.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-spring-initializr

# Spring Boot Dashboard
RUN wget https://open-vsx.org/api/vscjava/vscode-spring-boot-dashboard/0.13.1/file/vscjava.vscode-spring-boot-dashboard-0.13.1.vsix && \
    unzip vscjava.vscode-spring-boot-dashboard-0.13.1.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-spring-boot-dashboard

# Extension pack for Java
RUN wget https://open-vsx.org/api/vscjava/vscode-java-pack/0.26.0/file/vscjava.vscode-java-pack-0.26.0.vsix && \
    unzip vscjava.vscode-java-pack-0.26.0.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-java-pack

# ESLint extension
RUN wget https://open-vsx.org/api/dbaeumer/vscode-eslint/2.4.4/file/dbaeumer.vscode-eslint-2.4.4.vsix && \
    unzip dbaeumer.vscode-eslint-2.4.4.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-eslint

# React extension
RUN wget https://open-vsx.org/api/tomi/xasnippets/2.13.1/file/tomi.xasnippets-2.13.1.vsix && \
    unzip tomi.xasnippets-2.13.1.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/xasnippets

# Docker Extension
RUN wget https://open-vsx.org/api/ms-azuretools/vscode-docker/1.25.2/file/ms-azuretools.vscode-docker-1.25.2.vsix && \
    unzip ms-azuretools.vscode-docker-1.25.2.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-docker

# yaml Extension
RUN wget https://open-vsx.org/api/redhat/vscode-yaml/1.14.0/file/redhat.vscode-yaml-1.14.0.vsix && \
    unzip redhat.vscode-yaml-1.14.0.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-yaml

# Terraform Extension
RUN wget https://open-vsx.org/api/hashicorp/terraform/linux-x64/2.30.1/file/hashicorp.terraform-2.30.1@linux-x64.vsix && \
    unzip hashicorp.terraform-2.30.1@linux-x64.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-terraform

# Clone Sample App
COPY scripts/300_gitclone.sh /etc/workstation-startup.d/
RUN chmod +x /etc/workstation-startup.d/300_gitclone.sh
