# WireMock Cloud gRPC examples

This project demonstrates an automated workflow for pushing a gRPC API definition into WireMock Cloud so that it can be mocked.

## Building with Maven

The example in the `maven` directory does the following: 
* Build the set of .proto files under `src/main/proto` into a descriptor file.
* Push this into a specific WireMock Cloud mock API via the WireMock Cloud's API. The API ID is determined from the `MOCK_API_ID` env var.

A [GitHub Actions workflow](.github/workflows/maven-build-and-push.yml) does this on each push to `main`.


## Building directly with protoc

The example in the `protoc` directory does the following:
* Build the set of .proto files under `proto` into the descriptor file `build/services.dsc`.
* Push this into a specific WireMock Cloud mock API via the WireMock Cloud's API. The API ID is determined from the `MOCK_API_ID` env var.
