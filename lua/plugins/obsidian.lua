-- ~/.config/nvim/lua/plugins/obsidian.lua
-- Transform Neovim into a powerful note-taking system

return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",  -- Only load for markdown files
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "general",
                    path = vim.fn.expand("~/notes"),  -- Match your actual directory structure
                },
            },

            -- Note creation settings
            notes_subdir = "inbox",  -- Where new notes go
            new_notes_location = "notes_subdir",

            -- Note ID generation (how notes are named)
        note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                    end
                    end
                    return tostring(os.date("%Y-%m-%d")) .. "-" .. suffix
                    end,

                    -- Wiki-style link completion
                    completion = {
                        nvim_cmp = true,
                        min_chars = 2,
                    },

                    -- Template support
                    templates = {
                        subdir = "templates",
                        date_format = "%Y-%m-%d",
                        time_format = "%H:%M",
                    },

                    -- Daily notes (like Obsidian's daily notes)
        daily_notes = {
            folder = "daily",
            date_format = "%Y-%m-%d",
            alias_format = "%B %-d, %Y",
            template = "daily-note.md"
        },

        -- Key mappings for note-taking
        mappings = {
            ["gf"] = {
                action = function()
                return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            ["<leader>ch"] = {
                action = function()
                return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        },

        -- UI customization
        ui = {
            enable = true,
            update_debounce = 200,
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
            },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
        },
        })

        -- Additional keymaps for note-taking
        vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New note" })
        vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Open note" })
        vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", { desc = "Search notes" })
        vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Today's note" })
        vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", { desc = "Show backlinks" })
        vim.keymap.set("n", "<leader>og", ":ObsidianTags<CR>", { desc = "Search tags" })
        end,
    },

    -- Markdown preview for notes
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
        ft = "markdown",
        config = function()
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        vim.g.mkdp_command_for_global = 0
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_browser = ""

        vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown preview" })
        vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Stop preview" })
        end,
    },

    -- Enhanced markdown concealing
    {
        "OXY2DEV/markview.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
        require("markview").setup({
            modes = { "n", "no", "c" },
            hybrid_modes = { "n" },

            callbacks = {
                on_enable = function(_, win)
                vim.wo[win].conceallevel = 2
                vim.wo[win].concealcursor = "c"
                end
            }
        })
        end,
    }
}
