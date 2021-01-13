FROM ddonng/webasewithsoap:latest
# RUN echo "deb http://mirrors.163.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && apt-get update && apt-get install -y wget
RUN cd /home && wget -c https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tgz && tar -zxvf Python-3.6.2.tgz 
RUN apt-get install -y build-essential
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
RUN cd /home/Python-3.6.2/ && ./configure --enable-optimizations --with-ensurepip=install --with-ssl
RUN cd /home/Python-3.6.2/ && make && make install
RUN pip3 install lxml
RUN apt-get install -y poppler-utils
RUN apt-get update && apt-get install -y vim
RUN pip3 install pdf2image qrcode redis
RUN pip3 install docx-mailmerge-hxd==0.7.3
