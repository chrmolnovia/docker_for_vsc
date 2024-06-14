## Docker images
-> instructions for creating docker container

## Container
-> runnable instance of an image, you can create, start, stop and move, delete it

- interactive session
    ```shell
    # run in interative mode
    docker run -it --name mycontainer python:3.12-bullseye /bin/bash

    # exit and then start
    docker start mycontainer
    docker attach mycontainer
    ```

- mount directoy
    ```shell
    # mount current working directory
    docker run -it -v ${pwd}:/home --name mycontainer python:3.12-bullseye /bin/bash

    ```

- forward ports
    ```shell
    # run in interative mode
    docker run -it -p 80:80 -v ${pwd}:/home --name mycontainer python:3.12-bullseye /bin/bash
    ```


## Build custom image

- create Dockerfile 
    ```Docker
    FROM python:3.12-bullseye

    WORKDIR /app
    COPY . /app/

    RUN apt-get update
    ```

- Then build image with tag custom-image
    ```shell
    docker build -t custom-image .
    ```

- run image as container and connect to it
    ```shell
    # create container and open bash
    docker run -it --name myCustomContainer custom-image /bin/bash
    ```


## Simple Application

- Modify Dockerfile

    ```Docker
    # add simple application and install requirements when building image
    RUN pip install -r requirements.txt
    ENV GRADIO_SERVER_NAME="0.0.0.0"
    EXPOSE 7860
    CMD ["python", "simpleApp.py"]
    ```

    Rebuild custom image
    ```shell
    # build container again
    docker build -t custom-image .
    ```

    Run image as container and open http://localhost:7860/
    ```shell
    # forward path when running
    docker run -it -d -p 7860:7860 --name myApp custom-image
    ```