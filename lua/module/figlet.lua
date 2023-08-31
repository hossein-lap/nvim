function Figlet(size)
	local ft = vim.bo.filetype
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
		latex = '\\%',
		nroff = '.\\"',
	}

	if comment[ft] == nil then
		comment[ft] = '# '
	end

	local input = ''
	if size == nil then
		size = ''
		input = vim.fn.input("Figlet > ")
		input = string.upper(input)
	else
		input = vim.fn.input("figlet > ")
		size = '-f '..size
	end
	local cmd = string.format([[:r !sh -c "figlet %s '%s' | sed 's,^,%s ,'"]],
		size, input, comment[ft])

	-- Insert the output into the current file
	vim.cmd(cmd)
end

vim.keymap.set('n', '<localleader>F', ':lua Figlet()<CR>',
	{desc = 'figlet output as comment', silent = true, noremap = true})

vim.keymap.set('n', '<localleader>f', ':lua Figlet("small")<CR>',
	{desc = 'figlet output as comment - small font', silent = true, noremap = true})
