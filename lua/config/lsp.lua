-- █   ▄▀▀ █▀▄
-- █▄▄ ▄██ █▀

-- LSP

-- Install language servers and tools with system package managers
-- LSP configs located in ./lsp directory
-- Documentation: https://neovim.io/doc/user/lsp.html
-- Available LSPs: https://microsoft.github.io/language-server-protocol/implementors/servers/

-- ===========================
-- Enable LSPs
-- ===========================

vim.lsp.enable({
    "bashls",
    "clangd",
    "gopls",
    "harper_ls",
    "lua_ls",
    "pyright",
    "ruff",
})

-- LSP Related Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        -- Keymaps
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- defaults:
        -- https://neovim.io/doc/user/news-0.11.html#_defaults

        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gh", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gra", vim.lsp.buf.code_action, "Code Action")
        map("grn", vim.lsp.buf.rename, "Rename all references")
        map("grr", vim.lsp.buf.references, "References")
        map("gri", vim.lsp.buf.implementation, "Implementation")
        map("grt", vim.lsp.buf.type_definition, "Type Definition")
        map("<leader>cf", vim.lsp.buf.format, "Format Buffer")
        map("<C-x><C-o>", vim.lsp.omnifunc, "Omnifunc")
        map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
        map("<leader>wl", vim.lsp.buf.list_workspace_folders, "List Workspace Folder")
        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Go to Definition in Vertical Split")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        -- Highlight
        if
            client
            and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

            -- When cursor stops moving: Highlights all instances of the symbol under the cursor
            -- When cursor moves: Clears the highlighting
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            -- When LSP detaches: Clears the highlighting
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                end,
            })
        end
    end,
})


-- █▀▄ █ ▄▀▄ ▄▀  █▄ █ ▄▀▄ ▄▀▀ ▀█▀ █ ▄▀▀
-- █▄▀ █ █▀█ ▀▄█ █ ▀█ ▀▄▀ ▄██  █  █ ▀▄▄

-- DIAGNOSTIC

vim.diagnostic.config({
    virtual_lines = false,
    -- virtual_lines = {
    -- 	current_line = true,
    -- },
    virtual_text = false,
    underline = true,
    severity_sort = true,
    update_in_insert = true,
    jump = { float = true },
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})


-- ▄▀▀ ▄▀▄ █▄ ▄█ █▀▄ █   ██▀ ▀█▀ █ ▄▀▄ █▄ █
-- ▀▄▄ ▀▄▀ █ ▀ █ █▀  █▄▄ █▄▄  █  █ ▀▄▀ █ ▀█

-- COMPLETION

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        -- Completion menu auto popup
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion, event.buf) then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end
    end
})
