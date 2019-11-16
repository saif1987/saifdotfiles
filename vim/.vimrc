set nocompatible              " required
filetype plugin on            " required

"Search down into subfolders
"provides tab-completion for all file-related tasks
set path+=**
set wildmenu

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/saifdotfiles/vim/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set rnu 
filetype indent on
set autoindent
set tags=tags

set clipboard=unnamed



let python_highlight_all = 1

" CreateTags
command! MakeTags !ctags -R
command! MakeCppTags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . 
