FROM            ubuntu:18.04

MAINTAINER      Talisto <https://github.com/talisto>

RUN             apt-get update \
                && apt-get install -y curl software-properties-common \
                && curl -fsSL https://facebook.github.io/mcrouter/debrepo/bionic/PUBLIC.KEY | apt-key add \
                && echo "deb https://facebook.github.io/mcrouter/debrepo/bionic bionic contrib" >> /etc/apt/sources.list \
                && apt-get update \
                && apt-get install -y mcrouter \
                && rm -rf /var/lib/apt/lists/*

ENTRYPOINT      [ "mcrouter" ]
CMD             [ "--help" ]
