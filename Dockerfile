FROM geographica/gdal2
RUN apt-get update -y && apt-get install -y \
	python-pip \
	python-dev \
	curl \
	unzip \
    wget && \
    rm -rf /var/lib/apt/lists/* 

# Upgrade pip
RUN pip install --upgrade pip

# Set the working directory to /app
WORKDIR /app

### Sen2cor Version 2.8.0
RUN wget http://step.esa.int/thirdparties/sen2cor/2.8.0/Sen2Cor-02.08.00-Linux64.run && \
    chmod +x Sen2Cor-02.08.00-Linux64.run && \
    bash /app/Sen2Cor-02.08.00-Linux64.run --target /home && \
    rm /app/Sen2Cor-02.08.00-Linux64.run

ENV PATH $PATH:/home/bin/
RUN cd /home/lib/python2.7/site-packages/sen2cor/aux_data && \ 
  wget ftp://geo10.elie.ucl.ac.be/v207/ESACCI-LC-L4-ALL-FOR-SEN2COR.zip && \
  unzip ESACCI-LC-L4-ALL-FOR-SEN2COR.zip && \
  rm ESACCI-LC-L4-ALL-FOR-SEN2COR.zip

# Setting environment variables
ENV PYTHONUNBUFFERED 1

### Run the sen2cor application
ENTRYPOINT ["/home/Sen2Cor-02.08.00-Linux64/bin/L2A_Process"]