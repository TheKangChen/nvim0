return {
	cmd = { "harper-ls", "--stdio" },
	filetypes = {
		"gitcommit",
		"html",
		"markdown",
		"typst",
	},
	root_markers = { ".git" },
	settings = {
		["harper-ls"] = {
			userDictPath = "",
			fileDictPath = "",
			linters = {
				SpellCheck = true,
				SpelledNumbers = false,
				AnA = true,
				SentenceCapitalization = true,
				UnclosedQuotes = true,
				WrongQuotes = false,
				LongSentences = true,
				RepeatedWords = true,
				Spaces = true,
				Matcher = true,
				CorrectNumberSuffix = true,
			},
			codeActions = {
				ForceStable = false,
			},
			markdown = {
				IgnoreLinkTitle = true,
			},
			diagnosticSeverity = "hint",
			isolateEnglish = false,
		},
	},
	single_file_support = true,
	-- log_level = vim.lsp.protocol.MessageType.Warning,
}
