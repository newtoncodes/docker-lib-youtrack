FROM openjdk:8-jre-stretch

RUN mkdir -p /opt/youtrack/data /opt/youtrack/backup /opt/youtrack/bin

WORKDIR /opt/youtrack

ENV YOUTRACK_VERSION 2019.2.54193

RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y supervisor && \
    rm -rf /var/lib/apt/lists/*

RUN wget \
 https://download-cf.jetbrains.com/charisma/youtrack-${YOUTRACK_VERSION}.jar \
 -O /opt/youtrack/bin/youtrack.jar

COPY supervisor/youtrack.conf /etc/supervisor/conf.d/youtrack.conf

EXPOSE 80/tcp

VOLUME ["/opt/youtrack/data", "/opt/youtrack/backup"]

CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisor/supervisord.conf"]
