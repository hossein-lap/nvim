local length = 1

-- colors {{{
local colors = {
	bg       = '#202328',
	fg       = '#bbc2cf',
	yellow   = '#ECBE7B',
	cyan     = '#008080',
	darkblue = '#081633',
	green    = '#98be65',
	orange   = '#FF8800',
	violet   = '#a9a1e1',
	magenta  = '#c678dd',
	blue     = '#51afef',
	red      = '#ec5f67',
}
-- }}}
-- conditions {{{
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand('%:p:h')
		local gitdir = vim.fn.finddir('.git', filepath .. ';')
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}
-- }}}
-- configs {{{
local config = {
	options = {
		-- Disable sections and component separators
		component_separators = { left = '›', right = '‹'},
--		component_separators = { left = '⟩', right = '⟨'},
		section_separators = { left = '', right = ''},
--		theme = 'ayu',
--		theme = 'dracula-nvim',
--		theme = 'solarized',
--		theme = '256noir',
--		theme = {
--			-- We are going to use lualine_c an lualine_x as left and
--			-- right section. Both are highlighted by c theme . So we
--			-- are just setting default looks o statusline
--			normal = { a = { fg = colors.fg, bg = colors.bg } },
--			inactive = { a = { fg = colors.fg, bg = colors.bg } },
--		},
--		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
		-- These will be filled later
	},
}
-- }}}
-- aliases {{{
-- insert {{{
-- lualine_a
local function botinsert_left_a(component)
	table.insert(config.sections.lualine_a, component)
end
-- lualine_b
local function botinsert_left_b(component)
	table.insert(config.sections.lualine_b, component)
end
-- lualine_c
local function botinsert_left_c(component)
	table.insert(config.sections.lualine_c, component)
end
------------------------------------------------------------------------------
-- lualine_b_inactive
local function botinsert_inact_b(component)
	table.insert(config.inactive_sections.lualine_b, component)
end
------------------------------------------------------------------------------
-- lualine_x
local function botinsert_right_x(component)
	table.insert(config.sections.lualine_x, component)
end
-- lualine_y
local function botinsert_right_y(component)
	table.insert(config.sections.lualine_y, component)
end
-- lualine_z
local function botinsert_right_z(component)
	table.insert(config.sections.lualine_z, component)
end
---===≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡≡===---
-- tabline_a
local function topinsert_left_a(component)
	table.insert(config.tabline.lualine_a, component)
end
-- tabline_b
local function topinsert_left_b(component)
	table.insert(config.tabline.lualine_b, component)
end
-- tabline_c
local function topinsert_left_c(component)
	table.insert(config.tabline.lualine_c, component)
end
------------------------------------------------------------------------------
-- tabline_x
local function topinsert_right_x(component)
	table.insert(config.tabline.lualine_x, component)
end
-- tabline_y
local function topinsert_right_y(component)
	table.insert(config.tabline.lualine_y, component)
end
-- tabline_z
local function topinsert_right_z(component)
	table.insert(config.tabline.lualine_z, component)
end
-- }}}
-- basename {{{
local function Split(s, delimiter)
	local result = {};
	for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		table.insert(result, match);
	end
	return result;
end
local function basename()
	local myString = vim.fn.expand('%:p')
	local split_string = Split(myString, "/")

	local i = 0
	for _ in pairs(split_string) do
		i = i + 1
	end
--  
	local base = string.format(' %s', split_string[i - 1])
	return base
end
-- }}}
-- autofill sym {{{
local function showautofill()
	local Achar = ''
	local Mchar = ''
	local Schar = ''
	local ft = vim.bo.filetype

	if Autofill then
		Achar = 'α'
	end

	if ft == 'markdown' or ft == 'rmd' then
		if Mautofill then
			Mchar = 'μ'
		end
	end

	if ft == 'sent' or ft == 'text' then
		if Sautofill then
			Mchar = 'Σ'
		end
	end
	return Achar .. Mchar .. Schar
end
-- }}}
-- split sym {{{
local function ShowSplitMode()
	if WindowStyle then
		return WindowStyle:sub(1,length)
	else
		return ''
	end
end
-- }}}
-- filetype {{{
local function currfiletype()
	if vim.bo.filetype == '' then
		return 'None'
	else
		return vim.bo.filetype
	end
end
-- }}}
-- }}}
-- compnents {{{
-- top-line {{{
---- sep {{{
--topinsert_left_a {
--	function()
--		return '▊'
--	end,
--	color = { fg = colors.blue }, -- Sets highlighting of component
--	padding = { left = 0, right = 0 }, -- We don't need space before this
--}
---- }}}
---- void icon {{{
--topinsert_left_a {
--	function()
--		return ''
--	end,
----	--	color {{{
----	color = function()
----		-- auto change color according to neovims mode
----		local mode_color = {
----			n = colors.red,
----			i = colors.green,
----			v = colors.blue,
----			[''] = colors.blue,
----			V = colors.blue,
----			c = colors.magenta,
----			no = colors.red,
----			s = colors.orange,
----			S = colors.orange,
----			[''] = colors.orange,
----			ic = colors.yellow,
----			R = colors.violet,
----			Rv = colors.violet,
----			cv = colors.red,
----			ce = colors.red,
----			r = colors.cyan,
----			rm = colors.cyan,
----			['r?'] = colors.cyan,
----			['!'] = colors.red,
----			t = colors.red,
----		}
----		return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
----	end,
----	--	}}}
--	padding = { right = 1, left = 1 },
--}
---- }}}
-- gear icon {{{
topinsert_left_a {
	function()
		return ''
	end,
--	--	color {{{
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = colors.red,
--			i = colors.green,
--			v = colors.blue,
--			[''] = colors.blue,
--			V = colors.blue,
--			c = colors.magenta,
--			no = colors.red,
--			s = colors.orange,
--			S = colors.orange,
--			[''] = colors.orange,
--			ic = colors.yellow,
--			R = colors.violet,
--			Rv = colors.violet,
--			cv = colors.red,
--			ce = colors.red,
--			r = colors.cyan,
--			rm = colors.cyan,
--			['r?'] = colors.cyan,
--			['!'] = colors.red,
--			t = colors.red,
--		}
--		return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
--	end,
--	--	}}}
	padding = { right = 1, left = 1 },
}
-- }}}
-- Lsp server name {{{
topinsert_left_b {
	function()
		local msg = 'nil'
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
--	icon = '',
--	color = { fg = '#ffffff', gui = 'none' },
}
-- }}}
-- diagnostics {{{
topinsert_left_c {
	'diagnostics',
	sources = { 'nvim_diagnostic' },
	symbols = { error = '×', warn = '!', info = '?', hint = '∗' },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
}
-- }}}
-- git-diff {{{
topinsert_left_c {
	'diff',
	-- Is it me or the symbol for modified us really weird
--	symbols = { added = ' ', modified = '柳', removed = ' ' },
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.orange },
		removed = { fg = colors.red },
	},
--	cond = conditions.hide_in_width,
}
-- }}}
--
-- vim icon {{{
topinsert_right_z {
	function()
		return ''
	end,
--	-- color {{{
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = colors.red,
--			i = colors.green,
--			v = colors.blue,
--			[''] = colors.blue,
--			V = colors.blue,
--			c = colors.magenta,
--			no = colors.red,
--			s = colors.orange,
--			S = colors.orange,
--			[''] = colors.orange,
--			ic = colors.yellow,
--			R = colors.violet,
--			Rv = colors.violet,
--			cv = colors.red,
--			ce = colors.red,
--			r = colors.cyan,
--			rm = colors.cyan,
--			['r?'] = colors.cyan,
--			['!'] = colors.red,
--			t = colors.red,
--		}
--		return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
--	end,
--	-- }}}
	padding = { right = 1, left = 1 },
}
-- }}}
topinsert_right_x {showautofill} -- autofill char
topinsert_right_x {ShowSplitMode}
topinsert_right_x {'fileformat'} -- fileformat
topinsert_right_x { -- size
	'filesize',
	cond = conditions.buffer_not_empty,
}
topinsert_right_y {
	'branch',
	icon = '',
--	color = { fg = colors.violet, gui = 'bold' },
}
---- sep {{{
--topinsert_right_z {
--	function()
--		return '▊'
--	end,
--	color = { fg = colors.blue }, -- Sets highlighting of component
--	padding = { left = 0, right = 0 }, -- We don't need space before this
--}
---- }}}
-- }}}

-- inactive {{{
botinsert_inact_b { 'filename' } -- base dir
-- }}}

-- bottom-line {{{
---- mode (evil) {{{
--botinsert_left_b {
--	-- mode component
--	function()
--		return ''
--	end,
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = colors.red,
--			i = colors.green,
--			v = colors.blue,
--			[''] = colors.blue,
--			V = colors.blue,
--			c = colors.magenta,
--			no = colors.red,
--			s = colors.orange,
--			S = colors.orange,
--			[''] = colors.orange,
--			ic = colors.yellow,
--			R = colors.violet,
--			Rv = colors.violet,
--			cv = colors.red,
--			ce = colors.red,
--			r = colors.cyan,
--			rm = colors.cyan,
--			['r?'] = colors.cyan,
--			['!'] = colors.red,
--			t = colors.red,
--		}
--		return { fg = mode_color[vim.fn.mode()] }
--	end,
--	padding = { right = 1, left = 1 },
--}
---- }}}

-- mode {{{
botinsert_left_a {
	'mode',
	fmt = function(str)
		return str:sub(1,length)
	end
}
-- }}}
botinsert_left_b { basename } -- base dir
botinsert_left_b {'%f'} -- filename
botinsert_left_c {'%m'} -- modified sym
botinsert_right_x {'%l/%L:%c'} -- cursor position
--botinsert_right_y {currfiletype} -- file type
-- filetype with icon {{{
botinsert_right_y {
	'filetype',
	colored = false,
	icon_only = false,
	icon = { align = 'left' }
}
-- }}}
-- evil icon {{{
botinsert_right_z {
	function()
		return ''
	end,
--	--	color {{{
--	color = function()
--		-- auto change color according to neovims mode
--		local mode_color = {
--			n = colors.red,
--			i = colors.green,
--			v = colors.blue,
--			[''] = colors.blue,
--			V = colors.blue,
--			c = colors.magenta,
--			no = colors.red,
--			s = colors.orange,
--			S = colors.orange,
--			[''] = colors.orange,
--			ic = colors.yellow,
--			R = colors.violet,
--			Rv = colors.violet,
--			cv = colors.red,
--			ce = colors.red,
--			r = colors.cyan,
--			rm = colors.cyan,
--			['r?'] = colors.cyan,
--			['!'] = colors.red,
--			t = colors.red,
--		}
--		return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
--	end,
--	--	}}}
	padding = { right = 1, left = 1 },
}
-- }}}
--botinsert_right_z {'progress'} -- file progress
-- }}}
-- }}}

require('lualine').setup(config)
