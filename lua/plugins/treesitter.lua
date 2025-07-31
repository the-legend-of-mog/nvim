-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Tree-sitter provides superior syntax highlighting and code understanding

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically update parsers
    config = function()
    require("nvim-treesitter.configs").setup({
        -- Languages to install (add more as needed)
    ensure_installed = {
        "lua", "python", "javascript", "typescript", "html", "css",
        "json", "markdown", "bash", "yaml", "toml", "rust", "go"
    },

    auto_install = true,  -- Automatically install missing parsers

    highlight = {
        enable = true,      -- Enable syntax highlighting
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,      -- Enable tree-sitter based indentation
    },

    -- Enhanced text objects (for selecting code blocks)
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    })
    end,
}
