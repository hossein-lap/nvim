--* run, compile and debug using `:term` and `:cgetexpr system()` *--
-- TODO: Write the proper documentation
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

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
		vim.keymap.set("n", "<localleader>va"..i, ":lua Pandoc_article_switch("..i..")<CR>",
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
		vim.keymap.set("n", "<localleader>vb"..i, ":lua Pandoc_beamer_switch("..i..")<CR>",
			{ silent = true, desc = "Pandoc: beamer › " .. Pandoc_beamer_list[i] }
		)
	end
	-- }}}

-- }}}

-- floating terminal {{{
function float_term(opts)
	local work, title, cmd
		work = opts.work
		cmd = opts.cmd or 'zsh'
		title = opts.title or 'Terminal'

	-- create window {{{
	local buf, win
		buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer
		win = vim.api.nvim_get_current_win()

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
	local border_color = 'String'
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
	opts = {
		noautocmd = true,
		style = "minimal",
		border = borderstyle.single,
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}
	-- }}}

	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "filetype", "Terminal")
	vim.api.nvim_win_set_option(win, "winhighlight", "Normal:Normal")
	-- and finally create it with buffer attached
	vim.api.nvim_open_win(buf, true, opts)
	vim.api.nvim_buf_set_option(buf, "bufhidden", "delete")
	-- }}}

	-- run cmd in terminal {{{
	if work == "shell" then
		vim.api.nvim_buf_call(buf, function() vim.cmd("setlocal nornu nonu") end)
		if cmd then
			vim.api.nvim_buf_call(buf, function() vim.cmd("term " .. cmd) end)
		else
			vim.api.nvim_buf_call(buf, function() vim.cmd("term") end)
		end
		vim.api.nvim_buf_call(buf, function() vim.cmd("startinsert") end)
	-- else
	-- 	vim.api.nvim_buf_call(buf, function() vim.cmd("term") end)
	-- 	vim.api.nvim_buf_call(buf, function() vim.cmd("startinsert") end)
	end

	vim.api.nvim_buf_set_name(buf, title)
	-- }}}

end
-- }}}

-- _run {{{
function _run(wrapped, style)

	if wrapped == nil and style == nil then
		vim.api.nvim_command("term")
		vim.api.nvim_command("setlocal nonu nornu")
		vim.api.nvim_command("startinsert")
		return 0
	end

	local split = {
		vertical = 'vs ',
		horizontal = 'split ',
	}

	local buffercmd = split[style] or "float"
	-- local buffercmd = 'float'

	-- if wrapped then
	-- 	if buffercmd == 'float' then
	-- 		TermF(wrapped)
	-- 	elseif buffercmd == 'vertical' then
	-- 		TermV(wrapped)
	-- 	else
	-- 		TermH(wrapped)
	-- 	end
	-- end

	if buffercmd == 'float' then
		float_term({work = 'shell', cmd = wrapped})
	else
		vim.api.nvim_command(buffercmd)
		vim.api.nvim_command('set nornu nonu signcolumn=no')
		if wrapped then
			vim.api.nvim_command("term " .. wrapped)
		else
			vim.api.nvim_command('term')
		end
		vim.api.nvim_command('startinsert')
		vim.notify(string.format('[%s]: %s', work, wrapped), 2,
			        {title = '_run()'})
	end
end
-- }}}

-- _quickfix {{{
function _quickfix(opts)
	if opts == nil then
		opts = {}
	end
	local prompt = opts.prompt or 'wrap'
	local silent = opts.silent or true
	local command = opts.cmd
	local cmd = ''

	if command == nil then
		vim.notify('_quickfix() at least needs {cmd = "<CMD>"} to execute',
			        3, {title = '_quickfix()'})
		return 238
	end
	-- for jumping to error right after execution, remove `get`
	-- -- `cgetexpr` -> `cexpr`
	if silent then
		cmd = string.format(':cgetexpr system("%s")', command)
	else
		cmd = string.format(':cexpr system("%s")', command)
	end
	vim.api.nvim_command(cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify(string.format('[error]: %s: [%s]: %s',
			                      vim.v.shell_error,
			                      prompt,
			                      string.gsub(command, '\n', '')
					), 3)
	else
		vim.notify(string.format('[%s]: %s', prompt, string.gsub(command, '\n', '')), 2)
	end
	if prompt == 'debug' then
		vim.api.nvim_command('copen')
	end
end
-- }}}

-- _commands {{{
function _commands(filetype, output)
	local src_name = ''
	local out_name = ''
	if output ~= 'compile' then
		src_name = vim.fn.expand('%:p')
		out_name = vim.fn.expand('%:p:r')
	else
		src_name = vim.fn.expand('%')
		out_name = vim.fn.expand('%:r')
	end

	local commands = {
		run = {
			javascript = 'node '..src_name,
			c = out_name,
			cpp = out_name,
			rust = out_name,
			go = out_name,
			sent = 'sent '..src_name,
			text = 'sent '..src_name,
			perl = 'perl '..src_name,
			markdown = string.format('pandoc %s %s -o %s.pdf',
				        pandoc_path, src_name, out_name),
			nroff = string.format('groff %s %s > %s.pdf',
				        src_name, '-m me -keUs -Tpdf', out_name), -- -egGjkpRstU
			rmd = string.format([[Rscript -e "%s(input='%s', %s)"]],
				        'rmarkdown::render', src_name,
				        "output_format='pdf_document'")
		},
		compile = {
			-- programs
			c = string.format('gcc %s -o %s', src_name, out_name),
			cpp = string.format('g++ %s -o %s', src_name, out_name),
			rust = string.format('rustc %s -o %s', src_name, out_name),
			go = 'go build '..src_name,

			-- documents
			nroff = string.format('pdfroff -U -mspdf %s > %s.pdf', src_name,
				        out_name),
			tex = 'xelatex ' .. src_name,
			markdown = string.format('pandoc %s -o %s.pdf',
			                         src_name, out_name),
			rmd = string.format([[Rscript -e \"%s(input='%s', %s)\"]],
				        'rmarkdown::render', src_name,
				        "output_format='all'")
		},
		debug = {
			c = string.format('gcc -Wall %s -o %s', src_name, out_name),
			cpp = string.format('g++ -Wall %s -o %s', src_name, out_name),
			rust = string.format('rustc %s -o %s', src_name, out_name),
			go = 'go build '..src_name,

			-- documents
			nroff = string.format('pdfroff -Wall -U -mspdf %s > %s.pdf',
				        src_name, out_name),
			tex = 'xelatex '..src_name,
			markdown = string.format('pandoc %s %s -o %s.pdf',
				        beamer_args, src_name, out_name),
			rmd = string.format([[%s(input='%s', %s)\"]],
				        [[Rscript -e \"rmarkdown::render]], src_name,
				        [[output_format = 'all']])
		}
	}

	if commands[output][filetype] ~= nil then
		return tostring(commands[output][filetype])
	else
		if output == 'run' then
			return src_name
		else
			return nil
		end
	end
end
-- }}}

-- wrapcmd {{{
function wrapcmd(opts)
	local ft = opts.ft
	local exe = opts.w
	local style = opts.style or nil
	local silent = opts.silent or nil

	local work = exe or 'run'

	local command = _commands(ft, work)

	if command == nil then
		vim.notify(string.format('[%s]: %s <%s> %s', work,
			        'no command is defined for', ft, 'filetype'),
			        3, {title = 'wrapcmd()'})
		return 1
	end
	if command == nil then
		vim.notify('no filetype is specified for wrapcmd()',
			        3, {title = 'wrapcmd()'})
		return 289
	end

	if work == 'run' then
		_run(command, style)
	else
		_quickfix({cmd = command, prompt = work, silent = silent})
	end
end
-- }}}

-- Keymaps {{{
---- Compile/Run/Debug
vim.keymap.set('n', '<localleader>fq', function()
		wrapcmd({ft = vim.bo.filetype, w = "run", style = "horizontal"})
	end, { silent = true, desc = 'Run current file - horizontal' })
vim.keymap.set('n', '<localleader>fQ', function()
		wrapcmd({ft = vim.bo.filetype, w = "run", style = "vertical"})
	end, { silent = true, desc = 'Run current file - vertical' })
vim.keymap.set('n', '<localleader>fe', function()
		wrapcmd({ft = vim.bo.filetype, w = "compile", silent = true})
	end, { silent = true, desc = 'quickfix › Compile current file' })
vim.keymap.set('n', '<localleader>fw', function()
		wrapcmd({ft = vim.bo.filetype, w = "debug", silent = true})
	end, { silent = true, desc = 'quickfix › Debug current file' })

---- makefile
vim.keymap.set('n', '<localleader>ca', function()
		_run("make", "horizontal")
	end, { silent = true, desc = 'make › all' })
vim.keymap.set('n', '<localleader>cc', function()
		_quickfix({cmd = "make", silent = true})
	end, { silent = true, desc = 'quickfix › make' })
vim.keymap.set('n', '<localleader>cd', function()
		_quickfix({cmd = "make clean", silent = true})
	end, { silent = true, desc = 'quickfix › make clean' })
vim.keymap.set('n', '<localleader>cf', function()
		_quickfix({cmd = "make force", silent = true})
	end, { silent = true, desc = 'quickfix › make force' })
vim.keymap.set('n', '<localleader>cb', function()
		_quickfix({cmd = "make build", silent = true})
	end, { silent = true, desc = 'quickfix › make build' })
vim.keymap.set('n', '<localleader>cF', function()
		_quickfix({cmd = "make full", silent = true})
	end, { silent = true, desc = 'quickfix › make full' })

-- ---- intractive shells
vim.keymap.set('n', '<C-q>', function() _run("mksh")
	end, { silent = true, desc = 'term › bash shell' })
vim.keymap.set('n', '<localleader>ts', function() _run("tcsh")
	end, { silent = true, desc = 'term › zsh shell' })
-- vim.keymap.set('n', '<localleader>td', function() _run("dash")
-- 	end, { silent = true, desc = 'term › dash shell' })
-- }}}
