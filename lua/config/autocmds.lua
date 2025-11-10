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
