#!/bin/sh
#
# Simply execute this script to setup the full toolchain:
#
# curl -sSL https://raw.githubusercontent.com/pramine/ci-tools/master/setup.sh | bash -s
#
# Prerequisites:
# - Docker & Docker Toolbox v1.12.3
# - Git v2.6.4

echo "Create docker machine"
docker-machine create -d virtualbox --virtualbox-memory "6000" ci-tools

echo "Setup environment"
eval $(docker-machine env ci-tools)

echo "Checkout Git Repository"
git clone git@github.com:pramine/ci-tools.git
cd ci-tools

echo "Startup Docker Compose"
docker-compose up
