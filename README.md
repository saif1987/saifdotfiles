### Before Starting to use vim and zh

1. Install vim and zsh

2. 

echo "source $HOME/saifdotfiles/vim/.vimrc" >> .vimrc
echo "source $HOME/saifdotfiles/zsh/.zshrc" >> .zshrc

3. Update submodules

git submodule init
git submodule update

4. run zsh to initialize zsh environment variables.

5. clone two custom plugins.

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosugges;wtions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

6.   open vim and insert command (; is the :) 

	:PluginInstall

