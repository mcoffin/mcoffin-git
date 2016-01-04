# mcoffin-gitconfig

Matt Coffin's [git](https://git-scm.com/) configuration.

## Installation

To install, simply run `install.sh` from the root of the project. It will install all files starting with `.git` from the project (except for `.gitignore`) to your home directory as symlinks. It **will not** overwrite existing files, and will just continue to attempt to create as many of the symlinks as it can.

To combat this, please remove all of the `.git(.*)` files from your home directory that you would like to be overwritten with those from the project.
