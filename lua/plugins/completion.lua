-- ~/.config/nvim/lua/plugins/completion.lua
-- nvim-cmp provides intelligent auto-completion

return {
    {
        "hrsh7th/nvim-cmp",  -- Main completion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",    -- LSP completion
            "hrsh7th/cmp-buffer",      -- Buffer completion
            "hrsh7th/cmp-path",        -- Path completion
            "L3MON4D3/LuaSnip",        -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completion
        },
        config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            snippet = {
                expand = function(args)
                luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                                                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                                                ["<C-Space>"] = cmp.mapping.complete(),
                                                ["<C-e>"] = cmp.mapping.abort(),
                                                ["<CR>"] = cmp.mapping.confirm({ select = true }),

                                                -- Tab completion (very intuitive)
            ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                    else
                        fallback()
                        end
                        end, { "i", "s" }),

                        ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                            elseif luasnip.jumpable(-1) then
                                luasnip.jump(-1)
                                else
                                    fallback()
                                    end
                                    end, { "i", "s" }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },   -- LSP completions (highest priority)
            { name = "luasnip" },    -- Snippet completions
            { name = "buffer" },     -- Buffer text completions
            { name = "path" },       -- File path completions
            }),
        })
        end,
    },
}
