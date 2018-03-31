FROM tomcat:8.5.11-jre8

MAINTAINER Vitesh Radhakisson (vradhakisson@productiveedge.com)

ARG magnoliaEnv
ARG magnoliaInstance

ENV mgnlHome /opt/magnolia/$magnoliaEnv
ENV catalinaHome /usr/local/tomcat

RUN mkdir $mgnlHome
