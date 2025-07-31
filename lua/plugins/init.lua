-- ~/.config/nvim/lua/plugins/init.lua
-- Lazy.nvim is the modern plugin manager for Neovim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Plugin specifications
    require("lazy").setup({
        -- Essential plugins for IDE functionality
        { import = "plugins.lsp" },          -- Language Server Protocol
        { import = "plugins.completion" },   -- Auto-completion
        { import = "plugins.treesitter" },   -- Syntax highlighting
        { import = "plugins.telescope" },    -- Fuzzy finder
        { import = "plugins.obsidian" },     -- Note-taking
        { import = "plugins.ui" },           -- User interface
        { import = "plugins.leap" },  -- Add this line
    })
