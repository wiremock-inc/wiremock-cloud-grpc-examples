# WireMock Cloud gRPC examples

This project demonstrates an automated workflow for pushing a gRPC API definition into WireMock Cloud so that it can be mocked.

Currently, the only example uses Maven, and does the following: 
* Build the set of .proto files under `src/main/proto` into a descriptor file.
* Push this into a specific WireMock Cloud mock API via the WireMock Cloud's API.

A [GitHub Actions workflow](.github/workflows/maven-build-and-push.yml) does this on each push to `main`.