-- config
require'nvim-treesitter.configs'.setup {
--	parser_install_dir = "~/.config/nvim/plugin/treesitter-parsers",
	-- A list of parser names, or "all"
	ensure_installed = {
		"lua", "bash", "c", "latex", "go", "rust", "perl", "r", "javascript", "typescript"
	},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
}
