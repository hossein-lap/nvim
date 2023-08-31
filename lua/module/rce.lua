-- helper {{{
-- map() {{{
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
	vim.api.nvim_set_keymap(mode, key, command, options)
end
-- }}}
---- umap {{{
--local function umap(mode, key)
--	if not mode or not key then
--		vim.notify('umap(mode, key) must have at least two arguments', 4,
--			{title = 'Error on using umap()'})
--		return 1
--	end
--	vim.api.nvim_del_keymap(mode, key)
--end
---- }}}
---- autocmd {{{
--local function au(commands, patterns, evnt)
--	if evnt == nil then
--		evnt = 'FileType'
--	end
--	vim.api.nvim_create_autocmd(evnt, {
--		pattern = patterns,
--		command = commands,
----		 group = patterns .. 'groups'
--	})
--end
---- }}}
-- }}}

-- toggle TermWindowStyle {{{
local WindowStyles = {
	'h',
	'v',
	'f',
}

function WindowStyle_Toggle(i)
	TermWindowStyle = WindowStyles[i]
	vim.notify(string.format('term split => style: %s', TermWindowStyle),
		2, {title = 'WindowStyle_Toggle()'})
end

	for witem_counter = 1, #WindowStyles, 1 do
--		vim.notify(string.format('%s', bitem_counter) , 2)
		if #WindowStyles > 9 then
			vim.notify(string.format('You cannot have more than 9 themes\n%s',
					'WindowStyle_Toggle() mapping failed'), 4,
				{title = 'WindowStyle_Toggle()'})
			break
		end
		map("n", "<leader>vs"..witem_counter, ":lua WindowStyle_Toggle("..witem_counter..")<CR>",
			{ silent = true, desc = "term split: " .. WindowStyles[witem_counter] }
		)
	end
-- }}}

-- swtich pandoc configs {{{

	Pandoc_tmpl = 'en'

	-- article {{{
	Pandoc_article_list = {
		'dracula', 'solarized', 'nord',
		'english', 'monochrome',
		'persian', 'fa'
	}

	Pandoc_article_default = Pandoc_article_list[1]
	function Pandoc_article_switch(item)
		Pandoc_article_default = Pandoc_article_list[item]
		vim.notify(string.format('Pandoc article style => %s',
				Pandoc_article_default), 2,
			{title = 'Pandoc article style'})

			if Pandoc_article_default == 'fa' or Pandoc_article_default == 'persian' then
				Pandoc_tmpl = 'fa'
			else
				Pandoc_tmpl = 'en'
			end
		end

	for i = 1, #Pandoc_article_list, 1 do
		if #Pandoc_article_list > 10 then
			vim.notify(string.format('Pandoc_article_switch() mapping failed\n%s',
					'You cannot have more than 10 themes'), 4,
				{title = 'Pandoc_article_switch()'})
			break
		end
		map("n", "<leader>va"..i, ":lua Pandoc_article_switch("..i..")<CR>",
			{ silent = true, desc = "Pandoc: article › " .. Pandoc_article_list[i] }
		)
	end
	-- }}}

	-- beamer {{{
	Pandoc_beamer_list = {
		'en-manjaro', 'en-dracula', 'en-ubuntu',
		'fa-manjaro', 'fa-dracula', 'fa-ubuntu'
	}

	Pandoc_beamer_default = Pandoc_beamer_list[1]
	function Pandoc_beamer_switch(item)
		Pandoc_beamer_default = Pandoc_beamer_list[item]
		vim.notify(string.format('Pandoc beamer style switched => %s',
				Pandoc_beamer_default), 2,
			{title = 'Pandoc beamer style'})

			if string.match(Pandoc_beamer_default, 'fa') then
				Pandoc_tmpl = 'fa'
			else
				Pandoc_tmpl = 'en'
			end
	end

	for i = 1, #Pandoc_beamer_list, 1 do
		if #Pandoc_beamer_list > 9 then
			vim.notify(string.format('Pandoc_beamer_switch() mapping failed\n%s',
					'You cannot have more than 9 themes'), 4,
				{title = 'Pandoc_beamer_switch()'})
			break
		end
		map("n", "<leader>vb"..i, ":lua Pandoc_beamer_switch("..i..")<CR>",
			{ silent = true, desc = "Pandoc: beamer › " .. Pandoc_beamer_list[i] }
		)
	end
	-- }}}

-- }}}

-- terminals {{{

-- vertical terminal {{{
function Term_v(command)
	Buffercmd = 'vs '
	vim.api.nvim_command(Buffercmd)
	vim.api.nvim_command('set nornu nonu signcolumn=no')
	if command then
		vim.api.nvim_command("term " .. command)
	else
		vim.api.nvim_command('term')
	end
	vim.api.nvim_command('startinsert')
end
-- }}}

-- horizontal terminal {{{
function Term_h(command)
	Buffercmd = 'split '
	vim.api.nvim_command(Buffercmd)
	vim.api.nvim_command('set nornu nonu signcolumn=no')
	if command then
		vim.api.nvim_command("term " .. command)
	else
		vim.api.nvim_command('term')
	end
	vim.api.nvim_command('startinsert')
end
-- }}}

-- floating terminal {{{
function Term_f(command)
		local buf --, win
		buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer
		vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

		-- get dimensions {{{
		local width = vim.api.nvim_get_option("columns")
		local height = vim.api.nvim_get_option("lines")
		-- }}}
		-- calculate our floating window size {{{
		local scale = 0.9
		local win_height = math.ceil(height * scale - 4)
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

		local opts = {
			noautocmd = true,
			style = "minimal",
			border = borderstyle['round'],
			relative = "editor",
			width = win_width,
			height = win_height,
			row = row,
			col = col
		}

		-- and finally create it with buffer attached
		vim.api.nvim_open_win(buf, true, opts)

	vim.api.nvim_command('set nornu nonu')
	if command then
		vim.api.nvim_command("term " .. command)
	else
		vim.api.nvim_command('term')
	end
	vim.api.nvim_command('startinsert')
end
-- }}}

-- }}}

-- _run {{{
function _run(wrapped, windowstyle)
	if windowstyle == nil then
		windowstyle = TermWindowStyle
--		vim.notify(string.format('windowstyle is not set, swtiched to default (%s)',
--				windowstyle), 3,
--			{title = '_run'})
	end

	if windowstyle == 'v' then
		Term_v(wrapped)
	elseif windowstyle == 'h' then
		Term_h(wrapped)
	elseif windowstyle == 'f' then
		Term_f(wrapped)
	else
		vim.notify(string.format('** no windowstyle, %s',
				'falling back to `Term_h()`'), 3,
			{title = '_run'})
		Term_h(wrapped)
	end

--	vim.notify(wrapped, 2, {title = 'Command executed'})
end
-- }}}
-- _compile {{{
function _compile(command, list_type)
	if list_type == nil then
		list_type = 'l'
	end
	if command == nil then
		vim.notify('_compile() at least needs one <command> to execute',
		    3, {title = '_compile()'})
		return 289
	end
	-- for jumping to error right after execution, remove `get`
	   -- `cgetexpr` -> `cexpr`
	local cmd = string.format('%sgetexpr system("%s")', list_type, command)
	vim.api.nvim_command(cmd)
	vim.notify('[compile]: '..command, 2)
	vim.api.nvim_command(string.format('%swindow', list_type))
end
-- }}}
-- _debug {{{
function _debug(command, list_type)
	if list_type == nil then
		list_type = 'c'
	end
	if command == nil then
		vim.notify('_debug() at least needs one <command> to execute',
		    3, {title = '_debug()'})
		return 289
	end
	-- for jumping to error right after execution, remove `get`
	   -- `cgetexpr` -> `cexpr`
	local cmd = string.format('%sgetexpr system("%s")', list_type, command)
	vim.api.nvim_command(cmd)
	vim.notify('[debug]: '..command, 2)
	vim.api.nvim_command(string.format('%swindow', list_type))
end
-- }}}

-- Locationlist functions:

-- run {{{
function run(file_type)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local pandoc_path = string.format(' %s %s ',
		'-t ms', '--defaults ~/.config/pandoc/defaults/groff/groff.yaml')
	local rmd_pandoc_path = '/home/hos/.config/pandoc/defaults/dracula/dracula.yaml'
--	local pandoc_path = ' -t ms --highlight monochrome '

	local command = {
		c = './' .. out_name,
		cpp = './' .. out_name,
		rust = './' .. out_name,
		go = './' .. out_name,
		sent = 'sent ' .. src_name,
		text = 'sent ' .. src_name,
		markdown = string.format('pandoc %s %s -o %s.pdf',
			pandoc_path, src_name, out_name),
		nroff = string.format('groff %s %s > %s.pdf',
			src_name, '-m me -keUs -Tpdf', out_name), -- -egGjkpRstU
		rmd = string.format("%s %s = '%s', %s %s",
			[[Rscript -e "source('/home/hos/.config/pandoc/defaults/r/config.r');]],
			[[ rmarkdown::render(input]], src_name, [[output_yaml = ']]..rmd_pandoc_path,
			[['"]]),
	}

	if command[file_type] == nil then
		command[file_type] = './'..src_name
	end

	_run(command[file_type], TermWindowStyle)
end
-- }}}
-- compile {{{
function compile(file_type, wintype)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local pandoc_path = string.format(' %s%s/%s%s ',
	          '~/.config/pandoc/defaults/', Pandoc_article_default,
	          Pandoc_article_default, '.yaml')

	local command = {
		-- programs
		c = string.format('gcc %s -o %s', src_name, out_name),
		cpp = string.format('g++ %s -o %s', src_name, out_name),
		rust = 'rustc ' .. src_name,
		go = 'go build ' .. src_name,

		-- documents
		nroff = string.format('pdfroff -U -mspdf %s > %s.pdf', src_name, out_name),
		tex = 'xelatex ' .. src_name,
		markdown = string.format('pandoc --defaults %s %s -o %s.pdf',
		               pandoc_path, src_name, out_name),
		rmd = string.format([[%s(input='%s', %s, params='%s')"]],
			[[Rscript -e "rmarkdown::render]], src_name,
			[[output_format = 'pdf_document']], pandoc_path)
	}

	if command[file_type] == nil then
		vim.notify('No command is defined', 3, {title = 'triggerCompile()'})
		return 1
	end

	_compile(command[file_type], wintype)
end
-- }}}
-- quickfix {{{
function quickfix(file_type, wintype)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local pandoc_path = string.format(' %s%s/%s%s ',
	          '~/.config/pandoc/defaults/', Pandoc_article_default,
	          Pandoc_article_default, '.yaml')

	local command = {
		-- programs
		c = string.format('gcc -Wall %s -o %s', src_name, out_name),
		cpp = string.format('g++ -Wall %s -o %s', src_name, out_name),
		rust = 'rustc ' .. src_name,
		go = 'go build ' .. src_name,

		-- documents
		nroff = string.format('pdfroff -Wall -U -mspdf %s > %s.pdf', src_name, out_name),
		tex = 'xelatex ' .. src_name,
		markdown = string.format('pandoc --defaults %s %s -o %s.pdf',
		               pandoc_path, src_name, out_name),
		rmd = string.format([[%s(input='%s', %s, params='%s')"]],
			[[Rscript -e "rmarkdown::render]], src_name,
			[[output_format = 'pdf_document']], pandoc_path)
	}

	if command[file_type] == nil then
		vim.notify('No command is defined', 3, {title = 'Quickfix()'})
		return 1
	end

	_debug(command[file_type], wintype)
end
-- }}}

-- Keymaps {{{
---- Compile/Run/Debug
map('n', '<leader>fe',  ':lua run(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'Run current file' })
map('n', '<leader>fw',  ':lua compile(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'Compile current file' })
map('n', '<leader>fq',  ':lua quickfix(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'quickfix › Compile current file' })

---- makefile
map('n', '<leader>cc', ':lua _debug("make")<CR>',
		{ silent = true, desc = 'quickfix › make' })
map('n', '<leader>ca', ':lua _run("make")<CR>',
		{ silent = true, desc = 'make › all' })
map('n', '<leader>cd', ':lua _run("make clean")<CR>',
		{ silent = true, desc = 'make › clean' })
map('n', '<leader>cf', ':lua _run("make force")<CR>',
		{ silent = true, desc = 'make › force' })
map('n', '<leader>cF', ':lua _run("make full")<CR>',
		{ silent = true, desc = 'make › full' })

---- intractive shells
map('n', '<leader>ts', ':lua _run("bash", "f")<CR>',
	  { silent = true, desc = 'term › bash shell' })
map('n', '<leader>tz', ':lua _run("zsh")<CR>',
	  { silent = true, desc = 'term › zsh shell' })
--map('n', '<leader>td', ':lua _run("dash")<CR>',
--	  { silent = true, desc = 'term › dash shell' })
-- }}}
