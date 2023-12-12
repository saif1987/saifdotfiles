### Before Starting to use vim and zh

1. Install vim and zsh ( and autojump and fzf)

2. Initialize home directory dot files for vim and zsh 

```
echo "source $HOME/saifdotfiles/vim/.vimrc" >> ~/.vimrc
echo "source $HOME/saifdotfiles/zsh/.zshrc" >> ~/.zshrc
```

3. Update submodules for this repo

```
git submodule init
git submodule update
```

4. run zsh to initialize zsh environment variables.

5. clone two custom plugins.

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
```


6.   open vim and insert command (; is the :) 

```
:PluginInstall
```

7. make zsh your default shell

```
chsh -s $(which zsh)

```
