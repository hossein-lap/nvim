-- map {{{
local function map(mode, key, command, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, command, options)
end
-- }}}

local opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
--	position = 'left',
	position = 'right',
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = 'Pmenu',
	autofold_depth = 1,
	auto_unfold_hover = false,
	fold_markers = { '', '' },
	wrap = false,
	-- These keymaps can be a string or a table for multiple keys
	keymaps = {
		close = {"<Esc>", "q"},
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = " ", hl = "@text.uri" },
		Package = { icon = " ", hl = "@namespace" },
		Module = { icon = " ", hl = "@namespace" },
		Method = { icon = " ", hl = "@method" },
		Object = { icon = "⦿ ", hl = "@type" },
		Class = { icon = "𝓒 ", hl = "@type" },
		Namespace = { icon = " ", hl = "@namespace" },
		Property = { icon = " ", hl = "@method" },
		Field = { icon = " ", hl = "@field" },
		Constructor = { icon = " ", hl = "@constructor" },
		Enum = { icon = "ℰ ", hl = "@type" },
		Interface = { icon = "ﰮ ", hl = "@type" },
		Function = { icon = "ƒ ", hl = "@function" },
		Variable = { icon = " ", hl = "@constant" },
		Constant = { icon = " ", hl = "@constant" },
		String = { icon = "𝓐 ", hl = "@string" },
		Number = { icon = "# ", hl = "@number" },
		Boolean = { icon = "⊨ ", hl = "@boolean" },
		Array = { icon = " ", hl = "@constant" },
		Key = { icon = " ", hl = "@type" },
		Null = { icon = "∅ ", hl = "@type" },
		EnumMember = { icon = " ", hl = "@field" },
		Struct = { icon = "𝓢 ", hl = "@type" },
		Event = { icon = "🗲 ", hl = "@type" },
		Operator = { icon = "+ ", hl = "@operator" },
		TypeParameter = { icon = "𝙏 ", hl = "@parameter" },
		Component = { icon = " ", hl = "@function" },
		Fragment = { icon = " ", hl = "@constant" },
	},
}

require("symbols-outline").setup(opts)

map('n', '<leader>fs', ':SymbolsOutline<CR><C-w>w', {desc = 'Programming Symbols'})
