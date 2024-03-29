call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'airblade/vim-rooter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
" Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'szw/vim-maximizer'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Yggdroot/indentLine'
Plug 'alx741/vim-hindent'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'lukas-reineke/virt-column.nvim'
Plug 'tpope/vim-fugitive'
call plug#end()
