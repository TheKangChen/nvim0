-- ▄▀▀ ▄▀▄ █   ▄▀▄ █▀▄ ▄▀▀ ▄▀▀ █▄█ ██▀ █▄ ▄█ ██▀
-- ▀▄▄ ▀▄▀ █▄▄ ▀▄▀ █▀▄ ▄██ ▀▄▄ █ █ █▄▄ █ ▀ █ █▄▄

-- COLORSCHEME

local M = {}

-- Native themes I like: habamax, quiet, retrobox
---@type "habamax" | "quiet" | "retrobox"
M.THEME = "retrobox"
M.ALT_THEME = "quiet" -- Alternative theme for a more minimal/focused look

function M.set_transparency()
    vim.schedule(function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "statusline", { bg = "none" })
    end)
end

function M.apply_theme(theme)
    theme = theme or M.THEME
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")
    vim.cmd.colorscheme(theme)
    M.set_transparency()
end

function M.apply_alt_theme(theme)
    theme = theme or M.ALT_THEME
    vim.cmd("highlight clear")
    vim.cmd("syntax reset")
    vim.cmd.colorscheme(theme)
    M.set_transparency()
end

M.apply_theme()

vim.api.nvim_create_user_command("MyTheme", function(opts)
    M.apply_theme(opts.args ~= "" and opts.args or nil)
end, { nargs = "?", desc = "Use my regular colorscheme setup" })

vim.api.nvim_create_user_command("AltTheme", function(opts)
    M.apply_alt_theme(opts.args ~= "" and opts.args or nil)
end, { nargs = "?", desc = "Use alternative theme" })

return M
