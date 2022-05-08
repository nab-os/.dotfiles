" Nabos <nabos at glargh dot fr>
"
" Released under Free Licence - 2018

" PLUGINS
call plug#begin()

Plug 'preservim/tagbar'
Plug 'simnalamburt/vim-mundo'
"
Plug 'farmergreg/vim-lastplace'
"
Plug 'terryma/vim-smooth-scroll'

Plug 'nab-os/vim-bepo'

call plug#end()

lua require('plugins')

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
call NumberToggle()
nnoremap <silent> <F4> :call NumberToggle()<cr>

" ==================== Modules ====================
"
"" Smooth scroll
noremap <silent> S :call smooth_scroll#up(&scroll, 7, 1)<CR>
noremap <silent> T :call smooth_scroll#down(&scroll, 7, 1)<CR>
"
"" Tagbar
nmap <F5> :TagbarToggle<CR>
let g:tagbar_map_togglesort = ''
let g:tagbar_map_toggleautoclose = ''
let g:tagbar_map_togglepause = ''
let g:tagbar_map_togglefold = ''
let g:tagbar_map_jump = 'o'
let g:tagbar_map_preview = 'O'
