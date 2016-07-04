set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

execute pathogen#infect()
filetype plugin on
syntax on
filetype plugin indent on
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set showmatch
set ruler
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set runtimepath^=~/.vim/bundle/ctrlp.vim

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

syntax enable
colorscheme distinguished 
set background=dark

set encoding=utf8

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


map 0 ^


nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
      nmap <D-j> <M-j>
        nmap <D-k> <M-k>
          vmap <D-j> <M-j>
            vmap <D-k> <M-k>
endif

func! DeleteTrailingWS()
      exe "normal mz"
        %s/\s\+$//ge
          exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

      
