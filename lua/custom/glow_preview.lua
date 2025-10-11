-- ===========================
-- Render markdown file with Glow
-- ===========================

local M = {}

--- @param split string|nil The split direction ("right", "left", "up", "down"). Defaults to current window.
function M.render_md_with_glow(split)
	local current_file = vim.fn.expand("%:p")

	if vim.fn.filereadable(current_file) == 1 and vim.fn.expand("%:e") == "md" then
		-- Check if Glow is available
		if vim.fn.executable("glow") == 0 then
			vim.notify("Glow is not installed.", vim.log.levels.WARN)
			return
		end

		-- Split?
		if split then
			local split_cmd = ({
				right = "rightbelow vsplit",
				left = "leftabove vsplit",
				up = "aboveleft split",
				down = "belowright split",
			})[split]

			if split_cmd then
				vim.cmd(split_cmd)
			else
				vim.notify("Invalid split direction: " .. split, vim.log.levels.ERROR)
				return
			end
		end

		-- Get the new buffer and window
		local glow_win = vim.api.nvim_get_current_win()
		local glow_bufnr = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer

		-- Set the new buffer for the split window
		vim.api.nvim_win_set_buf(glow_win, glow_bufnr)

		-- Get Glow output
		local glow_output = vim.fn.systemlist("glow " .. vim.fn.shellescape(current_file))

		-- Set buffer contents
		vim.api.nvim_buf_set_lines(glow_bufnr, 0, -1, false, glow_output)

		-- Set buffer as scratch
		vim.opt_local.buftype = "nofile"
		vim.opt_local.filetype = "markedown"
		vim.opt_local.bufhidden = "wipe"
		vim.opt_local.modifiable = false
		vim.opt_local.readonly = true
		vim.opt_local.swapfile = false

		-- Optional UI settings for readability
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
		vim.opt_local.foldcolumn = "0"
		vim.opt_local.list = false
		vim.opt_local.wrap = true

		-- Keymap
		vim.keymap.set("n", "q", function()
			vim.api.nvim_buf_delete(glow_bufnr, { force = true }) -- Close buffer
		end, { buffer = glow_bufnr, noremap = true, silent = true })
	else
		vim.notify("Current file is not a Markdown file.", vim.log.levels.WARN)
	end
end

--- Render a Markdown file using Glow (in terminal) with color in a split or the current window.
--- @param split string|nil The split direction ("right", "left", "up", "down"). Defaults to current window.
function M.render_md_with_glow_color(split)
	local current_file = vim.fn.expand("%:p")

	if vim.fn.filereadable(current_file) == 1 and vim.fn.expand("%:e") == "md" then
		-- Check if Glow is installed
		if vim.fn.executable("glow") == 0 then
			vim.notify("Glow is not installed.", vim.log.levels.WARN)
			return
		end

		-- Split?
		if split then
			local split_cmd = ({
				right = "rightbelow vsplit",
				left = "leftabove vsplit",
				up = "aboveleft split",
				down = "belowright split",
			})[split]

			if split_cmd then
				vim.cmd(split_cmd)
			else
				vim.notify("Invalid split direction: " .. split, vim.log.levels.ERROR)
				return
			end
		end

		-- Get the new window
		local glow_win = vim.api.nvim_get_current_win()

		-- Create a terminal buffer and run glow
		vim.cmd("terminal glow " .. vim.fn.shellescape(current_file))

		-- Get buffer number of the terminal
		local glow_bufnr = vim.api.nvim_get_current_buf()

		-- Set buffer options
		vim.bo[glow_bufnr].modifiable = false
		vim.bo[glow_bufnr].buftype = "terminal"
		vim.bo[glow_bufnr].bufhidden = "wipe"
		vim.bo[glow_bufnr].swapfile = false

		-- Disable line numbers, sign column, and other UI elements
		vim.wo[glow_win].number = false
		vim.wo[glow_win].relativenumber = false
		vim.wo[glow_win].signcolumn = "no"
		vim.wo[glow_win].foldcolumn = "0"
		vim.wo[glow_win].list = false
		vim.wo[glow_win].wrap = true

		-- Prevent accidental insert mode entry
		vim.keymap.set("n", "i", "<NOP>", { buffer = glow_bufnr, noremap = true, silent = true })
		vim.keymap.set("n", "a", "<NOP>", { buffer = glow_bufnr, noremap = true, silent = true })
		vim.keymap.set("n", "o", "<NOP>", { buffer = glow_bufnr, noremap = true, silent = true })

		vim.keymap.set("n", "q", function()
			vim.api.nvim_buf_delete(glow_bufnr, { force = true }) -- Close buffer
		end, { buffer = glow_bufnr, noremap = true, silent = true })
	else
		vim.notify("Current file is not a Markdown file.", vim.log.levels.WARN)
	end
end

vim.api.nvim_create_user_command("GlowPreview", function(opts)
	M.render_md_with_glow(opts.args ~= "" and opts.args or nil)
end, {
	desc = "Render markdown with glow (no color) in optional split",
	nargs = "?", -- Allows an optional argument
})

vim.api.nvim_create_user_command("GlowPreviewColored", function(opts)
	M.render_md_with_glow_color(opts.args ~= "" and opts.args or nil)
end, {
	desc = "Render markdown with glow (colored) in optional split",
	nargs = "?", -- Allows an optional argument
})

return M
