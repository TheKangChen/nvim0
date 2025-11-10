-- █▄▀ ██▀ ▀▄▀ █▄ ▄█ ▄▀▄ █▀▄ ▄▀▀
-- █ █ █▄▄  █  █ ▀ █ █▀█ █▀  ▄██

-- KEYMAPS

-- Leader Keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Files
map("n", "<leader>qq", "<cmd>wqa<cr>", { noremap = false, desc = "Write & Quit All Buffer" })
map("n", "<leader>o", "<cmd>Open .<cr>", { noremap = false, desc = "Open File Explorer" })

-- Windows
map("n", "<leader>-", "<cmd>split<cr>", { silent = true, noremap = true, desc = "Window Horizontal Split" })
map("n", "<leader>\\", "<cmd>vsplit<cr>", { silent = true, noremap = true, desc = "Window Vertical Split" })
map("n", "<leader>_", "<cmd>bot sf #<cr>", { silent = true, noremap = true, desc = "Open Alt File in Split" })
map("n", "<leader>|", "<cmd>vert sf #<cr>", { silent = true, noremap = true, desc = "Open Alt File in Vertical Split" })

-- Window Navigation
map("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Focus window on top" })
map("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Focus window below" })
map("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Focus window left" })
map("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Focus window right" })

-- Buffer Navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to alternate file" })

-- File Navigation
-- TODO: Use plugins for this, this is miserable
map("n", "<leader>mm", "<cmd>Explore<cr>", { desc = "Open file explorer" })
map("n", "<leader>ff", ":find ", { desc = "Find file" })

-- Search
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Delete Without Yanking
map({ "n", "v" }, "<A-d>", '"_d', { desc = "Delete without yanking" })
map({ "n", "v" }, "<A-c>", '"_c', { desc = "Change without yanking" })

-- Move Lines Up/Down
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Indentation
---- Better Indenting In Visual Mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

---- Easier Indenting
map("n", "<A-l>", function()
    local col = vim.fn.col(".")
    vim.cmd("normal! >>")
    local shift = vim.fn.shiftwidth()
    vim.fn.cursor(0, col + shift)
end, { desc = "Indent line" })

map("n", "<A-h>", function()
    local col = vim.fn.col(".")
    vim.cmd("normal! <<")
    local shift = vim.fn.shiftwidth()
    vim.fn.cursor(0, math.max(1, col - shift))
end, { desc = "Unindent line" })

map("v", "<A-l>", function()
    local col = vim.fn.col(".")
    vim.cmd("normal! >gv")
    local shift = vim.fn.shiftwidth()
    vim.fn.cursor(0, col + shift)
end, { desc = "Indent selection" })

map("v", "<A-h>", function()
    local col = vim.fn.col(".")
    vim.cmd("normal! <gv")
    local shift = vim.fn.shiftwidth()
    vim.fn.cursor(0, col + shift)
end, { desc = "Unindent selection" })

-- Better Join Line
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick Config Editing
map("n", "<leader>rc", "<cmd>e $MYVIMRC<CR>", { desc = "Edit config" })

-- Colorscheme
map("n", "<leader>tr", "<cmd>ApplyTheme<cr>", { desc = "Switch to Regular Theme" })
map("n", "<leader>ta", "<cmd>ApplyTheme alt<cr>", { desc = "Switch to Alternative Theme" })

-- Center Cursor
map("n", "<leader>z", "<cmd>CenterCursor<cr>", { desc = "Toggle Center Cursor" })

-- Terminal
map("n", "<leader>T", "<cmd>OpenFloatTerm<cr>",
    { noremap = true, silent = true, desc = "Toggle floating terminal" })
map("t", "<Esc>", "<cmd>CloseTermFromTerm<cr>",
    { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- Preview Markdown with Glow
vim.keymap.set("n", "<leader>mp", "<cmd>GlowPreviewColored right<cr>", { desc = "Preview Markdown in Split (Glow)" })

-- Diagnostics
map(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { silent = true, noremap = true, desc = "Preview Diagnostic in Float" }
)
map(
    "n",
    "<leader>dl",
    vim.diagnostic.setloclist,
    { silent = true, noremap = true, desc = "Show Diagnostics in Location List" }
)
map(
    "n",
    "<leader>dx",
    "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>",
    { desc = "Toggle Diagnostics Virtual Text" }
)

-- Sessions
local local_session = "./session.local.vim"
local global_session_dir = vim.fn.stdpath('data') .. "/session"
local global_session = global_session_dir .. "/Session.global.vim"

map("n", "<leader>sS", function()
    if vim.fn.isdirectory(global_session_dir) == 0 then
        vim.fn.mkdir(global_session_dir, "p")
    end
    vim.cmd("mksession! " .. global_session)
    vim.notify("Global session written " .. global_session, vim.log.levels.INFO)
end, { silent = true, desc = "Save Session (global)" })
map("n", "<leader>ss", function()
    vim.cmd("mksession! " .. local_session)
    vim.notify("Local session written " .. local_session, vim.log.levels.INFO)
end, { silent = true, desc = "Save Session (local)" })
map("n", "<leader>sl", function()
    local session_file
    if vim.fn.filereadable(local_session) == 1 then
        session_file = local_session
    elseif vim.fn.filereadable(global_session) == 1 then
        session_file = global_session
    else
        vim.notify("Session file not found", vim.log.levels.WARN)
        return
    end
    vim.cmd("source " .. session_file)
    vim.notify("Session loaded: " .. session_file, vim.log.levels.INFO)
end, { silent = true, desc = "Save Session (local)" })

-- Quickfix
map("n", "<C-q>", "<cmd>copen<cr>", { silent = true, desc = "Open Quickfix Window" })
map("n", "<leader>a",
    function() vim.fn.setqflist({ { filename = vim.fn.expand("%"), lnum = 1, col = 1, text = vim.fn.expand("%"), } }, "a") end,
    { desc = "Add Current File to Quickfix" })
-- Quickfix buffer keymaps
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    group = vim.api.nvim_create_augroup("qf", { clear = true }),
    callback = function()
        if vim.bo.buftype == "quickfix" then
            map("n", "<leader>q", ":ccl<cr>", { buffer = true, silent = true, desc = "Close Quickfix" })
            map("n", "dd", function()
                local idx = vim.fn.line('.')
                local qflist = vim.fn.getqflist()
                table.remove(qflist, idx)
                vim.fn.setqflist(qflist, 'r')
            end, { buffer = true, desc = "Delete Quickfix Item" })
        end
    end,
})
-- Make quickfix act like harpoon
for i = 1, 9 do
    map('n', '<leader>' .. i, ':cc ' .. i .. '<cr>',
        { noremap = true, silent = true, desc = string.format("Go to #%d on Quickfix", i) })
end
