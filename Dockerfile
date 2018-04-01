FROM tomcat:8.5.11-jre8

MAINTAINER Vitesh Radhakisson (vradhakisson@productiveedge.com)

ENV magnoliaHome /opt/magnolia
RUN mkdir -p $magnoliaHome/instance

WORKDIR $CATALINA_HOME
CMD ["catalina.sh", "stop"]

WORKDIR /etc/systemd/system
RUN echo "# Systemd unit file for tomcat" >> tomcat.service
RUN echo "[Unit]" >> tomcat.service
RUN echo "Description=Apache Tomcat Web Application Container" >> tomcat.service
RUN echo "After=syslog.target network.target" >> tomcat.service
RUN echo "[Service]" >> tomcat.service
RUN echo "Type=forking" >> tomcat.service
RUN echo "Environment='CATALINA_OPTS=-server -XX:+UseParallelGC'" >> tomcat.service
RUN echo "Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'" >> tomcat.service
RUN echo "Environment=magnoliaEnv=$magnoliaEnv" >> tomcat.service
RUN echo "Environment=magnoliaInstance=$magnoliaInstance" >> tomcat.service
RUN echo "Environment=MGNL_DS_URL=jdbc:postgresql://d-aws-cms-db.cbduemg5i5w8.us-east-1.rds.amazonaws.com:5432/D_AWS_CMS_DB" >> tomcat.service
RUN echo "Environment=MGNL_DS_USER=vvadmin" >> tomcat.service
RUN echo "Environment=MGNL_DS_PWD=Vergin123$" >> tomcat.service
RUN echo "ExecStart=/usr/local/tomcat/bin/startup.sh" >> tomcat.service
RUN echo "ExecStop=/bin/kill -15 $MAINPID" >> tomcat.service
RUN echo "User=tomcat" >> tomcat.service
RUN echo "Group=tomcat" >> tomcat.service
RUN echo "UMask=0007" >> tomcat.service
RUN echo "RestartSec=10" >> tomcat.service
RUN echo "Restart=always" >> tomcat.service
RUN echo "[Install]" >> tomcat.service
RUN echo "WantedBy=multi-user.target" >> tomcat.service

RUN systemctl start tomcat.service