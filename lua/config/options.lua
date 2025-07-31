-- ~/.config/nvim/lua/config/options.lua
-- These options control Neovim's basic behavior

local opt = vim.opt

-- UI and appearance
opt.number = true           -- Show line numbers
opt.relativenumber = true   -- Show relative line numbers (great for navigation)
opt.signcolumn = "yes"      -- Always show the sign column (prevents text shifting)
opt.wrap = false            -- Don't wrap long lines
opt.scrolloff = 8           -- Keep 8 lines visible above/below cursor
opt.sidescrolloff = 8       -- Keep 8 columns visible left/right of cursor

-- Indentation (crucial for code formatting)
opt.tabstop = 4             -- Number of spaces for a tab
opt.shiftwidth = 4          -- Number of spaces for auto-indent
opt.expandtab = true        -- Convert tabs to spaces
opt.smartindent = true      -- Smart auto-indenting

-- Search behavior
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- Override ignorecase if search contains uppercase
opt.hlsearch = false        -- Don't highlight search results permanently
opt.incsearch = true        -- Show search matches as you type

-- File handling
opt.backup = false          -- Don't create backup files
opt.swapfile = false        -- Don't create swap files
opt.undofile = true         -- Enable persistent undo
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Performance
opt.updatetime = 50         -- Faster completion and diagnostics
opt.timeoutlen = 300        -- Time to wait for mapped sequence

-- Split behavior
opt.splitbelow = true       -- Horizontal splits go below
opt.splitright = true       -- Vertical splits go right

-- Enable mouse support (useful for beginners)
opt.mouse = "nv"
opt,clipboard = "unnamedplus"
