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

mkdir -p build
protoc --descriptor_set_out=build/services.dsc --include_imports --include_source_info --proto_path=proto proto/*.proto

curl "https://api.wiremock.cloud/v1/mock-apis/$MOCK_API_ID/__admin/ext/grpc/descriptor" \
  -X PUT \
  --data-binary @build/services.dsc \
  -H 'content-type:application/octet-stream' \
  -H "authorization:Token $WIREMOCK_API_TOKEN"

