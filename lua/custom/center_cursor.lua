-- ===========================
-- Center Cursor
-- ===========================

local M = {}

M.center_cursor = false

function M.ToggleCenterCursor()
    M.center_cursor = not M.center_cursor
    if M.center_cursor then
        vim.api.nvim_create_autocmd("CursorMoved", {
            group = vim.api.nvim_create_augroup("CenterCursor", { clear = true }),
            pattern = "*",
            command = "normal! zz",
        })
        vim.cmd("normal! zz") -- Center immediately after toggle
    else
        vim.api.nvim_del_augroup_by_name("CenterCursor")
    end
    vim.notify("Center Cursor: " .. (M.center_cursor and "ON" or "OFF"), vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("CenterCursor", M.ToggleCenterCursor, { desc = "Toggle center cursor" })

return M
