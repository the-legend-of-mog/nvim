-- ~/.config/nvim/lua/config/keymaps.lua
-- Key mappings make Neovim efficient to use

local keymap = vim.keymap.set

-- Set leader key (this becomes your "command prefix")
vim.g.mapleader = " "       -- Space as leader key
vim.g.maplocalleader = " "

-- Essential navigation improvements
keymap("n", "<C-d>", "<C-d>zz")  -- Center screen when jumping down
keymap("n", "<C-u>", "<C-u>zz")  -- Center screen when jumping up
keymap("n", "n", "nzzzv")        -- Center screen when searching forward
keymap("n", "N", "Nzzzv")        -- Center screen when searching backward

-- Window navigation (much faster than default)
keymap("n", "<C-h>", "<C-w>h")   -- Move to left window
keymap("n", "<C-j>", "<C-w>j")   -- Move to bottom window
keymap("n", "<C-k>", "<C-w>k")   -- Move to top window
keymap("n", "<C-l>", "<C-w>l")   -- Move to right window

-- Buffer navigation
keymap("n", "<S-h>", ":bprevious<CR>")  -- Previous buffer
keymap("n", "<S-l>", ":bnext<CR>")      -- Next buffer

-- File explorer
keymap("n", "<leader>e", vim.cmd.Ex)     -- Open file explorer

-- Quick save and quit
keymap("n", "<leader>w", ":w<CR>")       -- Save file
keymap("n", "<leader>q", ":q<CR>")       -- Quit

-- Visual mode improvements
keymap("v", "J", ":m '>+1<CR>gv=gv")     -- Move selected lines down
keymap("v", "K", ":m '<-2<CR>gv=gv")     -- Move selected lines up
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Vertical resizing (top/bottom window boundaries) 
keymap("n", "<C-S-j>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-S-k>", ":resize -2<CR>", { desc = "Decrease window height" })

-- Custom split creation with visual mnemonics
-- The symbols represent the split direction visually
-- - looks like a horizontal line (horizontal split)
-- | looks like a vertical line (vertical split)

keymap("n", "<leader>-", ":split<CR>", { desc = "Create horizontal split" })
keymap("n", "<leader>|", ":vsplit<CR>", { desc = "Create vertical split" })
-- Lazygit integration - opens in a floating terminal for seamless git management
keymap("n", "<leader>gg", ":terminal lazygit<CR>", { desc = "Open Lazygit" })
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard in insert mode" })

-- Terminal in horizontal split with custom height
-- Terminal in horizontal split with custom height
keymap("n", "<leader>t", function()
    vim.cmd("split")
    vim.cmd("term")
    vim.cmd("resize 6")
    vim.cmd("startinsert")  -- Enter insert mode in terminal
    end, { desc = "Open terminal in horizontal split (12 lines)" })

-- Leap.nvim bidirectional navigation with single key
keymap({"n", "x", "o"}, "s", function()
    require("leap").leap({ bidirectional = true })
end, { desc = "Leap bidirectional jump" })
