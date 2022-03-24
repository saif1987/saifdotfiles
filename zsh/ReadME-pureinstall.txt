#clone ohmyzsh
ZSH="$HOME/saifdotfiles/zsh/.oh-my-zsh" sh install.sh
#git clone https://github.com/sindresorhus/pure && \
#ln -s pure/pure.zsh-theme . && \
#ln -s pure/async.zsh . 
 
 # Change in ~/.zshrc the ZSH_THEME to ZSH_THEME=refined
#For Zsh Custom Plugins Clone from Git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosugges;wtions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
