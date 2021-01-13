FROM ddonng/webasewithsoap:latest
RUN echo "deb http://mirrors.163.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && apt-get update && apt-get install -y wget
RUN cd /home && wget -c https://mirrors.huaweicloud.com/python/3.6.9/Python-3.6.9.tgz && tar -zxvf Python-3.6.9.tgz 
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libssl-dev poppler-utils
RUN cd /home/Python-3.6.9/ && ./configure --enable-optimizations --with-ensurepip=install --with-ssl
RUN cd /home/Python-3.6.9/ && make altinstall
RUN pip3.6 install lxml pdf2image qrcode redis
RUN pip3.6 install docx-mailmerge-hxd==0.7.3
