local M = {}
local opts = { silent = true, noremap = true };

function M.setup()
    require('nvim-tree').setup({
        git = {
            enable = true
        }
    });

    vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', opts);

    require('telescope').setup({
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    });
    require('telescope').load_extension('fzf')

    vim.api.nvim_set_keymap('n', '<space><space>', ':Telescope find_files<CR>', opts);
    vim.api.nvim_set_keymap('n', '<space>b', ':Telescope buffers<CR>', opts);
    vim.api.nvim_set_keymap('n', '<space>/', ':Telescope live_grep<CR>', opts);
end

return M
