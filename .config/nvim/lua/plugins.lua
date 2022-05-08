-- Initialisation: Ensure that Packer is installed and auto recompile the configuration
local fn = vim.fn local cmd = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local fresh_install = false
if fn.empty(fn.glob(install_path)) > 0 then
  print('Installing Packer...')
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  fresh_install = true
end

cmd([[packadd packer.nvim]])

--Auto recompile
--cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

--===================================================================

-- ==================== GENERAL ====================

local opts = { silent = true, noremap = true };

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

local imported_modules = require('packer').startup(function()
  --================= Cache =================--
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
      require'impatient'.enable_profile()
    end
  }

  use 'wbthomason/packer.nvim'

  --================= UI =================--
  use {
    'tamton-aquib/staline.nvim',
    config = function()
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
    end
  }

  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = 'tabs',
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = false,
        };
      });
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
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

      local opts = { silent = true, noremap = true };
      vim.api.nvim_set_keymap('n', '<F7>', ':IndentBlanklineToggle<CR>', opts);
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly',
    config = function()
      require('nvim-tree').setup({
        git = {
          enable = true
        }
      });

      local opts = { silent = true, noremap = true };
      vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', opts);
    end
  }

  --================= LSP =================--
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp');
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'spell' },
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping.confirm { select = true },
          ["<Right>"] = cmp.mapping.confirm { select = true },
          ["<C-e>"] = cmp.mapping.close(),
          ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
          ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        },
      });
      vim.o.completeopt = 'menu,menuone,noselect'

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          })
      })
    end
  }
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load();

      local opts = { noremap=true, silent=true }
      vim.api.nvim_set_keymap('i', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
      vim.api.nvim_set_keymap('s', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
    end,
    requires = {'rafamadriz/friendly-snippets'}

  }

  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path' }
  use { 'f3fora/cmp-spell' }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      local opts = { noremap=true, silent=true }
      vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-a>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
      end

      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        }
      }
      capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      local servers = { 'bashls', 'pyright', 'rust_analyzer', 'tsserver', 'clangd', 'theme_check', 'html', 'cssls' }
      for _, lsp in pairs(servers) do
        require('lspconfig')[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end

      -- Autoformat
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])

      vim.api.nvim_set_keymap('n', 'm', ':ClangdSwitchSourceHeader<CR>', opts);

    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'bash', 'c', 'cpp', 'css', 'html', 'json', 'lua', 'make', 'python', 'rust', 'scss', 'toml', 'yaml' },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        }
      })
    end,
  }

  use {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context.config').setup{
        enable = true,
      }
    end,
    requires = {'nvim-treesitter/nvim-treesitter'},
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = function()
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

      vim.api.nvim_set_keymap('n', '<space><space>', ':Telescope find_files<CR>', {silent = true, noremap = true});
      vim.api.nvim_set_keymap('n', '<space>b', ':Telescope buffers<CR>', {silent = true, noremap = true});
      vim.api.nvim_set_keymap('n', '<space>/', ':Telescope live_grep<CR>', {silent = true, noremap = true});
    end,
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup();

      local opts = { silent = false, noremap = true };
      vim.api.nvim_set_keymap('n', '<F9>', ':TroubleToggle<CR>', opts);
      vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    end
  }

  --================= MISC =================--

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
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

      local opts = { silent = false, noremap = true };
      vim.api.nvim_set_keymap('n', '<F6>', ':Gitsigns toggle_current_line_blame<CR>', opts);
    end
  }
end)

if fresh_install then
  cmd('exec \'PackerInstall\'')
end

return imported_modules
