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

WindowStyle = 'h'

-- toggle WindowStyle {{{
local WindowStyles = {
	'h',
	'v',
--	'f',
}

function WindowStyle_Toggle(i)
	WindowStyle = WindowStyles[i]
	vim.notify(string.format('term split => style: %s', WindowStyle),
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

--map('n', '<leader>vs1', ":lua WindowStyle_Toggle(1)<CR>",
--	{ silent = true, desc = "term › horizontal split" })
--
--map('n', '<leader>vs2', ":lua WindowStyle_Toggle(2)<CR>",
--	{ silent = true, desc = "term › vertical split" })
--
--map('n', '<leader>vs3', ":lua WindowStyle_Toggle(3)<CR>",
--	{ silent = true, desc = "term › float Window" })
-- }}}
-- swtich pandoc configs {{{
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
	end

	for aitem_counter = 1, #Pandoc_article_list, 1 do
		if #Pandoc_article_list > 9 then
			vim.notify(string.format('Pandoc_article_switch() mapping failed\n%s',
					'You cannot have more than 9 themes'), 4,
				{title = 'Pandoc_article_switch()'})
			break
		end
		map("n", "<leader>va"..aitem_counter, ":lua Pandoc_article_switch("..aitem_counter..")<CR>",
			{ silent = true, desc = "Pandoc: article › " .. Pandoc_article_list[aitem_counter] }
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
	end

	for bitem_counter = 1, #Pandoc_beamer_list, 1 do
		if #Pandoc_beamer_list > 9 then
			vim.notify(string.format('Pandoc_beamer_switch() mapping failed\n%s',
					'You cannot have more than 9 themes'), 4,
				{title = 'Pandoc_beamer_switch()'})
			break
		end
		map("n", "<leader>vb"..bitem_counter, ":lua Pandoc_beamer_switch("..bitem_counter..")<CR>",
			{ silent = true, desc = "Pandoc: beamer › " .. Pandoc_beamer_list[bitem_counter] }
		)
	end
	-- }}}
-- }}}

-- Term_run {{{
function Term_run(wrapped, windowstyle)
	if windowstyle == nil then
		windowstyle = 'h'
--		vim.notify(string.format('windowstyle is not set, swtiched to default (%s)',
--				windowstyle), 3,
--			{title = 'Term_run'})
	end

	if windowstyle == 'v' then
		Buffercmd = 'vs '
	elseif windowstyle == 'h' then
		Buffercmd = 'split '
	else
		vim.notify(string.format('** windowstyle is not set %s',
				'to use `Term_run()`'), 4,
			{title = 'Term_run'})
		return -1
	end

--	vim.notify(wrapped, 2, {title = 'Command executed'})
	vim.api.nvim_command(Buffercmd)
	vim.api.nvim_command('set nornu nonu')
	if wrapped then
		vim.api.nvim_command("term " .. wrapped)
	else
		vim.api.nvim_command('term')
	end
	vim.api.nvim_command('startinsert')
end
-- }}}

-- Trigger functions:
-- Run {{{
function TriggerRun(file_type)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local pandoc_path = string.format(' %s %s ',
		'-t ms', '--defaults ~/.config/pandoc/defaults/groff/groff.yaml')
	local rmd_pandoc_path = '/home/hos/.config/pandoc/defaults/dracula/dracula.yaml'
--	local pandoc_path = ' -t ms --highlight monochrome '

	local runner = {
		c = './' .. out_name,
		cpp = './' .. out_name,
		rust = './' .. out_name,
		go = 'go run ' .. src_name,
		python = './' .. src_name,
		lua = './' .. src_name,
		sh = './' .. src_name,
		csh = './' .. src_name,
		zsh = './' .. src_name,
		sent = 'sent ' .. src_name,
		text = 'sent ' .. src_name,
		markdown = string.format('pandoc %s %s -o %s.pdf',
			pandoc_path, src_name, out_name),
		nroff = string.format('groff %s %s > %s.pdf',
			src_name, '-m me -keUs -Tpdf', out_name), -- -egGjkpRstU
			-- Rscript -e "source('/home/hos/.config/pandoc/config.r'); rmarkdown::render(input = 'test.rmd', output_format = 'pdf_document' )"
		-- rmd = string.format([[Rscript -e "source('/home/hos/.config/pandoc/config.r'); rmarkdown::render(input = '%s', output_format = 'pdf_document', params = list(pandoc_options = c(args = '--defaults', '/home/hos/.config/pandoc/defaults/dracula/dracula.yaml')))" ]], src_name)
		-- rmd = string.format([[Rscript -e "source('%s'); rmarkdown::render(input = '%s', '%s', params = list(pandoc_options = c(args = '%s', '%s')))"]],
		       -- '/home/hos/.config/pandoc/config.r', src_name, 'output_format = \\"pdf_document\\"', '--defaults', rmd_pandoc_path)

		-- rmd = string.format("%s %s = '%s', %s %s",
		-- 	[[Rscript -e "source('/home/hos/.config/pandoc/defaults/r/config.r');]],
		-- 	[[ rmarkdown::render(input]], src_name, [[output_yaml = ']]..rmd_pandoc_path,
		-- 	[[', output_format = 'pdf_document')"]])

		rmd = string.format("%s %s = '%s', %s %s",
			[[Rscript -e "source('/home/hos/.config/pandoc/defaults/r/config.r');]],
			[[ rmarkdown::render(input]], src_name, [[output_yaml = ']]..rmd_pandoc_path,
			[['"]])
	}

	if runner[file_type] == nil then
		vim.notify('Not first command', 3, {title = 'TriggerRun()'})
		return 1
	end

	Term_run(runner[file_type], WindowStyle)
end
-- }}}
-- Compile {{{
function TriggerCompile(file_type)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local pandoc_path = string.format(' %s%s/%s%s ',
	          '~/.config/pandoc/defaults/', Pandoc_article_default,
	          Pandoc_article_default, '.yaml')
	local rmd_path 

	local compiler = {
		c = string.format('gcc -Wall %s -o %s', src_name, out_name),
		cpp = string.format('g++ -Wall %s -o %s', src_name, out_name),
		rust = 'rustc ' .. src_name,
		go = 'go build ' .. src_name,
		python = 'python ' .. src_name,
		lua = 'lua5.4 ' .. src_name,
		sh = 'bash ' .. src_name,
		csh = 'csh ' .. src_name,
		zsh = 'zsh ' .. src_name,
--		nroff = string.format('pdfroff -U -mspdf %s > %s.pdf',
--		            src_name, out_name),
		nroff = string.format('groff %s %s > %s.pdf',
		            src_name, '-mspdf -keUs -Tpdf', out_name), -- -egGjkpRstU
		tex = 'xelatex ' .. src_name,
		sent = 'sent -i ' .. src_name,
		text = 'sent -i ' .. src_name,
		markdown = string.format('pandoc --defaults %s %s -o %s.pdf',
		               pandoc_path, src_name, out_name),
		rmd = string.format([[%s(input='%s', %s, params='%s')"]],
			[[Rscript -e "rmarkdown::render]], src_name,
			[[output_format = 'all']], pandoc_path)
	}

	if compiler[file_type] == nil then
		vim.notify('No second command', 3, {title = 'TriggerCompile()'})
		return 1
	end

	Term_run(compiler[file_type], WindowStyle)
end
-- }}}
-- Extra {{{
function TriggerExtra(file_type)
	local src_name = vim.fn.expand('%')
	local out_name = vim.fn.expand('%:r')
	local extra = {
		c = string.format('gcc -ggdb %s -o debug-%s && gdb -q ./debug-%s',
		        src_name, out_name, out_name),
		sent = "sent -f 'Source Sans Pro' " .. src_name,
		text = "sent -f 'Source Sans Pro' " .. src_name,
		tex = 'xelatex -interaction=nonstopmode -synctex=1 ' .. src_name,
		markdown = string.format('pandoc %s%s%s %s -o %s.pdf ',
		               '--defaults ~/.config/pandoc/defaults/beamer/',
		               Pandoc_beamer_default, '.yaml', src_name, out_name)

	}

	if extra[file_type] == nil then
		vim.notify('No third command', 3, {title = 'TriggerExtra()'})
		return 1
	end

	Term_run(extra[file_type], WindowStyle)
end
-- }}}

-- Keymaps {{{
---- Compile/Run/Extra
map('n', '<leader>fe',  ':lua TriggerRun(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'command1 › Run file' })
map('n', '<leader>fw',  ':lua TriggerCompile(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'command2 › Compile file' })
map('n', '<leader>fq',  ':lua TriggerExtra(vim.bo.filetype)<CR>',
	{ silent = true, desc = 'command3 › Extra thing' })

---- makefile
map('n', '<leader>cc', ':lua Term_run("make")<CR>',
		{ silent = true, desc = 'make › all' })
map('n', '<leader>cd', ':lua Term_run("make clean")<CR>',
		{ silent = true, desc = 'make › clean' })
map('n', '<leader>cf', ':lua Term_run("make force")<CR>',
		{ silent = true, desc = 'make › force' })
map('n', '<leader>ca', ':lua Term_run("make full")<CR>',
		{ silent = true, desc = 'make › full' })

------ Run terminal
map('n', '<leader>ts', ':lua Term_run("bash", WindowStyle)<CR>',
	  { silent = true, desc = 'term › bash shell' })
--map('n', '<leader>tz', ':lua Term_run("zsh")<CR>',
--	  { silent = true, desc = 'term › zsh shell' })
--map('n', '<leader>td', ':lua Term_run("dash")<CR>',
--	  { silent = true, desc = 'term › dash shell' })
-- }}}
