-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nabos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nabos/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nabos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nabos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nabos/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nï\1\0\0\a\0\v\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\n\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\1K\0\1\0\6s,<cmd>lua require(\"luasnip\").jump(1)<CR>\n<C-j>\6i\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n³\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\5\28show_buffer_close_icons\1\27always_show_bufferline\1\16diagnostics\rnvim_lsp\tmode\ttabs\20show_close_icon\1\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\næ\5\0\0\a\0\25\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\0015\0\18\0006\1\19\0009\1\20\0019\1\21\1'\3\22\0'\4\23\0'\5\24\0\18\6\0\0B\1\5\1K\0\1\0,:Gitsigns toggle_current_line_blame<CR>\t<F6>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\1\fnoremap\2\28current_line_blame_opts\1\0\2\ndelay\3\0\18virt_text_pos\16right_align\nsigns\1\0\2\nnumhl\1\vlinehl\1\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\bâ€¾\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\bâ”‚\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\ttext\bâ”‚\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÑ\4\0\0\b\0\21\0$6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\a\0'\2\b\0B\0\2\0029\1\t\0005\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3B\1\2\0015\1\15\0006\2\0\0009\2\16\0029\2\17\2'\4\18\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0\31:IndentBlanklineToggle<CR>\t<F7>\6n\20nvim_set_keymap\bapi\1\0\2\vsilent\2\fnoremap\2\30space_char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\24char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\1\0\2\tchar\5#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\tlist>highlight IndentBlanklineIndent2 guibg=NONE gui=nocombineAhighlight IndentBlanklineIndent1 guibg=#002B36 gui=nocombine\bcmd\18termguicolors\bopt\bvim\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¤\6\1\0\n\0000\0b6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0004\4\6\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\0045\5\a\0>\5\5\4=\4\t\0035\4\v\0003\5\n\0=\5\f\4=\4\r\0035\4\17\0009\5\14\0009\5\15\0055\a\16\0B\5\2\2=\5\18\0049\5\14\0009\5\15\0055\a\19\0B\5\2\2=\5\20\0049\5\14\0009\5\15\0055\a\21\0B\5\2\2=\5\22\0049\5\14\0009\5\23\5B\5\1\2=\5\24\0049\5\14\0009\5\25\0055\a\28\0009\b\26\0009\b\27\b=\b\29\aB\5\2\2=\5\30\0049\5\14\0009\5\31\0055\a \0009\b\26\0009\b\27\b=\b\29\aB\5\2\2=\5!\4=\4\14\3B\1\2\0016\1\"\0009\1#\1'\2%\0=\2$\0019\1\2\0009\1&\1'\3'\0005\4)\0009\5\14\0009\5(\0059\5&\5B\5\1\2=\5\14\0044\5\3\0005\6*\0>\6\1\5=\5\t\4B\1\3\0019\1\2\0009\1&\1'\3+\0005\4,\0009\5\14\0009\5(\0059\5&\5B\5\1\2=\5\14\0049\5-\0009\5\t\0054\a\3\0005\b.\0>\b\1\a4\b\3\0005\t/\0>\t\1\bB\5\3\2=\5\t\4B\1\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\6/\fcmdline\26menu,menuone,noselect\16completeopt\6o\bvim\t<Up>\1\0\0\21select_prev_item\v<Down>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-e>\nclose\f<Right>\1\0\1\vselect\2\n<Tab>\1\0\1\vselect\2\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\nspell\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nË\6\0\2\t\1\25\0Y6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\t\0'\a\n\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\v\0'\a\f\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\0\0B\2\6\1K\0\1\0\0À*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\n<C-a>&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>d.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\n<C-k>*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\24nvim_buf_set_keymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim“\6\1\0\f\0!\0@5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0013\1\a\0006\2\1\0009\2\b\0029\2\t\0029\2\n\2B\2\1\0029\3\v\0029\3\f\0039\3\r\3+\4\2\0=\4\14\0039\3\v\0029\3\f\0039\3\r\0035\4\17\0005\5\16\0=\5\18\4=\4\15\0036\3\19\0'\5\20\0B\3\2\0029\3\21\3\18\5\2\0B\3\2\2\18\2\3\0005\3\22\0006\4\23\0\18\6\3\0B\4\2\4H\a\t€6\t\19\0'\v\24\0B\t\2\0028\t\b\t9\t\25\t5\v\26\0=\1\27\v=\2\28\vB\t\2\1F\a\3\3R\aõ6\4\1\0009\4\29\4'\6\30\0B\4\2\0016\4\1\0009\4\2\0049\4\3\4'\6\4\0'\a\31\0'\b \0\18\t\0\0B\4\5\0012\0\0€K\0\1\0\":ClangdSwitchSourceHeader<CR>\6mGautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()\bcmd\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\npairs\1\t\0\0\vbashls\fpyright\18rust_analyzer\rtsserver\vclangd\16theme_check\thtml\ncssls\24update_capabilities\17cmp_nvim_lsp\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\0-<cmd>lua vim.diagnostic.open_float()<CR>\n<C-e>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÁ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\1K\0\1\0\24:NvimTreeToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\bgit\1\0\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\në\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\14\0\0\tbash\6c\bcpp\bcss\thtml\tjson\blua\tmake\vpython\trust\tscss\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["staline.nvim"] = {
    config = { "\27LJ\2\n„\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\rdefaults\1\0\2\16true_colors\2\16line_column\19 [%l/%L] :%c  \rsections\1\0\0\nright\1\4\0\0\blsp\21right_sep_double\17-line_column\bmid\1\2\0\0\14file_name\tleft\1\0\0\1\4\0\0\a- \n-mode\20left_sep_double\nsetup\fstaline\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/staline.nvim",
    url = "https://github.com/tamton-aquib/staline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nö\3\0\0\6\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\29:Telescope live_grep<CR>\r<space>/\1\0\2\vsilent\2\fnoremap\2\27:Telescope buffers<CR>\r<space>b\1\0\2\vsilent\2\fnoremap\2\30:Telescope find_files<CR>\19<space><space>\6n\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nŠ\3\0\0\a\0\16\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\1K\0\1\0-<cmd>lua vim.diagnostic.setloclist()<CR>\n<C-q>,<cmd>lua vim.diagnostic.goto_prev()<CR>\n<C-p>,<cmd>lua vim.diagnostic.goto_next()<CR>\n<C-n>\23:TroubleToggle<CR>\t<F9>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\1\fnoremap\2\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/nabos/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\a\0\r\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0015\0\6\0006\1\a\0009\1\b\0019\1\t\1'\3\n\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\1K\0\1\0\24:NvimTreeToggle<CR>\n<C-t>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\bgit\1\0\0\1\0\1\venable\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n³\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\5\28show_buffer_close_icons\1\27always_show_bufferline\1\16diagnostics\rnvim_lsp\tmode\ttabs\20show_close_icon\1\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\në\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\14\0\0\tbash\6c\bcpp\bcss\thtml\tjson\blua\tmake\vpython\trust\tscss\ttoml\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: staline.nvim
time([[Config for staline.nvim]], true)
try_loadstring("\27LJ\2\n„\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\rdefaults\1\0\2\16true_colors\2\16line_column\19 [%l/%L] :%c  \rsections\1\0\0\nright\1\4\0\0\blsp\21right_sep_double\17-line_column\bmid\1\2\0\0\14file_name\tleft\1\0\0\1\4\0\0\a- \n-mode\20left_sep_double\nsetup\fstaline\frequire\0", "config", "staline.nvim")
time([[Config for staline.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\30treesitter-context.config\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nö\3\0\0\6\0\22\0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\t\0009\0\n\0009\0\v\0'\2\f\0'\3\19\0'\4\20\0005\5\21\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\29:Telescope live_grep<CR>\r<space>/\1\0\2\vsilent\2\fnoremap\2\27:Telescope buffers<CR>\r<space>b\1\0\2\vsilent\2\fnoremap\2\30:Telescope find_files<CR>\19<space><space>\6n\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\bfzf\1\0\0\1\0\4\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\næ\5\0\0\a\0\25\0\0306\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\2B\0\2\0015\0\18\0006\1\19\0009\1\20\0019\1\21\1'\3\22\0'\4\23\0'\5\24\0\18\6\0\0B\1\5\1K\0\1\0,:Gitsigns toggle_current_line_blame<CR>\t<F6>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\1\fnoremap\2\28current_line_blame_opts\1\0\2\ndelay\3\0\18virt_text_pos\16right_align\nsigns\1\0\2\nnumhl\1\vlinehl\1\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\bâ€¾\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\ttext\6_\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\ttext\bâ”‚\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\ttext\bâ”‚\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nË\6\0\2\t\1\25\0Y6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0'\6\4\0B\2\4\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\a\0'\a\b\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\t\0'\a\n\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\v\0'\a\f\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\r\0'\a\14\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\15\0'\a\16\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\17\0'\a\18\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\19\0'\a\20\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\21\0'\a\22\0-\b\0\0B\2\6\0016\2\0\0009\2\1\0029\2\5\2\18\4\1\0'\5\6\0'\6\23\0'\a\24\0-\b\0\0B\2\6\1K\0\1\0\0À*<cmd>lua vim.lsp.buf.formatting()<CR>\r<space>f*<cmd>lua vim.lsp.buf.references()<CR>\agr+<cmd>lua vim.lsp.buf.code_action()<CR>\n<C-a>&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\r<space>d.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<cmd>lua vim.lsp.buf.hover()<CR>\n<C-k>*<cmd>lua vim.lsp.buf.definition()<CR>\agd+<cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\24nvim_buf_set_keymap\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim“\6\1\0\f\0!\0@5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0013\1\a\0006\2\1\0009\2\b\0029\2\t\0029\2\n\2B\2\1\0029\3\v\0029\3\f\0039\3\r\3+\4\2\0=\4\14\0039\3\v\0029\3\f\0039\3\r\0035\4\17\0005\5\16\0=\5\18\4=\4\15\0036\3\19\0'\5\20\0B\3\2\0029\3\21\3\18\5\2\0B\3\2\2\18\2\3\0005\3\22\0006\4\23\0\18\6\3\0B\4\2\4H\a\t€6\t\19\0'\v\24\0B\t\2\0028\t\b\t9\t\25\t5\v\26\0=\1\27\v=\2\28\vB\t\2\1F\a\3\3R\aõ6\4\1\0009\4\29\4'\6\30\0B\4\2\0016\4\1\0009\4\2\0049\4\3\4'\6\4\0'\a\31\0'\b \0\18\t\0\0B\4\5\0012\0\0€K\0\1\0\":ClangdSwitchSourceHeader<CR>\6mGautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()\bcmd\17capabilities\14on_attach\1\0\0\nsetup\14lspconfig\npairs\1\t\0\0\vbashls\fpyright\18rust_analyzer\rtsserver\vclangd\16theme_check\thtml\ncssls\24update_capabilities\17cmp_nvim_lsp\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\0-<cmd>lua vim.diagnostic.open_float()<CR>\n<C-e>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire¤\6\1\0\n\0000\0b6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0004\4\6\0005\5\3\0>\5\1\0045\5\4\0>\5\2\0045\5\5\0>\5\3\0045\5\6\0>\5\4\0045\5\a\0>\5\5\4=\4\t\0035\4\v\0003\5\n\0=\5\f\4=\4\r\0035\4\17\0009\5\14\0009\5\15\0055\a\16\0B\5\2\2=\5\18\0049\5\14\0009\5\15\0055\a\19\0B\5\2\2=\5\20\0049\5\14\0009\5\15\0055\a\21\0B\5\2\2=\5\22\0049\5\14\0009\5\23\5B\5\1\2=\5\24\0049\5\14\0009\5\25\0055\a\28\0009\b\26\0009\b\27\b=\b\29\aB\5\2\2=\5\30\0049\5\14\0009\5\31\0055\a \0009\b\26\0009\b\27\b=\b\29\aB\5\2\2=\5!\4=\4\14\3B\1\2\0016\1\"\0009\1#\1'\2%\0=\2$\0019\1\2\0009\1&\1'\3'\0005\4)\0009\5\14\0009\5(\0059\5&\5B\5\1\2=\5\14\0044\5\3\0005\6*\0>\6\1\5=\5\t\4B\1\3\0019\1\2\0009\1&\1'\3+\0005\4,\0009\5\14\0009\5(\0059\5&\5B\5\1\2=\5\14\0049\5-\0009\5\t\0054\a\3\0005\b.\0>\b\1\a4\b\3\0005\t/\0>\t\1\bB\5\3\2=\5\t\4B\1\3\1K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\vpreset\6/\fcmdline\26menu,menuone,noselect\16completeopt\6o\bvim\t<Up>\1\0\0\21select_prev_item\v<Down>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-e>\nclose\f<Right>\1\0\1\vselect\2\n<Tab>\1\0\1\vselect\2\t<CR>\1\0\0\1\0\1\vselect\2\fconfirm\fmapping\fsnippet\vexpand\1\0\0\0\fsources\1\0\0\1\0\1\tname\nspell\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\3\0\t6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nï\1\0\0\a\0\v\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\n\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\1K\0\1\0\6s,<cmd>lua require(\"luasnip\").jump(1)<CR>\n<C-j>\6i\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nŠ\3\0\0\a\0\16\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\1K\0\1\0-<cmd>lua vim.diagnostic.setloclist()<CR>\n<C-q>,<cmd>lua vim.diagnostic.goto_prev()<CR>\n<C-p>,<cmd>lua vim.diagnostic.goto_next()<CR>\n<C-n>\23:TroubleToggle<CR>\t<F9>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\1\fnoremap\2\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nÑ\4\0\0\b\0\21\0$6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\0016\0\0\0009\0\3\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0+\1\2\0=\1\6\0006\0\a\0'\2\b\0B\0\2\0029\1\t\0005\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3B\1\2\0015\1\15\0006\2\0\0009\2\16\0029\2\17\2'\4\18\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0\31:IndentBlanklineToggle<CR>\t<F7>\6n\20nvim_set_keymap\bapi\1\0\2\vsilent\2\fnoremap\2\30space_char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\24char_highlight_list\1\3\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\1\0\2\tchar\5#show_trailing_blankline_indent\1\nsetup\21indent_blankline\frequire\tlist>highlight IndentBlanklineIndent2 guibg=NONE gui=nocombineAhighlight IndentBlanklineIndent1 guibg=#002B36 gui=nocombine\bcmd\18termguicolors\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
