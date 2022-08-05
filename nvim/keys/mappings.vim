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

let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
noremap <F6> :call ToggleNetrw()<CR>

"Vim-maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>

"Comments NERDCommenter
nmap <silent> <M-/> <Plug>NERDCommenterToggle
vmap <silent> <M-/> <Plug>NERDCommenterToggle

"Telescope
nnoremap <leader>gf <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>gb <cmd>Telescope buffers<cr>
nnoremap <leader>gm <cmd>Telescope marks<cr>
nnoremap <leader>gq <cmd>Telescope quickfix<cr>
nnoremap <leader>gt <cmd>Telescope file_browser<cr>
nnoremap <leader>go <cmd>Telescope oldfiles<cr>
nnoremap <leader>ge <cmd>Telescope man_pages<cr>

map <leader>vr :source ~/.config/nvim/init.vim<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader><C-j> :lnext<CR>
nnoremap <leader><C-k> :lprev<CR>

":CocDiagnostics - to hop on errors and populate them to location lists
"<C-w>v : vsplit of same file
"<C-w>o : Close all but current buffer
"<C-w>r : Rotate your current buffers
"reg 		: List register contents
"

nnoremap <leader>mu :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <leader>mm :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>a :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>s :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>d :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>f :lua require("harpoon.ui").nav_file(4)<CR>
