FROM centos:8 as build

ARG OAUTH2_PROXY_VERSION=v7.9.0
ARG TARGETARCH

RUN curl -L -O https://github.com/oauth2-proxy/oauth2-proxy/releases/download/${OAUTH2_PROXY_VERSION}/oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-${TARGETARCH}.tar.gz \
    \
    && tar -zxvf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-${TARGETARCH}.tar.gz  \
    \
    && mv oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-${TARGETARCH}/oauth2-proxy /usr/local/bin/oauth2-proxy \
    && rm -rf oauth2-proxy-${OAUTH2_PROXY_VERSION}.linux-${TARGETARCH}.tar.gz

RUN touch /jwt_signing_key.pem

# Resulting image
FROM gcr.io/distroless/static 
COPY --from=build /jwt_signing_key.pem /etc/ssl/private/jwt_signing_key.pem
COPY --from=build /usr/local/bin/oauth2-proxy /usr/local/bin/oauth2-proxy
ENTRYPOINT [ "/usr/local/bin/oauth2-proxy" ]
