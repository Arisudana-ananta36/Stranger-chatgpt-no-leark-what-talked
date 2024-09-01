
FROM python:latest

RUN apt-get update -y && apt-get upgrade -y

RUN pip3 install -U pip

COPY . /app/
WORKDIR /app/

# Install MukeshAPI from local file
COPY MukeshAPI-0.6.5.6-py3-none-any.whl /app/
RUN pip3 install MukeshAPI-0.6.5.6-py3-none-any.whl

# Install remaining dependencies from requirements.txt
RUN pip3 install -U -r requirements.txt

CMD python3 main.py
