-- helper {{{

-- autocmd function {{{
local function au(commands, patterns, evnt)
	if evnt == nil then
		evnt = "FileType"
	end
	vim.api.nvim_create_autocmd(evnt, {
		pattern = patterns,
		command = commands,
--		 group = patterns .. "groups"
	})
end
-- }}}

-- }}}

-- autocmds {{{

au("set filetype=nroff", {"*.me"},    {"BufRead", "BufNewFile"})
au("set filetype=nroff", {"*.ms"},    {"BufRead", "BufNewFile"})
au("set filetype=nroff", {"*.mm"},    {"BufRead", "BufNewFile"})
au("set filetype=nim",   {"*.nim"},   {"BufRead", "BufNewFile"})
au("set filetype=c",     {"*.h"},     {"BufRead", "BufNewFile"})
au("set filetype=json",  {"*.theme"}, {"BufRead", "BufNewFile"})
au("set filetype=nasm",  {"*.s"},     {"BufRead", "BufNewFile"})
au("set filetype=sent",  {"*.sent"},  {"BufRead", "BufNewFile"})
au("set filetype=tex",   {"plaintex"})
au("set filetype=nasm",  {"asm"})
au("set filetype=qml",   {"*.qml"},   {"BufRead", "BufNewFile"})

au("set tabstop=2",      {"sent", "yaml", "text"})
au("set softtabstop=2",  {"sent", "yaml", "text"})
au("set shiftwidth=2",   {"sent", "yaml", "text"})

-- au("set noexpandtab", {
-- 	"c", "lua", "sh", "bash", "vim", "go", "make", "nasm", "xml", "html",
-- })

--})

-- }}}

-- -- FoldMethod
-- au("loadview", {}, { "BufRead" } )
-- au("mkview", {}, { "BufWrite" } )

-- sudo {{{

function PRE_EXEC(cmd, print_output)
	local exec_with = "sudo"
	local exec_args = "-p '' -S"

	vim.fn.inputsave()
	local password = vim.fn.inputsecret("Password: ")
	vim.fn.inputrestore()
	if not password or #password == 0 then
		vim.notify("Invalid password, ".. exec_with .." aborted", 3, {title = "PRE_EXEC()"})
		return false
	end
	local out = vim.fn.system(string.format("%s %s %s", exec_with, exec_args, cmd), password)
	if vim.v.shell_error ~= 0 then
		print("\r\n")
		vim.notify(out, 4, {title = "PRE_EXEC()"})
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
		vim.notify("E32: No file name", 4, {title = "PRE_EXEC()"})
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
		vim.notify("", 2)
		vim.notify(string.format([["%s" written]], filepath), 2, {title = "PRE_WRITE()"})
		vim.cmd("e!")
	end
	vim.fn.delete(tmpfile)
end

vim.keymap.set("n", "<leader>ws", ":lua PRE_WRITE()<CR>", {desc = "privileged write"})

-- }}}

-- netrw {{{

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 80
vim.g.netrw_menu = 1
vim.g.netrw_sort_by = "exten"
vim.g.netrw_sort_direction = "normal"
vim.g.netrw_special_syntax = 1

vim.keymap.set("n", "<leader>fa", vim.cmd.Ex, {desc = "netrw - new buffer"})
vim.keymap.set("n", "<leader>fm", vim.cmd.Ex, {desc = "netrw - new buffer"})

-- }}}

-- figlet {{{

local bin = "figlet"

---echo text to `figlet` and append its output to current file as comment.
--- `opts.text`: input string
--- `opts.size`: figlet font/size
--- `opts.ft`: current file's type (for comment leader)
--- `opts.upper`: enable uppercase output
---@param opts table
function Figlet(opts)
	if opts == nil then
		opts = { upper = true }
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
		tex = '\\%',
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
		size = "-f small"
	else
		prompt = string.format("(%s) %s", size, prompt)
		size = "-f "..size
	end

	-- Insert the output into the current file
	if input ~= nil then
		cmd = string.format([[:-1r !sh -c "%s %s "%s" %s | sed "s,^,%s ,""]],
			bin, size, input, "2>/dev/null", comment[ft])
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

-- }}}

