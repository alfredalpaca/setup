# Shell

## Workflow

`shell/aliases` and `shell/env-vars` have general purpose aliases and environment variables that I use in all of my systems. Secret environment variables (like credentials and tokens) go in `shell/env-vars/secret-vars.sh`. For aliases that you dont want tracked by git, simply put the sh file in `shell/aliases/work/`.

Note: `shell/aliases/work/` and `secret-vars.sh` are in `.gitignore` so any sh files in the work dir or environment variables in `secret-vars.sh` file will not be tracked by git.

## Usage

Simply clone this repo and run the setup make target. `shell/add-aliases-and-vars.sh` assumes the shell is zsh and tries to write to .zshrc. If the shell is different, change the `RC_FILE` variable accordingly before running the script.


# Gitconfig

The setup target also runs the `gitconfig` target which runs the `gitconfig.sh` script. This script copies the gitconfig in this repo to `$HOME`. If a gitconfig already exists, its renamed to `.gitconfig.bckup` so a rollback is possible if necessary.
