FROM tomcat:8.5.11-jre8

MAINTAINER Vitesh Radhakisson (vradhakisson@productiveedge.com)

ARG mgnlEnv
ARG mgnlInstance

ENV mgnlHome /opt/magnolia/$mgnlEnv
ENV catalinaHome /usr/local/tomcat

RUN mkdir $mgnlHome
