local M = {}
local opts = { silent = true, noremap = true };

function M.setup()
    require('staline').setup({
        sections = {
            left = { '- ', '-mode', 'left_sep_double' },
            mid  = { 'file_name' },
            right = { 'lsp', 'right_sep_double', '-line_column' },
        },
        defaults = {
            true_colors = true,
            line_column = " [%l/%L] :%c  ",
        }
    });

    require("bufferline").setup({
        options = {
            mode = 'tabs',
            diagnostics = 'nvim_lsp',
            show_buffer_close_icons = false,
            show_close_icon = false,
            always_show_bufferline = false,
        };
    });

    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guibg=#002B36 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guibg=NONE gui=nocombine]]

    vim.opt.list = true

    local indent = require("indent_blankline");
    indent.setup {
        char = "",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
    }

    vim.api.nvim_set_keymap('n', '<F7>', ':IndentBlanklineToggle<CR>', opts);

    require('colorizer').setup()
end

return M
