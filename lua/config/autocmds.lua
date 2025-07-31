-- Additional note-taking keymaps
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", { desc = "Show all links" })
vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>", { desc = "Quick switch notes" })
vim.keymap.set("n", "<leader>of", ":ObsidianFollowLink<CR>", { desc = "Follow link under cursor" })
vim.keymap.set("n", "<leader>ow", ":ObsidianWorkspace<CR>", { desc = "Switch workspace" })
