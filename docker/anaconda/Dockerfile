FROM tensorflow/tensorflow:latest-gpu-py3

LABEL maintainer="py4mac <boisbu@gmail.com>"

RUN apt update && apt install -y wget libsm6 libxext6 libfontconfig1 libxrender1

# Install other dependencies
COPY requirements.txt /home/
RUN pip install -r /home/requirements.txt

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

# Store notebooks in this mounted directory
VOLUME /notebooks