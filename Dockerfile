FROM tcf909/ubuntu-slim:latest
MAINTAINER T.C. Ferguson <tcf909@gmail.com>

RUN \
    apt-get update && \
    apt-get upgrade && \
    apt-get install rsync && \

#CLEANUP
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN \
    if [ "${DEBUG}" = "true" ]; then \
        apt-get update && \
        apt-get install iptables net-tools iputils-ping mtr && \
        apt-get autoremove && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* /tmp/*; \
    fi

EXPOSE 873

COPY rootfs/ /

CMD ["/sbin/my_init"]