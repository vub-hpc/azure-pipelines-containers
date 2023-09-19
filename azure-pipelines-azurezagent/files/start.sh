#!/bin/bash
set -e

export AGENT_ALLOW_RUNASROOT="1"

print_header() {
  lightcyan='\033[1;36m'
  nocolor='\033[0m'
  echo -e "${lightcyan}$1${nocolor}"
}

source ./env.sh

print_header "Running Azure Pipelines agent..."

trap 'exit 0' EXIT
trap 'exit 130' INT
trap 'exit 143' TERM

# copy the config files and credentials in workdir
cp /mnt/config/.agent ./
cp /mnt/config/.credentials ./
cp /mnt/config/.credentials_rsaparams ./
cp /mnt/config/.env ./
cp /mnt/config/.path ./
cp /mnt/config/license.html ./

chmod +x ./run.sh

# To be aware of TERM and INT signals call run.sh
# Running it with the --once flag at the end will shut down the agent after the build is executed
./run.sh "$@" & wait $!
