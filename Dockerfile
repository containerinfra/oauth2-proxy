FROM centos:8 as build

ARG OAUTH2_PROXY_VERSION=v7.2.1
ARG OAUTH2_PROXY_SHA256=836b0a0d3b30fe234b643ad543c222a756813e69aa5ee8edd57d2753e5cd8ed1

RUN curl -L -O https://github.com/oauth2-proxy/oauth2-proxy/releases/download/${OAUTH2_PROXY_VERSION}/oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz \
    \
    && sha256sum oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz \
    && echo "${OAUTH2_PROXY_SHA256} oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz" | sha256sum -c \
    && tar -zxvf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz  \
    \
    && mv oauth2-proxy-v7.2.1.linux-amd64/oauth2-proxy /usr/local/bin/oauth2-proxy \
    && rm -rf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz

RUN touch /jwt_signing_key.pem

# Resulting image
FROM gcr.io/distroless/static 
COPY --from=build /jwt_signing_key.pem /etc/ssl/private/jwt_signing_key.pem
COPY --from=build /usr/local/bin/oauth2-proxy /usr/local/bin/oauth2-proxy
ENTRYPOINT [ "/usr/local/bin/oauth2-proxy" ]
