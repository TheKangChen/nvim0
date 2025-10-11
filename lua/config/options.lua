-- ▄▀▄ █▀▄ ▀█▀ █ ▄▀▄ █▄ █ ▄▀▀
-- ▀▄▀ █▀   █  █ ▀▄▀ █ ▀█ ▄██

-- OPTIONS

-- Visual Settings
vim.o.termguicolors = true
vim.o.signcolumn = 'yes'
vim.o.winborder = "rounded"
vim.o.winblend = 0     -- Window transparency
vim.o.pumheight = 10   -- Pop up menu height
vim.o.pumblend = 10    -- Pop up menu transparency
vim.o.showmode = true
vim.o.showmatch = true -- Highlight matching brackets
vim.o.smoothscroll = true
vim.o.conceallevel = 2
vim.o.lazyredraw = true -- Don't redraw during macros

-- Line Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 5 -- Keep at least n lines above/below cursor

-- File Settings
vim.o.swapfile = false
vim.o.undofile = true
vim.o.autoread = true   -- Auto reload changes outside of neovim
vim.o.autowrite = false -- Don't autosave

-- Behavior Settings
vim.o.updatetime = 500    -- Faster triggering of things like completions & autocmds
vim.o.timeoutlen = 500    -- Keymap timeout
vim.o.hidden = true       -- Allow hidden buffers
vim.o.errorbells = false
vim.o.autochdir = false   -- Don't auto change directory
vim.opt.path:append("**") -- Include subdirectories in fuzzy search
vim.o.mouse = 'a'         -- Allow mouse on all windows

-- Search Settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true -- Show matches as you type

-- Substitutions
vim.o.inccommand = 'split'

-- Completions
vim.o.completeopt =
"fuzzy,menuone,noinsert,popup,preview"                 -- Completion menu options
vim.o.wildmenu = true                                  -- Nicer completion menu for commands
vim.o.wildmode = "longest:full,full"                   -- Completion behavior
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc" }) -- Ignore filetype for completion

-- Diff Options
vim.opt.diffopt:append("linematch:60")

-- Performance Tuning
vim.opt.redrawtime = 10000    -- Allow up to 10 secs of redraw (better syntax highlighting for large files etc.)
vim.opt.maxmempattern = 20000 -- More memory for regex/patterns

-- Cursor
vim.opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Statusline
vim.o.laststatus = 3

-- Split Screen
vim.o.splitbelow = true
vim.o.splitright = true

-- Indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true
