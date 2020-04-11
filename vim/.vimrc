set nocompatible              " required
filetype plugin off            " required

"Search down into subfolders
"provides tab-completion for all file-related tasks
set path+=**
set wildmenu
set wildignore+=build/*
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/saifdotfiles/vim/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'chrisbra/csv.vim'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"Split Defaults
set splitright
set splitbelow



"Other Settings
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

"netrw setup
"mouse enable
"set mouse =a
"hide banner
"let g:netrw_banner=0
"tree listing 
"let g:netrw_liststyle=3
"hide vim swap files
"let g:netrw_list_hide='.*\.swp$'
"Open file on left window
"let g:netrw_chgwin=1
" remap shift-enter to fire up the sidebar
"nnoremap <silent> <S-CR> :rightbelow 20vs<CR>:e .<CR>
" the same remap as above - may be necessary in some distros
"nnoremap <silent> <C-M> :rightbelow 20vs<CR>:e .<CR>
" remap control-enter to open files in new tab
"nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>
" the same remap as above - may be necessary in some distros
"nmap <silent> <NL> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>





