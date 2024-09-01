
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    busybox \
    curl \
    git \
    gnupg2 \
    locales \
    pv \
    python3.9 \
    python3.9-dev \
    python3-pip \
    wget \
    zlib1g-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpng-dev \
    libxml2-dev \
    libxslt1-dev

# Clean up apt cache
RUN apt-get autoclean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip3 install setuptools wheel yarl multidict
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY MukeshAPI-0.6.5.6-py3-none-any.whl .
RUN pip3 install MukeshAPI-0.6.5.6-py3-none-any.whl

# Configure locales
RUN dpkg-reconfigure locales

# Copy application code
COPY . /app

# Set command to run
CMD ["python3.9", "Chatgpt"]
