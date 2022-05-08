local M = {}
local opts = { silent = false, noremap = true };

function M.setup()
  require('gitsigns').setup({
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    current_line_blame_opts = {
      delay = 0,
      virt_text_pos = 'right_align',
    },
  })

  vim.api.nvim_set_keymap('n', '<F6>', ':Gitsigns toggle_current_line_blame<CR>', opts);
end

return M
