""" Optixal's Neovim Init.vim
".vimrc
"Author: Md Saifuddin <md.saif05@gmail.com>
"Source: http://github.com/saif1987/saifdotfiles
"Many Functions are from https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc]
"Some Vimrc to look into: nickjj/dotfiles/blob/master/.vimrc


"
"
"  PLUGIN settings:{{{  
let vimplug_exists = expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif
"
"

""" Vim-Plug
call plug#begin()

" Core (treesitter, nvim-lspconfig, nvim-cmp, nvim-telescope, nvim-lualine)
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mfussenegger/nvim-dap'
Plug 'Shatur/neovim-cmake'
" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'chrisbra/Colorizer'
Plug 'KabbAmine/vCoolor.vim'
Plug 'dkarter/bullets.vim'
Plug 'wellle/context.vim'
Plug 'antoinemadec/FixCursorHold.nvim'

" Functionalities - Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'heavenshell/vim-pydocstring'

" Aesthetics - Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'zaki/zazen'
Plug 'yuttie/hydrangea-vim'

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-journal'

call plug#end()







"}}}



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


" LeaderKey and execution key{{{
let mapleader = "\<space>"
let maplocalleader = "\<space>"
"Increase timeoutlen when <Leader> is pressed
" Only one of these lines is needed.  I am not sure which is most recommended.
"nmap <silent> <Leader> :<C-U>set timeoutlen=99999 ttimeoutlen=99999<CR><Leader>

nnoremap <silent> <Leader> :<C-U>set timeoutlen=99999 ttimeoutlen=99999<CR>:call feedkeys('<Leader>')<CR>

" Reset timeoutline to normal soon afterwards
autocmd CursorMoved * set timeoutlen=2000 ttimeoutlen=0
" Change execution key from : to ;
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
"}}}


"Clipboard related {{{
set clipboard=unnamed
"}}}

" colorscheme set{{{
"set t_Co=256
"syntax on
"colorscheme gruvbox
"set background=dark    " Setting dark mode
"let python_highlight_all = 1
"
"---Other Setup

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

" Use these colors for Pmenu, CmpPmenusBorder and TelescopeBorder when using dracula colorscheme
function! DraculaTweaks()
    " Pmenu colors when not using bordered windows
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
    " Completion/documentation Pmenu border color when using bordered windows
    highlight link CmpPmenuBorder NonText
    " Telescope borders
    highlight link TelescopeBorder Constant
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaTweaks()
    "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

color dracula
set termguicolors

""" Core plugin configuration (vim)

" Treesitter
augroup DraculaTreesitterSourcingFix
    autocmd!
    autocmd ColorScheme dracula runtime after/plugin/dracula.vim
    syntax on
augroup end

"
"
"}}}

" Tag and Tagbar setup{{{

" CreateTags

set tags=tags
command! MakeTags !ctags -R
command! MakeCppTags !ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --exclude=build --exclude=src/lte --exclude=src/uan --exclude='./waf*'

" Add Tagbar hotkey to Leader g
 noremap <silent> <Leader>g :TagbarToggle<CR>

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



"}}}

"Folding Setup {{{ 
set foldmethod=marker
" Space to toggle folds.
nnoremap <Leader>z za
vnoremap <Leader>z za
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

" Search and Replace and movement -------------------------------------------------- {{{

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
" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>ra :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>ra :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>


"map <tab> %
"silent! unmap [%
"silent! unmap ]%

" Made D behave
nnoremap D d$
"This part I took Just because its convincing
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
"
"Try to use fzf for last search

"Open FZF file open remap
"nnoremap <Leader>f :Files<CR>
"nnoremap <Leader>b  :Buffers<CR>
"nnoremap <Leader>h  :History<CR>
"nnoremap <Leader>l  :BLines<CR>
"nnoremap <Leader>L :Lines<CR>
"nnoremap <Leader>' :Marks<CR>
"nnoremap <Leader>t  :BTags<CR>
"nmap <Leader>T :Tags<CR> "I think global tag search can be done by command
"nmap <Leader>T :call fzf#vim#tags({'options': '-q'.shellescape(expand('<cword>'))})<CR>
"nnoremap <silent><Leader>T :Tags <C-R>=expand("<cword>")<CR><CR>


" Telescope mappings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>h <cmd>Telescope oldfiles<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>t <cmd>Telescope current_buffer_tags<cr>
nnoremap <leader>T <cmd>Telescope tags<cr>
nnoremap <leader>' <cmd>Telescope marks<cr>
nnoremap <leader>cc <cmd>Telescope colorscheme<cr>
nnoremap <leader>l <cmd>Telescope current_buffer_fuzzy_find<cr>


"}}}


"Autocomplete setup{{{
"-------------------------------------------------------------------
set completeopt=menuone,longest
set shortmess+=c

"" nvim-cmp  -- another setup
"set completeopt=menu,menuone,noselect
"
"For clang_complete
"
 " let g:clang_library_path='/usr/lib/llvm-10/lib/libclang-10.so.1'






"}}}
"Commenting Setup {{{
autocmd FileType cpp set commentstring=//\ %s
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


"wrap related Settings{{{
" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"}}}
"Window navigation {{{
" Navigate around splits with a single key combo.
nnoremap gl <C-w><C-l>
nnoremap gh <C-w><C-h>
nnoremap gk <C-w><C-k>
nnoremap gj <C-w><C-j>
"}}}
"Insert mode navigation{{{
"inoremap <C-l> <C-O>gl
"inoremap <C-h> <C-O>gh
"inoremap <C-k> <C-O>gk
"inoremap <C-j> <C-O>gj
" }}} 

""" Filetype-Specific Configurations {{{

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

"}}}

""" Unused **** {{{
"""" Main Configurations
"filetype plugin indent on
"set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
"set incsearch ignorecase smartcase hlsearch
"set wildmode=longest,list,full wildmenu
"set ruler laststatus=2 showcmd showmode
"set list listchars=trail:»,tab:»-
"set fillchars+=vert:\ 
"set wrap breakindent
"set encoding=utf-8
"set textwidth=0
"set hidden
"set number
"set title
"
"""" Core plugin configuration (lua)
"lua << EOF
"servers = {
"    'pyright',
"    --'tsserver', -- uncomment for typescript. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for other language servers
"}
"require('treesitter-config')
"require('nvim-cmp-config')
"require('lspconfig-config')
"require('telescope-config')
"require('lualine-config')
"require('nvim-tree-config')
"require('diagnostics')
"EOF


"" signify
"let g:signify_sign_add = '│'
"let g:signify_sign_delete = '│'
"let g:signify_sign_change = '│'
"hi DiffDelete guifg=#ff5555 guibg=none
"
"" indentLine
"let g:indentLine_char = '▏'
"let g:indentLine_defaultGroup = 'NonText'
"" Disable indentLine from concealing json and markdown syntax (e.g. ```)
"let g:vim_json_syntax_conceal = 0
"let g:vim_markdown_conceal = 0
"let g:vim_markdown_conceal_code_blocks = 0
"
"" FixCursorHold for better performance
"let g:cursorhold_updatetime = 100
"
"" context.vim
"let g:context_nvim_no_redraw = 1
"
"" Neovim :Terminal
"tmap <Esc> <C-\><C-n>
"tmap <C-w> <Esc><C-w>
""tmap <C-d> <Esc>:q<CR>
"autocmd BufWinEnter,WinEnter term://* startinsert
"autocmd BufLeave term://* stopinsert
"
"" Python
"let g:python3_host_prog = '~/.config/nvim/env/bin/python3'
"let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'
"
"""" Custom Functions
"
"" Trim Whitespaces
"function! TrimWhitespace()
"    let l:save = winsaveview()
"    %s/\\\@<!\s\+$//e
"    call winrestview(l:save)
"endfunction
"
"""" Custom Mappings (vim) (lua custom mappings are within individual lua config files)
"
"" Core
"let mapleader=","
"nmap <leader>q :NvimTreeFindFileToggle<CR>
"nmap \ <leader>q
"nmap <leader>r :so ~/.config/nvim/init.vim<CR>
"nmap <leader>t :call TrimWhitespace()<CR>
"xmap <leader>a gaip*
"nmap <leader>a gaip*
"nmap <leader>h :RainbowParentheses!!<CR>
"nmap <leader>j :set filetype=journal<CR>
"nmap <leader>k :ColorToggle<CR>
"nmap <leader>l :Limelight!!<CR>
"xmap <leader>l :Limelight!!<CR>
"nmap <silent> <leader><leader> :noh<CR>
"nmap <Tab> :bnext<CR>
"nmap <S-Tab> :bprevious<CR>
"nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
"nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
"
"" Python
"autocmd Filetype python nmap <leader>d <Plug>(pydocstring)
"autocmd FileType python nmap <leader>p :Black<CR>
"
"" Solidity (requires: npm install --save-dev prettier prettier-plugin-solidity)
"autocmd Filetype solidity nmap <leader>p :0,$!npx prettier %<CR>
"
"}}} 

