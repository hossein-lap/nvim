local options = {
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	-- disable when recording or executing a macro
	disable_in_macro = false,
	-- disable when insert after visual block mode
	disable_in_visualblock = false,
	disable_in_replace_mode = true,
	ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
	enable_moveright = true,
	-- add bracket pairs after quote
	enable_afterquote = true,
	--- check bracket in same line
	enable_check_bracket_line = true,
	enable_bracket_in_quote = true,
	-- trigger abbreviation
	enable_abbr = false,
	-- switch for basic rule break undo sequence
	break_undo = true,
	check_ts = false,
	map_cr = true,
	-- map the <BS> key
	map_bs = true,
	-- Map the <C-h> key to delete a pair
	map_c_h = false,
	-- map <c-w> to delete a pair if possible
	map_c_w = false,
}

require('nvim-autopairs').setup(options)
