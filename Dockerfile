FROM python:bookworm

RUN apt-get -y --fix-missing update
RUN apt-get install -y --fix-missing \
    build-essential \
    cmake \
    gfortran \
    git \
    wget \
    curl \
    graphicsmagick \
    libgraphicsmagick1-dev \
    libatlas-base-dev \
    libavcodec-dev \
    libavformat-dev \
    libgtk2.0-dev \
    libjpeg-dev \
    liblapack-dev \
    libswscale-dev \
    pkg-config \
    python3-dev \
    python3-numpy \
    software-properties-common \
    zip \
    && apt-get clean && rm -rf /tmp/* /var/tmp/*
RUN git clone https://github.com/Sunoyon/face-recognition /opt/app
#COPY . /opt/app
WORKDIR /opt/app
RUN pip3 git+https://github.com/ageitgey/face_recognition_models
RUN pip3 install --upgrade pip && pip install marshmallow==3.26.1 Flask-SQLAlchemy==3.1.1 Flask==3.1.1 Flask-rebar==3.3.2 python-dotenv==1.1.0 psycopg2-binary==2.9.10 uWSGI==2.0.30 dlib==20.0.0 face_recognition==1.3.0 #
