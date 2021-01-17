FROM amancevice/superset:latest
USER root

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y unixodbc unixodbc-dev rpm 

RUN apt-get install -y alien \
		dpkg-dev \
		debhelper \
		build-essential

RUN pip install pyodbc

RUN wget https://download.dremio.com/odbc-driver/1.5.1.1001/dremio-odbc-1.5.1.1001-1.x86_64.rpm && \
    alien -i dremio-odbc-1.5.1.1001-1.x86_64.rpm

RUN pip install sqlalchemy_dremio

USER superset
