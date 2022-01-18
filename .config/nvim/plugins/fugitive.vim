Plug 'tpope/vim-fugitive'

" Keybindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :G<CR>
nnoremap <space>gc :Git commit -v -q<CR>
nnoremap <space>gt :Git commit -v -q %:p<CR>
