FROM alpine:3.13.2

ENV GET_HELM_URL="https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz"

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L ${GET_HELM_URL} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["helm"]
CMD ["--help"]
