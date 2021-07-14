-- Initialisation: Ensure that Packer is installed and auto recompile the configuration
local fn = vim.fn
local cmd = vim.cmd

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

local imported_modules = require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    --[[
    use {
        'hrsh7th/nvim-compe',
        config = function()
            require('compe').setup({
                enabled = true;
                autocomplete = true;
                debug = false;
                min_length = 1;
                preselect = 'enable';
                throttle_time = 80;
                source_timeout = 200;
                resolve_timeout = 800;
                incomplete_delay = 400;
                max_abbr_width = 100;
                max_kind_width = 100;
                max_menu_width = 100;
                documentation = {
                    border = { '', '' ,'', ' ', '', '', '', ' ' },
                    winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
                    max_width = 120,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1,
                };

                source = {
                    path = true;
                    buffer = true;
                    calc = true;
                    nvim_lsp = true;
                    nvim_lua = true;
                    vsnip = true;
                    ultisnips = true;
                    luasnip = true;
                    neorg = true;
                };
            })
            vim.o.completeopt = 'menuone,noselect'

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            capabilities.textDocument.completion.completionItem.resolveSupport = {
                properties = {
                    'documentation',
                    'detail',
                    'additionalTextEdits',
                }
            }
        end
    }
    ]]--

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
            parser_config.norg = {
                install_info = {
                    url = 'https://github.com/vhyrro/tree-sitter-norg',
                    files = { 'src/parser.c' },
                    branch = 'main'
                },
            }

            require('nvim-treesitter.configs').setup({
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

    --[[
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require('telescope').setup({
                defaults = {
                    vimgrep_arguments = {
                        'ag',
                        '--nogroup',
                        '--column',
                    },
                }
            })

           -- vim.api.nvim_set_keymap('n', '<space><space>', ':Telescope find_files<CR>', {silent = true, noremap = true})
           -- vim.api.nvim_set_keymap('n', '<space>b', ':Telescope buffers<CR>', {silent = true, noremap = true})
           -- vim.api.nvim_set_keymap('n', '<space>/', ':Telescope live_grep<CR>', {silent = true, noremap = true})
        end,
    }
    ]]--

    --[[
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }
    ]]--

    use {
        'vhyrro/neorg',
        config = function()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.norg.concealer'] = {},
                    ['core.norg.dirman'] = {
                        config = {
                            workspaces = {
                                my_workspace = '~/neorg'
                            }
                        }
                    }
                },
            }
        end,
        requires = 'nvim-lua/plenary.nvim'
    }

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
                current_line_blame = false,
                current_line_blame_delay = 0,
                current_line_blame_position = 'eol',
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                word_diff = false,
                use_decoration_api = true,
                use_internal_diff = true,
            })
        end
    }

    --[[ Hopefully one day I will remove this comment to replace CoC
    use {
        'neovim/nvim-lspconfig',
    }
    ]]--
end)

if fresh_install then
    cmd('exec \'PackerInstall\'')
end

return imported_modules