-- Create a new file: ~/.config/nvim/lua/plugins/leap.lua
-- This dedicated file keeps your leap configuration organized and easy to modify

return {
    {
        "ggandor/leap.nvim",
        -- Load leap.nvim for all file types since navigation is universally useful
        event = "VeryLazy",  -- This loads the plugin after Neovim startup to keep startup fast
        config = function()
        local leap = require('leap')

        -- Instead of using add_default_mappings(), we'll be explicit about our keybindings
        -- This prevents conflicts with Neovim's built-in commands and gives us full control

        -- Set up leap motions with explicit, conflict-free keybindings
        -- We're using 's' for forward leap and 'gs' for backward leap
        -- This avoids the conflict with capital S while still being intuitive
        vim.keymap.set('n', 's', '<Plug>(leap-forward)', { desc = 'Leap forward' })
        vim.keymap.set('n', 'gs', '<Plug>(leap-backward)', { desc = 'Leap backward' })

        -- Customize leap's appearance to match your catppuccin theme
        -- These highlight groups control how leap targets appear on screen
        vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })  -- Dims non-target text
        vim.api.nvim_set_hl(0, 'LeapMatch', {
            fg = 'white',           -- Target characters appear in white
            bold = true,            -- Make them bold so they stand out
            nocombine = true,       -- Prevent other highlights from interfering
        })

        -- Customize the labels that appear for jump targets
        -- These are the characters leap will use to mark jump destinations
        -- Arranged by ease of typing with your fingers in home position
        leap.opts.labels = 'sfnjklhodweimbuyvrpgtaqxzc'

        -- Make leap case insensitive by default
        -- This means typing 'ab' will match both 'ab' and 'AB'
        leap.opts.case_sensitive = false

        -- Show jump targets even for the first character match
        -- This gives you immediate visual feedback about where you can jump
        leap.opts.equivalence_classes = { ' \t\r\n' }

        -- Configure special modes for enhanced functionality

        -- Set up leap for visual mode (when you have text selected)
        -- This allows you to extend selections using leap motions
        vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
        vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')

        -- Optional: Add a keymap for leaping to windows
        -- This is useful when you have multiple splits/windows open
        vim.keymap.set('n', '<leader>lw', function()
        require('leap').leap {
            target_windows = vim.tbl_filter(
                function(win) return vim.api.nvim_win_get_config(win).focusable end,
                                            vim.api.nvim_tabpage_list_wins(0)
            )
        }
        end, { desc = "Leap to window" })

        end,
    },
}
