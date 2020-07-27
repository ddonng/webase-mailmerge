FROM ddonng/webasewithsoap:latest
RUN echo "deb http://mirrors.163.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y wget
RUN cd /home && wget -c https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz && tar -zxvf Python-3.8.5.tgz 
RUN apt-get install -y build-essential
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
RUN cd /home/Python-3.8.5/ && ./configure --enable-optimizations --with-ensurepip=install
RUN cd /home/Python-3.8.5/ && make altinstall
RUN pip3.8 install lxml && pip3.8 install docx-mailmerge
