Split_style = 'h'

-- Toggle Split_style {{{
function Split_style_Toggle()
	if Split_style == 'h' then
		Split_style = 'v'
	else
		Split_style = 'h'
	end
end
map('n', '<leader>fs', ":lua Split_style_Toggle()<CR>", { silent = true })
--}}}
-- Term-Wrapper function {{{
function runTerminal(wrapand)
	if not Split_style then
		Split_style = 'h'
	end

	if Split_style == 'v' then
		Buffercmd = 'vs '
	elseif Split_style == 'h' then
		Buffercmd = 'split '
	else
		print("ERROR! Split_style have not a valid value (must be 'h' or 'v')")
		return -1
	end

	--print(wrapandrun)
	api.nvim_command(Buffercmd)
	api.nvim_command('set nornu nonu')
	if wrapand then
		api.nvim_command('set ls=0')
		api.nvim_command("term " .. wrapand)
	else
		api.nvim_command('term')
	end
	api.nvim_command('startinsert')
end

-- }}}

au('set ls=2', '*', 'TermLeave')

-- Trigger functions
-- Run {{{
function TriggerRun(file_type)
	local src_name = expand('%')
	local out_name = expand('%:r')
	--local pandoc_path = '/home/hos/.config/pandoc/plain/'
	local pandoc_path = '/home/hos/.config/pandoc/persian/persian.yaml '

	local runner = {
		c = './' .. out_name,
		cpp = './' .. out_name,
		rust = './' .. out_name,
		python = 'python ' .. src_name,
		lua = 'lua5.4 ' .. src_name,
		sh = 'bash ' .. src_name,
		csh = 'csh ' .. src_name,
		zsh = 'zsh ' .. src_name,
		--markdown = 'pandoc --defaults ' .. pandoc_path .. 'persian.yaml ' .. src_name .. ' -o ' .. out_name .. '.pdf'
		markdown = 'pandoc --defaults ' .. pandoc_path .. src_name .. ' -o ' .. out_name .. '.pdf'
		--markdown = 'glow -p ' .. src_name,
	}
	print(type(runner))

	if runner[file_type] == nil then
		print('Not exec')
		return 1
	end

	runTerminal(runner[file_type])
end
-- }}}
-- Compile{{{
function TriggerCompile(file_type)
	local src_name = expand('%')
	local out_name = expand('%:r')
	local pandoc_path = '/home/hos/.config/pandoc/english/english.yaml '

	local compiler = {
		c = 'gcc -Wall ' .. src_name .. ' -o ' .. out_name,
		cpp = 'g++ -Wall ' .. src_name .. ' -o ' .. out_name,
		rust = 'rustc ' .. src_name,
		nroff = 'groff -mspdf -T pdf >' .. out_name .. '.pdf ' .. src_name,
		tex = 'xelatex ' .. src_name,
		rmd = [[Rscript -e "rmarkdown::render(input = ']] .. src_name .. [[', output_format = \"pdf_document\")"]],
		markdown = 'pandoc --defaults ' .. pandoc_path .. src_name .. ' -o ' .. out_name .. '.pdf'
	}
	if compiler[file_type] == nil then
		print('Not src')
		return 1
	end

	runTerminal(compiler[file_type])
end
-- }}}
-- Extra {{{
function TriggerExtra(file_type)
	local src_name = expand('%')
	local out_name = expand('%:r')
	local pdf_viewer = 'nohup zathura '
	local log_handler =  '.pdf & 2>&1 > /dev/null'
	local pandoc_path = '/home/hos/.config/pandoc/beamer/beamer.yaml '

	local extra = {
		rmd = pdf_viewer .. out_name .. log_handler,
		nroff = pdf_viewer .. out_name ..log_handler,
		--markdown = pdf_viewer .. out_name .. log_handler,
		markdown = 'pandoc --defaults ' .. pandoc_path .. '-t beamer ' .. src_name .. ' -o ' .. out_name .. '.pdf'
	}
	if extra[file_type] == nil then
		print('No extra works yet :/')
		return 1
	end

	runTerminal(extra[file_type])
end
-- }}}

RunnerCMD = ':lua TriggerRun(vim.bo.filetype)<CR>'
CompilerCMD = ':lua TriggerCompile(vim.bo.filetype)<CR>'
ExtraCMD = ':lua TriggerExtra(vim.bo.filetype)<CR>'

-- Keymaps {{{
---- Compile/Run/Extra
map('n', '<leader>fe', RunnerCMD, { silent = true })
map('n', '<leader>fw', CompilerCMD, { silent = true })
map('n', '<leader>fq', ExtraCMD, { silent = true })

---- makefile
map('n', '<leader>cc', ':lua runTerminal("make")<CR>', { silent = true })

---- Run terminal
map('n', '<leader>tt', ":lua runTerminal()<CR>", { silent = true })

---- Git commands
map('n', '<leader>gs', ":lua runTerminal('git status -s')<CR>", { silent = true })
map('n', '<leader>gl', ":lua runTerminal('git log --oneline --all --graph')<CR>", { silent = true })
map('n', '<leader>ga', ":lua runTerminal('git add .')<CR>", { silent = true })
map('n', '<leader>gd', ":lua runTerminal('git diff .')<CR>", { silent = true })
map('n', '<leader>gt', ":lua runTerminal('git tag')<CR>", { silent = true })
map('n', '<leader>gb', ":lua runTerminal('git branch')<CR>", { silent = true })
-- }}}
