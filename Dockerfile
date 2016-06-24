FROM ubuntu

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \

    apt-get update && \ 
 
    apt-get install -y python-software-properties && apt-get install -y software-properties-common && apt-get install -y python3-software-properties && \

    add-apt-repository ppa:webupd8team/java && \

    apt-get update && \

    apt-get install -y oracle-java7-installer && \

    apt-get install -y wget && \
 
    apt-get install -y unzip && \
    
    mkdir -p /home/wso2 && \

    cd /home/wso2 && \

    wget --user-agent="testuser" http://dist2.wso2.org/products/identity-server/4.6.0/wso2is-4.6.0.zip && \

    unzip wso2is-4.6.0.zip && \

    rm -rf wso2is-4.6.0.zip && \

    mv wso2is-4.6.0 wso2is4.6

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV PATH $PATH:$JAVA_HOME/bin
ENV WSO2_IS_HOME /home/wso2/wso2is4.6
ENV PATH $PATH:$WSO2_IS_HOME/bin

WORKDIR $WSO2_IS_HOME

CMD wso2server.sh
