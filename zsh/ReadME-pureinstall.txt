git clone https://github.com/sindresorhus/pure && \
ln -s pure/pure.zsh-theme . && \
ln -s pure/async.zsh . 
 
 # Change in ~/.zshrc the ZSH_THEME to ZSH_THEME=refined
#For Zsh Custom Plugins Clone from Git

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
