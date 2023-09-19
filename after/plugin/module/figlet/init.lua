local bin = 'figlet'
function Figlet(text, opts)
	local size = opts.size
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
	local input = ''
	local cmd = ''
	local prompt = '> '

	if comment[ft] == nil then
		comment[ft] = '\\#'
	end

	if size == nil or size == 'normal' then
		size = ''
	else
		prompt = string.format('(%s) %s', size, prompt)
		size = '-f '..size
	end

	if text == nil or text == '' then
		input = vim.fn.input(bin..' '..prompt)
	else
		input = text
	end

	-- Insert the output into the current file
	if input ~= nil then
		cmd = string.format([[:r !sh -c "%s %s '%s' %s | sed 's,^,%s ,'"]],
			bin, size, input, '2>/dev/null', comment[ft])
		vim.cmd(cmd)
	end
end

vim.keymap.set('n', '<leader>Fn', ':lua Figlet()<CR>',
	{desc = bin..' output as comment - normal font', silent = true, noremap = true})

vim.keymap.set('n', '<leader>Fs', ':lua Figlet("small")<CR>',
	{desc = bin..' output as comment - small font', silent = true, noremap = true})

vim.keymap.set('n', '<leader>Fb', ':lua Figlet("big")<CR>',
	{desc = bin..' output as comment - big font', silent = true, noremap = true})
