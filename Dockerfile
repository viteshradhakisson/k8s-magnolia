FROM tomcat:8.5.11-jre8

MAINTAINER Vitesh Radhakisson (vradhakisson@productiveedge.com)

ENV $magnoliaHome /opt/magnolia
ENV $magnoliaBase $magnoliaHome/$magnoliaInstance

RUN mkdir -p $magnoliaBase