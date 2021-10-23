FROM centos:8 as build

ARG OAUTH2_PROXY_VERSION=v7.2.0
ARG OAUTH2_PROXY_SHA256=db0f19b7d5533aecdbb352d0bbbf26a85733b74729d74a68babe7b3d7a69496b

RUN curl -L -O https://github.com/oauth2-proxy/oauth2-proxy/releases/download/${OAUTH2_PROXY_VERSION}/oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz \
    \
    && sha256sum oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz \
    && echo "${OAUTH2_PROXY_SHA256} oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz" | sha256sum -c \
    && tar -zxvf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz  \
    \
    && mv oauth2-proxy-v7.2.0.linux-amd64/oauth2-proxy /usr/local/bin/oauth2-proxy \
    && rm -rf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-amd64.tar.gz

RUN touch /jwt_signing_key.pem

# Resulting image
FROM gcr.io/distroless/static 
COPY --from=build /jwt_signing_key.pem /etc/ssl/private/jwt_signing_key.pem
COPY --from=build /usr/local/bin/oauth2-proxy /usr/local/bin/oauth2-proxy
ENTRYPOINT [ "/usr/local/bin/oauth2-proxy" ]
