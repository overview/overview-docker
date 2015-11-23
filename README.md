# Docker image configuration for Overview

This repository is for managing Docker images. If you'd like to _use_ our Docker
images, you should be looking at the [overview-local
repository](https://github.com/overview/overview-local).

To release a new version of Overview, run `./release master`, where `master` is
a tag, branch or sha1 of the [overview-server
repository](https://github.com/overview/overview-server). This will push a new
version of `overview-docker` to GitHub, and Docker Hub will rebuild its `latest`
versions.
