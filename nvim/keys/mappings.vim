"Better Window switching
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>T :wincmd T<CR>
nnoremap <leader>n :wincmd n<CR>
nnoremap <leader>c: wincmd c<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>K :wincmd K<CR>

"Window resizing and cycling
nnoremap <silent> <M-j>   :resize -2<CR>
nnoremap <silent> <M-k>   :resize +2<CR>
nnoremap <silent> <M-h>   :vertical resize -2<CR>
nnoremap <silent> <M-l>   :vertical resize +2<CR>
nnoremap <silent> <leader><TAB> :bnext<CR>
nnoremap <silent> <leader><S-TAB> :bprevious<CR>

"Better intending
vnoremap < <gv
vnoremap > >gv

"UndoTreeToggle
nnoremap <leader>u :UndotreeToggle<CR>

"Command to toggle nerdtree
nmap <F6> :NERDTreeToggle<CR>

"Vim-maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>

"Comments NERDCommenter
nmap <silent> <M-/> <Plug>NERDCommenterToggle
vmap <silent> <M-/> <Plug>NERDCommenterToggle

"FZF
"nnoremap <leader>F :Files<CR>
"nnoremap <leader>R :RG<CR>

"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>ft <cmd>Telescope file_browser<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fe <cmd>Telescope man_pages<cr>

map <leader>vr :source ~/.config/nvim/init.vim<CR>

