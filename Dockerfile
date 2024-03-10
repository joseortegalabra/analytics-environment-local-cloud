FROM python:3.7.5-slim-buster as python-gcloud

RUN apt-get update && apt-get install -y curl && curl -sSL https://sdk.cloud.google.com | bash

FROM python-gcloud
RUN mkdir -p /app/
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
ENV PATH=$PATH:/root/google-cloud-sdk/bin


CMD [ "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root","--NotebookApp.token=''","--NotebookApp.password=''"]
EXPOSE 8888