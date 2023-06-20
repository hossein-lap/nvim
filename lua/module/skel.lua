-- helper {{{
local api = vim.api
local skelp = ' ~/.config/nvim/skels/'

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

map('n', '<localleader>tc', ':-1read'..skelp..'skel.c<CR>G', { desc = "C template" })
map('n', '<localleader>tC', ':-1read'..skelp..'skel.cpp<CR>G', { desc = "C++ template" })
map('n', '<localleader>ts', ':-1read'..skelp..'skel.sh<CR>G', { desc = "Shell template" })
map('n', '<localleader>tl', ':-1read'..skelp..'skel.lua<CR>G', { desc = "Lua template" })
map('n', '<localleader>tm', ':-1read'..skelp..'skel.md<CR>G', { desc = "Markdown template" })
map('n', '<localleader>tg', ':-1read'..skelp..'skel.ms<CR>G', { desc = "Groff `ms` template" })
map('n', '<localleader>tp', ':-1read'..skelp..'skel.py<CR>G', { desc = "Python template" })
map('n', '<localleader>tt', ':-1read'..skelp..'skel.tex<CR>', { desc = "LaTeX template" })
map('n', '<localleader>tr', ':-1read'..skelp..'skel.rmd<CR>G', { desc = "R Markdown template" })
map('n', '<localleader>tM', ':-1read'..skelp..'skel.mk<CR>G', { desc = "Makefile template" })
map('n', '<localleader>th', ':-1read'..skelp..'skel.html<CR>G', { desc = "HTML template" })

-- Loremipsum
map('n', '<localleader>li1', ':read'..skelp..'loremipsum/lipsum001.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 01" })
map('n', '<localleader>li2', ':read'..skelp..'loremipsum/lipsum002.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 02" })
map('n', '<localleader>li3', ':read'..skelp..'loremipsum/lipsum003.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 03" })
map('n', '<localleader>li4', ':read'..skelp..'loremipsum/lipsum004.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 04" })
map('n', '<localleader>li5', ':read'..skelp..'loremipsum/lipsum005.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 05" })
map('n', '<localleader>li6', ':read'..skelp..'loremipsum/lipsum006.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 06" })
map('n', '<localleader>li7', ':read'..skelp..'loremipsum/lipsum007.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 07" })
map('n', '<localleader>li8', ':read'..skelp..'loremipsum/lipsum008.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 08" })
map('n', '<localleader>li9', ':read'..skelp..'loremipsum/lipsum009.txt<CR>G',
	{ desc = "Lorem Ipsum, Section 09" })
