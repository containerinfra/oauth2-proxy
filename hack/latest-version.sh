#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/oauth2-proxy/oauth2-proxy/tags?per_page=1" | # Get latest release from GitHub api
    grep '"name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}


version=$(get_latest_release "oauth2-proxy/oauth2-proxy")

echo $version
