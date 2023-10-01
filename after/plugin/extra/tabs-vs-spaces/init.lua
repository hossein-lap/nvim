require("tabs-vs-spaces").setup {
	-- Preferred indentation. Possible values: "auto"|"tabs"|"spaces".
	-- "auto" detects the dominant indentation style in a buffer and highlights deviations.
	indentation = "auto",
	-- Use a string like "DiagnosticUnderlineError" to link the `TabsVsSpace` highlight to another highlight.
	-- Or a table valid for `nvim_set_hl` - e.g. { fg = "MediumSlateBlue", undercurl = true }.
	highlight = "DiagnosticUnderlineHint",
	-- Priority of highight matches.
	priority = 20,
	ignore = {
		filetypes = {},
		-- Works for normal buffers by default.
		buftypes = {
			"acwrite",
			"help",
			"nofile",
			"nowrite",
			"quickfix",
			"terminal",
			"prompt",
		},
	},
	standartize_on_save = false,
	-- Enable or disable user commands see Readme.md/#Commands for more info.
	user_commands = true,
}
