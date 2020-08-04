FROM conda/miniconda3

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update -y && \
		apt-get install -y --no-install-recommends \
			git \
      wget \
      build-essential \
		&& \
		apt-get clean && \
		rm -rf /var/lib/apt/lists/*

RUN conda update -n base -c defaults conda
RUN conda update --all

RUN export CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"
RUN conda install -c iainsgillis music21
# https://github.com/librosa/librosa/issues/1160
RUN conda install numba==0.48 
RUN conda install -c conda-forge librosa

RUN conda install -y jupyter
RUN conda install -c anaconda pandas
RUN conda install -c roebel pretty_midi
RUN conda install -y seaborn
RUN conda install -y pytorch torchvision -c pytorch

# RUN conda install -y jupyter matplotlib scikit-learn nltk bokeh scikit-image
# RUN conda install -y numpy pyyaml mkl setuptools cmake cffi
# RUN conda install -y pytorch-cpu torchvision-cpu -c pytorch
# 
# # RUN conda install -y pretty-midi librosa pandas music21 seaborn
# # RUN conda install -c numba numba

WORKDIR /work
CMD ["bash"]
