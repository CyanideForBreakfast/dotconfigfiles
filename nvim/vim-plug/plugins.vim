call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'frazrepo/vim-rainbow'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-utils/vim-man'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'szw/vim-maximizer'
Plug 'ryanoasis/vim-devicons'

Plug 'alx741/vim-hindent'
Plug 'neovimhaskell/haskell-vim'
call plug#end()
