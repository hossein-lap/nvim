-- helper {{{
local api = vim.api
local skelp = ' /data/dev/hossein-lap/workflow/local/skels/'

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
	api.nvim_set_keymap(mode, key, command, options)
end
-- }}}
-- }}}

map('n', '<localleader>c', ':-1read'..skelp..'skel.c<CR>G', { desc = "C template" })
map('n', '<localleader>C', ':-1read'..skelp..'skel.cpp<CR>G', { desc = "C++ template" })
map('n', '<localleader>s', ':-1read'..skelp..'skel.sh<CR>G', { desc = "Shell template" })
map('n', '<localleader>l', ':-1read'..skelp..'skel.lua<CR>G', { desc = "Lua template" })
map('n', '<localleader>m', ':-1read'..skelp..'skel.md<CR>G', { desc = "Markdown template" })
map('n', '<localleader>g', ':-1read'..skelp..'skel.ms<CR>G', { desc = "Groff `ms` template" })
map('n', '<localleader>p', ':-1read'..skelp..'skel.py<CR>G', { desc = "Python template" })
map('n', '<localleader>t', ':-1read'..skelp..'skel.tex<CR>', { desc = "LaTeX template" })
map('n', '<localleader>r', ':-1read'..skelp..'skel.rmd<CR>G', { desc = "R Markdown template" })
map('n', '<localleader>M', ':-1read'..skelp..'skel.mk<CR>G', { desc = "Makefile template" })
map('n', '<localleader>h', ':-1read'..skelp..'skel.html<CR>G', { desc = "HTML template" })

-- Loremipsum
map('n', '<localleader>i1', ':read'..skelp..'loremipsum/lipsum001.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 01" })
map('n', '<localleader>i2', ':read'..skelp..'loremipsum/lipsum002.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 02" })
map('n', '<localleader>i3', ':read'..skelp..'loremipsum/lipsum003.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 03" })
map('n', '<localleader>i4', ':read'..skelp..'loremipsum/lipsum004.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 04" })
map('n', '<localleader>i5', ':read'..skelp..'loremipsum/lipsum005.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 05" })
map('n', '<localleader>i6', ':read'..skelp..'loremipsum/lipsum006.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 06" })
map('n', '<localleader>i7', ':read'..skelp..'loremipsum/lipsum007.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 07" })
map('n', '<localleader>i8', ':read'..skelp..'loremipsum/lipsum008.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 08" })
map('n', '<localleader>i9', ':read'..skelp..'loremipsum/lipsum009.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 09" })
