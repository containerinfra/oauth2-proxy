# Docker oauth2-proxy

Docker image build for [oauth2-proxy](https://oauth2-proxy.github.io/oauth2-proxy/), using distroless as a base image instead of alpine.

[![Docker hub](https://img.shields.io/docker/pulls/containerinfra/oauth2-proxy.svg)](https://hub.docker.com/r/containerinfra/oauth2-proxy/) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/containerinfra/oauth2-proxy/release)

## Table of Contents

- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Usage

### Images

- docker pull docker.io/containerinfra/oauth2-proxy:7.5.1
- docker pull ghcr.io/containerinfra/oauth2-proxy:7.5.1

### Verify image with cosign

All containerinfra/oauth2-proxy images are signed by [cosign](https://github.com/sigstore/cosign). You can verify these using `cosign verify`:

```bash
cat cosign.pub
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEYpxYmR6qpyer9WJHhSxd91XMx+A+
eQm/6XSWAMDGeH4hrFpvo8Sw0t+xf0PdRSUEXCyKFXve+Q2s8csVo4eAaA==
-----END PUBLIC KEY-----


cosign verify --key cosign.pub docker.io/containerinfra/oauth2-proxy:7.5.1
cosign verify --key cosign.pub ghcr.io/containerinfra/oauth2-proxy:7.5.1
```

### Configuration

See the [oauth2-proxy documentation](https://oauth2-proxy.github.io/oauth2-proxy/docs/).

```bash
Usage of oauth2-proxy:
      --alpha-config string       path to alpha config file (use at your own risk - the structure in this config file may change between minor releases)
      --config string             path to config file
      --convert-config-to-alpha   if true, the proxy will load configuration as normal and convert existing configuration to the alpha config structure, and print it to stdout
      --version                   print version string
Usage of oauth2-proxy:
      --acr-values string                          acr values string:  optional
      --allowed-group strings                      restrict logins to members of this group (may be given multiple times)
      --alpha-config string                        path to alpha config file (use at your own risk - the structure in this config file may change between minor releases)
      --approval-prompt string                     OAuth approval_prompt (default "force")
      --auth-logging                               Log authentication attempts (default true)
      --auth-logging-format string                 Template for authentication log lines (default "{{.Client}} - {{.RequestID}} - {{.Username}} [{{.Timestamp}}] [{{.Status}}] {{.Message}}")
      --authenticated-emails-file string           authenticate against emails via file (one per line)
      --azure-tenant string                        go to a tenant-specific or common (tenant-independent) endpoint. (default "common")
      --banner string                              custom banner string. Use "-" to disable default banner.
      --basic-auth-password string                 the password to set when passing the HTTP Basic Auth header
      --bitbucket-repository string                restrict logins to user with access to this repository
      --bitbucket-team string                      restrict logins to members of this team
      --client-id string                           the OAuth Client ID: ie: "123456.apps.googleusercontent.com"
      --client-secret string                       the OAuth Client Secret
      --client-secret-file string                  the file with OAuth Client Secret
      --config string                              path to config file
      --convert-config-to-alpha                    if true, the proxy will load configuration as normal and convert existing configuration to the alpha config structure, and print it to stdout
      --cookie-domain .yourcompany.com             Optional cookie domains to force cookies to (ie: .yourcompany.com). The longest domain matching the request's host will be used (or the shortest cookie domain if there is no match).
      --cookie-expire duration                     expire timeframe for cookie (default 168h0m0s)
      --cookie-httponly                            set HttpOnly cookie flag (default true)
      --cookie-name string                         the name of the cookie that the oauth_proxy creates (default "_oauth2_proxy")
      --cookie-path string                         an optional cookie path to force cookies to (ie: /poc/)* (default "/")
      --cookie-refresh duration                    refresh the cookie after this duration; 0 to disable
      --cookie-samesite string                     set SameSite cookie attribute (ie: "lax", "strict", "none", or ""). 
      --cookie-secret string                       the seed string for secure cookies (optionally base64 encoded)
      --cookie-secure                              set secure (HTTPS) cookie flag (default true)
      --custom-sign-in-logo string                 path to an custom image for the sign_in page logo. Use "-" to disable default logo.
      --custom-templates-dir string                path to custom html templates
      --display-htpasswd-form                      display username / password login form if an htpasswd file is provided (default true)
      --email-domain strings                       authenticate emails with the specified domain (may be given multiple times). Use * to authenticate any email
      --errors-to-info-log                         Log errors to the standard logging channel instead of stderr
      --exclude-logging-path strings               Exclude logging requests to paths (eg: '/path1,/path2,/path3')
      --extra-jwt-issuers strings                  if skip-jwt-bearer-tokens is set, a list of extra JWT issuer=audience pairs (where the issuer URL has a .well-known/openid-configuration or a .well-known/jwks.json)
      --flush-interval duration                    period between response flushing when streaming responses (default 1s)
      --footer string                              custom footer string. Use "-" to disable default footer.
      --force-https                                force HTTPS redirect for HTTP requests
      --gcp-healthchecks                           Enable GCP/GKE healthcheck endpoints
      --github-org string                          restrict logins to members of this organisation
      --github-repo string                         restrict logins to collaborators of this repository
      --github-team string                         restrict logins to members of this team
      --github-token string                        the token to use when verifying repository collaborators (must have push access to the repository)
      --github-user strings                        allow users with these usernames to login even if they do not belong to the specified org and team or collaborators (may be given multiple times)
      --gitlab-group strings                       restrict logins to members of this group (may be given multiple times)
      --gitlab-project group/project=accesslevel   restrict logins to members of this project (may be given multiple times) (eg group/project=accesslevel). Access level should be a value matching Gitlab access levels (see https://docs.gitlab.com/ee/api/members.html#valid-access-levels), defaulted to 20 if absent
      --google-admin-email string                  the google admin to impersonate for api calls
      --google-group strings                       restrict logins to members of this google group (may be given multiple times).
      --google-service-account-json string         the path to the service account json credentials
      --htpasswd-file string                       additionally authenticate against a htpasswd file. Entries must be created with "htpasswd -B" for bcrypt encryption
      --htpasswd-user-group strings                the groups to be set on sessions for htpasswd users (may be given multiple times)
      --http-address string                        [http://]<addr>:<port> or unix://<path> to listen on for HTTP clients (default "127.0.0.1:4180")
      --https-address string                       <addr>:<port> to listen on for HTTPS clients (default ":443")
      --insecure-oidc-allow-unverified-email       Don't fail if an email address in an id_token is not verified
      --insecure-oidc-skip-issuer-verification     Do not verify if issuer matches OIDC discovery URL
      --insecure-oidc-skip-nonce                   skip verifying the OIDC ID Token's nonce claim (default true)
      --jwt-key string                             private key in PEM format used to sign JWT, so that you can say something like -jwt-key="${OAUTH2_PROXY_JWT_KEY}": required by login.gov
      --jwt-key-file string                        path to the private key file in PEM format used to sign the JWT so that you can say something like -jwt-key-file=/etc/ssl/private/jwt_signing_key.pem: required by login.gov
      --keycloak-group strings                     restrict logins to members of these groups (may be given multiple times)
      --logging-compress                           Should rotated log files be compressed using gzip
      --logging-filename string                    File to log requests to, empty for stdout
      --logging-local-time                         If the time in log files and backup filenames are local or UTC time (default true)
      --logging-max-age int                        Maximum number of days to retain old log files (default 7)
      --logging-max-backups int                    Maximum number of old log files to retain; 0 to disable
      --logging-max-size int                       Maximum size in megabytes of the log file before rotation (default 100)
      --login-url string                           Authentication endpoint
      --metrics-address string                     the address /metrics will be served on (e.g. ":9100")
      --metrics-secure-address string              the address /metrics will be served on for HTTPS clients (e.g. ":9100")
      --metrics-tls-cert-file string               path to certificate file for secure metrics server
      --metrics-tls-key-file string                path to private key file for secure metrics server
      --oidc-email-claim string                    which OIDC claim contains the user's email (default "email")
      --oidc-groups-claim string                   which OIDC claim contains the user groups (default "groups")
      --oidc-issuer-url string                     OpenID Connect issuer URL (ie: https://accounts.google.com)
      --oidc-jwks-url string                       OpenID Connect JWKS URL (ie: https://www.googleapis.com/oauth2/v3/certs)
      --pass-access-token                          pass OAuth access_token to upstream via X-Forwarded-Access-Token header
      --pass-authorization-header                  pass the Authorization Header to upstream
      --pass-basic-auth                            pass HTTP Basic Auth, X-Forwarded-User and X-Forwarded-Email information to upstream (default true)
      --pass-host-header                           pass the request Host Header to upstream (default true)
      --pass-user-headers                          pass X-Forwarded-User and X-Forwarded-Email information to upstream (default true)
      --ping-path string                           the ping endpoint that can be used for basic health checks (default "/ping")
      --ping-user-agent string                     special User-Agent that will be used for basic health checks
      --prefer-email-to-user                       Prefer to use the Email address as the Username when passing information to upstream. Will only use Username if Email is unavailable, eg. htaccess authentication. Used in conjunction with -pass-basic-auth and -pass-user-headers
      --profile-url string                         Profile access endpoint
      --prompt string                              OIDC prompt
      --provider string                            OAuth provider (default "google")
      --provider-ca-file strings                   One or more paths to CA certificates that should be used when connecting to the provider.  If not specified, the default Go trust sources are used instead.
      --provider-display-name string               Provider display name
      --proxy-prefix string                        the url root path that this proxy should be nested under (e.g. /<oauth2>/sign_in) (default "/oauth2")
      --proxy-websockets                           enables WebSocket proxying (default true)
      --pubjwk-url string                          JWK pubkey access endpoint: required by login.gov
      --real-client-ip-header string               Header used to determine the real IP of the client (one of: X-Forwarded-For, X-Real-IP, or X-ProxyUser-IP) (default "X-Real-IP")
      --redeem-url string                          Token redemption endpoint
      --redirect-url string                        the OAuth Redirect URL. ie: "https://internalapp.yourcompany.com/oauth2/callback"
      --redis-ca-path string                       Redis custom CA path
      --redis-cluster-connection-urls strings      List of Redis cluster connection URLs (eg redis://HOST[:PORT]). Used in conjunction with --redis-use-cluster
      --redis-connection-url string                URL of redis server for redis session storage (eg: redis://HOST[:PORT])
      --redis-insecure-skip-tls-verify             Use insecure TLS connection to redis
      --redis-password --redis-connection-url      Redis password. Applicable for all Redis configurations. Will override any password set in --redis-connection-url
      --redis-sentinel-connection-urls strings     List of Redis sentinel connection URLs (eg redis://HOST[:PORT]). Used in conjunction with --redis-use-sentinel
      --redis-sentinel-master-name string          Redis sentinel master name. Used in conjunction with --redis-use-sentinel
      --redis-sentinel-password --redis-password   Redis sentinel password. Used only for sentinel connection; any redis node passwords need to use --redis-password
      --redis-use-cluster                          Connect to redis cluster. Must set --redis-cluster-connection-urls to use this feature
      --redis-use-sentinel                         Connect to redis via sentinels. Must set --redis-sentinel-master-name and --redis-sentinel-connection-urls to use this feature
      --request-id-header string                   Request header to use as the request ID (default "X-Request-Id")
      --request-logging                            Log HTTP requests (default true)
      --request-logging-format string              Template for HTTP request log lines (default "{{.Client}} - {{.RequestID}} - {{.Username}} [{{.Timestamp}}] {{.Host}} {{.RequestMethod}} {{.Upstream}} {{.RequestURI}} {{.Protocol}} {{.UserAgent}} {{.StatusCode}} {{.ResponseSize}} {{.RequestDuration}}")
      --resource string                            The resource that is protected (Azure AD only)
      --reverse-proxy                              are we running behind a reverse proxy, controls whether headers like X-Real-Ip are accepted
      --scope string                               OAuth scope specification
      --session-cookie-minimal                     strip OAuth tokens from cookie session stores if they aren't needed (cookie session store only)
      --session-store-type string                  the session storage provider to use (default "cookie")
      --set-authorization-header                   set Authorization response headers (useful in Nginx auth_request mode)
      --set-basic-auth                             set HTTP Basic Auth information in response (useful in Nginx auth_request mode)
      --set-xauthrequest                           set X-Auth-Request-User and X-Auth-Request-Email response headers (useful in Nginx auth_request mode)
      --show-debug-on-error                        show detailed error information on error pages (WARNING: this may contain sensitive information - do not use in production)
      --signature-key string                       GAP-Signature request signature key (algorithm:secretkey)
      --silence-ping-logging                       Disable logging of requests to ping endpoint
      --skip-auth-preflight                        will skip authentication for OPTIONS requests
      --skip-auth-regex strings                    (DEPRECATED for --skip-auth-route) bypass authentication for requests path's that match (may be given multiple times)
      --skip-auth-route strings                    bypass authentication for requests that match the method & path. Format: method=path_regex OR path_regex alone for all methods
      --skip-auth-strip-headers                    strips X-Forwarded-* style authentication headers & Authorization header if they would be set by oauth2-proxy (default true)
      --skip-jwt-bearer-tokens                     will skip requests that have verified JWT bearer tokens (default false)
      --skip-oidc-discovery                        Skip OIDC discovery and use manually supplied Endpoints
      --skip-provider-button                       will skip sign-in-page to directly reach the next step: oauth/start
      --ssl-insecure-skip-verify                   skip validation of certificates presented when using HTTPS providers
      --ssl-upstream-insecure-skip-verify          skip validation of certificates presented when using HTTPS upstreams
      --standard-logging                           Log standard runtime information (default true)
      --standard-logging-format string             Template for standard log lines (default "[{{.Timestamp}}] [{{.File}}] {{.Message}}")
      --tls-cert-file string                       path to certificate file
      --tls-key-file string                        path to private key file
      --trusted-ip strings                         list of IPs or CIDR ranges to allow to bypass authentication. WARNING: trusting by IP has inherent security flaws, read the configuration documentation for more information.
      --upstream strings                           the http url(s) of the upstream endpoint, file:// paths for static files or static://<status_code> for static response. Routing is based on the path
      --user-id-claim oidc-email-claim             (DEPRECATED for oidc-email-claim) which claim contains the user ID (default "email")
      --validate-url string                        Access token validation endpoint
      --version                                    print version string
      --whitelist-domain strings                   allowed domains for redirection after authentication. Prefix domain with a . to allow subdomains (eg .example.com)
```

## Automated build

This image is build at least once a month automatically.

## Contribute

PRs accepted. All issues should be reported in the [Github issue tracker](https://github.com/containerinfra/oauth2-proxy/issues).

## License

[MIT © ContainerInfra](LICENSE)
