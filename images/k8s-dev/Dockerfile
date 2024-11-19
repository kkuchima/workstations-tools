FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

# Install K9s
RUN curl -L https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz -o k9s && tar -xf k9s && \
    chmod +x k9s && mv ./k9s /usr/local/bin/k9s

# Docker Extension
RUN wget https://open-vsx.org/api/ms-azuretools/vscode-docker/1.25.2/file/ms-azuretools.vscode-docker-1.25.2.vsix && \
    unzip ms-azuretools.vscode-docker-1.25.2.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-docker

# yaml Extension
RUN wget https://open-vsx.org/api/redhat/vscode-yaml/1.14.0/file/redhat.vscode-yaml-1.14.0.vsix && \
    unzip redhat.vscode-yaml-1.14.0.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/vscode-yaml

# Kubernetes Tools
RUN wget https://open-vsx.org/api/ms-kubernetes-tools/vscode-kubernetes-tools/1.3.13/file/ms-kubernetes-tools.vscode-kubernetes-tools-1.3.13.vsix && \
    unzip ms-kubernetes-tools.vscode-kubernetes-tools-1.3.13.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/kubernetes-tools

# Kubernetes Snippets
RUN wget https://open-vsx.org/api/ipedrazas/kubernetes-snippets/0.1.9/file/ipedrazas.kubernetes-snippets-0.1.9.vsix && \
    unzip ipedrazas.kubernetes-snippets-0.1.9.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/kubernetes-snippets

# Install Terraform
RUN sudo apt-get update && sudo apt-get install -y gnupg software-properties-common && \
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    sudo apt update && \
    sudo apt-get install terraform

# Install ArgoCD
RUN VERSION=$(curl -L -s https://raw.githubusercontent.com/argoproj/argo-cd/stable/VERSION) && \
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/v$VERSION/argocd-linux-amd64 && \
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd && \
    rm argocd-linux-amd64

# Install helm-diff
RUN helm plugin install https://github.com/databus23/helm-diff

# Install helmfile
RUN wget https://github.com/roboll/helmfile/releases/download/v0.144.0/helmfile_linux_amd64 && \
    sudo mv helmfile_linux_amd64 /usr/local/bin/helmfile && \
    chmod 755 /usr/local/bin/helmfile