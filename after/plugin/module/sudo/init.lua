local exec_with = "sudo"
local exec_args = "-p '' -S"

function PRE_EXEC(cmd, print_output)
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
