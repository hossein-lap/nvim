-- helper {{{
-- autocmd function {{{
local function au(commands, patterns, evnt)
	if evnt == nil then
		evnt = 'FileType'
	end
	vim.api.nvim_create_autocmd(evnt, {
		pattern = patterns,
		command = commands,
--		 group = patterns .. 'groups'
	})
end
-- }}}
-- keymap function {{{
local function map(mode, key, command, opts)
	if not mode or not key then
		vim.notify('map(mode, key) must have at least two arguments', 4,
		           {title = 'Error on using map()'})
		return 1
	end
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	api.nvim_set_keymap(mode, key, command, options)
end
-- umap 
local function umap(mode, key)
	if not mode or not key then
		vim.notify('umap(mode, key) must have both arguments', 4,
		           {title = 'Error on using umap()'})
		return 1
	end
	api.nvim_del_keymap(mode, key)
end
-- }}}
-- }}}

-- autocmds {{{
au("set filetype=nroff", {'*.me'},    {'BufRead', 'BufNewFile'})
au("set filetype=nroff", {'*.ms'},    {'BufRead', 'BufNewFile'})
au("set filetype=nroff", {'*.mm'},    {'BufRead', 'BufNewFile'})
au("set filetype=nim",   {'*.nim'},   {'BufRead', 'BufNewFile'})
au("set filetype=c",     {'*.h'},     {'BufRead', 'BufNewFile'})
au("set filetype=json",  {'*.theme'}, {'BufRead', 'BufNewFile'})
au("set filetype=nasm",  {'*.s'},     {'BufRead', 'BufNewFile'})
au("set filetype=sent",  {'*.sent'},  {'BufRead', 'BufNewFile'})
au("set filetype=tex",   {'plaintex'})
au("set filetype=nasm",  {'asm'})
au("set filetype=qml",   {'*.qml'},   {'BufRead', 'BufNewFile'})

au("set noexpandtab",    {'c', 'make', 'nasm'})
-- au("set tabstop=8",      {'c', 'make', 'nasm'})
-- au("set softtabstop=8",  {'c', 'make', 'nasm'})
-- au("set shiftwidth=8",   {'c', 'make', 'nasm'})
au("set tabstop=2",      {'sent', 'yaml', 'text', 'html', 'xml'})
au("set softtabstop=2",  {'sent', 'yaml', 'text', 'html', 'xml'})
au("set shiftwidth=2",   {'sent', 'yaml', 'text', 'html', 'xml'})

-- au("set tabstop=8", {
-- 	'c', 'lua', 'sh', 'bash', 'tex', 'vim', 'go'
-- })
-- au("set softtabstop=8", {
-- 	'c', 'lua', 'sh', 'bash', 'tex', 'vim', 'go'
-- })
-- au("set shiftwidth=8", {
-- 	'c', 'lua', 'sh', 'bash', 'tex', 'vim', 'go'
-- })
au("set noexpandtab", {
	'c', 'lua', 'sh', 'bash', 'tex', 'vim', 'go'
})

--vim.api.nvim_create_autocmd("ExitPre", {
--	pattern = "*.tex",
--	command = "silent !latexmk -c",
--})


--au(":silent lua AutoFillAll()", {
--	'c', 'cpp', 'python', 'lua', 'sh', 'make', 'tex',
--	'rmd', 'markdown', 'sent', 'text', 'go', 'rust',
--	'yaml', 'vim'
--})
-- }}}

-- -- FoldMethod
-- au("loadview", {}, { "BufRead" } )
-- au("mkview", {}, { "BufWrite" } )

-- ls {{{

local lsp_server = function()
	local msg = ''
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			-- return 'lsp'
			return client.name
		end
	end
	return msg
end

-- vim.cmd [[
-- 	set showtabline=2
-- 	set tabline=%!MyTabLine()  " custom tab pages line
--
-- 	function MyTabLine()
-- 		let s = ''
-- 		for i in range(tabpagenr('$'))
-- 			" select the highlighting
-- 			if i + 1 == tabpagenr()
-- 				let s ..= '%#TabLineSel#'
-- 			else
-- 				let s ..= '%#TabLine#'
-- 			endif
--
-- 			" set the tab page number (for mouse clicks)
-- 			let s ..= '%' .. (i + 1) .. 'T'
--
-- 			" " the label is made by MyTabLabel()
-- 			" let s ..= ' %{MyTabLabel(' .. (i + 1) .. ')} '
-- 		endfor
--
-- 		" after the last tab fill with TabLineFill and reset tab page nr
-- 		let s ..= '%#TabLineFill#%T'
--
-- 		" right-align the label to close the current tab page
-- 		if tabpagenr('$') > 1
-- 			let s ..= '%=%#TabLine#%999Xclose'
-- 		endif
--
-- 		return s
-- 	endfunction
-- ]]

local lsp_diag = function ()
	return " "
end

-- show status line
vim.opt.laststatus = 2
vim.opt.showtabline = 2

-- -- status line config
-- vim.opt.statusline = " %f %m %r%h%w %= "..string.format('     [%s]     ', lsp_diag()).." %c:%l/%L %P "..string.format('  %s  %s', vim.bo.filetype, lsp_server())
-- vim.opt.tabline = "%1*%.20t %= %b" -- string.format('%s', lsp_server())

-- }}}

-- sudo {{{

function PRE_EXEC(cmd, print_output)
	local exec_with = "sudo"
	local exec_args = "-p '' -S"

	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()
	if not password or #password == 0 then
		vim.notify("Invalid password, ".. exec_with .." aborted", 3, {title = 'PRE_EXEC()'})
		return false
	end
	local out = vim.fn.system(string.format("%s %s %s", exec_with, exec_args, cmd), password)
	if vim.v.shell_error ~= 0 then
		print("\r\n")
		vim.notify(out, 4, {title = 'PRE_EXEC()'})
		return false
	end
	if print_output then
		print("\r\n", out)
	end
	return true
end

function PRE_WRITE(tmpfile, filepath)
	if not tmpfile then tmpfile = vim.fn.tempname() end
	if not filepath then filepath = vim.fn.expand("%") end
	if not filepath or #filepath == 0 then
		vim.notify("E32: No file name", 4, {title = 'PRE_EXEC()'})
		return
	end
	-- `bs=1048576` is equivalent to `bs=1M` for GNU dd or `bs=1m` for BSD dd
	-- Both `bs=1M` and `bs=1m` are non-POSIX
	local cmd = string.format("dd if=%s of=%s bs=1048576",
	vim.fn.shellescape(tmpfile),
	vim.fn.shellescape(filepath))
	-- no need to check error as this fails the entire function
	vim.api.nvim_exec(string.format("write! %s", tmpfile), true)
	if PRE_EXEC(cmd) then
		vim.notify('', 2)
		vim.notify(string.format([["%s" written]], filepath), 2, {title = 'PRE_WRITE()'})
		vim.cmd("e!")
	end
	vim.fn.delete(tmpfile)
end

vim.keymap.set('n', '<leader>ws', ':lua PRE_WRITE()<CR>', {desc = 'privileged write'})

-- }}}

-- netrw {{{

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 80
vim.g.netrw_menu = 1
vim.g.netrw_sort_by = "exten"
vim.g.netrw_sort_direction = "normal"
vim.g.netrw_special_syntax = 1

vim.keymap.set("n", "<leader>fa", vim.cmd.Ex, {desc = "netrw - new buffer"})
vim.keymap.set("n", "<leader>fm", vim.cmd.Ex, {desc = "netrw - new buffer"})

-- }}}

-- figlet {{{

local bin = 'figlet'

---echo text to `figlet` and append its output to current file as comment.
--- `opts.text`: input string
--- `opts.size`: figlet font/size
--- `opts.ft`: current file's type (for comment leader)
--- `opts.upper`: enable uppercase output
---@param opts table
function Figlet(opts)
	if opts == nil then
		opts = { upper = true }
	end
	local text = opts.text or nil
	local size = opts.size or nil
	local upper = opts.upper or false
	local ft = opts.ft or vim.bo.filetype
	local comment = {
		lua = '--',
		python = '\\#',
		sh = '\\#',
		ruby = '\\#',
		perl = '\\#',
		c = '//',
		cpp = '//',
		go = '//',
		rust = '//',
		vim = '"',
		tex = '\\%',
		nroff = '.\\"',
		lisp = ';;',
		elisp = ';;',
	}
	local input = ''
	local cmd = ''
	local prompt = '> '

	if comment[ft] == nil then
		comment[ft] = '\\#'
	end

	if text == '' or text == nil then
		input = vim.fn.input(bin..' '..prompt)
	else
		input = text
	end

	if upper then
		input = string.upper(input)
	end

	if size == nil then
		size = '-f small'
	else
		prompt = string.format('(%s) %s', size, prompt)
		size = '-f '..size
	end

	-- Insert the output into the current file
	if input ~= nil then
		cmd = string.format([[:-1r !sh -c "%s %s '%s' %s | sed 's,^,%s ,'"]],
			bin, size, input, '2>/dev/null', comment[ft])
		vim.cmd(cmd)
	end
end

vim.keymap.set("n", "<leader>Fl", ":lua Figlet()<CR>",
	{desc = bin.." output as comment - no args", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fn", ":lua Figlet({size = 'standard'})<CR>",
	{desc = bin.." output as comment - standard font", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fs", ":lua Figlet({size = 'small'})<CR>",
	{desc = bin.." output as comment - small font", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fb", ":lua Figlet({size = 'big'})<CR>",
	{desc = bin.." output as comment - big font", silent = true, noremap = true})

-- }}}

-- -- scheme {{{
-- 
-- -- Shout out to primeagen --
-- 
-- ---set colorscheme with or without transparency
-- ---@param color string name on the colorscheme
-- ---@param alpha int set it nil to disable alpha
-- --- • default colorscheme is `ayu-dark`
-- function ColorThem(color, alpha)
-- --	if alpha == nil or alpha == '' or alpha == false then
-- --		alpha = 0
-- --	end
-- 
-- 	alpha = alpha or AlphaEnable
-- 
-- 	local defaultcolor = 'sunbather'
-- 	if color == nil or color == '' then
-- 		color = defaultcolor
-- 	end
-- 
-- --	local term = os.getenv("TERM")
-- --	if term ~= 'st-256color' or term ~= 'xterm-256color' then
-- --		local options = {
-- --			termguicolors = true,
-- --		}
-- --
-- --		for key,value in pairs(options) do
-- --			vim.o[key] = value
-- --		end
-- --	else
-- --		local options = {
-- --			termguicolors = false,
-- --		}
-- --
-- --		for key,value in pairs(options) do
-- --			vim.o[key] = value
-- --		end
-- --
-- --		color = 'default'
-- --	end
-- 
-- 	local schemestatus = pcall(vim.cmd.colorscheme, color)
-- 	if schemestatus == false then
-- 		vim.notify(string.format('%s: %s\n%s: %s', 'Colorscheme not found',
-- 			            color, 'Fallback scheme', defaultcolor), 3,
-- 			            { title = 'ColorThem()' })
-- 		color = defaultcolor
-- 
-- 		if pcall(vim.cmd.colorscheme, color) == false then
-- 			vim.notify(string.format('%s: %s\n%s', 'Also not found',
-- 						color, 'Falling back to default'), 3,
-- 						{ title = 'ColorThem()' })
-- 			color = 'default'
-- 		end
-- 	else
-- 		if defaultcolor == 'ayu-dark' then
-- 			local colors = require('ayu.colors')
-- 			require('ayu').setup({
-- 				overrides = function()
-- 					return { Comment = { fg = colors.comment } }
-- 				end
-- 			})
-- 		end
-- 	end
-- 
-- 	vim.cmd.colorscheme(color)
-- 
-- 	if color == 'onedark' then
-- 		require('onedark').setup {
-- 			style = 'darker'
-- 		}
-- 		require('onedark').load()
-- 	end
-- 
-- 	if alpha ~= 0 then
-- 		local sections = {
-- 			'Normal',
-- 			'NormalFloat',
-- 			'SignColumn',
-- 			'WhichKeyFloat',
-- 			'VertSplit',
-- 			'TabLineSel',
-- 			'FoldColumn',
-- 			-- 'Folded',
-- 			-- 'EndOfBuffer',
-- 			-- 'LineNr',
-- 			'CursorLineNr',
-- 		}
-- 
-- 		for i = 1, #sections do
-- 			vim.api.nvim_set_hl(0, sections[i], {bg = 'none'})
-- 		end
-- 
-- 		-- colorscheme
-- 		vim.api.nvim_set_hl(0, "StatusLine", {bg = '#121212', fg = '#ccccce'})
-- 		vim.api.nvim_set_hl(0, "StatusLineNC", {bg = '#ccccce', fg = '#121212'})
-- 
-- 		-- vim.g.terminal_color_0 = 'none'
-- 		-- vim.g.terminal_color_background = 'none'
-- 	end
-- end
-- 
-- -- -- term color {{{
-- -- local termcolor = 'solarized'
-- --
-- -- if termcolor == 'dracula' then
-- -- 	vim.g.terminal_color_0  = "#21222c"
-- -- 	vim.g.terminal_color_1  = "#ff5555"
-- -- 	vim.g.terminal_color_2  = "#50fa7b"
-- -- 	vim.g.terminal_color_3  = "#f1fa8c"
-- -- 	vim.g.terminal_color_4  = "#bd93f9"
-- -- 	vim.g.terminal_color_5  = "#ff79c6"
-- -- 	vim.g.terminal_color_6  = "#8be9fd"
-- -- 	vim.g.terminal_color_7  = "#bbbbbb"
-- -- 	vim.g.terminal_color_8  = "#6272a4"
-- -- 	vim.g.terminal_color_9  = "#ff6e6e"
-- -- 	vim.g.terminal_color_10 = "#69ff94"
-- -- 	vim.g.terminal_color_11 = "#ffffa5"
-- -- 	vim.g.terminal_color_12 = "#d6acff"
-- -- 	vim.g.terminal_color_13 = "#ff92df"
-- -- 	vim.g.terminal_color_14 = "#a4ffff"
-- -- 	vim.g.terminal_color_15 = "#ffffff"
-- -- elseif termcolor == 'solarized' then
-- -- 	vim.g.terminal_color_0  = "#073642"
-- -- 	vim.g.terminal_color_1  = "#dc322f"
-- -- 	vim.g.terminal_color_2  = "#859900"
-- -- 	vim.g.terminal_color_3  = "#b58900"
-- -- 	vim.g.terminal_color_4  = "#268bd2"
-- -- 	vim.g.terminal_color_5  = "#d33682"
-- -- 	vim.g.terminal_color_6  = "#2aa198"
-- -- 	vim.g.terminal_color_7  = "#eee8d5"
-- -- 	vim.g.terminal_color_8  = "#002b36"
-- -- 	vim.g.terminal_color_9  = "#cb4b16"
-- -- 	vim.g.terminal_color_10 = "#586e75"
-- -- 	vim.g.terminal_color_11 = "#657b83"
-- -- 	vim.g.terminal_color_12 = "#839496"
-- -- 	vim.g.terminal_color_13 = "#6c71c4"
-- -- 	vim.g.terminal_color_14 = "#93a1a1"
-- -- 	vim.g.terminal_color_15 = "#fdf6e3"
-- -- elseif termcolor == 'tango' then
-- -- 	vim.g.terminal_color_0  = "#2e3436"
-- -- 	vim.g.terminal_color_1  = "#cc0000"
-- -- 	vim.g.terminal_color_2  = "#4e9a06"
-- -- 	vim.g.terminal_color_3  = "#c4a000"
-- -- 	vim.g.terminal_color_4  = "#3465a4"
-- -- 	vim.g.terminal_color_5  = "#75507b"
-- -- 	vim.g.terminal_color_6  = "#06989a"
-- -- 	vim.g.terminal_color_7  = "#d3d7cf"
-- -- 	vim.g.terminal_color_8  = "#555753"
-- -- 	vim.g.terminal_color_9  = "#ef2929"
-- -- 	vim.g.terminal_color_10 = "#8ae234"
-- -- 	vim.g.terminal_color_11 = "#fce94f"
-- -- 	vim.g.terminal_color_12 = "#729fcf"
-- -- 	vim.g.terminal_color_13 = "#ad7fa8"
-- -- 	vim.g.terminal_color_14 = "#34e2e2"
-- -- 	vim.g.terminal_color_15 = "#eeeeec"
-- -- elseif termcolor == 'breeze' then
-- -- 	vim.g.terminal_color_0  = "#232627"
-- -- 	vim.g.terminal_color_1  = "#ed1515"
-- -- 	vim.g.terminal_color_2  = "#11d116"
-- -- 	vim.g.terminal_color_3  = "#f67400"
-- -- 	vim.g.terminal_color_4  = "#1d99f3"
-- -- 	vim.g.terminal_color_5  = "#9b59b6"
-- -- 	vim.g.terminal_color_6  = "#1abc9c"
-- -- 	vim.g.terminal_color_7  = "#fcfcfc"
-- -- 	vim.g.terminal_color_8  = "#7f8c8d"
-- -- 	vim.g.terminal_color_9  = "#c0392b"
-- -- 	vim.g.terminal_color_10 = "#1cdc9a"
-- -- 	vim.g.terminal_color_11 = "#fdbc4b"
-- -- 	vim.g.terminal_color_12 = "#3daee9"
-- -- 	vim.g.terminal_color_13 = "#8e44ad"
-- -- 	vim.g.terminal_color_14 = "#16a085"
-- -- 	vim.g.terminal_color_15 = "#ffffff"
-- -- elseif termcolor == 'vscode' then
-- -- 	vim.g.terminal_color_0 = "#000000"
-- -- 	vim.g.terminal_color_1 = "#cd3131"
-- -- 	vim.g.terminal_color_2 = "#0dbc79"
-- -- 	vim.g.terminal_color_3 = "#e5e510"
-- -- 	vim.g.terminal_color_4 = "#2472c8"
-- -- 	vim.g.terminal_color_5 = "#bc3fbc"
-- -- 	vim.g.terminal_color_6 = "#11a8cd"
-- -- 	vim.g.terminal_color_7 = "#e5e5e5"
-- -- 	vim.g.terminal_color_8 = "#666666"
-- -- 	vim.g.terminal_color_9 = "#f14c4c"
-- -- 	vim.g.terminal_color_10 = "#50fa7b"
-- -- 	vim.g.terminal_color_11 = "#f1fa8c"
-- -- 	vim.g.terminal_color_12 = "#3b8eea"
-- -- 	vim.g.terminal_color_13 = "#d670d6"
-- -- 	vim.g.terminal_color_14 = "#29b8db"
-- -- 	vim.g.terminal_color_15 = "#e5e5e5"
-- -- end
-- --
-- -- --local terminal_color_background	 = "#002b36"
-- -- --local terminal_color_foreground	 = "#cccccc"
-- -- --
-- -- --vim.cmd [[highlight FloatBorder guibg='#002b36' guifg='#cccccc']]
-- -- -- }}}
-- 
-- ColorThem(CurrentColorscheme, AlphaEnable)
-- 
-- -- }}}

