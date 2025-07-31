-- ~/.config/nvim/lua/utils/init.lua
local M = {}

-- Quick note capture function
function M.quick_note()
local title = vim.fn.input("Note title: ")
if title ~= "" then
    vim.cmd("ObsidianNew " .. title)
    end
    end

    -- Search and replace in current buffer
    function M.search_replace()
    local search = vim.fn.input("Search: ")
    local replace = vim.fn.input("Replace: ")
    if search ~= "" and replace ~= "" then
        vim.cmd("%s/" .. search .. "/" .. replace .. "/gc")
        end
        end

        -- Toggle between relative and absolute line numbers
        function M.toggle_line_numbers()
        if vim.wo.relativenumber then
            vim.wo.relativenumber = false
            print("Absolute line numbers")
            else
                vim.wo.relativenumber = true
                print("Relative line numbers")
                end
                end

                return M
