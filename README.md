### Note for mac users

Make sure GNU coreutils are installed. This can be done using [brew](https://brew.sh/):

```sh
brew install coreutils
```

# `gitconfig`

This repo has a `gitconfig` make target. It creates a symlink `~/.gitconfig` that points to the included `.gitconfig` (If a gitconfig already exists, it's renamed to `.gitconfig.bckup` so a rollback is possible if necessary.). The `.gitconfig` has no user block and includes it from the `gituser` directory. You can add additional configs for specific directories using the commented out `includeIf` block. 

> Note: `gituser/work` is in `.gitignore`. 

# Usage

> Note: Have `zsh`, `zip` and `unzip` installed.


Clone this repo into `~/src/`. (The `gitconfig` make target assumes this. If you choose to deviate, edit `gitconfig.sh` and `.gitconfig`'s includes accordingly.)

```
make install-omz
``` 

It will install [Oh My Zsh](https://ohmyz.sh/). If you weren't already using zsh, log out and log back in for the shell change to take effect. After that is done run 

```
make setup
```

This will set Oh my zsh's theme to `bira`, add aliases and environment variables, set `gitconfig` and install `sdkman`.

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

# TODO

- [x] clean up `add-aliases-and-vars.sh`
- [ ] `help` make target
