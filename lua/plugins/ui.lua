-- ~/.config/nvim/lua/plugins/ui.lua
-- Make Neovim look and feel modern

return {
    -- Color scheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,  -- Load first
        config = function()
        require("catppuccin").setup({
            flavour = "mocha",  -- Choose: latte, frappe, macchiato, mocha
            integrations = {
                cmp = true,
                telescope = true,
                treesitter = true,
                markdown = true,
            },
        })
        vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" }
            },
        })
        end,
    },

    -- File explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        require("nvim-tree").setup({
            view = {
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            filters = {
                dotfiles = false,  -- Show hidden files
            },
        })

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        end,
    },

    -- Better notifications
    {
        "rcarriga/nvim-notify",
        config = function()
        require("notify").setup({
            background_colour = "#000000",
            fps = 30,
            render = "default",
            timeout = 3000,
        })
        vim.notify = require("notify")
        end,
    },

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
        require("ibl").setup({
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { enabled = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "lazy",
                    "mason",
                },
            },
        })
        end,
    },

    -- Git integration - NOW PROPERLY INSIDE THE RETURN TABLE
    {
        "lewis6991/gitsigns.nvim",
        config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation between git hunks
            map('n', ']c', function()
            if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, {expr=true})

            map('n', '[c', function()
            if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, {expr=true})

            -- Git actions
            map('n', '<leader>hs', gs.stage_hunk)
            map('n', '<leader>hr', gs.reset_hunk)
            map('n', '<leader>hp', gs.preview_hunk)
            map('n', '<leader>hb', function() gs.blame_line{full=true} end)
            end
        })
        end,
    },

    -- Session management - ALSO PROPERLY INSIDE THE RETURN TABLE
    {
        "rmagatti/auto-session",
        config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            auto_session_use_git_branch = false,

            -- Automatically save and restore sessions
            auto_save_enabled = true,
            auto_restore_enabled = true,
        })

        vim.keymap.set("n", "<leader>ss", ":SessionSave<CR>", { desc = "Save session" })
        vim.keymap.set("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Restore session" })
        end,
    },
}
