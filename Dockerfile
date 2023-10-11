FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

RUN apt-get update 
RUN apt-get install -y python3 pip git sudo wget vim screen htop jq net-tools infiniband-diags perftest 

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --index-url https://download.pytorch.org/whl/cu118

RUN python -c 'import torch; print(torch.__version__); print(torch.cuda.is_available)'

COPY requirements.txt /root/requirements.txt

RUN pip install -r /root/requirements.txt

RUN pip install bitsandbytes flash-attn

WORKDIR ~

CMD ["/bin/bash"]
