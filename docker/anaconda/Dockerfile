FROM tensorflow/tensorflow:latest-gpu-py3

LABEL maintainer="py4mac <boisbu@gmail.com>"

# Install other dependencies
COPY requirements.txt /home/
RUN pip install -r /home/requirements.txt

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

# Store notebooks in this mounted directory
VOLUME /notebooks