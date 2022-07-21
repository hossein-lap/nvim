Expand = vim.fn.expand

-- Term-Wrapper function {{{
function Terminal(wrapand)
	if not Split_style then
		Split_style = 'h'
	end

	if Split_style == 'v' then
		Buffercmd = '45vnew'
	elseif Split_style == 'h' then
		Buffercmd = '15new'
	else
		print("ERROR!")
		print("split_style have not a valid value")
		print("(must be 'h' or 'v')")
	end

	--print(wrapandrun)
	api.nvim_command(Buffercmd)
	api.nvim_command('setlocal nornu nonu')
	if wrapand then
		api.nvim_command("term " .. wrapand)
	else
		api.nvim_command('term')
	end
	api.nvim_command('startinsert')
end
-- }}}
-- Trigger functions {{{
-- Compile {{{
function TriggerC(file_type)
	SRC_NAME = Expand('%')
	OUT_NAME = Expand('%:r')

	if file_type == 'c' then
		CC = 'gcc'
		CARGS = '-Wall'
		OUT_NAME = ''
	elseif file_type == 'cpp' then
		CC = 'g++'
		CARGS = '-Wall'
		OUT_NAME = ''
	elseif file_type == 'rust' then
		CC = 'rustc'
		CARGS = ''
		OUT_NAME = ''
	elseif file_type == 'nroff' then
		CC = 'groff'
		CARGS = '-mspdf -Tpdf >'
	elseif file_type == 'rmd' then
		CC = 'Rscript'
		CARGS = ''
		SRC_NAME = [[-e "rmarkdown::render(']] .. Expand('%') .. [[')"]]
		OUT_NAME = ''
	elseif file_type == 'tex' then
		CC = 'xelatex'
		CARGS = ''
		OUT_NAME = ''
	else
		print('Not executable')
		return 1
	end

	Terminal(CC .. ' ' .. SRC_NAME .. ' ' .. CARGS .. ' ' .. OUT_NAME)
end
-- }}}
-- Run {{{
function TriggerR(file_type)
	SRC_NAME = Expand('%')

-- C
	if file_type == 'c' or
		file_type == 'cpp' or
		file_type == 'rust' then
		CC = ''
		CARGS = ''
		SRC_NAME = './' .. Expand('%:r')
-- Groff, Rmarkdown, LaTeX
	elseif file_type == 'nroff' or
		file_type == 'rmd' or
		file_type == 'tex' then
		CC = 'nohup zathura'
		CARGS = '>/dev/null &'
		SRC_NAME = SRC_NAME .. '.pdf'
-- Python
	elseif file_type == 'python' then
		CC = 'python'
		CARGS = ''
-- Shell
	elseif file_type == 'sh' then
		CC = 'bash'
		CARGS = ''
-- Lua
	elseif file_type == 'lua' then
		CC = 'lua'
		CARGS = ''
-- Markdown
	elseif file_type == 'markdown' then
		CC = 'glow'
		CARGS = '-p'
	end

	Terminal(CC .. ' ' .. SRC_NAME .. ' ' .. CARGS)
end
-- }}}
-- Debug {{{
function TriggerD(file_type)
	print("Debug function is not ready yet, sorry :.)")
end
-- }}}
-- }}}

Split_style = 'h'

RunnerCMD = ':lua TriggerR(vim.bo.filetype)<CR>'
CompilerCMD = ':lua TriggerC(vim.bo.filetype)<CR>'
DebugCMD = ':lua TriggerD(vim.bo.filetype)<CR>'

function Term(input)
	Split_style = 'h'
	if input then
		Terminal('echo "\27[33;1m' .. input ..'\27[0m"' .. ' && ' .. input)
	else
		Terminal()
	end
end


map('n', '<leader>tt', ":lua Terminal()<CR>")
-- Git commands
map('n', '<leader>gs', ":lua Term('git status -s')<CR>")
map('n', '<leader>gl', ":lua Term('git log --oneline --all --graph')<CR>")
map('n', '<leader>ga', ":lua Term('git add .')<CR>")
map('n', '<leader>gd', ":lua Term('git diff .')<CR>")
map('n', '<leader>gc', ":lua Term('git commit')<CR>")
map('n', '<leader>gt', ":lua Term('git tag')<CR>")
map('n', '<leader>gb', ":lua Term('git branch')<CR>")
