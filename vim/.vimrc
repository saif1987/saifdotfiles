".vimrc
"Author: Md Saifuddin <md.saif05@gmail.com>
"Source: http://github.com/saif1987/saifdotfiles
"

"Primary Setup {{{
set nocompatible              " required
filetype plugin off            " required later put plugin indent on
set nowrap                     " 
"}}}
"Basic Settings {{{
syntax enable
set encoding=utf-8             "For weird font characters
set modeline
set modelines=0                 "If nonzero allows file specific vim setup
set visualbell  "stops annoying sound for warning
set cursorline 
set ttyfast     "faster copy paste using mouse
set ruler       "Shows cursor position in number
set backspace=indent,eol,start
set laststatus=2 " Always shows current buffer name
"set history=10000
"set undofile
"set undoreload=10000
"set cpoptions+=J  "This options are important for general usecase
set list 
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set shell=/bin/bash
set lazyredraw              "while running macro dont draw instantly
"Split Defaults
set splitright
set splitbelow

set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set diffopt+=vertical

"}}}
"" Cursorline Show Only Focused Window {{{
" Only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" Wild Menu Completions{{{
"Search down into subfolders 
"provides tab-completion for all file-related tasks
set path+=**
set wildmenu
set wildignore+=build/*
"}}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
"LineNumber related settings{{{
set rnu         "relative numbering
set nu          "show current line number
"}}}
" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2020, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" PLUGIN settings:{{{
"set the runtime path to include Vundle and initialize
set rtp+=$HOME/saifdotfiles/vim/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"
" add to .vimrc
Plugin 'flazz/vim-colorschemes'

"
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'chrisbra/csv.vim'


" fzf plugin
"
"
"
Plugin 'junegunn/fzf' ", { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'


"Plugin for enhancedd % matches
Plugin 'tmhedberg/matchit'
"
"" ...
"Plugin 'Valloric/YouCompleteMe'


"For switching betwen .c and .h
Plugin 'derekwyatt/vim-fswitch'
"Plugin 'lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"}}}
" LeaderKey{{{
let mapleader = ","
let maplocalleader = "\\"
"}}}



set clipboard=unnamed


" colorscheme set{{{
set t_Co=256
syntax on
colorscheme gruvbox
set background=dark    " Setting dark mode
let python_highlight_all = 1
"}}}
" CreateTags{{{
set tags=tags
command! MakeTags !ctags -R
command! MakeCppTags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q . 
"}}}
"netrw setup{{{
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
"}}}
"Folding Setup {{{
set foldmethod=marker
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a bit (25 lines) down from the top of the screen.
" 4. Pulse the cursor line.  My eyes are bad. /saif I disabled this part for now
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
function! FocusLine()
    let oldscrolloff = &scrolloff
    set scrolloff=0
    execute "keepjumps normal! mzzMzvzt25\<c-y>`z:Pulse\<cr>"
    let &scrolloff = oldscrolloff
endfunction
nnoremap <c-z> :call FocusLine()<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return '[+]' . line . '…' . repeat(" ",fillcharcount-4) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()



"}}}
" Searching and movement -------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"set gdefault   "substitues globally w/o /g. and g makes one sub. I disabled it.
set scrolloff=5
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block      "lets place cursor anywhere in visual mode

"leader <,> and Space for clear matches
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

"map <tab> %
"silent! unmap [%
"silent! unmap ]%

" Made D behave
nnoremap D d$

" Jumping to tags.
"
" Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
" split instead.
"
" Both of them will align the destination line to the upper middle part of the
" screen.  Both will pulse the cursor line so you can see where the hell you
" are.  <c-\> will also fold everything in the buffer and then unfold just
" enough for you to see the destination line.
"
function! JumpTo(jumpcommand)
    execute a:jumpcommand
    call FocusLine()
    Pulse
endfunction
function! JumpToInSplit(jumpcommand)
    execute "normal! \<c-w>v"
    execute a:jumpcommand
    Pulse
endfunction


""Trying to make it better
"function! JumpToTag2()
"  " try to find a word under the cursor
"  let current_word = expand("<cword>")
"
"  " check if there is one
"  if current_word == ''
"    echomsg "No word under the cursor"
"    return
"  endif
"
"  " find all tags for the given word
"  let tags = taglist('^'.current_word.'$')
"
"  " if no tags are found, bail out
"  if empty(tags)
"    echomsg "No tags found for: ".current_word
"    return
"  endif
"
"  " take the first tag, or implement some more complicated logic here
"  let selected_tag = tags[0]
"  echo selected_tag.filename
""  let spfilename = split(selected_tag.filename,".")
""  echo len(spfilename) 
" " let tag0ftype = expand(selected_tag.filename.':e') "spfilename[len(spfilename)-1]
"  echo "Expand"+expand(selected_tag.filename)
" " echo "FileType: "+tag0ftype
" " if tag0ftype=="h"
" "       for tgi in tags
" "       	let spfilename = split(tgi.filename,".")
" "       	let tagiftype = spfilename[len(spfilename)-1]
" "       	if (tagiftype==?"c")|(tagiftype==?"cc")
" "       		selected_tag = tgi
" "       		break
" "       	endif
" "       
" "       endfor
" " endif
"  echomsg "Openning file "+selected_tag.filename
""split("one,two,three", ",")
"  " edit the relevant file, jump to the tag's position
"  exe 'edit '.selected_tag.filename
"  exe selected_tag.cmd
"endfunction



function! JumpToTag()
    echo "Called JumpToTag"
    "return
    call JumpTo("normal! \<c-]>")
endfunction
function! JumpToTagInSplit()
    call JumpToInSplit("normal! \<c-]>")
endfunction

""nnoremap <c-]> :silent! call JumpToTag()<cr>
""nnoremap <c-\> :silent! call JumpToTagInSplit()<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

"This part I took Just because its convincing
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

"Try to use fzf for last search



"Open FZF file open remap
nnoremap <C-p> :Files<Cr>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>t :BTags<CR>
"nmap <Leader>T :Tags<CR> "I think global tag search can be done by command
"nmap <Leader>T :call fzf#vim#tags({'options': '-q'.shellescape(expand('<cword>'))})<CR>
nnoremap <silent><Leader>T :Tags <C-R>=expand("<cword>")<CR><CR>

"}}}


" Pulse Line  {{{

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

" }}}


"Many Functions are from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc]
