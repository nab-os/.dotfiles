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
require('general').setup()

require('packer').startup(function()
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
    use 'tamton-aquib/staline.nvim'
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'

    --================= Utils =================--
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly',
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    --================= LSP =================--
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'f3fora/cmp-spell'
    use 'neovim/nvim-lspconfig'

    use {
        'L3MON4D3/LuaSnip',
        requires = {'rafamadriz/friendly-snippets'}
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use {
        'romgrk/nvim-treesitter-context',
        requires = {'nvim-treesitter/nvim-treesitter'},
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    --================= Misc =================--
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

end)

require('ui').setup()
require('utils').setup()
require('lsp').setup()
require('misc').setup()

if fresh_install then
  cmd('exec \'PackerInstall\'')
end
