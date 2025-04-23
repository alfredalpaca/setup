install-omz:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

THEME=bira
omz-theme:
	@echo "Updating ZSH_THEME in .zshrc to '$(THEME)'"
	@./utils/find-and-replace-in-file.sh "$(HOME)/.zshrc" 's/^ZSH_THEME=".*"/ZSH_THEME="$(THEME)"/'

# install-sdkman:
# 	curl -s "https://get.sdkman.io" | bash
# 	source "$(HOME)/.sdkman/bin/sdkman-init.sh"

aliases-and-env-vars:
	shell/add-aliases-and-vars.sh

gitconfig:
	./gitconfig.sh

setup-base: omz-theme aliases-and-env-vars
