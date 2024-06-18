# TODO remote dev container

# Develop in docker container locally

## configure

- install VSC extensions
    - Dev Containers
    - Docker

- create vsc.Dockerfile in /docker/
    ```Docker
    FROM python:3.12-bullseye

    # env variable in container
    ENV PATH="/root/miniconda3/bin:${PATH}"
    # build arguments
    ARG PATH="/root/miniconda3/bin:${PATH}"

    RUN apt-get update

    # install conda
    RUN wget \
        https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
        && mkdir /root/.conda \
        && bash Miniconda3-latest-Linux-x86_64.sh -b \
        && rm -f Miniconda3-latest-Linux-x86_64.sh 

    RUN conda init
    ```
- create .devcontainer/devcontainer.json
    ```js
    // For format details, see https://aka.ms/devcontainer.json. For config options, see the
    // README at: https://github.com/devcontainers/templates/tree/main/src/python
    {
        "name": "python3",
        // Or use a Dockerfile or Docker Compose file. More info: https://containers.dev/guide/dockerfile
        "build": {
            "dockerfile": "../docker/vsc.Dockerfile"
        },

        // Features to add to the dev container. More info: https://containers.dev/features.
        // "features": {}, 

        // Use 'forwardPorts' to make a list of ports inside the container available locally.
        "forwardPorts": [7860], 

        // Use 'postCreateCommand' to run commands after the container is created.
        "postCreateCommand": "conda env create -f environment.yaml",
        "runArgs": ["--gpus=all"
        ],

        // Configure tool-specific properties.
        // "customizations": {},

        // Uncomment to connect as root instead. More info: https://aka.ms/dev-containers-non-root.
        "remoteUser": "root"
    }
    ```

## open workspace in container
- CTRL + shift + P -> Dev Container: Reopen in Container
- run simpleApp.py

## git in dev container
- if clone per https works if credential helper is configured: https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git
- for ssh more configuration required 

# Develop in docker container remote
- connect to remote host
- create .devcontainer/devcontainer.json 