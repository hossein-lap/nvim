local bin = 'figlet'

---echo text to `figlet` and append its output to current file as comment.
--- `opts.text`: input string
--- `opts.size`: figlet font/size
--- `opts.ft`: current file's type (for comment leader)
--- `opts.upper`: enable uppercase output
---@param opts table
function Figlet(opts)
	if opts == nil then
		opts = {}
	end
	local text = opts.text or nil
	local size = opts.size or nil
	local upper = opts.upper or false
	local ft = opts.ft or vim.bo.filetype
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
		lisp = ';;',
		elisp = ';;',
	}
	local input = ''
	local cmd = ''
	local prompt = '> '

	if comment[ft] == nil then
		comment[ft] = '\\#'
	end

	if text == '' or text == nil then
		input = vim.fn.input(bin..' '..prompt)
	else
		input = text
	end

	if upper then
		input = string.upper(input)
	end

	if size == nil then
		size = '-f small'
	else
		prompt = string.format('(%s) %s', size, prompt)
		size = '-f '..size
	end

	-- Insert the output into the current file
	if input ~= nil then
		cmd = string.format([[:-1r !sh -c "%s %s '%s' %s | sed 's,^,%s ,'"]],
			bin, size, input, '2>/dev/null', comment[ft])
		vim.cmd(cmd)
	end
end

vim.keymap.set("n", "<leader>Fl", ":lua Figlet()<CR>",
	{desc = bin.." output as comment - no args", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fn", ":lua Figlet({size = 'standard'})<CR>",
	{desc = bin.." output as comment - standard font", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fs", ":lua Figlet({size = 'small'})<CR>",
	{desc = bin.." output as comment - small font", silent = true, noremap = true})

vim.keymap.set("n", "<leader>Fb", ":lua Figlet({size = 'big'})<CR>",
	{desc = bin.." output as comment - big font", silent = true, noremap = true})

