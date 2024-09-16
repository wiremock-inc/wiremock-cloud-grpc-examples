#!/usr/bin/env bash

set -eo pipefail

if [ -z "$WIREMOCK_API_TOKEN" ]; then
  echo "Environment variable WIREMOCK_API_TOKEN must be set with a valid API token"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage $0 <mock API ID> e.g. $0 ek2z9"
  exit 1
fi

mockApiId=$1

mvn generate-sources
curl "https://api.wiremock.cloud/v1/mock-apis/$mockApiId/__admin/ext/grpc/descriptor" \
  -X PUT \
  --data-binary @target/generated-resources/protobuf/descriptor-sets/services.dsc \
  -H 'content-type:application/octet-stream' \
  -H "authorization:Token $WIREMOCK_API_TOKEN"

