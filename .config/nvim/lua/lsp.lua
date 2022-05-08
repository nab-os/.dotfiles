local M = {}
local opts = { silent = false, noremap = true };

function M.setup()
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

    require("luasnip.loaders.from_vscode").lazy_load();

    vim.api.nvim_set_keymap('i', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)
    vim.api.nvim_set_keymap('s', '<C-j>', '<cmd>lua require("luasnip").jump(1)<CR>', opts)


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

    require('treesitter-context.config').setup{
        enable = true,
    }

    require("trouble").setup();

    vim.api.nvim_set_keymap('n', '<F9>', ':TroubleToggle<CR>', opts);
    vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

return M
