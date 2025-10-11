return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
		".git",
	},
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
				typeCheckingMode = "basic",
				-- ignore = { "*" },
			},
		},
	},
	single_file_support = true,
	-- log_level = vim.lsp.protocol.MessageType.Warning,
}
