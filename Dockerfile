FROM alpine:latest

ARG BUILD_DATE="N/A"
ARG REVISION="N/A"

RUN apk --no-cache add \
        ca-certificates \
        git \
        jq \
        moreutils \
        nvme-cli \
        pciutils \
        smartmontools \
        wget \
        python3
RUN    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN    mkdir -p /scripts
RUN    git clone --depth 1 --branch master --single-branch \
        https://github.com/prometheus-community/node-exporter-textfile-collector-scripts.git \
        /scripts
RUN    chmod 755 /scripts/*
RUN    update-pciids -q

COPY entrypoint.sh /entrypoint.sh

RUN chmod 755 /entrypoint.sh

VOLUME ["/var/lib/node_exporter"]

ENTRYPOINT ["/entrypoint.sh"]
