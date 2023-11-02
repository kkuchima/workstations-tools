FROM us-central1-docker.pkg.dev/cloud-workstations-images/predefined/code-oss:latest

RUN sudo apt update
RUN sudo apt install build-essential ruby-full make

RUN ln -s /usr/bin/pip /usr/local/bin/pip
RUN pip install notebook ipykernel

RUN wget https://open-vsx.org/api/ms-toolsai/jupyter/2023.7.100/file/ms-toolsai.jupyter-2023.7.100.vsix && \
    unzip ms-toolsai.jupyter-2023.7.100.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/jupyter

RUN wget https://open-vsx.org/api/ms-toolsai/jupyter-keymap/1.1.2/file/ms-toolsai.jupyter-keymap-1.1.2.vsix && \
    unzip ms-toolsai.jupyter-keymap-1.1.2.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/jupyter-keymap

RUN wget https://open-vsx.org/api/ms-toolsai/jupyter-renderers/1.0.15/file/ms-toolsai.jupyter-renderers-1.0.15.vsix && \
    unzip ms-toolsai.jupyter-renderers-1.0.15.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/jupyter-renderers

RUN wget https://open-vsx.org/api/ms-toolsai/vscode-jupyter-cell-tags/0.1.8/file/ms-toolsai.vscode-jupyter-cell-tags-0.1.8.vsix && \
    unzip ms-toolsai.vscode-jupyter-cell-tags-0.1.8.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/jupyter-cell-tags

RUN wget https://open-vsx.org/api/ms-toolsai/vscode-jupyter-slideshow/0.1.5/file/ms-toolsai.vscode-jupyter-slideshow-0.1.5.vsix && \
    unzip ms-toolsai.vscode-jupyter-slideshow-0.1.5.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/jupyter-slideshow

RUN wget https://open-vsx.org/api/ms-python/python/2023.14.0/file/ms-python.python-2023.14.0.vsix && \
    unzip ms-python.python-2023.14.0.vsix "extension/*" &&\
    mv extension /opt/code-oss/extensions/ms-python