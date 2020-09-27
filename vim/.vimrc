set nocompatible              " be iMproved, required
filetype off                  " required

"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'
Plugin 'ajh17/VimCompletesMe'
Plugin 'tpope/vim-endwise'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chrisbra/csv.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

:au FocusLost * :wa                   " Autosave when lose focus
set colorcolumn=81                    " Set color column to 81 characters
:hi ColorColumn guibg=#30323e         " Set color of colorcolumn
:colorscheme  onedark                 " Set color scheme for syntax
set hlsearch                          " Highlight words on search
set laststatus=2                      " Setup for lightline
set noshowmode                        " Don't show --insert
set number                            " Set line numbers
filetype plugin indent on             " Make vim indent 2 spaces
set softtabstop=2
set shiftwidth=2                      " Show existing tab with 2 spaces width
set tabstop=2                         " When indenting with '>', use 2 spaces width
set expandtab                         " On pressing tab, insert 2 spaces
set autowrite
syntax on

let g:onedark_terminal_italic = 1     " Use italics
let g:airline_theme='onedark'
let g:ctrlp_show_hidden = 1           " Show hidden files in Ctrl-P

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }
let g:ackprg = 'ag --nogroup --nocolor --column'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" use F5 to delete trailing white spaces
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" automatically remove whitespace when file is saved
autocmd BufWritePre * %s/\s\+$//e

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799
"Based on Vim patch 7.4.1770 (`guicolors` option) "
if (has("termguicolors"))
    set termguicolors
endif

" Map leader
let mapleader = ","

"Copy and paste to universal clipoard
vmap <space>y "+y
map <space>p "+p

" Copy to system clipboard
map <leader>y "*y

" Add/delete quotes around word
nnoremap <Leader>q" ciW""<Esc>P
nnoremap <Leader>q' ciW''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" RSpec.vim mappings
map <Leader>rs :call RunCurrentSpecFile()<CR>

" Rubocop configs
let g:vimrubocop_config = "~/Code/q-centrix/hound/config/style_guides/ruby.yml"
map <Leader>r :RuboCop<CR>

" Tabularize mappings
nmap <Leader>a= :Tab /=/l1l1<CR>
vmap <Leader>a= :Tab /=/l1l1<CR>
nmap <Leader>a: :Tab /:\zs/l0l1<CR>
vmap <Leader>a: :Tab /:\zs/l0l1<CR>
nmap <Leader>a{ :Tab /)\s*\zs{/<CR>
vmap <Leader>a{ :Tab /)\s*\zs{/<CR>

" insert pry
map <Leader>p irequire 'pry'; binding.pry<ESC>

" nerdcommenter settings
" <leader>c :Space
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

