-- ~/.config/nvim/lua/plugins/telescope.lua
-- Telescope is the best fuzzy finder for Neovim

return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- Required dependency
            {
                "nvim-telescope/telescope-fzf-native.nvim",  -- Faster fuzzy finding
                build = "make",
            },
        },
        config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                prompt_prefix = "🔍 ",
                selection_caret = "➤ ",
                path_display = { "truncate" },

                mappings = {
                    i = {  -- Insert mode mappings
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = true,  -- Show hidden files
                    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
                },
                live_grep = {
                    additional_args = function()
                    return { "--hidden", "--glob", "!.git" }
                    end,
                },
            },
        })

        -- Load extensions
        telescope.load_extension("fzf")

        -- Key mappings for Telescope
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
        end,
    },
}
