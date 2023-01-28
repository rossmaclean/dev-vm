# Dev VM
This repository contains the Dockerfile for an image to be used as a local development environment.

It installs several tools and programming languages.

# Running
To run the container, simply type:
`docker run -it rossmaclean/dev-vm`

# Todo
Some things which are still in progress:
- Install nvim plugins/lsp/debuggers etc automatically
    - Likely through modifying the nvim config