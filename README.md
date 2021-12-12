# Usage

> Note: Have `zsh`, `zip` and `unzip` installed.

Simply clone this repo and run the `setup` make target. It will install [Oh My Zsh](https://ohmyz.sh/), set its theme to `bira`, add aliases and environment variables and install `sdkman`.

# Shell

## Oh my zsh

The `install-omz` make target basically runs the command from Oh My Zsh's site. The `omz-theme` make target modifies .zshrc and sets the theme to bira. If you want to set another theme, simply run: 
```
make omz-theme THEME=yourFavouriteThemeNameHere
```

## Aliases and environment variables

`shell/add-aliases-and-vars.sh` assumes the shell is zsh and tries to write to .zshrc. If the shell is different, change the `RC_FILE` variable accordingly before running the script.

### Workflow

`shell/aliases` and `shell/env-vars` have general purpose aliases and environment variables that I use in all of my systems. Secret environment variables (like credentials and tokens) go in `shell/env-vars/secret-vars.sh`. For aliases that you dont want tracked by git, simply put the sh file in `shell/aliases/work/`.

> Note 1: `shell/aliases/work/` and `secret-vars.sh` are in `.gitignore` so any sh files in the work dir or environment variables in `secret-vars.sh` file will not be tracked by git.

> Note 2: Remember to rerun `make aliases-and-env-vars` when you add a alias or env var sh file

# Gitconfig

The setup target also runs the `gitconfig` target which runs the `gitconfig.sh` script. This script copies the gitconfig in this repo to `$HOME`. If a gitconfig already exists, its renamed to `.gitconfig.bckup` so a rollback is possible if necessary.

Note: This gitconfig expects the `[user]` block to be defined in `$HOME/.config/gitconfig/personal`

# TODO

- [] clean up `add-aliases-and-vars.sh`
- [] `help` make target
