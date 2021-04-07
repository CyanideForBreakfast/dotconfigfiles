"Better Window switching
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>T :wincmd T<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>n :wincmd n<CR>
nnoremap <leader>c :wincmd c<CR>
nnoremap <leader>r :wincmd r<CR>
nnoremap <leader>R :wincmd R<CR>
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

"Window maximizing and minimizing
map <F5> <C-W>_<C-W><Bar>

"UndoTreeToggle
nnoremap <leader>u :UndotreeToggle<CR>

"Had to do it. was mapped to space+h causing delay
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

"Command to toggle nerdtree
nmap <F6> :NERDTreeToggle<CR>

"Vim-maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

"FZF
nnoremap <leader>F :Files<CR>
nnoremap <leader>R :RG<CR>
