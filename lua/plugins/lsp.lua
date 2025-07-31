-- ~/.config/nvim/lua/plugins/lsp.lua
-- LSP provides IDE features like go-to-definition, diagnostics, etc.

return {
    {
        "williamboman/mason.nvim",  -- LSP server installer
        config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",  -- Bridge between mason and lspconfig
        dependencies = { "mason.nvim" },
        config = function()
        require("mason-lspconfig").setup({
            -- Automatically install these language servers
            ensure_installed = {
                "lua_ls",        -- Lua
                "pyright",       -- Python
                "html",          -- HTML
                "cssls",         -- CSS
                "jsonls",        -- JSON
                "bashls"
            },
        })
        end,
    },

    {
        "neovim/nvim-lspconfig",  -- Main LSP configuration
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Configure each language server
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },  -- Recognize 'vim' global
                        workspace = { checkThirdParty = false },
                    },
                },
            },
            pyright = {},
            html = {},
            cssls = {},
            jsonls = {},
        }

        for server, config in pairs(servers) do
            config.capabilities = capabilities
            lspconfig[server].setup(config)
            end

            -- LSP key mappings (only active when LSP is attached)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Go to definition
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)           -- Show documentation
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code actions
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Rename symbol
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)     -- Find references
                end,
            })
            end,
    },
}
