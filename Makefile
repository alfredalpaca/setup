install-omz:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

THEME=bira
omz-theme:
	cat .zshrc > $(HOME)/.zshrc

install-sdkman:
	curl -s "https://get.sdkman.io" | bash
	source "$(HOME)/.sdkman/bin/sdkman-init.sh"

aliases-and-env-vars:
	shell/add-aliases-and-vars.sh

gitconfig:
	./gitconfig.sh

setup: omz-theme aliases-and-env-vars gitconfig install-sdkman