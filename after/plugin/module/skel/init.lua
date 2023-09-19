local skels = os.getenv("HOME")..'/.config/nvim/skels/'

local mapopts = {
	noremap = true,
	silent = true,
}

-- put skel into current file {{{
function Skel_put(name, win_name)
	local cwin = vim.api.nvim_get_current_win()
	local cbuf = vim.api.nvim_get_current_buf()
	local buf = vim.api.nvim_win_get_number(win_name)
	local line, column = unpack(vim.api.nvim_win_get_cursor(win_name))
	local file = {
		C = 'c',
		['C++'] = 'cpp',
		Python = 'py',
		Lua = 'lua',
		Bash = 'sh',
		['dmenu - bash'] = 'dm.sh',
		TeX = 'tex',
		Markdown = 'md',
		['Groff - ms'] = 'ms',
		['Groff - me'] = 'me',
		['R Markdown'] = 'rmd',
	}
	name = string.gsub(name, ' • ', '')
	-- vim.notify(string.format('line: %s, column: %s\n', line, column), 2)
	-- vim.notify(string.format('filename: %s, buf: %s\n', files[name], buf), 2)
	-- vim.notify(string.format('window: %s, buffer: %s\n', cwin, cbuf), 2)
	-- -- vim.cmd(string.format(':-1r %s', skels..'skel.'..name))
	-- -- vim.api.nvim_buf_set_text(buf, line, 0, line + 2, #name, {name})

	if name == 'Lorem Ipsum' then
		local lnum = tonumber(vim.fn.input('Lorem Ipsum > '))
		if type(lnum) ~= 'number' then
			vim.notify(' **You MUST enter a number as input**\n', 4,
				{title = 'Lorem Ipsum'})
			return 39
		end
		vim.api.nvim_buf_call(buf, function()
			vim.cmd(string.format(':-1r %sloremipsum/lipsum%s.txt', skels, lnum))
		end)
	else
		vim.api.nvim_buf_call(buf, function()
			vim.cmd(string.format(':-1r %s', skels..'skel.'..file[name]))
		end)
	end

	vim.api.nvim_win_close(cwin, {force = true})
	vim.api.nvim_buf_delete(cbuf, {force = true})
	vim.cmd('setlocal noignorecase')
end
-- }}}

-- menu {{{
function Skel_filelist()
	-- get the path of the directory to list
	local dir_path = skels --vim.fn.input("Enter directory path: ")
	local langs = {
		'C',
		'C++',
		'Python',
		'Lua',
		'Bash',
		'dmenu - bash',
		'TeX',
		'Markdown',
		'Groff - ms',
		'Groff - me',
		'R Markdown',
		'Lorem Ipsum',
	}

	-- list the files in the directory
	local files = {}
	local file_names = vim.fn.readdir(dir_path)
	if file_names then
		for key, name in ipairs(langs) do
			local path = ' • ' .. name
			if vim.fn.isdirectory(path) == 0 then
				-- if string.find(name, '#') ~= 1 then
					table.insert(files, path)
				-- end
			end
		end
	end

	-- define window {{{

	local buf, win
		buf = vim.api.nvim_create_buf(true, true) -- create new emtpy buffer
		win = vim.api.nvim_get_current_win()
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- get dimensions {{{
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")
	-- }}}
	-- calculate our floating window size {{{
	local scale = 0.4
	local win_height = math.ceil(height * scale)
	local win_width = math.ceil(width * scale)
	-- }}}
	-- and its starting position {{{
	local row = math.ceil((height - win_height) / 2 - 2)
	local col = math.ceil((width - win_width) / 2)
	-- }}}
	-- border style {{{
	local border_color = 'Number'
	local borderstyle = {
		ascii = {
			{ "/", border_color },
			{ "-", border_color },
			{ "\\", border_color },
			{ "|", border_color },
		},
		single = {
			{ "┌", border_color },
			{ "─", border_color },
			{ "┐", border_color },
			{ "│", border_color },
			{ "┘", border_color },
			{ "─", border_color },
			{ "└", border_color },
			{ "│", border_color },
		},
		double = {
			{ "╔", border_color },
			{ "═", border_color },
			{ "╗", border_color },
			{ "║", border_color },
			{ "╝", border_color },
			{ "═", border_color },
			{ "╚", border_color },
			{ "║", border_color },
		},
		round = {
			{ "╭", border_color },
			{ "─", border_color },
			{ "╮", border_color },
			{ "│", border_color },
			{ "╯", border_color },
			{ "─", border_color },
			{ "╰", border_color },
			{ "│", border_color },
		},
	}
	-- }}}
	-- settings {{{
	local opts = {
		noautocmd = true,
		style = "minimal",
		border = borderstyle.double,
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}
	-- }}}

	-- }}}

	-- open the window
	vim.api.nvim_buf_set_name(buf, "Templates")
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "filetype", "skels")
	vim.api.nvim_buf_set_option(buf, "bufhidden", "delete")
	vim.api.nvim_win_set_option(win, 'winhighlight', 'Normal:Normal')
		-- vim.api.nvim_buf_set_option(buf, "buftype", "acwrite")
	-- set the buffer contents to the file list
		-- vim.api.nvim_buf_set_lines(buf, 0, #files, true, files)

	vim.api.nvim_buf_set_lines(buf, 0, -1, true, files)
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
	vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q!<CR>', mapopts)
	vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc><Esc>', ':q!<CR>', mapopts)
	local wrapwin = ':lua Skel_put(vim.api.nvim_get_current_line(),'..win..')'
	vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', wrapwin..'<CR>', mapopts)
	vim.cmd('setlocal signcolumn=yes ignorecase')
end
-- }}}

vim.keymap.set('n', '<leader>tm', ':lua Skel_filelist()<CR>', mapopts)

