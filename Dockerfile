FROM kbase/sdkbase2:python

#ADD LOCALIZER_1.0.4.tar.gz /opt  website standalone version
COPY . /opt/LOCALIZER_1.0.4/

RUN chmod -R 755 /opt/LOCALIZER_1.0.4/

RUN apt-get update
RUN apt-get install -y emboss
RUN apt-get install -y vim
RUN apt install -y python2.7 python-pip

RUN cd /opt/LOCALIZER_1.0.4/Scripts && tar xvf emboss-latest.tar.gz
RUN cd /opt/LOCALIZER_1.0.4/Scripts/EMBOSS-6.5.7 && ./configure --without-x && make
RUN cd /opt/LOCALIZER_1.0.4/Scripts && unzip -q weka-3-6-12.zip

RUN pip2 install localization
RUN pip2 install biopython

WORKDIR /opt/LOCALIZER_1.0.4/Scripts

