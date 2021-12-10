aliases-and-env-vars:
	shell/add-aliases-and-vars.sh

gitconfig:
	./gitconfig.sh
	echo "copied gitconfig. gitconfig.bckup is in homedir"

setup: aliases-and-env-vars gitconfig