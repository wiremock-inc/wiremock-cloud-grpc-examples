#!/usr/bin/env bash

set -eo pipefail

if [ -z "$WIREMOCK_API_TOKEN" ]; then
  echo "Environment variable WIREMOCK_API_TOKEN must be set with a valid API token"
  exit 1
fi

if [ -z "$MOCK_API_ID" ]; then
  echo "Environment variable MOCK_API_ID must be set with the target API's ID string e.g. ek2z9"
  exit 1
fi

mvn generate-sources
curl "https://api.wiremock.cloud/v1/mock-apis/$MOCK_API_ID/__admin/ext/grpc/descriptor" \
  -X PUT \
  --data-binary @target/generated-resources/protobuf/descriptor-sets/services.dsc \
  -H 'content-type:application/octet-stream' \
  -H "authorization:Token $WIREMOCK_API_TOKEN"

