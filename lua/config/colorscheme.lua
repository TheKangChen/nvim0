-- ▄▀▀ ▄▀▄ █   ▄▀▄ █▀▄ ▄▀▀ ▄▀▀ █▄█ ██▀ █▄ ▄█ ██▀
-- ▀▄▄ ▀▄▀ █▄▄ ▀▄▀ █▀▄ ▄██ ▀▄▄ █ █ █▄▄ █ ▀ █ █▄▄

-- COLORSCHEME

local M = {}

-- Native themes I like: habamax, quiet, retrobox
---@type "habamax" | "quiet" | "retrobox"
M.THEME = "retrobox"
---@type "quiet"
M.ALT_THEME = "quiet" -- Alternative theme for a more minimal/focused look

function M.set_transparency()
    local groups_to_clear_bg = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "EndOfBuffer",
        "WinSeparator",
        "SignColumn",
        "StatusLine",
        "LineNr",
        "Pmenu",
        "PmenuKind",
        "PmenuExtra",
    }
    vim.schedule(function()
        -- Keep original fg & remove bg
        for _, group_name in ipairs(groups_to_clear_bg) do
            local fg_color = vim.api.nvim_get_hl(0, { name = group_name }).fg
            local new_attributes = {
                bg = "none",
                ctermbg = "none",
            }
            if fg_color then
                new_attributes.fg = fg_color
            end
            vim.api.nvim_set_hl(0, group_name, new_attributes)
        end
    end)
end

---@param theme string|"alt"|nil The name of the theme to apply
function M.apply_theme(theme)
    theme = theme or M.THEME
    if theme == "alt" then
        theme = M.ALT_THEME
    end
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")
    vim.cmd.colorscheme(theme)
    M.set_transparency()
end

M.apply_theme()

vim.api.nvim_create_user_command("ApplyTheme", function(opts)
    M.apply_theme(opts.args ~= "" and opts.args or nil)
end, { nargs = "?", desc = "Apply colorscheme with Custom highlights" })

return M
