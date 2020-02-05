FROM fedora:31

RUN dnf install -y npm git

RUN useradd jsonserver
ADD run.sh /home/jsonserver/run.sh
ADD backup.sh /home/jsonserver/backup.sh
ADD server.js /home/jsonserver/server.js
RUN chown -R jsonserver:jsonserver /home/jsonserver/

USER jsonserver

WORKDIR /home/jsonserver

EXPOSE 3000

RUN npm install json-server shelljs
RUN mkdir ~/data && mkdir ~/.ssh && echo -e "Host *\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

ENTRYPOINT ["sh", "/home/jsonserver/run.sh"]
