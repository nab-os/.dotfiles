local M = {}
local opts = { silent = false, noremap = true };

function M.setup()

    vim.opt.termguicolors = true

    vim.opt.compatible = false
    vim.opt.showcmd = true
    vim.opt.modeline = false
    vim.opt.guifont = 'inconsolata 11'
    vim.opt.title = true
    vim.opt.titlestring = '%F'
    vim.opt.number = true

    -- Theme
    vim.cmd([[colorscheme solarized]])
    vim.cmd([[hi! Normal ctermbg=NONE guibg=NONE]])
    vim.cmd([[hi clear LineNR]])

    -- Undo
    vim.opt.history = 1000
    vim.opt.undodir = "~/.config/nvim/undodir"
    vim.opt.undofile = true

    -- Visual effect when copying
    vim.cmd([[autocmd TextYankPost <buffer> lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

    -- Last cursor position
    vim.cmd([[autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

    -- Spell
    vim.opt.spell = false;
    vim.opt.spelllang = { 'en_us', 'fr' };
    vim.api.nvim_set_keymap('n', '<F8>', ':set spell!<CR>', opts);

    -- Backup
    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.swapfile = false

    -- Encoding
    vim.opt.encoding = 'utf-8'
    vim.opt.fileencoding = 'utf-8'

    -- Search and/or Replace
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.showmatch = true
    vim.opt.incsearch = true
    vim.opt.hlsearch = true
    vim.opt.wrapscan = true
    vim.opt.gdefault = true
    vim.api.nvim_set_keymap('n', '<F3>', ':noh<CR>', opts);

    -- Indentation
    vim.opt.autoindent = true
    vim.opt.smartindent = true
    vim.opt.smarttab = true
    vim.opt.expandtab = true
    vim.opt.tabstop=4
    vim.opt.softtabstop=4
    vim.opt.shiftwidth=4
    vim.opt.list = true
    vim.opt.listchars = "tab:>-,trail:~,extends:>,precedes:<"
    vim.opt.wrap = true

    -- Split preferences
    vim.opt.splitbelow = true
    vim.opt.splitright = true

    -- Visual repeat
    vim.api.nvim_set_keymap('v', '.', ':normal .<CR>', opts);

    -- Scroll offset
    vim.opt.scrolloff = 3
    vim.opt.sidescrolloff = 5
    vim.opt.startofline = false

    -- Copy to clipboard
    -- vim.opt.clipboard = "unnamed,unnamedplus"

    -- Alternate
    vim.api.nvim_set_keymap('n', '<BS>', '<C-^>', opts);


    -- Movements
    vim.api.nvim_set_keymap('n', 'qq', ':bd<CR>', opts);
    vim.api.nvim_set_keymap('n', 'T', '<PageDown>', opts);
    vim.api.nvim_set_keymap('n', 'S', '<PageUP>', opts);
    vim.api.nvim_set_keymap('n', 'C', ':wincmd h<CR>', opts);
    vim.api.nvim_set_keymap('n', 'R', ':wincmd l<CR>', opts);
    vim.api.nvim_set_keymap('n', 'gq', ':bp <BAR> bd #<CR>', opts);

    -- Auto reload files when gain focus
    vim.opt.autoread = true
    vim.opt.autowrite = true
    vim.cmd([[au FocusGained,BufEnter * :Silent !
    command! -nargs=+ Silent
    \   execute 'silent <args>'
    \ | redraw!]])

    vim.cmd([[au FocusGained,BufEnter * :silent!]])

    vim.opt.conceallevel = 1
    vim.opt.joinspaces = false
end

return M
