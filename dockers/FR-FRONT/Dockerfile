FROM tiangolo/uwsgi-nginx-flask:python3.5
MAINTAINER Claudia J.Kang <FloweryRoads@gmail.com>

# mirror site changed. https://www.debian.org/mirror/list
RUN sed -i 's|deb.debian.org|ftp.kr.debian.org|g' /etc/apt/sources.list

RUN apt update -y
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt install -y nodejs vim tmux curl

RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN npm install -g bower

ARG proj

ENV PROJ_PATH /app/${proj}
ENV UWSGI_INI ${PROJ_PATH}/${proj}_uwsgi.ini
ENV STATIC_PATH ${PROJ_PATH}/app/static

RUN git clone https://github.com/FloweryRoads/FloweryRoads-Front.git ${PROJ_PATH}
WORKDIR ${PROJ_PATH}

RUN pip install -r requirements.txt
RUN npm install
RUN bower install
RUN npm run node-sass

CMD ["/usr/bin/supervisord"]
