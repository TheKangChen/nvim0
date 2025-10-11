-- ▄▀▄ █ █ ▀█▀ ▄▀▄ ▄▀▀ █▄ ▄█ █▀▄ ▄▀▀
-- █▀█ ▀▄█  █  ▀▄▀ ▀▄▄ █ ▀ █ █▄▀ ▄██

-- AUTOCMDS

-- Highlight Yanked
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Different Indentation for Markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "markdown",
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.o.smartindent = true
        vim.o.autoindent = true
    end,
})

-- Create Directories When Saving Files
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local dir = vim.fn.expand('<afile>:p:h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Completion auto triggers: Very aggressive! Does not go away after insert!
-- local timer = vim.uv.new_timer()
--
-- vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
--   callback = function()
--     if timer:is_active() then
--       timer:stop()
--     end
--
--     timer:start(200, 0, function()
--       vim.schedule(function()
--         local col = vim.fn.col(".") - 1
--         local current = vim.fn.getline("."):sub(1, col):match("%w+$")
--
--         if current and #current >= 1 then
--           -- trigger completion if not visible
--           if vim.fn.pumvisible() == 0 then
--             vim.fn.feedkeys(
--               vim.api.nvim_replace_termcodes("<C-x><C-o>", true, true, true),
--               "n"
--             )
--           end
--         else
--           -- close the menu if cursor is not on a word
--           if vim.fn.pumvisible() == 1 then
--             vim.fn.feedkeys(
--               vim.api.nvim_replace_termcodes("<C-e>", true, true, true),
--               "n"
--             )
--           end
--         end
--       end)
--     end)
--   end,
-- })
