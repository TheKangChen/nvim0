-- ░█▄░█▒██▀░▄▀▄░█▒█░█░█▄▒▄█░░░▀█▀▒██▀▒█▀▄░▄▀▄
-- ░█▒▀█░█▄▄░▀▄▀░▀▄▀░█░█▒▀▒█▒░░█▄▄░█▄▄░█▀▄░▀▄▀

-- Author: Kang Chen
-- Created as a minimal plugin version of: https://github.com/TheKangChen/.dotfiles/tree/main/nvim

-- Inspired by: https://github.com/radleylewis/nvim-lite/tree/youtube_demo
-- Inspired by: https://github.com/SylvanFranklin/.config/tree/main/nvim

require("config.keymaps")
require("config.colorscheme")
require("config.options")
-- require("config.lazy") -- Toggle on if I decide to use some plugins
require("config.lsp")
require("config.customcmds")
require("config.autocmds")

-- TODO: add statusline
-- TODO: consider adding mini.nvim
-- TODO: Global todo list: TODO | FIX | NOTE | WARNING
