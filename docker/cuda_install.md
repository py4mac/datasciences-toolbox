# Cuda installation guide

## Reference
* https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html#installcuda
* https://marmelab.com/blog/2018/03/21/using-nvidia-gpu-within-docker-container.html
* https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html
* https://medium.com/@asmello/how-to-install-tensorflow-cuda-9-1-into-ubuntu-18-04-b645e769f01d
* https://tolotra.com/2018/07/24/how-to-install-tensorflow-gpu-1-5-0-and-1-7-and-1-8-0-on-windows-10/#First_time_step_and_Biggest_challenge_Installing_CUDA_toolkit_9

## Installation guide on Ubuntu

* Install Cuda:
```bash
$sudo apt-get purge nvidia-*
$reboot
$sudo sh cuda_10.0.130_410.48_linux.run (yes for all)
$reboot
```
 
* Test

```bash
$nvidia-smi
$cd /usr/local/cuda-10.0/samples/1_Utilities/deviceQuery/
$make
$./deviceQuery
```

* Install nvidia docker extension

```bash
$sudo apt-get install nvidia-docker2
$sudo pkill -SIGHUP dockerd
```
 

* Install CUDNN

```bash
$sudo dpkg -i libcudnn7_7.0.3.11-1+cuda9.0_amd64.deb
$sudo dpkg -i libcudnn7-dev_7.0.3.11-1+cuda9.0_amd64.deb
$sudo dpkg -i libcudnn7-doc_7.0.3.11-1+cuda9.0_amd64.deb
```

* Post-Install CUDNN

```bash
$sudo mkdir -p /usr/local/cuda /usr/local/cuda/extras/CUPTI /usr/local/cuda/nvvm
$sudo ln -s /usr/bin /usr/local/cuda/bin
$sudo ln -s /usr/include /usr/local/cuda/include
$sudo ln -s /usr/lib/x86_64-linux-gnu /usr/local/cuda/lib64
$sudo ln -s /usr/local/cuda/lib64 /usr/local/cuda/lib
$sudo ln -s /usr/include /usr/local/cuda/extras/CUPTI/include
$sudo ln -s /usr/lib/x86_64-linux-gnu /usr/local/cuda/extras/CUPTI/lib64
$sudo ln -s /usr/lib/nvidia-cuda-toolkit/libdevice /usr/local/cuda/nvvm/libdevice
$sudo ln -s /usr/local/cuda/lib64/libcublas.so.10.0 /usr/lib/libcublas.so.10.0
$sudo ln -s /usr/local/cuda/lib64/libcudart.so.10.0 /usr/lib/libcudart.so.10.0
```

* Test CUDA+CUDNN installation with docker

```bash
$ docker run --runtime=nvidia -it -p 8888:8888 tensorflow/tensorflow:latest-gpu-py3
```

Inside Notebook you can write and check your GPU is correctly detected:

```python
from tensorflow.python.client import device_lib
print(device_lib.list_local_devices())
```

or

```python
from keras import backend as K
K.tensorflow_backend._get_available_gpus()
```