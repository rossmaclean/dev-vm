# Dev VM
This repository contains the Dockerfile for an image to be used as a local development environment.

It installs several tools and programming languages.

# Running
To run the container, simply type:
`docker run -it rossmaclean/dev-vm`

# Todo
Some things which are still in progress:
- Install AstroNvim plugins/lsp/debuggers etc automatically
    - Likely through modifying the AstroNvim config

## AstroNvim
Until the relevant todo items are complete, the following must be run manually in AstroNvim
- Python
    - :LspInstall pyright
    - :TSInstall python
    - :DapInstall python

- :Packerclean
- :PackerSync
