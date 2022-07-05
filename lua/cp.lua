--  _  _ ___
-- | || | __|   H
-- | __ | _|    A
-- |_||_|___|   P
--

function TermWrapRun(wrapandrun, file_name)
	if not split_style then
		split_style = 'h'
	end

	if split_style == 'v' then
		buffercmd = '45vnew'
	elseif split_style == 'h' then
		buffercmd = '15new'
	else
		print("ERROR!")
		print("split_style have not a valid value")
		print("(must be 'h' or 'v')")
	end

	--print(wrapandrun)
	api.nvim_command(buffercmd)
	api.nvim_command('setlocal nornu nonu')
	if file_name then
		api.nvim_command('term ' .. wrapandrun .. ' ' .. file_name)
	else
		api.nvim_command('term ' .. wrapandrun)
	end
	api.nvim_command('startinsert')
end

split_style = 'h'

--fpath = api.nvim_buf_get_name(0)
--map('n', '<leader>cc', ':lua TermWrapRun("make ", fpath)<CR>')

map('n', '<leader>cc', ':lua TermWrapRun("make")<CR>')
